import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pgc/constants/helper_class.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/service_model.dart';
import 'package:pgc/viewmodels/admin_service_upload_veiwmodel.dart';
import 'dart:io';

import 'package:pgc/views/home_screen.dart';

class AddNewServiceScreen extends StatefulWidget {
  const AddNewServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddNewServiceScreen> createState() => _AddNewServiceScreenState();
}

class _AddNewServiceScreenState extends State<AddNewServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  String _serviceName = '';
  String _serviceDescription = '';
  int _serviceFees = 0;
  final List<String> imagePaths = [];
  List<String> _imageUrls = [];
  final List<Uint8List> _imageFilesWeb = [];
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      String serviceIdentifier = HelperClass.generateRandomString();

      // Upload images to Firebase Storage
      if (kIsWeb) {
        _imageUrls = await AdminServiceViewModel()
            .uploadFilesWeb(_imageFilesWeb, _serviceName);
      } else {
        _imageUrls = await AdminServiceViewModel()
            .uploadImagesMobile(imagePaths, _serviceName);
      }

      // Create service model
      ServiceModel service = ServiceModel(
        serviceName: _serviceName,
        serviceDescription: _serviceDescription,
        serviceFees: _serviceFees,
        servicePhotos: _imageUrls,
        serviceId: serviceIdentifier,
      );

      // Check if imageUrls list is empty
      if (_imageUrls.isEmpty) {
        await Future.delayed(Duration(seconds: 5));
        if (_imageUrls.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('No Images'),
                content: Text('Failed to upload images. No images selected.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }

      // Upload service to Firestore
      await FirebaseFirestore.instance
          .collection('services')
          .doc(service.serviceName)
          .set(service.toJson());

      // Show success message or navigate to next screen
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 48,
            ),
            content: Text('Service upload successful'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Service", style: kSubHeadingTextStyle),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Service Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Service Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _serviceName = value!;
                },
              ),
              SizedBox(height: 16),
              // Service Description
              TextFormField(
                decoration: InputDecoration(labelText: 'Service Description'),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _serviceDescription = value!;
                },
              ),
              SizedBox(height: 16),
              // Service Fees
              TextFormField(
                decoration: InputDecoration(labelText: 'Service Fees'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter service fees';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _serviceFees = int.parse(value!);
                },
              ),
              SizedBox(height: 16),
              // Image Upload
              ElevatedButton(
                onPressed: () {
                  if (kIsWeb) {
                    AdminServiceViewModel()
                        .pickMultipleImagesWeb(context)
                        .then((value) {
                      setState(() {
                        _imageFilesWeb.addAll(value);
                      });
                    });
                  } else {
                    AdminServiceViewModel()
                        .pickMultipleImagesMobile(context)
                        .then((value) {
                      setState(() {
                        imagePaths.addAll(value.map((e) => e.path).toList());
                      });
                    });
                  }
                },
                child: Text('Add Photos'),
              ),
              SizedBox(height: 16),
              // Submit Button
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child:
                    _isLoading ? CircularProgressIndicator() : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

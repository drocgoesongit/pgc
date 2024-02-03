import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pgc/constants/text_const.dart';
import 'package:pgc/model/appointment_model.dart';
import 'package:pgc/viewmodels/appointment_viewmodel.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({super.key, required this.appointmentModel});
  final AppointmentModel appointmentModel;

  @override
  State<AppointmentDetailScreen> createState() =>
      _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  Future<String> getAppointmentDetails() async {
    try {
      return 'success';
    } catch (e) {
      log('Error: e');
      return 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Appointment', style: kSubHeadingTextStyle)),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: getAppointmentDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Column(
                          children: [
                            Text('Name: ${widget.appointmentModel.userId}'),
                            Text(
                                'Phone: ${widget.appointmentModel.feesStatus}'),
                            Text('Email: ${widget.appointmentModel.userId}'),
                            Text('Date: ${widget.appointmentModel.apptDate}'),
                            Text('Time: ${widget.appointmentModel.apptTime}'),
                            Text(
                                'Service: ${widget.appointmentModel.serviceId}'),
                            Text(
                                'Status: ${widget.appointmentModel.feesStatus}'),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Cancel Appointment'),
                                            content: Text(
                                                'Are you sure you want to cancel the appointment?'),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel')),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    String status =
                                                        await AppointmentViewModel()
                                                            .cancelAppointment(
                                                                widget
                                                                    .appointmentModel);
                                                    if (status == 'success') {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  'Appointment cancelled')));
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  'Error cancelling appointment')));
                                                    }
                                                  },
                                                  child: Text('Yes'))
                                            ],
                                          );
                                        });
                                  },
                                  child: Text('Cancel Appointment'),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Reschedule Appointment")),
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return Center(child: Text('No Data found'));
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Center(child: Text('Error'));
                  }
                })
          ]),
        ));
  }
}

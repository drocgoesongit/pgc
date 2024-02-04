import 'dart:developer';

import 'package:flutter/material.dart';

class BankOverviewScreen extends StatefulWidget {
  const BankOverviewScreen({super.key, required reserveName});

  @override
  State<BankOverviewScreen> createState() => _BankOverviewScreenState();
}

class _BankOverviewScreenState extends State<BankOverviewScreen> {
  Future<String> getBankDetailsForToday() async {
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
        appBar: AppBar(title: Text('Bank overview')),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
                future: getBankDetailsForToday(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text('Data');
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

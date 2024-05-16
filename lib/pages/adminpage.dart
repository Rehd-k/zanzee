// Suggested code may be subject to a license. Learn more: ~LicenseLog:3747723290.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1159151003.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/admin/all.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Page'),
        ),
        body: StreamBuilder(
            stream: _firestore.collection('orders').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List pending = [];
                List doing = [];
                List done = [];
                for (var element in snapshot.data!.docs) {
                  if (element['status'] == 'doing') {
                    doing.add(element);
                  } else if (element['status'] == 'done') {
                    done.add(element);
                  } else if (element['status'] == 'pending') {
                    pending.add(element);
                  } else {
                    continue;
                  }
                }
                return DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'All'),
                          Tab(text: 'New'),
                          Tab(text: 'Doing'),
                          Tab(text: 'Done')
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            //All view
                            buildTable(context, snapshot.data!.docs),
                            // New view
                            buildTable(context, pending),
                            // Doing view
                            buildTable(context, doing),
                            // Done view
                            buildTable(context, done)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3747723290.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1159151003.
import 'package:flutter/material.dart';

import '../components/admin/all.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Page'),
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'New'),
                  Tab(text: 'Done'),
                  Tab(text: 'Doing'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Users view
                    buildTable(),
                    // Products view
                    Container(),
                    // Orders view
                    Container(),
                    // Settings view
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

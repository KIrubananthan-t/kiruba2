import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API Matrix'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "Workspaces"),
              Tab(text: "Licenses"),
              Tab(text: "API Developer Portal"),
              Tab(text: "Permissions"),
              Tab(text: "Reports"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WorkspacesTab(),                // Custom widget for "Workspaces" tab
            Center(child: Text("Licenses")), // Placeholder for "Licenses" tab
            Center(child: Text("API Developer Portal")), // Placeholder
            Center(child: Text("Permissions")), // Placeholder
            Center(child: Text("Reports")),    // Placeholder
          ],
        ),
      ),
    );
  }
}

class WorkspacesTab extends StatelessWidget {
  const WorkspacesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // Removed Scaffold and replaced with Container
      color: const Color(0xFFF8F0F8), // Light pink background
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            constraints: const BoxConstraints(maxWidth: 400), // Narrower width for compact view
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // User Information
                const Icon(Icons.account_circle, size: 40, color: Colors.black),
                const SizedBox(height: 10),
                const Text(
                  "Ramachandar Madhimohan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Last signed in: 08/11/2024 04:32:46 PM",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Workspace Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Create Workspace"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: const InputDecoration(labelText: "Name"),
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(labelText: "Summary"),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("Permission", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ListTile(
                                    title: const Text("Personal"),
                                    leading: Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                                  ),
                                  ListTile(
                                    title: const Text("Team"),
                                    leading: Radio(value: 2, groupValue: 0, onChanged: (value) {}),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add create workspace logic here
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Create Workspace"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Create Workspace", style: TextStyle(fontSize: 14)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text("Import Workspace", style: TextStyle(fontSize: 14, color: Colors.blue)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Recently Visited Workspaces
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recently visited workspaces",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      WorkspaceItem(name: "Workspace A"),
                      WorkspaceItem(name: "Workspace B"),
                      WorkspaceItem(name: "Workspace C"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const Text(
                  'Copyright © 2023 NXT Platform. All Rights Reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkspaceItem extends StatelessWidget {
  final String name;

  const WorkspaceItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Export", style: TextStyle(color: Colors.blue))),
              TextButton(onPressed: () {}, child: const Text("Reports", style: TextStyle(color: Colors.blue))),
              TextButton(onPressed: () {}, child: const Text("Settings", style: TextStyle(color: Colors.blue))),
            ],
          ),
        ],
      ),
    );
  }
}

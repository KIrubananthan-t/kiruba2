import 'package:flutter/material.dart';
import 'login_page.dart'; // Import LoginPage only once here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue', // Set Helvetica Neue as the default font
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedMenu = "Workspaces"; // Track the selected menu item
  TextEditingController _searchController = TextEditingController(); // Controller for the search bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Matrix'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => Container(
            color: Colors.blue, // Set the background color of the hamburger button
            child: IconButton(
              icon: const Icon(Icons.menu), // Hamburger icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the left-side drawer
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              // This container holds the search TextField
              constraints: BoxConstraints(maxWidth: 400), // Maximum width to avoid overflow
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 4, 26, 48)),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color.fromARGB(255, 14, 7, 114),
                  fontSize: 24,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                setState(() {
                  _selectedMenu = 'Home';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('WorkSpace'),
              onTap: () {
                setState(() {
                  _selectedMenu = 'WorkSpace';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('API Developer Portal'),
              onTap: () {
                setState(() {
                  _selectedMenu = 'API Developer Portal';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Permissions'),
              onTap: () {
                setState(() {
                  _selectedMenu = 'Permissions';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Reports'),
              onTap: () {
                setState(() {
                  _selectedMenu = 'Reports';
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text('Settings'),
                    content: Text('Settings page (coming soon).'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _getSelectedWidget(),
    );
  }

  Widget _getSelectedWidget() {
    switch (_selectedMenu) {
      case 'Workspaces':
        return const WorkspacesTab();
      case 'Licenses':
        return const Center(child: Text("Licenses"));
      case 'API Developer Portal':
        return const Center(child: Text("API Developer Portal"));
      case 'Permissions':
        return const Center(child: Text("Permissions"));
      case 'Reports':
        return const Center(child: Text("Reports"));
      default:
        return const Center(child: Text("Select a menu item"));
    }
  }
}

class WorkspacesTab extends StatelessWidget {
  const WorkspacesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F0F8),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: 30.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxWidth: 400),
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
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'R',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Helvetica Neue',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Ramachandar Madhimohan",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Last signed in: 08/11/2024 04:32:46 PM",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Show the custom dialog when clicked
                                  showDialog(
                                    context: context,
                                    builder: (context) => const CreateWorkspaceDialog(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue,
                                ),
                                child: const Text(
                                  "Create Workspace",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Helvetica Neue',
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Import Workspace",
                                  style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Recently visited workspaces",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Helvetica Neue',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              WorkspaceItem(name: "Workspace A"),
                              WorkspaceItem(name: "Workspace B"),
                              WorkspaceItem(name: "Workspace C"),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Copyright © 2023 NXT Platform. All Rights Reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkspaceItem extends StatelessWidget {
  final String name;

  const WorkspaceItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (name == "Workspace A") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkspaceDetailsPage(),
            ),
          );
        }
      },
      child: Container(
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
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'Export') {
                  print('Export clicked for $name');
                } else if (value == 'Reports') {
                  print('Reports clicked for $name');
                } else if (value == 'Settings') {
                  print('Settings clicked for $name');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(value: 'Export', child: Text('Export')),
                  const PopupMenuItem<String>(value: 'Reports', child: Text('Reports')),
                  const PopupMenuItem<String>(value: 'Settings', child: Text('Settings')),
                ];
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkspaceDetailsPage extends StatelessWidget {
  const WorkspaceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspace Details'),
      ),
      body: const Center(child: Text("Details of the workspace")),
    );
  }
}

class CreateWorkspaceDialog extends StatefulWidget {
  const CreateWorkspaceDialog({super.key});

  @override
  _CreateWorkspaceDialogState createState() => _CreateWorkspaceDialogState();
}

class _CreateWorkspaceDialogState extends State<CreateWorkspaceDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  bool _isPersonal = false;
  bool _isTeam = false;

  // Function to check if fields are filled
  bool _isFormValid() {
    return _nameController.text.isNotEmpty && _summaryController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Workspace'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Workspace Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _summaryController,
              decoration: const InputDecoration(
                labelText: 'Summary',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            const Text('Permissions'),
            Row(
              children: [
                Checkbox(
                  value: _isPersonal,
                  onChanged: (bool? value) {
                    setState(() {
                      _isPersonal = value!;
                      if (_isPersonal) _isTeam = false; // Uncheck Team if Personal is selected
                    });
                  },
                ),
                const Text('Personal'),
                const SizedBox(width: 20),
                Checkbox(
                  value: _isTeam,
                  onChanged: (bool? value) {
                    setState(() {
                      _isTeam = value!;
                      if (_isTeam) _isPersonal = false; // Uncheck Personal if Team is selected
                    });
                  },
                ),
                const Text('Team'),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isFormValid()
              ? () {
                  // Handle the creation of the workspace
                  print('Workspace Created: ${_nameController.text}');
                  print('Summary: ${_summaryController.text}');
                  print('Permissions: Personal - $_isPersonal, Team - $_isTeam');
                  Navigator.of(context).pop();
                }
              : null, // Disable button if form is not valid
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text('Create Workspace'),
        ),
      ],
    );
  }
}

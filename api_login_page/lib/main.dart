import 'package:flutter/material.dart';
import 'login_page.dart';
import 'workspaces_tab.dart';
import 'workspace_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Matrix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedMenu = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Matrix'),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 241, 242, 243)),
              child: Text(
                'Menu',
                style: TextStyle(color: Color.fromARGB(255, 11, 5, 48), fontSize: 24),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerItem('Home'),
                  _buildDrawerItem('WorkSpace'),
                  _buildDrawerItem('API Developer Portal'),
                  _buildDrawerItem('Permissions'),
                  _buildDrawerItem('Reports'),
                  const Divider(),
                  _buildDrawerItem('Settings'),
                  _buildDrawerItem('Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _getSelectedPage(),
    );
  }

  Widget _buildDrawerItem(String title) {
    return InkWell(
      onTap: () {
        if (title == 'Logout') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else if (title == 'Settings') {
          Navigator.pop(context);
          _showSettingsDialog(context);
        } else {
          setState(() {
            _selectedMenu = title;
          });
          Navigator.of(context).pop();
        }
      },
      child: Container(
        color: _selectedMenu == title ? Colors.blue : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedMenu == title ? Colors.white : Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget _getSelectedPage() {
    switch (_selectedMenu) {
      case 'Home':
        return const WorkspacesTab();
      case 'WorkSpace':
        return const WorkspaceEdit(workspaceName: 'DefaultWorkspace');
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

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: const Text('Settings page (coming soon).'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

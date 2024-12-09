import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3PL To Inventory',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InventoryPage(),
    );
  }
}

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  bool showPrimaryKeys = false;
  bool showSecondaryKeys = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3PLToInventory (1.0)'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // User profile or settings
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to Home
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Projects'),
              onTap: () {
                // Navigate to Projects
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Collections'),
              onTap: () {
                // Navigate to Collections
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Publish Status and Overview
            Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Published'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Published on: 22/10/2024'),
                    Text('Published by: ramachandar@redcaso.com'),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Publish or Unpublish
                  },
                  child: Text('Publish'),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Developer Base URL
            ListTile(
              title: Text('Developer Base URL'),
              subtitle: Text('https://api.nxtplatform.io/100368/3PLToInventory'),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  // Copy URL to clipboard
                },
              ),
            ),
            SizedBox(height: 20),
            // API Keys Section with Expandable ListTiles
            Text(
              'Keys',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ExpansionTile(
              title: Text('Primary Keys'),
              children: [
                ListTile(
                  title: Text('Key'),
                  subtitle: Text('36c68372eb814f53a5a7928e8bef5394'),
                ),
                ListTile(
                  title: Text('Secret'),
                  subtitle: Text('e01824e3a5b6492db9375d19b5534030'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Download Primary Keys
                  },
                  child: Text('Download Keys'),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Secondary Keys'),
              children: [
                ListTile(
                  title: Text('Key'),
                  subtitle: Text('c1773938ff9049ff8c6dbb64ec76b969'),
                ),
                ListTile(
                  title: Text('Secret'),
                  subtitle: Text('ea066b118d3448248c03139b5536657f'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Download Secondary Keys
                  },
                  child: Text('Download Keys'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
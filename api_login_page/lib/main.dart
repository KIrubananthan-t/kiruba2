import 'package:flutter/material.dart';
import 'login_page.dart';
import 'workspaces_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

// Define the main tabbed interface for after successful login
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSearching ? MediaQuery.of(context).size.width * 0.7 : 200,
            child: isSearching
                ? TextField(
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.black54),
                      prefixIcon: const Icon(Icons.search, color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                  )
                : const Text('API Matrix'),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(isSearching ? Icons.close : Icons.search),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear(); // Clear search field when closing
                  }
                });
              },
            ),
          ],
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

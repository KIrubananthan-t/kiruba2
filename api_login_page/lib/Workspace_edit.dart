import 'package:flutter/material.dart';

class WorkspaceEdit extends StatefulWidget {
  final String workspaceName;

  const WorkspaceEdit({Key? key, required this.workspaceName}) : super(key: key);

  @override
  State<WorkspaceEdit> createState() => _WorkspaceEditState();
}

class _WorkspaceEditState extends State<WorkspaceEdit> {
  bool _isSearchExpanded = false;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workspaceName),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              // Left Sidebar (Expanded to 50% width when search is active)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isSearchExpanded ? MediaQuery.of(context).size.width * 0.5 : 0,
                color: const Color.fromARGB(255, 240, 240, 240),
                child: _isSearchExpanded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Workspace Name',
                                      border: const OutlineInputBorder(),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: () {
                                          // Handle search action
                                          print("Searching for: $_searchQuery");
                                        },
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      _isSearchExpanded = false;
                                      _searchQuery = "";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Workspace List
                          Expanded(
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                final workspaceName = "workspace${index + 1}";
                                if (_searchQuery.isEmpty || workspaceName.contains(_searchQuery)) {
                                  return ListTile(
                                    title: Text(workspaceName),
                                    leading: const Icon(Icons.folder),
                                    onTap: () {
                                      // Handle workspace selection
                                    },
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
              // Main Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tab Bar
                    Container(
                      color: Colors.blue,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Overview',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Workspace Details
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.workspaceName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text("About: test"),
                            const Divider(),
                            const Text(
                              "Recent activities",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      child: const Text('W'),
                                      backgroundColor: Colors.blue,
                                    ),
                                    title: const Text("workspace12c / w12cpro1"),
                                    subtitle: Text("Activity ${index + 1}"),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Floating Action Button
          Positioned(
            top: 16,
            right: 16,
            child: !_isSearchExpanded
                ? FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _isSearchExpanded = true;
                      });
                    },
                    child: const Icon(Icons.search),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

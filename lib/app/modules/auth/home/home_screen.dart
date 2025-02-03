import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:adstacks/app/modules/auth/home/sidebar_menu.dart';
import 'package:adstacks/app/modules/auth/home/project_card.dart';
import 'package:adstacks/app/modules/auth/home/creator_card.dart'; // Assuming you have a CreatorCard widget
import 'package:adstacks/app/modules/auth/home/overall_performance.dart'; // Assuming you have a CreatorCard widget

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {"title": "Technology Behind Blockchain", "description": "Project #1", "color": Colors.redAccent},
    {"title": "AI-Powered Chatbots", "description": "Project #2", "color": Colors.blueAccent},
    {"title": "E-Commerce App", "description": "Project #3", "color": Colors.greenAccent},
  ];

  final List<Map<String, dynamic>> topCreators = [
    {"name": "John Doe", "artworks": "50", "rating": "4.5"},
    {"name": "Jane Smith", "artworks": "40", "rating": "4.7"},
    {"name": "Emily Clark", "artworks": "30", "rating": "4.6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Custom background color for home
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.deepPurple, // App bar color
      ),
      drawer: SidebarMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // All Projects Section
            Text(
              "All Projects",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 148,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    title: projects[index]["title"]!,
                    description: projects[index]["description"]!,
                    backgroundColor: projects[index]["color"]!,
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Space between sections

            // Top Creators Section
            Text(
              "Top Creators",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 50),
                      Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 90),
                      Text("Artworks", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 50),
                      Text("Rating", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Divider(height: 8),
                  // ListView.builder without Expanded
                  ListView.builder(
                    shrinkWrap: true, // Allow the list to shrink to its content size
                    physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside the list
                    itemCount: topCreators.length,
                    itemBuilder: (context, index) {
                      return CreatorCard(
                        name: topCreators[index]["name"]!,
                        artworks: topCreators[index]["artworks"]!,
                        rating: topCreators[index]["rating"]!,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Space before Overall Performance
            OverallPerformance(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to General Screen
                context.go('/general');
              },
              child: Text("Go to General Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

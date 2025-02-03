import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Center(child: Text("AdStacks"))),
          UserAccountsDrawerHeader(
            accountName: const Text("Pooja Mishra"),
            accountEmail: const Text("Admin"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            decoration: const BoxDecoration(color: Color(0xFFDFDDDD)),
          ),
          _buildDrawerItem(context, Icons.home, "Home", "/home"),
          _buildDrawerItem(context, Icons.group, "Employees", "/employees"),
          _buildDrawerItem(context, Icons.check, "Attendance", "/attendance"),
          _buildDrawerItem(context, Icons.calendar_month, "Summary", "/summary"), // Updated Route
          _buildDrawerItem(context, Icons.info, "Information", "/informations"),
          _buildDrawerItem(context, Icons.settings, "Settings", "/settings"),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              context.go('/login'); // Redirect to login
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        context.go(route); // Use go_router instead of Navigator
      },
    );
  }
}


// import 'package:flutter/material.dart';

// class SidebarMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             title: Center(
//               child: Text("AdStacks")),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: UserAccountsDrawerHeader(
//               accountName: Text("Pooja Mishra"),
//               accountEmail: Text("Admin"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage("assets/profile.png"),
//               ),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 223, 221, 221), // You can change the background color here if needed
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Home"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.group),
//             title: Text("Employees"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer before navigating
//               Navigator.pushNamed(context, "/employees");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.check),
//             title: Text("Attendance"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer before navigating
//               Navigator.pushNamed(context, "/attendance");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.calendar_month),
//             title: Text("Summary"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer before navigating
//               Navigator.pushNamed(context, "/Summary");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.info),
//             title: Text("Information"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer before navigating
//               Navigator.pushNamed(context, "/informations");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text("Settings"),
//             onTap: () {
//               Navigator.pop(context); // Close the drawer before navigating
//               Navigator.pushNamed(context, "/settings");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Text("Logout"),
//             onTap: () {
//               // Handle logout logic here
//               Navigator.pop(context); // Close the drawer
//               Navigator.pushReplacementNamed(context, '/login'); // Redirect to login
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

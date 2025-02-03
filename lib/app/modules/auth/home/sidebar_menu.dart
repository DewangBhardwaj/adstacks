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
          _buildDrawerItem(context, Icons.calendar_month, "Summary", "/summary"),
          _buildDrawerItem(context, Icons.info, "Information", "/informations"),
          _buildDrawerItem(context, Icons.settings, "Settings", "/settings"),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              context.go('/login'); 
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
        context.go(route);
      },
    );
  }
}

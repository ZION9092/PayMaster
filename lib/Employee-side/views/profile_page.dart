import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
  expandedHeight: 120.0,
  floating: false,
  pinned: true,
  backgroundColor: Colors.black,
  flexibleSpace: LayoutBuilder(
    builder: (context, constraints) {
      double percentage = (constraints.biggest.height - kToolbarHeight) /
          (120.0 - kToolbarHeight);

      return FlexibleSpaceBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            color: percentage < 0.5 ? AppColors.primaryGreen : AppColors.black,
          ),
        ),
        background: Container(
          color: percentage < 0.5 ? Colors.black : AppColors.primaryGreen,
        ),
        centerTitle: false,
      );
    },
  ),
),
SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/profile_placeholder.png"), // Replace with actual image
                      ),
                      SizedBox(height: 10),
                      Text("John Doe", style: TextStyle(fontSize: 20, color: AppColors.primaryGreen,fontWeight: FontWeight.w700)),
                      Text("Software Engineer", style: TextStyle(color: AppColors.silver)),

                      SizedBox(height: 20),
                      _buildProfileTile(Icons.email, "Email", "johndoe@example.com"),
                      _buildProfileTile(Icons.phone, "Phone", "+123 456 7890"),
                      _buildProfileTile(Icons.location_on, "Address", "New York, USA"),
                      _buildProfileTile(Icons.calendar_today, "Joining Date", "March 2022"),

                      SizedBox(height: 20),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Future: Implement Edit Profile functionality
                        },
                        icon: Icon(Icons.edit, color: AppColors.primaryGreen,),
                        label: Text("Edit Profile",
                        style: TextStyle(color: AppColors.primaryGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryGreen),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryGreen)),
      subtitle: Text(value),
    );
  }
}

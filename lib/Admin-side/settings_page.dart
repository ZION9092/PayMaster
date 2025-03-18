import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SettingsSection(title: "General", children: const [
            SettingsTile(title: "Company Name", trailing: Icon(Icons.edit)),
            SettingsTile(title: "Change Password", trailing: Icon(Icons.lock)),
          ]),
          SettingsSection(title: "Payroll", children: const [
            SettingsTile(title: "Payment Cycle", trailing: Text("Monthly")),
            SettingsTile(title: "Tax & Deductions", trailing: Icon(Icons.tune)),
          ]),
          SettingsSection(title: "Payment Methods", children: const [
            SettingsTile(title: "Bank Account", trailing: Icon(Icons.account_balance)),
            SettingsTile(title: "Mobile Payment", trailing: Icon(Icons.phone_android)),
          ]),
          SettingsSection(title: "Security", children: [
            SettingsTile(title: "Two-Factor Authentication", trailing: Switch(value: true, onChanged: (v) {})),
            SettingsTile(title: "Role-Based Access", trailing: Icon(Icons.admin_panel_settings)),
          ]),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Card(
          child: Column(children: children),
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingsTile({super.key, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: trailing,
      onTap: () {},
    );
  }
}

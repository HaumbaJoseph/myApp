import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SettingScreen(),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  ThemeMode _themeMode = ThemeMode.system;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Theme Mode'),
            subtitle: Text(_themeMode == ThemeMode.system
                ? 'System Default'
                : _themeMode == ThemeMode.light
                    ? 'Light Mode'
                    : 'Dark Mode'),
            onTap: () {
              _showThemeDialog();
            },
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text(_selectedLanguage),
            onTap: () {
              _showLanguageDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('System Default'),
                value: ThemeMode.system,
                groupValue: _themeMode,
                onChanged: (ThemeMode? value) {
                  setState(() {
                    _themeMode = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: _themeMode,
                onChanged: (ThemeMode? value) {
                  setState(() {
                    _themeMode = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: _themeMode,
                onChanged: (ThemeMode? value) {
                  setState(() {
                    _themeMode = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('English'),
                value: 'English',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Spanish'),
                value: 'Spanish',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: const GradientScaffold(),
    );
  }
}

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MY PORTFOLIO WEBSITE",
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold ),
        ),
        centerTitle: true,
        elevation: 20,
        shadowColor: Colors.black,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueGrey,
                Colors.blueGrey,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey,
              Colors.black,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('assets/Screenshot 2025-08-17 235650.png'), 
                  ),
                  const SizedBox(height: 24),
              
              
                  const Text(
                    "HANIEF",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Flutter Developer",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
                  ),
                  const SizedBox(height: 24),
                 
                 
                  const Text(
                    "I am a passionate Flutter developer with experience in building beautiful and functional mobile/web apps."
                    "I'm always eager to learn new technologies and take on challenging projects.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const Divider(height: 48, thickness: 2),
          
          
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  
                  ProjectCard(
                    title: "Awesome App",
                    description: "A mobile app that helps users achieve their goals.",
                    url: "https://github.com/haniefpro/awesome-app",
                  ),

                  ProjectCard(
                    title: "Portfolio Website",
                    description: "My personal portfolio built using Flutter.",
                    url: "https://github.com/haniefpro/portfolio-flutter",
                  ),

                  const Divider(height: 48, thickness: 2),
                  
                  
                  const Text(
                    "Contact:",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    
                  ),
                  const SizedBox(height: 12),
                  ContactTile(
                    icon: Icons.email,
                    label: "hanifabdulrahman332@gmail.com",
                    onTap: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'hanifabdulrahman332@gmail.com',
                      );
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      }
                    }
                  ),
                  ContactTile( 
                    icon: Icons.code,
                    label: "GitHub",
                    subLabel: "github.com/HaniefPro",
                    onTap: () async {
                      final Uri uri = Uri.parse("https://github.com/HaniefPro");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                  ContactTile(
                    icon: Icons.facebook,
                    label: "Facebook",
                    subLabel: "facebook.com/HaniefPro",
                    onTap: () async {
                      final Uri uri = Uri.parse("https://web.facebook.com/profile.php?id=100090223222229");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                  ),

                  ContactTile(
                    icon: Icons.phone,
                    label: "Contact Me",
                    subLabel: "+234 8136282307",
                    onTap: () {},
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[900],
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.open_in_new, color: Colors.lightBlueAccent),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Open $url in browser')),
          );
        },
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subLabel;
  final VoidCallback? onTap;

  const ContactTile({
    super.key,
    required this.icon,
    required this.label,
    this.subLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlueAccent),
      title: Text(label),
      subtitle: subLabel != null ? Text(subLabel!) : null,
      onTap: onTap,
    );
  }
}
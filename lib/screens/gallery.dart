import 'package:cosmos_companion/screens/planetpage.dart';
import 'package:cosmos_companion/screens/projectspage.dart';
import 'package:cosmos_companion/screens/welcomepage.dart';
import 'package:flutter/material.dart';
import '../admin/user_read.dart';
import 'aboutus.dart';
import 'contactus.dart';
import 'favoritepage.dart';
import 'gallery.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<String> _imageUrls = [
    "https://i.ibb.co/KmR4ghK/image-16-1-1.png",
    "https://i.ibb.co/pWb95wD/2151075901-1.jpg",
    "https://i.ibb.co/HGzF6qZ/astronaut-diving-digital-art-1.jpg",
    "https://i.ibb.co/styNbM7/2150953671.jpg",
    "https://i.ibb.co/89yy8fx/16814.jpg",
    "https://i.ibb.co/pWb95wD/2151075901-1.jpg",
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/welcome_page_img.png'),
                  // Replace 'assets/your_image_name.png' with your local asset path
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('Cosmos Companion',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the HomeScreen
                // Make sure you have a HomeScreen class defined to navigate to
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => FavoritesPage(favorites: [],)));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('Explore'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the ExploreScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlanetsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Projects'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the ProjectsScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProjectsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Updates'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the UpdatesScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserReadData()));
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the GalleryScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GalleryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the AboutUsScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the ContactUsScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background_image.jpg'),
            // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          itemCount: _imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(imageUrl: _imageUrls[index]),
                  ),
                );
              },
              child: Hero(
                tag: _imageUrls[index],
                child: Image.network(
                  _imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageUrl;

  DetailPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: SingleChildScrollView(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover, // Ensure the image fits the screen
            ),
          ),
        ),
      ),
    );
  }
}

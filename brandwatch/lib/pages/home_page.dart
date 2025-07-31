import 'package:flutter/material.dart';
import 'package:brandwatch/widgets/product_card.dart';
import 'package:brandwatch/widgets/sidebar.dart';
import 'package:brandwatch/widgets/category_chip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _drawerController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> categories = ['All', 'Watches', 'Headphones', 'Smart', 'Classic'];
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Luxury Chrono',
      'price': 349.99,
      'image': 'assets/images/watch1.jpg',
      'type': 'Watches',
      'rating': 4.8,
    },
    {
      'name': 'Noise Canceling Pro',
      'price': 299.99,
      'image': 'assets/images/watch2.jpg',
      'type': 'Headphones',
      'rating': 4.6,
    },
    {
      'name': 'Smart Elite',
      'price': 199.99,
      'image': 'assets/images/watch3.jpg',
      'type': 'Watches',
      'rating': 4.5,
    },
    // {
    //   'name': 'Wireless Freedom',
    //   'price': 179.99,
    //   'image': 'assets/headphones2.png',
    //   'type': 'Headphones',
    //   'rating': 4.3,
    // },
    // {
    //   'name': 'Classic Leather',
    //   'price': 249.99,
    //   'image': 'assets/images/watch3.jpg',
    //   'type': 'Watches',
    //   'rating': 4.7,
    // },
    // {
    //   'name': 'Bass Boosters',
    //   'price': 159.99,
    //   'image': 'assets/headphones3.png',
    //   'type': 'Headphones',
    //   'rating': 4.4,
    // },
  ];

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') return products;
    return products.where((product) => product['type'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Sidebar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 180,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Luxury Wear',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Hero(
                      tag: 'logo',
                      child: Icon(
                        Icons.headphones,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _toggleDrawer,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      label: categories[index],
                      isSelected: selectedCategory == categories[index],
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      name: filteredProducts[index]['name'],
                      price: filteredProducts[index]['price'],
                      image: filteredProducts[index]['image'],
                      rating: filteredProducts[index]['rating'],
                      onTap: () {
                        // Product detail would go here
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
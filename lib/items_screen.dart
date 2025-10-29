import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_task/item_model.dart';
import 'package:logo_task/items_data.dart';

import 'item_card.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<ItemModel> items = [];
  static const Color amber = Color.fromRGBO(255, 194, 104, 1);
  
  @override
  void initState() {
    super.initState();
    ItemsData.readDataFromJson().then((data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600 ? 1 : width < 800 ? 2 : width < 1000 ? 3 : width < 1200 ? 4 : 5;
    double childAspect = width < 800 ? 1.2 : width < 1000 ? 1.25 : width < 1200 ? 1.05 : 0.8;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if(width < 800)
                        ...[
                          Icon(Icons.menu, color: Colors.white, size: 28),
                          SizedBox(width: width * 0.05),
                        ],
                        Image.asset('assets/logo.png', fit: BoxFit.contain),
                      ],
                    ),
                    if(width > 800)
                    ...[Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TabBar(
                          isScrollable: true,
                          indicatorColor: amber,
                          dividerHeight: 0,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
                          labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                          unselectedLabelStyle: GoogleFonts.inter(fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)),
                          tabs: const [
                            Tab(child: Text('Items')),
                            Tab(child: Text('Pricing')),
                            Tab(child: Text('Info')),
                            Tab(child: Text('Tasks')),
                            Tab(child: Text('Analytics')),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: const Color.fromRGBO(72, 72, 72, 1),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),],
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined),
                          color: Colors.white,
                        ),
                        Container(
                          width: 1,
                          height: 28,
                          color: const Color.fromRGBO(72, 72, 72, 1),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        const SizedBox(width: 12),
                        const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/avatar3.png')),
                        if(width > 800)
                        ...[
                          const SizedBox(width: 12),
                          Text('John Doe', style: GoogleFonts.inter(fontSize: 14, color: Colors.white)),
                          IconButton(icon: Icon(Icons.keyboard_arrow_down, color: Colors.white), onPressed: () {}),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Container(height: 0.5, width: width, color: Color.fromRGBO(72, 72, 72, 1)),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.tune_outlined),
                            onPressed: () {},
                          ),
                        ),
                        if(width > 800)
                        ...[const SizedBox(width: 14),
                        Container(
                          height: 46,
                          width: 0.5,
                          color: Color.fromRGBO(72, 72, 72, 1),
                        ),
                        const SizedBox(width: 14),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.black),
                          label: Text(
                            'Add a New Item',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: amber,
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspect,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ItemCard(
                        item: item,
                        isMobile: width < 800,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
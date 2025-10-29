import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_task/item_model.dart';

import 'item_card.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<ItemModel> items = [
    ItemModel(
      id: "1",
      status: "Proposal Sent",
      title: "Banff National Park Adventure",
      coverImg: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Emily Clarke", img: "https://randomuser.me/photos/1.jpg"),
        Participant(name: "Nina Müller", img: "https://randomuser.me/photos/5.jpg"),
        Participant(name: "Sofia Rossi", img: "https://randomuser.me/photos/6.jpg"),
        Participant(name: "Elena Petrova", img: "https://randomuser.me/photos/21.jpg"),
        Participant(name: "Lars Jensen", img: "https://randomuser.me/photos/22.jpg"),
      ],
    ),
    ItemModel(
      id: "2",
      status: "Pending Approval",
      title: "Santorini Dream Escape",
      coverImg: "https://images.unsplash.com/photo-1465156799763-2c087c332922?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Lucas Martinez", img: "https://randomuser.me/photos/2.jpg"),
        Participant(name: "Chloe Dubois", img: "https://randomuser.me/photos/3.jpg"),
        Participant(name: "Olivia Smith", img: "https://randomuser.me/photos/9.jpg"),
        Participant(name: "Daniel Kim", img: "https://randomuser.me/photos/10.jpg"),
      ],
    ),
    ItemModel(
      id: "3",
      status: "Ready for travel",
      title: "Maldives Island Retreat",
      coverImg: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Liam Wong", img: "https://randomuser.me/photos/4.jpg"),
      ],
    ),
    ItemModel(
      id: "4",
      status: "Proposal Sent",
      title: "Paris Getaway",
      coverImg: "https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Amélie Laurent", img: "https://randomuser.me/photos/7.jpg"),
        Participant(name: "Mateo Alvarez", img: "https://randomuser.me/photos/8.jpg"),
      ],
    ),
    ItemModel(
      id: "5",
      status: "Pending Approval",
      title: "Venice Canal Experience",
      coverImg: "https://images.unsplash.com/photo-1444065381814-865dc9da92c0?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Isabella Greco", img: "https://randomuser.me/photos/11.jpg"),
        Participant(name: "David Johnson", img: "https://randomuser.me/photos/12.jpg"),
        Participant(name: "Mei Chen", img: "https://randomuser.me/photos/13.jpg"),
        Participant(name: "Hannah Becker", img: "https://randomuser.me/photos/14.jpg"),
        Participant(name: "Akira Sato", img: "https://randomuser.me/photos/15.jpg"),
      ],
    ),
    ItemModel(
      id: "6",
      status: "Ready for travel",
      title: "Tokyo City Lights Tour",
      coverImg: "https://images.unsplash.com/photo-1462129487128-340e6b021fd7?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "Haruto Tanaka", img: "https://randomuser.me/photos/16.jpg"),
        Participant(name: "Maria Ivanova", img: "https://randomuser.me/photos/17.jpg"),
        Participant(name: "Lucas Brown", img: "https://randomuser.me/photos/18.jpg"),
        Participant(name: "Saanvi Patel", img: "https://randomuser.me/photos/19.jpg"),
        Participant(name: "William Wilson", img: "https://randomuser.me/photos/20.jpg"),
      ],
    ),
    ItemModel(
      id: "7",
      status: "Pending Approval",
      title: "New York Urban Adventure",
      coverImg: "https://images.unsplash.com/photo-1454023492550-5696f8ff10e1?auto=format&fit=crop&w=800&q=80",
      tasks: "4",
      dates: TripDates(start: "16-01-2024", end: "20-01-2024"),
      participants: [
        Participant(name: "James Anderson", img: "https://randomuser.me/photos/23.jpg"),
        Participant(name: "Sophia Lee", img: "https://randomuser.me/photos/24.jpg"),
        Participant(name: "Noah Davis", img: "https://randomuser.me/photos/25.jpg"),
      ],
    ),
  ];
  static const Color amber = Color.fromRGBO(255, 194, 104, 1);

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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_task/view_model/cubit/items_cubit.dart';

import 'item_card.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;
    const Color amber = Color.fromRGBO(255, 194, 104, 1);
    return BlocProvider(
      create: (context) => ItemsCubit()..loadData(),
      child: DefaultTabController(
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
                          if (isMobile) ...[
                            Icon(Icons.menu, color: Colors.white, size: 28),
                            SizedBox(width: width * 0.05),
                          ],
                          Image.asset('assets/images/logo.png', fit: BoxFit.contain),
                        ],
                      ),
                      if (!isMobile) ...[
                        Expanded(
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
                        ),
                      ],
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
                          const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/images/avatar3.png')),
                          if (!isMobile) ...[
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
                          if (!isMobile) ...[
                            const SizedBox(width: 14),
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: BlocBuilder<ItemsCubit, ItemsState>(
                      builder: (context, state) {
                        if(state is ItemsLoaded) {
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: width < 600 ? 1 : width < 800 ? 2 : width < 1000 ? 3 : width < 1200 ? 4 : 5,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: width < 600 ? 1.2 : width < 800 ? 0.7 : width < 1000 ? 1.05 : width < 1200 ? 0.9 : 0.75,
                            ),
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              final item = state.items[index];
                              return ItemCard(item: item, isMobile: isMobile);
                            },
                          );
                        } else if(state is ItemsError) {
                          return Center(child: Text(state.message, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_task/model/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final bool isMobile;
  
  const ItemCard({super.key, required this.item, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromRGBO(38, 38, 38, 1), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: isMobile ? (MediaQuery.sizeOf(context).width * 0.9 * 0.75 * 0.65) : ((MediaQuery.sizeOf(context).width * 0.9 - 64) / 5) * 0.8,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.coverImg,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
                        );
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color.fromRGBO(38, 38, 38, 1),
                          const Color.fromRGBO(38, 38, 38, 1),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.15, 0.25],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: getStatusColor().withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: getStatusColor(), width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.status,
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        if(item.status != 'Ready for travel')
                        const SizedBox(width: 2),
                        if(item.status != 'Ready for travel')
                        Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.more_horiz, color: Colors.white, size: 18)),
                  ),
                ),
              ],
            ),
          ),
          
          // Content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      item.title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.date,
                            style: TextStyle(color: Colors.grey[400], fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(height: 0.5, width: double.infinity, color: Color.fromRGBO(72, 72, 72, 1)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 24,
                            child: Stack(
                              children: [
                                for (int i = 0; i < item.participants.length && i < 4; i++)
                                  Positioned(
                                    left: (16 * i).toDouble(),
                                    child: i == 3 && item.participants.length > 3 ? Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(38, 38, 38, 1),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFF1E1E1E), width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+${item.participants.length - 3}',
                                          style: const TextStyle(color: Color.fromRGBO(255, 194, 104, 1), fontSize: 8, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ) : 
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color(0xFF1E1E1E), width: 2),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          item.participants[i].img,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Icon(Icons.person_2_outlined, size: 16, color: Colors.white);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${item.tasks} unfinished tasks',
                              style: TextStyle(color: Colors.grey[400], fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor() {
    switch(item.status) {
      case 'Proposal Sent':
        return Color.fromRGBO(255, 194, 104, 1);
      case 'Pending Approval':
        return Color.fromRGBO(194, 95, 48, 1);
      case 'Ready for travel':
        return Color.fromRGBO(51, 191, 237, 1);
      default:
        return Color.fromRGBO(194, 95, 48, 1);
    }
  }
}
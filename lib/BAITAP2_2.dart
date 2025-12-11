import 'package:flutter/material.dart';

class BAITAP2_2 extends StatelessWidget {
  const BAITAP2_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Navigation Bar (Blue)
          topNavigationBar(),
          SizedBox(height: 20),
          // Filter/Sort Bar
          filterSortBar(),
          // Result count
          resultCount(),
          // Accommodation Listings
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return accommodationCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget topNavigationBar() {
    return Container(
      color: Colors.blue,
      height: 55,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Transform.translate(
        offset: Offset(0, 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange, width: 2),
          ),

          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {},
              ),
              Expanded(
                child: Text(
                  'Xung quanh vị trí hiện tại',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '23 thg 10 – 24 thg 10',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterSortBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFilterButton(Icons.swap_vert, 'Sắp xếp'),
          _buildFilterButton(Icons.tune, 'Lọc'),
          _buildFilterButton(Icons.map, 'Bản đồ'),
        ],
      ),
    );
  }

  Widget _buildFilterButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: Colors.black87, fontSize: 15)),
        ],
      ),
    );
  }

  Widget resultCount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '757 chỗ nghỉ',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget accommodationCard(int index) {
    List<String> images = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
    ];

    List<String> names = [
      'aNhill Boutique',
      'An Nam Hue Boutique',
      'Huế Jade Hill Villa',
      'Êm Villa',
    ];

    List<String> locations = [
      'Huế · Cách bạn 0,6km',
      'Cư Chinh · Cách bạn 0,9km',
      'Cư Chinh · Cách bạn 1,3km',
      'Cư Chinh · Cách bạn 1,2km',
    ];

    List<String> scores = [
      '9,5 Xuất sắc - 95 đánh giá',
      '9,2 Tuyệt hảo - 34 đánh giá',
      '8,0 Rất tốt - 1 đánh giá',
      '8,5 Rất tốt - 12 đánh giá',
    ];

    List<String> rooms = [
      '1 suite riêng tư: 1 giường',
      '1 phòng khách sạn: 1 giường',
      '1 biệt thự nguyên căn – 1.000 m²: 4 giường · 3 phòng ngủ',
      '1 villa riêng tư: 2 giường · 2 phòng ngủ',
    ];

    List<String> prices = ['US\$109', 'US\$20', 'US\$285', 'US\$150'];

    List<int> starRatings = [5, 4, 4, 5];

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on left
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ),
                // Breakfast tag
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Bao bữa sáng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Details on right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        iconSize: 24,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Stars
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < starRatings[index] ? Icons.star : Icons.star_border,
                        size: 14,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Score
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      scores[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      Flexible(
                        child: Text(
                          locations[index],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Room details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        rooms[index],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                prices[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Đã bao gồm thuế và phí',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

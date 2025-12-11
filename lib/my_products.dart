import 'package:flutter/material.dart';
import 'package:hoctap1/api.dart';
import 'package:hoctap1/model/product.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  late Future<List<Product>> listProduct;
  List<Product> _filteredProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _isLoading = true;
    });
    var api = API();
    listProduct = api.getAllProducts();
    listProduct.then((products) {
      setState(() {
        _filteredProducts = products;
        _isLoading = false;
      });
    });
  }

  String _formatCategory(String category) {
    return category.toUpperCase().replaceAll("'", "'");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<Product>>(
        future: listProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              _isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final products = snapshot.data ?? [];
          if (_filteredProducts.isEmpty && products.isNotEmpty) {
            _filteredProducts = products;
          }

          return Column(
            children: [
              _buildFilterSortBar(),
              Expanded(child: _buildProductGrid(_filteredProducts)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterSortBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Filter functionality
              },
              icon: Icon(Icons.tune, size: 18),
              label: Text('Filter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 0,
                side: BorderSide(color: Colors.grey[300]!),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Sort functionality
              },
              icon: Icon(Icons.swap_vert, size: 18),
              label: Text('Sort'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 0,
                side: BorderSide(color: Colors.grey[300]!),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Tính toán số cột dựa trên chiều rộng màn hình
        // Mỗi card cần khoảng 160-180px (bao gồm padding và spacing)
        final screenWidth = constraints.maxWidth;
        final padding = 12.0 * 2; // padding trái và phải
        final spacing = 12.0; // khoảng cách giữa các card
        final minCardWidth = 160.0; // chiều rộng tối thiểu của mỗi card

        // Tính số cột có thể chứa được
        int crossAxisCount =
            ((screenWidth - padding) / (minCardWidth + spacing)).floor();

        // Đảm bảo có ít nhất 2 cột và tối đa 4 cột
        crossAxisCount = crossAxisCount.clamp(2, 4);

        // Điều chỉnh childAspectRatio dựa trên số cột
        double childAspectRatio = 0.65;
        if (crossAxisCount >= 3) {
          childAspectRatio = 0.7;
        }
        if (crossAxisCount >= 4) {
          childAspectRatio = 0.75;
        }

        return GridView.builder(
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(products[index]);
          },
        );
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with Category Label
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[600]!, Colors.purple[800]!],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _formatCategory(product.category),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Title
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  // Price Label
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Price and Rating Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price Value
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B46C1), // Purple/blue color
                        ),
                      ),
                      // Rating Section (Right) with border and yellow background
                      if (product.rating != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber[50],
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[700],
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '${product.rating!.rate.toStringAsFixed(1)}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                '(${product.rating!.count})',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber[50],
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              SizedBox(width: 4),
                              Text(
                                'N/A',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

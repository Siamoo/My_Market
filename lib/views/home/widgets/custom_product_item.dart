import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/home/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.sale,
    required this.productName,
    required this.productCount,
    required this.pastCount,
  });

  final double screenWidth;
  final double screenHeight;
  final int sale;
  final String productName;
  final int productCount;
  final int pastCount;
  final String imageUrl = 'assets/images/product.jpg';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomImage(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.22,
                  imageUrl: 'assets/images/product.jpg',
                ),
                Positioned(
                  top:
                      (screenHeight *
                      0.00001), // 10% of image height above the image
                  left: .005, // adjust as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      '$sale% Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: AppColors.kPrimaryColor,
                ),
                SizedBox(width: 8),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '$productCount LE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ...inside your Column in the Row...
                    Text(
                      '$pastCount LE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration
                            .lineThrough, // <-- this adds the line
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'buy now',
                    style: TextStyle(color: AppColors.kWhiteColor),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

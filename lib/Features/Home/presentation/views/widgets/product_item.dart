// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/product_details_screen.dart';
// import 'package:shimmer/shimmer.dart';
//
//
// class ProductItem extends StatelessWidget {
//   const ProductItem({super.key, required this.name, required this.description, required this.price, required this.id, required this.isFavorite, required this.image,});
//
//   final String image;
//   final String name;
//   final String description;
//   final double price;
//   final int id;
//   final bool isFavorite;
//   final baseUrlImages= "https://adminhandora.runasp.net";
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//
//     return InkWell(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productId: id),));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.5), // Shadow color
//               spreadRadius: 1, // Spread of the shadow
//               blurRadius: 5, // Softness of the shadow
//               offset: const Offset(2, 2), // Shadow position
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: CachedNetworkImage(
//                       imageUrl: "$baseUrlImages$image",
//                       fit: BoxFit.cover,
//                       height: height * 0.2, // Adjust height
//                       width: double.infinity, // Full width
//                       placeholder: (context, url) => Shimmer.fromColors(
//                         baseColor: Colors.grey[700]!,
//                         highlightColor: Colors.grey[500]!,
//                         child: Container(
//                           height: height * 0.2,
//                           width: double.infinity,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       errorWidget: (context, url, error) =>
//                       const Icon(Icons.error),
//                     ),
//                   ),
//                   Positioned(
//                     top: 4.0,
//                     right: 4.0,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey.shade600, // 🔵 Your custom color
//                       radius: 24, // You can adjust size as needed
//                       child: IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.favorite, color: Colors.red,size: 28,), // Contrast color
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: height * 0.01),
//               Text(name,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: height * 0.01),
//               Text(description,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: height * 0.01),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${price.toStringAsFixed(2) ?? "0.00"} E£",
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.shopping_cart,
//                       size: 32,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/presentation/view_manger/product_cubit/product_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.id,
    required this.isFavorite,
    required this.image,
  });

  final String image;
  final String name;
  final String description;
  final double price;
  final int id;
  final bool isFavorite;
  final String baseUrlImages = "https://adminhandora.runasp.net";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(productId: id),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 5, // Softness of the shadow
              offset: const Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: "$baseUrlImages$image",
                      fit: BoxFit.cover,
                      height: height * 0.2, // Adjust height
                      width: double.infinity, // Full width
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          height: height * 0.2,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade600, // 🔵 Your custom color
                      radius: 24, // You can adjust size as needed
                      child: IconButton(
                        onPressed: () {
                          // Call the toggleFavorite method from the ProductCubit
                          final cubit = BlocProvider.of<ProductCubit>(context);
                          cubit.toggleFavorite(id);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 28,
                        ), // Change color based on favorite status
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${price.toStringAsFixed(2)} E£",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle adding to cart
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
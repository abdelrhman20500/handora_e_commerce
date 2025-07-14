import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/category_product_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.name, required this.image, required this.id,});

  final String name;
  final String image;
  final int id;
  final baseUrlCategory= "https://adminhandora.runasp.net/images/Categories/";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProductScreen(id: id, title: name),));
      },
      child: Container(
        width: width * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.5), // Shadow color with transparency
              spreadRadius: 1, // How far the shadow spreads
              blurRadius: 5, // The softness of the shadow
              offset: const Offset(2, 2), // Offset of the shadow (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: "$baseUrlCategory$image",
                  height: height * 0.09,
                  width: width * 0.2,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: height * 0.09,
                      width: width * 0.3,
                      color: Colors.grey[300],
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01,),
              Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500, color: Colors.black),),],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handora_e_commerce/Core/utilis/app_color.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/product_entity.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BuildProductDetailsItem extends StatelessWidget {
  BuildProductDetailsItem({super.key, required this.model,});


  final PageController boardController = PageController();
  final ProductEntity model;
  final baseUrlImages= "https://adminhandora.runasp.net";


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * 0.5,
            color: Colors.white,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {},
              controller: boardController,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12), // Optional: add rounded corners
                child: CachedNetworkImage(
                  imageUrl: "$baseUrlImages${model.photos[index].url}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              itemCount: model.photos.length,
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.cyan,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count: model.photos.length,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(model.name, maxLines: 3, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      'Price: \$${model.sellingPrice.toString()}',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(model.description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
                height: height*0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: CustomTextButton(text: "Add To Cart",color: AppColors.kWhiteColor,
                    onTab: (){},),
                )),
          )
        ],
      ),
    );
  }
}
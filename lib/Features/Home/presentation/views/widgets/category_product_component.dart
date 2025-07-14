import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/tabs/home_tab/domain/entity/category_product_entity.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/product_item.dart';

import '../tabs/home_tab/domain/entity/product_entity.dart';


class CategoryProductComponent extends StatelessWidget {
  const CategoryProductComponent({super.key, required this.model, });

  final List<CategoryProductEntity> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.48 / 2.4,
      ),
      itemCount: model.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProductItem(
              image: model[index].photos.isNotEmpty
                  ? model[index].photos.first.url
                  : '',
              id: model[index].id,
              name: model[index].name,

              isFavorite: model[index].isFavorite,
              description: model[index].description,
              price: model[index].sellingPrice,
            )
        );
      },
    );
  }
}
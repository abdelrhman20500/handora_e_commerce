import 'package:flutter/material.dart';
import '../tabs/home_tab/domain/entity/category_entity.dart';
import 'category_item.dart';


class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key, required this.model, });

  final List<CategoryEntity> model;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.19,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:model.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryItem(
              image: model[index].image,
              name: model[index].name,
              id: model[index].id,
            ),
          );
        },
      ),
    );
  }
}


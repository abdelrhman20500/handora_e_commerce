import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/build_home_search.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/widgets/category_bloc_builder.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BuildHomeSearch(),
          SizedBox(height: height*0.02,),
          const Text("Categories", style:
          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
          SizedBox(height: height*0.01,),
          const CategoryBlocBuilder(),
        ],
      ),
    );
  }
}

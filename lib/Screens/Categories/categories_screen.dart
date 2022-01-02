import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Categories/categories_model.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      builder: (context, state) => Container(
        width: double.infinity,
        child: ListView.separated(
          itemBuilder: (context, index) => buildItem(
              ShopBloc.get(context).categoriesModel!.data!.data[index]),
          separatorBuilder: (context, index) => divider(),
          itemCount: ShopBloc.get(context).categoriesModel!.data!.data.length,
        ),
      ),
      listener: (context, state) {},
    );
  }
}

Widget buildItem(DataModel model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Image(
        image: NetworkImage(model.image!),
        fit: BoxFit.cover,
        width: 120,
        height: 120,
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        '${model.name}',
        style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
      Spacer(),
      Icon(Icons.arrow_forward),
    ],
  ),
);

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Categories/categories_model.dart';
import 'package:shop/Screens/Home/home_model.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavState) {
          if (!state.model.status!) {
            showToast(
              text: state.model.message!,
              states: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopBloc.get(context).homeModel != null &&
              ShopBloc.get(context).categoriesModel != null,
          builder: (context) => builderWidget(ShopBloc.get(context).homeModel!,
              ShopBloc.get(context).categoriesModel!, context),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        );
      },

    );
  }
}

Widget builderWidget(
    HomeModel model, CategoriesModel categoriesModel, context) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: model.data!.banners
              .map((e) => Image(
            image: NetworkImage(e.image!),
            width: double.infinity,
            fit: BoxFit.cover,
          ))
              .toList(),
          options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            aspectRatio: 1 / 1.8,
            viewportFraction: 1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        /////////////
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /////////////
              Container(
                height: 100,
                color: Colors.white,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      buildCategoryItem(categoriesModel.data!.data[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5,
                  ),
                  itemCount: categoriesModel.data!.data.length,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //////////////
              Text(
                'New Products',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1 / 1.3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
            children: List.generate(
                model.data!.products.length,
                    (index) =>
                    buildGridProduct(model.data!.products[index], context)),
          ),
        ),
      ],
    ),
  );
}

Widget buildGridProduct(ProductsModel model, context) => Container(
  color: Colors.white,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(
            image: NetworkImage(model.image!),
            width: double.infinity,
            height: 250,
            //fit: BoxFit.cover,
          ),
          if (model.discount != 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 115,
              color: Colors.green,
              child: Row(
                children: [
                  Text(
                    'Discount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        height: 1.3),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${model.discount!}%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              //textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  height: 1.3),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${model.price!}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  //textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      height: 1.3),
                ),
                SizedBox(
                  width: 5,
                ),
                if (model.discount != 0)
                  Text(
                    '${model.old_price!}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      height: 1.3,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print(model.id);
                    ShopBloc.get(context).changeFavouriteStatus(model.id!);
                  },
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: ShopBloc.get(context).favourutes[model.id]!
                        ? Colors.red
                        : Colors.grey[500],
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget buildCategoryItem(DataModel model) => Stack(
  alignment: AlignmentDirectional.bottomEnd,
  children: [
    Image(
      image: NetworkImage(model.image!),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
    Container(
      color: Colors.black.withOpacity(0.5),
      width: 100,
      child: Text(
        '${model.name}',
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
  ],
);

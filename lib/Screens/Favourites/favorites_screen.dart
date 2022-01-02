import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Favourites/favourites_model.dart';
import 'package:shop/Shared/components/components.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: state is! ShopLoadingGetFavState,
        builder: (context) => ListView.separated(
          // physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavItem(
              ShopBloc.get(context).favouritesModels!.data!.data![index],
              context),
          separatorBuilder: (context, index) => divider(),
          itemCount: 10,
        ),
        fallback: (context) => Center(
            child: CircularProgressIndicator(
          color: Colors.red,
        )),
      ),
    );
  }
}

Widget buildFavItem(FavouritesData model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.white,
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.product!.image!), //${model!.image}
                  width: 150,
                  height: 150,
                  //fit: BoxFit.cover,
                ),
                if (model.product!.discount! != 0)
                  Container(
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
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.product!.name!,
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
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.product!.price!.toString(),
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
                      if (model.product!.discount! != 0)
                        Text(
                          model.product!.oldPrice!.toString(),
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
                          ShopBloc.get(context)
                              .changeFavouriteStatus(model.product!.id!);
                        },
                        icon: CircleAvatar(
                          backgroundColor: ShopBloc.get(context)
                                  .favourutes[model.product!.id]!
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
      ),
    );

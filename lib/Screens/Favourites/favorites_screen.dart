import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Shared/components/components.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)   {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildListProduct(ShopBloc.get(context).favoritesModel.data.data[index].product, context),
            separatorBuilder: (context, index) => divider(),
            itemCount: ShopBloc.get(context).favoritesModel.data.data.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
Widget buildListProduct(
    model,
    context, {
      bool isOldPrice = true,
    }) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  colorBlendMode: BlendMode.darken,
                  filterQuality: FilterQuality.high,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    width: 120,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: ShopBloc.get(context).isDark ?Colors.white :Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 15.0,
                      height: 1.3,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                            color:Colors.black,
                            fontSize: 15.0,
                            height: 1.3,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            color:Colors.grey,
                            fontSize: 15.0,
                            height: 1.3,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopBloc.get(context).changeFavouriteStatus(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                          ShopBloc.get(context).favourutes[model.id]
                              ? Colors.red
                              : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
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
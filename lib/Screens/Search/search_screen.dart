import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/Screens/Search/bloc/search_bloc.dart';
import 'package:shop/Screens/Search/bloc/search_states.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => SearchBloc(),
      child: BlocConsumer<SearchBloc, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Search Screen',
              ),
            ),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: searchController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter  text to search';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                      maxLines: 1,
                      onFieldSubmitted: (String text) {
                        SearchBloc.get(context).getSearch(text);
                      },
                      onChanged: (value) {
                        SearchBloc.get(context).getSearch(value);
                      },
                      cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                      textAlign: TextAlign.start,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Enter  text to search',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: HexColor('BBDEFB'),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor('E3F2FD'),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusColor: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (state is SearchLoadingState) LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  if (state is SearchSucessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildListProduct(
                          SearchBloc.get(context).model.data.data[index],
                          context,
                          isOldPrice: false,
                        ),
                        separatorBuilder: (context, index) => divider(),
                        itemCount:
                            SearchBloc.get(context).model.data.data.length,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
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
                        fontSize: 10.0,
                        fontWeight: FontWeight.w900,
                        color: ShopBloc.get(context).isDark
                            ? Colors.white
                            : Colors.white,
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
                      color: ShopBloc.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: ShopBloc.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            fontSize: 10.0,
                            color: ShopBloc.get(context).isDark
                                ? Colors.white
                                : Colors.black,
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

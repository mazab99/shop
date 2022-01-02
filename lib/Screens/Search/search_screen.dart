import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/constants/my_colors.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ShopBloc cubit = ShopBloc.get(context);
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var isRtl = cubit.isRtl;
        var isDark = cubit.isDark;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '',
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:
                    cubit.isDark ? MyColors.primaryColor : MyColors.secondary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                    isRtl: isRtl,
                    onChanged: (keyWord) {
                      //cubit.getSearchedLessons(keyWord);
                    },
                    onPressed: () {},
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.search,
                    color: MyColors.primary,
                    textColor: isDark ? Colors.white : Colors.black,
                    hint: isRtl
                        ? '... ابحث عن المنتج الذي  تريده'
                        : 'Find the product you want .. ',
                    borderRadius: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

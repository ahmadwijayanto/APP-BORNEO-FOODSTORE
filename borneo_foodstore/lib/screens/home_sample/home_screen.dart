import 'package:flutter/material.dart';
import 'package:borneo_foodstore/components/BorderIcon.dart';
import 'package:borneo_foodstore/components/OptionButton.dart';
import 'package:borneo_foodstore/sample_data.dart';
import 'package:borneo_foodstore/screens/detailproduct_sample/detailProduct_screen.dart';
import 'package:borneo_foodstore/utils/utils_function.dart';
import 'package:borneo_foodstore/utils/size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: getProportionateScreenWidth(375.0),
        height: getProportionateScreenHeight(812.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderIcon(
                        height: getProportionateScreenHeight(50.0),
                        width: getProportionateScreenWidth(50.0),
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      BorderIcon(
                        height: getProportionateScreenHeight(50.0),
                        width: getProportionateScreenWidth(50.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(getProportionateScreenHeight(20.0)),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "City",
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                addVerticalSpace(getProportionateScreenHeight(10.0)),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.headline5,
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: getProportionateScreenHeight(25.0),
                      color: Colors.grey,
                    )),
                addVerticalSpace(10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      "<\$220,000",
                      "For Sale",
                      "3-4 Beds",
                      ">1000 sqft"
                    ].map((filter) => ChoiceOption(text: filter)).toList(),
                  ),
                ),
                addVerticalSpace(getProportionateScreenHeight(10.0)),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: RE_DATA[index],
                          );
                        }),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: getProportionateScreenHeight(20.0),
              width: getProportionateScreenWidth(375.0),
              child: Center(
                child: OptionButton(
                  text: "Map View",
                  icon: Icons.map_rounded,
                  width: getProportionateScreenWidth(375.0) * 0.35,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline6,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemData: itemData,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData["image"])),
                Positioned(
                    top: 15,
                    right: 15,
                    child: BorderIcon(
                        child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )))
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline5,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}

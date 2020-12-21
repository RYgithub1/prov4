import 'package:flutter/material.dart';
import 'package:prov4/drink.dart';
import 'package:prov4/drinks.widget.dart';
import 'package:prov4/drinks_provider.dart';
import 'package:provider/provider.dart';



class CheckBoxProviderScreen extends StatefulWidget {
  @override
  _CheckBoxProviderScreenState createState() => _CheckBoxProviderScreenState();
}
class _CheckBoxProviderScreenState extends State<CheckBoxProviderScreen> {


  final List<Drink> drinks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcohol Drink Order"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmrBaQ5243SrlSGVjSZElXCi5P5QWs2iNY-A&usqp=CAU"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Color(0xDDFFFFFF)),

              /// [(5)Surround by Consumer<T>() and Add build feature]
              child: Consumer<DrinksProvider>(
                builder: (context, drinksProvider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Drinks tonight"),

                    /// [(6)Receive the drinks from the provider]
                    ...drinksProvider.drinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (value) {
                              /// [(8)Call the selecetDrink under the provider]
                              drinksProvider.selectDrink(
                                drink,
                                value,
                              );
                            },
                          ),
                        )
                        .toList(),
                    Text("The order is: "),
                    Expanded(
                      child: ListView.builder(

                        /// [(10)Change to get the selectedDrinks from provider]
                        // itemCount: drinks
                        //     .where((element) => element.selected)
                        //     .length,
                        itemCount: drinksProvider.selectedDrinks.length,

                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            /// [(11)Change to get the selectedDrinks from provider]
                            // drinks
                            //     .where((element) => element.selected)
                            //     .toList()[index]
                            //     .name,
                            drinksProvider.selectedDrinks[index].name,
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
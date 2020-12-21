import 'package:flutter/material.dart';
import 'package:prov4/checkbox_provider_screen.dart';
import 'package:prov4/drinks_provider.dart';
import 'package:provider/provider.dart';


void main() {runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'provider v4',
      theme: ThemeData(primarySwatch: Colors.orange),

      /// [(4)Register the ChangeNotifierProvide<T> on TOP and Create a instance]
      home: ChangeNotifierProvider<DrinksProvider>(
        create: (_) => DrinksProvider(),
        child: CheckBoxProviderScreen(),
      ),
    );
  }
}

import 'package:idly_factory/core/export.dart';

import 'food_detailpage.dart';

class MenuPage extends StatelessWidget {
  final List<String> categories = ['Full Menu', 'Recents', 'Favourites'];
  final List<String> FoodItems = [
    'Featured items',
    'Brewed Coffee',
    'Hot Beverages',
    "Cold Beverages",
    "Breakfast"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButtons(
                icon: Icons.close,
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
          title: Text("Menu"),
          bottom: TabBar(
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: categories.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: Stack(
          children:[ TabBarView(
            children: FoodItems.map((category) {
              return ListView(
                children: getFoodItems(category).map((item) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    leading: Image.asset("assets/images/icons/shop-bag.png",color: Colors.red,),
                    title: Text(item.name),
                    subtitle: Text("\$${item.price}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(item: item),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }).toList(),
          ),
            Positioned(
                child: ListTile(title: Text("Pick Up"),))
    ]
        ),
      ),
    );
  }

  List<FoodItem> getFoodItems(String category) {
    // Mock data for food items
    return [
      FoodItem(name: "$category Item 1", price: 5.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
      FoodItem(name: "$category Item 2", price: 3.99),
    ];
  }
}

class FoodItem {
  final String name;
  final double price;

  FoodItem({required this.name, required this.price});
}

import 'package:flutter/material.dart';
import '../widgets/cart/widget-cart-button.dart';
import '../colors.dart' as colors;
import '../classes/category.dart';
import '../services/market.dart';
import '../widgets/widget-bottom-menu.dart';

class Categories extends StatelessWidget
{
  List<Category>    categories = [];
  int currentPage = 1;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        actions: [
          WidgetCartButton()
        ],
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: colors.mainColors['gray'].withOpacity(0.1),
        child: FutureBuilder(
          future: ServiceMarket().getCategories(this.currentPage),
          builder: (_ctx, snapshot)
          {
            if( !snapshot.hasData )
              return Center(child: CircularProgressIndicator());

            this.categories = snapshot.data;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                ),
                itemCount: this.categories.length,
                itemBuilder: (ctx, index)
                {
                  var category = this.categories[index] as Category;
                  return this._buildItem(category);
                }
            );
          },
        )
      )
    );
  }
  void _getNextPage() async
  {
    var newCats = await ServiceMarket().getCategories(this.currentPage + 1);
    this.categories.addAll(newCats);
  }
  Widget _buildItem(Category category)
  {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(category.featuredImage, fit: BoxFit.contain,),
                )
              ),
              SizedBox(height: 8),
              Text(category.name, textAlign: TextAlign.center,)
            ]
        )
    );
  }
}
import 'package:flutter/material.dart';
import '../../classes/MB_Order.dart';
import '../../widgets/widget-order-listitem.dart';

class OrdersHistoryController
{
  Function			onFirstLoad;
  Function(int)	onPageLoaded;
  Function			refresh;

}
class OrdersHistory extends StatefulWidget
{
  final bool	refresh;
  final	OrdersHistoryController	controller;

  OrdersHistory({this.refresh = false, this.controller});
  @override
  _OrdersHistoryState	createState() => _OrdersHistoryState();
}
class _OrdersHistoryState extends State<OrdersHistory>
{
  int 								currentPage = 0;
  int 								limit = 6;
  List								orders = <MB_Order>[];
  ScrollController		_ctrlList = ScrollController();
  bool								_loading = false;
  bool								_hasNextPage = true;
  bool								_firstLoad		= true;

  @override
  void initState()
  {
    this.orders = <MB_Order>[];
    this._ctrlList.addListener(this._scrollListener);
    if( this.widget.controller != null )
      this.widget.controller.refresh = this.refresh;

    super.initState();
    this._getMore();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Historial de pedidos')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: this._firstLoad ? Center(child: CircularProgressIndicator()) : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: this.orders.length,
                    itemBuilder: (ctx, index)
                    {
                      var order = this.orders[index];
                      return WidgetOrderListItem( order: order, index: index);
                    },
                    controller: this._ctrlList,
                  )
              ),
              if( this._loading )
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(child: CircularProgressIndicator())
                )
            ]
        )
      )
    );
  }
  void _scrollListener()
  {
    if (this._ctrlList.offset >= this._ctrlList.position.maxScrollExtent &&
        !this._ctrlList.position.outOfRange)
    {
      print('Scroll reach the bottom, getting more orders');
      this._getMore();
    }
    if (this._ctrlList.offset <= this._ctrlList.position.minScrollExtent &&
        !this._ctrlList.position.outOfRange)
    {
      print("reach the top");
    }
  }
  Future<bool> refresh() async
  {
    this._firstLoad 	= true;
    this._loading			= false;
    this._hasNextPage = true;
    this.currentPage 	= 0;
    this.orders.clear();
    return this._getMore();
  }
  Future<bool> _getMore() async
  {
    if( this._loading || !this._hasNextPage )
      return false;
    this._loading = true;
    this.setState((){});
    //var items = await ServiceOrders().getOrders(this.currentPage + 1, this.limit);
    var items = List.generate(this.limit, (index) => MB_Order());

    if( this._firstLoad )
    {
      if( this.widget.controller != null && this.widget.controller.onFirstLoad != null )
        this.widget.controller.onFirstLoad();
    }
    this._firstLoad = false;

    if( items.length <= 0 )
    {
      this._loading = false;
      this._hasNextPage = false;
      this.setState((){});
      return true;
    }
    this.orders.addAll(items);
    this.currentPage++;
    this._loading = false;
    if( this.widget.controller != null && this.widget.controller.onPageLoaded != null )
    {
      this.widget.controller.onPageLoaded(this.currentPage);
    }
    this.setState((){});
    return true;
  }
}

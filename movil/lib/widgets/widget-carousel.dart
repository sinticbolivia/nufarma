import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../services/market.dart';
import '../services/market.dart';
import '../services/service.dart';

class WidgetCarousel extends StatelessWidget
{
  List items = <Widget>[];

  WidgetCarousel();

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
      future: this._getItems(),
      builder: (ctx, snapshot)
      {
        if( !snapshot.hasData )
          return Center(child: CircularProgressIndicator());

        this._buildItems(snapshot.data);
        return Container(
            child: CarouselSlider(
                items: this.items,
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: 16/9,
                  viewportFraction: 1, //0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //onPageChanged: this._onPageChanged,
                  scrollDirection: Axis.horizontal,
                )
            )
        );
      }
    );
  }
  Future<List> _getItems() async
  {
    var banners = await ServiceMarket().getBanners();
    return banners.map((e) => {
      'title': '',
      'url': e.imageUrl,
      'type': 'remote'
    }).toList();
    /*
    List slides = [{
      'title': '',
      'url': 'assets/images/slide01.jpg',
      'type': 'local'
    }];
    return slides;
     */
  }
  void _buildItems(List slides)
  {
    slides.forEach((slide)
    {
      this.items.add(Container(
        child: slide['type'] == 'local' ? Image.asset(slide['url']) : Image.network(slide['url'])
      ));
    });
  }
  dynamic _onPageChanged(int changedReason)
  {

  }
}
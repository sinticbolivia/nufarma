import 'package:flutter/material.dart';
import '../../classes/product.dart';
import '../../colors.dart' as colors;

class Gallery extends StatefulWidget
{
  Product product;
  Gallery({@required this.product});

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery>
{
  int currentIndex = 0;

  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
                index: this.currentIndex,
                children: this.widget.product.images.map( (img)
                {
                  return this._buildImage(img);
                }).toList()
            )
          ),
          SizedBox(height: 10),
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for(int i = 0; i < this.widget.product.images.length; i++)
                  this._buildThumbnail(this.widget.product.images[i], i)
              ],
            )
          )
        ]
      )
    );
  }
  Widget _buildImage(Map img)
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: img['type'] == 'local' ? Image.asset(img['url'], fit: BoxFit.cover) : Image.network(img['url'], fit: BoxFit.cover)
      )
    );
  }
  Widget _buildThumbnail(Map img, int index)
  {
    return InkWell(
      child: Container(
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: colors.mainColors['mainGray'].withOpacity(0.6),
                style: BorderStyle.solid,
              )
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          child: img['type'] == 'local' ? Image.asset(img['url'], fit: BoxFit.cover) : Image.network(img['url'], fit: BoxFit.cover)
      ),
      onTap: ()
      {
        this.setState(() {
          this.currentIndex = index;
        });
      },
    );
  }
}
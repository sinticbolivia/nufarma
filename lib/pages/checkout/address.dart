import 'package:flutter/material.dart';
import 'package:nufarma/classes/MB_Address.dart';
import '../../widgets/checkout/steps.dart';
import '../../colors.dart' as colors;

class Address extends StatefulWidget
{
  @override
  _AddressState createState() => _AddressState();
}
class _AddressState extends State<Address>
{
  MB_Address  currentAddress;

  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dirección')
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Steps(step: 0,),
            SizedBox(height: 8),
            this._currentAddress(),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: this._getAddresses()
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Column(
                    children: [
                      Icon(
                          Icons.add_circle_outline_outlined,
                          size: 40,
                          color: colors.mainColors['price']
                      ),
                      SizedBox(height: 10),
                      Text('Agregar nueva dirección',
                          style: TextStyle(color: colors.mainColors['price'], fontSize: 17)
                      )
                    ],
                  ),
                  onTap: ()
                  {
                    Navigator.of(this.context).pushNamed('/new-address');
                  },
                )
              ]
            ),
          ]
        )
      ),
    );
  }
  Widget _currentAddress()
  {
    return Container(
      color: colors.mainColors['gray'].withOpacity(0.2),
      padding: EdgeInsets.all(12),
      child: this.currentAddress != null ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delivery_dining),
          SizedBox(width: 10),
          Text(
            '${this.currentAddress.name}, ${this.currentAddress.city}, ${this.currentAddress.country}',
            textAlign: TextAlign.center,
          )
        ]
      ) : Text('')
    );
  }
  Widget _getAddresses()
  {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), ()
      {
        return [
          MB_Address(id: 1, name: 'Direccion 01', city: 'La Paz', country: 'Bolivia')
        ];
      }),
      builder: (ctx, snapshot)
      {
        if( !snapshot.hasData )
          return Column(children: [CircularProgressIndicator()],);
        return Column(
          children: (snapshot.data as List).map((address) => this._buildAddressItem(address)).toList()
        );
      });
  }
  Widget _buildAddressItem(MB_Address address)
  {
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Row(
              children: [
                Image.asset('assets/images/address-marker.png'),
                SizedBox(width: 10,),
                Expanded(
                    child: Text('${address.name}, ${address.city}, ${address.country}')
                ),
                SizedBox(width: 10,),
                Container(
                  child: Center(
                      child: Radio(
                        value: this.currentAddress != null && this.currentAddress.id == address.id,
                      )
                  ),
                )
              ]
          )
      ),
      onTap: ()
      {
        this.setState(()
        {
          this.currentAddress = address;
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class WidgetSearch extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(8),
      height: 65,
      color: colors.mainColors['primary'],
      child: Form(
          child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                      hintText: 'Buscar',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      suffixIcon: Container(
                        padding: EdgeInsets.all(6),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: colors.mainColors['secondary'])
                                  )
                              )

                          ),
                          child: Icon(Icons.search, color: Colors.white,),
                        )
                      ),
                  ),
                )
              ),
              SizedBox(width: 10),
            ]
          ),
      )
    );
  }
}
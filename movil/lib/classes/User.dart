import 'SB_Object.dart';

class User extends SB_Object
{
  int id = 0;
  String email = '';
  String credit = '';
  String discount = '';
  String  credito_debe = '';
  String  no_vencido = '';
  int status = 0;
  String  name = '';
  String  lastname = '';
  String  fullname = '';
  String  rfc = '';
  String  name_company = '';
  String  street = '';
  String  city = '';
  String  state = '';
  String  phone = '';
  String  sucursal_name = '';

  User()
  {

  }
  User.fromMap(Map<String, dynamic> data)
  {
    this.loadData(data);
  }
  User.fromJson()
  {

  }
  @override
  void loadData(Map<String, dynamic> data)
  {
    if( data == null )
      return;
    try
    {

    }
    catch(e)
    {
      print('ERROR: User load data');
      print(e);
    }
    this.id = data['id'];
    this.email = data['email'] ?? '';
    this.phone = data['phone'] ?? '';
    this.name   = data['name'] ?? '';
    this.lastname = data['lastname'] ?? '';
    this.fullname = data['fullname'] ?? '';
    this.rfc      = data['rfc'];
    this.name_company = data['name_company'] ?? '';
    this.status       = data['status'];
  }
  Map<String, dynamic> toMap()
  {
    return {
      'id': this.id,
      'email': this.email,
      'phone': this.phone,
      'name': this.name,
      'lastname': this.lastname,
      'fullname': this.fullname,
    };
  }
}
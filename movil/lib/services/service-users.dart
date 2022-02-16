import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'service.dart';
import '../classes/SB_Settings.dart';
import '../classes/User.dart';
import '../classes/exceptions/RequestException.dart';
import '../classes/exceptions/ExceptionLogin.dart';

class ServiceUsers extends Service
{
  static final ServiceUsers _instance = ServiceUsers._constructor();

  ServiceUsers._constructor() : super()
  {

  }
  factory ServiceUsers() => _instance;

  Future<User> login(String username, String password) async
  {
    String endpoint = '/ingresar';
    var data 		= {'email': username, 'password': password};
    String response = '';
    try
    {
      response 	= await this.post(endpoint, data);
      var _json = json.decode(response);

      var user = new User.fromMap(_json['user']);
      print("USER TOKEN: ${_json['access_token']}");
      print(user.toMap());
      startSession(user, _json['access_token']);
      this.setToken(_json['access_token']);
      return user;
    }
    on RequestException catch(e)
    {
      throw new ExceptionLogin('Error de atenticación', e.response);
    }
  }
  Future<User> register(Map<String, dynamic> data) async
  {
      String endpoint = '/register';
      String _json = await this.post(endpoint, data);
      print(_json);
      var obj = json.decode(_json);
      return User.fromMap(obj);
  }
  Future<bool> isLoggedIn() async
  {
    bool authenticated = await SB_Settings.getBool('authenticated');
    //print('isLoggedIn: $authenticated');
    if( authenticated == null )
      authenticated = false;
    //print('TOKEN: ' + await SB_Settings.getString('token'));
    this.setToken(await SB_Settings.getString('token'));
    return authenticated;
  }
  void startSession(User user, String token)
  {
    //##save token
    SB_Settings.saveString('token', token);
    SB_Settings.saveObject('user', user.toMap());
    SB_Settings.setBool('authenticated', true);
  }
  void closeSession() async
  {
    await SB_Settings.saveString('token', '');
    await SB_Settings.saveString('user', '');
    await SB_Settings.setBool('authenticated', false);
    String gt = await SB_Settings.getString('google_token');
    String fbt = await SB_Settings.getString('fb_token');
    if( gt != null && !gt.isEmpty )
    {
      print('CLOSING GOOGLE SESSION');
      /*
			GoogleSignIn gsi = GoogleSignIn(scopes:['email', 'https://www.googleapis.com/auth/contacts.readonly']);
			//await gsi.disconnect();
			await gsi.signOut();
			*/
      await SB_Settings.saveString('google_token', null);
    }
    if( fbt != null && !fbt.isEmpty )
    {
      await SB_Settings.saveString('fb_token', null);
      /*
			final facebookLogin = FacebookLogin();
			await facebookLogin.logOut();
			*/
    }
  }
  Future<User> getCurrentUser() async
  {
    var data = await SB_Settings.getObject('user');
    if( data == null )
      return null;
    var user = User.fromMap(data);

    return user;
  }
  Future<User> update(User user) async
  {
    var res = await this.put('/v1.0.0/users/${user.id}', user.toMap());
    //print(res);
    var obj = json.decode(res);
    /*
		if( res.statusCode != 200 )
			throw new Exception('Ocurrion un error al tratar de actualizar los datos de usuario');
		*/
    var uuser = new User.fromMap(obj['data']);
    return uuser;
  }
  Future<Map<String, dynamic>> uploadAvatar(File avatar) async
  {
    String endpoint = this.apiUrl + '/users/avatar';
    var headers 	= await this.getHeaders();
    var request 	= http.MultipartRequest('POST', Uri.parse(endpoint));
    var pic 		= await http.MultipartFile.fromPath('qqfile', avatar.path);
    request.files.add(pic);
    headers.forEach( (key, value)
    {
      request.headers[key] = value;
    });
    var response 	= await request.send();
    var data 		= await response.stream.toBytes();
    var _json 		= String.fromCharCodes(data);
    print(_json);

    return json.decode(_json);
  }
  Future<User> profile() async
  {
    String endpoint = '/users/profile';
    var res 		= await this.get(endpoint);
    var _json 		= json.decode(res);
    /*
		if( res.statusCode != 200 )
			throw new Exception('Ocurrio un error al tratar de obtener la informacion del usuario');
		*/
    var user = new User.fromMap(_json['data']);
    print('USER PROFILE');
    print(user.toMap());
    return user;
  }
  Future<void> reload() async
  {
    String token = await SB_Settings.getString('token');
    var user = await this.profile();
    startSession(user, token);
  }
  Future<Map> recoverPass(String username) async
  {
    Map<String, String> data = {'username': username};
    String endpoint = '/users/forgot';
    var res 		= await this.post(endpoint, data);
    print(res);
    return json.decode(res);
  }
  Future<Map> changePass(Map data) async
  {
    String endpoint = '/users/pwd';
    var res 		= await this.put(endpoint, data);
    print(res);
    return json.decode(res);
  }
}
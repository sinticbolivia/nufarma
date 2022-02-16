import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../classes/SB_Settings.dart';
import '../classes/exceptions/RequestException.dart';

import '../config.dart' as config;

class Service
{
  static final Service _instance = Service();

  String siteUrl	= 'https://nufarma.com.mx';
  String apiUrl	= 'https://nufarma.com.mx/api';
  String	_token	= '';

  Service()
  {
    this.loadData();
  }
  void loadData() async
  {
    this.apiUrl = config.appConfig['API_URL'];
    /*
    String server = await SB_Settings.getString('api_server');
    String port = await SB_Settings.getString('api_server_port');
    if( port == null || port.isEmpty )
      port = '443';
    if( server != null && server.isNotEmpty )
      siteUrl = '$server:$port';
    apiUrl = siteUrl + '/api';
    print('BASE SERVICE: Server settings loaded');
    print(siteUrl);
     */
  }
  factory Service.instance()
  {
    return _instance;
  }
  String setToken(String t)
  {
    this._token = t;
  }
  dynamic _buildEndpoint(String path)
  {
    //this.loadData();
    var endpoint = Uri.parse(apiUrl + path);

    return endpoint;
  }
  /// Get all necessary headers to send a request
  Future<Map<String, String>> getHeaders() async
  {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if( this._token == null || this._token.isEmpty )
      this.setToken(await SB_Settings.getString('token'));
    if( this._token != null && !this._token.isEmpty )
      headers['Authorization'] = 'Bearer ${this._token}';

    return headers;
  }
  Future<Map<String, dynamic>> getSettings() async
  {
    var res 		= await this.get('/settings');
    var data 		= json.decode(res);
    /*
		if( res.statusCode != 200 )
			throw new RequestException('Ocurrio un error al recuperar las configuraciones de la aplicación', res);
		*/

    return data['data'];
  }
  Future<String> get(String _endpoint) async
  {
    var endpoint 	= this._buildEndpoint(_endpoint);
    print('GET: $endpoint');
    var headers 		= await this.getHeaders();
    //print(headers);
    http.Response res 	= await http.get(endpoint, headers: headers);
    //print(res.body);
    //var obj = json.decode(res.body);
    print('StatusCode => ${res.statusCode}');
    if( res.statusCode != 200 )
    {
      throw new RequestException('Ocurrio un error al tratar de recuperar los datos (GET)', res);
    }

    return res.body;
  }
  Future<String> post(String endpoint, Map<dynamic, dynamic> data) async
  {
    var url		=	 this._buildEndpoint(endpoint);
    var headers		= await this.getHeaders();
    String _json	= json.encode(data);
    print('headers');print(headers);print(url);print(_json);
    var response 	= await http.post(url, headers: headers, body: _json);
    print(response.statusCode);print(response.body);
    if( response.statusCode != 200 )
      throw new RequestException('Ocurrio un error al enviar la solicitud (POST)', response);

    return response.body;
  }
  Future<String> put(String endpoint, Map<dynamic, dynamic> data) async
  {
    var headers		= await this.getHeaders();

    String _json	= json.encode(data);
    var response 	= await http.put(this._buildEndpoint(endpoint), headers: headers, body: _json);
    if( response.statusCode != 200 )
      throw new RequestException('Error en la solicitud PUT', response);

    return response.body;
  }
  Future<String> delete(String endpoint) async
  {
    var headers		= await this.getHeaders();
    var response 	= await http.delete(this._buildEndpoint(endpoint), headers: headers);
    if( response.statusCode != 200 )
      throw new RequestException('Error en la solicitud DELETE', response);

    return response.body;
  }
}

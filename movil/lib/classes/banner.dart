class Banner
{
  int id = 0;
  String name = '';
  String path = '';
  
  String get imageUrl
  {
    if( this.path.indexOf('https:') == -1)
      return 'https://nufarma.com.mx/storage/${this.path}';

    return this.path;
  }
  Banner(){}
  Banner.fromMap(Map<String, dynamic> data)
  {
    this.loadData(data);
  }
  void loadData(Map<String, dynamic> data)
  {
    if( data == null )
      return;
    try
    {
      this.id = data['id'] ?? 0;
      this.name = data['name'] ?? '';
      this.path = data['path'] ?? '';
    }
    catch(e)
    {

    }
  }
}
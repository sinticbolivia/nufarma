class Category
{
  int   id;
  String    name;
  String    description;
  String    featuredImage;
  String    slug;
  int       status = 0;
  int       count = 0;

  Category({this.id, this.name, this.description, this.featuredImage});

  Category.fromMap(Map<String, dynamic> data)
  {
    this.loadData(data);
  }
  void loadData(Map<String, dynamic> data)
  {
    if( data == null )
      return;
    try
    {
      this.id = data['id'];
      this.name = data['name'];
      this.featuredImage = data['image'];
      this.slug = data['slug'];
      this.status = data['status'];
      this.count = data['count'];
    }
    catch(e)
    {

    }
  }
}
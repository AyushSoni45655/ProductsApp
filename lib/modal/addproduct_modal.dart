class AddProductModal{
  String image;
  String title;
  String description;
  String price;
  AddProductModal({required this.image,required this.title, required this.description , required this.price});
  // tomap to add data shared preferance
Map<String,dynamic>toMap(){
  return {
    'Image':image,
    'Price':price,
    'Title':title,
    'Description':description,
  };
}
         // fromJson function to fetch data shared preeferance
factory AddProductModal.fromJson(Map<String,dynamic>mapData){
  return AddProductModal(
      image: mapData['Image']??'No Image',
      title: mapData['Title']??'No title',
      description: mapData['Description']??'No description',
      price: mapData['Price']??'No Price'
  );
}
}
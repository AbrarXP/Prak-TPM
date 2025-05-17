import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas3_123220191/component/Item_card.dart';
import 'package:tugas3_123220191/component/custom_button.dart';
import 'package:tugas3_123220191/model/api.dart';
import 'package:tugas3_123220191/model/dataBaju.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Variabel
  List<DataBaju> daftarBaju = [];
  DataBaju? baju;
  DataBaju? bajuEdit;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController soldController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController materialController = TextEditingController();

  TextEditingController nameEditController = TextEditingController();
  TextEditingController priceEditController = TextEditingController();
  TextEditingController categoryEditController = TextEditingController();
  TextEditingController brandEditController = TextEditingController();
  TextEditingController soldEditController = TextEditingController();
  TextEditingController ratingEditController = TextEditingController();
  TextEditingController stockEditController = TextEditingController();
  TextEditingController yearEditController = TextEditingController();
  TextEditingController materialEditController = TextEditingController();

  // Method 
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoadingIndicator(context);
      getClothes().then((_) {
        Navigator.pop(context);
      });
    });
  }

  Future<void> getClothes() async {

    final response = await http.get(Uri.parse(API.getUrl));
    print(response.body);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['data'];

      setState(() {
        daftarBaju = data.map((json) => DataBaju.fromJson(json)).toList();
      });

    } else {
      throw Exception('Failed to load data getClothes');
    }
  }

  Future<void> getClothesByID(String ID) async {

    final response = await http.get(Uri.parse(API.getByIDUrl(ID)));
    print(response.body);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final Map<String, dynamic> data = jsonData['data'];

      setState(() {
        baju = DataBaju.fromJsonDetail(data);
      });

    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> deleteCloth(String ID) async {

    final response = await http.delete(Uri.parse(API.deleteUrl(ID)));
    print(response.body);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);

      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.green.withOpacity(0.9),
              title: Center(
                child: Text(
                  jsonData["status"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              content: Text(
                jsonData["message"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13
                ),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor:  Colors.green.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {

                    setState(() async{
                      isLoadingIndicator(context);
                      await getClothes();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    );

    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> addCloth(String name, int price, String category,String brand,int sold, double rating, int stock, int year, String material) async {

    final response = await http.post(
      Uri.parse(API.postUrl),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'name': name,
        'price': price,
        'category': category,
        'brand': brand,
        'sold': sold,
        'rating': rating,
        'stock': stock,
        'yearReleased': year,
        'material': material
      }),
    );

    print(response.body);

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.green.withOpacity(0.9),
              title: Center(
                child: Text(
                  jsonData["status"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              content: Text(
                jsonData["message"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13
                ),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor:  Colors.green.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {

                    setState(() async{
                      isLoadingIndicator(context);
                      await getClothes();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    );


    } else {
      throw Exception('Failed to load data addCloth');
    }
  }

  Future<void> editCloth(String id, String name, int price, String category,String brand,int sold, double rating, int stock, int yearReleased, String material) async {

    final response = await http.put(
      Uri.parse(API.putUrl(id)),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({
        'name': name,
        'price': price,
        'category': category,
        'brand': brand,
        'sold': sold,
        'rating': rating,
        'stock': stock,
        'yearReleased': yearReleased,
        'material': material
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);
      setState(() {
        customPopUp(context, jsonData["status"], jsonData["message"], Colors.green);
      });

    } else {
      throw Exception('Failed to load data editCloth');
    }
  }

  void isLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // tidak bisa ditutup dengan tap di luar
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          
          backgroundColor: const Color.fromARGB(255, 90, 255, 68),
          onPressed: () async{
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: Text("Add New Cloth", style: TextStyle(fontWeight: FontWeight.bold),)),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            widgetTextField()
                          ]),
                      ),
                    ),
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 66, 207, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async{

                        if(nameController.text.isEmpty || priceController.text.isEmpty || categoryController.text.isEmpty || brandController.text.isEmpty || soldController.text.isEmpty || ratingController.text.isEmpty || stockController.text.isEmpty || yearController.text.isEmpty || materialController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all the fields", style: TextStyle(color: Colors.white),),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 196, 36, 25),
                            ),
                          );
                          return;
                        }else if(double.parse(ratingController.text) < 0 || double.parse(ratingController.text) > 5){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please rate between 1-5 stars", style: TextStyle(color: Colors.white),),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 196, 36, 25),
                            ),
                          );
                          return;
                        }else if(int.parse(yearController.text) < 2018 || int.parse(yearController.text) > 2025){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Cannot be lower than 2018 or greater than 2025", style: TextStyle(color: Colors.white),),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color.fromARGB(255, 196, 36, 25),
                            ),
                          );
                          return;
                        }

                        isLoadingIndicator(context);

                        await addCloth(
                          nameController.text,
                          int.parse(priceController.text),
                          categoryController.text,
                          brandController.text,
                          int.parse(soldController.text),
                          double.parse(ratingController.text),
                          int.parse(stockController.text),
                          int.parse(yearController.text),
                          materialController.text
                        );

                      },
                      child: const Text("Submit", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white,),
        ),
      
        appBar: AppBar(
          title: const Text('Tugas 3 - API Request'),
          backgroundColor: Colors.amber,
        ),
        
        body: Center(
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
      
              Container(
                height: MediaQuery.sizeOf(context).height * 0.88,
                width: MediaQuery.sizeOf(context).width,
                
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2), 
                  itemCount: daftarBaju.length,
                
                  itemBuilder: (context, index) {
                   return GestureDetector(
                    onTap: () async{
      
                      isLoadingIndicator(context);
                      await getClothesByID(daftarBaju[index].id.toString());
                      Navigator.pop(context);
      
      
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
      
                            actionsAlignment: MainAxisAlignment.center,
      
                            title: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      baju!.name ?? "No Name",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${baju!.rating} ", style: const TextStyle(fontSize: 12,),), 
                                        Icon(Icons.star, size: 15, color: const Color.fromARGB(255, 255, 164, 7)),
                                      ],
                                    ),
                                ],
                              ),
                            ),
      
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image_not_supported_outlined, size: 100, color: const Color.fromARGB(255, 175, 175, 175)),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${baju!.price} USD",
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 71, 204, 0),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "${baju!.brand}",
                                      style: const TextStyle(
                                        fontSize: 12,                                    ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: const Color.fromARGB(255, 25, 25, 25),
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${baju!.yearReleased}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${baju!.category}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "${baju!.material}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${baju!.stock} pcs left !",
                                      style: const TextStyle(fontSize: 12, color: Colors.red),
                                    ),
                                    Text(
                                      "${baju!.sold} pcs sold",
                                      style: const TextStyle(fontSize: 12, color: Colors.green),
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 255, 189, 7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Close", style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          );
                        },
                      );
                    },
                     child: ItemCard(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      width: MediaQuery.sizeOf(context).width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                                   
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  daftarBaju[index].name ?? "No Name",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      daftarBaju[index].rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.star, size: 14, color: Colors.amber),
                                  ],
                                ),
                              ],
                            ),
      
                            const SizedBox(height: 10),
                            Icon(Icons.image_not_supported_outlined, size: 40, color: const Color.fromARGB(255, 175, 175, 175)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${daftarBaju[index].price.toString()} USD",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  daftarBaju[index].category ?? "No Category",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
      
      
      
                            
                            Divider(
                              color: Colors.amber,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: ()async{

                                    //  Ambil data baju duls
                                    final response = await http.get(Uri.parse(API.getByIDUrl(daftarBaju[index].id.toString())));
                                    print(response.body);
                                    if (response.statusCode == 200) {
                                      final Map<String, dynamic> jsonData = json.decode(response.body);
                                      final Map<String, dynamic> data = jsonData['data'];
                                      setState(() {
                                        bajuEdit = DataBaju.fromJsonDetail(data);
                                      });
                                    } else {
                                      throw Exception('Failed to load data');
                                    }

                                    isLoadingIndicator(context);
                                    await getClothesByID(daftarBaju[index].id.toString());
                                    Navigator.of(context).pop();

                                    setState(() {
                                       nameEditController.text = bajuEdit!.name!;
                                       priceEditController.text = bajuEdit!.price.toString();
                                       categoryEditController.text = bajuEdit!.category!;
                                       brandEditController.text = bajuEdit!.brand!;
                                       soldEditController.text = bajuEdit!.sold.toString();
                                       ratingEditController.text = bajuEdit!.rating.toString();
                                       stockEditController.text = bajuEdit!.stock.toString();
                                       yearEditController.text = bajuEdit!.yearReleased.toString();
                                       materialEditController.text = bajuEdit!.material!;

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(child: Text("Edit Cloth", style: TextStyle(fontWeight: FontWeight.bold),)),
                                            content: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      widgetTextFieldEdit()
                                                    ]),
                                                ),
                                              ),
                                            ),
                                            actionsAlignment: MainAxisAlignment.center,
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color.fromARGB(255, 66, 207, 6),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                onPressed: () async{

                                                  if(nameEditController.text.isEmpty || priceEditController.text.isEmpty || categoryEditController.text.isEmpty || brandEditController.text.isEmpty || soldEditController.text.isEmpty || ratingEditController.text.isEmpty || stockEditController.text.isEmpty || yearEditController.text.isEmpty || materialEditController.text.isEmpty){
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        content: Text("Please fill all the fields", style: TextStyle(color: Colors.white),),
                                                        duration: Duration(seconds: 2),
                                                        backgroundColor: Color.fromARGB(255, 196, 36, 25),
                                                      ),
                                                    );
                                                    return;
                                                  }else if(double.parse(ratingEditController.text) < 0 || double.parse(ratingEditController.text) > 5){
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        content: Text("Please rate between 1-5 stars", style: TextStyle(color: Colors.white),),
                                                        duration: Duration(seconds: 2),
                                                        backgroundColor: Color.fromARGB(255, 196, 36, 25),
                                                      ),
                                                    );
                                                    return;
                                                  }else if(int.parse(yearEditController.text) < 2018 || int.parse(yearEditController.text) > 2025){
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        content: Text("Cannot be lower than 2018 or greater than 2025", style: TextStyle(color: Colors.white),),
                                                        duration: Duration(seconds: 2),
                                                        backgroundColor: Color.fromARGB(255, 196, 36, 25),
                                                      ),
                                                    );
                                                    return;
                                                  }

                                                  isLoadingIndicator(context);

                                                  await editCloth(
                                                    daftarBaju[index].id.toString(),
                                                    nameEditController.text,
                                                    int.parse(priceEditController.text),
                                                    categoryEditController.text,
                                                    brandEditController.text,
                                                    int.parse(soldEditController.text),
                                                    double.parse(ratingEditController.text),
                                                    int.parse(stockEditController.text),
                                                    int.parse(yearEditController.text),
                                                    materialEditController.text
                                                  );

                                                },
                                                child: const Text("Submit", style: TextStyle(color: Colors.white),),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    });

                                    // editCloth(daftarBaju[index].id.toString());
                                  },
                                  label: Icon(Icons.edit, color: const Color.fromARGB(255, 252, 252, 252)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 255, 181, 7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: ()async{
                                    isLoadingIndicator(context);
                                    deleteCloth(daftarBaju[index].id.toString());

                                  },
                                  label: Icon(Icons.delete, color: const Color.fromARGB(255, 252, 252, 252)),
                                  style: ElevatedButton.styleFrom(
                                
                                    backgroundColor: const Color.fromARGB(255, 255, 7, 7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     ),
                   );
                  }
                ),
              )
      
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetTextField(){
    return Column(
      children: [
                                TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Price",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: categoryController,
                          decoration: const InputDecoration(
                            labelText: "Category",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: brandController,
                          decoration: const InputDecoration(
                            labelText: "Brand",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: soldController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Sold",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: ratingController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Rating",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: stockController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Stock",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: yearController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Year Released",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: materialController,
                          decoration: const InputDecoration(
                            labelText: "Material",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                    
      ],
    );
  }

  Widget widgetTextFieldEdit(){
    return Column(
      children: [
                                TextField(
                          controller: nameEditController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: priceEditController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Price",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: categoryEditController,
                          decoration: const InputDecoration(
                            labelText: "Category",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: brandEditController,
                          decoration: const InputDecoration(
                            labelText: "Brand",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: soldEditController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Sold",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: ratingEditController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Rating",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: stockEditController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Stock",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: yearEditController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Year Released",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: materialEditController,
                          decoration: const InputDecoration(
                            labelText: "Material",
                            filled: true,
                            fillColor: Color.fromARGB(255, 211, 211, 211),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                    
      ],
    );
  }
  
  
  void customPopUp(BuildContext context, String status, String message, Color color) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: color.withOpacity(0.9),
          title: Center(
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {

                setState(() async{
                  isLoadingIndicator(context);
                  await getClothes();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
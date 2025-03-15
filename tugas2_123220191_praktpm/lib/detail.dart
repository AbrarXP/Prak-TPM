import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  final String? url;
  final String? index;

  final String? dummy = "Lorem ipsum odor amet, consectetuer adipiscing elit. Sapien penatibus duis dolor mattis eget curabitur lacus semper nascetur. Sollicitudin est sem quis ridiculus est at. Iaculis ad id donec pretium; litora est mauris erat. Senectus vulputate vivamus magna sapien dapibus. Malesuada eleifend fusce duis orci; fringilla sapien feugiat lacus. Vehicula curabitur primis ornare curae mi quis. Nec ante cursus potenti faucibus neque id felis tortor! Ad nibh aenean fusce et; dis eu parturient. ";

  const detailPage({
    super.key,
    this.url,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 204, 0),
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.17,),
            Icon(Icons.camera, color: Colors.white,), 
            Text(
              " GALLERY", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
            ),
          ]
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network("$url", fit: BoxFit.cover,)
                ),
              ),
              SizedBox(height: 20,),

              Text(
                "Gambar $index",

                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
              ),
              Divider(),
              SizedBox(height: 20,),

              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 24,),
                  Text(
                    "  Kota X, Kab. X, Kec. X" ,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),

              Row(
                children: [
                  Icon(Icons.av_timer, color: Colors.white, size: 24,),
                  Text(
                    "  09:34 AM" ,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),

              Row(
                children: [
                  Icon(Icons.today, color: Colors.white, size: 24,),
                  Text(
                    "  Senin, 15 Maret 2024" ,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
              
              SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      "$dummy" ,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
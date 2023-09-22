import 'package:flutter/material.dart';
import 'package:vespa_apps/class/Itemvespa/item_vespa.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({Key? key, required this.place}) : super(key: key);
  final Vespa place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(place.tipe),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SubDetailVespa(place: place),
              SubListVespa(place: place),
            ],
          ),
        ),
      )),
    );
  }
}

class SubDetailVespa extends StatelessWidget {
  const SubDetailVespa({Key? key, required this.place}) : super(key: key);
  final Vespa place;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(place.image),
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(height: 10),
        Text(
          place.tipe,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(place.year,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue)),
        Text(
          place.text,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class SubListVespa extends StatelessWidget {
  const SubListVespa({Key? key, required this.place}) : super(key: key);
  final Vespa place;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vespa Lainya",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataVespa.length,
                itemBuilder: (context, index) {
                  final Vespa core = dataVespa[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreenPage(
                          place: core,
                        );
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 100,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.contain, image: AssetImage(core.image)),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Text(
                        place.tipe,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

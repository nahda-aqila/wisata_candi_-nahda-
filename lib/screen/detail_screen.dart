import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  Candi candi;

  DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // DetailHeader
          Stack(
            children: [
              //image utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),),
                ),
              ),
            ],
          ),
          // DetailInfo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                // Info atas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(candi.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                // Info tengah
                SizedBox(height: 16),
                Row(children: [
                  Icon(Icons.place, color: Colors.red,),
                  SizedBox(width: 8),
                  SizedBox(width: 70,
                    child: Text('Lokasi', style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  Text(': ${candi.location}',),
                ],),
                Row(children: [
                  Icon(Icons.calendar_month, color: Colors.blue,),
                  SizedBox(width: 8,),
                  SizedBox(width: 70,
                    child: Text('Dibangun', style: TextStyle(
                        fontWeight: FontWeight.bold),),),
                  Text(': ${candi.built}')
                ],),
                Row(children: [
                  Icon(Icons.house, color: Colors.green,),
                  SizedBox(width: 8,),
                  SizedBox(width: 70,
                    child: Text('Tipe', style: TextStyle(
                      fontWeight: FontWeight.bold,),),),
                  Text(': ${candi.type}'),
                ],),
                SizedBox(height: 16,),
                Divider(color: Colors.deepPurple.shade100,),
                SizedBox(height: 16,),
                // Info bawah
                // DetailGallery
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: Colors.deepPurple.shade100,),
                      Text(''),
                      SizedBox(height: 10,),
                      SizedBox(),
                      SizedBox(height: 4,),
                      Text('')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
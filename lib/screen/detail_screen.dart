import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;

  DetailScreen({super.key, required this.candi});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

 Future<void> _toggleFavorite() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   //Memeriksa apakah pengguna sudah sign in
   if(!isSignedIn) {
     Navigator.pushReplacementNamed(context, '/sign_in');
     return;
   }
   bool favoriteStatus = !isFavorite;
   prefs.setBool('Favorite_${widget.candi.name}', favoriteStatus);

   setState(() {
     isFavorite = favoriteStatus;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //detailheader
            Stack(
              children: [
                Image.asset('images/borobudur.jpeg'),
              ],
            ),
            //detail info
            //detailgalery
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column (
                children: [
                  //info atas (nama candi dan tombol favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.candi.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon(isSignedIn && isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: isSignedIn && isFavorite ? Colors.red : null),
                      ),
                    ],
                  ),
                  //info tengah (lokasi dibangun tipe)
                  const SizedBox(height: 16,),
                  Row(children: [
                    const Icon(Icons.place, color: Colors.red,),
                    const SizedBox(width: 8,),
                    const SizedBox(width: 70,
                      child: Text('Lokasi', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${widget.candi.location}',),
                  ],),
                  Row(children: [
                    const Icon(Icons.calendar_month, color: Colors.red,),
                    const SizedBox(width: 8,),
                    const SizedBox(width: 70,
                      child: Text('Dibangun', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${widget.candi.built}',),
                  ],),
                  Row(children: [
                    const Icon(Icons.house, color: Colors.red,),
                    const SizedBox(width: 8,),
                    const SizedBox(width: 70,
                      child: Text('Tipe', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${widget.candi.type}',),
                  ],),
                  const SizedBox(height: 16,),
                  Divider(color: Colors.deepPurple.shade100,),
                  const SizedBox(height: 16,),
                ],),),
            //detaiGallery
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100,),
                  const Text("Galeri", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.candi.imageUrls.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: widget.candi.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context,url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Text("Tap untuk memperbesar", style: TextStyle(
                    fontSize: 12, color:  Colors.black54,
                  ),),
                ],
              ),

            )
          ],),
      ),);
  }
}
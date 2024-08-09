import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class BusinessSearchScreen extends StatefulWidget {
  @override
  _BusinessSearchScreenState createState() => _BusinessSearchScreenState();
}

class _BusinessSearchScreenState extends State<BusinessSearchScreen> {
  final String apiKey =
      'AIzaSyA7ze1Lv1pJiagsOhv-cNzJPBC3Tqj3jF4'; // Replace with your API Key
  final String textSearchUrl =
      'https://maps.googleapis.com/maps/api/place/textsearch/json';
  final String placeDetailsUrl =
      'https://maps.googleapis.com/maps/api/place/details/json';
  final String photoUrl = 'https://maps.googleapis.com/maps/api/place/photo';

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _placesDetails = [];
  bool _isLoading = false;

  // Coordinates for Kolkata
  final double _latitude = 22.5726;
  final double _longitude = 88.3639;

  // Fetch places based on text query and location
  Future<List<Map<String, dynamic>>> fetchPlaces(String query) async {
    final response = await http.get(
      Uri.parse(
          '$textSearchUrl?query=$query&location=$_latitude,$_longitude&radius=5000&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((place) => place as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }

  int imgindex = 0;
  // Fetch Place Details using Place ID
  Future<Map<String, dynamic>> fetchPlaceDetails(String placeId) async {
    final response = await http.get(
      Uri.parse(
          '$placeDetailsUrl?place_id=$placeId&fields=formatted_phone_number,formatted_address,name,website,photos&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final placeDetails = data['result'];
      final List<String> photoUrls = [];
      if (placeDetails['photos'] != null && placeDetails['photos'].isNotEmpty) {
        for (var photo in placeDetails['photos']) {
          final photoReference = photo['photo_reference'];
          final photoUrlRequest =
              '$photoUrl?maxwidth=400&photoreference=$photoReference&key=$apiKey';
          photoUrls.add(photoUrlRequest);
        }
      }

      // Include photo URLs in place details
      placeDetails['photo_urls'] = photoUrls;
      return placeDetails;
    } else {
      throw Exception('Failed to load place details');
    }
  }

  // Combined method to fetch and display places details
  void _searchBusiness() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Input Error'),
          content: Text('Please enter a search query.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final places = await fetchPlaces(query);

      final details = await Future.wait(
        places.map((place) async {
          final placeId = place['place_id'];
          if (placeId != null) {
            return await fetchPlaceDetails(placeId);
          }
          return null;
        }).where((detail) => detail != null),
      );

      setState(() {
        _placesDetails = details.cast<Map<String, dynamic>>();
      });
    } catch (e) {
      print(e);
      // Handle error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch data. Please try again later.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _isHovered = false;

  Widget exportButton(Widget button) {
    return Container(
      child: Card(child: button),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Google My Business Extractor(GMB)',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    decoration: ColorPage.decoration1,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Enter business name or query',
                        filled: true,
                        fillColor: ColorPage.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 7, 22, 45)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 7, 22, 45)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 7, 22, 45)),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: InkWell(
                        onTap: () {
                          _searchBusiness();
                        },
                        child: Card(
                          margin: EdgeInsets.all(0),
                          elevation: ColorPage.elevation,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _isHovered
                                  ? ColorPage.buttoncolor1
                                  : Colors.green,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    color: ColorPage.white)
                                : Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: ColorPage.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_placesDetails.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Export your data(excel,pdf,csv...)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: exportButton(
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(15)),
                            backgroundColor: MaterialStatePropertyAll(
                                ColorPage.smallbuttoncolor),
                            shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // createExcel();
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Excel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: exportButton(
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(15)),
                            backgroundColor: MaterialStatePropertyAll(
                                ColorPage.smallbuttoncolor),
                            shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // createPdf();
                          },
                          icon: Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Pdf',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    exportButton(
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                          backgroundColor: MaterialStatePropertyAll(
                              ColorPage.smallbuttoncolor),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // createCsv();
                        },
                        icon: Icon(
                          Icons.dataset,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Csv',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 0,
                ),
                child: Container(
                  color: ColorPage.red,
                  // decoration: decoration,
                  // color: Color.fromARGB(255, 19, 7, 240),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Flexible(
                      //   flex: 1,
                      //   child: Card(
                      //     elevation: ColorPage.elevation,
                      //     child: Container(
                      //         decoration: ColorPage.decoration,
                      //         alignment: Alignment.center,
                      //         // width: 200,
                      //         padding: EdgeInsets.all(8),
                      //         child: Text(
                      //           'Image',
                      //           style: TextStyle(
                      //               color: ColorPage.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 20),
                      //         )),
                      //   ),
                      // ),

                      Flexible(
                        flex: 2,
                        child: Card(
                          elevation: ColorPage.elevation,
                          child: Container(
                              decoration: ColorPage.decoration,
                              alignment: Alignment.center,
                              // width: 200,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Business Name',
                                style: TextStyle(
                                    color: ColorPage.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),

                      Flexible(
                        flex: 2,
                        child: Card(
                          elevation: 10,
                          child: Container(
                              decoration: ColorPage.decoration,
                              // color: ColorPage.buttoncolor1,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              // width: 200,
                              child: Text(
                                'Business Address',
                                style: TextStyle(
                                    color: ColorPage.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Card(
                          elevation: 10,
                          child: Container(
                              decoration: ColorPage.decoration,
                              // color: ColorPage.buttoncolor1,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              // width: 200,
                              child: Text(
                                'Phone No',
                                style: TextStyle(
                                    color: ColorPage.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      // Flexible(
                      //   flex: 1,
                      //   child: Card(
                      //     elevation: 10,
                      //     child: Container(
                      //         decoration: ColorPage.decoration,
                      //         // color: ColorPage.buttoncolor1,
                      //         padding: EdgeInsets.all(8),
                      //         alignment: Alignment.center,
                      //         // width: 200,
                      //         child: Text(
                      //           'Email Address',
                      //           style: TextStyle(
                      //               color: ColorPage.white,
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold),
                      //         )),
                      //   ),
                      // ),

                      Flexible(
                        flex: 1,
                        child: Card(
                          elevation: 10,
                          child: Container(
                              decoration: ColorPage.decoration,
                              // color: ColorPage.buttoncolor1,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              // width: 200,
                              child: Text(
                                'Website',
                                style: TextStyle(
                                    color: ColorPage.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: _placesDetails.length,
                  itemBuilder: (context, index) {
                    final details = _placesDetails[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.3),
                          ),
                          // color:
                          //     index % 2 == 0 ? Colors.pink[100] : null
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Expanded(
                            //   flex: 1,
                            //   child: details['photo_urls'] != null &&
                            //           details['photo_urls'].isNotEmpty
                            //       ? Padding(
                            //           padding: const EdgeInsets.all(10.0),
                            //           child: CachedNetworkImage(
                            //             imageUrl: details['photo_urls'][
                            //                 imgindex %
                            //                     details['photo_urls'].length],
                            //             width: 50,
                            //             height: 80,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         )
                            //       : Text('No Image'),
                            // ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: Text(
                                  details['name'] ?? 'No Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 380,
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      padding: EdgeInsets.all(8),
                                      // alignment: Alignment.center,
                                      child: Text(
                                        details['formatted_address'] ??
                                            'No Address',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _copyToClipboard(
                                            details['formatted_address']);
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        size: 15,
                                      ))
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(),
                                // padding: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: Text(
                                  '${details['formatted_phone_number'] ?? 'No Phone Number'}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(),
                                // padding: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    // if (details['website'] != null) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            '${details['website'] ?? 'No Website'}',
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 7, 22, 45),
                                            ),
                                          ),
                                        ),
                                        if (details['website'] != null) ...[
                                          IconButton(
                                              onPressed: () {
                                                final website =
                                                    details['website'];
                                                if (website != null &&
                                                    website.isNotEmpty) {
                                                  _launchURL(website);
                                                }
                                              },
                                              icon: Icon(Icons.arrow_outward)),
                                          IconButton(
                                              onPressed: () {
                                                _copyToClipboard(
                                                    details['website']);
                                              },
                                              icon: Icon(
                                                Icons.copy,
                                                size: 15,
                                              ))
                                        ]
                                      ],
                                    ),
                                    // ],
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else if (!_isLoading) ...[
              Center(
                  child: Text(
                      'No places found. Try adjusting your search parameters.')),
            ],
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}

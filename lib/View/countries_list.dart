import 'package:covid_19/services/countries_state.dart';
import 'package:covid_19/services/util/api_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search with country name",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabled: true,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: CountriesStateServices.fetchCountriesData(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.white,
                            ),
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String searchName =
                            Text(snapshot.data![index]['country']).toString();

                        if (searchController.text.isEmpty) {
                          return ListTile(
                            leading: Image(
                              width: 50,
                              image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']),
                            ),
                            title: Text(snapshot.data![index]['country']),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                          );
                        } else if (searchName
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return ListTile(
                            leading: Image(
                              width: 50,
                              image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']),
                            ),
                            title: Text(snapshot.data![index]['country']),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_instance/get_instance.dart';
import 'package:spxplorer/models/company_model.dart';
import 'package:spxplorer/widgets/small_card.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final Dio spaceXAPI = Get.find();

  Future<Company> _fetchCompany() async {
    return await this._memoizer.runOnce(() async {
      final response = await spaceXAPI.get('/company');
      if (response.statusCode == 200) {
        return Company.fromJson(response.data);
      } else {
        throw Exception('Failed to load roadster');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCompany();
  }

  var valFmt = NumberFormat.currency(symbol: "\$", name: 'USD');

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Company'),
      ),
      body: FutureBuilder<Company>(
        future: _fetchCompany(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var companyData = snapshot.data;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    companyData.summary,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Valuation',
                                style: Theme.of(context).textTheme.headline6),
                            Text(
                              valFmt.format(companyData.valuation).toString(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    //direction: Axis.horizontal,
                    children: [
                      SmallCard(
                        title: 'Vehicles',
                        cardContent: Text(
                          companyData.vehicles.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SmallCard(
                        title: 'Launch Sites',
                        cardContent: Text(
                          companyData.launchSites.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SmallCard(
                        title: 'Test Sites',
                        cardContent: Text(
                          companyData.testSites.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Key Personnel',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ListTile(
                    leading: Text('CEO'),
                    title: Text(companyData.ceo),
                  ),
                  ListTile(
                    leading: Text('CTO'),
                    title: Text(companyData.cto),
                  ),
                  ListTile(
                    leading: Text('CTO'),
                    title: Text(companyData.ctoPropulsion),
                  ),
                  ListTile(
                    leading: Text('COO'),
                    title: Text(companyData.coo),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spxplorer/services/spacexAPIState.dart';
import 'package:spxplorer/widgets/small_card.dart';

class CompanyPage extends ConsumerWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var company = watch(companyFuture);
    var valFmt = NumberFormat.currency(symbol: "\$", name: 'USD');
    return Scaffold(
      appBar: AppBar(
        title: Text('Space X'),
      ),
      body: company.when(
        data: (companyData) => SingleChildScrollView(
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
                    .bodyText1!
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
                          //companyData.valuation.toString(),
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
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('${error.toString()}')),
      ),
    );
  }
}

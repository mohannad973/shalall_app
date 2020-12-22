import 'package:flutter/material.dart';
import 'package:food_app/providers/app_info_provider.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:provider/provider.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppInfoProvider>(context, listen: false).getAppInfo();
  }

  @override
  Widget build(BuildContext context) {
    var infoProvider = Provider.of<AppInfoProvider>(context);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: detailsAppBar(
          titleText: 'terms & conditions',
          buildContext: context,
          showAction: false),
      body: infoProvider.isLoading()
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ))
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: infoProvider.termsList.length,
              itemBuilder: (context, index) => Container(
                    height: 100,
                    width: width,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            (index + 1).toString() + '. ',
                            style: TextStyle(color: Colors.amber, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: width - 60,
                              child: Text(
                                infoProvider.termsList[index].value,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  )),
    );
  }
}

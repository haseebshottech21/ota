import 'package:flutter/material.dart';
import 'package:ota/view_model/subleads_view_model.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../widgets/common/top_bar.dart';

class SubLeadDetail extends StatefulWidget {
  const SubLeadDetail({Key? key}) : super(key: key);

  @override
  State<SubLeadDetail> createState() => _SubLeadDetailState();
}

class _SubLeadDetailState extends State<SubLeadDetail> {
  Future<void> getSubLeadDetail() async {
    String leadId = ModalRoute.of(context)!.settings.arguments as String;

    final provider = Provider.of<LeadsViewModel>(context, listen: false);
    provider.fetchSubLeadDetailApi(leadId: leadId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getSubLeadDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topbar(context, 'SUB LEAD DETAIL'),
          Consumer<LeadsViewModel>(
            builder: (context, leadViewModel, _) {
              switch (leadViewModel.subLeadDetail.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.ERROR:
                  return Center(
                    child: Text(leadViewModel.subLeadDetail.message.toString()),
                  );
                case Status.COMPLETE:
                  return SubLeadDetailBody(leadsViewModel: leadViewModel);
                default:
              }
              return Container();
            },
          ),
          // SubLeadDetailBody(),
        ],
      ),
    );
  }
}

class SubLeadDetailBody extends StatelessWidget {
  final LeadsViewModel leadsViewModel;
  const SubLeadDetailBody({
    required this.leadsViewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 10,
                      //   vertical: 8,
                      // ),
                      decoration: BoxDecoration(
                        // color: const Color(0xFF3c7cbc).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(6.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF08a7dc),
                            Color(0xFF1393d0),
                          ],
                        ),
                      ),
                      child: const Text(
                        'H',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            leadsViewModel.subLeadDetail.data!.name.toString()),
                        SizedBox(height: size.height * 0.004),
                        Text(leadsViewModel.subLeadDetail.data!.email
                            .toString()),
                        SizedBox(height: size.height * 0.006),
                      ],
                    ),
                  ],
                ),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
                // SizedBox(height: size.height * 0.10),
                // Text('data'),
              ],
            ),
          );
        },
      ),
      //     ),
      //   ],
      // ),
    );
  }
}

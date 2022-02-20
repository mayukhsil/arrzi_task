import 'package:arrzitask/modules/home/bloc/home_bloc.dart';
import 'package:arrzitask/modules/home/widgets/local_widgets.dart';
import 'package:arrzitask/repository/dashboard_repository.dart';
import 'package:arrzitask/styles/app_colors.dart';
import 'package:arrzitask/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<DashboardRepository>(context),
      )..add(LoadDataEvent()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<HomeBloc,HomeState>(
            builder: (context, state){
              if(state is HomeLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is HomeLoaded){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlassmorphicContainer(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/5,
                            borderRadius: 5,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColor.appWhite.withOpacity(0.18),
                                  const Color(0xFFFFFFFF).withOpacity(0.1),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ],),
                            border: 0,
                            blur: 90,
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.5),
                                const Color(0xFFFFFFFF).withOpacity(0.5),
                              ],
                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${state.transactionModel.name}',
                                  style: AppTextStyles.s24(
                                      fontType: FontType.SEMI_BOLD),),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Budget',
                                          style: AppTextStyles.s12(
                                              fontType: FontType.MEDIUM,),),
                                        Text('\u20b9'
                                            '${state.transactionModel.budget}',
                                          style: AppTextStyles.s24(
                                              fontType: FontType.MEDIUM,),),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Spent',
                                          style: AppTextStyles.s12(
                                            fontType: FontType.MEDIUM,),),
                                        Text('\u20b9'
                                            '${state.transactionModel.spent}',
                                          style: AppTextStyles.s24(
                                            fontType: FontType.MEDIUM,),),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColor.appDarkGrey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*
                                          state.limitSpent,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColor.appPrimary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('${state.limitSpent*100}% Spent',
                                            style: AppTextStyles.s12(
                                              fontType: FontType.SEMI_BOLD,
                                              color: AppColor.appWhite,),
                                          ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text('Payment Reminders',
                          style: AppTextStyles.s18(fontType: FontType.MEDIUM),),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                              itemCount: state.paymentReminderModel.
                              paymentReminders.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: paymentReminderWidget(context,
                                      state.paymentReminderModel,index,),
                                );
                              },),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Recent Transactions',
                              style: AppTextStyles.s18(
                                  fontType: FontType.MEDIUM,),),
                            Text('View all',
                              style: AppTextStyles.s14(
                                  fontType: FontType.MEDIUM,
                                  color: AppColor.appGrey,
                              ),),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.
                          transactionModel.spends?.length ?? 0,
                          itemBuilder: (context, index){
                            // ignore: prefer_is_empty
                            if(state.
                            transactionModel.spends?.length == 0 ){
                              return
                                Text('Sorry no recent transactions available',
                                  style: AppTextStyles.s18(
                                      fontType: FontType.MEDIUM,),
                                );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: transactionDetailsWidget(context,
                                  state.transactionModel,index,),
                            );
                          },)
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

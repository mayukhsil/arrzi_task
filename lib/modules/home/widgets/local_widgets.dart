import 'package:arrzitask/models/payment_reminder_model.dart';
import 'package:arrzitask/models/transaction_model.dart';
import 'package:arrzitask/styles/app_colors.dart';
import 'package:arrzitask/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget paymentReminderWidget(BuildContext context,
    PaymentReminderModel paymentReminderModel, int index,){
  return Container(
    width: MediaQuery.of(context).
    size.width/2.8,
    height: 60,
    decoration: BoxDecoration(
      color: AppColor.appDarkGrey,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd-MM-yyyy').format(
              paymentReminderModel.paymentReminders[index].date!,),
            style: AppTextStyles.s14(fontType: FontType.MEDIUM,
              color: AppColor.appWhite,
            ),
          ),
          const SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\u20B9${paymentReminderModel.paymentReminders[index].amount}',
                style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                  color: AppColor.appWhite,
                ),
              ),
              Text(
                '${paymentReminderModel.paymentReminders[index].description}',
                style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                  color: AppColor.appPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget transactionDetailsWidget(BuildContext context,
    TransactionModel transactionModel,int index,){
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: AppColor.appDarkGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Table(
          children: [
            TableRow(
              children: [
                Text(
                  'Transaction Date: ',
                  style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                    color: AppColor.appGrey,
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yyyy').format(
                    transactionModel.spends![index].date!,
                  ),
                  style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                    color: AppColor.appWhite,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  'Transaction Amount: ',
                  style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                    color: AppColor.appGrey,
                  ),
                ),
                Text('\u20B9${transactionModel.spends![index].amount}',
                  style: AppTextStyles.s14(fontType: FontType.MEDIUM,
                    color: AppColor.appWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

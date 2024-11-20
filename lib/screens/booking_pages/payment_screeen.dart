import "package:flutter/material.dart";
import "package:makeny/extentions/colors.dart";
import "package:makeny/screens/booking_pages/success_payment.dart";
import "package:makeny/widgets/buttons.dart";
import "package:makeny/widgets/custom_texts/cusrom_texts.dart";
import "package:makeny/widgets/defualt_appbar.dart";

class PaymentScreeen extends StatefulWidget {
  const PaymentScreeen({super.key});

  @override
  State<PaymentScreeen> createState() => _PaymentScreeenState();
}

class _PaymentScreeenState extends State<PaymentScreeen> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  String? selectedPaymentMethod;

  void onGooglePayResult(paymentResult) {
    // Handle Google Pay payment result
  }

  void onCreditCardPaymentResult() {
    // Handle credit card payment result
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppbar(context, title: "تفاصيل الدفع"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        paymentMethod(
                          icon: "assets/icons/payment_logo/Visa.png",
                          cardType: "visa",
                          paymentType: selectedPaymentMethod,
                          ontap: () {
                            setState(() {
                              selectedPaymentMethod = "visa";
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        paymentMethod(
                          icon: "assets/icons/payment_logo/google pay.png",
                          cardType: "google pay",
                          paymentType: selectedPaymentMethod,
                          ontap: () {
                            setState(() {
                              selectedPaymentMethod = "google pay";
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        paymentMethod(
                          icon: "assets/icons/payment_logo/Mastercard.png",
                          cardType: "mastercard",
                          paymentType: selectedPaymentMethod,
                          ontap: () {
                            setState(() {
                              selectedPaymentMethod = "mastercard";
                            });
                          },
                        ),

                        ///
                      ],
                    ),
                  ),
                ),
              ),
              defaultButton(
                text: "استمرار",
                onTap: selectedPaymentMethod != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessPayment(),
                          ),
                        );
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentMethod({
    required String cardType,
    required String icon,
    required Function() ontap,
    required String? paymentType,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: cardType == paymentType ? mainColor50 : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    icon,
                    height: 40,
                    width: 40,
                  ),
                ),
                textNormal(
                  text: cardType,
                  textColor: cardType == paymentType ? mainColor : mainBlack,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color:
                      cardType == paymentType ? mainColor : Colors.grey[600]!,
                  width: 2,
                ),
                // borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: cardType == paymentType ? mainColor200 : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({super.key});

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSingleOtpBox(),
        _buildSingleOtpBox(),
        _buildSingleOtpBox(),
        _buildSingleOtpBox(),

      ],
    );
  }

  SizedBox _buildSingleOtpBox() {
    return SizedBox(
        height: 68,
        width: 64,
        child: TextFormField(
          onChanged: (value){
            if (value.length == 1){
              FocusScope.of(context).nextFocus();
            }
          },
          style: Theme.of(context).textTheme.headlineMedium,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
        ),
      );
  }
}

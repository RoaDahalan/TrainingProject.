import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


//    Text Fields
Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
  IconData? prefixIcon,
  IconData? suffixIcon,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    cursorColor: Color(0xFFAF8344),

    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),

      prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 25,  color: Color(0xFFAF8344),) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon , size: 25, color: Color(0xFFAF8344),) : null,


      /// BORDERS
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFE9C75E),
          width: 2,
        )
      ),

      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFAF8344),
            width: 2,
          )
      ),


      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),

    style: TextStyle(
      color: Color(0xFFAF8344),
    ),
  );
}





//     Phone number field
Widget phoneNumberField ({
  required TextEditingController controller,
  Function(String)? onChanged, // للتعامل مع التغيير
  required Function(bool)? onValidated, // للتحقق من صحة الرقم
  String initialCountryCode = 'PS',
}){
  PhoneNumber initialNumber = PhoneNumber(isoCode: initialCountryCode);

  return InternationalPhoneNumberInput(

    onInputChanged: (PhoneNumber number) {
      if (onChanged != null) {
        onChanged(number.phoneNumber ?? '');
      }
    },



    // التحقق من صحة الرقم
    onInputValidated: (bool value) {
      if (onValidated != null) onValidated(value);
    },

    selectorConfig: const SelectorConfig(
      selectorType: PhoneInputSelectorType.DROPDOWN, // شكل اختيار الدولة
      showFlags: true, //  علم الدولة
      setSelectorButtonAsPrefixIcon: true, // العلم والمقدمة على اليسار
    ),

    ignoreBlank: false,  // ممنوع ينترك فاضي
    autoValidateMode: AutovalidateMode.disabled,
    selectorTextStyle: const TextStyle(color: Colors.black),

    textFieldController: controller,   // مهمممممممممممم
    formatInput: true,
    keyboardType: TextInputType.number, // بس ارقام

    inputDecoration: InputDecoration(
      labelText: "Phone Number",


      /// BORDER
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE9C75E),
            width: 2,
          )
      ),

      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFAF8344),
            width: 2,
          )
      ),

      border: OutlineInputBorder(
       // borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFFAF8344),
          width: 2
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    ),

    // القيمة الابتدائية لرقم الهاتف
    initialValue: initialNumber,
  );
}

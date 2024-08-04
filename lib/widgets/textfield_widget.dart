import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool enabled;
  final void Function(String)? onChanged;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool autofocus;

  final bool suggestions;
  final bool isVerified;
  final bool isErrored;
  final String? error;
  final Widget? suffixWidget;
  final Widget? labelWidget;
  final BoxConstraints? suffixConstraints;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;

  final bool obscure;

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inpFormatter;
  final int? maxLength;

  const PrimaryInput(
      {Key? key,
      required this.label,
      required this.hint,
      required this.enabled,
      this.autofocus = false,
      this.onChanged,
      this.autofillHints,
      this.controller,
      this.suffixWidget,
      this.keyboardType,
      this.isVerified = false,
      this.isErrored = false,
      this.autocorrect = true,
      this.suggestions = true,
      this.obscure = false,
      this.error,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.inpFormatter,
      this.onTap,
      this.labelWidget,
      this.suffixConstraints,
      this.maxLength})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget != null
            ? labelWidget!
            : Text(
                label,
                style: TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w500, color: Colors.grey.shade800),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(8)),
          child: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                shadowColor: Colors.white,
                focusColor: Colors.white,
                textSelectionTheme: TextSelectionThemeData(
                    cursorColor: Colors.grey.shade900, selectionColor: Colors.grey.shade300, selectionHandleColor: Colors.grey.shade900)),
            child: InkWell(
              onTap: onTap ?? () {},
              child: TextFormField(
                textCapitalization: textCapitalization,
                validator: validator,
                autofocus: autofocus,
                // validator: (value) => (value == null || value.length == 0) ? 'First Name is required' : null,
                maxLength: maxLength,
                cursorColor: Colors.black,
                enabled: onTap != null ? false : enabled,
                /*    onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }, */
                autocorrect: autocorrect,
                obscureText: obscure,
                onChanged: onChanged,

                enableSuggestions: suggestions,
                autofillHints: autofillHints,
                controller: controller,
                buildCounter: null,
                keyboardType: keyboardType,
                style: const TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    // suffixIconColor: ThemeColor.get(context).secondarySuccessGreen,
                    // prefixText: '+91 | ',
                    counterText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefix: keyboardType == TextInputType.phone
                        ? const Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                                Text('+91', style: TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w500, color: Colors.black)),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Text('|',
                                        style: TextStyle(fontSize: 16, height: 24 / 16, fontWeight: FontWeight.w500, color: Color(0xffdddddd))))
                              ])
                        : null,
                    suffixIcon: suffixWidget != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              suffixWidget!,
                            ],
                          )
                        : null,
                    suffixIconConstraints: suffixConstraints ?? BoxConstraints(maxHeight: 30, maxWidth: 160, minHeight: 28, minWidth: 32),
                    counter: SizedBox.shrink(),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    filled: true,
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDC6A51), width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: Colors.white,
                    hintText: hint,
                    hintStyle: TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w400, color: Colors.grey.shade400)),
                inputFormatters: inpFormatter ?? [],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

part of com.pragmatest.app.dashboardhome.presentation.widgets;


class CommonInput extends StatefulWidget {
  const CommonInput({
    required this.onChanged,
    super.key,});
  final void Function(String)? onChanged;
  @override
  State<CommonInput> createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: TextField(
        maxLines: 1,
        onChanged: widget.onChanged,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
        ],
        decoration: InputDecoration(
          hintText: 'name_city'.tr,
          suffixIcon: const Icon(Icons.search),
          suffixIconColor: const Color(0xFFADBAE6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFFADBAE6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFF0081FF),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFFADBAE6),
              width: 1,
            ),
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFFADBAE6),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          iconColor: const Color(0xFFADBAE6),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5C6B7A),
          ),
          floatingLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFF555F83),
          ),
          errorStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFF555F83),
          ),
        ),
      ),
    );
}

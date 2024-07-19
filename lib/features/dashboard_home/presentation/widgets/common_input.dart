part of com.pragmatest.app.dashboardhome.presentation.widgets;

class CommonInput extends StatefulWidget {
  const CommonInput({
    required this.onChanged,
    super.key,
  });
  final void Function(String)? onChanged;
  @override
  State<CommonInput> createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: UILayout.small,
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
            suffixIconColor: Colors.purpleBrand[5],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UILayout.small),
              borderSide: BorderSide(
                color: Colors.purpleBrand[5]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Colors.blueBrand[30]!,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Colors.purpleBrand[5]!,
                width: 1,
              ),
            ),
            hintStyle: TextStyle(
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w400,
              color: Colors.purpleBrand[5],
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            iconColor: Colors.purpleBrand[5],
            labelStyle: TextStyle(
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w400,
              color: Colors.grey[10],
            ),
            floatingLabelStyle: TextStyle(
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w400,
              color: Colors.purpleBrand[40],
            ),
            errorStyle: TextStyle(
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w400,
              color: Colors.purpleBrand[40],
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart' hide Colors;

import '../../core/ui/colors_brand.dart';

class WarningMessage extends StatelessWidget {
  const WarningMessage({
    required this.message,
    this.padding = 16,
    this.isError = false,
    this.isSuccess = false,
    super.key,
  });
  final String message;
  final double padding;
  final bool isError;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Card(
          elevation: 0,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            tileColor: isError
                ? Colors.redBrand[10]
                : isSuccess
                    ? Colors.greenBrand[10]
                    : Colors.orangeBrand[10],
            dense: true,
            leading: Icon(
              isSuccess ? Icons.mail : Icons.warning_amber_rounded,
              color: isError
                  ? Colors.redBrand[20]
                  : isSuccess
                      ? Colors.greenBrand[20]
                      : Colors.orangeBrand[20],
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black[0],
                ),
                maxLines: 8,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      );
}

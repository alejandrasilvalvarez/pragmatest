import 'package:flutter/material.dart';

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
                ? const Color.fromARGB(255, 250, 197, 194)
                : isSuccess
                    ? Colors.green[50]
                    : Colors.orange[50],
            dense: true,
            leading: Icon(
              isSuccess ? Icons.mail : Icons.warning_amber_rounded,
              color: isError
                  ? Colors.red[200]
                  : isSuccess
                      ? Colors.green[300]
                      : Colors.orange[300],
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                maxLines: 8,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      );
}

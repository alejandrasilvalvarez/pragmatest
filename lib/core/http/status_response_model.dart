import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class Status extends Equatable {
  const Status({
    required this.code,
    required this.message,
    required this.messageDev,
    required this.status,
    this.isWarnMsg,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json['code'] ?? (json['status'] ?? '666300'),
        message: json['message'] ?? 'generic_error'.tr,
        messageDev: json['messageDev'] ?? 'generic_error'.tr,
        status: json['status'] ?? '666300',
        isWarnMsg: json['isWarnMsg'] ?? false,
      );

  final String code;
  final String message;
  final String messageDev;
  final String status;
  final bool? isWarnMsg;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'messageDev': messageDev,
        'status': status,
        'isWarnMsg': isWarnMsg,
      };

  @override
  List<Object?> get props => <Object?>[code, message, messageDev, status];

  @override
  bool get stringify => true;
}

import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailF widget.
  FocusNode? emailFFocusNode;
  TextEditingController? emailFTextController;
  String? Function(BuildContext, String?)? emailFTextControllerValidator;
  String? _emailFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordF widget.
  FocusNode? passwordFFocusNode;
  TextEditingController? passwordFTextController;
  late bool passwordFVisibility;
  String? Function(BuildContext, String?)? passwordFTextControllerValidator;
  String? _passwordFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Password must be 6 or more characters';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailFTextControllerValidator = _emailFTextControllerValidator;
    passwordFVisibility = false;
    passwordFTextControllerValidator = _passwordFTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFFocusNode?.dispose();
    emailFTextController?.dispose();

    passwordFFocusNode?.dispose();
    passwordFTextController?.dispose();
  }
}

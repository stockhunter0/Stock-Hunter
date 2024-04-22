import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  bool isPasswordMissMatch = false;

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
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for CPasswordF widget.
  FocusNode? cPasswordFFocusNode;
  TextEditingController? cPasswordFTextController;
  late bool cPasswordFVisibility;
  String? Function(BuildContext, String?)? cPasswordFTextControllerValidator;
  String? _cPasswordFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailFTextControllerValidator = _emailFTextControllerValidator;
    passwordFVisibility = false;
    passwordFTextControllerValidator = _passwordFTextControllerValidator;
    cPasswordFVisibility = false;
    cPasswordFTextControllerValidator = _cPasswordFTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFFocusNode?.dispose();
    emailFTextController?.dispose();

    passwordFFocusNode?.dispose();
    passwordFTextController?.dispose();

    cPasswordFFocusNode?.dispose();
    cPasswordFTextController?.dispose();
  }
}

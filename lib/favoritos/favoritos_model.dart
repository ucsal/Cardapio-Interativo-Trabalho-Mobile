import '/flutter_flow/flutter_flow_util.dart';
import 'favoritos_widget.dart' show FavoritosWidget;
import 'package:flutter/material.dart';

class FavoritosModel extends FlutterFlowModel<FavoritosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

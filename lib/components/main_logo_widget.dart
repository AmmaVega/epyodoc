import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLogoWidget extends StatefulWidget {
  const MainLogoWidget({Key? key}) : super(key: key);

  @override
  _MainLogoWidgetState createState() => _MainLogoWidgetState();
}

class _MainLogoWidgetState extends State<MainLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!(Theme.of(context).brightness == Brightness.dark))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Image.asset(
              'assets/images/LogosEpyClaro.png',
              width: 100,
              height: 60,
              fit: BoxFit.fitHeight,
            ),
          ),
        if (Theme.of(context).brightness == Brightness.dark)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Image.asset(
              'assets/images/LogosEpyObscuro.png',
              width: 120,
              height: 40,
              fit: BoxFit.fitHeight,
            ),
          ),
      ],
    );
  }
}

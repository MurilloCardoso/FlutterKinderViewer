import 'package:app/materials/Colors.dart';
import 'package:flutter/material.dart';

class ViewFile extends StatefulWidget {
  const ViewFile({super.key});

  @override
  State<ViewFile> createState() => _ViewFileState();
}

class _ViewFileState extends State<ViewFile> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset(0.0, 0.0);
  Offset _previousOffset = Offset(0.0, 0.0);

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
    _previousOffset = details.focalPoint;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = _previousScale * details.scale;
      _offset = details.focalPoint - (_previousOffset * _scale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsPalette.orangePrimary, actions: []),
      body: GestureDetector(
        onScaleStart: _onScaleStart,
        onScaleUpdate: _onScaleUpdate,
        child: Container(
          color: const Color.fromARGB(255, 65, 65, 65),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //viewer
              Expanded(
                child: Transform(
                  transform:
                      Matrix4.translationValues(_offset.dx, _offset.dy, 0)
                        ..scale(_scale),
                  alignment: FractionalOffset.center,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

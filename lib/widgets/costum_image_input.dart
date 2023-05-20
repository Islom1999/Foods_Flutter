import 'package:flutter/material.dart';

class CostumImageInput extends StatefulWidget {
 

  final TextEditingController imageController;
  final String label;
  CostumImageInput(
      {Key? key,
    
      required this.imageController,
      required this.label})
      : super(key: key);

  @override
  State<CostumImageInput> createState() => _CostumImageInputState();
}

class _CostumImageInputState extends State<CostumImageInput> {
  var image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: image != null && image!.isNotEmpty
                ? Image.network(image, fit: BoxFit.cover, width: 100, height: 100,)
                : const Text("Rasm Kiriting")),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: widget.label),
            controller: widget.imageController,
            onSubmitted: (value) {
              setState(() {
                image = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

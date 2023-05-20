import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/costum_image_input.dart';

class AddNewProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addNewFunction;

  const AddNewProductScreen(
      {required this.categories, required this.addNewFunction});

  static const routName = "/add-new-product";

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categoryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageUrls = TextEditingController();
  final _firstImageUrl = TextEditingController();
  final _secondImageUrl = TextEditingController();
  final _thirdImageUrl = TextEditingController();
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    categoryId = widget.categories[0].id;
  }

  void _save() {
    final title = _titleController.text;
    final desc = _descriptionController.text;
    final ingred = _ingredientsController.text;
    final price = _priceController.text;
    final prepTime = _preparingTimeController.text;
    final mainImage = _mainImageUrls.text;
    final firstImage = _firstImageUrl.text;
    final secondImage = _secondImageUrl.text;
    final thirdImage = _thirdImageUrl.text;

    final List<String> ingreds = ingred.split(",");
    final List<String> imageUrls = [mainImage, firstImage, secondImage];
    widget.addNewFunction(Meal(
        id: UniqueKey().toString(),
        title: title,
        imageUrl: imageUrls,
        description: desc,
        ingridients: ingreds,
        preparingTime: int.parse(prepTime),
        price: double.parse(price),
        categoryId: categoryId));

    Navigator.of(context).pop(true);

    if (title.isEmpty ||
        desc.isEmpty ||
        ingred.isEmpty ||
        price.isEmpty ||
        prepTime.isEmpty ||
        mainImage.isEmpty ||
        firstImage.isEmpty ||
        secondImage.isEmpty ||
        thirdImage.isEmpty) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ovqatlar"),
        actions: [IconButton(onPressed: _save, icon: Icon(Icons.save))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        child: Text(category.title),
                        value: category.id,
                      ),
                    )
                    .toList(),
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Ovqat Nomi"),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Ovqat Tarfi"),
                maxLines: 4,
                controller: _descriptionController,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText:
                        "Ovqat Tarkibi (Misol uchun: Go'sht, kartoshka...)"),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Narxi"),
                keyboardType: TextInputType.number,
                controller: _priceController,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: " Tayyorlanish Vaqti (minutda)"),
                keyboardType: TextInputType.number,
                controller: _preparingTimeController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CostumImageInput(
                  imageController: _mainImageUrls,
                  label: "Asosiy Rasm linkini kiriting"),
              SizedBox(
                height: 10,
              ),
              CostumImageInput(
                  imageController: _firstImageUrl,
                  label: "Rasm 1 linkini kiriting"),
              SizedBox(
                height: 10,
              ),
              CostumImageInput(
                  imageController: _secondImageUrl,
                  label: "Rasm 2 linkini kiriting"),
              SizedBox(
                height: 10,
              ),
              CostumImageInput(
                  imageController: _thirdImageUrl,
                  label: "Rasm 3 linkini kiriting"),
            ],
          ),
        ),
      ),
    );
  }
}

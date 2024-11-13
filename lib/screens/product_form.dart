import 'package:flutter/material.dart';
import 'package:sinar_abadi_mobile/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  String _color = "";
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          // App logo on appbar center
          child: Image.asset(
            'images/big-logo.png',
            fit: BoxFit.contain,
            height: kToolbarHeight - 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(), // Drawer Menu

      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Page Title Card
                    Container(
                      padding: const EdgeInsets.only(
                          top: 40.0, bottom: 40.0, right: 20.0, left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_box_rounded,
                            size: 48,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Register New Product',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Fill in the product details below',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Fields Card
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildInputField(
                            label: "Product Name",
                            onChanged: (value) =>
                                setState(() => _name = value!),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Product Name is required";
                              }
                              return null;
                            },
                            prefixIcon: Icons.shopping_bag_outlined,
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            label: "Description",
                            onChanged: (value) =>
                                setState(() => _description = value!),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Description is required";
                              }
                              return null;
                            },
                            prefixIcon: Icons.description_outlined,
                            maxLines: 3, // Multiline for description
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            label: "Color",
                            onChanged: (value) =>
                                setState(() => _color = value!),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Color is required";
                              }
                              return null;
                            },
                            prefixIcon: Icons.color_lens_outlined,
                          ),
                          const SizedBox(height: 16),
                          _buildInputField(
                            label: "Price",
                            onChanged: (value) => setState(
                                () => _price = int.tryParse(value!) ?? 0),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Price is required";
                              }
                              if (int.tryParse(value) == null) {
                                return "Price must be a number";
                              }
                              return null;
                            },
                            prefixIcon: Icons.attach_money_outlined,
                            keyboardType:
                                TextInputType.number, // Open numeric keyboard
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24), // Spacing

                    // Submit Button
                    SizedBox(
                      height: 54, // ✨ Taller button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green[400],
                                        size: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text('Success!'),
                                    ],
                                  ),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildDialogRow("Product Name", _name),
                                        _buildDialogRow(
                                            "Description", _description),
                                        _buildDialogRow("Color", _color),
                                        _buildDialogRow(
                                            "Price", "Rp${_price.toString()}"),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline, size: 24),
                            SizedBox(width: 8),
                            Text(
                              "Add Product",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Helper method for building consistent input fields
Widget _buildInputField({
  required String label,
  required void Function(String?) onChanged,
  required String? Function(String?) validator,
  IconData? prefixIcon,
  TextInputType? keyboardType,
  int? maxLines,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon),
      filled: true,
      fillColor: Colors.grey[50],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Color(0xFFA2D2FF),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red[300]!, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red[300]!, width: 2),
      ),
    ),
    onChanged: onChanged,
    validator: validator,
    keyboardType: keyboardType,
    maxLines: maxLines ?? 1,
  );
}

// Helper method for building dialog rows
Widget _buildDialogRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(),
      ],
    ),
  );
}

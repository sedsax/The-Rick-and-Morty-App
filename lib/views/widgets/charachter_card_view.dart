import 'package:flutter/material.dart';

class CharachterCardView extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  final String type;
  final String origin;
  const CharachterCardView(
      {super.key,
      required this.image,
      required this.name,
      required this.status,
      required this.type,
      required this.origin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    image,
                    height: 100,
                  ),
                ), // cliprrect is used to clip the image
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(name, 14, FontWeight.w500),
                      const SizedBox(height: 5),
                      _buildLabel('Köken'),
                      _buildText(origin, 12, FontWeight.normal),
                      const SizedBox(height: 5),
                      _buildLabel('Durum'),
                      _buildText('$status - $type', 12, FontWeight.normal),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

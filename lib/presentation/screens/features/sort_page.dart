import 'package:flutter/material.dart';

class SortPage extends StatefulWidget {
  const SortPage({super.key});

  @override
  State<SortPage> createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  String _selectedSort = 'popularity';
  final List<String> _selectedCategories = [];
  RangeValues _priceRange = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort & Filter'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedSort = 'popularity';
                _selectedCategories.clear();
                _priceRange = const RangeValues(0, 100);
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Sort By',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _SortChip(
                label: 'Popularity',
                selected: _selectedSort == 'popularity',
                onSelected: (selected) {
                  setState(() => _selectedSort = 'popularity');
                },
              ),
              _SortChip(
                label: 'Price: Low to High',
                selected: _selectedSort == 'price_asc',
                onSelected: (selected) {
                  setState(() => _selectedSort = 'price_asc');
                },
              ),
              _SortChip(
                label: 'Price: High to Low',
                selected: _selectedSort == 'price_desc',
                onSelected: (selected) {
                  setState(() => _selectedSort = 'price_desc');
                },
              ),
              _SortChip(
                label: 'Rating',
                selected: _selectedSort == 'rating',
                onSelected: (selected) {
                  setState(() => _selectedSort = 'rating');
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _FilterChip(
                label: 'Main Course',
                selected: _selectedCategories.contains('main_course'),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add('main_course');
                    } else {
                      _selectedCategories.remove('main_course');
                    }
                  });
                },
              ),
              _FilterChip(
                label: 'Appetizer',
                selected: _selectedCategories.contains('appetizer'),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add('appetizer');
                    } else {
                      _selectedCategories.remove('appetizer');
                    }
                  });
                },
              ),
              _FilterChip(
                label: 'Dessert',
                selected: _selectedCategories.contains('dessert'),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add('dessert');
                    } else {
                      _selectedCategories.remove('dessert');
                    }
                  });
                },
              ),
              _FilterChip(
                label: 'Beverage',
                selected: _selectedCategories.contains('beverage'),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add('beverage');
                    } else {
                      _selectedCategories.remove('beverage');
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Price Range',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 100,
            divisions: 20,
            labels: RangeLabels(
              'Rp ${(_priceRange.start * 1000).round()}',
              'Rp ${(_priceRange.end * 1000).round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _priceRange = values;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Apply filters and return to previous screen
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('Apply Filters'),
        ),
      ),
    );
  }
}

class _SortChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const _SortChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }
} 
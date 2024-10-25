import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class ResizableCountryPicker extends StatefulWidget {
  final Function(Country) onSelect;
  final CountryListThemeData countryListTheme;

  const ResizableCountryPicker({
    super.key,
    required this.onSelect,
    required this.countryListTheme,
  });

  @override
  State<ResizableCountryPicker> createState() => _ResizableCountryPickerState();
}

class _ResizableCountryPickerState extends State<ResizableCountryPicker> {
  List<Country> _countryList = [];
  List<Country> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _countryList = CountryService().getAll();
    _filteredList = _countryList;
  }

  void _filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _filteredList = _countryList.where(
          (country) {
            return country.name.toLowerCase().contains(query.toLowerCase()) ||
                country.phoneCode.contains(query);
          },
        ).toList();
      });
    } else {
      setState(() {
        _filteredList = _countryList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: Container(
          height: widget.countryListTheme.bottomSheetHeight,
          width: widget.countryListTheme.bottomSheetWidth,
          decoration: BoxDecoration(
            color: widget.countryListTheme.backgroundColor,
            borderRadius: widget.countryListTheme.borderRadius,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: widget.countryListTheme.inputDecoration,
                  onChanged: _filterSearchResults,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    final country = _filteredList[index];
                    return ListTile(
                      leading: Text(
                        country.flagEmoji,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      title: Text(
                        country.name,
                      ),
                      trailing: Text(
                        "+${country.phoneCode}",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      onTap: () {
                        widget.onSelect(country);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

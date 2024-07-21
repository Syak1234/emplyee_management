import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Flexible buildMultipleCheckBoxDropdownSearch(
    {required String hintText,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
    required Widget checkbox,
    required int flex}) {
  final TextEditingController _dropdownSearchFieldController =
      TextEditingController();

  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  return Flexible(
    flex: flex,
    child: Container(
      // height: 50,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isSmallScreen = width < 600;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              // height: 200,
              decoration: ColorPage.decoration1,
              // padding:
              //     isSmallScreen ? EdgeInsets.all(8.0) : EdgeInsets.all(16.0),
              child: DropDownSearchFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: hintText,
                    filled: true,
                    fillColor: ColorPage.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.black),
                    ),
                  ),
                  controller: _dropdownSearchFieldController,
                ),
                suggestionsCallback: (pattern) {
                  return getSuggestions(pattern, items);
                },
                itemBuilder: (context, String suggestion) {
                  return SizedBox(
                    // height: 300,
                    child: ListTile(
                      leading: checkbox,
                      title: Text(
                        overflow: TextOverflow.ellipsis,
                        suggestion,
                        style: TextStyle(),
                      ),
                    ),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 1,
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (String suggestion) {
                  _dropdownSearchFieldController.text = suggestion;
                  onChanged(suggestion);
                },
                suggestionsBoxController: suggestionBoxController,
                validator: validator,
                displayAllSuggestionWhenTap: true,
              ),
            ),
          );
        },
      ),
    ),
  );
}

List<String> getSuggestions(
  String query,
  List<String> items,
) {
  List<String> matches = <String>[];
  matches.addAll(items);

  matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  return matches;
}

import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';

Flexible buildMultipleCheckBoxDropdownSearch({
  required String hintText,
  required List<String> items,
  required void Function(List<String>) onChanged,
  required String? Function(List<String?>?) validator,
  required int flex,
  required TextEditingController dropdownSearchFieldController,
}) {
  List<String> selectedItems = []; // Track selected items
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  return Flexible(
    flex: flex,
    child: Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 7, 22, 45)),
                borderRadius: BorderRadius.circular(5),
                color: ColorPage.white,
              ),
              child: DropDownSearchFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: hintText,
                    filled: true,
                    fillColor: ColorPage.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color.fromARGB(255, 7, 22, 45),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color.fromARGB(255, 7, 22, 45),
                      ),
                    ),
                  ),
                  controller: dropdownSearchFieldController,
                ),
                suggestionsCallback: (pattern) {
                  // Show suggestions only if fewer than 2 items are selected
                  return selectedItems.length < 2
                      ? getSuggestions(pattern, items)
                      : [];
                },
                itemBuilder: (context, dynamic suggestion) {
                  // Cast suggestion to String
                  String item = suggestion as String;
                  return ListTile(
                    title: Text(item),
                    trailing: Checkbox(
                      value: selectedItems.contains(item),
                      onChanged: (value) {
                        if (value != null) {
                          if (value) {
                            selectedItems.add(item);
                          } else {
                            selectedItems.remove(item);
                          }
                          // Update the text in the TextFormField
                          dropdownSearchFieldController.text =
                              selectedItems.join(', ');
                          // Trigger the onChanged callback
                          onChanged(selectedItems);
                        }
                      },
                    ),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return const Divider();
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                suggestionsBoxController: suggestionBoxController,
                validator: (value) =>
                    validator(selectedItems), // Call the validator
                displayAllSuggestionWhenTap: true,
                onSuggestionSelected: (suggestion) {
                  // Check if the suggestion is already selected
                  if (!selectedItems.contains(suggestion)) {
                    // Add the selected suggestion to the list
                    selectedItems.add(suggestion);
                    // Update the text in the TextFormField
                    dropdownSearchFieldController.text =
                        selectedItems.join(', ');
                    // Trigger the onChanged callback
                    onChanged(selectedItems);
                  }
                },
              ),
            ),
          );
        },
      ),
    ),
  );
}

List<String> getSuggestions(String query, List<String> items) {
  List<String> matches = <String>[];
  matches.addAll(items);

  matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  return matches;
}

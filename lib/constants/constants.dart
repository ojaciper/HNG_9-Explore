import 'package:flutter/material.dart';

const String baseUrl = "https://restcountries.com/v3.1/all";

const Map<String, String> translationToLanguage = {
  "eng": "English",
  "ara": "Arabic",
  "bre": "Breton",
  "ces": "Czech",
  "cym": "Welsh",
  "deu": "German",
  "est": "Estonian",
  "fin": "Finnish",
  "fra": "French",
  "hrv": "Croation",
  "hun": "Hungarian",
  "ita": "Italian",
  "jpn": "Japanese",
  "kor": "Korean",
  "nld": "Dutch",
  "per": "Persion",
  "pol": "Polish",
  "por": "Portuguese",
  "rus": "Russian",
  "slk": "Slovak",
  "spa": "Spanish",
  "swe": "Swedish",
  "tur": "Turkish",
  "urd": "Urdu",
  "zho": "Chinese",
};

String groupValue = "eng";
bool isExpandedTimeZone = false, isExpandedRegion = false;

void choosenLanguage(BuildContext context, double? barSheetHeight) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          height: barSheetHeight,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            // color: Colors.red,
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Languages",
                      style: TextStyle(fontSize: 24),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.cancel),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: barSheetHeight! * 0.8,
                  child: ListView.builder(
                    itemCount: translationToLanguage.keys.length,
                    itemBuilder: (context, index) {
                      var item = translationToLanguage.keys.toList()[index];
                      var lang = translationToLanguage.values.toList()[index];
                      return RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(lang),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: item,
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value!;
                          });
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void filter(BuildContext context, double? bottomSheetHeight, bottomSheetWidth) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (context) {
      return StatefulBuilder(
          builder: (ontext, setSate) => Container(
                constraints: BoxConstraints(
                  maxHeight: bottomSheetHeight!,
                  maxWidth: bottomSheetWidth,
                  minHeight: 20,
                ),
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Filter",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.cancel),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      onExpansionChanged: (value) {},
                      title: const Text("Continent"),
                    )
                  ],
                ),
              ));
    },
  );
}

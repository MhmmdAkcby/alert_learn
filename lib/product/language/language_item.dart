enum LangaugeItem { appBarName, delete, close, alertMessage, imageZoom, demo, errorMessage }

extension LanguageItemExtension on LangaugeItem {
  String languageItemString() {
    switch (this) {
      case LangaugeItem.appBarName:
        return 'Alert Use';
      case LangaugeItem.delete:
        return 'Delete';
      case LangaugeItem.close:
        return 'Close';
      case LangaugeItem.alertMessage:
        return 'Are you sure ?';
      case LangaugeItem.imageZoom:
        return 'Image Zoom';
      case LangaugeItem.demo:
        return 'Demo';
      case LangaugeItem.errorMessage:
        return 'Error! ';
    }
  }
}

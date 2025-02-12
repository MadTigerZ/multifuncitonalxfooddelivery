import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:youtube_video_player/controllers/db_controller.dart';
import 'package:youtube_video_player/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  TextEditingController get name => _name;
  TextEditingController get number => _number;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  Future<void> addNewContact() async {
    await DBController.addContact(_name.text, _number.text).then((value) {
      clearTextFields();
    });
  }

  Future<List<Contact>> fetchContacts() async {
    _contacts = await DBController.getContacts();
    Logger().i('Contacts fetched: ${_contacts.length}');
    notifyListeners();
    return _contacts;
  }

  void clearTextFields() {
    _name.clear();
    _number.clear();
    notifyListeners();
  }

  void setTextFields(Contact contact) {
    _name.text = contact.name;
    _number.text = contact.number;
    notifyListeners();
  }

  Future<void> startUpdate(int id) async {
    DBController.updateContact(
            Contact(id: id, name: _name.text, number: _number.text))
        .then((value) {
      clearTextFields();
      notifyListeners();
    });
  }

  Future<void> deleteContact(int id) async {
    DBController.deleteContact(id);
    notifyListeners();
  }
}
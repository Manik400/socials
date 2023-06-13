import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactP {

  late List<Contact> contacts ;

  Future<void> getPermissoin() async {
    try {
      var status = await Permission.contacts.status;
      if (status.isDenied) {
        Permission.contacts.request();
      }
      contacts = (await ContactsService.getContacts()).cast<Contact>().toList();

    } catch (e) {
      print(e);
    }
  }

}


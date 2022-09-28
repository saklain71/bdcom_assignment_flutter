import 'dart:typed_data';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Contacs extends StatefulWidget {
  const Contacs({Key? key}) : super(key: key);

  @override
  State<Contacs> createState() => _ContacsState();
}

class _ContacsState extends State<Contacs> {
  List<Contact> _contacts = const [];
  String? _text;

  final _ctrl = ScrollController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await Permission.contacts.request();
      final sw = Stopwatch()..start();
      final contacts = await FastContacts.allContacts;
      sw.stop();
      _contacts = contacts;
      _text = 'Contacts: ${contacts.length}\n';
      // 'Took: ${sw.elapsedMilliseconds}ms';
    } on PlatformException catch (e) {
      _text = 'Failed to get contacts:\n${e.details}';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // set
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_text ?? ''),
          Expanded(
            child: Scrollbar(
              controller: _ctrl,
              // ignore: deprecated_member_use
              isAlwaysShown: true,
              interactive: true,
              // ignore: deprecated_member_use
              showTrackOnHover: true,
              thickness: 24,
              child: ListView.builder(
                controller: _ctrl,
                itemCount: _contacts.length,
                itemExtent: _ContactItem.height,
                itemBuilder: (_, index) =>
                    _ContactItem(contact: _contacts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  static const height = 72.0;

  final Contact contact;

  String get _subtitle {
    final phones = contact.phones.join(', ');
    final emails = contact.emails.join(', ');
    final name = contact.structuredName;
    return [
      if (phones.isNotEmpty) phones,
      if (emails.isNotEmpty) emails,
      if (name != null)
        [
          if (name.namePrefix.isNotEmpty) name.namePrefix,
          if (name.givenName.isNotEmpty) name.givenName,
          if (name.middleName.isNotEmpty) name.middleName,
          if (name.familyName.isNotEmpty) name.familyName,
          if (name.nameSuffix.isNotEmpty) name.nameSuffix,
        ].join(', '),
    ].join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListTile(
        leading: _ContactImage(contact: contact),
        title: Text(contact.displayName),
        subtitle: Text(_subtitle),
      ),
    );
  }
}

class _ContactImage extends StatefulWidget {
  const _ContactImage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  __ContactImageState createState() => __ContactImageState();
}

class __ContactImageState extends State<_ContactImage> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) => SizedBox(
        width: 56,
        height: 56,
        child: snapshot.hasData
            ? Image.memory(snapshot.data!, gaplessPlayback: true)
            // ignore: prefer_const_constructors
            : Icon(Icons.account_box_rounded),
      ),
    );
  }
}

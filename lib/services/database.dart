import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/location.dart';
//import 'package:my_app/models/location.dart';

class DataBaseService {
  final CollectionReference usersCollection =
      Firestore.instance.collection('locations');

  DataBaseService();

  Future setUserData(Location location) async {
    return await usersCollection.document(location.name).setData({
      'id': location.id,
      'name': location.name,
      'theme': location.theme,
      'description': location.description,
      'imageUrl': location.imageUrl,
      'locationUrl': location.locationUrl
    });
  }

  Future updateUserData(Location location) async {
    return await usersCollection.document(location.name).setData({
      'id': location.id,
      'name': location.name,
      'theme': location.theme,
      'description': location.description,
      'imageUrl': location.imageUrl,
      'locationUrl': location.locationUrl
    });
  }

  //location list from snapshot

  List<Location> _locationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Location(
          id: doc.data['id'] ?? 0,
          name: doc.data['name'] ?? '',
          theme: doc.data['theme'] ?? '',
          description: doc.data['description'] ?? '',
          imageUrl: doc.data['imageUrl'] ?? '',
          locationUrl: doc.data['locationUrl'] ?? '');
    }).toList();
  }

  //return the no of locations
  int v;
  int getId() {
    print(usersCollection.getDocuments().then((value) {
      var count = 0;
      count = value.documents.length;
      return count;
    }));
  }

  //get loations stream
  Stream<List<Location>> get locations {
    return usersCollection.snapshots().map(_locationListFromSnapshot);
  }
}

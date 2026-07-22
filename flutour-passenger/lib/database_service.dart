// lib/database_service.dart — FluTour Passenger App
// Firestore-ready data layer with mock data
// TODO: Replace mock implementations with Firestore calls when Google account is recovered
//
// Firestore indexes needed (add in Firebase Console):
//   trips: passengerId ASC, createdAt DESC
//   trips: status ASC, createdAt DESC
//   notifications: userId ASC, createdAt DESC

import 'models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._();
  DatabaseService._();

  static final _db = FirebaseFirestore.instance;

  Future<UserModel> getProfile(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    final d = doc.data() ?? {};
    return UserModel(
      uid: uid,
      name: d['name'] ?? '',
      phone: d['phone'] ?? '',
      totalRides: d['totalRides'] ?? 0,
      createdAt: (d['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Future<void> updateProfile(String uid, {String? name, String? phone}) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phone != null) data['phone'] = phone;
    if (data.isNotEmpty) await _db.collection('users').doc(uid).update(data);
  }

  Future<void> createUserProfile(UserModel user) async {
    await _db.collection('users').doc(user.uid).set({
      'name': user.name,
      'phone': user.phone,
      'role': 'passenger',
      'totalRides': 0,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<TripModel>> getTripHistory(String uid) async {
    final snap = await _db
        .collection('trips')
        .where('passengerId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs.map((d) {
      final data = d.data();
      return TripModel(
        id: d.id,
        passengerId: data['passengerId'] ?? '',
        passengerName: data['passengerName'] ?? '',
        driverId: data['driverId'] ?? '',
        driverName: data['driverName'] ?? '',
        vehicleId: data['vehicleId'] ?? '',
        vehicleType: VehicleTypeX.fromString(data['vehicleType'] ?? 'felucca'),
        pickup: data['pickup'] ?? '',
        dropoff: data['dropoff'] ?? '',
        fare: (data['fare'] as num?)?.toDouble() ?? 0.0,
        paymentMethod: PaymentMethodX.fromString(data['paymentMethod'] ?? 'cash'),
        status: TripStatusX.fromString(data['status'] ?? 'requested'),
        passengerRating: data['passengerRating'] ?? 0,
        createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        completedAt: (data['completedAt'] as Timestamp?)?.toDate(),
      );
    }).toList();
  }

  Future<TripModel> requestTrip({
    required String passengerId,
    required String passengerName,
    required VehicleType vehicleType,
    required String pickup,
    required String dropoff,
    required double fare,
    required PaymentMethod paymentMethod,
  }) async {
    final ref = await _db.collection('trips').add({
      'passengerId': passengerId,
      'passengerName': passengerName,
      'driverId': '',
      'driverName': '',
      'vehicleId': '',
      'vehicleType': vehicleType.value,
      'pickup': pickup,
      'dropoff': dropoff,
      'fare': fare,
      'paymentMethod': paymentMethod.value,
      'status': 'requested',
      'createdAt': FieldValue.serverTimestamp(),
    });
    return TripModel(
      id: ref.id,
      passengerId: passengerId,
      passengerName: passengerName,
      driverId: '',
      driverName: '',
      vehicleId: '',
      vehicleType: vehicleType,
      pickup: pickup,
      dropoff: dropoff,
      fare: fare,
      paymentMethod: paymentMethod,
      status: TripStatus.requested,
      createdAt: DateTime.now(),
    );
  }

  Future<void> cancelTrip(String tripId) async {
    await _db.collection('trips').doc(tripId).update({'status': 'cancelled'});
  }

  Future<void> rateTrip(String tripId, int rating) async {
    await _db.collection('trips').doc(tripId)
        .update({'passengerRating': rating});
  }

  Future<List<NotificationModel>> getNotifications(String uid) async {
    final snap = await _db
        .collection('notifications')
        .where('userId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .limit(20)
        .get();
    return snap.docs.map((d) {
      final data = d.data();
      return NotificationModel(
        id: d.id,
        userId: data['userId'] ?? '',
        title: data['title'] ?? '',
        body: data['body'] ?? '',
        read: data['read'] ?? false,
        createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      );
    }).toList();
  }
}

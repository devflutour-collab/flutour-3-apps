# FluTour — 3-App Flutter Platform
**Luxor, Egypt · Felucca & Hantour Ride-Hailing**

A complete ride-hailing platform for Luxor's iconic tourist vehicles — Felucca boats and Hantour horse carriages — built with Flutter + Firebase.

---

## Apps

| Folder | App | Description |
|--------|-----|-------------|
| `flutour-passenger/` | Passenger App | Book rides, track driver, rate trips |
| `flu_tour_driver/` | Driver App | Accept trips, GPS broadcast, earnings |
| `flu_tour_admin/` | Admin Panel | Driver approval, live map, trip dashboard |

---

## Tech Stack

- **Flutter** 3.x (Android + iOS + Web)
- **Firebase** — Auth, Firestore, Realtime Database, FCM
- **flutter_map** + MapTiler Streets tiles
- **Geolocator** — GPS & location services

## Firebase Project

Project ID: `flutour-dev`
Firestore rules: `firestore.rules` (deployed via Firebase CLI)

---

## Progress — Day 42 of ~84

| Feature | Status |
|---------|--------|
| All UI screens (25 total) | ✅ Complete |
| Firebase Auth (all 3 apps) | ✅ Complete |
| Firestore E2E booking flow | ✅ Live |
| Realtime DB GPS broadcast | ✅ Live |
| FCM push notifications | ✅ Wired (client-side) |
| Driver online/offline toggle | ✅ Live |
| Admin approve/reject drivers | ✅ Live |
| Payment gateway (Vodafone Cash / InstaPay) | 🔜 Week 8 |
| Play Store release | 🔜 Week 11 |

**Overall progress: ~78%**

---

## Test Credentials

| App | Phone | Password |
|-----|-------|----------|
| Passenger | `01012345678` | `Test1234` |
| Driver | `01111111111` | `Test1234` |

> Demo mode: Passenger `0000000000` / `demo123` · Driver `1111111111` / `demo123`

---

*Flutour · Luxor, Egypt · 2026*

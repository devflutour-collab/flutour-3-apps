# flutour

A Flutter-based passenger booking experience for Hantour and Felucca river rides.

## UX Overview

`flutour` is designed as a lightweight ride booking app with a passenger-first flow, OpenStreetMap basemap support, and mobile payment options.

Key UX screens:

1. **Passenger Selection**
   - Choose the passenger flow to access river ride booking.
   - The landing screen highlights `Hantour or Felucca` ride options.

2. **Ride Picker / Map Screen**
   - Displays a searchable ride selection interface.
   - Uses `flutter_map` with OpenStreetMap tiles to show the river route without requiring a Google Maps API key.
   - Includes featured ride cards and recommended Felucca/Hantour options.

3. **Ride Details**
   - Select a vehicle or boat option and review details before checkout.
   - The UI is built to reflect a booking experience for passenger-only river transport.

4. **Payment Selection**
   - Choose between:
     - `Cash`
     - `Credit Card`
     - `Mobile Wallet`
   - Each option routes to its own payment screen.

5. **Mobile Wallet Payment**
   - Provides a wallet provider dropdown.
   - Includes a mobile number input field for wallet-based confirmation.
   - Supports a payment confirmation flow suited for mobile wallet use cases.

6. **Confirmation**
   - Shows a final confirmation screen after payment.
   - Confirms the booking and selected payment method.

## Features

- Passenger-only booking flow
- Hantour and Felucca ride terminology throughout the UX
- OpenStreetMap-based map view for no-key map rendering
- Multiple payment methods with wallet integration fields
- Simple, app-style booking and confirmation experience

## Getting Started

From the `flu_tour_apk` directory:

```bash
../bin/flutter pub get
../bin/flutter build apk --debug
```

The debug APK is generated at:

```bash
build/app/outputs/flutter-apk/app-debug.apk
```

## Notes

- The app package is renamed to `flutour`.
- Android and iOS display names were updated to `flutour`.
- The UX is intended for a lightweight river ride booking flow with quick passenger access and payment selection.

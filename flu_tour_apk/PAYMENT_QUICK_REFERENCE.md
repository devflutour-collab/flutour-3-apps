# Payment System - Quick Reference

## Payment Flows

### 1. Credit Card Payment Flow
```
Payment Selection Screen
    ↓ (Select "Credit Card")
Credit Card Payment Screen
    ├─ Card Preview (Real-time updates)
    ├─ Card Number Input (16 digits)
    ├─ Holder Name Input
    ├─ Expiry Date Input (MM/YY)
    ├─ CVV Input (3 digits)
    ├─ Price Summary
    └─ Pay Button
        ↓
    Payment Processing (2s animation)
        ↓
    Success Dialog
        ↓
    Home Screen
```

### 2. Cash Payment Flow
```
Payment Selection Screen
    ↓ (Select "Cash")
Cash Payment Screen
    ├─ Payment Method Info
    ├─ Trip Details Display
    ├─ Total Amount ($12.00)
    ├─ Payment Instructions
    ├─ Terms Agreement Checkbox
    └─ Confirm Booking Button
        ↓
    Success Dialog with Confirmation
        ↓
    Home Screen
```

### 3. Paymob Payment Flow
```
Payment Selection Screen
    ↓ (Select "Paymob")
Paymob Payment Screen
    ├─ Gateway Information
    ├─ Payment Summary
    ├─ Security Notice (SSL)
    └─ Pay with Paymob Button
        ↓
    Payment Processing (2s animation)
        ↓
    Success Dialog
        ↓
    Home Screen
```

## Trip Pricing
- Ride Price: $10.00
- Service Fee: $2.00
- **Total: $12.00**

## Card Input Specifications

### Card Number
- **Length:** 16 digits
- **Format:** 1234 5678 9012 3456
- **Validation:** Must be exactly 16 digits
- **Display:** Real-time formatted display on card preview

### Card Holder Name
- **Format:** Full name (any characters)
- **Validation:** Required, non-empty
- **Display:** Uppercase on card preview

### Expiry Date
- **Format:** MM/YY (e.g., 12/25)
- **Validation:** Must contain "/" and be MM/YY format
- **Auto-format:** "/" added automatically after 2 digits

### CVV
- **Length:** 3 digits
- **Format:** 123
- **Validation:** Must be exactly 3 digits
- **Security:** Masked on card preview

## Test Card Numbers

You can use these test card numbers for testing:

| Card Type | Number | Status |
|-----------|--------|--------|
| Visa | 4532 1111 1111 1111 | Valid Test |
| MasterCard | 5425 2334 3010 9903 | Valid Test |
| American Express | 3782 822463 10005 | Valid Test |
| Discover | 6011 1111 1111 1117 | Valid Test |

**Note:** In demo mode, any 16-digit card number works. In production, use actual payment gateway validation.

## Validation Rules

### Credit Card Payment
- ✅ Card number is 16 digits
- ✅ Holder name is not empty
- ✅ Expiry date contains "/" and is MM/YY format
- ✅ CVV is 3 digits
- ✅ All fields must be filled

### Cash Payment
- ✅ Agreement checkbox must be checked
- ✅ Booking can proceed after agreement

### Paymob Payment
- ✅ No input validation needed
- ✅ Payment gateway handles validation

## Screens in Dart Code

| Screen Class | Purpose | File |
|-------------|---------|------|
| `PaymentScreen` | Payment method selection | lib/main.dart |
| `CreditCardPaymentScreen` | Credit card form and preview | lib/main.dart |
| `CashPaymentScreen` | Cash payment confirmation | lib/main.dart |
| `PaymobPaymentScreen` | Paymob gateway screen | lib/main.dart |

## State Management

### Payment Screen State
```dart
class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = 'Cash'; // Current selection

  // Changes when user selects a payment method
  setState(() {
    selectedPayment = method;
  });

  // Navigates when user clicks "Next"
  Navigator.push(...);
}
```

### Credit Card Screen State
```dart
class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  TextEditingController _cardNumberController;
  TextEditingController _holderNameController;
  TextEditingController _expiryController;
  TextEditingController _cvvController;
  bool _isProcessing = false;

  // Updates card preview in real-time
  onChanged: (value) {
    setState(() {});
  }
}
```

## UI Components

### Color Scheme
- **Cash:** Green (#4CAF50)
- **Credit Card:** Blue (#2196F3)
- **Paymob:** Orange (#FF9800)
- **Primary:** Black (#000000)
- **Secondary:** Gray (#757575)

### Animations
- Payment option selection: Scale animation (500ms)
- Card input updates: Real-time preview
- Payment processing: Spinner (2 second delay)
- Screen transitions: Smooth navigation

## Error Handling

### Validation Errors
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text("Error message"))
);
```

### Processing Errors
- Failed validation shows SnackBar
- User can correct and retry
- Payment processing simulation takes 2 seconds

## Success Flow

After successful payment:
1. Processing animation shows for 2 seconds
2. Success dialog displays booking confirmation
3. User clicks "OK" in dialog
4. App navigates back to home screen using `popUntil((route) => route.isFirst)`

## Integration Points for Real Payments

To connect to real payment providers:

### Credit Card (Stripe, Square, etc.)
```dart
// Replace simulated payment with:
final response = await paymentGateway.processCard(
  cardNumber: _cardNumberController.text,
  expiryDate: _expiryController.text,
  cvv: _cvvController.text,
  amount: 12.00,
);
```

### Cash (Backend confirmation)
```dart
// Notify backend of cash payment booking
await bookingService.createCashPaymentBooking(
  vehicleId: widget.vehicleId,
  amount: 12.00,
);
```

### Paymob
```dart
// Initialize Paymob SDK and process payment
final paymobResponse = await PaymobService.processPayment(
  amount: 12.00,
  orderId: orderId,
);
```

## Development Tips

1. **Testing Validation:**
   - Try incomplete card numbers
   - Try invalid expiry formats
   - Try non-matching CVV lengths

2. **Testing UI:**
   - Watch real-time card preview updates
   - Check color highlighting for selected methods
   - Verify animations smooth and timely

3. **Testing Navigation:**
   - Verify back button works at each step
   - Verify success dialog closes properly
   - Verify home screen is reached after booking

4. **Testing on Device:**
   ```bash
   flutter run -d <device_id>
   ```

5. **Testing on Emulator:**
   ```bash
   flutter emulators --launch <emulator_name>
   flutter run
   ```

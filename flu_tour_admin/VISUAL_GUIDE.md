# FluTour Payment System - Visual Guide

## 🎨 UI Preview

### Payment Method Selection Screen
```
┌─────────────────────────────────┐
│         ← Payment              │
├─────────────────────────────────┤
│                                 │
│  Select Payment Method          │
│                                 │
│  ┌──────────────────────────┐  │
│  │ 💵 Cash                  │  │
│  │                  ✓ (if selected)
│  └──────────────────────────┘  │
│                                 │
│  ┌──────────────────────────┐  │
│  │ 💳 Credit Card           │  │
│  │                          │  │
│  └──────────────────────────┘  │
│                                 │
│  ┌──────────────────────────┐  │
│  │ 📊 Paymob               │  │
│  │                          │  │
│  └──────────────────────────┘  │
│                                 │
│          ┌─────────────┐        │
│          │    Next     │        │
│          └─────────────┘        │
└─────────────────────────────────┘
```

### Credit Card Payment Screen
```
┌─────────────────────────────────┐
│      ← Credit Card Payment      │
├─────────────────────────────────┤
│                                 │
│  ┌───────────────────────────┐ │
│  │ 💳 ╔═══════════════════╗  │ │
│  │    ║ •••• •••• •••• •••║ │ │
│  │    ║                    ║ │ │
│  │    ║  YOUR NAME  12/25  ║ │ │
│  │    ║              •••   ║ │ │
│  │    ╚═══════════════════╝  │ │
│  └───────────────────────────┘ │
│                                 │
│  Card Number                    │
│  [████ ████ ████ ████      ]    │
│                                 │
│  Card Holder Name               │
│  [Full Name                ]    │
│                                 │
│  Expiry Date      CVV           │
│  [MM/YY]          [123]         │
│                                 │
│  ┌───────────────────────────┐ │
│  │ Ride Price:        $10.00 │ │
│  │ Service Fee:       $2.00  │ │
│  │ Total:             $12.00 │ │
│  └───────────────────────────┘ │
│                                 │
│        ┌────────────────┐       │
│        │ Pay $12.00     │       │
│        └────────────────┘       │
└─────────────────────────────────┘
```

### Cash Payment Screen
```
┌─────────────────────────────────┐
│       ← Cash Payment            │
├─────────────────────────────────┤
│                                 │
│  💵 Cash Payment                │
│  You will pay cash at the       │
│  end of your ride.              │
│                                 │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│  Trip Details                   │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│                                 │
│  Vehicle Type:  Horse Carriage │
│  Vehicle ID:    H062            │
│  Ride Price:    $10.00          │
│  Service Fee:   $2.00           │
│  ─────────────────────          │
│  Total:         $12.00          │
│                                 │
│  ℹ️ Payment Instructions:        │
│  • Driver will confirm amount   │
│  • Pay upon completion          │
│  • Keep receipt                 │
│                                 │
│  ☐ I agree to pay $12.00        │
│                                 │
│    ┌──────────────────┐         │
│    │ Confirm Booking  │         │
│    └──────────────────┘         │
└─────────────────────────────────┘
```

### Paymob Payment Screen
```
┌─────────────────────────────────┐
│     ← Paymob Payment            │
├─────────────────────────────────┤
│                                 │
│  📊 Paymob Payment Gateway      │
│  Secure payment via Paymob's    │
│  trusted platform               │
│                                 │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│  Payment Summary                │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │
│                                 │
│  Vehicle Type:  Felucca         │
│  Vehicle ID:    F072            │
│  Ride Price:    $10.00          │
│  Service Fee:   $2.00           │
│  Total:         $12.00          │
│                                 │
│  🔒 Your payment is secured     │
│     with SSL encryption         │
│                                 │
│    ┌──────────────────┐         │
│    │ Pay with Paymob  │         │
│    └──────────────────┘         │
└─────────────────────────────────┘
```

---

## 🗺️ Google Maps Screen
```
┌─────────────────────────────────┐
│    ← Back      Map Picker    ≡  │
├─────────────────────────────────┤
│                                 │
│  ┌───────────────────────────┐ │
│  │                           │ │
│  │  ╭───────────────────╮   │ │
│  │  │   Google Map      │   │ │
│  │  │   • Zoom Controls │   │ │
│  │  │   • Compass       │   │ │
│  │  │   • My Location   │   │ │
│  │  │   📍 Luxor, Egypt │   │ │
│  │  │   (Blue Marker)   │   │ │
│  │  ╰───────────────────╯   │ │
│  │                           │ │
│  │  🧭 [compass] ↻ [+] [-]  │ │
│  └───────────────────────────┘ │
│                                 │
│  ┌───────────────────────────┐ │
│  │ Pickup point              │ │
│  │ [Hotel, your location...] │ │
│  │                           │ │
│  │ Drop off point            │ │
│  │ [Hotel, your location...] │ │
│  │                           │ │
│  │ Pickup Time               │ │
│  │ [20:00 PM]                │ │
│  │                           │ │
│  │ Pickup Date               │ │
│  │ [DD/MM/YYYY]              │ │
│  │                           │ │
│  │        ┌──────────┐       │ │
│  │        │  Next    │       │ │
│  │        └──────────┘       │ │
│  └───────────────────────────┘ │
└─────────────────────────────────┘
```

---

## 📊 Flow Diagrams

### Complete Booking Flow
```
                    Welcome Screen
                         ↓
                  Role Selection
                         ↓
                    Login Screen
                         ↓
                   Location Screen
                         ↓
              Map Picker Screen ⭐
              (Enhanced with Maps)
                         ↓
              Vehicle Selection Screen
                         ↓
                Ride Details Screen
                         ↓
            Payment Selection Screen ⭐
            (Choose Payment Method)
                    ↙    ↓    ↘
            Cash  Credit  Paymob
             ↓    Card    ↓
             ↓     ↓      ↓
    CashPayment CreditCard PaymobPayment
    Screen ⭐   Screen ⭐  Screen ⭐
             ↓     ↓      ↓
        ┌──────────┴──────┴──────┐
        ↓                        ↓
    Confirmation Dialog    (Same for all)
        ↓                        ↓
    Success Message         Back to Home
```

### Credit Card Validation Flow
```
User Input
    ↓
Card Number (1-16 digits)
    ├─ Real-time format: •••• •••• •••• ••••
    ├─ Preview updates live on card
    └─ Validation: Must be 16 digits
        ↓
Card Holder Name
    ├─ Real-time display: UPPERCASE on card
    └─ Validation: Required, non-empty
        ↓
Expiry Date (MM/YY)
    ├─ Auto-format: Adds "/" after 2 digits
    └─ Validation: MM/YY format required
        ↓
CVV (3 digits)
    ├─ Real-time masked: •••
    └─ Validation: Must be 3 digits
        ↓
All Valid?
    ├─ NO → Show SnackBar Error → User Corrects
    └─ YES ↓
    Click Pay Button
        ↓
    Process Payment (2 second animation)
        ↓
    Success Dialog
```

### Payment Method Selection Logic
```
Payment Screen Opens
    ↓
Display 3 Options:
┌─────────────┬─────────────┬──────────────┐
│    Cash     │ Credit Card │   Paymob     │
│   Green     │    Blue     │   Orange     │
└─────────────┴─────────────┴──────────────┘
    ↓
User Selects Method
    │
    ├─ Cash → CashPaymentScreen
    │   • Display trip details
    │   • Show instructions
    │   • Request agreement
    │   • Confirm booking
    │
    ├─ Credit Card → CreditCardPaymentScreen
    │   • Show card preview
    │   • Collect card details
    │   • Validate inputs
    │   • Process payment
    │
    └─ Paymob → PaymobPaymentScreen
        • Show gateway info
        • Display security info
        • Process payment
```

---

## 🎨 Color Theme

### Payment Methods
```
┌──────────────────────────────────────────────┐
│ Method       │ Color        │ Usage          │
├──────────────┼──────────────┼────────────────┤
│ Cash         │ Green        │ Background,    │
│              │ #4CAF50      │ Text, Buttons  │
├──────────────┼──────────────┼────────────────┤
│ Credit Card  │ Blue         │ Background,    │
│              │ #2196F3      │ Card, Buttons  │
├──────────────┼──────────────┼────────────────┤
│ Paymob       │ Orange       │ Background,    │
│              │ #FF9800      │ Buttons        │
├──────────────┼──────────────┼────────────────┤
│ Primary      │ Black        │ Action buttons │
│              │ #000000      │ Text           │
├──────────────┼──────────────┼────────────────┤
│ Secondary    │ Gray         │ Disabled,      │
│              │ #757575      │ Secondary text │
└──────────────┴──────────────┴────────────────┘
```

### Card Preview Gradient
```
╔═══════════════════════════════╗
║ 💳                            ║
║ (Gradient Blue 700 → 500)     ║
║ •••• •••• •••• ••••           ║
║                               ║
║ YOUR NAME        12/25   •••  ║
║ (All White Text)              ║
╚═══════════════════════════════╝
```

---

## 🔄 State Changes Animation

### Credit Card Preview Update
```
User types: 4532
    ↓
Card display: 4532 •••• •••• ••••
    (Updates instantly with setState)

User types more: 45321111111
    ↓
Card display: 4532 1111 1111 •••

User types: 453211111111111111
    ↓
Card display: 4532 1111 1111 1111
    (Complete, validation passes)
```

### Payment Processing Animation
```
User clicks "Pay $12.00"
    ↓
Button replaced with CircularProgressIndicator
    (Loading spinner)
    ↓
After 2 seconds
    ↓
Spinner removed, Success Dialog shown
    ↓
User clicks OK
    ↓
Navigate to home screen
```

---

## 📱 Responsive Layouts

### Portrait Mode (Standard)
```
Full screen width: 412dp
Padding: 20dp left/right

┌──────────────────────────────┐
│        Header (40dp)         │
├──────────────────────────────┤
│                              │
│    Content (372dp wide)      │
│                              │
│    - All elements centered   │
│    - Single column layout    │
│    - Full width buttons      │
│                              │
└──────────────────────────────┘
```

### Landscape Mode (Adaptive)
```
Full screen width: 728dp
Padding: 20dp left/right

┌─────────────────────────────────────────┐
│              Header (40dp)              │
├──────────────────┬──────────────────────┤
│                  │                      │
│ Form Section     │ Summary Section      │
│ (340dp)          │ (360dp)              │
│                  │                      │
│ - Left aligned   │ - Right aligned      │
│ - Input fields   │ - Price breakdown    │
│                  │ - Buttons            │
│                  │                      │
└──────────────────┴──────────────────────┘
```

---

## 🎯 User Interaction Points

### Credit Card Screen
```
┌─ Card Number Input
│  ├─ On Focus: Show keyboard
│  ├─ On Type: Update preview
│  ├─ On Blur: Validate length
│  └─ Max Length: 16 digits
│
├─ Holder Name Input
│  ├─ On Type: Update card preview (uppercase)
│  ├─ On Blur: Validate non-empty
│  └─ Any characters allowed
│
├─ Expiry Input
│  ├─ On Type: Auto-format with "/"
│  ├─ On Blur: Validate MM/YY format
│  └─ Max Length: 5 (MM/YY)
│
├─ CVV Input
│  ├─ On Type: Mask display
│  ├─ On Blur: Validate 3 digits
│  └─ Max Length: 3
│
└─ Pay Button
   ├─ On Click: Validate all fields
   ├─ Show errors if invalid
   ├─ Show loading if valid
   └─ Show success after 2s
```

### Cash Screen
```
┌─ Checkbox
│  ├─ On Click: Toggle state
│  └─ Updates button enabled state
│
└─ Confirm Button
   ├─ Enabled only when checked
   ├─ On Click: Show confirmation
   └─ On Confirm: Navigate home
```

---

## 📈 Animation Timeline

### Credit Card Preview
```
Timeline: 0ms ─────────────── 500ms+
Action:   Input           Update
         ↓                  ↓
State:   _cardNumberController changes
         setState() called
         Widget rebuilds with new text
         Card preview updates instantly
```

### Payment Processing
```
Timeline: 0ms ──── 100ms ──── 2000ms ──── 2100ms
         ↓         ↓            ↓          ↓
State:   Button   Spinner     Spinner    Dialog
         Click    Shows      Completes   Shows

Visual:  Pay $12   ⟳          ✓         Success!
```

---

## 🏗️ Widget Structure

### CreditCardPaymentScreen Widget Tree
```
CreditCardPaymentScreen (StatefulWidget)
├─ Scaffold
│  ├─ AppBar
│  │  ├─ Leading (Back button)
│  │  └─ Title
│  └─ Body (SingleChildScrollView)
│     └─ Column
│        ├─ Card Preview Container
│        │  ├─ Gradient Background
│        │  ├─ Icon
│        │  ├─ Card Number Display
│        │  └─ Card Details Row
│        ├─ Inputs Section
│        │  ├─ Card Number TextField
│        │  ├─ Holder Name TextField
│        │  ├─ Row
│        │  │  ├─ Expiry TextField
│        │  │  └─ CVV TextField
│        ├─ Price Summary Container
│        │  └─ Summary Rows
│        └─ Action Section
│           ├─ Pay Button or CircularProgressIndicator
│           └─ Spacer
```

---

## 📊 Data Flow

### Credit Card Processing
```
User Input
    ↓
TextEditingController
    ↓
setState() triggered
    ↓
Widget rebuild
    ↓
Card preview updates
+
Validation state changes
    ↓
User clicks Pay
    ↓
_validateAndPay()
    ├─ Check card number (16 digits)
    ├─ Check holder name (non-empty)
    ├─ Check expiry (MM/YY format)
    └─ Check CVV (3 digits)
    ↓
If valid:
    ├─ setState(_isProcessing = true)
    ├─ Show loading spinner
    ├─ Simulate 2 second payment
    └─ Show success dialog
    ↓
If invalid:
    └─ Show SnackBar error
```

---

## 🎯 Success States

### Credit Card Success
```
AlertDialog:
┌─────────────────────┐
│ Payment Successful  │
│                     │
│ Your [vehicle type] │
│ ([vehicle ID]) has  │
│ been booked         │
│ successfully!       │
│                     │
│ Trip Total: $12.00  │
│                     │
│    ┌─────────┐      │
│    │    OK   │      │
│    └─────────┘      │
└─────────────────────┘
        ↓
    Navigate back to home
```

### Cash Success
```
AlertDialog:
┌─────────────────────┐
│ Booking Confirmed   │
│                     │
│ Your [vehicle type] │
│ ([vehicle ID]) has  │
│ been booked         │
│ successfully!       │
│                     │
│ Payment: $12.00     │
│ (Cash)              │
│                     │
│    ┌─────────┐      │
│    │    OK   │      │
│    └─────────┘      │
└─────────────────────┘
        ↓
    Navigate back to home
```

---

*Visual Guide Complete*
*All screens are responsive and support landscape/portrait modes*

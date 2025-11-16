### BMI Calculator

A simple BMI (Body Mass Index) calculator built with Flutter. This app allows users to input their weight and height in various metric and imperial units to calculate their BMI and see the corresponding health category.

📱 Screenshots

<!--
Add your screenshots here.
To add images in Markdown, you can drag and drop them into a GitHub comment or use this syntax:
-->

<p align="center">
<!-- Replace these with links to your actual screenshots -->
<img width="461" height="949" alt="image" src="https://github.com/user-attachments/assets/06290d1b-8d29-4117-8bb3-95314273fc31" />
&nbsp; &nbsp; &nbsp;
<img width="467" height="945" alt="Screenshot 2025-11-16 at 3 25 20 PM" src="https://github.com/user-attachments/assets/3df94a56-1241-46a3-8a5c-be7f519bd56b" />

</p>

🧮 Features & Logic

This app is built around the standard BMI formula and provides a color-coded category result for quick reference.

### 1. BMI Formula

The core BMI calculation uses the metric formula:

$$BMI = \frac{weight (kg)}{height (m)^2}$$ 

### 2\. Unit Conversions

To support both metric and imperial units, the following conversions are applied *before* the BMI calculation:

* **Weight:** `1 lb = 0.453 kg`
* **Height (cm):** `1 cm = 0.01 m`
* **Height (Feet/Inch):** The total height in meters is calculated as `(feet * 12 + inches) * 0.0254`.

This logic is implemented in `AppServices.dart` with the following functions:

```dart
static double? lbToKg (String lb) {
final kg = double.tryParse(lb);

if (kg == null || kg <=0 ){
return null;
} else {
return kg * 0.453;
}
}
```

```dart
static double? cmToM(String cmData) {
final cm = double.tryParse(cmData);
if (cm == null || cm < 0) {
//ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Data')));
return null;
} else {
return cm / 100.0;
}
}
```

```dart
static double? feetInchToM (String feetData, String inchData) {
final feet = double.tryParse(feetData);
final inch = double.tryParse(inchData);

if (feet == null || feet < 0 || inch == null || inch < 0) {
return null;
} else {
final totalInch = (feet*12)+inch;

if (totalInch <= 0) {
return null;
}

return totalInch*0.0254;
}
}
```

### 3\. Category-to-Color Mapping

The app categorizes the resulting BMI and assigns a color based on the following logic (based on WHO categories):

| Category | BMI Range | Color |
| ----- | ----- | ----- |
| Underweight | \< 18.5 | Blue |
| Normal | 18.5–24.9 | Green |
| Overweight | 25–29.9 | Orange |
| Obese | ≥ 30 | Red |

📱 Screenshots
<p align="center">
<img width="461" height="947" alt="image" src="https://github.com/user-attachments/assets/142fc9f3-04b4-4177-a109-58dcf0481160" />
&nbsp; &nbsp; &nbsp;
<img width="469" height="947" alt="image" src="https://github.com/user-attachments/assets/26507c1f-adff-4ee7-b258-637d09586588" />
</p>

This logic is implemented in the `AppServices.dart` file with the following functions:
```dart
static String categoryResult (double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }
```

```dart
static Color categoryResultColor (double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
```

## 🚀 How to Run the App

To get a local copy up and running, follow these simple steps.

### Prerequisites

You must have the Flutter SDK installed on your machine.

* [Install Flutter](https://flutter.dev/docs/get-started/install)

### Installation

1.  **Clone the repo** (or download the source code)

<!-- end list -->

```sh
git clone [https://github.com/your-username/bmi_calculator.git](https://github.com/your-username/bmi_calculator.git)
```

2.  **Navigate to the project directory**

<!-- end list -->

```sh
cd bmi_calculator
```

3.  **Install dependencies**

<!-- end list -->

```sh
flutter pub get
```

4.  **Run the app** (Connect a device or use an emulator)

<!-- end list -->

```sh
flutter run
```

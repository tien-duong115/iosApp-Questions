# Quizzler-iOS13

An interactive quiz app built using Swift and UIKit, featuring a multiple-choice question interface with a dynamic progress bar. Users are presented with True/False questions and receive immediate feedback before moving on to the next one.

## 📱 Features

- Simple, clean quiz interface
- Real-time progress bar
- Immediate feedback with color cues (green for correct, red for incorrect)
- Logic separated using the MVC design pattern
- Option to restart the quiz at the end

## 🧠 What I Learned

- UIKit fundamentals (Buttons, Labels, Views)
- Model-View-Controller (MVC) design pattern in iOS
- Swift functions, optionals, and conditionals
- Use of `DispatchQueue.main.asyncAfter()` for UI delays
- Managing state across multiple user interactions
- Connecting storyboard elements to code with `@IBOutlet` and `@IBAction`

## 📁 Project Structure

- `ViewController.swift` – Handles UI logic and button interactions
- `Questions.swift` – Contains the model: array of questions and answers
- `QuizBrain.swift` – Business logic layer (checking answers, advancing questions)

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/Quizzler-iOS13.git

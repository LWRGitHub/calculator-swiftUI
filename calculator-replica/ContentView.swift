//
//  ContentView.swift
//  calculator-replica
//
//  Created by Logan Reynolds on 11/9/20.
//

import SwiftUI

struct CalculationState {
    var currentNumber: Double = 0
    var storedNumber: Double?
    var storedAction: CalculatorButton?
    
    mutating func appendNumber(_ number: Double){
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
            print("The current number is : \(currentNumber)")
        } else {
            currentNumber = number
        }
    }
}

enum CalculatorButton: String{
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case equals = "="
    case plus = "+"
    case minus = "-"
    case multiply = "X"
    case divide = "÷"
    case ac = "AC"
    case plusMinus = "+/-"
    case percent = "%"
    case dot = "."
    
    var backgroundColor: Color{
        switch self {
        case .equals, .plus, .minus, .multiply, . divide:
            return Color(#colorLiteral(red: 1, green: 0.5825584531, blue: 0, alpha: 1))
        case .ac, .plusMinus, .percent:
            return Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        default:
            return Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    
    func calculate(_ input1: Double, _ input2: Double) -> Double? {
        switch self {
        case .plus:
            return input1 + input2
        case .minus:
            return input1 - input2
        case .multiply:
            return input1 * input2
        case .divide:
            return input1 / input2
        default:
            return nil
        }
    }
}

struct ContentView: View {
    
    @State var state = CalculationState()
    var displayText: String{
        return String(format: "%.2f", state.currentNumber)
    }
    
    let buttonOptions: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    var total: Double = 0
    var body: some View {
        VStack(spacing:10){
            HStack{
                Spacer()
                Text(displayText)
                    .font(.largeTitle)
            }
            
            ForEach(buttonOptions, id: \.self){ row in
                HStack{
                    ForEach(row, id:\.self){ button in
                        ActionView(button: button, state: $state)
                    }
                }
            }
        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom).padding(10)
    }
    
    
    
    //    var body: some View {
    //        VStack{
    //            Text("\(total.removeZerosFromEnd())").font(.system(size: 80))
    //              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
    //              .padding(.trailing, 30)
    //            HStack{
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("AC").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.gray)
    //                    .foregroundColor(.black)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("+/-").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.gray)
    //                    .foregroundColor(.black)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("%").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.gray)
    //                    .foregroundColor(.black)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("÷").frame(width: 65, height: 65, alignment: .center)
    //                        .background(Color.orange)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //            }
    //            .padding(.bottom, 1.0)
    //            HStack{
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("7").frame(width: 65, height: 65, alignment: .center)
    //                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("8").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("9").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("X").frame(width: 65, height: 65, alignment: .center)
    //                        .background(Color.orange)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //            }
    //            .padding(.bottom, 1.0)
    //            HStack{
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("4").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("5").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("6").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("-").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.orange)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //            }
    //            .padding(.bottom, 1.0)
    //            HStack{
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("1").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("2").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("3").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("+").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.orange)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //            }
    //            .padding(.bottom, 1.0)
    //            HStack{
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("0")
    //                        .padding(.leading, 20.0)
    //                        .frame(width: 133, height: 65, alignment: .leading)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text(".").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //                Button(action: {
    //                  print("Button pressed")
    //                }, label: {
    //                    Text("=").frame(width: 65, height: 65, alignment: .center)
    //                      .background(Color.orange)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(40)
    //                        .font(.largeTitle)
    //                })
    //            }
    //            .padding(.bottom, 1.0)
    //        }
    //        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).padding(.bottom,15)
    //
    //
    //    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

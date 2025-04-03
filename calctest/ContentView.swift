
import SwiftUI

struct ContentView: View {
    //Skript
    @State var targetSkript:Double = 6000
    @State var valueSkr:Double = 6000.0
    let valueRange:ClosedRange<Double> = 100...10000
    @State var inputValueSkr: String = ""
    {
        didSet {
            convertValueSkr()
        }
    }
    @State var resultSkr:Double = 100
    
    //Video
    @State private var selectedVideoOption: VideoOption = .LVandSC
    var targetVideo:Double {
        switch selectedVideoOption {
        case .LVandSC:
            return 3000
        case .onlyLV:
            return 1500
        }
    }
    @State var valueVid:Double = 3000.0
    @State var resultVid:Double = 100
    @State var inputValueVid: String = ""
    {
        didSet {
            convertValueVid()
        }
    }
    enum VideoOption: String, CaseIterable {
        case LVandSC = "LV and SC"
        case onlyLV = "LV only"
       }
    
    //Exam
    @State private var selectedExamOption: ExamOption = .KFK
    var targetExam:Double {
        switch selectedExamOption {
        case .KFK:
            return 1500
        case .PLF:
            return 400
        }
    }
    @State var valueExam:Double = 1500.0
    @State var resultExam:Double = 100
    @State var inputValueExam: String = ""
    {
        didSet {
            convertValueExam()
        }
    }
    enum ExamOption: String, CaseIterable {
           case KFK = "KFK"
           case PLF = "PLF"
       }
    
    //Buffer
    //add 1000€ buffer to reach 100% for total cost of 11.500€?!
    
    //Result
    @State var result:Double = 100
    
    //Functions
    func convertValueSkr() {
        if let convertedValue = Double(inputValueSkr) {
            valueSkr = convertedValue
        }
        else {
            valueSkr = 0
        }
    }
    
    func calcualteResultSkr() {
        let bonusSkr = (bonusCalcSimple(goal: targetSkript, value: valueSkr))
        resultSkr = bonusSkr
    }
    
    func convertValueVid() {
        if let convertedValue = Double(inputValueVid) {
            valueVid = convertedValue
        }
        else {
            valueVid = 0
        }
    }

    func calcualteResultVid() {
        let bonusVid = (bonusCalcSimple(goal: targetVideo, value: valueVid))
        resultVid = bonusVid
    }

    func convertValueExam() {
        if let convertedValue = Double(inputValueExam) {
            valueExam = convertedValue
        }
        else {
            valueExam = 0
        }
    }

    func calcualteResultExam() {
        let bonusExam = (bonusCalcSimple(goal: targetExam, value: valueExam))
        resultExam = bonusExam
    }
    
    func calculateAverageBonus() {
        print(resultSkr)
        print(resultVid)
        print(resultExam)
        let bonusAvrg = (calcAverageBonus(bonusSkr: resultSkr, bonusVid: resultVid, bonusExam: resultExam))
        result = bonusAvrg
    }
    
    //Body
    var body: some View {
        VStack {
            Text("Goal Component 4: External Course Cost")
                .bold()
                .padding(.top, 20)
                .padding(.bottom, 50)
        }
        HStack {
            VStack {
                VStack {
                    Text("Script target cost:")
                    Text("€\(Int(targetSkript))")
                }
                // add update button to change target cost
                .padding()
                HStack {
                    TextField("actual cost", text: $inputValueSkr)
                        .onChange(of: inputValueSkr) {
                            convertValueSkr()
                            calcualteResultSkr()
                            calculateAverageBonus()
                        }
                        .padding(.horizontal, 100)
                }
                Text("Bonus \(Int(bonusCalcSimple(goal: targetSkript, value: valueSkr)))%")
                    .padding()
            }
            
            VStack {
                HStack {
                        Picker("", selection: $selectedVideoOption) {
                            ForEach(VideoOption.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of:selectedVideoOption) {
                            calcualteResultVid()
                            calculateAverageBonus()
                        }
                    }
                .padding(.horizontal, 100)
                HStack {
                    Text("Video target cost: €\(Int(targetVideo))")
                }
                .padding()
                
                HStack {
                    TextField("actual cost", text: $inputValueVid)
                        .onChange(of: inputValueVid) {
                            convertValueVid()
                            calcualteResultVid()
                            calculateAverageBonus()
                        }
                        .padding(.horizontal, 100)
                }
                
                Text("Bonus \(Int(bonusCalcSimple(goal: targetVideo, value: valueVid)))%")
                    .padding()
            }
            
            VStack {
                HStack {
                        Picker("", selection: $selectedExamOption) {
                            ForEach(ExamOption.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of:selectedExamOption) {
                            calcualteResultExam()
                            calculateAverageBonus()
                        }
                    }
                .padding(.horizontal, 100)
                HStack {
                    Text("Exam target cost: €\(Int(targetExam))")
                }
                .padding()
                
                HStack {
                    TextField("actual cost", text: $inputValueExam)
                        .onChange(of: inputValueExam) {
                            convertValueExam()
                            calcualteResultExam()
                            calculateAverageBonus()
                        }
                        .padding(.horizontal, 100)
                }
                Text("Bonus \(Int(bonusCalcSimple(goal: targetExam, value: valueExam)))%")
                    .padding()
            }
        }
        Text("Bonus for Production: \(Int(result))%")
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white))
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
            .padding()
    }
}
    
#Preview {
        ContentView()
    }

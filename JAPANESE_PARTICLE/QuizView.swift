//
//  QuizView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct QuizView: View {
    // ViewModelをビューの状態として持つ
    @State private var viewModel = QuizViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("七、練習題")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // 問題リスト
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(viewModel.questions) { question in
                        QuizQuestionRow(question: question, viewModel: viewModel)
                    }
                    
                    // 結果表示ボタン
                    Button(action: {
                        viewModel.submitQuiz()
                    }) {
                        Text("查看結果")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.isQuizSubmitted ? Color.gray : Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(viewModel.isQuizSubmitted)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // 結果表示エリア
                    if viewModel.isQuizSubmitted {
                        ResultView(viewModel: viewModel)
                            .padding(.horizontal)
                            .padding(.bottom, 50)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// 個々の問題行のビュー
struct QuizQuestionRow: View {
    let question: QuizQuestion
    @Bindable var viewModel: QuizViewModel // 状態の変更を可能にする
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // 問題文
            Text("(\(question.id + 1)) \(question.questionText)")
                .font(.headline)
            
            // 選択肢のグリッド（2列レイアウト）
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                ForEach(question.options) { option in
                    QuizOptionButton(question: question, option: option, viewModel: viewModel)
                }
            }
        }
    }
}

// 個々の選択肢ボタン
struct QuizOptionButton: View {
    let question: QuizQuestion
    let option: QuizOption
    @Bindable var viewModel: QuizViewModel
    
    // 現在の選択肢の状態を判定
    private var isSelected: Bool {
        viewModel.selectedAnswers[question.id] == option.id
    }
    
    // 選択肢の背景色を決定
    private var backgroundColor: Color {
        if viewModel.isQuizSubmitted {
            if viewModel.isOptionCorrect(questionId: question.id, optionId: option.id) {
                return Color.green.opacity(0.8) // 正解
            } else if viewModel.isOptionIncorrectlySelected(questionId: question.id, optionId: option.id) {
                return Color.red.opacity(0.8) // ユーザー選択かつ不正解
            }
        }
        // 未採点時、または不正解だがユーザーが選択しなかった場合
        return isSelected ? Color.blue : Color.gray.opacity(0.2)
    }
    
    // 選択肢のテキスト色を決定
    private var foregroundColor: Color {
        viewModel.isQuizSubmitted && (viewModel.isOptionCorrect(questionId: question.id, optionId: option.id) || viewModel.isOptionIncorrectlySelected(questionId: question.id, optionId: option.id)) ? .white : .black
    }
    
    var body: some View {
        Button(action: {
            if !viewModel.isQuizSubmitted {
                viewModel.selectOption(questionId: question.id, optionId: option.id)
            }
        }) {
            Text("\(option.id). \(option.text)")
                .font(.callout)
                .lineLimit(nil) // テキストが複数行になっても表示
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(8)
                .animation(.easeIn(duration: 0.2), value: viewModel.isQuizSubmitted)
        }
        // 採点後はボタンを無効化
        .disabled(viewModel.isQuizSubmitted)
    }
}

// 結果表示ビュー
struct ResultView: View {
    @Bindable var viewModel: QuizViewModel
    
    var body: some View {
        let totalQuestions = viewModel.questions.count
        let score = viewModel.score
        let percentage = (Double(score) / Double(totalQuestions)) * 100
        
        VStack(alignment: .leading, spacing: 15) {
            Text("測驗結果")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("你答對了 \(score) 題，共 \(totalQuestions) 題，正確率為 \(percentage, specifier: "%.2f")%。")
                .font(.title3)
                .padding(.bottom, 10)
            
            Divider()
            
            // 詳細結果
            VStack(alignment: .leading, spacing: 10) {
                Text("詳細結果：")
                    .font(.headline)
                
                ForEach(viewModel.questions) { question in
                    let isCorrect = viewModel.selectedAnswers[question.id] == question.correctAnswer
                    let resultText = isCorrect ? "你答對了！" : "你答錯了。"
                    let correctOption = question.options.first(where: { $0.id == question.correctAnswer })?.id ?? ""
                    let selectedOption = viewModel.selectedAnswers[question.id] ?? "未選擇"
                    
                    VStack(alignment: .leading) {
                        Text("第 \(question.id + 1) 題：\(resultText)")
                            .foregroundColor(isCorrect ? .green : .red)
                        Text("正解是 \(correctOption)，你選擇的是 \(selectedOption)。")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - 測驗データ (クイズデータ)

// 実際の30問のデータをSwiftの構造体として定義
let quizData: [QuizQuestion] = [
    QuizQuestion(
        id: 0,
        questionText: "請選出正確的格助詞：図書館（　）英語（　）勉強します。",
        options: [
            QuizOption(id: "A", text: "に、を"),
            QuizOption(id: "B", text: "で、を"),
            QuizOption(id: "C", text: "を、で"),
            QuizOption(id: "D", text: "に、で")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "図書館（　）英語（　）勉強します。"
    ),
    QuizQuestion(
        id: 1,
        questionText: "請選出正確的日文翻譯：當我第一次看到超人力霸王的時候，我以為我遇到了上帝。",
        options: [
            QuizOption(id: "A", text: "最初にウルトラマンをこの目で見たとき、私は神に出会えると思っていた。"),
            QuizOption(id: "B", text: "最初にウルトラマンをこの目で見るとき、私は神に出会えたと思っていた。"),
            QuizOption(id: "C", text: "最初にウルトラマンをこの目で見たとき、私は神に出会えたと思っていた。"),
            QuizOption(id: "D", text: "最初にウルトラマンをこの目で見るとき、私は神に出会えると思っていた。")
        ],
        correctAnswer: "C",
        fullQuestionHTML: "當我第一次看到超人力霸王的時候，我以為我遇到了上帝。"
    ),
    QuizQuestion(
        id: 2,
        questionText: "請比較「は」與「が」在以下句子中的差異：① 私は先生です。② 私が先生です。",
        options: [
            QuizOption(id: "A", text: "「は」表示主題，「が」表示主語。"),
            QuizOption(id: "B", text: "「は」表示對比，「が」表示強調。"),
            QuizOption(id: "C", text: "「は」表示原因，「が」表示結果。"),
            QuizOption(id: "D", text: "「は」與「が」在語法上無差異。")
        ],
        correctAnswer: "A",
        fullQuestionHTML: "請比較「は」與「が」在以下句子中的差異：① 私は先生です。② 私が先生です。"
    ),
    QuizQuestion(
        id: 3,
        questionText: "請選出正確的日文翻譯：因為快樂，所以身體很好。",
        options: [
            QuizOption(id: "A", text: "幸せなので、体が良い。"),
            QuizOption(id: "B", text: "幸せだので、体が良い。")
        ],
        correctAnswer: "A",
        fullQuestionHTML: "因為快樂，所以身體很好。"
    ),
    QuizQuestion(
        id: 4,
        questionText: "請選出正確的接續助詞：お腹が空いている（　）ダイエット中だから食べられない。",
        options: [
            QuizOption(id: "A", text: "から"),
            QuizOption(id: "B", text: "けど"),
            QuizOption(id: "C", text: "ので"),
            QuizOption(id: "D", text: "と")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "お腹が空いている（　）ダイエット中だから食べられない。"
    ),
    QuizQuestion(
        id: 5,
        questionText: "請選出正確的接續助詞：動物園に着く（　）動物の写真を撮り始めた。",
        options: [
            QuizOption(id: "A", text: "から"),
            QuizOption(id: "B", text: "けど"),
            QuizOption(id: "C", text: "ので"),
            QuizOption(id: "D", text: "と")
        ],
        correctAnswer: "D",
        fullQuestionHTML: "動物園に着く（　）動物の写真を撮り始めた。"
    ),
    QuizQuestion(
        id: 6,
        questionText: "請選出正確的日文翻譯：你知道昨天舉辦運動會嗎？",
        options: [
            QuizOption(id: "A", text: "昨日運動会が行われると知っていますか？"),
            QuizOption(id: "B", text: "昨日運動会が行われたと知っていますか？")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "你知道昨天舉辦運動會嗎？"
    ),
    QuizQuestion(
        id: 7,
        questionText: "請選出正確的日文翻譯：身為學生，必須學習。",
        options: [
            QuizOption(id: "A", text: "学生だので、勉強しなければならない。"),
            QuizOption(id: "B", text: "学生だから、勉強しなければならない。")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "身為學生，必須學習。"
    ),
    QuizQuestion(
        id: 8,
        questionText: "請選出正確的日文翻譯：儘管很有精神，卻不想吃東西。",
        options: [
            QuizOption(id: "A", text: "元気なのに、何も食べたくない。"),
            QuizOption(id: "B", text: "元気だのに、何も食べたくない。")
        ],
        correctAnswer: "A",
        fullQuestionHTML: "儘管很有精神，卻不想吃東西。"
    ),
    QuizQuestion(
        id: 9,
        questionText: "請選出正確的接續助詞：食べるのが好きだ（　）、最近はあまり食べていない。",
        options: [
            QuizOption(id: "A", text: "か"),
            QuizOption(id: "B", text: "が"),
            QuizOption(id: "C", text: "から")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "食べるのが好きだ（　）、最近はあまり食べていない。"
    ),
    QuizQuestion(
        id: 10,
        questionText: "請選出正確的日文翻譯：你想成為醫師嗎？",
        options: [
            QuizOption(id: "A", text: "あなたは医者になりたいですよ"),
            QuizOption(id: "B", text: "あなたは医者になりたいですね"),
            QuizOption(id: "C", text: "あなたは医者になりたいですか")
        ],
        correctAnswer: "C",
        fullQuestionHTML: "你想成為醫師嗎？"
    ),
    QuizQuestion(
        id: 11,
        questionText: "請選出正確的日文翻譯：您的身體真健康！",
        options: [
            QuizOption(id: "A", text: "あなたの体は本当に健康ですか"),
            QuizOption(id: "B", text: "あなたの体は本当に健康ですが"),
            QuizOption(id: "C", text: "あなたの体は本当に健康ですので"),
            QuizOption(id: "D", text: "あなたの体は本当に健康ですね")
        ],
        correctAnswer: "D",
        fullQuestionHTML: "您的身體真健康！"
    ),
    QuizQuestion(
        id: 12,
        questionText: "請選出正確的格助詞：ウルトラマンは光の国（）地球（）人間（）救い（）帰った",
        options: [
            QuizOption(id: "A", text: "から、に、を、へ"),
            QuizOption(id: "B", text: "へ、に、を、に"),
            QuizOption(id: "C", text: "から、へ、を、に"),
            QuizOption(id: "D", text: "から、へ、に、を") // Correct: 從光之國(から) → 回到地球(へ) → 為了拯救人類(を + に) → 這裡應是「救いに」所以是「を、に」
        ],
        // The original answer is 'C'. Let's check the question: ウルトラマンは光の国（から）地球（へ）人間（を）救い（に）帰った. C is 'から、へ、を、に'. This seems correct.
        correctAnswer: "C",
        fullQuestionHTML: "ウルトラマンは光の国（）地球（）人間（）救い（）帰った"
    ),
    QuizQuestion(
        id: 13,
        questionText: "請選出正確的日文翻譯：在跨越時空的祈禱中，約定終將被兌現。",
        options: [
            QuizOption(id: "A", text: "時と渡る祈りの中で、約束は果たされる。"),
            QuizOption(id: "B", text: "時で渡る祈りの中で、約束は果たされる。"),
            QuizOption(id: "C", text: "時に渡る祈りの中で、約束は果たされる。"),
            QuizOption(id: "D", text: "時を渡る祈りの中で、約束は果たされる。")
        ],
        correctAnswer: "D",
        fullQuestionHTML: "在跨越時空的祈禱中，約定終將被兌現。"
    ),
    QuizQuestion(
        id: 14,
        questionText: "請選出正確的「だけ」用法：這個蛋糕很甜，但我（　）喜歡巧克力蛋糕。",
        options: [
            QuizOption(id: "A", text: "限定範圍"),
            QuizOption(id: "B", text: "強調對比"),
            QuizOption(id: "C", text: "假設條件"),
            QuizOption(id: "D", text: "連接句子")
        ],
        // Note: The original question has 'チョコレートケーキ（　）が好きです。', implying the blank is for a particle, but the options are usage definitions. Based on the context "I only like chocolate cake", the usage is "限定範圍" (Limiting scope). The blank should be filled with 'だけ' (or nothing in the sentence structure, or 'だけが'). The question asks for the usage of 'だけ'.
        correctAnswer: "A",
        fullQuestionHTML: "このケーキは甘いけど、チョコレートケーキ（　）が好きです。"
    ),
    QuizQuestion(
        id: 15,
        questionText: "請選出正確的日文翻譯：我昨天只讀英文",
        options: [
            QuizOption(id: "A", text: "私は昨日英語を勉強していた"),
            QuizOption(id: "B", text: "私は昨日英語しか勉強していなかった")
        ],
        correctAnswer: "B",
        fullQuestionHTML: "我昨天只讀英文"
    ),
    QuizQuestion(
        id: 16,
        questionText: "請選出「ばかり」在下列句子的正確解釋：彼はゲーム（　）している。",
        options: [
            QuizOption(id: "A", text: "表示剛發生的動作"),
            QuizOption(id: "B", text: "表示數量大約"),
            QuizOption(id: "C", text: "表示總是"),
            QuizOption(id: "D", text: "表示只做某事")
        ],
        // Correct Answer is C or D depending on context. The HTML table lists '總是、淨是' (C) and '只做某件事' (D, typically with て形). 'ゲームばかりしている' usually means "always playing games" (C). The JS answer is 'C'.
        correctAnswer: "C",
        fullQuestionHTML: "彼はゲーム（　）している。"
    ),
    QuizQuestion(
        id: 17,
        questionText: "請選出「ばかり」在下列句子的正確解釋：赤ちゃんは地を這って（　）いる。",
        options: [
            QuizOption(id: "A", text: "表示剛發生的動作"),
            QuizOption(id: "B", text: "表示數量大約"),
            QuizOption(id: "C", text: "表示總是"),
            QuizOption(id: "D", text: "表示只做某事")
        ],
        // Correct Answer is D (using the て形 + ばかりいる). The JS answer is 'D'.
        correctAnswer: "D",
        fullQuestionHTML: "赤ちゃんは地を這って（　）いる。"
    ),
    QuizQuestion(
        id: 18,
        questionText: "請選出正確的「まで」用法：子供（　）泣きました。",
        options: [
            QuizOption(id: "A", text: "連…也"),
            QuizOption(id: "B", text: "只…而已"),
            QuizOption(id: "C", text: "如果…就"),
            QuizOption(id: "D", text: "只要…就")
        ],
        // 子供までが泣き出した = 連小孩也哭了. The usage is A. The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "子供（　）泣きました。"
    ),
    QuizQuestion(
        id: 19,
        questionText: "請選出正確的日文翻譯：君でもできるよ。",
        options: [
            QuizOption(id: "A", text: "只有你能做到"),
            QuizOption(id: "B", text: "連你也能做到")
        ],
        // 君でもできるよ = 連你也能做到. The JS answer is 'B'.
        correctAnswer: "B",
        fullQuestionHTML: "君でもできるよ。"
    ),
    QuizQuestion(
        id: 20,
        questionText: "請選出正確的日文翻譯：水さえ飲めば大丈夫だ。",
        options: [
            QuizOption(id: "A", text: "只要連水都能喝就沒問題"),
            QuizOption(id: "B", text: "只喝水就能解決")
        ],
        // 水さえ飲めば大丈夫だ = 只要連水都能喝就沒問題. The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "水さえ飲めば大丈夫だ。"
    ),
    QuizQuestion(
        id: 21,
        questionText: "請選出「こそ」用法：君（　）が僕の希望だ。",
        options: [
            QuizOption(id: "A", text: "強調動作"),
            QuizOption(id: "B", text: "強調對比"),
            QuizOption(id: "C", text: "強調主體"),
            QuizOption(id: "D", text: "強調結果")
        ],
        // 君こそ僕の希望だ = 你才是我的希望. The usage is C. The JS answer is 'C'.
        correctAnswer: "C",
        fullQuestionHTML: "君（　）が僕の希望だ。"
    ),
    QuizQuestion(
        id: 22,
        questionText: "請選出正確的「くらい / ぐらい」用法：一度（　）行ってみたい。",
        options: [
            QuizOption(id: "A", text: "表示大約、至少"),
            QuizOption(id: "B", text: "表示越來越"),
            QuizOption(id: "C", text: "表示程度、範圍"),
            QuizOption(id: "D", text: "表示目的、目標")
        ],
        // 一度くらい行ってみたい = 至少想去一次. The usage is A. The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "一度（　）行ってみたい。"
    ),
    QuizQuestion(
        id: 23,
        questionText: "請選出「ほど」在下方的錯誤選項：彼は驚く（　）優しい。",
        options: [
            QuizOption(id: "A", text: "不如"),
            QuizOption(id: "B", text: "到某種地步"),
            QuizOption(id: "C", text: "以至於")
        ],
        // 驚くほど優しい = 驚人的溫柔 (程度/以至於). "不如" is the wrong usage for this sentence structure (V-辞書形 + ほど). The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "彼は驚く（　）優しい。"
    ),
    QuizQuestion(
        id: 24,
        questionText: "請選出「ながら（も）」的正確用法：学生（　）社長をしている。",
        options: [
            QuizOption(id: "A", text: "表示並列"),
            QuizOption(id: "B", text: "表示條件"),
            QuizOption(id: "C", text: "表示逆接"),
            QuizOption(id: "D", text: "表示原因")
        ],
        // 学生ながら社長をしている = 雖然是學生，但也當社長 (逆接). The JS answer is 'C'.
        correctAnswer: "C",
        fullQuestionHTML: "学生（　）社長をしている。"
    ),
    QuizQuestion(
        id: 25,
        questionText: "請選出正確的日文翻譯：這本書比那本書更有趣。",
        options: [
            QuizOption(id: "A", text: "この本はあの本より面白いです。"),
            QuizOption(id: "B", text: "この本はあの本ほど面白いです。"),
            QuizOption(id: "C", text: "この本はあの本くらい面白いです。")
        ],
        // The best comparison is 'より'. 'ほど' is usually used with negation (ほど面白くない). 'くらい' is "about as interesting" or "at least as interesting." The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "這本書比那本書更有趣。"
    ),
    QuizQuestion(
        id: 26,
        questionText: "請選出正確的日文翻譯：與其去見那傢伙，還不如待在家。",
        options: [
            QuizOption(id: "A", text: "あの奴を見に行くほど、家にいたほうがいい。"),
            QuizOption(id: "B", text: "あの奴を見に行くより、家にいたほうがいい。")
        ],
        // ほど is not used for "rather than X, better Y". より is used for "rather than X, better Y". The JS answer is 'B'.
        correctAnswer: "B",
        fullQuestionHTML: "與其去見那傢伙，還不如待在家。"
    ),
    QuizQuestion(
        id: 27,
        questionText: "請選出正確的日文翻譯：和假面騎士相比，超人力霸王更強大。",
        options: [
            QuizOption(id: "A", text: "仮面ライダーほど、ウルトラマンのほうが強い。"),
            QuizOption(id: "B", text: "仮面ライダーだけ、ウルトラマンのほうが強い。"),
            QuizOption(id: "C", text: "仮面ライダーでも、ウルトラマンのほうが強い。"),
            QuizOption(id: "D", text: "仮面ライダーより、ウルトラマンのほうが強い。")
        ],
        // 仮面ライダーより、ウルトラマンのほうが強い. (XよりYの方が～) The JS answer is 'D'.
        correctAnswer: "D",
        fullQuestionHTML: "和假面騎士相比，超人力霸王更強大。"
    ),
    QuizQuestion(
        id: 28,
        questionText: "請選出正確的日文翻譯：假面騎士不如超人力霸王強大。",
        options: [
            QuizOption(id: "A", text: "仮面ライダーはウルトラマンより強くない。"),
            QuizOption(id: "B", text: "仮面ライダーはウルトラマンだけ強くない。"),
            QuizOption(id: "C", text: "仮面ライダーはウルトラマンほど強くない。"),
            QuizOption(id: "D", text: "仮面ライダーはウルトラマンでも強い。")
        ],
        // ほど + 否定 is the primary structure for "not as X as Y". The JS answer is 'C'.
        correctAnswer: "C",
        fullQuestionHTML: "假面騎士不如超人力霸王強大。"
    ),
    QuizQuestion(
        id: 29,
        questionText: "請選出錯誤的日文翻譯：能代表日本的特攝片不但有《圓谷》的《超人力霸王系列》，也有《東映》的《假面騎士系列》與《超級戰隊系列》。",
        options: [
            QuizOption(id: "A", text: "日本を代表する特撮は《円谷プロ》の《ウルトラマンシリーズ》だけで、《東映》の《仮面ライダーシリーズ》や《スーパー戦隊シリーズ》もある。"),
            QuizOption(id: "B", text: "日本を代表する特撮は《円谷プロ》の《ウルトラマンシリーズ》だけじゃなくて、《東映》の《仮面ライダーシリーズ》や《スーパー戦隊シリーズ》もある。"),
            QuizOption(id: "C", text: "日本を代表する特撮は《円谷プロ》の《ウルトラマンシリーズ》だけでなく、《東映》の《仮面ライダーシリーズ》や《スーパー戦隊シリーズ》もある。"),
            QuizOption(id: "D", text: "日本を代表する特撮は《円谷プロ》の《ウルトラマンシリーズ》だけじゃなく、《東映》の《仮面ライダーシリーズ》や《スーパー戦隊シリーズ》もある。")
        ],
        // The target phrase is "だけでなく" (not only... but also). Option A uses 'だけで' (only/just), which creates an incomplete/incorrect sentence structure, especially combined with the following sentence, but it's an incorrect translation of "not only... but also". The JS answer is 'A'.
        correctAnswer: "A",
        fullQuestionHTML: "能代表日本的特攝片不但有《圓谷》的《超人力霸王系列》，也有《東映》的《假面騎士系列》與《超級戰隊系列》。"
    )
]

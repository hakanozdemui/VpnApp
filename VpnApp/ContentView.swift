//
//  ContentView.swift
//  VpnApp
//
//  Created by Hakan Özdem on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            VStack{
                // top menu view
                TopMenuView()
                // speed text view
                SpeedTextView()
                // progress view
                progressView()
                    .padding( .top, 80)
                // start stop button view
                StartStopButtonView()
            }
            .foregroundColor(.white)//
            .padding(.horizontal)
            //drop down view
        }
    }
}

struct TopMenuView: View {
    var body: some View {
        HStack {
            Button(action: {
                // show side
            }, label: {
            VStack{
                HStack{
                    Circle()
                        .frame(width: 6, height: 6)
                    Circle()
                        .frame(width: 6, height: 6)
                }
                HStack{
                    Circle()
                        .frame(width: 6, height: 6)
                    Circle()
                        .frame(width: 6, height: 6)
                }
            }
            .padding() // bir görünüm etrafına boşuk ekler
        })
            
            
            Text("ZOOM")
                .font(.system(size: 18, weight: .black)) // sistem yazı tipi kullanılarak 18px büyüklüğünde .black değeri kullanılarak kalın(bold) bir yazı ayarlanir
            
            Text("VPN")
                .font(.system(size: 18, weight: .regular))
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.darkPurple) // arkaplanı yada doldurma alanını belirli bir renkle doldurmak için kullanılır.
                    .frame(width: 135, height: 40) // 2:50 de kaldık
                HStack{
                    Image(systemName: "flame.fill")
                    Text("GO PREMIUM")
                        .font(.system(size: 12, weight: .regular))
                }
            }
        }
    }
}

struct SpeedTextView: View {
    var body: some View {
        VStack {
         Text("35.13")
                .font(.system(size: 40, weight: .semibold))
         Text("mb/s")
                .font(.system(size: 16, weight: .light))
        }
    }
}

struct progressView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.progressBackground, Color.progressBackground.opacity(0.01)]), startPoint: .top, endPoint: .bottom), lineWidth: 24)
            //stroke belirtilen çizginin dışını belirli renk veya desenle doldurmak için kullanılır.line width cizgi //kalınlığı,lineargradient dolgu rengi.Sonuç olarak, bu kod bir çizgi oluşturur ve bu çizgiyi başlangıç noktasından //bitiş noktasına doğru Color.progressBackground renginden Color.progressBackground.opacity(0.01) rengine doğru bir //geçişle doldurur. Çizginin kalınlığı ise 24 piksel olarak belirlenmiştir.frame(width: 250, height: 250)
                .frame(width: 250, height: 250)
                
                Circle()
                    .frame(width: 200, height: 200)
            
            ForEach(Array(stride(from: 0, through: 10, by: 1))// bir ona kadar 1 artan döngü
                    ,id: \.self)// benzersiz bir kimlik atanır
            {i in Text("\(i * 10)")// döngüde her sayı on ile çarpılıp yazılır.
                    .rotationEffect(.degrees(-120 - Double(i * 30)))
                    .offset(x: 160) // her birim 16 birim sağa kaır.y
                    .rotationEffect(.degrees(Double(i * 30)))//Bu satırda, rotationEffect modifiye edici kullanılarak Text görünümü döndürülüyor. Döndürme miktarı, i değerinin 30 ile çarpılmasıyla hesaplanıyor. Bu sayede, ilk Text görünümü 0 derece döndürülürken, ikincisi 30 derece, üçüncüsü 60 derece ve böyle devam eder.
            }
            .rotationEffect(.degrees(120))//her bir Text görünümü, -120 derece başlangıç noktasından başlayarak, i değeriyle çarpılan 30 derece miktarında döndürülür. Örneğin, ilk Text görünümü -120 derece döndürülürken, ikincisi -150 derece, üçüncüsü -180 derece ve bu şekilde devam eder.
        }
    }
}

struct StartStopButtonView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

struct DropdownView: View {
    var body: some View {
        ZStack {
            
        }
    }
}




extension Color{
    static let appPrimary = Color.init(red: 84/255, green: 31/255, blue:221/255) // renk sabiti oluşturur
    static let dropDown = Color.init(red: 25/255, green: 24/255, blue: 197/255)
    static let progressBackground = Color.init(red: 149/255, green: 112/255, blue:250/255)
    static let progress = Color.init(red:252/255, green: 229/255, blue:96/255)
    static let darkPurple = Color.init(red: 169/255, green: 41/255, blue:246/255)
    static let viewTop = Color.init(red:187/255, green: 68/255, blue: 242/255)
    static let viewBottom = Color.init(red: 250/255, green: 140/255, blue: 82/255)
    static let stopColor = Color.init(red: 250/255, green: 140/222, blue: 82/255)
}


extension UIScreen { //UIScreen sınıfına ek özellikler eklemek için kullanılır
    static let screenWidth = UIScreen.main.bounds.size.width //bir sabit oluşturur ve ona kullanıcının  cihazın ekran genizliğini atar. bu de ğer başka yerde kullanılabilir değiştirilemez
    static let screenHeight = UIScreen.main.bounds.size.height // yükseklik
    static let screenSize = UIScreen.main.bounds.size // ekran boyutu
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//4,35

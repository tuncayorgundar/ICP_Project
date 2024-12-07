import Array "mo:base/Array";  // Array modülünü içeri aktarıyoruz
import Int "mo:base/Int";  // Int modülünü içeri aktarıyoruz

actor AnimalShelter {
    // Bağışları ve bağışçı bilgilerini tutacak değişkenler
    private var donations: Int = 0;
    private var donors: [Text] = [];  // Bağış yapan kişilerin isimlerini tutacak
    private var donationHistory: [(Text, Int)] = [];  // Bağışçılar ve bağış miktarlarını tutacak

    // Bağış yapma fonksiyonu
    public func donate(donor: Text, amount: Int) : async Text {
        if (amount <= 0) {
            return "Bağış tutarı sıfır veya negatif olamaz.";
        };

        // Bağış yapan kişiyi ve bağış tutarını kaydet
        donations := donations + amount;
        donors := Array.append(donors, [donor]);
        donationHistory := Array.append(donationHistory, [(donor, amount)]);
        
        // Bağış mesajı döndür
        return "Bağışınız alındı! Teşekkürler! Yeni toplam bağış: " # Int.toText(donations);
    };

    // Toplam bağış miktarını sorgulama fonksiyonu
    public func getTotalDonations() : async Text {
        return "Toplam Bağış Tutarı: " # Int.toText(donations);
    };

    // Bağışçıların listesini alma fonksiyonu
    public func getDonors() : async [Text] {
        return donors;
    };

    // Bağış geçmişini görüntüleme fonksiyonu
    public func getDonationHistory() : async [(Text, Int)] {
        return donationHistory;
    };
};

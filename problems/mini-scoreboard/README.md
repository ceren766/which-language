# mini-scoreboard Projesi (V2)

## V1'dan V2'ye Geçiş ve Değişiklik Özeti
Bu sürümde (V2), projenin altyapısına **while döngüleri** entegre edilmiş ve sistem statik veri yazmadan çıkıp dinamik veri okuma aşamasına geçmiştir.

**Tamamlanan Görevler (Tasks):**
1. **Teknik Borç Kapatıldı:** V1'de dosya satır sayısına göre (`\n` sayılarak) yapılan kırılgan ID üretimi, `while` döngüsü ile veritabanını satır satır okuyan ve boşlukları atlayan güvenli bir yapıya çevrildi.
2. **History Komutu:** `while` döngüsü yardımıyla `matches.dat` içerisindeki tüm maçlar okunarak formatlı bir şekilde ekrana basıldı.
3. **Team Komutu:** Girilen takım adına göre veritabanını `while` ile satır satır filtreleyen ve sadece eşleşen maçları getiren algoritma yazıldı.
4. **BONUS (Codex / AI Entegrasyonu):** `stats` komutu bir yapay zeka aracına (prompt mühendisliği ile) yazdırılıp sisteme başarıyla entegre edildi. Dosyadaki atılan tüm gollerin toplamını matematiksel olarak ekrana basmaktadır.

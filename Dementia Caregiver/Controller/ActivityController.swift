//
//  ActivityController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

class ActivityController {
    
    let dataManager = DataManager.shared
    
    func addActivity(){
        let activity = Activity(context: dataManager.context)
        
        // aktivitas di luar ruangan
        activity.id_aktivitas = UUID()
        activity.nama = "Jalan Pagi"
        activity.deskripsi = "Aktivitas diluar ruangan bisa memenuhi kebutuhan gizi ODD akan vitamin D dari sinar matahari."
        activity.durasi = 30
        activity.tips = "Jenis olahraga ini sangat baik dilakukan selama 25 menit per hari sebagai aktivitas fisik dengan intensitas sedang. Jika dilakukan secara rutin, kebiasaan ini akan membantu tubuh lebih kuat dan mencegah berbagai risiko penyakit yang mengancam. ODD dapat melakukan aktivitas ini bersama pasangan, anggota keluarga lain, atau teman sehingga meningkatkan interaksi sosial yang mendukung kesejahteraan dan kesehatan mental."
        activity.disability_lv = "1"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Menyiram Tanaman"
        activity.deskripsi = "Aktivitas menyiram tanaman menjadi latihan yang bagus untuk dilakukan setiap hari karena mendatangkan manfaat seolah sedang berolahraga."
        activity.durasi = 30
        activity.tips = "Kegiatan menyiram tanaman dapat dilakukan pada pagi hari. Paparan sinar matahari pagi selama beberapa jam (8-10) akan memberi lebih banyak vitamin D daripada segelas susu setiap malam. ODD bisa memulai berkebun dengan memanfaatkan lahan kecil di sekitar rumah. Tumbuhan yang mudah dirawat dan diawasi untuk pemula bisa berupa sayuran seperti timun dan kubis."
        activity.disability_lv = "2"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Belanja"
        activity.deskripsi = "Belanja memberikan kesempatan untuk berinteraksi secara sosial dan juga aktivitas fisik saat berkeliling dari satu toko ke toko lain. Membeli bahan pangan yang segar setiap hari juga diyakini membuat para ODD makan lebih sehat."
        activity.durasi = 30
        activity.tips = "- Buatlah daftar belanja untuk persiapan makan selama beberapa hari.- Catat merek favorit ODD di daftar belanja agar tidak bingung dengan pilihan lain yang tak terhitung jumlahnya di lorong.- Berbelanja di toko yang besar untuk memudahkan pergerakan."
        activity.disability_lv = "1"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Mengajak jalan hewan peliharaan"
        activity.deskripsi = "Mengajak jalan hewan peliharaan dapat menjadi kegiatan yang menyenangkan sekaligus menyehatkan. ODD yang menemani anjing berjalan-jalan menjadi termotivasi untuk berjalan meski hanya jarak pendek"
        activity.durasi = 30
        activity.tips = "Mengajak hewan peliharaan jalan-jalan secara rutin juga bisa membakar kalori sebagai terapi penurunan berat badan."
        activity.disability_lv = "1"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Menanam"
        activity.deskripsi = "Aktivitas berkebun seperti menanam menjadi latihan yang bagus untuk dilakukan setiap hari karena mendatangkan manfaat seolah sedang berolahraga."
        activity.durasi = 60
        activity.tips = "Kegiatan menanam dapat dilakukan pada pagi hari. Paparan sinar matahari pagi selama beberapa jam (8-10) akan memberi lebih banyak vitamin D daripada segelas susu setiap malam. ODD bisa memulai berkebun dengan memanfaatkan lahan kecil di sekitar rumah. Tumbuhan yang mudah dirawat dan diawasi untuk pemula bisa berupa sayuran seperti timun dan kubis."
        activity.disability_lv = "1"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        //Aktivitas di Dalam Ruangan
        activity.id_aktivitas = UUID()
        activity.nama = "Meditasi"
        activity.deskripsi = "Selain berfungsi menenangkan diri, meditasi dapat memperlambat penuaan otak. Meditasi melatih pikiran untuk fokus, rileks, juga dapat meningkatkan kesadaran dan refleksi diri, bersama dengan meningkatkan kebiasaan dan hubungan perawatan diri."
        activity.durasi = 60
        activity.tips = "Jenis meditasi ada bermacam-macam seperti meditasi cinta kasih, meditasi mantra, meditasi kesadaran, dan lain-lain. Semua gaya meditasi ini sangat membantu kesehatan mental ODD. Karena praktik ini membutuhkan keterampilan dan pola pikir yang berbeda, Anda harus mempertimbangkan kebutuhan dan kepribadian ODD untuk menemukan yang paling sesuai dengan gaya hidup ODD."
        activity.disability_lv = "3"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Menulis"
        activity.deskripsi = "Menulis bisa menjadi alternatif ODD yang suka bercerita dan bermanfaat untuk mengasah kemampuan berpikir serta kreativitasnya. Beberapa sumber menyebutkan aktivitas menulis dapat meminimalisir risiko pikun."
        activity.durasi = 30
        activity.tips = "Ada banyak hal yang dapat menjadi bahan tulisan ODD di masa pensiun. Salah satu hal yang paling mudah adalah dengan menuliskan pengalaman-pengalaman di masa lalu. Pengalaman tidak harus melulu soal kesuksesan pekerjaan atau kegemilangan prestasi akademik. Lansia bisa juga menulis beragam kegagalan hidup atau peluang-peluang yang mereka lewatkan semasa muda."
        activity.disability_lv = "2"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Memasak"
        activity.deskripsi = "Aktivitas masak bisa menjadi solusi yang menyenangkan, terlebih jika dapat berkreasi membuat berbagai menu makanan sehat ODD untuk menunjang kebutuhan gizinya."
        activity.durasi = 60
        activity.tips = "Memasak bisa jadi kegiatan ODD yang menyenangkan. Anda bisa mengajak orang tua atau anggota keluarga yang sudah berusia lanjut untuk melakukan kegiatan ini secara rutin. Selain mengisi waktu luang, memasak juga bisa menjadi sarana agar ODD dapat memasak makanan sehat untuk ia konsumsi guna mencukupi asupan gizinya setiap hari."
        activity.disability_lv = "1"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        activity.id_aktivitas = UUID()
        activity.nama = "Bermain Musik"
        activity.deskripsi = "Penelitian jurnal Frontiers in Psychology menyatakan bahwa musik dapat membantu meningkatkan kemampuan kognitif lansia di rentang usia 60-90 tahun."
        activity.durasi = 30
        activity.tips = "- Bermain musik secara rutin, apalagi bila sudah dilakukan dari kecil diketahui bagus untuk fungsi otak, yakni mencegah demensia. - Cobalah kuasai lagu-lagu yang mudah, misalnya “Bintang Kecil”. Dari situ, perlahan pembelajaran mungkin bisa ditingkatkan. Dengan begitu akan tercipta rasa puas dan kebanggaan pribadi."
        activity.disability_lv = "2"
        activity.dementia_lv = "3"
//        activity.link = nil
        
        // Aktivitas di Malam Hari
        activity.id_aktivitas = UUID()
        activity.nama = ""
        activity.deskripsi = ""
        activity.durasi = 0
        activity.tips = ""
        activity.disability_lv = ""
        activity.dementia_lv = ""
//        activity.link = nil
        
        // Aktivitas Bersama
        
        // Aktivitas 15 Menit
        
        // Aktivitas Fisik
        
        // Aktivitas  mengasah otak
        
        // Aktivitas
    }
}

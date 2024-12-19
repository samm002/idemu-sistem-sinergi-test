#include <iostream>
#include <string>
#include <limits>

using namespace std;

float hitungGaji(float jamKerjaMingguan, float tarifPerJam);
string formatGaji(float gaji);

int main() {
  char option;
  float jamKerjaMingguan, tarifPerJam, gaji;
  string gajiFormatted;

    do {
        cout << "Sistem Penggajian Karyawan (Mingguan)" << endl;
        cout << "------------------------------------" << endl;
        cout << "Silahkan input jumlah jam kerja anda minggu ini :" << endl;
        while (!(cin >> jamKerjaMingguan)) {
          cout << "Invalid input, silahkan input jam kerja anda dalam angka: " << endl;
          cin.clear(); 
          cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }
        cout << "Silahkan input tarif per jam pekerjaan anda :" << endl;
        while (!(cin >> tarifPerJam)) {
          cout << "Invalid input, silahkan input tarif per jam anda dalam angka: " << endl;
          cin.clear(); 
          cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }
        cout << "------------------------------------" << endl;
        cout << "Gaji anda minggu ini adalah :" << endl;

        gaji = hitungGaji(jamKerjaMingguan, tarifPerJam);
        gajiFormatted = formatGaji(gaji);
        
        cout << gajiFormatted << endl;

        cout << "Tekan \"y\" jika ingin menghitung gaji lagi, dan tombol apapun untuk keluar: ";
        
        cin.ignore();
        option = cin.get();
        cout << endl;

    } while (toupper(option) == 'Y');

  cout << "Terima kasih telah menggunakan Sistem Penggajian Mingguan Karyawan!";

  return 0;
}

float hitungGaji(float jamKerjaMingguan, float tarifPerJam) {
  float jamLembur, gaji, tarifLembur;

  if (jamKerjaMingguan > 40 ) {
    jamLembur = jamKerjaMingguan - 40;

    gaji = (jamKerjaMingguan - jamLembur) * tarifPerJam;
    gaji += jamLembur * (1.5 * tarifPerJam);
  }

  else {
    gaji = jamKerjaMingguan * tarifPerJam;
  }

  return gaji;
}

string formatGaji(float gaji) {
  string gajiFormatted = to_string(int(gaji));

    for (int i = gajiFormatted.size() - 3; i > 0; i -= 3) {
        gajiFormatted.insert(i, ".");
    }

    return "Rp. " + gajiFormatted + ",00";
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author nila
 */
public class dbarray {

    public String[][] penyakit = new String[8][];
 public String dbnamaarray[] = {"Kutu Putih", "Pseudococcus Citri", "Penghisap daun atau Buah", "Ulat Api", "Rayap Tanah", "Penggerek Batang", "Ulat Kantong", "Diaphorre Citri"};
   
    public dbarray() {
        String[] Kutu_Putih = {"1", "2", "3"};
        String[] Pseudococcus_Citri = {"4", "5", "6"};
        String[] Penghisap_daun_atau_Buah = {"4", "6"};
        String[] Ulat_Api = {"8", "13"};
        String[] Rayap_Tanah = {"9", "10"};
        String[] Penggerek_Batang = {"11"};
        String[] Ulat_Kantong = {"12"};
        String[] Diaphorre_Citri = {"1", "2"};
        penyakit[0] = Kutu_Putih;
        penyakit[1] = Pseudococcus_Citri;
        penyakit[2] = Penghisap_daun_atau_Buah;
        penyakit[3] = Ulat_Api;
        penyakit[4] = Rayap_Tanah;
        penyakit[5] = Penggerek_Batang;
        penyakit[6] = Ulat_Kantong;
        penyakit[7] = Diaphorre_Citri;
      }
}

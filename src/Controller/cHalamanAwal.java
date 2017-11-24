/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.vHalamanAwal;
import View.vShop;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.koneksi;

/**
 *
 * @author DWI WAHYU
 */
public class cHalamanAwal {

    static vHalamanAwal view;
    static koneksi model;
    static int kursi,ac,wifi,skor;
    
    public cHalamanAwal() throws SQLException {
        this.view = new vHalamanAwal();
        this.model = new koneksi();
        view.getBtnPetunjuk().addActionListener(new PetunjukAction());
        view.getBtnNewGame().addActionListener(new NewGameAction());
        view.getBtnContinue().addActionListener(new Continue());
    }

    private static class Continue implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            String username = null;
            String key = null;
            

            FileReader fr = null;
            try {
                fr = new FileReader("save.txt");
            } catch (FileNotFoundException ex) {
                JOptionPane.showMessageDialog(view, "Data tidak ditemukan!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
            }
            BufferedReader bf = new BufferedReader(fr);
            try {
                username = bf.readLine();
                System.out.println(username);
                key = bf.readLine();
                System.out.println(key);
            } catch (IOException ex) {
                Logger.getLogger(cHalamanAwal.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                skor = model.getScore(username, key);
                System.out.println("lol"+skor);
                kursi = model.getKursi(username, key);
                ac = model.getAc(username, key);
                wifi = model.getWifi(username, key);
                new cHalamanMain(username, key, skor, kursi, ac, wifi).showPage(true);
            } catch (SQLException ex) {
                Logger.getLogger(cHalamanAwal.class.getName()).log(Level.SEVERE, null, ex);
            }
            view.dispose();
        }

    }

    private class PetunjukAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            new cPetunjuk().showPage(true);
            view.dispose();
        }
    }

    private class NewGameAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            try {
                new cInputUsername().showPage(true);
            } catch (SQLException ex) {
                Logger.getLogger(cHalamanAwal.class.getName()).log(Level.SEVERE, null, ex);
            }
            view.dispose();
        }
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

}

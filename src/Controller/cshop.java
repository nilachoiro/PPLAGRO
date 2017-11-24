/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import static Controller.cHalamanAwal.view;
import View.vShop;
import View.vHalamanDokter;
import View.vHalamanMain;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import model.koneksi;

/**
 *
 * @author DWI WAHYU
 */
public class cshop {

    private ImageIcon[] kursi;
    private ImageIcon[] wifi;
    private ImageIcon[] ac;
    private String[] kursilabel;
    private int[] kursiharga;
    private String[] wifilabel;
    private int[] wifiharga;
    private String[] aclabel;
    private int[] acharga;
    private int wifiBil;
    private int acBil;

    private ImageIcon[] kursiplay;

    vShop view;
    cHalamanMain cSebelumnya;
    vHalamanMain view2;
    koneksi model;
    String username, key;

    public cshop(vShop shop, vHalamanMain View2, String n, String k) throws SQLException {
        this.view = shop;
        this.view2 = View2;
        this.username = n;
        this.key = k;
        this.model = new koneksi();
        this.cSebelumnya = cSebelumnya;
        kursilabel = new String[]{"Kursi Kayu Tradisional", "Kursi Kayu Modern", "Kursi kayu MQ", "Kursi Kayu HQ", "Sofa Standart", "Sofa HQ"};
        kursiharga = new int[]{200, 350, 500, 750, 1000, 1250};
        wifilabel = new String[]{"gak ada wifi", "wifi 2G", "wifi 3G", "wifi 4G"};
        wifiharga = new int[]{0, 300, 500, 900};
        aclabel = new String[]{"gak ada ac", "Manual AC", "Automatic AC"};
        acharga = new int[]{0, 400, 1000};
        view.klikkembali(new klikkembali());
        view.setEnabled(true);

        view.NamaItem1().setText(kursilabel[0]);
        view.HargaItem1().setText(String.valueOf(kursiharga[0]));

        view.NamaItem2().setText(wifilabel[0]);
        view.HargaItem2().setText(String.valueOf(wifiharga[0]));

        view.NamaItem3().setText(aclabel[0]);
        view.HargaItem3().setText(String.valueOf(acharga[0]));

        kursi = new ImageIcon[6];
        wifi = new ImageIcon[4];
        ac = new ImageIcon[3];
        view.getBtnUpgrade1().addActionListener(new Upgrade1Action());
        view.getBtnUpgrade2().addActionListener(new Upgrade2Action());
        view.getBtnUpgrade3().addActionListener(new Upgrade3Action());

        kursiplay = new ImageIcon[6];
        for (int i = 1; i < kursi.length; i++) {
            kursiplay[i] = new ImageIcon(getClass().getResource("/img/kursiplay" + (i + 1) + ".png"));
        }

        for (int i = 0; i < kursi.length; i++) {
            kursi[i] = new ImageIcon(getClass().getResource("/img/Kursi" + (i + 1) + ".png"));
        }
        wifi[0] = new ImageIcon(getClass().getResource("/img/150150null.png"));
        for (int i = 1; i < wifi.length; i++) {
            wifi[i] = new ImageIcon(getClass().getResource("/img/Wifi" + (i) + ".png"));
        }
        ac[0] = new ImageIcon(getClass().getResource("/img/150150null.png"));
        for (int i = 1; i < ac.length; i++) {
            ac[i] = new ImageIcon(getClass().getResource("/img/AC" + (i) + ".png"));
        }
        view.Item2().setIcon(wifi[model.getWifi(username, key) + 1]);
        view.HargaItem2().setText(Integer.toString(wifiharga[model.getWifi(username, key) + 1]));
        view.NamaItem2().setText(wifilabel[model.getWifi(username, key) + 1]);

        view.Item3().setIcon(ac[model.getAc(username, key) + 1]);
        view.HargaItem3().setText(Integer.toString(acharga[model.getAc(username, key) + 1]));
        view.NamaItem3().setText(aclabel[model.getAc(username, key + 1)]);

        view.Item1().setIcon(kursi[model.getKursi(username, key) + 1]);
        view.HargaItem1().setText(Integer.toString(kursiharga[model.getKursi(username, key) + 1]));
        view.NamaItem1().setText(kursilabel[model.getKursi(username, key) + 1]);

    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

    private class Upgrade2Action implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            for (int i = wifi.length - 2; i >= 0; i--) {
                if (Integer.valueOf(view.HargaItem2().getText()) < Integer.valueOf(view2.getLabelScore().getText())) {
                    if (view.NamaItem2().getText() == wifilabel[i]) {
                        view.Item2().setIcon(wifi[i + 2]);
                        view.NamaItem2().setText(wifilabel[i + 2]);
                        view.HargaItem2().setText(String.valueOf(wifiharga[i + 2]));
                        view2.getWifi().setIcon(wifi[i + 1]);
                        model.updateWifi(i + 1, username, key);
                    }
                } else {
                    JOptionPane.showMessageDialog(view, "Skor anda tidak mencukupi!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
                    i = 0;
                }
            }
        }
    }

    private class Upgrade3Action implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            for (int i = ac.length - 2; i >= 0; i--) {
                if (view.NamaItem3().getText() == aclabel[i]) {
                    if (Integer.valueOf(view.HargaItem3().getText()) < Integer.valueOf(view2.getLabelScore().getText())) {
                        view.Item3().setIcon(ac[i + 2]);
                        view.NamaItem3().setText(aclabel[i + 2]);
                        view.HargaItem3().setText(String.valueOf(acharga[i + 2]));
                        view2.getAc().setIcon(ac[i + 1]);
                        model.updateAc(i + 1, username, key);
                    } else {
                        JOptionPane.showMessageDialog(view, "Skor anda tidak mencukupi!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
                        i = 0;
                    }
                }
            }
        }
    }
    //gantikursi

    private class Upgrade1Action implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            for (int i = kursi.length - 2; i >= 0; i--) {
                if (Integer.valueOf(view.HargaItem1().getText()) < Integer.valueOf(view2.getLabelScore().getText())) {
                    if (view.NamaItem1().getText() == kursilabel[i]) {
                        view.Item1().setIcon(kursi[i + 2]);
                        view.NamaItem1().setText(kursilabel[i + 2]);
                        view.HargaItem1().setText(String.valueOf(kursiharga[i + 2]));
                        view2.getImgKursiFrame().setIcon(kursiplay[i + 1]);
                        model.updateKursi(i + 1, username, key);
                    }
                } else {
                    JOptionPane.showMessageDialog(view, "Skor anda tidak mencukupi!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
                    i = 0;
                }
            }
        }
    }

    private class klikkembali implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            view.dispose();
        }

    }

}

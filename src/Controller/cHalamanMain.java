package Controller;

import View.vHalamanMain;
import View.vShop;
import java.awt.datatransfer.Transferable;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.TransferHandler;
import model.koneksi;

public class cHalamanMain extends dbarray {

    private vHalamanMain view;
    vShop viewshop;
    private koneksi model;
    private ImageIcon PasienNull, DropBox;
    private int waktuJalan;
    private mulaiPermainan game;
    private ImageIcon[][] pasienIcon;
    String jawabanBenar;
    boolean adaPopup;
    int pasienke = -1;
    private int[] objek = new int[10];
    private int[][] gejalaPasien = new int[10][4];
    private boolean[] periksaobjek = new boolean[10];
    int ondokter;
    int onapotik;
    int onkursi1;
    int onkursi2;
    String Penyakit,Gejala;
    String username, key;
    private ImageIcon[] kursi, ac, wifi;
    int acSave, wifiSave, kursiSave, score;

    public void setAdaPopup(boolean adaPopup) {
        this.adaPopup = adaPopup;
    }

    public cHalamanMain(String username, String key, int skor, int kursiSave, int acSave, int wifiSave) throws SQLException {
        this.Gejala = "";
        this.username = username;//eeq
        this.key = key;
        this.kursiSave = kursiSave;
        this.acSave = acSave;
        this.wifiSave = wifiSave;
        this.score = skor;
        System.out.println("jeneng : " + this.username);
        System.out.println("kunci : " + this.key);
        System.out.println("kursi : " + this.kursiSave);
        System.out.println("ac : " + this.acSave);
        System.out.println("wifi : " + this.wifiSave);
        System.out.println("score : " + this.score);
        this.model = new koneksi();
        this.view = new vHalamanMain();

        this.viewshop = new vShop();

        this.game = new mulaiPermainan();
        view.klikshop(new klikShop());
        view.TampilPopUp(false);
        view.TampilPopUpBeliObat(false);

        view.getLabelScore().setText(Integer.toString(this.score));

        view.getOkPopUpBtn().addActionListener(new OkPopUpAction());
        view.getBeliObatBtn().addActionListener(new BeliObatAction());

        view.getJawaban1BeliObatBtn().addActionListener(new Jawaban1());
        view.getJawaban2BeliObatBtn().addActionListener(new Jawaban2());
        view.getJawaban3BeliObatBtn().addActionListener(new Jawaban3());

        //Deklarasi icon
        this.PasienNull = new ImageIcon(getClass().getResource("/img/150150null.png"));
        this.DropBox = new ImageIcon(getClass().getResource("/img/kotak.png"));
        //Deklarasi ikon kursi
        kursi = new ImageIcon[6];
        for (int i = 0; i < kursi.length; i++) {
            kursi[i] = new ImageIcon(getClass().getResource("/img/kursiplay" + (i + 1) + ".png"));
        }
        //Deklarasi ikon ac
        ac = new ImageIcon[3];
        for (int i = 0; i < ac.length; i++) {
            if (i == 0) {
                ac[i] = PasienNull;
            } else {
                ac[i] = new ImageIcon(getClass().getResource("/img/AC" + (i) + ".png"));
            }
        }
        //Deklarasi ikon wifi
        wifi = new ImageIcon[3];
        for (int i = 0; i < wifi.length; i++) {
            if (i == 0) {
                wifi[i] = PasienNull;
            } else {
                wifi[i] = new ImageIcon(getClass().getResource("/img/Wifi" + (i) + ".png"));
            }
        }
        String namaPasien = "";
        pasienIcon = new ImageIcon[5][3];
        for (int i = 0; i < 5; i++) { //i jenis
            switch (i) {
                case 0:
                    namaPasien = "apel";
                    break;
                case 1:
                    namaPasien = "jeruk";
                    break;
                case 2:
                    namaPasien = "kakao";
                    break;
                case 3:
                    namaPasien = "kelapa sawit";
                    break;
                case 4:
                    namaPasien = "kopi";
                    break;
            }
            for (int j = 0; j < 3; j++) { //level 
                //System.out.println(namaPasien);
                this.pasienIcon[i][j] = new ImageIcon(getClass().getResource("/img/" + namaPasien + " level " + (j + 1) + ".png"));
            }
        }
        //Seticon default
        view.getImgPasienDokter().setIcon(DropBox);
        view.getImgPasienApotek().setIcon(DropBox);
        view.getImgPasienFrame1().setIcon(PasienNull);
        view.getImgPasienFrame2().setIcon(PasienNull);
        view.getImgKursiFrame().setIcon(kursi[this.kursiSave]);
        view.getAc().setIcon(ac[this.acSave]);
        view.getWifi().setIcon(wifi[this.wifiSave]);

        //view.getImgPasienFrame2().setIcon(pasienIcon[1][0]);
        //thread
        try {
            //showPage(true);
            this.game.start();

            MouseListener ml = new MouseListener() {
                @Override
                public void mouseClicked(MouseEvent e) {

                }

                @Override
                public void mousePressed(MouseEvent e) {
                    JComponent jc = (JComponent) e.getSource();
                    TransferHandler th = jc.getTransferHandler();
                    th.exportAsDrag(jc, e, TransferHandler.MOVE);
                }

                @Override
                public void mouseReleased(MouseEvent e) {
                }

                @Override
                public void mouseEntered(MouseEvent e) {
                }

                @Override
                public void mouseExited(MouseEvent e) {
                }
            };
            //Add action listener
            view.getImgPasienFrame1().addMouseListener(ml);
            view.getImgPasienFrame2().addMouseListener(ml);
//            view.getImgPasienDokter().addMouseListener(ml);
//            view.getImgPasienApotek().addMouseListener(ml);
//            view.getBtnBeliObat().addActionListener(new beliObat());
            //transferhandler
            view.getImgPasienFrame1().setTransferHandler(new TransferHandler("icon") {
                @Override
                protected void exportDone(JComponent source, Transferable data, int action) {
                    if (action == MOVE) {
                        ondokter = onkursi1;
                        periksaobjek[ondokter] = true;
                        ((JLabel) source).setIcon(PasienNull);//Default
                        if (!view.getImgPasienDokter().getIcon().equals(DropBox)) {
                            Penyakit = dbnamaarray[objek[pasienke]];
                            view.setpopup("kamu sakit =" + Penyakit);
                            for (int i = 0; i < gejalaPasien[pasienke].length; i++) {
                                try {
                                    //System.out.println(gejalaPasien[pasienke][i]);
                                    Gejala += model.getNamaGejala(gejalaPasien[pasienke][i]) +"<br>";
                                } catch (SQLException ex) {
                                    Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            } 
                            view.setpopupGejala("<html>Gejala : <br>" + Gejala+"</html>");
                            System.out.println("ambil kursi 1");
                            view.TampilPopUp(true);

                        }
                    }
                }

                @Override
                public boolean canImport(TransferHandler.TransferSupport support) {
                    if (!view.getImgPasienFrame1().getIcon().equals(PasienNull)) {
                        return false;
                    }

                    return true;
                }

                @Override
                public int getSourceActions(JComponent c) {
                    if (!view.getImgPasienFrame1().getIcon().equals(PasienNull)) {
                        return COPY | MOVE;
                    } else {
                        return NONE;
                    }
                }
            });
            view.getImgPasienFrame2().setTransferHandler(new TransferHandler("icon") {
                @Override
                protected void exportDone(JComponent source, Transferable data, int action) {

                    if (action == MOVE) {
                        if (!view.getImgPasienDokter().getIcon().equals(DropBox)) {
                            Penyakit = dbnamaarray[objek[pasienke]];
                            view.setpopup("kamu sakit =" + Penyakit);
                            view.TampilPopUp(true);

                        }
                        for (int i = 0; i < gejalaPasien[pasienke].length; i++) {
                                try {
                                    //System.out.println(gejalaPasien[pasienke][i]);
                                    Gejala += model.getNamaGejala(gejalaPasien[pasienke][i]) +"<br>";
                                } catch (SQLException ex) {
                                    Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            } 
                            view.setpopupGejala("<html>Gejala : <br>" + Gejala+"</html>");
                        System.out.println("get kursi 2");
                        ondokter = onkursi1;
                        periksaobjek[ondokter] = true;
                        ((JLabel) source).setIcon(PasienNull);//Default
                    }
                }

                @Override
                public boolean canImport(TransferHandler.TransferSupport support) {
                    if (!view.getImgPasienFrame2().getIcon().equals(PasienNull)) {
                        return false;
                    }

                    return true;
                }

                @Override
                public int getSourceActions(JComponent c) {
                    if (!view.getImgPasienFrame2().getIcon().equals(PasienNull)) {
                        return COPY | MOVE;
                    } else {
                        return NONE;
                    }
                }
            });
            view.getImgPasienDokter().setTransferHandler(new TransferHandler("icon") {
                @Override
                protected void exportDone(JComponent source, Transferable data, int action) {

                    if (action == MOVE) {
                        ((JLabel) source).setIcon(DropBox);//Default
                    }

                }

                @Override
                public boolean canImport(TransferHandler.TransferSupport support) {
                    if (!view.getImgPasienDokter().getIcon().equals(DropBox)) {
                        return false;
                    }

                    return true;
                }

                @Override
                public int getSourceActions(JComponent c) {
                    if (!view.getImgPasienDokter().getIcon().equals(DropBox)) {
                        return COPY | MOVE;
                    } else {
                        return NONE;
                    }
                }
            });
//            view.getImgPasienApotek().setTransferHandler(new TransferHandler("icon") {
//                @Override
//                protected void exportDone(JComponent source, Transferable data, int action) {
//                    if (action == MOVE) {
//                        ((JLabel) source).setIcon(DropBox);//Default
//                    }
//                }
//
//                @Override
//                public boolean canImport(TransferHandler.TransferSupport support) {
//                    if (!view.getImgPasienApotek().getIcon().equals(DropBox)) {
//                        return false;
//                    }
//
//                    return true;
//                }
//
//                @Override
//                public int getSourceActions(JComponent c) {
//                    if (!view.getImgPasienApotek().getIcon().equals(DropBox)) {
//                        return COPY | MOVE;
//                    } else {
//                        return NONE;
//                    }
//                }
//            });
        } catch (Exception ex) {
            ex.printStackTrace();
            System.exit(0);
        }
    }

    public vHalamanMain getView() {
        return view;
    }

    private boolean isKosong(JLabel img) {
        if (img.getIcon().equals(PasienNull) || img.getIcon().equals(DropBox)) {
            return true;
        } else {
            return false;
        }
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

    private class Jawaban1 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {

            if (view.getJawaban1BeliObatBtn().getText().equals(jawabanBenar)) {
                score = Integer.valueOf(view.getLabelScore().getText());
                score += 100;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Benar");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);
            } else {
                score = Integer.valueOf(view.getLabelScore().getText());
                score -= 50;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Salah");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);
            }
            model.updateSkor(score, username, key);
        }
    }

    private class Jawaban2 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            int score;
            if (view.getJawaban2BeliObatBtn().getText().equals(jawabanBenar)) {
                score = Integer.valueOf(view.getLabelScore().getText());
                score += 100;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Benar");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);

            } else {
                score = Integer.valueOf(view.getLabelScore().getText());
                score -= 50;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Salah");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);
            }
            model.updateSkor(score, username, key);
        }
    }

    private class Jawaban3 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            int score;
            if (view.getJawaban2BeliObatBtn().getText().equals(jawabanBenar)) {
                score = Integer.valueOf(view.getLabelScore().getText());
                score += 100;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Benar");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);
            } else {
                score = Integer.valueOf(view.getLabelScore().getText());
                score -= 50;
                view.getLabelScore().setText(String.valueOf(score));
                view.message("Jawaban Anda Salah");
                view.getImgPasienApotek().setIcon(DropBox);
                view.TampilPopUpBeliObat(false);
                view.getBeliObatBtn().setVisible(true);
            }
            model.updateSkor(score, username, key);
        }
    }

    private class BeliObatAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (!view.getImgPasienApotek().getIcon().equals(DropBox)) {
                try {
                    String[] jawaban = model.getObat(Penyakit);
                    view.getJawaban1BeliObatBtn().setText(jawaban[0]);
                    view.getJawaban2BeliObatBtn().setText(jawaban[1]);
                    view.getJawaban3BeliObatBtn().setText(jawaban[2]);
                    jawabanBenar = jawaban[3];
                    view.getBeliObatBtn().setVisible(false);
                } catch (SQLException ex) {
                    Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                }
                view.TampilPopUpBeliObat(true);
            }
        }
    }

    private class OkPopUpAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (view.getImgPasienApotek().getIcon().equals(DropBox)) {
                view.TampilPopUp(false);
                view.getImgPasienApotek().setIcon(view.getImgPasienDokter().getIcon());
                view.getImgPasienDokter().setIcon(DropBox);
                view.setpopupGejala("");
                Gejala = "";
            } else {
                JOptionPane.showMessageDialog(view, "Mohon antri!");
            }
        }
    }

    private class periksa implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (!isKosong(view.getImgPasienDokter())) {
                //lek dokter onok koncone
                adaPopup = true;
                view.setEnabled(false);
                new cHalamanDokter(cHalamanMain.this).showPage(true);
            }
        }
    }

    public int[] getGejala() {
        Random rand = new Random();
        int[] gejala = new int[4];
        for (int i = 0; i < gejala.length; i++) {
            gejala[i] = rand.nextInt(13) + 1;
        }
        return gejala;
    }

    public double hitungCF(double cf1, double cf2) {
        double value;
        if (isPositive(cf1) && isPositive(cf2)) { //keduanya positif
            value = cf1 + (cf2 * (1 - cf1));
            return value;
        } else if (!isPositive(cf1) && !isPositive(cf2)) { //keduanya negatif
            value = cf1 + (cf2 * (1 + cf1));
            return value;
        } else { //salah satu negatif
            value = (cf1 + cf2) / (1 - Math.min(cf1, cf2));
            return value;
        }
    }

    public boolean isPositive(double n) {
        if (n >= 0) {
            return true;
        } else {
            return false;
        }
    }

    public int getpenyakit() throws SQLException {
        Random rand = new Random();
        double[] arrayPenyakit = new double[8];
        for (int i = 0; i < arrayPenyakit.length; i++) {
            arrayPenyakit[i] = 0.0;
        }

        double[] arrayCFGejala = new double[4];
        for (int i = 0; i < arrayCFGejala.length; i++) {
            arrayCFGejala[i] = 0.0;
        }

        System.out.println("==============================================================");
        for (int i = 0; i < arrayPenyakit.length; i++) {
            for (int j = 0; j < arrayCFGejala.length; j++) { //masukin CF ke array
                arrayCFGejala[j] = model.getCFsatu(i + 1, gejalaPasien[pasienke][j]); //penyakit i gejala j
                System.out.println("penyakit " + (i + 1) + " psien " + pasienke + " gejala " + j + " CF " + arrayCFGejala[j]);
            }
            System.out.println("==============================================================");
            arrayPenyakit[i] = hitungCF(arrayCFGejala[0], arrayCFGejala[1]);
            System.out.println(arrayPenyakit[i]);
            for (int j = 2; j < arrayCFGejala.length; j++) {
                arrayPenyakit[i] = hitungCF(arrayPenyakit[i], arrayCFGejala[j]);
                System.out.println(arrayPenyakit[i]);
            }
            //arrayPenyakit[i] = hitungCF(i, i);

            System.out.println("CF Penyakit ke " + i + " adalah " + arrayPenyakit[i]);
            System.out.println("==============================================================");
        }

        double max = Double.MIN_VALUE;
        for (int i = 0; i < arrayPenyakit.length; i++) {
            if (arrayPenyakit[i] > max) {
                max = arrayPenyakit[i];
            }
        }

        for (int i = 0; i < arrayPenyakit.length; i++) {
            if (arrayPenyakit[i] == max) {
                return i;
            }
        }
        return 0;

    }

    private class klikShop implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            Controller.cshop a =null ;
            try {
                a = new Controller.cshop(new vShop(), view ,username,key);
            } catch (SQLException ex) {
                Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
            }
            a.view.setVisible(true);
        }

    }

    private class mulaiPermainan extends Thread {

        int moduloSpawnPasien, pasienIdx, pasienLvl;
        Random random;

        public mulaiPermainan() {
            waktuJalan = 1;
            random = new Random();

        }

        public void run() {
            //showPage(true);
            while (true) {
                waktuJalan++;
                //System.out.println(waktuJalan);
                moduloSpawnPasien = random.nextInt(3) + 1;
                if (waktuJalan % moduloSpawnPasien == 0) {
                    if (isKosong(view.getImgPasienFrame1())) { //kalau yg kursi 1 kosong
                        try {
                            pasienke++;
                            pasienIdx = random.nextInt(5);
                            pasienLvl = 0;
                            view.getImgPasienFrame1().setIcon(pasienIcon[pasienIdx][pasienLvl]);
                            periksaobjek[pasienke] = false;
                            gejalaPasien[pasienke] = getGejala();
                            objek[pasienke] = getpenyakit();
                            onkursi1 = pasienke;
                            System.out.println("pasien ke " + pasienke + "sakit = " + objek[pasienke]);
                        } catch (SQLException ex) {
                            Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else if (isKosong(view.getImgPasienFrame2())) { //kalau yg kursi 2 kosong
                        try {
                            pasienke++;
                            pasienIdx = random.nextInt(5);
                            pasienLvl = 0;
                            view.getImgPasienFrame2().setIcon(pasienIcon[pasienIdx][pasienLvl]);
                            gejalaPasien[pasienke] = getGejala();
                            objek[pasienke] = getpenyakit();
                            periksaobjek[pasienke] = false;
                            onkursi2 = pasienke;
                            System.out.println("pasien ke " + pasienke + "sakit = " + objek[pasienke]);
                        } catch (SQLException ex) {
                            Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

                try {
                    sleep(4000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(cHalamanMain.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

}

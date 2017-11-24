package model;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.swing.table.DefaultTableModel;

public class koneksi {

    Connection con;
    Statement stm;

    public koneksi() throws SQLException {
        String url = "jdbc:mysql://localhost/ppl"; //url DB
        String username = "root"; //username DB
        String pass = ""; //password DB, Jika tidak di Password silahkan di Kosongkan.

        //membuat koneksi ke DB
        this.con = (Connection) DriverManager.getConnection(url, username, pass);
        this.stm = (Statement) this.con.createStatement();
    }

    //method untuk ekesekusi query Insert, Update, dan Delete
    public void executeQuery(String query) throws SQLException {
        this.stm.execute(query);
    }

    //method untuk ekesekusi query Select
    public ResultSet getResult(String query) throws SQLException {
        ResultSet rs = stm.executeQuery(query);
        return rs;
    }

    public boolean execute(String query) {
        boolean sukseseksekusi;
        try {
            executeQuery(query);
            sukseseksekusi = true;
            System.out.println("query berhasil");
        } catch (SQLException ex) {
            sukseseksekusi = false;
            System.out.println("query salah");
        }

        return sukseseksekusi;
    }

    public String getdata(String query) throws SQLException {
        String data = null;
        ResultSet rs = getResult(query);
        if (rs.next()) {
            data = rs.getString(1);
        }
        return data;
    }

    public String getgejalafromdb(int idgejala) throws SQLException {
        String query = " select Gejala from gejala where idGejala = " + idgejala;
        return getdata(query);
    }

    private int random(int max) {
        Random angka = new Random();
        return angka.nextInt(max);
    }

    public String[] getObat(String penyakit) throws SQLException {
        int[] acakan = new int[3];
        acakan[0] = random(3);
        do {
            acakan[1] = random(3);
        } while (acakan[0] == acakan[1]);
        do {
            acakan[2] = random(3);
        } while (acakan[2] == acakan[1] || acakan[2] == acakan[0]);
        String[] jawaban = new String[4];
        String querya = "SELECT NamaObat FROM apotekview WHERE NamaPenyakit = '" + penyakit + "'";
        System.out.println(querya);
        ResultSet rs = getResult(querya);
        rs.first();
        jawaban[3] = rs.getString(1); //jawaban benar
        jawaban[acakan[0]] = jawaban[3];
        String[] Jsalah = new String[2];
        for (int i = 0; i < Jsalah.length; i++) {
            ResultSet a;
            do {
                a = getResult("select NamaObat from obat where idObat = " + random(8) + " && NamaObat not like '" + jawaban[3] + "'");
                a.first();
            } while (a.getRow()==0);
                Jsalah[i] = a.getString(1);
        }
        jawaban[acakan[1]] = Jsalah[0];
        jawaban[acakan[2]] = Jsalah[1];
        return jawaban;
    }

    public DefaultTableModel getData() throws SQLException {
        String kolom[] = {"JenisIkan_ID", "Nama", "Stok"};
        DefaultTableModel model = new DefaultTableModel(null, kolom);
        String query = "select JenisIkan_ID, Nama, Stok from jenisikan ";
        ResultSet rs = getResult(query);
        while (rs.next()) {
            String row[] = new String[3];
            for (int i = 0; i < row.length; i++) {
                row[i] = rs.getString(i + 1);
            }
            model.addRow(row);
        }
        return model;
    }

    public double getDouble(String query) throws SQLException {
        double data = 0.0;
        ResultSet rs = getResult(query);
        if (rs.next()) {
            data = rs.getDouble(1);
        }
        return data;
    }
    public int getInt(String query) throws SQLException {
        int data = 0;
        ResultSet rs = getResult(query);
        if (rs.next()) {
            data = rs.getInt(1);
        }
        return data;
    }

//    public String getgejalafromdb(int idgejala) throws SQLException {
//        String query = " select Gejala from gejala where idGejala = " + idgejala;
//        return getdata(query);
//    }
    public double getCFsatu(int idPenyakit, int idgejala) throws SQLException {
        String query = " select CFPakar from pakar where id_Gejala = " + idgejala + " and idPenyakit = " + idPenyakit;
        System.out.println(query);
        return getDouble(query);
    }

    public String checkUsername(String username) throws SQLException {
        String query = " select username from skor where username = '" + username + "'";
        return getdata(query);
    }

    public void insertNewUsername(int skor, String username, String key) {
        String query = "INSERT INTO skor (skor, username, userkey) VALUES (" + skor + ",'" + username + "','" + key + "')";
        //System.out.println(query);
        execute(query);
    }

    public void updateSkor(int skor, String username, String key) {
        String query = "UPDATE skor SET skor = " + skor + " WHERE username like '" + username + "' && userkey like '" + key + "'";
        System.out.println(query);
        execute(query);
    }
    public void updateKursi(int kursi, String username, String key) {
        String query = "UPDATE skor SET kursi = " + kursi + " WHERE username like '" + username + "' && userkey like '" + key + "'";
        System.out.println(query);
        execute(query);
    }
    public void updateAc(int ac, String username, String key) {
        String query = "UPDATE skor SET ac = " + ac + " WHERE username like '" + username + "' && userkey like '" + key + "'";
        System.out.println(query);
        execute(query);
    }
    public void updateWifi(int wifi, String username, String key) {
        String query = "UPDATE skor SET wifi = " + wifi + " WHERE username like '" + username + "' && userkey like '" + key + "'";
        System.out.println(query);
        execute(query);
    }
    
    public int getScore(String username, String key) throws SQLException{
        String query = " select skor from skor where username like '" + username + "' and userkey like '" + key + "'";
        System.out.println(query);
        return getInt(query);
    }
    public int getWifi(String username, String key) throws SQLException{
        String query = " select wifi from skor where username like '" + username + "' and userkey like '" + key + "'";
        //System.out.println(query);
        return getInt(query);
    }
    public int getKursi(String username, String key) throws SQLException{
        String query = " select kursi from skor where username like '" + username + "' and userkey like '" + key + "'";
        //System.out.println(query);
        return getInt(query);
    }
    public int getAc(String username, String key) throws SQLException{
        String query = " select ac from skor where username like '" + username + "' and userkey like '" + key + "'";
        //System.out.println(query);
        return getInt(query);
    }

//    public String getobat (int idtanaman,int idpenyakit,int idgejala,float cfpakar){
//String query = "select id obat where idTanaman ="+idtanaman+" and "
//        return 
//}
}

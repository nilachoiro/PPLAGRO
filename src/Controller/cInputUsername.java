/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.vInputUsername;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.koneksi;

/**
 *
 * @author DWI WAHYU
 */
public class cInputUsername {

    vInputUsername view;
    koneksi model;

    public cInputUsername() throws SQLException {
        this.view = new vInputUsername();
        this.model = new koneksi();
        view.getBtnOk().addActionListener(new OkAction());

    }

    public String generateKey() {
        String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int count = 32;
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }

    public void writeSavefile(String fileName, String username, String key) throws IOException {
    FileWriter fileWriter = new FileWriter(fileName);
    PrintWriter printWriter = new PrintWriter(fileWriter);
    printWriter.println(username);
    printWriter.print(key);
    printWriter.close();
}
    
    private class OkAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (!view.getUsername().getText().isEmpty()) {
                try {
                    String username = view.getUsername().getText();

                    if (model.checkUsername(username) != null) { //username terpakai
                        JOptionPane.showMessageDialog(view, "Username sudah digunakan!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
                    } else {
                        String key = generateKey();
                        writeSavefile("save.txt", username, key); //write save file
                        model.insertNewUsername(0, username,key);
                        new cHalamanMain(username,key,0,0,0,0).showPage(true);
                        view.dispose();
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(cInputUsername.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(cInputUsername.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                JOptionPane.showMessageDialog(view, "Username tidak boleh kosong!", "Peringatan!", JOptionPane.WARNING_MESSAGE);
            }
        }
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

}

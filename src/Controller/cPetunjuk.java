/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.vPetunjuk;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DWI WAHYU
 */
public class cPetunjuk {

    vPetunjuk view;

    public cPetunjuk() {
        this.view = new vPetunjuk();
        view.getBtnOk().addActionListener(new OkAction());
    }

    private class OkAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            try {
                new cHalamanAwal().showPage(true);
            } catch (SQLException ex) {
                Logger.getLogger(cPetunjuk.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            view.dispose();
        }
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }
}

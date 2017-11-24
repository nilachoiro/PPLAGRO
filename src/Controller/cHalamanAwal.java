/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import View.vHalamanAwal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author DWI WAHYU
 */
public class cHalamanAwal {
    vHalamanAwal view;

    public cHalamanAwal() {
        this.view = new vHalamanAwal();
        view.getBtnPetunjuk().addActionListener(new PetunjukAction());
        view.getBtnNewGame().addActionListener(new NewGameAction());
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

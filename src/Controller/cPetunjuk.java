/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.vPetunjuk;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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
            new cHalamanAwal().showPage(true);
            view.dispose();
        }
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }
}

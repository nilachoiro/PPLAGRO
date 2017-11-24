/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.shop;
import View.vHalamanDokter;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 *
 * @author DWI WAHYU
 */
public class cshop {

   shop view;
    cHalamanMain cSebelumnya;
    public cshop(shop shop) {
        this.view =shop;
        this.cSebelumnya = cSebelumnya;
        view.klikkembali(new klikkembali());
        view.setEnabled(true);
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

    private  class klikkembali implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            view.dispose();
        }

    }

}

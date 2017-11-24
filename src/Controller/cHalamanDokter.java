/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import View.vHalamanDokter;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 *
 * @author DWI WAHYU
 */
public class cHalamanDokter {

    vHalamanDokter view;
    cHalamanMain cSebelumnya;
    public cHalamanDokter(cHalamanMain cSebelumnya) {
        this.view = new vHalamanDokter();
        this.cSebelumnya = cSebelumnya;
        view.getBtnKembali().addActionListener(new KembaliAction());
    }

    public void showPage(boolean status) {
        view.setVisible(status);
    }

    private  class KembaliAction implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            cSebelumnya.setAdaPopup(false);
            cSebelumnya.getView().setEnabled(true);
            view.dispose();
        }

    }
    
    private void sppkCF(String jenisTanaman){
        
    }

}

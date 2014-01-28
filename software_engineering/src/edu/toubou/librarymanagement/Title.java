/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.toubou.librarymanagement;

/**
 *
 * @author theo
 */
public class Title {
    
    protected String titleId;
    protected String titleName;
    protected int itemNo;
    
    public String getTitleId() {
        return titleId;
    }
    
    public String getTitleName() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public int getItemNo() {
        return itemNo;
    }

    public void setItemNo(int itemNo) {
        this.itemNo = itemNo;
    }
}

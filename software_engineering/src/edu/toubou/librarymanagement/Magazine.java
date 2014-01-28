/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.toubou.librarymanagement;

import java.util.Date;

/**
 *
 * @author theo
 */
public class Magazine extends Title {

    private String type;
    private Date month;
    private String owner;
    
    public void setType(String type) {
        this.type = type;
    }

    public void setMonth(Date month) {
        this.month = month;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
    
    
}

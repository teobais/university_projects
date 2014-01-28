/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.toubou.librarymanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author theo
 */
public class Member {

    /*variables required for database manipulations*/
    Connection connection = DatabaseConnection.getConnection(); //rapid initilization
    ResultSet rs = null;
    PreparedStatement pst = null;
    /* end of variables required for database manipulations*/
    
    protected String memberId;
    protected String firstName;
    protected String lastName;
    protected String email;
    protected int itemsBorrowed;
    
    
    
    public String getMemberId() {
        return memberId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getItemsBorrowed() {
        return itemsBorrowed;
    }

    public void setItemsBorrowed(int itemsBorrowed) {
        this.itemsBorrowed = itemsBorrowed;
    }
    
       
}

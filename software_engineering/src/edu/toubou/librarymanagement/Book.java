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
public class Book extends Title {

    private String author;
    private Date year;
    private String kind;
    private String ISBN;
    private int pages;
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }
    
    
}

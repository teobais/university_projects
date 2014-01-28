/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.toubou.librarymanagement;

/**
 *
 * @author theo
 */
public class Faculty extends Member {
    
    private String facultyId;
    private int limit = 10;
    
    public String getFacultyId()
    {
        return facultyId;
    }
    
    public int getLimit()
    {
        return limit;
    }

}

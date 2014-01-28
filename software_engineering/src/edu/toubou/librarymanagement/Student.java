/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.toubou.librarymanagement;

/**
 *
 * @author theo
 */
public class Student extends Member {
    
    private String AEM;
    private int limit = 3;
    
    public String getAEM()
    {
        return AEM;
    }
    
    public int getLimit()
    {
        return limit;
    }
}

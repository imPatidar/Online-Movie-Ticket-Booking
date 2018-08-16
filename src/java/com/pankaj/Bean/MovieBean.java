/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pankaj.Bean;

import java.sql.Blob;

/**
 *
 * @author hp
 */
public class MovieBean
{
    String moviename;
    String caste;
    String genre;
    String movieimage;
    String movietheatreid;

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getMovieimage() {
        return movieimage;
    }

    public void setMovieimage(String movieimage) {
        this.movieimage = movieimage;
    }

    public String getMovietheatreid() {
        return movietheatreid;
    }

    public void setMovietheatreid(String movietheatreid) {
        this.movietheatreid = movietheatreid;
    }

   
   
    
    
}

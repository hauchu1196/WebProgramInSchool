/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Phuc Do
 */
public class Category {

    private int id;
    private String name, alias;

    public Category() {
    }

    public Category(int id, String name, String alias) {
        this.id = id;
        this.name = name;
        this.alias = alias;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String toDatatable() {
        return "[\"" + id + "\",\"" + name + "\",\"" + alias + "\"]"; 
    }
}

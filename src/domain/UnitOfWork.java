package domain;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author A
 */
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import dataMapper.MapperRegistry;


public class UnitOfWork {
    
    private List newObjects = new ArrayList();
    private List dirtyObjects = new ArrayList();
    private List removedObjects = new ArrayList();
    
    public void addNewObject(Product object)
    {
        if(!dirtyObjects.contains(object)&&!removedObjects.contains(object)&&!newObjects.contains(object))
        {
            newObjects.add(object);
        }
    }
    
    public void addDirtyObject(Product object)
    {
        if(!dirtyObjects.contains(object)&&!removedObjects.contains(object)&&!newObjects.contains(object))
        {
            dirtyObjects.add(object);
        }
    }
    
    public void addCleanObject(Product object)
    {
        if(!newObjects.remove(object))
            dirtyObjects.remove(object);
        if(!removedObjects.contains(object))
            removedObjects.add(object);
    }
    
    public void commit()
    {
        insertNew();
        updateDirty();
        deleteRemoved();
    }
    
    private void insertNew()
    {
        
        for(Iterator objects = newObjects.iterator(); objects.hasNext();)
        {
            Product object = (Product) objects.next();
            MapperRegistry mapper = new MapperRegistry();
            mapper.addProduct(object);        
        }
    }
    
    private void updateDirty()
    {
         for(Iterator objects = newObjects.iterator(); objects.hasNext();)
        {
            Product object = (Product) objects.next();
            MapperRegistry mapper = new MapperRegistry();
            mapper.editProduct(object);        
        }
    }

    private void deleteRemoved()
    {
        for(Iterator objects = newObjects.iterator(); objects.hasNext();)
        {
            Product object = (Product) objects.next();
            MapperRegistry mapper = new MapperRegistry();
            mapper.deleteProduct(object);        
        }
    }
    
}

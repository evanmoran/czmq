/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
package org.zeromq.czmq;

public class Zhash implements AutoCloseable{
    static {
        try {
            System.loadLibrary ("czmqjni");
        }
        catch (Exception e) {
            System.exit (-1);
        }
    }
    public long self;
    /*
    Create a new, empty hash container
    */
    native static long __new ();
    public Zhash () {
        /*  TODO: if __new fails, self is null...            */
        self = __new ();
    }
    public Zhash (long pointer) {
        self = pointer;
    }
    /*
    Unpack binary frame into a new hash table. Packed data must follow format
    defined by zhash_pack. Hash table is set to autofree. An empty frame     
    unpacks to an empty hash table.                                          
    */
    native static long __unpack (long frame);
    public Zhash unpack (Zframe frame) {
        return new Zhash (__unpack (frame.self));
    }
    /*
    Destroy a hash container and all items in it
    */
    native static void __destroy (long self);
    @Override
    public void close () {
        __destroy (self);
        self = 0;
    }
    /*
    Insert item into hash table with specified key and item.               
    If key is already present returns -1 and leaves existing item unchanged
    Returns 0 on success.                                                  
    */
    native static int __insert (long self, String key, long item);
    public int insert (String key, long item) {
        return __insert (self, key, item);
    }
    /*
    Update item into hash table with specified key and item.            
    If key is already present, destroys old item and inserts new one.   
    Use free_fn method to ensure deallocator is properly called on item.
    */
    native static void __update (long self, String key, long item);
    public void update (String key, long item) {
        __update (self, key, item);
    }
    /*
    Remove an item specified by key from the hash table. If there was no such
    item, this function does nothing.                                        
    */
    native static void __delete (long self, String key);
    public void delete (String key) {
        __delete (self, key);
    }
    /*
    Return the item at the specified key, or null
    */
    native static long __lookup (long self, String key);
    public long lookup (String key) {
        return __lookup (self, key);
    }
    /*
    Reindexes an item from an old key to a new key. If there was no such
    item, does nothing. Returns 0 if successful, else -1.               
    */
    native static int __rename (long self, String oldKey, String newKey);
    public int rename (String oldKey, String newKey) {
        return __rename (self, oldKey, newKey);
    }
    /*
    Return the number of keys/items in the hash table
    */
    native static long __size (long self);
    public long size () {
        return __size (self);
    }
    /*
    Make copy of hash table; if supplied table is null, returns null.    
    Does not copy items themselves. Rebuilds new table so may be slow on 
    very large tables. NOTE: only works with item values that are strings
    since there's no other way to know how to duplicate the item value.  
    */
    native static long __dup (long self);
    public Zhash dup () {
        return new Zhash (__dup (self));
    }
    /*
    Return keys for items in table
    */
    native static long __keys (long self);
    public Zlist keys () {
        return new Zlist (__keys (self));
    }
    /*
    Simple iterator; returns first item in hash table, in no given order, 
    or NULL if the table is empty. This method is simpler to use than the 
    foreach() method, which is deprecated. To access the key for this item
    use zhash_cursor(). NOTE: do NOT modify the table while iterating.    
    */
    native static long __first (long self);
    public long first () {
        return __first (self);
    }
    /*
    Simple iterator; returns next item in hash table, in no given order, 
    or NULL if the last item was already returned. Use this together with
    zhash_first() to process all items in a hash table. If you need the  
    items in sorted order, use zhash_keys() and then zlist_sort(). To    
    access the key for this item use zhash_cursor(). NOTE: do NOT modify 
    the table while iterating.                                           
    */
    native static long __next (long self);
    public long next () {
        return __next (self);
    }
    /*
    After a successful first/next method, returns the key for the item that
    was returned. This is a constant string that you may not modify or     
    deallocate, and which lasts as long as the item in the hash. After an  
    unsuccessful first/next, returns NULL.                                 
    */
    native static String __cursor (long self);
    public String cursor () {
        return __cursor (self);
    }
    /*
    Add a comment to hash table before saving to disk. You can add as many   
    comment lines as you like. These comment lines are discarded when loading
    the file. If you use a null format, all comments are deleted.            
    */
    native static void __comment (long self, String format);
    public void comment (String format) {
        __comment (self, format);
    }
    /*
    Serialize hash table to a binary frame that can be sent in a message.
    The packed format is compatible with the 'dictionary' type defined in
    http://rfc.zeromq.org/spec:35/FILEMQ, and implemented by zproto:     
                                                                         
       ; A list of name/value pairs                                      
       dictionary      = dict-count *( dict-name dict-value )            
       dict-count      = number-4                                        
       dict-value      = longstr                                         
       dict-name       = string                                          
                                                                         
       ; Strings are always length + text contents                       
       longstr         = number-4 *VCHAR                                 
       string          = number-1 *VCHAR                                 
                                                                         
       ; Numbers are unsigned integers in network byte order             
       number-1        = 1OCTET                                          
       number-4        = 4OCTET                                          
                                                                         
    Comments are not included in the packed data. Item values MUST be    
    strings.                                                             
    */
    native static long __pack (long self);
    public Zframe pack () {
        return new Zframe (__pack (self));
    }
    /*
    Save hash table to a text file in name=value format. Hash values must be
    printable strings; keys may not contain '=' character. Returns 0 if OK, 
    else -1 if a file error occurred.                                       
    */
    native static int __save (long self, String filename);
    public int save (String filename) {
        return __save (self, filename);
    }
    /*
    Load hash table from a text file in name=value format; hash table must 
    already exist. Hash values must printable strings; keys may not contain
    '=' character. Returns 0 if OK, else -1 if a file was not readable.    
    */
    native static int __load (long self, String filename);
    public int load (String filename) {
        return __load (self, filename);
    }
    /*
    When a hash table was loaded from a file by zhash_load, this method will
    reload the file if it has been modified since, and is "stable", i.e. not
    still changing. Returns 0 if OK, -1 if there was an error reloading the 
    file.                                                                   
    */
    native static int __refresh (long self);
    public int refresh () {
        return __refresh (self);
    }
    /*
    Set hash for automatic value destruction
    */
    native static void __autofree (long self);
    public void autofree () {
        __autofree (self);
    }
    /*
    Self test of this class.
    */
    native static void __test (boolean verbose);
    public static void test (boolean verbose) {
        __test (verbose);
    }
}

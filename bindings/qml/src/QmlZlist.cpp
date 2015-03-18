/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/

#include "QmlZlist.h"


///
//  Return the item at the head of list. If the list is empty, returns NULL.
//  Leaves cursor pointing at the head item, or NULL if the list is empty.  
void *QmlZlist::first () {
    return zlist_first (self);
};

///
//  Return the next item. If the list is empty, returns NULL. To move to
//  the start of the list call zlist_first (). Advances the cursor.     
void *QmlZlist::next () {
    return zlist_next (self);
};

///
//  Return the item at the tail of list. If the list is empty, returns NULL.
//  Leaves cursor pointing at the tail item, or NULL if the list is empty.  
void *QmlZlist::last () {
    return zlist_last (self);
};

///
//  Return first item in the list, or null, leaves the cursor
void *QmlZlist::head () {
    return zlist_head (self);
};

///
//  Return last item in the list, or null, leaves the cursor
void *QmlZlist::tail () {
    return zlist_tail (self);
};

///
//  Return the current item of list. If the list is empty, returns NULL.     
//  Leaves cursor pointing at the current item, or NULL if the list is empty.
void *QmlZlist::item () {
    return zlist_item (self);
};

///
//  Append an item to the end of the list, return 0 if OK or -1 if this   
//  failed for some reason (out of memory). Note that if a duplicator has 
//  been set, this method will also duplicate the item.                   
int QmlZlist::append (void *item) {
    return zlist_append (self, item);
};

///
//  Push an item to the start of the list, return 0 if OK or -1 if this  
//  failed for some reason (out of memory). Note that if a duplicator has
//  been set, this method will also duplicate the item.                  
int QmlZlist::push (void *item) {
    return zlist_push (self, item);
};

///
//  Pop the item off the start of the list, if any
void *QmlZlist::pop () {
    return zlist_pop (self);
};

///
//  Remove the specified item from the list if present
void QmlZlist::remove (void *item) {
    zlist_remove (self, item);
};

///
//  Make a copy of list. If the list has autofree set, the copied list will         
//  duplicate all items, which must be strings. Otherwise, the list will hold       
//  pointers back to the items in the original list.                                
//  The caller is responsible for destroying the return value when finished with it.
QmlZlist *QmlZlist::dup () {
    QmlZlist *retQ_ = new QmlZlist ();
    retQ_->self = zlist_dup (self);
    return retQ_;
};

///
//  Purge all items from list
void QmlZlist::purge () {
    zlist_purge (self);
};

///
//  Return number of items in the list
size_t QmlZlist::size () {
    return zlist_size (self);
};

///
//  Sort the list by ascending key value using a straight ASCII comparison.
//  The sort is not stable, so may reorder items with the same keys.       
void QmlZlist::sort (zlist_compare_fn compare) {
    zlist_sort (self, compare);
};

///
//  Set list for automatic item destruction; item values MUST be strings. 
//  By default a list item refers to a value held elsewhere. When you set 
//  this, each time you append or push a list item, zlist will take a copy
//  of the string value. Then, when you destroy the list, it will free all
//  item values automatically. If you use any other technique to allocate 
//  list values, you must free them explicitly before destroying the list.
//  The usual technique is to pop list items and destroy them, until the  
//  list is empty.                                                        
void QmlZlist::autofree () {
    zlist_autofree (self);
};

///
//  Set a free function for the specified list item. When the item is     
//  destroyed, the free function, if any, is called on that item.         
//  Use this when list items are dynamically allocated, to ensure that    
//  you don't have memory leaks. You can pass 'free' or NULL as a free_fn.
//  Returns the item, or NULL if there is no such item.                   
void *QmlZlist::freefn (void *item, zlist_free_fn fn, bool atTail) {
    return zlist_freefn (self, item, fn, atTail);
};


QObject* QmlZlist::qmlAttachedProperties(QObject* object) {
    return new QmlZlistAttached(object);
}


///
//  Self test of this class
void QmlZlistAttached::test (int verbose) {
    zlist_test (verbose);
};

///
//  Create a new list container
QmlZlist *QmlZlistAttached::construct () {
    QmlZlist *qmlSelf = new QmlZlist ();
    qmlSelf->self = zlist_new ();
    return qmlSelf;
};

///
//  Destroy a list container
void QmlZlistAttached::destruct (QmlZlist *qmlSelf) {
    zlist_destroy (&qmlSelf->self);
};

/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/

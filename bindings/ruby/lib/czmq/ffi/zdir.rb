################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module CZMQ
  module FFI
    
    # work with file-system directories
    class Zdir
      class DestroyedError < RuntimeError; end
      
      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      def initialize ptr, finalize=true
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.send :create_finalizer_for, @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      def self.create_finalizer_for ptr
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zdir_destroy ptr_ptr
        end
      end
      def null?
        !@ptr or ptr.null?
      end
      # Return internal pointer
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # Nullify internal pointer and return pointer pointer
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        ObjectSpace.undefine_finalizer self if @finalizer
        @finalizer = nil
        @ptr = nil
        ptr_ptr
      end
      
      # Create a new directory item that loads in the full tree of the specified
      # path, optionally located under some parent path. If parent is "-", then 
      # loads only the top-level directory, and does not use parent as a path.  
      def self.new path, parent
        path = String(path)
        parent = String(parent)
        ptr = ::CZMQ::FFI.zdir_new path, parent
        
        __new ptr
      end
      
      # Destroy a directory tree and all children it contains.
      def destroy
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zdir_destroy self_p
        result
      end
      
      # Return directory path
      def path
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_path @ptr
        result
      end
      
      # Return last modification time for directory.
      def modified
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_modified @ptr
        result
      end
      
      # Return total hierarchy size, in bytes of data contained in all files
      # in the directory tree.                                              
      def cursize
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_cursize @ptr
        result
      end
      
      # Return directory count
      def count
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_count @ptr
        result
      end
      
      # Returns a sorted list of zfile objects; Each entry in the list is a pointer     
      # to a zfile_t item already allocated in the zdir tree. Do not destroy the        
      # original zdir tree until you are done with this list.                           
      # The caller is responsible for destroying the return value when finished with it.
      def list
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_list @ptr
        result = Zlist.__new result, true
        result
      end
      
      # Remove directory, optionally including all files that it contains, at  
      # all levels. If force is false, will only remove the directory if empty.
      # If force is true, will remove all files and all subdirectories.        
      def remove force
        raise DestroyedError unless @ptr
        force = !(0==force||!force) # boolean
        result = ::CZMQ::FFI.zdir_remove @ptr, force
        result
      end
      
      # Calculate differences between two versions of a directory tree.                 
      # Returns a list of zdir_patch_t patches. Either older or newer may               
      # be null, indicating the directory is empty/absent. If alias is set,             
      # generates virtual filename (minus path, plus alias).                            
      # The caller is responsible for destroying the return value when finished with it.
      def self.diff older, newer, alias
        older = older.__ptr if older
        newer = newer.__ptr if newer
        alias = String(alias)
        result = ::CZMQ::FFI.zdir_diff older, newer, alias
        result = Zlist.__new result, true
        result
      end
      
      # Return full contents of directory as a zdir_patch list.                         
      # The caller is responsible for destroying the return value when finished with it.
      def resync alias
        raise DestroyedError unless @ptr
        alias = String(alias)
        result = ::CZMQ::FFI.zdir_resync @ptr, alias
        result = Zlist.__new result, true
        result
      end
      
      # Load directory cache; returns a hash table containing the SHA-1 digests         
      # of every file in the tree. The cache is saved between runs in .cache.           
      # The caller is responsible for destroying the return value when finished with it.
      def cache
        raise DestroyedError unless @ptr
        result = ::CZMQ::FFI.zdir_cache @ptr
        result = Zhash.__new result, true
        result
      end
      
      # Print contents of directory to open stream
      def fprint file, indent
        raise DestroyedError unless @ptr
        indent = Integer(indent)
        result = ::CZMQ::FFI.zdir_fprint @ptr, file, indent
        result
      end
      
      # Print contents of directory to stdout
      def print indent
        raise DestroyedError unless @ptr
        indent = Integer(indent)
        result = ::CZMQ::FFI.zdir_print @ptr, indent
        result
      end
      
      # Create a new zdir_watch actor instance:                       
      #                                                               
      #     zactor_t *watch = zactor_new (zdir_watch, NULL);          
      #                                                               
      # Destroy zdir_watch instance:                                  
      #                                                               
      #     zactor_destroy (&watch);                                  
      #                                                               
      # Enable verbose logging of commands and activity:              
      #                                                               
      #     zstr_send (watch, "VERBOSE");                             
      #                                                               
      # Subscribe to changes to a directory path:                     
      #                                                               
      #     zsock_send (watch, "ss", "SUBSCRIBE", "directory_path");  
      #                                                               
      # Unsubscribe from changes to a directory path:                 
      #                                                               
      #     zsock_send (watch, "ss", "UNSUBSCRIBE", "directory_path");
      #                                                               
      # Receive directory changes:                                    
      #     zsock_recv (watch, "sp", &path, &patches);                
      #                                                               
      #     // Delete the received data.                              
      #     free (path);                                              
      #     zlist_destroy (&patches);                                 
      def self.watch pipe, unused
        pipe = pipe.__ptr if pipe
        result = ::CZMQ::FFI.zdir_watch pipe, unused
        result
      end
      
      # Self test of this class.
      def self.test verbose
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zdir_test verbose
        result
      end
    end
    
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

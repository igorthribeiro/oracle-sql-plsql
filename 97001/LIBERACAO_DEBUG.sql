BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
host => '127.0.0.1',
ace => xs$ace_type(privilege_list => xs$name_list('jdwp'),
principal_name => 'ora41',
principal_type => xs_acl.ptype_db));
END;
/
GRANT DEBUG ANY PROCEDURE TO ora41;
GRANT DEBUG CONNECT SESSION TO ora41;
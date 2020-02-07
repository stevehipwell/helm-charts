import org.sonatype.nexus.ldap.persist.LdapConfigurationManager
import org.sonatype.nexus.ldap.persist.entity.LdapConfiguration
import org.sonatype.nexus.ldap.persist.entity.Connection
import org.sonatype.nexus.ldap.persist.entity.Mapping
import groovy.json.JsonSlurper

params = new JsonSlurper().parseText(args)

def ldapConfigMgr = container.lookup(LdapConfigurationManager.class.getName());

def ldapConfig = new LdapConfiguration()
boolean update = false;

// Look for existing config to update
ldapConfigMgr.listLdapServerConfigurations().each {
    if (it.name == params.name) {
        ldapConfig = it
        update = true
    }
}

ldapConfig.setName(params.name)

// Connection
connection = new Connection()
connection.setHost(new Connection.Host(Connection.Protocol.valueOf(params.protocol), params.host, Integer.valueOf(params.port)))
if (params.auth == "simple") {
    connection.setAuthScheme("simple")
    connection.setSystemUsername(params.username)
    connection.setSystemPassword(params.password)
} else {
    connection.setAuthScheme("none")
}
connection.setSearchBase(params.searchBase)
connection.setConnectionTimeout(30)
connection.setConnectionRetryDelay(300)
connection.setMaxIncidentsCount(3)
connection.setUseTrustStore(Boolean.valueOf(params.useTrustStore))
ldapConfig.setConnection(connection)

// Mapping
mapping = new Mapping()
mapping.setUserBaseDn(params.userBaseDn)
mapping.setUserSubtree(params.userSubtree)
mapping.setUserObjectClass(params.userObjectClass)
mapping.setLdapFilter(params.userFilter)
mapping.setUserIdAttribute(params.userIdAttribute)
mapping.setUserRealNameAttribute(params.userRealNameAttribute)
mapping.setEmailAddressAttribute(params.emailAddressAttribute)
if (params.mapGroupsAsRoles) {
    if(params.mapGroupsAsRolesType == "static"){
        mapping.setLdapGroupsAsRoles(true)
        mapping.setGroupBaseDn(params.groupBaseDn)
        mapping.setGroupSubtree(params.groupSubtree)
        mapping.setGroupObjectClass(params.groupObjectClass)
        mapping.setGroupIdAttribute(params.groupIdAttribute)
        mapping.setGroupMemberAttribute(params.groupMemberAttribute)
        mapping.setGroupMemberFormat(params.groupMemberFormat)
    } else if (params.mapGroupsAsRolesType == "dynamic") {
        mapping.setLdapGroupsAsRoles(true)
        mapping.setUserMemberOfAttribute(params.userMemberOfAttribute)
    }
}
ldapConfig.setMapping(mapping)

if (update) {
    ldapConfigMgr.updateLdapServerConfiguration(ldapConfig)
} else {
    ldapConfigMgr.addLdapServerConfiguration(ldapConfig)
}

if (params.adminGroup != null && !security.securitySystem.listRoles().any { it.source == "default" && it.roleId == params.adminGroup }) {
    security.addRole(params.adminGroup, params.adminGroup, "LDAP Administrator Role", [], ["nx-admin"])
}

return true

import groovy.json.JsonSlurper
import org.sonatype.nexus.security.realm.RealmManager

def params = new JsonSlurper().parseText(args)

def realmManager = container.lookup(RealmManager.class.getName())

realmManager.enableRealm(params.name, params.enabled)

return true

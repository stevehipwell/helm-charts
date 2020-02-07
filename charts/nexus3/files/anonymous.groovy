import groovy.json.JsonSlurper

def params = new JsonSlurper().parseText(args)

security.setAnonymousAccess(params.enabled)

return true

import groovy.json.JsonSlurper

def params = new JsonSlurper().parseText(args)

if (params.enabled) {
  def metricsRole = "nx-metrics"

  if (!security.securitySystem.listRoles().any { it.source == "default" && it.roleId == metricsName }) {
    security.addRole(metricsRole, metricsRole, "Metrics collection role", [], ["nx-metrics-all"])
  }

  security.setUserRoles("anonymous", ["nx-anonymous", metricsRole])
} else {
  security.setUserRoles("anonymous", ["nx-anonymous"])
}



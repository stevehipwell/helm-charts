import groovy.json.JsonSlurper
import groovy.json.JsonOutput
import org.sonatype.nexus.repository.config.Configuration

def repositoryManager = repository.repositoryManager

def params = new JsonSlurper().parseText(args)
if (params.attributes?.cleanup?.policyName) {
  params.attributes.cleanup.policyName = params.attributes.cleanup.policyName.toSet()
}

def existingRepository = repositoryManager.get(params.name)
Configuration configuration
if (existingRepository == null) {
  configuration = repositoryManager.newConfiguration()
  configuration.repositoryName = params.name
  configuration.recipeName = params.type
  configuration.online = params.online
  configuration.attributes = params.attributes
} else {
  configuration = existingRepository.getConfiguration()
  if (params.containsKey("type")) {
    if (configuration.getRecipeName() != params.type) {
      throw new Exception("Tried to change recipe for repo ${params.name} to ${params.type}")
    }
  }

  configuration.setOnline(params.online)
  if (params.containsKey("attributes")) {
    configuration.setAttributes(params.attributes)
  }
}

if (existingRepository == null) {
  repositoryManager.create(configuration)
} else {
  repositoryManager.update(configuration)
}

return true

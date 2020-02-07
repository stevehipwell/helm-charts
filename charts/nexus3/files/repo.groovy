import groovy.json.JsonSlurper
import groovy.json.JsonOutput
import org.sonatype.nexus.repository.config.Configuration

def params = new JsonSlurper().parseText(args)

def repo = repository.repositoryManager.get(params.name)
Configuration conf

// Cleanup input
if (params.attributes?.cleanup?.policyName) {
  params.attributes.cleanup.policyName = params.attributes.cleanup.policyName.toSet()
}

// Check if repo already exists
if (repo == null) {
  // Create new repo
  conf = new Configuration(
    repositoryName: params.name,
    recipeName: params.type,
    online: params.online,
    attributes: params.attributes
  )
  repository.createRepository(conf)
} else {
  // Get repo config
  conf = repo.getConfiguration()
  // println conf.inspect()
  // println params.attributes.inspect()

  // Test repo type isn't chaniging
  if (conf.getRecipeName() != params.type) {
    throw new Exception("Tried to change recipe for repo ${params.name} to ${params.type}")
  }

  // Update repo
  conf.setOnline(params.online)
  conf.setAttributes(params.attributes)
  repo.stop()
  repo.update(conf)
  repo.start()
}

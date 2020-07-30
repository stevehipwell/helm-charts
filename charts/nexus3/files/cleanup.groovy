import org.sonatype.nexus.cleanup.storage.CleanupPolicy;
import org.sonatype.nexus.cleanup.storage.CleanupPolicyStorage;
import groovy.json.JsonSlurper

def cleanupPolicyStorage = container.lookup(CleanupPolicyStorage.class.getName())

def params = new JsonSlurper().parseText(args)

if (cleanupPolicyStorage.exists(params.name)) {
  def existingPolicy = cleanupPolicyStorage.get(params.name);
  existingPolicy.setNotes(params.notes);
  existingPolicy.setFormat(params.format);
  existingPolicy.setMode(params.mode);
  existingPolicy.setCriteria(params.criteria);
  cleanupPolicyStorage.update(existingPolicy);
} else {
  def newPolicy = cleanupPolicyStorage.newCleanupPolicy()
  newPolicy.setName(params.name)
  newPolicy.setNotes(params.notes);
  newPolicy.setFormat(params.format);
  newPolicy.setMode(params.mode);
  newPolicy.setCriteria(params.criteria);
  cleanupPolicyStorage.add(newPolicy);
}

return true

import org.sonatype.nexus.cleanup.storage.CleanupPolicy;
import org.sonatype.nexus.cleanup.storage.CleanupPolicyStorage;
import groovy.json.JsonSlurper

def params = new JsonSlurper().parseText(args)
def policyStorage = container.lookup(CleanupPolicyStorage.class.getName());

if (policyStorage.exists(params.name)) {
  def cleanupPolicy = policyStorage.get(params.name);
  cleanupPolicy.setNotes(params.notes);
  cleanupPolicy.setFormat(params.format);
  cleanupPolicy.setMode(params.mode);
  cleanupPolicy.setCriteria(params.criteria);
  policyStorage.update(cleanupPolicy);
} else {
  def policy = policyStorage.newCleanupPolicy()
  policyStorage.add(policy);
}

return true

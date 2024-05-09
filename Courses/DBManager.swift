import Foundation
import Yams

// Parse YAML data into Swift models
func parseTopicsAndQuizzesFromYAMLFilesInFolders() -> ([Topic], [Quiz])? {
    let fm = FileManager.default
    let topicFolderURL = URL(fileURLWithPath: "/Users/kakimbekn/Downloads/topics")
    let quizFolderURL = URL(fileURLWithPath: "/Users/kakimbekn/Downloads/quizzes")
    
    guard let topicFiles = try? fm.contentsOfDirectory(at: topicFolderURL, includingPropertiesForKeys: nil),
          let quizFiles = try? fm.contentsOfDirectory(at: quizFolderURL, includingPropertiesForKeys: nil) else {
        print("Failed to get contents of directories")
        return nil
    }
    
    var topics: [Topic] = []
    var quizzes: [Quiz] = []
    
    for topicFile in topicFiles {
        if let yamlString = try? String(contentsOf: topicFile) {
            if let topic = parseTopicFromYAML(yamlString: yamlString) {
                topics.append(topic)
            }
        }
    }
    
    for quizFile in quizFiles {
        if let yamlString = try? String(contentsOf: quizFile) {
            if let quiz = parseQuizFromYAML(yamlString: yamlString) {
                quizzes.append(quiz)
            }
        }
    }
    
    return (topics, quizzes)
}

// Parse YAML data into Topic
func parseTopicFromYAML(yamlString: String) -> Topic? {
    guard let data = yamlString.data(using: .utf8) else {
        print("Failed to convert YAML string to data")
        return nil
    }
    
    do {
        let decoder = YAMLDecoder()
        let topic = try decoder.decode(Topic.self, from: data)
        return topic
    } catch {
        print("Error decoding YAML data: \(error)")
        return nil
    }
}

// Parse YAML data into Quiz
func parseQuizFromYAML(yamlString: String) -> Quiz? {
    guard let data = yamlString.data(using: .utf8) else {
        print("Failed to convert YAML string to data")
        return nil
    }
    
    do {
        let decoder = YAMLDecoder()
        let quiz = try decoder.decode(Quiz.self, from: data)
        return quiz
    } catch {
        print("Error decoding YAML data: \(error)")
        return nil
    }
}

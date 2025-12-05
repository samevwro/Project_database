package project.service;

import java.util.List;

import project.dao.ProjectDao;
import project.entity.Project;

public class ProjectService {

	private static ProjectDao projectDao = new ProjectDao();
	
	public static Project addProject(Project project) {
		
		return projectDao.insertProject(project);
	}

	public static List<Project> fethAllProjects() {
		return projectDao.fetchAllProjects();
	}
	//public Project fetchProjectById(Integer projectId) {
		//return projectDao.fetchProjectById(projectId).orElseThroww(() -> new NoSuchElementException(
				//"Project with project ID =" +porjectId + " does not exist."));
	//}
	


}

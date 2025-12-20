package project.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import project.dao.ProjectDao;
import project.entity.Project;
import project.exception.DbException;

public class ProjectService {

	private static ProjectDao projectDao = new ProjectDao();

	public static Project addProject(Project project) {

		return projectDao.insertProject(project);
	}

	public static List<Project> fethAllProjects() {
		return projectDao.fetchAllProjects();
	}
	// public Project fetchProjectById(Integer projectId) {
	// return projectDao.fetchProjectById(projectId).orElseThroww(() -> new
	// NoSuchElementException(
	// "Project with project ID =" +porjectId + " does not exist."));
	// }

	public static Project fetchProjectById(Integer projectId) {
		return projectDao.fetchProjectById(projectId).orElseThrow(()-> new NoSuchElementException("Project with project ID=" + projectId + " does not exist."));
		
	}

	public static void modifyProjectDetails(Project project) {
		if(!projectDao.modifyProjectDetails(project)) {
			throw new DbException("Project with ID=" + project.getProjectId() + " does not exist.");
		};
		
	}

	public static void deleteProject(Integer projectId) {
		if(!projectDao.deleteProject(projectId)) {
			throw new DbException("Project with ID=" + projectId + " does not exist.");
		}
		
	}

}

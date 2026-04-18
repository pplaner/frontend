const String _notesBase = '/api/v1/notes';
const String _projectsBase = '/api/v1/projects';

const String sync = '/api/v1/sync';

const String notes = _notesBase;
String noteById(String id) => '$_notesBase/$id';

const String projects = _projectsBase;
String projectById(String id) => '$_projectsBase/$id';


class JobModel {
   int id;
   String jobTitle;
   int salaryStart;
   int salaryEnd;
   int countryId;
   int accept;
   int active;
   String description;
   List<String> keyWords;
   int companyId;
   int workTypeId;
   int workTimeTypeId;
   List<Education> educations;
   List<Experience> experiences;
   List<Skill> skills;
   WorkTimeType workTimeTypes;
   WorkType workTypes;
   Company company;

  JobModel({
     this.id,
     this.jobTitle,
     this.salaryStart,
     this.salaryEnd,
     this.countryId,
     this.accept,
     this.active,
     this.description,
     this.keyWords,
     this.companyId,
     this.workTypeId,
     this.workTimeTypeId,
     this.educations,
     this.experiences,
     this.skills,
     this.workTimeTypes,
     this.workTypes,
     this.company,
  });

   JobModel.fromJson(Map<String, dynamic> json) {
    
      id= json['id'];
      jobTitle= json['job_title'];
      salaryStart= json['salary_start'];
      salaryEnd= json['salary_end'];
      countryId= json['country_id'];
      accept= json['accept'];
      active= json['active'];
      description= json['description'];
      keyWords= List<String>.from(json['keyWords']);
      companyId= json['company_id'];
      workTypeId= json['work_type_id'];
      workTimeTypeId= json['work_time_type_id'];
      educations= (json['educations'] as List).map((i) => Education.fromJson(i)).toList();
      experiences= (json['experiences'] as List).map((i) => Experience.fromJson(i)).toList();
      skills= (json['skills'] as List).map((i) => Skill.fromJson(i)).toList();
      workTimeTypes= WorkTimeType.fromJson(json['work_time_types']);
      workTypes= WorkType.fromJson(json['work_types']);
      company= Company.fromJson(json['company']);
    
  }
}

class Education {
   int id;
   String title;
   String description;
   int jobId;

  Education({ this.id,  this.title,  this.description,  this.jobId});

   Education.fromJson(Map<String, dynamic> json) {
     
      id= json['id'];
      title= json['title'];
      description= json['description'];
      jobId= json['job_id'];
    
  }
}

class Experience {
   int id;
   String title;
   String description;
   int jobId;

  Experience({ this.id,  this.title,  this.description,  this.jobId});

   Experience.fromJson(Map<String, dynamic> json) {
   
      id= json['id'];
      title= json['title'];
      description= json['description'];
      jobId= json['job_id'];
    
  }
}

class Skill {
   int id;
   String title;
   int stars;
   int jobId;

  Skill({ this.id,  this.title,  this.stars,  this.jobId});

  Skill.fromJson(Map<String, dynamic> json) {
    
      id= json['id'];
      title= json['title'];
      stars= json['stars'];
      jobId= json['job_id'];
    
  }
}

class WorkTimeType {
   int id;
   String name;

  WorkTimeType({ this.id,  this.name});

   WorkTimeType.fromJson(Map<String, dynamic> json) {
    
      id= json['id'];
      name= json['name'];
    
  }
}
class WorkType {
   int id;
   String name;

  WorkType({ this.id,  this.name});

   WorkType.fromJson(Map<String, dynamic> json) {
   
      id= json['id'];
      name= json['name'];
   
  }
}

class Company {
   int id;
   String email;
   String name;
   String location;
   int phone;
   String logo;
   String specialization;
   int active;
   int easyApply;
   String document;

  Company({
    this.id,
    this.email,
    this.name,
    this.location,
    this.phone,
    this.logo,
    this.specialization,
    this.active,
    this.easyApply,
    this.document,
  });

   Company.fromJson(Map<String, dynamic> json) {
    
      id= json['id'];
      email= json['email'];
      name= json['name'];
      location= json['location'];
      phone= json['phone'];
      logo= json['logo'];
      specialization= json['specialaization'];
      active= json['active'];
      easyApply= json['easy_applay'];
      document= json['document'];
    
  }
}
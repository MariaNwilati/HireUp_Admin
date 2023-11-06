// ignore_for_file: non_constant_identifier_names



class JobData {
  final String logo, job_title, description, country, email, company_name;
   final int id,
      salary_start,
      salary_end,
      accept,
      active,
      work_type_id,
      work_time_type_id,
      company_id;

  List<String> keyWords;
  List<Map<String, dynamic>> educations;
  List<Map<String, dynamic>> experiences;
  List<Map<String, dynamic>> skills;
  List<Map<String, dynamic>> company;

  JobData(      this.id,
      this.logo,
      this.job_title,
      this.salary_start,
      this.salary_end,
      this.country,
      this.accept,
      this.active,
      this.description,
      this.work_type_id,
      this.work_time_type_id,
      this.email,
      this.company_name,
      this.company_id,
      this.company,
      this.educations,
      this.experiences,
      this.keyWords,
      this.skills
      );
}

List post = [
  JobData(1, 'assets/images/osi.png', 'test', 2000, 3000, 'country', 1, 0,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    }
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ),


   JobData(1, 'assets/images/osi.png', 'job_title', 2000, 3000, 'country', 0, 1,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    },
    
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ), JobData(1, 'assets/images/osi.png', 'Hr', 2000, 3000, 'country', 1, 0,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    }
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ), JobData(1, 'assets/images/osi.png', 'job_title', 2000, 3000, 'country', 0, 1,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    }
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ), JobData(1, 'assets/images/osi.png', 'job_title', 2000, 3000, 'country', 1, 0,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    }
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ), JobData(1, 'assets/images/osi.png', 'job_title', 2000, 3000, 'country', 1, 1,
      'description', 1, 1, 'email', 'company_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    }
  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1}
  ]
  ),
];

 JobData data = new JobData(1, 'assets/images/osi.png', 'job_title', 2000, 3000, 'country', 1, 1,
      'descrwsdasuihchssjifffffwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiption', 1, 1, 'email', 'companyaxax_name', 1, 
      [
    {
      'id': 123,
      'name': 'Example Company',
      'address': '123 Main St',
      'website': 'www.example.com'
    }
  ], [
    {'id': 1, 'title': 'Bac', 'description': 'Bac degree in it', 'job_id': 1}, {'id': 1, 'title': 'Bac2', 'description': 'Bac degree in it', 'job_id': 1}, {'id': 1, 'title': 'Bac3', 'description': 'Bac degree in it', 'job_id': 1}
  ], [
    {
      'id': 1,
      'title': 'Junior Developer',
      'description': 'Worked as a junior developer',
      'job_id': 1
    },
     {
      'id': 2,
      'title': 'senior Developer',
      'description': 'Worked as a senio developer',
      'job_id': 1
    },

  ], [
    'flutter',
    'dart',
    'mobile development'
  ], [
    {'id': 1, 'name': 'Flutter', 'level': 'Expert', 'job_id': 1},  {'id': 1, 'name': 'php', 'level': 'Expert', 'job_id': 1}
  ]
 
);
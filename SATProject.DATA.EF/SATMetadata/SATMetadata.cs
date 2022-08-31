using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SATProject.DATA.EF/*.SATMetadata*/
{
    public class StudentMetadata
    {

        [Display(Name = "First Name")]
        [StringLength(20, ErrorMessage = "*Must be 20 characters or less.")]
        [Required(ErrorMessage = "*Field Required")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [StringLength(20, ErrorMessage = "*Must be 20 characters or less.")]
        [Required(ErrorMessage = "*Field Required")]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [StringLength(30, ErrorMessage = "*Must be 30 characters or less.")]
        public string Major { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string Address { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [StringLength(25, ErrorMessage = "*Must be 25 characters or less.")]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [StringLength(2, ErrorMessage = "*Must be 2 characters.")]
        public string State { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [Display(Name = "Zip Code")]
        [StringLength(10, ErrorMessage = "*Must be 10 characters or less.")]
        public string ZipCode { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [Display(Name = "Student Photo")]
        [StringLength(100)]
        [DataType(DataType.ImageUrl)]
        public string PhotoUrl { get; set; }

    }

    [MetadataType(typeof(StudentMetadata))]
    public partial class Student { }

    public class StudentStatusMetadata
    {
        [Required(ErrorMessage = "*Field Required")]
        [StringLength(30, ErrorMessage = "*Must be 30 characters or less.")]
        [Display(Name = "Status")]
        public string SSName { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [Display(Name = "Description")]
        [UIHint("Multiline Text")]
        [StringLength(250)]
        public string SSDescription { get; set; }
    }

    [MetadataType(typeof(StudentStatusMetadata))]
    public partial class StudentStatus { }


    public class ScheduledClassMetadata
    {
        [Required(ErrorMessage = "*Field Required")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString="{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name  = "Start Date")]
        public System.DateTime StartDate { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name = "End Date")]
        public System.DateTime EndDate { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [Display(Name = "Instructor")]
        [StringLength(40, ErrorMessage = "*Must be 40 characetrs or less.")]
        public string InstructorName { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [StringLength(20, ErrorMessage = "*Must be 20 characters or less.")]
        public string Location { get; set; }

    }

    [MetadataType(typeof(ScheduledClassMetadata))]
    public partial class ScheduledClass { }

    public class ScheduledClassStatusMetadata
    {
        [Required(ErrorMessage = "*Field Required")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        [Display(Name = "Class Status")]
        public string SCSName { get; set; }
    }

    [MetadataType(typeof(ScheduledClassStatusMetadata))]
    public partial class ScheduledClassStatus { }

    public class CourseMetadata
    {
        [Required(ErrorMessage = "*Field Required")]
        [Display(Name = "Course")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less.")]
        public string CourseName { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [UIHint("Multiline Text")]
        [Display(Name = "Description")]
        public string CourseDescription { get; set; }

        [Required(ErrorMessage = "*Field Required")]
        [Display(Name = "Credit Hours")]
        public byte CreditHours { get; set; }

        [DisplayFormat(NullDisplayText ="")]
        [UIHint("Multiline Text")]
        [StringLength(250, ErrorMessage = "*Must be 250 characters or less.")]
        public string Curriculum { get; set; }

        [DisplayFormat(NullDisplayText = "")]
        [UIHint("Multiline Text")]
        [StringLength(500, ErrorMessage = "*Must be 500 characters or less.")]
        public string Notes { get; set; }

        [NotMapped]
        [Display(Name = "Is Active")]
        [Range(typeof(bool), "true", "true", ErrorMessage = "The field Is Active must be checked.")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course { }

    public class EnrollmentMetadata
    {
        [Required(ErrorMessage = "*Field Required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime EnrollmentDate { get; set; }

        public virtual ScheduledClass ScheduledClass { get; set; }
        public virtual Student Student { get; set; }
    }

    [MetadataType(typeof(EnrollmentMetadata))]
    public partial class Enrollment { }
}

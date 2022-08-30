using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace SATProject.DATA.EF/*.SATMetadata*/
{
    public class StudentMetadata
    {

        [Required]
        [StringLength(20)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(20)]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(30)]
        public string Major { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(50)]
        public string Address { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(25)]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(2)]
        public string State { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(10)]
        public string ZipCode { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(13)]
        public string Phone { get; set; }

        [Required]
        [StringLength(60)]
        public string Email { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(100)]
        public string PhotoUrl { get; set; }

    }

    public class StudentStatusMetadata
    {
        [Required]
        [StringLength(30)]
        public string SSName { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        [StringLength(250)]
        public string SSDescription { get; set; }
    }

    public class ScheduledClassMetadata
    {
        [Required]
        public System.DateTime StartDate { get; set; }

        [Required]
        public System.DateTime EndDate { get; set; }

        [Required]
        public string InstructorName { get; set; }

        [Required]
        public string Location { get; set; }

    }

    public class ScheduledClassStatusMetadata
    {
        [Required]
        public string SCSName { get; set; }
    }

    public class CourseMetadata
    {
        [Required]
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }

        [Required]
        public byte CreditHours { get; set; }

        [DisplayFormat(NullDisplayText ="x")]
        public string Curriculum { get; set; }

        [DisplayFormat(NullDisplayText = "x")]
        public string Notes { get; set; }
        public bool IsActive { get; set; }
    }

    public class EnrollmentMetadata
    {
        [Required]
        public System.DateTime EnrollmentDate { get; set; }

        public virtual ScheduledClass ScheduledClass { get; set; }
        public virtual Student Student { get; set; }
    }
}

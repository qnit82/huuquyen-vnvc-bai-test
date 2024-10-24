using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace RoosterLottery.Utils
{
    public class Util
    {
        /// <summary>
        /// Trim and remove spacebar in text
        /// </summary>
        public static string CleanString(string text)
        {
            if (!string.IsNullOrEmpty(text))
            {
                return text ?? "".Trim().Replace(" ", "");
            }

            return text;

        }

        public static string GetPasswordSalt(int maximumSaltLength = 32)
        {
            var salt = new byte[maximumSaltLength];
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetNonZeroBytes(salt);
            }

            return Convert.ToBase64String(salt);
        }

        public static string MD5Encrypter(string password)
        {
            string _pwd = "";
            if (!string.IsNullOrEmpty(password))
            {
                byte[] passArray = Encoding.UTF8.GetBytes(password);
                var myMD5 = new MD5CryptoServiceProvider();
                passArray = myMD5.ComputeHash(passArray);

                foreach (byte item in passArray)
                {
                    _pwd += item.ToString("X2");
                }
            }
            return _pwd;
        }

        public static bool IsValidPhoneNumber(string phoneNumber)
        {
            string pattern = @"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";
            return Regex.IsMatch(phoneNumber, pattern);
        }

        public static bool IsUnder18(DateTime birthDate)
        {
            if (birthDate == DateTime.MinValue) return false;
            var today = DateTime.Today;
            var age = today.Year - birthDate.Year;
            if (birthDate.Date > today.AddYears(-age)) age--;
            return age < 18;
        }

        public static int GenerateLotteryNumber()
        {
            var random = new Random();
            return random.Next(0, 9);
        }

        public static bool ValidateFullName(string fullName)
        {
            return fullName.Length >= 2;
        }

        public static bool ValidateParseStringToLong(string input)
        {
            long number = 0;
            if (!long.TryParse(input, out number))
            {
                return false;
            }

            return true;
        }

    }
}

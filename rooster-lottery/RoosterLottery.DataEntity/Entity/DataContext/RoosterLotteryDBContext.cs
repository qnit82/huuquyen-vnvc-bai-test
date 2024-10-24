using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.Model;
using System.Data.Common;
using System.Data;

namespace RoosterLottery.DataEntity.Entity.DataContext
{
    public class RoosterLotteryDBContext : DbContext
    {
        public RoosterLotteryDBContext(DbContextOptions<RoosterLotteryDBContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; } = default!;
        public DbSet<Slot> Slots { get; set; } = default!;
        public DbSet<Bet> Bets { get; set; } = default!;

        public async Task<int> ExecCommandTextAsync(string query)
        {
            using (DbConnection connection = Database.GetDbConnection())
            {
                await connection.OpenAsync();
                using (DbCommand cmd = connection.CreateCommand())
                {
                    cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
        }

    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RoosterLottery.CoreApi.Migrations
{
    public partial class InitRemoveUserIdForBet : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Bets");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Bets",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}

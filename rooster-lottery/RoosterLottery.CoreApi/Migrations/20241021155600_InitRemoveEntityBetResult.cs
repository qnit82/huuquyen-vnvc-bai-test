using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RoosterLottery.CoreApi.Migrations
{
    public partial class InitRemoveEntityBetResult : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BetResults");

            migrationBuilder.AddColumn<bool>(
                name: "IsWinner",
                table: "Bets",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "Spined",
                table: "Bets",
                type: "bit",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsWinner",
                table: "Bets");

            migrationBuilder.DropColumn(
                name: "Spined",
                table: "Bets");

            migrationBuilder.CreateTable(
                name: "BetResults",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BetId = table.Column<long>(type: "bigint", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedBy = table.Column<long>(type: "bigint", nullable: false),
                    IsWinner = table.Column<bool>(type: "bit", nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdatedBy = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BetResults", x => x.Id);
                });
        }
    }
}

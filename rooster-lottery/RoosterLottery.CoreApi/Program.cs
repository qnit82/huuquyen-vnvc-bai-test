using Hangfire;
using RoosterLottery.UnitOfWork;
using RoosterLottery.UnitOfWork.Hubs;

var builder = WebApplication.CreateBuilder(args);

var DomainAllow = new List<string>() { "http://localhost:3000", "http://127.0.0.1:5000" };

builder.Services.AddCors(options =>
{
    //var itemArray = DomainAllow.ToArray();
    options.AddPolicy("AllowSpecificOrigin", builder =>
    {
        builder.WithOrigins("http://localhost:3000")
               .AllowAnyHeader()
               .AllowAnyMethod()
               .AllowCredentials();
    });
});

// Add services to the container.
builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHttpClient();
builder.Services.AddResponseCaching();
builder.Services.AddUnitOfWork(builder.Configuration);
//Register Worker Service
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

//Configure SignalR service
builder.Services.AddSignalR();

var app = builder.Build();

//Enable CORS
app.UseCors("AllowSpecificOrigin");
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.UseHangfireDashboard("/hangfire");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//Configure SignalR endpoints
app.MapHub<RoosterLotteryHub>("/RoosterLotteryHub");

app.Run();

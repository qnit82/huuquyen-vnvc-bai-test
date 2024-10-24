using RoosterLottery.DataEntity.Entity.Base;
using System.Linq.Expressions;

namespace RoosterLottery.Repository.Interface.BaseInterface
{
    public interface IBaseRepository<T> where T : BaseEntity
    {
        Task<Tuple<IEnumerable<T>, int>> GetDataAsync<Tkey>(Expression<Func<T, bool>> source, Expression<Func<T, Tkey>> ColumnOrderBy, bool desc = false, int offset = 0, int take = 10);
        Task<Tuple<IEnumerable<T>, int>> GetDataAsync(Expression<Func<T, bool>> source, int offset = 0, int take = 1000000);
        Task<IEnumerable<T>> GetDataAsync<Tkey>(Expression<Func<T, Tkey>> ColumnOrderBy, bool desc);
        Task<int> InsertAsync(T source, CancellationToken cancellationToken);
        Task<int> InsertAsync(List<T> source, CancellationToken cancellationToken);
        Task<int> UpdateAsync(T source, CancellationToken cancellationToken);
        Task<int> DeleteAsync(T source, CancellationToken cancellationToken);
        Task<int> ExecuteCommandText(string query);
    }
}

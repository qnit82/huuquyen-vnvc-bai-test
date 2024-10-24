using Microsoft.EntityFrameworkCore;
using RoosterLottery.DataEntity.Entity.Base;
using RoosterLottery.DataEntity.Entity.DataContext;
using RoosterLottery.Repository.Interface.BaseInterface;
using System.Linq.Expressions;

namespace RoosterLottery.Repository.Implemention.Base
{
    public class BaseRepository<T> : IBaseRepository<T> where T : BaseEntity
    {
        protected readonly RoosterLotteryDBContext _dbContext;

        public BaseRepository(RoosterLotteryDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> InsertAsync(T source, CancellationToken cancellationToken)
        {
            await _dbContext.Set<T>().AddAsync(source, cancellationToken);
            return await _dbContext.SaveChangesAsync(cancellationToken);
        }

        public async Task<int> InsertAsync(List<T> source, CancellationToken cancellationToken)
        {
            _dbContext.Set<T>().AddRange(source);
            var result = await _dbContext.SaveChangesAsync(cancellationToken);
            return result;
        }

        public async Task<int> UpdateAsync(T source, CancellationToken cancellationToken)
        {
            _dbContext.Set<T>().Update(source);
            return await _dbContext.SaveChangesAsync(cancellationToken);
        }

        public async Task<int> DeleteAsync(T source, CancellationToken cancellationToken)
        {
            _dbContext.Set<T>().Remove(source);
            return await _dbContext.SaveChangesAsync(cancellationToken);
        }

        /// <summary>
        /// GetData Has Paging. Not OrderBy
        /// </summary>
        /// <param name="source"></param>
        /// <param name="offset"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        public async Task<Tuple<IEnumerable<T>, int>> GetDataAsync(Expression<Func<T, bool>> source, int offset = 0, int take = 10)
        {
            var query = _dbContext.Set<T>().Where(source);
            int total = await query.CountAsync();
            var pagingQuery = await query.Take(take).Skip(offset).ToListAsync();
            var result = new Tuple<IEnumerable<T>, int>(pagingQuery, total);

            return result;
        }

        /// <summary>
        /// GetData Not Paging. Has OrderBy (Default desc=false be OrderBy asc. If desc=true be OrderBy desc)
        /// </summary>
        /// <typeparam name="Tkey"></typeparam>
        /// <param name="orderBy"></param>
        /// <param name="desc"></param>
        /// <returns></returns>
        public async Task<IEnumerable<T>> GetDataAsync<Tkey>(Expression<Func<T, Tkey>> ColumnOrderBy, bool desc = false)
        {
            var query = _dbContext.Set<T>().AsQueryable();
            if (desc == false)
            {
                query = query.OrderBy(ColumnOrderBy);
            }
            else
            {
                query = query.OrderByDescending(ColumnOrderBy);
            }
            var result = await query.ToListAsync();
            return result;
        }

        /// <summary>
        /// GetData Has Paging. Has OrderBy (Default desc=false be OrderBy asc. If desc=true be OrderBy desc)
        /// </summary>
        /// <typeparam name="Tkey"></typeparam>
        /// <param name="source"></param>
        /// <param name="orderBy"></param>
        /// <param name="desc"></param>
        /// <param name="offset"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        public async Task<Tuple<IEnumerable<T>, int>> GetDataAsync<Tkey>(Expression<Func<T, bool>> source, Expression<Func<T, Tkey>> orderBy, bool desc = false, int offset = 0, int take = 10)
        {
            var query = _dbContext.Set<T>().Where(source);
            if (desc == false)
            {
                query = query.OrderBy(orderBy);
            }
            else
            {
                query = query.OrderByDescending(orderBy);
            }
            int total = await query.CountAsync();
            var pagingQuery = await query.Take(take).Skip(offset).ToListAsync();
            var result = new Tuple<IEnumerable<T>, int>(pagingQuery, total);

            return result;
        }

        public Task<int> ExecuteCommandText(string query)
        {
            return _dbContext.ExecCommandTextAsync(query);
        }
    }
}

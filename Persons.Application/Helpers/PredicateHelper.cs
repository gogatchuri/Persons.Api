using System.Linq.Expressions;

namespace Persons.Application.Helpers;

public static class PredicateHelper
{
    public static Expression<Func<T, bool>> CombinePredicates<T>(
    Expression<Func<T, bool>> left,
    Expression<Func<T, bool>> right)
    {
        var parameter = Expression.Parameter(typeof(T), "x");

        var leftBody = Expression.Invoke(left, parameter);
        var rightBody = Expression.Invoke(right, parameter);

        var combinedBody = Expression.AndAlso(leftBody, rightBody);

        return Expression.Lambda<Func<T, bool>>(combinedBody, parameter);
    }
}


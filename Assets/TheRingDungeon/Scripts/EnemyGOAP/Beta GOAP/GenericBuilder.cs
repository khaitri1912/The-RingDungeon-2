using System;

namespace TheRingDungeon.Scripts.EnemyGOAP.Utilities
{
    /// <summary>
    /// Generic Builder base class that can be extended to create fluent builders for any type.
    /// </summary>
    /// <typeparam name="TBuilder">The specific builder type (for method chaining)</typeparam>
    /// <typeparam name="TProduct">The type of object being built</typeparam>
    public abstract class GenericBuilder<TBuilder, TProduct> 
        where TBuilder : GenericBuilder<TBuilder, TProduct>
    {
        /// <summary>
        /// The object being constructed
        /// </summary>
        protected readonly TProduct Product;

        /// <summary>
        /// Creates a new builder with the product to build
        /// </summary>
        /// <param name="product">The product instance to be built</param>
        protected GenericBuilder(TProduct product)
        {
            Product = product;
        }

        /// <summary>
        /// Returns a reference to the builder (for method chaining)
        /// </summary>
        protected abstract TBuilder Self { get; }

        /// <summary>
        /// Sets a property on the product using an action
        /// </summary>
        /// <param name="action">The action that sets the property</param>
        /// <returns>The builder instance for method chaining</returns>
        protected TBuilder With(Action<TProduct> action)
        {
            action(Product);
            return Self;
        }

        /// <summary>
        /// Returns the fully constructed object
        /// </summary>
        /// <returns>The constructed product</returns>
        public TProduct Build()
        {
            return Product;
        }
    }
}
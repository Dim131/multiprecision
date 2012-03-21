///////////////////////////////////////////////////////////////
//  Copyright 2012 John Maddock. Distributed under the Boost
//  Software License, Version 1.0. (See accompanying file
//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_

#ifndef BOOST_MP_MR_HPP
#define BOOST_MP_MR_HPP

#include <boost/multiprecision/random.hpp>

namespace boost{
namespace multiprecision{
//
// Calculate (a^b)%c:
//
template <class Backend, bool ExpressionTemplates>
void expmod(const mp_number<Backend, ExpressionTemplates>& a, mp_number<Backend, ExpressionTemplates> b, const mp_number<Backend, ExpressionTemplates>& c, mp_number<Backend, ExpressionTemplates>& result)
{
   typedef mp_number<Backend, ExpressionTemplates> number_type;
   number_type x(1), y(a);
   while(b > 0)
   {
      if(b & 1)
      {
         x = (x * y) % c;
      }
      y = (y * y) % c;
      b /= 2;
   }
   result = x % c;
}

template <class Backend, bool ExpressionTemplates>
bool check_small_factors(const mp_number<Backend, ExpressionTemplates>& n)
{
   static const boost::uint32_t small_factors1[] = {
      3u, 5u, 7u, 11u, 13u, 17u, 19u, 23u };
   static const boost::uint32_t pp1 = 223092870u;

   boost::uint32_t m1 = integer_modulus(n, pp1);

   for(unsigned i = 0; i < sizeof(small_factors1) / sizeof(small_factors1[0]); ++i)
   {
      BOOST_ASSERT(pp1 % small_factors1[i] == 0);
      if(m1 % small_factors1[i] == 0)
         return false;
   }

   static const boost::uint32_t small_factors2[] = {
      29u, 31u, 37u, 41u, 43u, 47u };
   static const boost::uint32_t pp2 = 2756205443u;

   m1 = integer_modulus(n, pp2);

   for(unsigned i = 0; i < sizeof(small_factors2) / sizeof(small_factors2[0]); ++i)
   {
      BOOST_ASSERT(pp2 % small_factors2[i] == 0);
      if(m1 % small_factors2[i] == 0)
         return false;
   }

   static const boost::uint32_t small_factors3[] = {
      53u, 59u, 61u, 67u, 71u };
   static const boost::uint32_t pp3 = 907383479u;

   m1 = integer_modulus(n, pp3);

   for(unsigned i = 0; i < sizeof(small_factors3) / sizeof(small_factors3[0]); ++i)
   {
      BOOST_ASSERT(pp3 % small_factors3[i] == 0);
      if(m1 % small_factors3[i] == 0)
         return false;
   }

   static const boost::uint32_t small_factors4[] = {
      73u, 79u, 83u, 89u, 97u };
   static const boost::uint32_t pp4 = 4132280413u;

   m1 = integer_modulus(n, pp4);

   for(unsigned i = 0; i < sizeof(small_factors4) / sizeof(small_factors4[0]); ++i)
   {
      BOOST_ASSERT(pp4 % small_factors4[i] == 0);
      if(m1 % small_factors4[i] == 0)
         return false;
   }

   static const boost::uint32_t small_factors5[] = {
      101u, 103u, 107u, 109u };
   static const boost::uint32_t pp5 = 121330189u;

   m1 = integer_modulus(n, pp5);

   for(unsigned i = 0; i < sizeof(small_factors5) / sizeof(small_factors5[0]); ++i)
   {
      BOOST_ASSERT(pp5 % small_factors5[i] == 0);
      if(m1 % small_factors5[i] == 0)
         return false;
   }
   return true;
}

template <class Backend, bool ExpressionTemplates, class Engine>
bool miller_rabin_test(const mp_number<Backend, ExpressionTemplates>& n, unsigned trials, Engine& gen)
{
   typedef mp_number<Backend, ExpressionTemplates> number_type;

   if(n < 2)
      return false;
   if((n & 1) == 0)
      return false;

   if(!check_small_factors(n))
      return false;

   number_type q = (n - 1) >> 1;
   unsigned k = 1;
   while((q & 1) == 0)
   {
      q >>= 1;
      ++k;
   }
   // Declare our random number generator:
   boost::random::uniform_int_distribution<number_type> dist(0, n);
   number_type nm1 = n - 1;
   //
   // Execute the trials:
   //
   for(unsigned i = 0; i < trials; ++i)
   {
      number_type x = dist(gen);
      number_type y;
      expmod(x, q, n, y);
      unsigned j = 0;
      while(true)
      {
         if((y == nm1) || ((y == 1) && (j == 0)))
            break;
         if(y == 1)
            return false; // test failed
         if(++j == k)
            return false; // failed
         y = (y * y) % n;
      }
   }
   return true;  // Yeheh! probably prime.
}

template <class Backend, bool ExpressionTemplates>
bool miller_rabin_test(const mp_number<Backend, ExpressionTemplates>& x, unsigned trials)
{
   static mt19937 gen;
   return miller_rabin_test(x, trials, gen);
}

template <class tag, class Arg1, class Arg2, class Arg3, class Engine>
bool miller_rabin_test(const detail::mp_exp<tag, Arg1, Arg2, Arg3> & n, unsigned trials, Engine& gen)
{
   typedef typename detail::mp_exp<tag, Arg1, Arg2, Arg3>::result_type number_type;
   return miller_rabin_test(number_type(n), trials, gen);
}

template <class tag, class Arg1, class Arg2, class Arg3>
bool miller_rabin_test(const detail::mp_exp<tag, Arg1, Arg2, Arg3> & n, unsigned trials)
{
   typedef typename detail::mp_exp<tag, Arg1, Arg2, Arg3>::result_type number_type;
   return miller_rabin_test(number_type(n), trials);
}

}} // namespaces

#endif


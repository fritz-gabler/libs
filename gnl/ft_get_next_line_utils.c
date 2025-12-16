/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_get_next_line_utils.c                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fgabler <fgabler@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/28 18:26:06 by fritzgabler       #+#    #+#             */
/*   Updated: 2025/12/15 15:30:14 by fgabler          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

// ft_strlen_null_protected: The function initializes a size_t variable i to zero
// and then loops through the string, incrementing
// i for each character in the string until the null
// terminator '\0' is reached. Once the null terminator
// is reached, the function returns the final value of i,
// which represents the length of the string.

size_t	ft_strlen_null_protected(const char *str)
{
	size_t	i;

	i = 0;
	if (!str)
		return (0);
	while (str[i])
		i++;
	return (i);
}

// ft_calloc : This is an implementation of the standard C library
// function calloc, which allocates a block of memory
// for an array of elements and initializes the memory
// to zero. The function takes two arguments: nitems,
// which represents the number of elements to allocate,
// and size, which represents the size in bytes of
// each element.

// ft_strjoin_mod: The function initializes two unsigned int
// variables i and j to zero, and a char pointer
// new to null. The function then checks whether
// both s1 and s2 are null pointers and returns
// null if they are.

char	*ft_strjoin_mod(char *s1, char *s2)
{
	unsigned int	i;
	unsigned int	j;
	char			*new;

	i = 0;
	j = 0;
	if (s1 == NULL && s2 == NULL)
		return (NULL);
	new = (char *)ft_calloc(ft_strlen_null_protected(s1)
			+ ft_strlen_null_protected(s2) + 1, sizeof(char));
	if (!new)
		return (NULL);
	while (s1 && s1[i] != '\0')
	{
		new[i] = s1[i];
		i++;
	}
	while (s2[j])
		new[i++] = s2[j++];
	if (s1)
		return (free((void *)s1), s1 = NULL, new);
	else
		return (free((void *)s1), new);
}

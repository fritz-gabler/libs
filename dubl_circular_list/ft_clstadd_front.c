/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_clstadd_front.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fgabler <mail@student.42heilbronn.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/30 12:28:53 by fgabler           #+#    #+#             */
/*   Updated: 2023/08/30 16:56:08 by fgabler          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_clstadd_front(t_dubl_list **lst, t_dubl_list *new)
{
	t_dubl_list	*tail;

	tail = (*lst)->prev;
	new->next = *lst;
	new->prev = tail;
	tail->next = new;
	(*lst)->prev = new;
}
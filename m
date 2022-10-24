Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1575160B927
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 22:05:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on3hS-0001fG-CR;
	Mon, 24 Oct 2022 20:05:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1on3hP-0001f9-4M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=59TRiYUXIr5hwsRyZRrFskT3Jp1v+y3YCFk34nmAHUA=; b=fW5kObZrGn3WxAr2t+UxWhe5BM
 zIshyXLjL+fIVCC9R8LakUpkcoJFjC/hGH91dAU5om30TrjNiU2H4X3PIV3yp36a0LzdDfiKm6VE4
 DjrkLvyN3Xdpg9Irvq9/CEjMVFC3agL9tJY0h58WsxJ0SacWqvEOJC+EIeqEzXGm2bTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=59TRiYUXIr5hwsRyZRrFskT3Jp1v+y3YCFk34nmAHUA=; b=RS/IIebxE3G+j+KFyATj0dgl3K
 UGoLNLf8FbS5nOLYUypWcaG5Y7NY4Or5xaqe6w9GQBSRF+wD2a3jdSTAKGZyDuwJM+kyUun+O8FK5
 GkPhWubuK5MthQw1aNkIEbTUMqU15+zs+RLbFdxjJGz+G9+r4fkDnSFJupYb6pUxvgQE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on3hJ-00G2yE-44 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=59TRiYUXIr5hwsRyZRrFskT3Jp1v+y3YCFk34nmAHUA=; b=RWaoMVk6BPHICeFJGa64P+TtYS
 lq+sEC3X3P6L3UTF8roXaBRlKW/dn6ZZSPv8sql0Bq94mmfKcGyd20heEGzrmKOPxJk3I3q5ocDIn
 rZQPq90/4mybKupKG3u4huHqxJCrrWGNEOuPBYM2rIb6H9WuW6yrLD6np+IyZE9bNS7zRunkvbrVS
 kGzoHEUY7j5v5JqpULdFDMYN3lKANNwQv8Kwkz7gBZ7ecSVjXla5q64p4LZsQu4fbmarbbcif9lXY
 o1WMbUkytqszHQgfmeS7hcb6y9ciIzemtb9F2l0G/ZP1Xp4kGUxgavPMMqfxbqbGFy/C6jzVp77bS
 Tdoa8djA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on3LB-00FglR-TA; Mon, 24 Oct 2022 19:42:30 +0000
Date: Mon, 24 Oct 2022 20:42:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <Y1bqpYNvnxmZL+KW@casper.infradead.org>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-3-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017202451.4951-3-vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 01:24:30PM -0700,
 Vishal Moola (Oracle)
 wrote: > This is the equivalent of find_get_pages_range_tag(), except for
 folios > instead of pages. > > One noteable difference is file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1on3hJ-00G2yE-44
Subject: Re: [f2fs-dev] [PATCH v3 02/23] filemap: Added
 filemap_get_folios_tag()
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 01:24:30PM -0700, Vishal Moola (Oracle) wrote:
> This is the equivalent of find_get_pages_range_tag(), except for folios
> instead of pages.
> 
> One noteable difference is filemap_get_folios_tag() does not take in a
> maximum pages argument. It instead tries to fill a folio batch and stops
> either once full (15 folios) or reaching the end of the search range.
> 
> The new function supports large folios, the initial function did not
> since all callers don't use large folios.

Reviewed-by: Matthew Wilcow (Oracle) <willy@infradead.org>

> +/**
> + * filemap_get_folios_tag - Get a batch of folios matching @tag.
> + * @mapping:    The address_space to search
> + * @start:      The starting page index
> + * @end:        The final page index (inclusive)
> + * @tag:        The tag index
> + * @fbatch:     The batch to fill
> + *
> + * Same as filemap_get_folios, but only returning folios tagged with @tag

If you add () after filemap_get_folios, it turns into a nice link in
the html documentation.

> + *
> + * Return: The number of folios found

Missing full stop at the end of this line.

> + * Also update @start to index the next folio for traversal

Ditto.

> + */
> +unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
> +			pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch)
> +{
> +	XA_STATE(xas, &mapping->i_pages, *start);
> +	struct folio *folio;
> +
> +	rcu_read_lock();
> +	while ((folio = find_get_entry(&xas, end, tag)) != NULL) {
> +		/* Shadow entries should never be tagged, but this iteration
> +		 * is lockless so there is a window for page reclaim to evict
> +		 * a page we saw tagged. Skip over it.
> +		 */

For multiline comments, the "/*" should be on a line by itself.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

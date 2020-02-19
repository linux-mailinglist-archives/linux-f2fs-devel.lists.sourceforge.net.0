Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC516474B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 15:41:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4QXl-0001LX-3D; Wed, 19 Feb 2020 14:41:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4QXg-0001LB-Ah
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 14:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IjL+yb/Cvlwh+xltU0HFRJYWZSYd/0FIacDvgc30so=; b=Bj5i7GfK8WRSbARd4Bw9ZKmsQ6
 1aG/yLtWjV7UTkXrCkK2+6icpv2LGbCjHLYz0yU5xIREoN2VLYy4sqhDL2f2zS9zBdKReGprXxwfr
 dC/n/tIe/ovOjO67uY7E4B15iw3DQJVlh/fgGI4Y1pPcdF8IT4jLSx5hsGQour/o6xLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8IjL+yb/Cvlwh+xltU0HFRJYWZSYd/0FIacDvgc30so=; b=GFreFw8nOVRmGAaPtuUC5PLsN2
 cYoXSXShHdXus21JjqA2lGNfFigm4wMHX2dfOZD8hPYlHKrjCJ7GFTnho+PXSgKFBRAqizR4Erf7s
 YJ2+TH27SaOcGc24jVxRxtv2H79n3BUkuCUhIgyaWvB8lIolzY1fXrN4g9vle9BYEUFc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4QXa-007rrZ-UG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 14:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8IjL+yb/Cvlwh+xltU0HFRJYWZSYd/0FIacDvgc30so=; b=Eo/FW4XK2MuSbkpKnJbuW9HCuj
 73f56TSPDRJWs9q1g09/mEtWKWQ18dLecvixOGx9CQrSJtukF5EkaFwD5s1ht+yOHUqESKEvXDwPh
 0v+9/vEPWpbgPitIQ0XolL/sviBTw/NadpXb0u4CKascGnRG+HiMvDnBy0Jkt6uvI5gFKz3giVYlB
 Ck/tmLQEiMP713+GIAGDUXFKV2BakBAcoFfN+jeMAlvrKRVftT0bs67UdlA5WD5YSSloWQRhWWsuF
 MXO0LNm1doYTcnPW+W+SjPVPp2BkpvBSZrMWKMZnHtRlYVoCghmzLJdCT71Da+z4QJbJE1SoGqiJT
 7R18A8DA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4QXN-00044x-SK; Wed, 19 Feb 2020 14:41:17 +0000
Date: Wed, 19 Feb 2020 06:41:17 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219144117.GP24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4QXa-007rrZ-UG
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
 earlier
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 04:01:43PM -0800, John Hubbard wrote:
> How about this instead? It uses the "for" loop fully and more naturally,
> and is easier to read. And it does the same thing:
> 
> static inline struct page *readahead_page(struct readahead_control *rac)
> {
> 	struct page *page;
> 
> 	if (!rac->_nr_pages)
> 		return NULL;
> 
> 	page = xa_load(&rac->mapping->i_pages, rac->_start);
> 	VM_BUG_ON_PAGE(!PageLocked(page), page);
> 	rac->_batch_count = hpage_nr_pages(page);
> 
> 	return page;
> }
> 
> static inline struct page *readahead_next(struct readahead_control *rac)
> {
> 	rac->_nr_pages -= rac->_batch_count;
> 	rac->_start += rac->_batch_count;
> 
> 	return readahead_page(rac);
> }
> 
> #define readahead_for_each(rac, page)			\
> 	for (page = readahead_page(rac); page != NULL;	\
> 	     page = readahead_page(rac))

I'll go you one better ... how about we do this instead:

static inline struct page *readahead_page(struct readahead_control *rac)
{
        struct page *page;

        BUG_ON(rac->_batch_count > rac->_nr_pages);
        rac->_nr_pages -= rac->_batch_count;
        rac->_index += rac->_batch_count;
        rac->_batch_count = 0;

        if (!rac->_nr_pages)
                return NULL;

        page = xa_load(&rac->mapping->i_pages, rac->_index);
        VM_BUG_ON_PAGE(!PageLocked(page), page);
        rac->_batch_count = hpage_nr_pages(page);

        return page;
}

#define readahead_for_each(rac, page)                                   \
        while ((page = readahead_page(rac)))

No more readahead_next() to forget to add to filesystems which don't use
the readahead_for_each() iterator.  Ahem.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

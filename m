Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7316B2CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:40:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LT8-0005NN-K1; Mon, 24 Feb 2020 21:40:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6LT7-0005N9-4H
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65KytlXyewvGVahoyRdvC+touLtUiIJaP98fPBSxLjQ=; b=M0UDP7d8YEPaXxOYZ+ffDZRbC5
 sBmCQpIUvRC+9KSHFZDsdeaWAIcAojs2MgRo+RldDyCuBurLAvpdNj2oijS0bce1o06/FhvlC3CRo
 sZKcCgsQEKBeb+gf56xH6JxwuCm2RQY3LpeKwg4E0CveY3AEIrcwLb8+cOPo7viqankg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=65KytlXyewvGVahoyRdvC+touLtUiIJaP98fPBSxLjQ=; b=d/JtVCd5P0O7Xx8s0eA3tEDukJ
 dMeMLQUVoZa4MrQv7SMURAKggKQs8wb4erbj9tz0RN9lCLA42SSChZG6yX7wb1evf9aMDki/4tTO9
 YkCsjwJmArwRqBztitjfGCB25Hy+2h2309EWyrgTs9uKIqCMgIohd4VfKsZPvFvw/8Wo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LT5-008yUL-4M
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=65KytlXyewvGVahoyRdvC+touLtUiIJaP98fPBSxLjQ=; b=g2l2vA7YLEfvfs7PQ14x+FPEhp
 1yaO+e12NroUCtyLzhwbqCapyooZwwnLxi+zYHYu3dx7j2bMNHjss/eCzGNTD/EgfSGkmy2vqfB/1
 a8aXbUB4VDDYPX2I3IiQq/ggTnUl5tDhZIXMueCk6qBKa8Ikv0C4AABTBTz6X+htegap1EuJ3Cmuu
 XjjoRbv+jad91N6BXSewZH82e8r0TxczCQ6AY9KLZ9TAm9lelsNdvBqkpqpmmJyJriMqbLAFjvaTl
 8tmbQcMyyKIENDLcVreqHkRX3rFqoaFnNOPMjt9KICrGTFJ9ulD8TPuf60nR4pqcPpkSV/GTxYPmA
 b7e5Yhug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6LSx-0007AA-4f; Mon, 24 Feb 2020 21:40:39 +0000
Date: Mon, 24 Feb 2020 13:40:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224214039.GF13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-10-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219210103.32400-10-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j6LT5-008yUL-4M
Subject: Re: [f2fs-dev] [PATCH v7 09/24] mm: Put readahead pages in cache
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

On Wed, Feb 19, 2020 at 01:00:48PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> When populating the page cache for readahead, mappings that use
> ->readpages must populate the page cache themselves as the pages are
> passed on a linked list which would normally be used for the page cache's
> LRU.  For mappings that use ->readpage or the upcoming ->readahead method,
> we can put the pages into the page cache as soon as they're allocated,
> which solves a race between readahead and direct IO.  It also lets us
> remove the gfp argument from read_pages().
> 
> Use the new readahead_page() API to implement the repeated calls to
> ->readpage(), just like most filesystems will.  This iterator also
> supports huge pages, even though none of the filesystems have been
> converted to use them yet.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/pagemap.h | 20 +++++++++++++++++
>  mm/readahead.c          | 48 +++++++++++++++++++++++++----------------
>  2 files changed, 49 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 55fcea0249e6..4989d330fada 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -647,8 +647,28 @@ struct readahead_control {
>  /* private: use the readahead_* accessors instead */
>  	pgoff_t _index;
>  	unsigned int _nr_pages;
> +	unsigned int _batch_count;
>  };
>  
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +	struct page *page;
> +
> +	BUG_ON(rac->_batch_count > rac->_nr_pages);
> +	rac->_nr_pages -= rac->_batch_count;
> +	rac->_index += rac->_batch_count;
> +	rac->_batch_count = 0;
> +
> +	if (!rac->_nr_pages)
> +		return NULL;
> +
> +	page = xa_load(&rac->mapping->i_pages, rac->_index);
> +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> +	rac->_batch_count = hpage_nr_pages(page);
> +
> +	return page;
> +}
> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 83df5c061d33..aaa209559ba2 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,15 +113,14 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
>  
>  EXPORT_SYMBOL(read_cache_pages);
>  
> -static void read_pages(struct readahead_control *rac, struct list_head *pages,
> -		gfp_t gfp)
> +static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  {
>  	const struct address_space_operations *aops = rac->mapping->a_ops;
> +	struct page *page;
>  	struct blk_plug plug;
> -	unsigned page_idx;
>  
>  	if (!readahead_count(rac))
> -		return;
> +		goto out;
>  
>  	blk_start_plug(&plug);
>  
> @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>  				readahead_count(rac));
>  		/* Clean up the remaining pages */
>  		put_pages_list(pages);
> -		goto out;
> -	}
> -
> -	for (page_idx = 0; page_idx < readahead_count(rac); page_idx++) {
> -		struct page *page = lru_to_page(pages);
> -		list_del(&page->lru);
> -		if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> -				gfp))
> +		rac->_index += rac->_nr_pages;
> +		rac->_nr_pages = 0;
> +	} else {
> +		while ((page = readahead_page(rac))) {
>  			aops->readpage(rac->file, page);
> -		put_page(page);
> +			put_page(page);
> +		}
>  	}
>  
> -out:
>  	blk_finish_plug(&plug);
>  
>  	BUG_ON(!list_empty(pages));
> -	rac->_nr_pages = 0;
> +	BUG_ON(readahead_count(rac));
> +
> +out:
> +	/* If we were called due to a conflicting page, skip over it */
> +	rac->_index++;
>  }
>  
>  /*
> @@ -165,9 +164,11 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	LIST_HEAD(page_pool);
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	bool use_list = mapping->a_ops->readpages;

I find this single use variable a little weird.  Not a dealbreaker,
but just checking the methods would seem a little more obvious to me.

Except for this and the other nitpick the patch looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BA18EEAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 04:55:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGEBO-0004Km-S9; Mon, 23 Mar 2020 03:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGEBN-0004KY-L3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8D3MNI2RZ/V2nx63rlywJECLYaSXFytZgoECfhePimg=; b=WU6RhcMS0ZS7vlet0MsiPxS7OL
 5nv/ncgwkYHbFC32xGPavNu1YaAN1RkpIZv7fPJPjbdaF4GZMErxv8+jJPTH9/HlD819xza2hcIP3
 PekyGyetP73T7nMjGGEx/xgijmsMGoVie/3Mw4fDEe1j575tNoG4ngA7a447pWtkYkfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8D3MNI2RZ/V2nx63rlywJECLYaSXFytZgoECfhePimg=; b=UaeHEHSGN6Auk2zGhjJPQpCNDZ
 CnMFJ64K1EcCHyNfcK/SSu5PaJ5VStvMIq7uM1thq3xM1DlwJM9ypx8PiMc8sJnGcrg3ETdOTS8fQ
 XVju9/L8nTqrvVIKhn0r8XOVagTUJLbI9IO0PlMbfXP32wilU67lnT4OL3kJJBohxsBk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGEBL-00DOsn-LN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:55:21 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04B1020714;
 Mon, 23 Mar 2020 03:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584935714;
 bh=OBh+ukoepnmNeA3oMd1EdG4Mc4HasSJLB13qq51fjOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2RIgaoUzayp3K2mrLmxEfpZnPBGYXfecqHr2qwjblMK4RPe+BMbLPE/aBbutEpaIu
 Tpfbqcy/uitSMVJ30uYS3Gpj/Uw3uEZsPyE+cFcFce6x3Z0haNwq7b+TJcLJZJboQo
 AMtD2tgQpg1UuWaN1hPX/huPUg6p+S40+z68Px34=
Date: Sun, 22 Mar 2020 20:55:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200323035513.GB147648@google.com>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-23-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320142231.2402-23-willy@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGEBL-00DOsn-LN
Subject: Re: [f2fs-dev] [PATCH v9 22/25] f2fs: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/20, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Use the new readahead operation in f2fs
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/data.c              | 47 +++++++++++++++----------------------
>  include/trace/events/f2fs.h |  6 ++---
>  2 files changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8e9aa2254490..237dff36fe73 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2160,8 +2160,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   * from read-ahead.
>   */
>  static int f2fs_mpage_readpages(struct address_space *mapping,
> -			struct list_head *pages, struct page *page,
> -			unsigned nr_pages, bool is_readahead)
> +		struct readahead_control *rac, struct page *page)
>  {
>  	struct bio *bio = NULL;
>  	sector_t last_block_in_bio = 0;
> @@ -2179,6 +2178,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  		.nr_cpages = 0,
>  	};
>  #endif
> +	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
> @@ -2192,15 +2192,9 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  	map.m_may_create = false;
>  
>  	for (; nr_pages; nr_pages--) {
> -		if (pages) {
> -			page = list_last_entry(pages, struct page, lru);
> -
> +		if (rac) {
> +			page = readahead_page(rac);
>  			prefetchw(&page->flags);
> -			list_del(&page->lru);
> -			if (add_to_page_cache_lru(page, mapping,
> -						  page_index(page),
> -						  readahead_gfp_mask(mapping)))
> -				goto next_page;
>  		}
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -2210,7 +2204,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  				ret = f2fs_read_multi_pages(&cc, &bio,
>  							max_nr_pages,
>  							&last_block_in_bio,
> -							is_readahead);
> +							rac);
>  				f2fs_destroy_compress_ctx(&cc);
>  				if (ret)
>  					goto set_error_page;
> @@ -2233,7 +2227,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  #endif
>  
>  		ret = f2fs_read_single_page(inode, page, max_nr_pages, &map,
> -					&bio, &last_block_in_bio, is_readahead);
> +					&bio, &last_block_in_bio, rac);
>  		if (ret) {
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  set_error_page:
> @@ -2242,8 +2236,10 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  			zero_user_segment(page, 0, PAGE_SIZE);
>  			unlock_page(page);
>  		}
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>  next_page:
> -		if (pages)
> +#endif
> +		if (rac)
>  			put_page(page);
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -2253,16 +2249,15 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  				ret = f2fs_read_multi_pages(&cc, &bio,
>  							max_nr_pages,
>  							&last_block_in_bio,
> -							is_readahead);
> +							rac);
>  				f2fs_destroy_compress_ctx(&cc);
>  			}
>  		}
>  #endif
>  	}
> -	BUG_ON(pages && !list_empty(pages));
>  	if (bio)
>  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
> -	return pages ? 0 : ret;
> +	return ret;
>  }
>  
>  static int f2fs_read_data_page(struct file *file, struct page *page)
> @@ -2281,28 +2276,24 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
>  	if (f2fs_has_inline_data(inode))
>  		ret = f2fs_read_inline_data(inode, page);
>  	if (ret == -EAGAIN)
> -		ret = f2fs_mpage_readpages(page_file_mapping(page),
> -						NULL, page, 1, false);
> +		ret = f2fs_mpage_readpages(page_file_mapping(page), NULL, page);
>  	return ret;
>  }
>  
> -static int f2fs_read_data_pages(struct file *file,
> -			struct address_space *mapping,
> -			struct list_head *pages, unsigned nr_pages)
> +static void f2fs_readahead(struct readahead_control *rac)
>  {
> -	struct inode *inode = mapping->host;
> -	struct page *page = list_last_entry(pages, struct page, lru);
> +	struct inode *inode = rac->mapping->host;
>  
> -	trace_f2fs_readpages(inode, page, nr_pages);
> +	trace_f2fs_readpages(inode, readahead_index(rac), readahead_count(rac));
>  
>  	if (!f2fs_is_compress_backend_ready(inode))
> -		return 0;
> +		return;
>  
>  	/* If the file has inline data, skip readpages */
>  	if (f2fs_has_inline_data(inode))
> -		return 0;
> +		return;
>  
> -	return f2fs_mpage_readpages(mapping, pages, NULL, nr_pages, true);
> +	f2fs_mpage_readpages(rac->mapping, rac, NULL);
>  }
>  
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
> @@ -3784,7 +3775,7 @@ static void f2fs_swap_deactivate(struct file *file)
>  
>  const struct address_space_operations f2fs_dblock_aops = {
>  	.readpage	= f2fs_read_data_page,
> -	.readpages	= f2fs_read_data_pages,
> +	.readahead	= f2fs_readahead,
>  	.writepage	= f2fs_write_data_page,
>  	.writepages	= f2fs_write_data_pages,
>  	.write_begin	= f2fs_write_begin,
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 67a97838c2a0..d72da4a33883 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1375,9 +1375,9 @@ TRACE_EVENT(f2fs_writepages,
>  
>  TRACE_EVENT(f2fs_readpages,
>  
> -	TP_PROTO(struct inode *inode, struct page *page, unsigned int nrpage),
> +	TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage),
>  
> -	TP_ARGS(inode, page, nrpage),
> +	TP_ARGS(inode, start, nrpage),
>  
>  	TP_STRUCT__entry(
>  		__field(dev_t,	dev)
> @@ -1389,7 +1389,7 @@ TRACE_EVENT(f2fs_readpages,
>  	TP_fast_assign(
>  		__entry->dev	= inode->i_sb->s_dev;
>  		__entry->ino	= inode->i_ino;
> -		__entry->start	= page->index;
> +		__entry->start	= start;
>  		__entry->nrpage	= nrpage;
>  	),
>  
> -- 
> 2.25.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

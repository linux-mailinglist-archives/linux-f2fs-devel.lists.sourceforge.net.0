Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF918D78E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 19:44:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFMdF-0005ta-Uh; Fri, 20 Mar 2020 18:44:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFMdD-0005t9-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ykb3I5OzZWTNN6rO003REWrPKraEP62vLmeZaR5n7Yk=; b=d9YyqWfm5AacXsUx5W+zb24VwB
 W8QlCkgFOdC6YuGTpHO8S6rNyBROoL4FGWt1h97hUiBaUXgeHHvx9tw6UuEr8pr/p5cddBFHwM8pm
 HOsRFMSPXZ8wsvGQ2u/MyOOllu3cbqFisKJPo3cLX5GU5XTkJ++bde887KAk8alRczEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ykb3I5OzZWTNN6rO003REWrPKraEP62vLmeZaR5n7Yk=; b=PCZX5XrGbdLjNr8w93ddpOPVpF
 peo9RnpB6S4EGU+Rvsby5vEvsRa+ZIlGVXItMLnNgd+oXCeDlLioWc6707lWIs7pVfgblHCKqIuz9
 oHUEkdVcdTjIAbALg6G+Y7uIj6+Pq+7jflhZW+a2aQKEpUvahNNyixvaZquYUdSYsqmI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFMd7-001en5-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:44:31 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9895A2051A;
 Fri, 20 Mar 2020 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584729860;
 bh=5pZqAya2TSGOpl920vnSvHi9jKtNxmt64mv8PAdFI3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VyRgr5LelhylhzZlcVYEomgTosDPQP2hFACxdbSh1g8cxdYQj8CURPVdAol5gz7Rg
 ExBTz35Q8O5vnKTi+DibRxVv6t5mUtWBLawcyZ38iKpEQsk8AEImcLdLmORUJEYHIs
 e+oJ5iVBFhvWYyFYTKBJXTMNGFlzAY6GTvEUiHMY=
Date: Fri, 20 Mar 2020 11:44:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320184418.GH851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-22-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320142231.2402-22-willy@infradead.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFMd7-001en5-JJ
Subject: Re: [f2fs-dev] [PATCH v9 21/25] ext4: Pass the inode to
 ext4_mpage_readpages
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 07:22:27AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> This function now only uses the mapping argument to look up the inode,
> and both callers already have the inode, so just pass the inode instead
> of the mapping.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/ext4/ext4.h     | 2 +-
>  fs/ext4/inode.c    | 4 ++--
>  fs/ext4/readpage.c | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 1570a0b51b73..bc1b34ba6eab 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3278,7 +3278,7 @@ static inline void ext4_set_de_type(struct super_block *sb,
>  }
>  
>  /* readpages.c */
> -extern int ext4_mpage_readpages(struct address_space *mapping,
> +extern int ext4_mpage_readpages(struct inode *inode,
>  		struct readahead_control *rac, struct page *page);
>  extern int __init ext4_init_post_read_processing(void);
>  extern void ext4_exit_post_read_processing(void);
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index d674c5f9066c..4f3703c1408d 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3226,7 +3226,7 @@ static int ext4_readpage(struct file *file, struct page *page)
>  		ret = ext4_readpage_inline(inode, page);
>  
>  	if (ret == -EAGAIN)
> -		return ext4_mpage_readpages(page->mapping, NULL, page);
> +		return ext4_mpage_readpages(inode, NULL, page);
>  
>  	return ret;
>  }
> @@ -3239,7 +3239,7 @@ static void ext4_readahead(struct readahead_control *rac)
>  	if (ext4_has_inline_data(inode))
>  		return;
>  
> -	ext4_mpage_readpages(rac->mapping, rac, NULL);
> +	ext4_mpage_readpages(inode, rac, NULL);
>  }
>  
>  static void ext4_invalidatepage(struct page *page, unsigned int offset,
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 66275f25235d..5761e9961682 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -221,13 +221,12 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
>  	return i_size_read(inode);
>  }
>  
> -int ext4_mpage_readpages(struct address_space *mapping,
> +int ext4_mpage_readpages(struct inode *inode,
>  		struct readahead_control *rac, struct page *page)
>  {
>  	struct bio *bio = NULL;
>  	sector_t last_block_in_bio = 0;
>  
> -	struct inode *inode = mapping->host;
>  	const unsigned blkbits = inode->i_blkbits;
>  	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
>  	const unsigned blocksize = 1 << blkbits;
> -- 

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

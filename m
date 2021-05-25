Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A5390AAB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 22:48:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lldyJ-00008h-6Q; Tue, 25 May 2021 20:48:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1lldyH-00008N-F5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BlXQBmnqpIQgWpK/kS58Jsfa1gYArpdcs60T2Ho4gv8=; b=mLxniJmRRsAcBiFBeFJHncdmyi
 1viWzLyEFVhte+swqmwoGpkZgjf8TjI3s3CuROgAJS5oVwj3geDPM/nKDC0bJj64hvh76i2zt5COz
 IZivu7LnSU0I2538YxlWKLvw8S7Q2Ln8MHlLIgmLMsSRYfVUpeYQZRdZgRLe52e4IR0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BlXQBmnqpIQgWpK/kS58Jsfa1gYArpdcs60T2Ho4gv8=; b=OFB+P1ifTZcsupi5FamNYHTUw4
 xNYRx5ezLoJs2HezZ2j1ThZjNZId8K8VACnFKrPQy0M6AO/2/mQ52RjL2WnsNgW0vEB0xCAsaWfQR
 cNeqbmoLuhqKDj7yN96IN4sxViU2PFDVsazdXjF3rKa4KgB3zEYXEdftuUU46P/o04xY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lldyF-005mx7-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:48:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 279AC6140B;
 Tue, 25 May 2021 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621975686;
 bh=6LI8nXD4++dr3yyc1ORbVc5YQQSxmuG/HaJJYKgTcFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hH52FUkACUHkbGllGWKwrxKsRdd7iP1mxfk+a1siOZdVEI6kqEuJbPHskAt+ZHwN4
 ozrQSEp5tw5Gb6MwaHJvlGX7okhpBVC7kaKOPG0yeWWuiByjPqBcZ+iSdBNjfDr9dx
 jnXRndLPBuoUupxSSQVFzcb2TZSUXQLudpuvhwr5jjDe1vLlsryU6GO2yrRmtUkbU8
 CRQ0V0KAi8mlSP4V9Tho0unqQs0vlIvGF1Jx8i50zax3nIdKRsitXTY9wkG21d1Vep
 cyf5F4e0akiKk/6Jo4hg5uCCpY1XHtPn8Xiz1gtFWFGdIJ7JZPkbz23+Y+4M9fkHQh
 0hhvZ6suqaANQ==
Date: Tue, 25 May 2021 13:48:05 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210525204805.GM202121@locust>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-4-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525135100.11221-4-jack@suse.cz>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lldyF-005mx7-Jk
Subject: Re: [f2fs-dev] [PATCH 04/13] mm: Add functions to lock
 invalidate_lock for two mappings
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 25, 2021 at 03:50:41PM +0200, Jan Kara wrote:
> Some operations such as reflinking blocks among files will need to lock
> invalidate_lock for two mappings. Add helper functions to do that.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  include/linux/fs.h |  6 ++++++
>  mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 897238d9f1e0..e6f7447505f5 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -822,6 +822,12 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
>  void lock_two_nondirectories(struct inode *, struct inode*);
>  void unlock_two_nondirectories(struct inode *, struct inode*);
>  
> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> +				       struct address_space *mapping2);
> +void filemap_invalidate_up_write_two(struct address_space *mapping1,

TBH I find myself wishing that the invalidate_lock used the same
lock/unlock style wrappers that we use for i_rwsem.

filemap_invalidate_lock(inode1->mapping);
filemap_invalidate_lock_two(inode1->i_mapping, inode2->i_mapping);

To be fair, I've never been able to keep straight that down means lock
and up means unlock.  Ah well, at least you didn't use "p" and "v".

Mechanically, the changes look ok to me.
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D

> +				     struct address_space *mapping2);
> +
> +
>  /*
>   * NOTE: in a 32bit arch with a preemptable kernel and
>   * an UP compile the i_size_read/write must be atomic
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 4d9ec4c6cc34..d3801a9739aa 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1009,6 +1009,44 @@ struct page *__page_cache_alloc(gfp_t gfp)
>  EXPORT_SYMBOL(__page_cache_alloc);
>  #endif
>  
> +/*
> + * filemap_invalidate_down_write_two - lock invalidate_lock for two mappings
> + *
> + * Lock exclusively invalidate_lock of any passed mapping that is not NULL.
> + *
> + * @mapping1: the first mapping to lock
> + * @mapping2: the second mapping to lock
> + */
> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> +				       struct address_space *mapping2)
> +{
> +	if (mapping1 > mapping2)
> +		swap(mapping1, mapping2);
> +	if (mapping1)
> +		down_write(&mapping1->invalidate_lock);
> +	if (mapping2 && mapping1 != mapping2)
> +		down_write_nested(&mapping2->invalidate_lock, 1);
> +}
> +EXPORT_SYMBOL(filemap_invalidate_down_write_two);
> +
> +/*
> + * filemap_invalidate_up_write_two - unlock invalidate_lock for two mappings
> + *
> + * Unlock exclusive invalidate_lock of any passed mapping that is not NULL.
> + *
> + * @mapping1: the first mapping to unlock
> + * @mapping2: the second mapping to unlock
> + */
> +void filemap_invalidate_up_write_two(struct address_space *mapping1,
> +				     struct address_space *mapping2)
> +{
> +	if (mapping1)
> +		up_write(&mapping1->invalidate_lock);
> +	if (mapping2 && mapping1 != mapping2)
> +		up_write(&mapping2->invalidate_lock);
> +}
> +EXPORT_SYMBOL(filemap_invalidate_up_write_two);
> +
>  /*
>   * In order to wait for pages to become available there must be
>   * waitqueues associated with pages. By using a hash table of
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

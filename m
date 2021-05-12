Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EFA37C080
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 16:43:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgq5J-0003sw-T2; Wed, 12 May 2021 14:43:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1lgq5J-0003sg-1E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 14:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nmCeol4OxOYxGsAsqjc6BSS4j1R2S4rzG/0fPJoXFKI=; b=LhMXIsNcK3UyG+7Z6/BI3bpGju
 t57fdKVLomYBAQNKkTfJhIUhmSrrfLAxuHmeRw17W/0TD1pt6MK6AmERwmvxHB+yOqmLJjnp7s5fJ
 Ty63exCt6LFWlQ8Q7uDMIHgvazIv9q/bxSBnZY8/VTB4Ev3juwfOwW+Pkk2ZuvfFevvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nmCeol4OxOYxGsAsqjc6BSS4j1R2S4rzG/0fPJoXFKI=; b=OuJj6C31FdnebEv4ekvRpRRTyE
 Ft7R9UHdAyL6vu9fHXVyGyUatdPynpAcfwdJ9dEI/N6PvYx6gfTJXoeAmrMig4+vQjmXyjvL1GzaC
 G2+ll5AIEmGznaFCyKv3FTTp3gxGWFjgST+o5Ye0DvqlRol1seiR/9eYUZLPA4imh4eg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgq5B-005YA5-By
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 14:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nmCeol4OxOYxGsAsqjc6BSS4j1R2S4rzG/0fPJoXFKI=; b=a+NNS/dSBg4ioksrXQKLAeOm0U
 fU0YgisnbBMFBlWnjNB0l4NWnvCy2wZOot3llat5Ww6lZvRuPm3gwsrPT3VbNlfaNPXo+mmYWK7CD
 GI4iIw8yeVzZVKkwbSyuxbJTLCe2EHfHQ55zluQDAWZp0+DB+fnvuAB766DGz2RH5Nhss0xfAw1B2
 P1/NvqUn+xdA97P+o3Sw8HmnOS9H+PZ8qPtpFVoKHkm1jyf4U315OzYXWxMvMFqPIAtuczY9ZdRJ7
 SqkG4lrx5+GB3z6L+CqZp3UHEsAshbfcW1DIKpYADkAyFJ/D7l+TxhRiuVYb49Scc6hu741DxOETB
 n319PzdA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lgq29-008NIW-W7; Wed, 12 May 2021 14:40:49 +0000
Date: Wed, 12 May 2021 15:40:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YJvo1bGG1tG+gtgC@casper.infradead.org>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512134631.4053-3-jack@suse.cz>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lgq5B-005YA5-By
Subject: Re: [f2fs-dev] [PATCH 03/11] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 12, 2021 at 03:46:11PM +0200, Jan Kara wrote:
> Currently, serializing operations such as page fault, read, or readahead
> against hole punching is rather difficult. The basic race scheme is
> like:
> 
> fallocate(FALLOC_FL_PUNCH_HOLE)			read / fault / ..
>   truncate_inode_pages_range()
> 						  <create pages in page
> 						   cache here>
>   <update fs block mapping and free blocks>
> 
> Now the problem is in this way read / page fault / readahead can
> instantiate pages in page cache with potentially stale data (if blocks
> get quickly reused). Avoiding this race is not simple - page locks do
> not work because we want to make sure there are *no* pages in given
> range. inode->i_rwsem does not work because page fault happens under
> mmap_sem which ranks below inode->i_rwsem. Also using it for reads makes
> the performance for mixed read-write workloads suffer.
> 
> So create a new rw_semaphore in the address_space - invalidate_lock -
> that protects adding of pages to page cache for page faults / reads /
> readahead.

Remind me (or, rather, add to the documentation) why we have to hold the
invalidate_lock during the call to readpage / readahead, and we don't just
hold it around the call to add_to_page_cache / add_to_page_cache_locked
/ add_to_page_cache_lru ?  I appreciate that ->readpages is still going
to suck, but we're down to just three implementations of ->readpages now
(9p, cifs & nfs).

Also, could I trouble you to run the comments through 'fmt' (or
equivalent)?  It's easier to read if you're not kissing right up on 80
columns.

> +++ b/fs/inode.c
> @@ -190,6 +190,9 @@ int inode_init_always(struct super_block *sb, struct inode *inode)
>  	mapping_set_gfp_mask(mapping, GFP_HIGHUSER_MOVABLE);
>  	mapping->private_data = NULL;
>  	mapping->writeback_index = 0;
> +	init_rwsem(&mapping->invalidate_lock);
> +	lockdep_set_class(&mapping->invalidate_lock,
> +			  &sb->s_type->invalidate_lock_key);

Why not:

	__init_rwsem(&mapping->invalidate_lock, "mapping.invalidate_lock",
			&sb->s_type->invalidate_lock_key);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

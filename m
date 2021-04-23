Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BF636A6B2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 12:34:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lac5K-0002Zp-4T; Sun, 25 Apr 2021 10:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1lac4k-0002SN-16
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 10:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDcdxp5cEhaFD97dvEJWxzdzYg+G92WfLMsp5cV6zos=; b=i4ZocqTevSvelCVopx3nC2VmpY
 B3UPWP/bxjmkzTfO2wz5BJAYaT8KOn6TLEU/Y5/hqcgbwogm2i6GFYxLyWyXLL/qbcqIAdN1II9of
 +EnFfNp2SteoC1qBgvP4jDx4FZFQcqJcIS5be4KZAhiWdkYfr2wsVyXaBjoqHlD5M4fQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDcdxp5cEhaFD97dvEJWxzdzYg+G92WfLMsp5cV6zos=; b=c6MyvSiaF2MKUHJVQEHpO5WMoP
 cvd46f5XkZffX/F9+cQ6eJ0Ze2eQsOft45vT+q0ISOVYikDgU+ZPiJWcAv5deZ1nvNMxsGN7V+gu/
 YUXiKxqbU5+H5jCnLYVMSkuLLKYT83/Zv3E9inPEvOUSbNyxJb2BA9y9S1bNEBCv3ZQY=;
Received: from mail108.syd.optusnet.com.au ([211.29.132.59])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1lac4b-0001c2-Jo
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 10:33:17 +0000
Received: from dread.disaster.area (pa49-181-239-12.pa.nsw.optusnet.com.au
 [49.181.239.12])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id A7DB51AF798;
 Sat, 24 Apr 2021 09:04:50 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1la4qv-004cCW-Fb; Sat, 24 Apr 2021 09:04:49 +1000
Date: Sat, 24 Apr 2021 09:04:49 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210423230449.GC1990290@dread.disaster.area>
References: <20210423171010.12-1-jack@suse.cz>
 <20210423173018.23133-2-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423173018.23133-2-jack@suse.cz>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0 cx=a_idp_f
 a=gO82wUwQTSpaJfP49aMSow==:117 a=gO82wUwQTSpaJfP49aMSow==:17
 a=kj9zAlcOel0A:10 a=3YhXtTcJ-WEA:10 a=7-415B0cAAAA:8
 a=fwWlK0ynS9Jva5SY9FMA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1lac4b-0001c2-Jo
Subject: Re: [f2fs-dev] [PATCH 02/12] mm: Protect operations adding pages to
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
 Ted Tso <tytso@mit.edu>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Steve French <sfrench@samba.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 23, 2021 at 07:29:31PM +0200, Jan Kara wrote:
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
.....
> diff --git a/fs/inode.c b/fs/inode.c
> index a047ab306f9a..43596dd8b61e 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -191,6 +191,9 @@ int inode_init_always(struct super_block *sb, struct inode *inode)
>  	mapping_set_gfp_mask(mapping, GFP_HIGHUSER_MOVABLE);
>  	mapping->private_data = NULL;
>  	mapping->writeback_index = 0;
> +	init_rwsem(&mapping->invalidate_lock);
> +	lockdep_set_class(&mapping->invalidate_lock,
> +			  &sb->s_type->invalidate_lock_key);
>  	inode->i_private = NULL;
>  	inode->i_mapping = mapping;
>  	INIT_HLIST_HEAD(&inode->i_dentry);	/* buggered by rcu freeing */

Oh, lockdep. That might be a problem here.

The XFS_MMAPLOCK has non-trivial lockdep annotations so that it is
tracked as nesting properly against the IOLOCK and the ILOCK. When
you end up using xfs_ilock(XFS_MMAPLOCK..) to lock this, XFS will
add subclass annotations to the lock and they are going to be
different to the locking that the VFS does.

We'll see this from xfs_lock_two_inodes() (e.g. in
xfs_swap_extents()) and xfs_ilock2_io_mmap() during reflink
oper.....

Oooooh. The page cache copy done when breaking a shared extent needs
to lock out page faults on both the source and destination, but it
still needs to be able to populate the page cache of both the source
and destination file.....

.... and vfs_dedupe_file_range_compare() has to be able to read
pages from both the source and destination file to determine that
the contents are identical and that's done while we hold the
XFS_MMAPLOCK exclusively so the compare is atomic w.r.t. all other
user data modification operations being run....

I now have many doubts that this "serialise page faults by locking
out page cache instantiation" method actually works as a generic
mechanism. It's not just page cache invalidation that relies on
being able to lock out page faults: copy-on-write and deduplication
both require the ability to populate the page cache with source data
while page faults are locked out so the data can be compared/copied
atomically with the extent level manipulations and so user data
modifications cannot occur until the physical extent manipulation
operation has completed.

Having only just realised this is a problem, no solution has
immediately popped into my mind. I'll chew on it over the weekend,
but I'm not hopeful at this point...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

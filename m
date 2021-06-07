Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5596539E06A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 17:31:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqHDm-0003cW-Bm; Mon, 07 Jun 2021 15:31:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <djwong@kernel.org>) id 1lqHDk-0003cO-Im
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 15:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9To1MeyrHlIhQ9JFws/ShIx+62fO+MLqcMJq0Jb9SBw=; b=ejZGHDX75H+aJ3PqxW3v+X5NX+
 8lnL3LOQym1PEe5yvYZDndtZVu6O0012UyPMmKyLMio52JY6gPYox6SVLly98T9lImTakRw7wDoC2
 UUeD8pMwaQaK/pKQxtP8qjb0jUU7ZwC0Kll2Qs60x9m2r8TL4Mf9x8CQyVku+uQvI9Qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9To1MeyrHlIhQ9JFws/ShIx+62fO+MLqcMJq0Jb9SBw=; b=B2cu+E4508JbybbWEj9TGwMSty
 G69ylcWkH53TabzaUYos8qWu/Xwn89ZbpzilZDueSWpnjD5rnK0UAmv5ei/4y2qTfhqj6YnZC0Xpt
 3U2UpnjT2mOCFrmwL43lmNF46kXFu3+BWbG7CKTZxk8wypcLlyVMPeOQW/B6zxqNVWog=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqHDh-0007yy-K8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 15:31:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10CAF61164;
 Mon,  7 Jun 2021 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623079873;
 bh=x7ltdwKuj/8AEfn5X8yQRrY1wycb+wnIWGHXQdLgplA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kPNkDSqRwfSOovrx3y8vwkHq9xqWu09qyeFrejTeJAil/FJDMSCCSBdQF1iu6K6g4
 2kOOfqeSzgAzjVyWMm8KKtQ0IafqNNmN6JexIE3FE50yv5pXRHaxBlr2iY8j5Kt4rh
 yBYsBTiQH1n3VRGKvtQxoEiKy82Y5hlInQlCifhj+5MzQ7abTnNow8N8LhkHjqwZcT
 jaCz8qvgWW7FQbzbkFEIz2vrPSOXJVS7RFP9U8s7Boq/UWjwzDyyGtDqkUXUNB8oRZ
 wZ6X/1VlxsIAxPv1oDj3KYAB5FJLGcoFewkqnSxVriV4OYkgVWRyh6VA0BH3eDXz7z
 dsXUJLA3EJsfg==
Date: Mon, 7 Jun 2021 08:31:12 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210607153112.GF2945738@locust>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607145236.31852-1-jack@suse.cz>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqHDh-0007yy-K8
Subject: Re: [f2fs-dev] [PATCH 01/14] mm: Fix comments mentioning i_mutex
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
 Hugh Dickins <hughd@google.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 07, 2021 at 04:52:11PM +0200, Jan Kara wrote:
> inode->i_mutex has been replaced with inode->i_rwsem long ago. Fix
> comments still mentioning i_mutex.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Hugh Dickins <hughd@google.com>
> Signed-off-by: Jan Kara <jack@suse.cz>

Looks good to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  mm/filemap.c        | 10 +++++-----
>  mm/madvise.c        |  2 +-
>  mm/memory-failure.c |  2 +-
>  mm/rmap.c           |  6 +++---
>  mm/shmem.c          | 20 ++++++++++----------
>  mm/truncate.c       |  8 ++++----
>  6 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 66f7e9fdfbc4..ba1068a1837f 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -76,7 +76,7 @@
>   *      ->swap_lock		(exclusive_swap_page, others)
>   *        ->i_pages lock
>   *
> - *  ->i_mutex
> + *  ->i_rwsem
>   *    ->i_mmap_rwsem		(truncate->unmap_mapping_range)
>   *
>   *  ->mmap_lock
> @@ -87,7 +87,7 @@
>   *  ->mmap_lock
>   *    ->lock_page		(access_process_vm)
>   *
> - *  ->i_mutex			(generic_perform_write)
> + *  ->i_rwsem			(generic_perform_write)
>   *    ->mmap_lock		(fault_in_pages_readable->do_page_fault)
>   *
>   *  bdi->wb.list_lock
> @@ -3710,12 +3710,12 @@ EXPORT_SYMBOL(generic_perform_write);
>   * modification times and calls proper subroutines depending on whether we
>   * do direct IO or a standard buffered write.
>   *
> - * It expects i_mutex to be grabbed unless we work on a block device or similar
> + * It expects i_rwsem to be grabbed unless we work on a block device or similar
>   * object which does not need locking at all.
>   *
>   * This function does *not* take care of syncing data in case of O_SYNC write.
>   * A caller has to handle it. This is mainly due to the fact that we want to
> - * avoid syncing under i_mutex.
> + * avoid syncing under i_rwsem.
>   *
>   * Return:
>   * * number of bytes written, even for truncated writes
> @@ -3803,7 +3803,7 @@ EXPORT_SYMBOL(__generic_file_write_iter);
>   *
>   * This is a wrapper around __generic_file_write_iter() to be used by most
>   * filesystems. It takes care of syncing the file in case of O_SYNC file
> - * and acquires i_mutex as needed.
> + * and acquires i_rwsem as needed.
>   * Return:
>   * * negative error code if no data has been written at all of
>   *   vfs_fsync_range() failed for a synchronous write
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 63e489e5bfdb..a0137706b92a 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -853,7 +853,7 @@ static long madvise_remove(struct vm_area_struct *vma,
>  			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
>  
>  	/*
> -	 * Filesystem's fallocate may need to take i_mutex.  We need to
> +	 * Filesystem's fallocate may need to take i_rwsem.  We need to
>  	 * explicitly grab a reference because the vma (and hence the
>  	 * vma's reference to the file) can go away as soon as we drop
>  	 * mmap_lock.
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 85ad98c00fd9..9dcc9bcea731 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -704,7 +704,7 @@ static int me_pagecache_clean(struct page *p, unsigned long pfn)
>  	/*
>  	 * Truncation is a bit tricky. Enable it per file system for now.
>  	 *
> -	 * Open: to take i_mutex or not for this? Right now we don't.
> +	 * Open: to take i_rwsem or not for this? Right now we don't.
>  	 */
>  	return truncate_error_page(p, pfn, mapping);
>  }
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 693a610e181d..a35cbbbded0d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -20,9 +20,9 @@
>  /*
>   * Lock ordering in mm:
>   *
> - * inode->i_mutex	(while writing or truncating, not reading or faulting)
> + * inode->i_rwsem	(while writing or truncating, not reading or faulting)
>   *   mm->mmap_lock
> - *     page->flags PG_locked (lock_page)   * (see huegtlbfs below)
> + *     page->flags PG_locked (lock_page)   * (see hugetlbfs below)
>   *       hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
>   *         mapping->i_mmap_rwsem
>   *           hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
> @@ -41,7 +41,7 @@
>   *                             in arch-dependent flush_dcache_mmap_lock,
>   *                             within bdi.wb->list_lock in __sync_single_inode)
>   *
> - * anon_vma->rwsem,mapping->i_mutex      (memory_failure, collect_procs_anon)
> + * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs_anon)
>   *   ->tasklist_lock
>   *     pte map lock
>   *
> diff --git a/mm/shmem.c b/mm/shmem.c
> index a08cedefbfaa..056204b1f76a 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -96,7 +96,7 @@ static struct vfsmount *shm_mnt;
>  
>  /*
>   * shmem_fallocate communicates with shmem_fault or shmem_writepage via
> - * inode->i_private (with i_mutex making sure that it has only one user at
> + * inode->i_private (with i_rwsem making sure that it has only one user at
>   * a time): we would prefer not to enlarge the shmem inode just for that.
>   */
>  struct shmem_falloc {
> @@ -774,7 +774,7 @@ static int shmem_free_swap(struct address_space *mapping,
>   * Determine (in bytes) how many of the shmem object's pages mapped by the
>   * given offsets are swapped out.
>   *
> - * This is safe to call without i_mutex or the i_pages lock thanks to RCU,
> + * This is safe to call without i_rwsem or the i_pages lock thanks to RCU,
>   * as long as the inode doesn't go away and racy results are not a problem.
>   */
>  unsigned long shmem_partial_swap_usage(struct address_space *mapping,
> @@ -806,7 +806,7 @@ unsigned long shmem_partial_swap_usage(struct address_space *mapping,
>   * Determine (in bytes) how many of the shmem object's pages mapped by the
>   * given vma is swapped out.
>   *
> - * This is safe to call without i_mutex or the i_pages lock thanks to RCU,
> + * This is safe to call without i_rwsem or the i_pages lock thanks to RCU,
>   * as long as the inode doesn't go away and racy results are not a problem.
>   */
>  unsigned long shmem_swap_usage(struct vm_area_struct *vma)
> @@ -1069,7 +1069,7 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
>  		loff_t oldsize = inode->i_size;
>  		loff_t newsize = attr->ia_size;
>  
> -		/* protected by i_mutex */
> +		/* protected by i_rwsem */
>  		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
>  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
>  			return -EPERM;
> @@ -2049,7 +2049,7 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  	/*
>  	 * Trinity finds that probing a hole which tmpfs is punching can
>  	 * prevent the hole-punch from ever completing: which in turn
> -	 * locks writers out with its hold on i_mutex.  So refrain from
> +	 * locks writers out with its hold on i_rwsem.  So refrain from
>  	 * faulting pages into the hole while it's being punched.  Although
>  	 * shmem_undo_range() does remove the additions, it may be unable to
>  	 * keep up, as each new page needs its own unmap_mapping_range() call,
> @@ -2060,7 +2060,7 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  	 * we just need to make racing faults a rare case.
>  	 *
>  	 * The implementation below would be much simpler if we just used a
> -	 * standard mutex or completion: but we cannot take i_mutex in fault,
> +	 * standard mutex or completion: but we cannot take i_rwsem in fault,
>  	 * and bloating every shmem inode for this unlikely case would be sad.
>  	 */
>  	if (unlikely(inode->i_private)) {
> @@ -2518,7 +2518,7 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
>  	struct shmem_inode_info *info = SHMEM_I(inode);
>  	pgoff_t index = pos >> PAGE_SHIFT;
>  
> -	/* i_mutex is held by caller */
> +	/* i_rwsem is held by caller */
>  	if (unlikely(info->seals & (F_SEAL_GROW |
>  				   F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))) {
>  		if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))
> @@ -2618,7 +2618,7 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  
>  		/*
>  		 * We must evaluate after, since reads (unlike writes)
> -		 * are called without i_mutex protection against truncate
> +		 * are called without i_rwsem protection against truncate
>  		 */
>  		nr = PAGE_SIZE;
>  		i_size = i_size_read(inode);
> @@ -2688,7 +2688,7 @@ static loff_t shmem_file_llseek(struct file *file, loff_t offset, int whence)
>  		return -ENXIO;
>  
>  	inode_lock(inode);
> -	/* We're holding i_mutex so we can access i_size directly */
> +	/* We're holding i_rwsem so we can access i_size directly */
>  	offset = mapping_seek_hole_data(mapping, offset, inode->i_size, whence);
>  	if (offset >= 0)
>  		offset = vfs_setpos(file, offset, MAX_LFS_FILESIZE);
> @@ -2717,7 +2717,7 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>  		loff_t unmap_end = round_down(offset + len, PAGE_SIZE) - 1;
>  		DECLARE_WAIT_QUEUE_HEAD_ONSTACK(shmem_falloc_waitq);
>  
> -		/* protected by i_mutex */
> +		/* protected by i_rwsem */
>  		if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE)) {
>  			error = -EPERM;
>  			goto out;
> diff --git a/mm/truncate.c b/mm/truncate.c
> index 95af244b112a..57a618c4a0d6 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -415,7 +415,7 @@ EXPORT_SYMBOL(truncate_inode_pages_range);
>   * @mapping: mapping to truncate
>   * @lstart: offset from which to truncate
>   *
> - * Called under (and serialised by) inode->i_mutex.
> + * Called under (and serialised by) inode->i_rwsem.
>   *
>   * Note: When this function returns, there can be a page in the process of
>   * deletion (inside __delete_from_page_cache()) in the specified range.  Thus
> @@ -432,7 +432,7 @@ EXPORT_SYMBOL(truncate_inode_pages);
>   * truncate_inode_pages_final - truncate *all* pages before inode dies
>   * @mapping: mapping to truncate
>   *
> - * Called under (and serialized by) inode->i_mutex.
> + * Called under (and serialized by) inode->i_rwsem.
>   *
>   * Filesystems have to use this in the .evict_inode path to inform the
>   * VM that this is the final truncate and the inode is going away.
> @@ -753,7 +753,7 @@ EXPORT_SYMBOL(truncate_pagecache);
>   * setattr function when ATTR_SIZE is passed in.
>   *
>   * Must be called with a lock serializing truncates and writes (generally
> - * i_mutex but e.g. xfs uses a different lock) and before all filesystem
> + * i_rwsem but e.g. xfs uses a different lock) and before all filesystem
>   * specific block truncation has been performed.
>   */
>  void truncate_setsize(struct inode *inode, loff_t newsize)
> @@ -782,7 +782,7 @@ EXPORT_SYMBOL(truncate_setsize);
>   *
>   * The function must be called after i_size is updated so that page fault
>   * coming after we unlock the page will already see the new i_size.
> - * The function must be called while we still hold i_mutex - this not only
> + * The function must be called while we still hold i_rwsem - this not only
>   * makes sure i_size is stable but also that userspace cannot observe new
>   * i_size value before we are prepared to store mmap writes at new inode size.
>   */
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

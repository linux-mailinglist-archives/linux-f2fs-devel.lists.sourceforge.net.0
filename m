Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2639E183
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 18:09:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqHoh-0003eB-BR; Mon, 07 Jun 2021 16:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1lqHog-0003dy-I6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h0cBhYwEtY6qLPhoFwcORqLMa7nlMUnm6cfrAbAlnuc=; b=ALQU67Zq66V4LxXgh8xYLVfb9N
 vFzdiQPrz+CqvAYGIlF8E0diDMD5aRmGdp9KsteBhXPhWmG50lILpZqAGIbEps/rQ0v8wgoH1EEEu
 o8rkWlaxLayTspzbaH+JY7OMV+r0duKcAsTtQocoM1ecgC0MvlIpxL24aHw4gfrswkkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h0cBhYwEtY6qLPhoFwcORqLMa7nlMUnm6cfrAbAlnuc=; b=febPzILAuXizK9GeOW3gU5IsQT
 ngDc4tgjAvjVoRPfdB7oWyoivHmPomHNRzatZ77XQHa2ZpyxymzKXrKkYHbIwxFXFJ44OlHkXnpMS
 LZmLTKljUokcbjioksHmwHZwA6Dkyqo/KYdE1+mg7xkdcAI34krhodZP9kpkLZb4g+C0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqHod-0000rD-1e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:09:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71D18611AD;
 Mon,  7 Jun 2021 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082162;
 bh=KCpfkUtP/KLWCIwsqHPr4YGRNsTt0sXKlK41t8Ie6KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SxVBYw6SgPIMo8CPu0dW6Uh1u0ORksL08KDHDgBxZTBjXXMfUviygJ+UznxpS0S/s
 oAElylpUazdbh7jzX0OtTtRcDbn158Ja0R3sJirEJ/mgXYiDLdpW+ChQGC4z+VEoSP
 AM9TCS8o04XdZNogMTaAk64zZiJc99zS35WWOqjllVnyDuU6k31XJvct3LDsiJvBGw
 cXiOwDMDlTOxNeF2faubf3ISnoXM7IXv8qDm5PPsoIqq/Lh8Vi/5zErAWKVUdaFMBZ
 jX6g/ovwav9OA/lt3Yg3E8JCkGhx1vhHt8ycf+fudvlELlQopmC9+rmWQhnzSoHwwW
 XuBQzwnQB3C7A==
Date: Mon, 7 Jun 2021 09:09:22 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210607160922.GA2945763@locust>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-3-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607145236.31852-3-jack@suse.cz>
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
X-Headers-End: 1lqHod-0000rD-1e
Subject: Re: [f2fs-dev] [PATCH 03/14] mm: Protect operations adding pages to
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 07, 2021 at 04:52:13PM +0200, Jan Kara wrote:
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
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  Documentation/filesystems/locking.rst | 64 ++++++++++++++++++--------
>  fs/inode.c                            |  2 +
>  include/linux/fs.h                    | 33 ++++++++++++++
>  mm/filemap.c                          | 65 ++++++++++++++++++++++-----
>  mm/readahead.c                        |  2 +
>  mm/rmap.c                             | 37 +++++++--------
>  mm/truncate.c                         |  3 +-
>  7 files changed, 156 insertions(+), 50 deletions(-)
> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 4ed2b22bd0a8..fcb4c0f05050 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -271,19 +271,19 @@ prototypes::
>  locking rules:
>  	All except set_page_dirty and freepage may block
>  
> -======================	======================== =========
> -ops			PageLocked(page)	 i_rwsem
> -======================	======================== =========
> +======================	======================== =========	===============
> +ops			PageLocked(page)	 i_rwsem	invalidate_lock
> +======================	======================== =========	===============
>  writepage:		yes, unlocks (see below)
> -readpage:		yes, unlocks
> +readpage:		yes, unlocks				shared
>  writepages:
>  set_page_dirty		no
> -readahead:		yes, unlocks
> -readpages:		no
> +readahead:		yes, unlocks				shared
> +readpages:		no					shared
>  write_begin:		locks the page		 exclusive
>  write_end:		yes, unlocks		 exclusive
>  bmap:
> -invalidatepage:		yes
> +invalidatepage:		yes					exclusive
>  releasepage:		yes
>  freepage:		yes
>  direct_IO:
> @@ -378,7 +378,10 @@ keep it that way and don't breed new callers.
>  ->invalidatepage() is called when the filesystem must attempt to drop
>  some or all of the buffers from the page when it is being truncated. It
>  returns zero on success. If ->invalidatepage is zero, the kernel uses
> -block_invalidatepage() instead.
> +block_invalidatepage() instead. The filesystem must exclusively acquire
> +invalidate_lock before invalidating page cache in truncate / hole punch path
> +(and thus calling into ->invalidatepage) to block races between page cache
> +invalidation and page cache filling functions (fault, read, ...).
>  
>  ->releasepage() is called when the kernel is about to try to drop the
>  buffers from the page in preparation for freeing it.  It returns zero to
> @@ -573,6 +576,27 @@ in sys_read() and friends.
>  the lease within the individual filesystem to record the result of the
>  operation
>  
> +->fallocate implementation must be really careful to maintain page cache
> +consistency when punching holes or performing other operations that invalidate
> +page cache contents. Usually the filesystem needs to call
> +truncate_inode_pages_range() to invalidate relevant range of the page cache.
> +However the filesystem usually also needs to update its internal (and on disk)
> +view of file offset -> disk block mapping. Until this update is finished, the
> +filesystem needs to block page faults and reads from reloading now-stale page
> +cache contents from the disk. VFS provides mapping->invalidate_lock for this
> +and acquires it in shared mode in paths loading pages from disk
> +(filemap_fault(), filemap_read(), readahead paths). The filesystem is
> +responsible for taking this lock in its fallocate implementation and generally
> +whenever the page cache contents needs to be invalidated because a block is
> +moving from under a page.

Having a page cache invalidation lock isn't optional anymore, so I think
these last two sentences could be condensed:

"...from reloading now-stale page cache contents from disk.  Since VFS
acquires mapping->invalidate_lock in shared mode when loading pages from
disk (filemap_fault(), filemap_read(), readahead), the fallocate
implementation must take the invalidate_lock to prevent reloading."

> +
> +->copy_file_range and ->remap_file_range implementations need to serialize
> +against modifications of file data while the operation is running. For
> +blocking changes through write(2) and similar operations inode->i_rwsem can be
> +used. For blocking changes through memory mapping, the filesystem can use
> +mapping->invalidate_lock provided it also acquires it in its ->page_mkwrite
> +implementation.

Following the same line of reasoning, if taking the invalidate_lock is
no longer optional, then the conditional language in this last sentence
is incorrect.  How about:

"To block changes to file contents via a memory mapping during the
operation, the filesystem must take mapping->invalidate_lock to
coordinate with ->page_mkwrite."

The code changes look fine to me, though I'm no mm expert. ;)

--D

> +
>  dquot_operations
>  ================
>  
> @@ -630,11 +654,11 @@ pfn_mkwrite:	yes
>  access:		yes
>  =============	=========	===========================
>  
> -->fault() is called when a previously not present pte is about
> -to be faulted in. The filesystem must find and return the page associated
> -with the passed in "pgoff" in the vm_fault structure. If it is possible that
> -the page may be truncated and/or invalidated, then the filesystem must lock
> -the page, then ensure it is not already truncated (the page lock will block
> +->fault() is called when a previously not present pte is about to be faulted
> +in. The filesystem must find and return the page associated with the passed in
> +"pgoff" in the vm_fault structure. If it is possible that the page may be
> +truncated and/or invalidated, then the filesystem must lock invalidate_lock,
> +then ensure the page is not already truncated (invalidate_lock will block
>  subsequent truncate), and then return with VM_FAULT_LOCKED, and the page
>  locked. The VM will unlock the page.
>  
> @@ -647,12 +671,14 @@ page table entry. Pointer to entry associated with the page is passed in
>  "pte" field in vm_fault structure. Pointers to entries for other offsets
>  should be calculated relative to "pte".
>  
> -->page_mkwrite() is called when a previously read-only pte is
> -about to become writeable. The filesystem again must ensure that there are
> -no truncate/invalidate races, and then return with the page locked. If
> -the page has been truncated, the filesystem should not look up a new page
> -like the ->fault() handler, but simply return with VM_FAULT_NOPAGE, which
> -will cause the VM to retry the fault.
> +->page_mkwrite() is called when a previously read-only pte is about to become
> +writeable. The filesystem again must ensure that there are no
> +truncate/invalidate races or races with operations such as ->remap_file_range
> +or ->copy_file_range, and then return with the page locked. Usually
> +mapping->invalidate_lock is suitable for proper serialization. If the page has
> +been truncated, the filesystem should not look up a new page like the ->fault()
> +handler, but simply return with VM_FAULT_NOPAGE, which will cause the VM to
> +retry the fault.
>  
>  ->pfn_mkwrite() is the same as page_mkwrite but when the pte is
>  VM_PFNMAP or VM_MIXEDMAP with a page-less entry. Expected return is
> diff --git a/fs/inode.c b/fs/inode.c
> index c93500d84264..84c528cd1955 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -190,6 +190,8 @@ int inode_init_always(struct super_block *sb, struct inode *inode)
>  	mapping_set_gfp_mask(mapping, GFP_HIGHUSER_MOVABLE);
>  	mapping->private_data = NULL;
>  	mapping->writeback_index = 0;
> +	__init_rwsem(&mapping->invalidate_lock, "mapping.invalidate_lock",
> +		     &sb->s_type->invalidate_lock_key);
>  	inode->i_private = NULL;
>  	inode->i_mapping = mapping;
>  	INIT_HLIST_HEAD(&inode->i_dentry);	/* buggered by rcu freeing */
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index c3c88fdb9b2a..d8afbc9661d7 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -436,6 +436,10 @@ int pagecache_write_end(struct file *, struct address_space *mapping,
>   * struct address_space - Contents of a cacheable, mappable object.
>   * @host: Owner, either the inode or the block_device.
>   * @i_pages: Cached pages.
> + * @invalidate_lock: Guards coherency between page cache contents and
> + *   file offset->disk block mappings in the filesystem during invalidates.
> + *   It is also used to block modification of page cache contents through
> + *   memory mappings.
>   * @gfp_mask: Memory allocation flags to use for allocating pages.
>   * @i_mmap_writable: Number of VM_SHARED mappings.
>   * @nr_thps: Number of THPs in the pagecache (non-shmem only).
> @@ -453,6 +457,7 @@ int pagecache_write_end(struct file *, struct address_space *mapping,
>  struct address_space {
>  	struct inode		*host;
>  	struct xarray		i_pages;
> +	struct rw_semaphore	invalidate_lock;
>  	gfp_t			gfp_mask;
>  	atomic_t		i_mmap_writable;
>  #ifdef CONFIG_READ_ONLY_THP_FOR_FS
> @@ -814,6 +819,33 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
>  	down_read_nested(&inode->i_rwsem, subclass);
>  }
>  
> +static inline void filemap_invalidate_lock(struct address_space *mapping)
> +{
> +	down_write(&mapping->invalidate_lock);
> +}
> +
> +static inline void filemap_invalidate_unlock(struct address_space *mapping)
> +{
> +	up_write(&mapping->invalidate_lock);
> +}
> +
> +static inline void filemap_invalidate_lock_shared(struct address_space *mapping)
> +{
> +	down_read(&mapping->invalidate_lock);
> +}
> +
> +static inline int filemap_invalidate_trylock_shared(
> +					struct address_space *mapping)
> +{
> +	return down_read_trylock(&mapping->invalidate_lock);
> +}
> +
> +static inline void filemap_invalidate_unlock_shared(
> +					struct address_space *mapping)
> +{
> +	up_read(&mapping->invalidate_lock);
> +}
> +
>  void lock_two_nondirectories(struct inode *, struct inode*);
>  void unlock_two_nondirectories(struct inode *, struct inode*);
>  
> @@ -2488,6 +2520,7 @@ struct file_system_type {
>  
>  	struct lock_class_key i_lock_key;
>  	struct lock_class_key i_mutex_key;
> +	struct lock_class_key invalidate_lock_key;
>  	struct lock_class_key i_mutex_dir_key;
>  };
>  
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ba1068a1837f..c8e7e451d81e 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -77,7 +77,8 @@
>   *        ->i_pages lock
>   *
>   *  ->i_rwsem
> - *    ->i_mmap_rwsem		(truncate->unmap_mapping_range)
> + *    ->invalidate_lock		(acquired by fs in truncate path)
> + *      ->i_mmap_rwsem		(truncate->unmap_mapping_range)
>   *
>   *  ->mmap_lock
>   *    ->i_mmap_rwsem
> @@ -85,7 +86,8 @@
>   *        ->i_pages lock	(arch-dependent flush_dcache_mmap_lock)
>   *
>   *  ->mmap_lock
> - *    ->lock_page		(access_process_vm)
> + *    ->invalidate_lock		(filemap_fault)
> + *      ->lock_page		(filemap_fault, access_process_vm)
>   *
>   *  ->i_rwsem			(generic_perform_write)
>   *    ->mmap_lock		(fault_in_pages_readable->do_page_fault)
> @@ -2368,20 +2370,30 @@ static int filemap_update_page(struct kiocb *iocb,
>  {
>  	int error;
>  
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!filemap_invalidate_trylock_shared(mapping))
> +			return -EAGAIN;
> +	} else {
> +		filemap_invalidate_lock_shared(mapping);
> +	}
> +
>  	if (!trylock_page(page)) {
> +		error = -EAGAIN;
>  		if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_NOIO))
> -			return -EAGAIN;
> +			goto unlock_mapping;
>  		if (!(iocb->ki_flags & IOCB_WAITQ)) {
> +			filemap_invalidate_unlock_shared(mapping);
>  			put_and_wait_on_page_locked(page, TASK_KILLABLE);
>  			return AOP_TRUNCATED_PAGE;
>  		}
>  		error = __lock_page_async(page, iocb->ki_waitq);
>  		if (error)
> -			return error;
> +			goto unlock_mapping;
>  	}
>  
> +	error = AOP_TRUNCATED_PAGE;
>  	if (!page->mapping)
> -		goto truncated;
> +		goto unlock;
>  
>  	error = 0;
>  	if (filemap_range_uptodate(mapping, iocb->ki_pos, iter, page))
> @@ -2392,15 +2404,13 @@ static int filemap_update_page(struct kiocb *iocb,
>  		goto unlock;
>  
>  	error = filemap_read_page(iocb->ki_filp, mapping, page);
> -	if (error == AOP_TRUNCATED_PAGE)
> -		put_page(page);
> -	return error;
> -truncated:
> -	unlock_page(page);
> -	put_page(page);
> -	return AOP_TRUNCATED_PAGE;
> +	goto unlock_mapping;
>  unlock:
>  	unlock_page(page);
> +unlock_mapping:
> +	filemap_invalidate_unlock_shared(mapping);
> +	if (error == AOP_TRUNCATED_PAGE)
> +		put_page(page);
>  	return error;
>  }
>  
> @@ -2415,6 +2425,19 @@ static int filemap_create_page(struct file *file,
>  	if (!page)
>  		return -ENOMEM;
>  
> +	/*
> +	 * Protect against truncate / hole punch. Grabbing invalidate_lock here
> +	 * assures we cannot instantiate and bring uptodate new pagecache pages
> +	 * after evicting page cache during truncate and before actually
> +	 * freeing blocks.  Note that we could release invalidate_lock after
> +	 * inserting the page into page cache as the locked page would then be
> +	 * enough to synchronize with hole punching. But there are code paths
> +	 * such as filemap_update_page() filling in partially uptodate pages or
> +	 * ->readpages() that need to hold invalidate_lock while mapping blocks
> +	 * for IO so let's hold the lock here as well to keep locking rules
> +	 * simple.
> +	 */
> +	filemap_invalidate_lock_shared(mapping);
>  	error = add_to_page_cache_lru(page, mapping, index,
>  			mapping_gfp_constraint(mapping, GFP_KERNEL));
>  	if (error == -EEXIST)
> @@ -2426,9 +2449,11 @@ static int filemap_create_page(struct file *file,
>  	if (error)
>  		goto error;
>  
> +	filemap_invalidate_unlock_shared(mapping);
>  	pagevec_add(pvec, page);
>  	return 0;
>  error:
> +	filemap_invalidate_unlock_shared(mapping);
>  	put_page(page);
>  	return error;
>  }
> @@ -2988,6 +3013,13 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  		count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
>  		ret = VM_FAULT_MAJOR;
>  		fpin = do_sync_mmap_readahead(vmf);
> +	}
> +
> +	/*
> +	 * See comment in filemap_create_page() why we need invalidate_lock
> +	 */
> +	filemap_invalidate_lock_shared(mapping);
> +	if (!page) {
>  retry_find:
>  		page = pagecache_get_page(mapping, offset,
>  					  FGP_CREAT|FGP_FOR_MMAP,
> @@ -2995,6 +3027,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  		if (!page) {
>  			if (fpin)
>  				goto out_retry;
> +			filemap_invalidate_unlock_shared(mapping);
>  			return VM_FAULT_OOM;
>  		}
>  	}
> @@ -3035,9 +3068,11 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  	if (unlikely(offset >= max_off)) {
>  		unlock_page(page);
>  		put_page(page);
> +		filemap_invalidate_unlock_shared(mapping);
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> +	filemap_invalidate_unlock_shared(mapping);
>  	vmf->page = page;
>  	return ret | VM_FAULT_LOCKED;
>  
> @@ -3056,6 +3091,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  
>  	if (!error || error == AOP_TRUNCATED_PAGE)
>  		goto retry_find;
> +	filemap_invalidate_unlock_shared(mapping);
>  
>  	return VM_FAULT_SIGBUS;
>  
> @@ -3067,6 +3103,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  	 */
>  	if (page)
>  		put_page(page);
> +	filemap_invalidate_unlock_shared(mapping);
>  	if (fpin)
>  		fput(fpin);
>  	return ret | VM_FAULT_RETRY;
> @@ -3437,6 +3474,8 @@ static struct page *do_read_cache_page(struct address_space *mapping,
>   *
>   * If the page does not get brought uptodate, return -EIO.
>   *
> + * The function expects mapping->invalidate_lock to be already held.
> + *
>   * Return: up to date page on success, ERR_PTR() on failure.
>   */
>  struct page *read_cache_page(struct address_space *mapping,
> @@ -3460,6 +3499,8 @@ EXPORT_SYMBOL(read_cache_page);
>   *
>   * If the page does not get brought uptodate, return -EIO.
>   *
> + * The function expects mapping->invalidate_lock to be already held.
> + *
>   * Return: up to date page on success, ERR_PTR() on failure.
>   */
>  struct page *read_cache_page_gfp(struct address_space *mapping,
> diff --git a/mm/readahead.c b/mm/readahead.c
> index d589f147f4c2..41b75d76d36e 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -192,6 +192,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
>  	 */
>  	unsigned int nofs = memalloc_nofs_save();
>  
> +	filemap_invalidate_lock_shared(mapping);
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
> @@ -236,6 +237,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
>  	 * will then handle the error.
>  	 */
>  	read_pages(ractl, &page_pool, false);
> +	filemap_invalidate_unlock_shared(mapping);
>  	memalloc_nofs_restore(nofs);
>  }
>  EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a35cbbbded0d..76d33c3b8ae6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -22,24 +22,25 @@
>   *
>   * inode->i_rwsem	(while writing or truncating, not reading or faulting)
>   *   mm->mmap_lock
> - *     page->flags PG_locked (lock_page)   * (see hugetlbfs below)
> - *       hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
> - *         mapping->i_mmap_rwsem
> - *           hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
> - *           anon_vma->rwsem
> - *             mm->page_table_lock or pte_lock
> - *               swap_lock (in swap_duplicate, swap_info_get)
> - *                 mmlist_lock (in mmput, drain_mmlist and others)
> - *                 mapping->private_lock (in __set_page_dirty_buffers)
> - *                   lock_page_memcg move_lock (in __set_page_dirty_buffers)
> - *                     i_pages lock (widely used)
> - *                       lruvec->lru_lock (in lock_page_lruvec_irq)
> - *                 inode->i_lock (in set_page_dirty's __mark_inode_dirty)
> - *                 bdi.wb->list_lock (in set_page_dirty's __mark_inode_dirty)
> - *                   sb_lock (within inode_lock in fs/fs-writeback.c)
> - *                   i_pages lock (widely used, in set_page_dirty,
> - *                             in arch-dependent flush_dcache_mmap_lock,
> - *                             within bdi.wb->list_lock in __sync_single_inode)
> + *     mapping->invalidate_lock (in filemap_fault)
> + *       page->flags PG_locked (lock_page)   * (see hugetlbfs below)
> + *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
> + *           mapping->i_mmap_rwsem
> + *             hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
> + *             anon_vma->rwsem
> + *               mm->page_table_lock or pte_lock
> + *                 swap_lock (in swap_duplicate, swap_info_get)
> + *                   mmlist_lock (in mmput, drain_mmlist and others)
> + *                   mapping->private_lock (in __set_page_dirty_buffers)
> + *                     lock_page_memcg move_lock (in __set_page_dirty_buffers)
> + *                       i_pages lock (widely used)
> + *                         lruvec->lru_lock (in lock_page_lruvec_irq)
> + *                   inode->i_lock (in set_page_dirty's __mark_inode_dirty)
> + *                   bdi.wb->list_lock (in set_page_dirty's __mark_inode_dirty)
> + *                     sb_lock (within inode_lock in fs/fs-writeback.c)
> + *                     i_pages lock (widely used, in set_page_dirty,
> + *                               in arch-dependent flush_dcache_mmap_lock,
> + *                               within bdi.wb->list_lock in __sync_single_inode)
>   *
>   * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs_anon)
>   *   ->tasklist_lock
> diff --git a/mm/truncate.c b/mm/truncate.c
> index 57a618c4a0d6..d0cc6588aba2 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -415,7 +415,8 @@ EXPORT_SYMBOL(truncate_inode_pages_range);
>   * @mapping: mapping to truncate
>   * @lstart: offset from which to truncate
>   *
> - * Called under (and serialised by) inode->i_rwsem.
> + * Called under (and serialised by) inode->i_rwsem and
> + * mapping->invalidate_lock.
>   *
>   * Note: When this function returns, there can be a page in the process of
>   * deletion (inside __delete_from_page_cache()) in the specified range.  Thus
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54E4F899
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoYp-0007BH-Ig; Sat, 22 Jun 2019 22:32:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heoYn-0007B4-30
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4fwwhhN3YNTageVzGIEJd1TPgElM9iCgBeBA2fJ4z0=; b=Uq2pgjK5W5yCB5Bv60CykPy4Nl
 mTyvm6KfTHlLn7TuqK9cjDnuZgcJFkCmobtCKi2nyvrxac/Vm350PtfYmeP3OTbNQUr2hjzsOjTT0
 gEBkwyadgOQ+Y4DpgjSho6ebVOS1rUbkrbl923HA+Q3UMJe34JwwcW3HYS1Pg7mV7ga0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g4fwwhhN3YNTageVzGIEJd1TPgElM9iCgBeBA2fJ4z0=; b=D0pzqsWFNK/p9gb8MYP7FDRboS
 LJ2ka6d2oovP9tQtcvyGsZPW0m2DhAl0BQnXORYbNAiWqsT9eEjURZKCtgdqVsu3QHmMASFzFcPL5
 5McF0pDT2gaTmucatU5Q6wy/SBCmeL+lL2rQsWfwr2Iq7Sbazd8YpUcKrcieMsotadek=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoYp-009zwd-UM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:32:41 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26248205C9;
 Sat, 22 Jun 2019 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561242754;
 bh=9s93nY2rykrubdMbJqhfsY1FSdqqVwaFUkXeoIBTBps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGjrthm1LCvkBx7zV5wBoqz3wY31zfwEt2kygEq0USQQ0Ql3xTL9X7war2QO59lT8
 quUcDOmresP4qrAYBvB14RkTlfXcow/ufJwFKAc5FxJTpf+hh9zqzAGsxqnKhyr6Wj
 XN5haQ5C1En8Qmm1y+/B1fmdy4AWlqNYKfSVO+iw=
Date: Sat, 22 Jun 2019 15:32:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622223233.GI19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-10-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-10-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1heoYp-009zwd-UM
Subject: Re: [f2fs-dev] [PATCH v5 09/16] fs-verity: add data verification
 hooks for ->readpages()
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/20, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add functions that verify data pages that have been read from a
> fs-verity file, against that file's Merkle tree.  These will be called
> from filesystems' ->readpage() and ->readpages() methods.
> 
> Since data verification can block, a workqueue is provided for these
> methods to enqueue verification work from their bio completion callback.
> 
> See the "Verifying data" section of
> Documentation/filesystems/fsverity.rst for more information.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/Makefile           |   3 +-
>  fs/verity/fsverity_private.h |   5 +
>  fs/verity/init.c             |   8 +
>  fs/verity/open.c             |   6 +
>  fs/verity/verify.c           | 275 +++++++++++++++++++++++++++++++++++
>  include/linux/fsverity.h     |  56 +++++++
>  6 files changed, 352 insertions(+), 1 deletion(-)
>  create mode 100644 fs/verity/verify.c
> 
> diff --git a/fs/verity/Makefile b/fs/verity/Makefile
> index e6a8951c493a5e..7fa628cd5eba24 100644
> --- a/fs/verity/Makefile
> +++ b/fs/verity/Makefile
> @@ -2,4 +2,5 @@
>  
>  obj-$(CONFIG_FS_VERITY) += hash_algs.o \
>  			   init.o \
> -			   open.o
> +			   open.o \
> +			   verify.o
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index c79746ff335e14..eaa2b3b93bbf6b 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -134,5 +134,10 @@ void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
>  void fsverity_free_info(struct fsverity_info *vi);
>  
>  int __init fsverity_init_info_cache(void);
> +void __init fsverity_exit_info_cache(void);
> +
> +/* verify.c */
> +
> +int __init fsverity_init_workqueue(void);
>  
>  #endif /* _FSVERITY_PRIVATE_H */
> diff --git a/fs/verity/init.c b/fs/verity/init.c
> index fff1fd6343357d..b593805aafcc89 100644
> --- a/fs/verity/init.c
> +++ b/fs/verity/init.c
> @@ -41,7 +41,15 @@ static int __init fsverity_init(void)
>  	if (err)
>  		return err;
>  
> +	err = fsverity_init_workqueue();
> +	if (err)
> +		goto err_exit_info_cache;
> +
>  	pr_debug("Initialized fs-verity\n");
>  	return 0;
> +
> +err_exit_info_cache:
> +	fsverity_exit_info_cache();
> +	return err;
>  }
>  late_initcall(fsverity_init)
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 21ae0ef254a695..7a2cd000dc4f06 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -338,3 +338,9 @@ int __init fsverity_init_info_cache(void)
>  		return -ENOMEM;
>  	return 0;
>  }
> +
> +void __init fsverity_exit_info_cache(void)
> +{
> +	kmem_cache_destroy(fsverity_info_cachep);
> +	fsverity_info_cachep = NULL;
> +}
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> new file mode 100644
> index 00000000000000..2a0f9e2ebc9f16
> --- /dev/null
> +++ b/fs/verity/verify.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * fs/verity/verify.c: data verification functions, i.e. hooks for ->readpages()
> + *
> + * Copyright 2019 Google LLC
> + */
> +
> +#include "fsverity_private.h"
> +
> +#include <crypto/hash.h>
> +#include <linux/bio.h>
> +#include <linux/ratelimit.h>
> +
> +static struct workqueue_struct *fsverity_read_workqueue;
> +
> +/**
> + * hash_at_level() - compute the location of the block's hash at the given level
> + *
> + * @params:	(in) the Merkle tree parameters
> + * @dindex:	(in) the index of the data block being verified
> + * @level:	(in) the level of hash we want (0 is leaf level)
> + * @hindex:	(out) the index of the hash block containing the wanted hash
> + * @hoffset:	(out) the byte offset to the wanted hash within the hash block
> + */
> +static void hash_at_level(const struct merkle_tree_params *params,
> +			  pgoff_t dindex, unsigned int level, pgoff_t *hindex,
> +			  unsigned int *hoffset)
> +{
> +	pgoff_t position;
> +
> +	/* Offset of the hash within the level's region, in hashes */
> +	position = dindex >> (level * params->log_arity);
> +
> +	/* Index of the hash block in the tree overall */
> +	*hindex = params->level_start[level] + (position >> params->log_arity);
> +
> +	/* Offset of the wanted hash (in bytes) within the hash block */
> +	*hoffset = (position & ((1 << params->log_arity) - 1)) <<
> +		   (params->log_blocksize - params->log_arity);
> +}
> +
> +/* Extract a hash from a hash page */
> +static void extract_hash(struct page *hpage, unsigned int hoffset,
> +			 unsigned int hsize, u8 *out)
> +{
> +	void *virt = kmap_atomic(hpage);
> +
> +	memcpy(out, virt + hoffset, hsize);
> +	kunmap_atomic(virt);
> +}
> +
> +static inline int cmp_hashes(const struct fsverity_info *vi,
> +			     const u8 *want_hash, const u8 *real_hash,
> +			     pgoff_t index, int level)
> +{
> +	const unsigned int hsize = vi->tree_params.digest_size;
> +
> +	if (memcmp(want_hash, real_hash, hsize) == 0)
> +		return 0;
> +
> +	fsverity_err(vi->inode,
> +		     "FILE CORRUPTED! index=%lu, level=%d, want_hash=%s:%*phN, real_hash=%s:%*phN",
> +		     index, level,
> +		     vi->tree_params.hash_alg->name, hsize, want_hash,
> +		     vi->tree_params.hash_alg->name, hsize, real_hash);
> +	return -EBADMSG;
> +}
> +
> +/*
> + * Verify a single data page against the file's Merkle tree.
> + *
> + * In principle, we need to verify the entire path to the root node.  However,
> + * for efficiency the filesystem may cache the hash pages.  Therefore we need
> + * only ascend the tree until an already-verified page is seen, as indicated by
> + * the PageChecked bit being set; then verify the path to that page.
> + *
> + * This code currently only supports the case where the verity block size is
> + * equal to PAGE_SIZE.  Doing otherwise would be possible but tricky, since we
> + * wouldn't be able to use the PageChecked bit.
> + *
> + * Note that multiple processes may race to verify a hash page and mark it
> + * Checked, but it doesn't matter; the result will be the same either way.
> + *
> + * Return: true if the page is valid, else false.
> + */
> +static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
> +			struct ahash_request *req, struct page *data_page)
> +{
> +	const struct merkle_tree_params *params = &vi->tree_params;
> +	const unsigned int hsize = params->digest_size;
> +	const pgoff_t index = data_page->index;
> +	int level;
> +	u8 _want_hash[FS_VERITY_MAX_DIGEST_SIZE];
> +	const u8 *want_hash;
> +	u8 real_hash[FS_VERITY_MAX_DIGEST_SIZE];
> +	struct page *hpages[FS_VERITY_MAX_LEVELS];
> +	unsigned int hoffsets[FS_VERITY_MAX_LEVELS];
> +	int err;
> +
> +	if (WARN_ON_ONCE(!PageLocked(data_page) || PageUptodate(data_page)))
> +		return false;
> +
> +	pr_debug_ratelimited("Verifying data page %lu...\n", index);
> +
> +	/*
> +	 * Starting at the leaf level, ascend the tree saving hash pages along
> +	 * the way until we find a verified hash page, indicated by PageChecked;
> +	 * or until we reach the root.
> +	 */
> +	for (level = 0; level < params->num_levels; level++) {
> +		pgoff_t hindex;
> +		unsigned int hoffset;
> +		struct page *hpage;
> +
> +		hash_at_level(params, index, level, &hindex, &hoffset);
> +
> +		pr_debug_ratelimited("Level %d: hindex=%lu, hoffset=%u\n",
> +				     level, hindex, hoffset);
> +
> +		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
> +								  hindex);
> +		if (IS_ERR(hpage)) {
> +			err = PTR_ERR(hpage);
> +			fsverity_err(inode,
> +				     "Error %d reading Merkle tree page %lu",
> +				     err, hindex);
> +			goto out;
> +		}
> +
> +		if (PageChecked(hpage)) {
> +			extract_hash(hpage, hoffset, hsize, _want_hash);
> +			want_hash = _want_hash;
> +			put_page(hpage);
> +			pr_debug_ratelimited("Hash page already checked, want %s:%*phN\n",
> +					     params->hash_alg->name,
> +					     hsize, want_hash);
> +			goto descend;
> +		}
> +		pr_debug_ratelimited("Hash page not yet checked\n");
> +		hpages[level] = hpage;
> +		hoffsets[level] = hoffset;
> +	}
> +
> +	want_hash = vi->root_hash;
> +	pr_debug("Want root hash: %s:%*phN\n",
> +		 params->hash_alg->name, hsize, want_hash);
> +descend:
> +	/* Descend the tree verifying hash pages */
> +	for (; level > 0; level--) {
> +		struct page *hpage = hpages[level - 1];
> +		unsigned int hoffset = hoffsets[level - 1];
> +
> +		err = fsverity_hash_page(params, inode, req, hpage, real_hash);
> +		if (err)
> +			goto out;
> +		err = cmp_hashes(vi, want_hash, real_hash, index, level - 1);
> +		if (err)
> +			goto out;
> +		SetPageChecked(hpage);
> +		extract_hash(hpage, hoffset, hsize, _want_hash);
> +		want_hash = _want_hash;
> +		put_page(hpage);
> +		pr_debug("Verified hash page at level %d, now want %s:%*phN\n",
> +			 level - 1, params->hash_alg->name, hsize, want_hash);
> +	}
> +
> +	/* Finally, verify the data page */
> +	err = fsverity_hash_page(params, inode, req, data_page, real_hash);
> +	if (err)
> +		goto out;
> +	err = cmp_hashes(vi, want_hash, real_hash, index, -1);
> +out:
> +	for (; level > 0; level--)
> +		put_page(hpages[level - 1]);
> +
> +	return err == 0;
> +}
> +
> +/**
> + * fsverity_verify_page - verify a data page
> + *
> + * Verify a page that has just been read from a verity file.  The page must be a
> + * pagecache page that is still locked and not yet uptodate.
> + *
> + * Return: true if the page is valid, else false.
> + */
> +bool fsverity_verify_page(struct page *page)
> +{
> +	struct inode *inode = page->mapping->host;
> +	const struct fsverity_info *vi = inode->i_verity_info;
> +	struct ahash_request *req;
> +	bool valid;
> +
> +	req = ahash_request_alloc(vi->tree_params.hash_alg->tfm, GFP_NOFS);
> +	if (unlikely(!req))
> +		return false;
> +
> +	valid = verify_page(inode, vi, req, page);
> +
> +	ahash_request_free(req);
> +
> +	return valid;
> +}
> +EXPORT_SYMBOL_GPL(fsverity_verify_page);
> +
> +#ifdef CONFIG_BLOCK
> +/**
> + * fsverity_verify_bio - verify a 'read' bio that has just completed
> + *
> + * Verify a set of pages that have just been read from a verity file.  The pages
> + * must be pagecache pages that are still locked and not yet uptodate.  Pages
> + * that fail verification are set to the Error state.  Verification is skipped
> + * for pages already in the Error state, e.g. due to fscrypt decryption failure.
> + *
> + * This is a helper function for use by the ->readpages() method of filesystems
> + * that issue bios to read data directly into the page cache.  Filesystems that
> + * populate the page cache without issuing bios (e.g. non block-based
> + * filesystems) must instead call fsverity_verify_page() directly on each page.
> + * All filesystems must also call fsverity_verify_page() on holes.
> + */
> +void fsverity_verify_bio(struct bio *bio)
> +{
> +	struct inode *inode = bio_first_page_all(bio)->mapping->host;
> +	const struct fsverity_info *vi = inode->i_verity_info;
> +	struct ahash_request *req;
> +	struct bio_vec *bv;
> +	struct bvec_iter_all iter_all;
> +
> +	req = ahash_request_alloc(vi->tree_params.hash_alg->tfm, GFP_NOFS);
> +	if (unlikely(!req)) {
> +		bio_for_each_segment_all(bv, bio, iter_all)
> +			SetPageError(bv->bv_page);
> +		return;
> +	}
> +
> +	bio_for_each_segment_all(bv, bio, iter_all) {
> +		struct page *page = bv->bv_page;
> +
> +		if (!PageError(page) && !verify_page(inode, vi, req, page))
> +			SetPageError(page);
> +	}
> +
> +	ahash_request_free(req);
> +}
> +EXPORT_SYMBOL_GPL(fsverity_verify_bio);
> +#endif /* CONFIG_BLOCK */
> +
> +/**
> + * fsverity_enqueue_verify_work - enqueue work on the fs-verity workqueue
> + *
> + * Enqueue verification work for asynchronous processing.
> + */
> +void fsverity_enqueue_verify_work(struct work_struct *work)
> +{
> +	queue_work(fsverity_read_workqueue, work);
> +}
> +EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
> +
> +int __init fsverity_init_workqueue(void)
> +{
> +	/*
> +	 * Use an unbound workqueue to allow bios to be verified in parallel
> +	 * even when they happen to complete on the same CPU.  This sacrifices
> +	 * locality, but it's worthwhile since hashing is CPU-intensive.
> +	 *
> +	 * Also use a high-priority workqueue to prioritize verification work,
> +	 * which blocks reads from completing, over regular application tasks.
> +	 */
> +	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> +						  WQ_UNBOUND | WQ_HIGHPRI,
> +						  num_online_cpus());
> +	if (!fsverity_read_workqueue)
> +		return -ENOMEM;
> +	return 0;
> +}
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index cbcc358d073652..ecd47e748c7f64 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -33,6 +33,23 @@ struct fsverity_operations {
>  	 */
>  	int (*get_verity_descriptor)(struct inode *inode, void *buf,
>  				     size_t bufsize);
> +
> +	/**
> +	 * Read a Merkle tree page of the given inode.
> +	 *
> +	 * @inode: the inode
> +	 * @index: 0-based index of the page within the Merkle tree
> +	 *
> +	 * This can be called at any time on an open verity file, as well as
> +	 * between ->begin_enable_verity() and ->end_enable_verity().  It may be
> +	 * called by multiple processes concurrently, even with the same page.
> +	 *
> +	 * Note that this must retrieve a *page*, not necessarily a *block*.
> +	 *
> +	 * Return: the page on success, ERR_PTR() on failure
> +	 */
> +	struct page *(*read_merkle_tree_page)(struct inode *inode,
> +					      pgoff_t index);
>  };
>  
>  #ifdef CONFIG_FS_VERITY
> @@ -49,6 +66,12 @@ extern int fsverity_file_open(struct inode *inode, struct file *filp);
>  extern int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
>  extern void fsverity_cleanup_inode(struct inode *inode);
>  
> +/* verify.c */
> +
> +extern bool fsverity_verify_page(struct page *page);
> +extern void fsverity_verify_bio(struct bio *bio);
> +extern void fsverity_enqueue_verify_work(struct work_struct *work);
> +
>  #else /* !CONFIG_FS_VERITY */
>  
>  static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
> @@ -73,6 +96,39 @@ static inline void fsverity_cleanup_inode(struct inode *inode)
>  {
>  }
>  
> +/* verify.c */
> +
> +static inline bool fsverity_verify_page(struct page *page)
> +{
> +	WARN_ON(1);
> +	return false;
> +}
> +
> +static inline void fsverity_verify_bio(struct bio *bio)
> +{
> +	WARN_ON(1);
> +}
> +
> +static inline void fsverity_enqueue_verify_work(struct work_struct *work)
> +{
> +	WARN_ON(1);
> +}
> +
>  #endif	/* !CONFIG_FS_VERITY */
>  
> +/**
> + * fsverity_active() - do reads from the inode need to go through fs-verity?
> + *
> + * This checks whether ->i_verity_info has been set.
> + *
> + * Filesystems call this from ->readpages() to check whether the pages need to
> + * be verified or not.  Don't use IS_VERITY() for this purpose; it's subject to
> + * a race condition where the file is being read concurrently with
> + * FS_IOC_ENABLE_VERITY completing.  (S_VERITY is set before ->i_verity_info.)
> + */
> +static inline bool fsverity_active(const struct inode *inode)
> +{
> +	return fsverity_get_info(inode) != NULL;
> +}
> +
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

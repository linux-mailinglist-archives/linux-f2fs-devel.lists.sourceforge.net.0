Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216DCB0DB0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 19:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/8KelWTA2KwfyfTFpCn7OMHH+X1dcQPXdrOIUhA+f0=; b=Rtk1QIQsTpZiUWg3x9HNgaaAB+
	U/7SdgZMNyNilaoW9Ym0CjvrEvVskW6YzscrETDoROWXapO2AYFHo6qegC5yDf/+NH3WhKS2BzcTF
	FmWlnJXNlWJsa1pUGIMSQAcnAHunFkyrc9iAcZgBIvRsxP/4tfvKRgsycvSUorx/izFk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vT2bP-0006r8-I5;
	Tue, 09 Dec 2025 18:38:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vT2bN-0006qz-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 18:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=15XzUOqp766d7uNaChR6+1ejMRg2lXXE0I/a1KXdmFk=; b=BvHRf5U8zJw56tu+Zmv3u8DOLD
 q3dlR3MOlovhZmMi+grSb7ZapEXnnkjr6BH7zQJk4Q5SsdTjwWB9WhuKOyqgSahA4i8yN/KkUFCsl
 BE86R0l6+jqRGNVxRa2wSwPZAvGMDe3eqCKZrQCshiPwfklMFo3AAit5VgO7SAnpXTw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=15XzUOqp766d7uNaChR6+1ejMRg2lXXE0I/a1KXdmFk=; b=Ln9Oa95VJ655QPitiFWi7D0osQ
 1hVzYHr+M+eVhy+MalgvMbSQOqgaIFpXVRbgI57kPbYrczUs5Rgrc80F6fVHql94AwBcm2UAXGcF9
 UiQDh3TykqBFP1A8d/GHlvmzwqaQRLaYgloU2r5w69IKmk6kWWxGnTe5J4CFJizbiZxk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vT2bM-0006gu-OS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 18:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D031E60129
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 18:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66050C4CEFB;
 Tue,  9 Dec 2025 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765305494;
 bh=+0T+C6+AFM/FH4BqiQvMQmj8Ipd2z1SYSiDhXeH1zJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgpLU/DZe+dXQrVktNBHuDD8i9EHdcV5XlCKfFNcFEOXnr+t05QGdi7olnog1PmKJ
 mOfQ2+lVFlB7V6Td20JjW51wfLOugZL/dkjzz20SwBbipgHS/ZdZ+o/aq9jIOW+3m8
 MHTNZSKN41VSpIKZQQOTPFbBF07822h16We9daL2cm4VjY3J1HuCiMZOcZaNXdVPxm
 aTE3zV3jhTCo05jRMmfOnc1oFNFl6r7MLUg7k0bNlCW+MnjxfeGGwm+nRrGwB6bNa8
 mYTwSwBN2v3u0VoeCXJ0NE5Bv+RmkLBkZpnTlx282eSQccs+p6oTlQ7nu75q9J7siL
 VIDHwE8eiWDbg==
Date: Tue, 9 Dec 2025 18:38:12 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aThslGwzpYmEXzU5@google.com>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com> <aS4W7NBYFPwP6KEQ@google.com>
 <aS5RG6IQ8AlXrLwT@google.com>
 <0bf2eedd-eebb-440b-96f5-72ac3a68b608@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bf2eedd-eebb-440b-96f5-72ac3a68b608@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/09, Chao Yu wrote: > On 12/2/25 10:38,
 Jaegeuk Kim wrote:
 > > This patch enables large folio for limited case where we can get the
 high-order > > memory allocation. It supports the encrypted and [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vT2bM-0006gu-OS
Subject: Re: [f2fs-dev] [PATCH 1/2 v4] f2fs: support large folio for
 immutable non-compressed case
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/09, Chao Yu wrote:
> On 12/2/25 10:38, Jaegeuk Kim wrote:
> > This patch enables large folio for limited case where we can get the high-order
> > memory allocation. It supports the encrypted and fsverity files, which are
> > essential for Android environment.
> > 
> > How to test:
> > - dd if=/dev/zero of=/mnt/test/test bs=1G count=4
> > - f2fs_io setflags immutable /mnt/test/test
> > - echo 3 > /proc/sys/vm/drop_caches
> >  : to reload inode with large folio
> > - f2fs_io read 32 0 1024 mmap 0 0 /mnt/test/test
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  Change log from v3:
> >   - enhance the doc
> > 
> >  Change log from v2:
> >   - add a doc
> > 
> >  Change log from v1:
> >   - return error when trying open an inode having large folio
> > 
> >  Documentation/filesystems/f2fs.rst |  43 +++++
> >  fs/f2fs/data.c                     | 247 +++++++++++++++++++++++++++--
> >  fs/f2fs/f2fs.h                     |  16 ++
> >  fs/f2fs/file.c                     |   4 +
> >  fs/f2fs/inode.c                    |   6 +-
> >  5 files changed, 306 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > index cb90d1ae82d0..9b3b835a174e 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -1033,3 +1033,46 @@ the reserved space back to F2FS for its own use.
> >  So, the key idea is, user can do any file operations on /dev/vdc, and
> >  reclaim the space after the use, while the space is counted as /data.
> >  That doesn't require modifying partition size and filesystem format.
> > +
> > +Per-file Read-Only Large Folio Support
> > +--------------------------------------
> > +
> > +F2FS implements large folio support on the read path to leverage high-order
> > +page allocation for significant performance gains. To minimize code complexity,
> > +this support is currently excluded from the write path, which requires handling
> > +complex optimizations such as compression and block allocation modes.
> > +
> > +This optional feature is triggered only when a file's immutable bit is set.
> > +Consequently, F2FS will return EOPNOTSUPP if a user attempts to open a cached
> > +file with write permissions, even immediately after clearing the bit. Write
> > +access is only restored once the cached inode is dropped. The usage flow is
> > +demonstrated below:
> > +
> > +.. code-block::
> > +
> > +   # f2fs_io setflags immutable /data/testfile_read_seq
> > +
> > +   /* flush and reload the inode to enable the large folio */
> > +   # sync && echo 3 > /proc/sys/vm/drop_caches
> > +
> > +   /* mmap(MAP_POPULATE) + mlock() */
> > +   # f2fs_io read 128 0 1024 mmap 1 0 /data/testfile_read_seq
> > +
> > +   /* mmap() + fadvise(POSIX_FADV_WILLNEED) + mlock() */
> > +   # f2fs_io read 128 0 1024 fadvise 1 0 /data/testfile_read_seq
> > +
> > +   /* mmap() + mlock2(MLOCK_ONFAULT) + madvise(MADV_POPULATE_READ) */
> > +   # f2fs_io read 128 0 1024 madvise 1 0 /data/testfile_read_seq
> > +
> > +   # f2fs_io clearflags immutable /data/testfile_read_seq
> > +
> > +   # f2fs_io write 1 0 1 zero buffered /data/testfile_read_seq
> > +   Failed to open /mnt/test/test: Operation not supported
> > +
> > +   /* flush and reload the inode to disable the large folio */
> > +   # sync && echo 3 > /proc/sys/vm/drop_caches
> > +
> > +   # f2fs_io write 1 0 1 zero buffered /data/testfile_read_seq
> > +   Written 4096 bytes with pattern = zero, total_time = 29 us, max_latency = 28 us
> > +
> > +   # rm /data/testfile_read_seq
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 48c20386f031..acc4ef511bfb 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -31,9 +31,15 @@
> >  
> >  static struct kmem_cache *bio_post_read_ctx_cache;
> >  static struct kmem_cache *bio_entry_slab;
> > +static struct kmem_cache *ffs_entry_slab;
> >  static mempool_t *bio_post_read_ctx_pool;
> >  static struct bio_set f2fs_bioset;
> >  
> > +struct f2fs_folio_state {
> > +	spinlock_t		state_lock;
> > +	unsigned int		read_pages_pending;
> > +};
> > +
> >  #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
> >  
> >  int __init f2fs_init_bioset(void)
> > @@ -138,11 +144,15 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
> >  {
> >  	struct folio_iter fi;
> >  	struct bio_post_read_ctx *ctx = bio->bi_private;
> > +	unsigned long flags;
> >  
> >  	bio_for_each_folio_all(fi, bio) {
> >  		struct folio *folio = fi.folio;
> > +		unsigned nr_pages = fi.length >> PAGE_SHIFT;
> > +		bool finished = true;
> >  
> > -		if (f2fs_is_compressed_page(folio)) {
> > +		if (!folio_test_large(folio) &&
> > +		    f2fs_is_compressed_page(folio)) {
> >  			if (ctx && !ctx->decompression_attempted)
> >  				f2fs_end_read_compressed_page(folio, true, 0,
> >  							in_task);
> > @@ -156,8 +166,20 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
> >  				bio->bi_status = BLK_STS_IOERR;
> >  		}
> >  
> > -		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
> > -		folio_end_read(folio, bio->bi_status == BLK_STS_OK);
> > +		if (folio_test_large(folio)) {
> > +			struct f2fs_folio_state *ffs = folio->private;
> > +
> > +			spin_lock_irqsave(&ffs->state_lock, flags);
> > +			ffs->read_pages_pending -= nr_pages;
> > +			finished = !ffs->read_pages_pending;
> > +			spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +		}
> > +
> > +		while (nr_pages--)
> > +			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
> > +
> > +		if (finished)
> > +			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
> >  	}
> >  
> >  	if (ctx)
> > @@ -518,6 +540,9 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
> >  void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
> >  				 enum page_type type)
> >  {
> > +	if (!bio)
> > +		return;
> > +
> >  	WARN_ON_ONCE(!is_read_io(bio_op(bio)));
> >  	trace_f2fs_submit_read_bio(sbi->sb, type, bio);
> >  
> > @@ -1209,11 +1234,21 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
> >  	struct dnode_of_data dn;
> >  	struct folio *folio;
> >  	int err;
> > -
> > +retry:
> >  	folio = f2fs_grab_cache_folio(mapping, index, for_write);
> >  	if (IS_ERR(folio))
> >  		return folio;
> >  
> > +	if (folio_test_large(folio)) {
> > +		pgoff_t folio_index = mapping_align_index(mapping, index);
> > +
> > +		f2fs_folio_put(folio, true);
> > +		invalidate_inode_pages2_range(mapping, folio_index,
> > +				folio_index + folio_nr_pages(folio) - 1);
> > +		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> > +		goto retry;
> > +	}
> > +
> >  	if (f2fs_lookup_read_extent_cache_block(inode, index,
> >  						&dn.data_blkaddr)) {
> >  		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
> > @@ -2341,6 +2376,179 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  }
> >  #endif
> >  
> > +static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
> > +{
> > +	struct f2fs_folio_state *ffs = folio->private;
> > +
> > +	if (ffs)
> > +		return ffs;
> > +
> > +	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO, true, NULL);
> > +
> > +	spin_lock_init(&ffs->state_lock);
> > +	folio_attach_private(folio, ffs);
> > +	return ffs;
> > +}
> > +
> > +static void ffs_detach_free(struct folio *folio)
> > +{
> > +	struct f2fs_folio_state *ffs;
> > +
> > +	if (!folio_test_large(folio)) {
> > +		folio_detach_private(folio);
> > +		return;
> > +	}
> > +
> > +	ffs = folio_detach_private(folio);
> > +	if (!ffs)
> > +		return;
> > +
> > +	WARN_ON_ONCE(ffs->read_pages_pending != 0);
> > +	kmem_cache_free(ffs_entry_slab, ffs);
> > +}
> > +
> > +static int f2fs_read_data_large_folio(struct inode *inode,
> > +		struct readahead_control *rac, struct folio *folio)
> > +{
> > +	struct bio *bio = NULL;
> > +	sector_t last_block_in_bio = 0;
> > +	struct f2fs_map_blocks map = {0, };
> > +	pgoff_t index, offset;
> > +	unsigned max_nr_pages = rac ? readahead_count(rac) :
> > +				folio_nr_pages(folio);
> > +	unsigned nrpages;
> > +	struct f2fs_folio_state *ffs;
> > +	int ret = 0;
> > +
> > +	if (!IS_IMMUTABLE(inode))
> > +		return -EOPNOTSUPP;
> > +
> > +	if (f2fs_compressed_file(inode))
> > +		return -EOPNOTSUPP;
> > +
> > +	map.m_seg_type = NO_CHECK_TYPE;
> > +
> > +	if (rac)
> > +		folio = readahead_folio(rac);
> > +next_folio:
> > +	if (!folio)
> > +		goto out;
> > +
> > +	index = folio->index;
> > +	offset = 0;
> > +	ffs = NULL;
> > +	nrpages = folio_nr_pages(folio);
> > +
> > +	for (; nrpages; nrpages--) {
> > +		sector_t block_nr;
> > +		/*
> > +		 * Map blocks using the previous result first.
> > +		 */
> > +		if ((map.m_flags & F2FS_MAP_MAPPED) &&
> > +				index > map.m_lblk &&
> > +				index < (map.m_lblk + map.m_len))
> > +			goto got_it;
> > +
> > +		/*
> > +		 * Then do more f2fs_map_blocks() calls until we are
> > +		 * done with this page.
> > +		 */
> > +		memset(&map, 0, sizeof(map));
> > +		map.m_seg_type = NO_CHECK_TYPE;
> > +		map.m_lblk = index;
> > +		map.m_len = max_nr_pages;
> > +
> > +		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
> > +		if (ret)
> > +			goto err_out;
> > +got_it:
> > +		if ((map.m_flags & F2FS_MAP_MAPPED)) {
> > +			block_nr = map.m_pblk + index - map.m_lblk;
> > +			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> > +						DATA_GENERIC_ENHANCE_READ)) {
> > +				ret = -EFSCORRUPTED;
> > +				goto err_out;
> > +			}
> > +		} else {
> > +			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
> > +			if (f2fs_need_verity(inode, index) &&
> > +			    !fsverity_verify_page(folio_file_page(folio,
> > +								index))) {
> > +				ret = -EIO;
> > +				goto err_out;
> > +			}
> > +			continue;
> > +		}
> > +
> > +		/*
> > +		 * This page will go to BIO.  Do we need to send this
> > +		 * BIO off first?
> > +		 */
> > +		if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
> > +						last_block_in_bio, block_nr) ||
> > +			!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
> > +submit_and_realloc:
> > +			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> > +			bio = NULL;
> > +		}
> > +		if (bio == NULL)
> > +			bio = f2fs_grab_read_bio(inode, block_nr,
> > +					max_nr_pages,
> > +					f2fs_ra_op_flags(rac),
> > +					index, false);
> > +
> > +		/*
> > +		 * If the page is under writeback, we need to wait for
> > +		 * its completion to see the correct decrypted data.
> > +		 */
> > +		f2fs_wait_on_block_writeback(inode, block_nr);
> > +
> > +		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
> > +					offset << PAGE_SHIFT))
> 
> What do you think of adding physical contiguous folio in batch? I guess we can
> reduce loop number of calling several functions here?

Possible as a separate patch, but not sure how much gain we can get.

> 
> Thanks,
> 
> > +			goto submit_and_realloc;
> > +
> > +		if (folio_test_large(folio)) {
> > +			ffs = ffs_find_or_alloc(folio);
> > +
> > +			/* set the bitmap to wait */
> > +			spin_lock_irq(&ffs->state_lock);
> > +			ffs->read_pages_pending++;
> > +			spin_unlock_irq(&ffs->state_lock);
> > +		}
> > +
> > +		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> > +		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
> > +				F2FS_BLKSIZE);
> > +		last_block_in_bio = block_nr;
> > +		index++;
> > +		offset++;
> > +	}
> > +	if (rac) {
> > +		folio = readahead_folio(rac);
> > +		goto next_folio;
> > +	}
> > +err_out:
> > +	/* Nothing was submitted. */
> > +	if (!bio) {
> > +		if (!ret)
> > +			folio_mark_uptodate(folio);
> > +		folio_unlock(folio);
> > +		return ret;
> > +	}
> > +
> > +	if (ret) {
> > +		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> > +
> > +		/* Wait bios and clear uptodate. */
> > +		folio_lock(folio);
> > +		folio_clear_uptodate(folio);
> > +		folio_unlock(folio);
> > +	}
> > +out:
> > +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> > +	return ret;
> > +}
> > +
> >  /*
> >   * This function was originally taken from fs/mpage.c, and customized for f2fs.
> >   * Major change was from block_size == page_size in f2fs by default.
> > @@ -2366,9 +2574,13 @@ static int f2fs_mpage_readpages(struct inode *inode,
> >  	pgoff_t index;
> >  #endif
> >  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
> > +	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
> >  	unsigned max_nr_pages = nr_pages;
> >  	int ret = 0;
> >  
> > +	if (mapping_large_folio_support(mapping))
> > +		return f2fs_read_data_large_folio(inode, rac, folio);
> > +
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >  	if (f2fs_compressed_file(inode)) {
> >  		index = rac ? readahead_index(rac) : folio->index;
> > @@ -2459,8 +2671,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
> >  		}
> >  #endif
> >  	}
> > -	if (bio)
> > -		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> > +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> >  	return ret;
> >  }
> >  
> > @@ -3747,7 +3958,12 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
> >  			f2fs_remove_dirty_inode(inode);
> >  		}
> >  	}
> > -	folio_detach_private(folio);
> > +
> > +	if (offset || length != folio_size(folio))
> > +		return;
> > +
> > +	folio_cancel_dirty(folio);
> > +	ffs_detach_free(folio);
> >  }
> >  
> >  bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> > @@ -3756,7 +3972,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> >  	if (folio_test_dirty(folio))
> >  		return false;
> >  
> > -	folio_detach_private(folio);
> > +	ffs_detach_free(folio);
> >  	return true;
> >  }
> >  
> > @@ -4162,12 +4378,25 @@ int __init f2fs_init_bio_entry_cache(void)
> >  {
> >  	bio_entry_slab = f2fs_kmem_cache_create("f2fs_bio_entry_slab",
> >  			sizeof(struct bio_entry));
> > -	return bio_entry_slab ? 0 : -ENOMEM;
> > +
> > +	if (!bio_entry_slab)
> > +		return -ENOMEM;
> > +
> > +	ffs_entry_slab = f2fs_kmem_cache_create("f2fs_ffs_slab",
> > +			sizeof(struct f2fs_folio_state));
> > +
> > +	if (!ffs_entry_slab) {
> > +		kmem_cache_destroy(bio_entry_slab);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  void f2fs_destroy_bio_entry_cache(void)
> >  {
> >  	kmem_cache_destroy(bio_entry_slab);
> > +	kmem_cache_destroy(ffs_entry_slab);
> >  }
> >  
> >  static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 86785068554f..d7600979218e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4928,6 +4928,22 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
> >  	return false;
> >  }
> >  
> > +static inline bool f2fs_quota_file(struct inode *inode)
> > +{
> > +#ifdef CONFIG_QUOTA
> > +	int i;
> > +
> > +	if (!f2fs_sb_has_quota_ino(F2FS_I_SB(inode)))
> > +		return false;
> > +
> > +	for (i = 0; i < MAXQUOTAS; i++) {
> > +		if (f2fs_qf_ino(F2FS_I_SB(inode)->sb, i) == inode->i_ino)
> > +			return true;
> > +	}
> > +#endif
> > +	return false;
> > +}
> > +
> >  static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
> >  {
> >  	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index d7047ca6b98d..e75e61ac50d7 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -624,6 +624,10 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
> >  	if (!f2fs_is_compress_backend_ready(inode))
> >  		return -EOPNOTSUPP;
> >  
> > +	if (mapping_large_folio_support(inode->i_mapping) &&
> > +	    filp->f_mode & FMODE_WRITE)
> > +		return -EOPNOTSUPP;
> > +
> >  	err = fsverity_file_open(inode, filp);
> >  	if (err)
> >  		return err;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index e2405b79b3cc..9162154d5211 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -597,6 +597,8 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> >  	if (ret)
> >  		goto bad_inode;
> >  make_now:
> > +	f2fs_set_inode_flags(inode);
> > +
> >  	if (ino == F2FS_NODE_INO(sbi)) {
> >  		inode->i_mapping->a_ops = &f2fs_node_aops;
> >  		mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
> > @@ -618,6 +620,9 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> >  		inode->i_op = &f2fs_file_inode_operations;
> >  		inode->i_fop = &f2fs_file_operations;
> >  		inode->i_mapping->a_ops = &f2fs_dblock_aops;
> > +		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
> > +		    !f2fs_quota_file(inode))
> > +			mapping_set_folio_min_order(inode->i_mapping, 0);
> >  	} else if (S_ISDIR(inode->i_mode)) {
> >  		inode->i_op = &f2fs_dir_inode_operations;
> >  		inode->i_fop = &f2fs_dir_operations;
> > @@ -638,7 +643,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> >  		ret = -EIO;
> >  		goto bad_inode;
> >  	}
> > -	f2fs_set_inode_flags(inode);
> >  
> >  	unlock_new_inode(inode);
> >  	trace_f2fs_iget(inode);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

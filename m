Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJB0DcgTgWkqEAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 22:14:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A1D1974
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 22:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOsUTbt9wBuUlSig2r1o7NyYqZ5MVZ1bTORXTZHLWmg=; b=FPBsHMIDO73Dz7UgFgmB30lROh
	98Xnfvro3+/3niHw0PDYNOnpLErQCIu8uSsa7v8JLMzdOs52GDUm+Fj17a4ihowxyvqLghYkn3Wpe
	DRT9XPubCYjY+XdyfJz/7pdoePxXYPKH9iQlaHGauHsPo82LIOSHEP6JSB8vW9VGbr0w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vn1Fm-0001AT-0U;
	Mon, 02 Feb 2026 21:14:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vn1Fl-0001AJ-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 21:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/dQTClf8zF/Ihi7dDQGZ7HNR0eJ0CGQqCEdWgs/ozNU=; b=NyEck3p5pMqz3ndzk44qbO31IM
 dCzsyAA36l5iCSfKhdq2TLNbc8tWsx3g76H/8Qs+5oj7NUO+dxKUq5784l/qbCEZyVX+GvyJ5XwxS
 l5CCaAPdbvqD2vNkgVvxu5Mp/xlD8JWyylr8/lGDmtRv/s4gcrKbbGF552n3YIcG9Bls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/dQTClf8zF/Ihi7dDQGZ7HNR0eJ0CGQqCEdWgs/ozNU=; b=MvrEz1ebE3oh9hPsenFPgElqor
 CNQ4ZdDOVsBact7qPuh4aso0qDRy/UoDJsX9YkTtUTgcFrnLUqGU/bEPbEGjffeAwcrpie9GDbebH
 GZx+nrsn8GmvU5KVAjlv4yCwg4KeUaXDCXkWof6lU9UFt+15A3/rGf3rW2b3lwFQZcZM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vn1Fk-0005in-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 21:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31DED600AA;
 Mon,  2 Feb 2026 21:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255EDC19425;
 Mon,  2 Feb 2026 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770066865;
 bh=JmqCgABshjxM1kfjyPJeB40UWBeB8qrf7A15OjNoTLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTo4nMquvQt+5Sa8gx+74PpEYCj8PiUhMuyxNy7lQlB8ZsZ5QElpikluO93lTeZVr
 qdfdcuh5adsQoyCapWqDeoE54eEGg1u44N6EufSj60kax7oYdo0A24kGooEjr4yv2S
 MG8Mtj80v01c6x1iXC5cNFdByK2bUs6S39kgYXKY7JNTjAfzZR7rj3s2zWdmkbGdMv
 MM3M/Pmn53Eh88YqEb6t38Zj4FEyJWaK1IdH+yUqDmgpGcYNFQp8EIMppq8htbZTFa
 KP5kMb/7xZfDGJlP6aDKi6D4fJL6ONt+0VxNkYQiKg1s6tqPon9iyODzEkOfJgFut5
 UOicAvqQ8gfAg==
Date: Mon, 2 Feb 2026 13:14:23 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260202211423.GB4838@quark>
References: <20260202060754.270269-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202060754.270269-1-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig
 wrote: > Hi all, > > this series has a hodge podge of fsverity enhances that
 I looked into as > part of the review of the xfs fsverity suppo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vn1Fk-0005in-VQ
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 3F1A1D1974
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series has a hodge podge of fsverity enhances that I looked into as
> part of the review of the xfs fsverity support series.
> 
> The first part optimizes the fsverity read path by kicking off readahead
> for the fsverity hashes from the data read submission context, which in my
> simply testing showed huge benefits for sequential reads using dd.
> I haven't been able to get fio to run on a preallocated fio file, but
> I expect random read benefits would be significantly better than that
> still.
> 
> The second part avoids the need for a pointer in every inode for fsverity
> and instead uses a rhashtable lookup, which is done once per read_folio
> or ->readahead invocation plus for btrfs only for each bio completion.
> Right now this does not increse the number of inodes in
> each slab, but for ext4 we are getting very close to that (within
> 16 bytes by my count).
> 
> Changes since v5:
>  - drop already merged patches
>  - fix a bisection hazard for non-ENOENT error returns from
>    generic_read_merkle_tree_page
>  - don't recurse on invalidate_lock
>  - refactor page_cache_ra_unbounded locking to support the above
>  - refactor ext4 and f2fs fsverity readahead to remove the need for the
>    first_folio branch in the main readpages loop

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

(Though it's getting late for v6.20 / v7.0.  So if there are any
additional issues reported, I may have to drop it.)

I fixed up some minor issues when applying:

- Replaced lockdep_assert_held_read() with lockdep_assert_held(), as
  mentioned in the other thread
- Fixed typos and other small mistakes in comments and commit messages
- Used the code formatting from 'git clang-format' in the cases where it
  looks better than the ad-hoc formatting
- Added <linux/export.h> to pagecache.c since it exports symbols, and
  dropped the unnecessary addition of <linux/pagemap.h> from verify.c

Here's the diff from the patchset as sent:

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 09acca898c25e..f65f95cd75223 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -208,7 +208,8 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
 }
 
 static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
-		struct readahead_control *rac, struct folio *folio)
+				struct readahead_control *rac,
+				struct folio *folio)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
@@ -429,7 +430,6 @@ void ext4_readahead(struct readahead_control *rac)
 	ext4_mpage_readpages(inode, vi, rac, NULL);
 }
 
-
 int __init ext4_init_post_read_processing(void)
 {
 	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, SLAB_RECLAIM_ACCOUNT);
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index e3ab3ba8799b2..5caa658adc12d 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -365,7 +365,7 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 }
 
 static void ext4_readahead_merkle_tree(struct inode *inode, pgoff_t index,
-		unsigned long nr_pages)
+				       unsigned long nr_pages)
 {
 	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
 	generic_readahead_merkle_tree(inode, index, nr_pages);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 41a5f2d212828..bec7b6694876e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1039,8 +1039,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 }
 
 static struct bio *f2fs_grab_read_bio(struct inode *inode,
-		struct fsverity_info *vi, block_t blkaddr, unsigned nr_pages,
-		blk_opf_t op_flag, pgoff_t first_idx, bool for_write)
+				      struct fsverity_info *vi, block_t blkaddr,
+				      unsigned nr_pages, blk_opf_t op_flag,
+				      pgoff_t first_idx, bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1087,14 +1088,14 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
 /* This can handle encryption stuffs */
 static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
-		struct folio *folio, block_t blkaddr, blk_opf_t op_flags,
-		bool for_write)
+				  struct folio *folio, block_t blkaddr,
+				  blk_opf_t op_flags, bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
 
 	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio->index,
-			for_write);
+				 for_write);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
@@ -1197,7 +1198,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 }
 
 static inline struct fsverity_info *f2fs_need_verity(const struct inode *inode,
-		pgoff_t idx)
+						     pgoff_t idx)
 {
 	if (idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
 		return fsverity_get_info(inode);
@@ -1270,7 +1271,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	}
 
 	f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index),
-			folio, dn.data_blkaddr, op_flags, for_write);
+			      folio, dn.data_blkaddr, op_flags, for_write);
 	return folio;
 
 put_err:
@@ -2075,9 +2076,11 @@ static inline blk_opf_t f2fs_ra_op_flags(struct readahead_control *rac)
 }
 
 static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
-		struct folio *folio, unsigned nr_pages,
-		struct f2fs_map_blocks *map, struct bio **bio_ret,
-		sector_t *last_block_in_bio, struct readahead_control *rac)
+				 struct folio *folio, unsigned int nr_pages,
+				 struct f2fs_map_blocks *map,
+				 struct bio **bio_ret,
+				 sector_t *last_block_in_bio,
+				 struct readahead_control *rac)
 {
 	struct bio *bio = *bio_ret;
 	const unsigned int blocksize = F2FS_BLKSIZE;
@@ -2152,8 +2155,7 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 	}
 	if (bio == NULL)
 		bio = f2fs_grab_read_bio(inode, vi, block_nr, nr_pages,
-				f2fs_ra_op_flags(rac), index,
-				false);
+					 f2fs_ra_op_flags(rac), index, false);
 
 	/*
 	 * If the page is under writeback, we need to wait for
@@ -2304,8 +2306,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 		if (!bio)
 			bio = f2fs_grab_read_bio(inode, cc->vi, blkaddr,
-					nr_pages - i, f2fs_ra_op_flags(rac),
-					folio->index, for_write);
+						 nr_pages - i,
+						 f2fs_ra_op_flags(rac),
+						 folio->index, for_write);
 
 		if (!bio_add_folio(bio, folio, blocksize, 0))
 			goto submit_and_realloc;
@@ -2345,7 +2348,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * Major change was from block_size == page_size in f2fs by default.
  */
 static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
-		struct readahead_control *rac, struct folio *folio)
+				struct readahead_control *rac,
+				struct folio *folio)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
@@ -2434,7 +2438,8 @@ static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 #endif
 
 		ret = f2fs_read_single_page(inode, vi, folio, max_nr_pages,
-					&map, &bio, &last_block_in_bio, rac);
+					    &map, &bio, &last_block_in_bio,
+					    rac);
 		if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
@@ -3658,10 +3663,10 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 			err = -EFSCORRUPTED;
 			goto put_folio;
 		}
-		f2fs_submit_page_read(use_cow ?
-				F2FS_I(inode)->cow_inode : inode,
-				NULL, /* can't write to fsverity files */
-				folio, blkaddr, 0, true);
+		f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode :
+						inode,
+				      NULL, /* can't write to fsverity files */
+				      folio, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4f5230d871f73..92ebcc19cab09 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -263,7 +263,7 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 }
 
 static void f2fs_readahead_merkle_tree(struct inode *inode, pgoff_t index,
-		unsigned long nr_pages)
+				       unsigned long nr_pages)
 {
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
 	generic_readahead_merkle_tree(inode, index, nr_pages);
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 1bde8fe79b3f0..04b2e05a95d73 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -259,13 +259,14 @@ struct fsverity_info *fsverity_create_info(struct inode *inode,
 int fsverity_set_info(struct fsverity_info *vi)
 {
 	return rhashtable_lookup_insert_fast(&fsverity_info_hash,
-			&vi->rhash_head, fsverity_info_hash_params);
+					     &vi->rhash_head,
+					     fsverity_info_hash_params);
 }
 
 struct fsverity_info *__fsverity_get_info(const struct inode *inode)
 {
 	return rhashtable_lookup_fast(&fsverity_info_hash, &inode,
-			fsverity_info_hash_params);
+				      fsverity_info_hash_params);
 }
 EXPORT_SYMBOL_GPL(__fsverity_get_info);
 
@@ -374,7 +375,8 @@ static int ensure_verity_info(struct inode *inode)
 	 * we might find an existing fsverity_info in the hash table.
 	 */
 	found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash,
-			&vi->rhash_head, fsverity_info_hash_params);
+						  &vi->rhash_head,
+						  fsverity_info_hash_params);
 	if (found) {
 		fsverity_free_info(vi);
 		if (IS_ERR(found))
@@ -397,7 +399,7 @@ EXPORT_SYMBOL_GPL(__fsverity_file_open);
 void fsverity_remove_info(struct fsverity_info *vi)
 {
 	rhashtable_remove_fast(&fsverity_info_hash, &vi->rhash_head,
-			fsverity_info_hash_params);
+			       fsverity_info_hash_params);
 	fsverity_free_info(vi);
 }
 
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 50b517ed6be0a..1819314ecaa35 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -3,6 +3,7 @@
  * Copyright 2019 Google LLC
  */
 
+#include <linux/export.h>
 #include <linux/fsverity.h>
 #include <linux/pagemap.h>
 
@@ -10,7 +11,6 @@
  * generic_read_merkle_tree_page - generic ->read_merkle_tree_page helper
  * @inode:	inode containing the Merkle tree
  * @index:	0-based index of the Merkle tree page in the inode
- * @num_ra_pages: The number of Merkle tree pages that should be prefetched.
  *
  * The caller needs to adjust @index from the Merkle-tree relative index passed
  * to ->read_merkle_tree_page to the actual index where the Merkle tree is
@@ -43,7 +43,7 @@ void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 {
 	struct folio *folio;
 
-	lockdep_assert_held_read(&inode->i_mapping->invalidate_lock);
+	lockdep_assert_held(&inode->i_mapping->invalidate_lock);
 
 	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
 	if (folio == ERR_PTR(-ENOENT) ||
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index 2807d44dc6bbd..b4c0892430cde 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -37,8 +37,8 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 	 */
 	if (inode->i_sb->s_vop->readahead_merkle_tree) {
 		filemap_invalidate_lock_shared(inode->i_mapping);
-		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
-				last_index - index + 1);
+		inode->i_sb->s_vop->readahead_merkle_tree(
+			inode, index, last_index - index + 1);
 		filemap_invalidate_unlock_shared(inode->i_mapping);
 	}
 
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 7380d0c5123cb..37e000f01c180 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -9,7 +9,6 @@
 
 #include <linux/bio.h>
 #include <linux/export.h>
-#include <linux/pagemap.h>
 
 #define FS_VERITY_MAX_PENDING_BLOCKS 2
 
@@ -43,8 +42,8 @@ static struct workqueue_struct *fsverity_read_workqueue;
  * @index:		first file data page index that is being read
  * @nr_pages:		number of file data pages to be read
  *
- * Start readahead on the fsverity hashes that are needed to verity the file
- * data in the range from @index to @inode + @nr_pages.
+ * Start readahead on the fsverity hashes that are needed to verify the file
+ * data in the range from @index to @index + @nr_pages (exclusive upper bound).
  *
  * To be called from the file systems' ->read_folio and ->readahead methods to
  * ensure that the hashes are already cached on completion of the file data
@@ -68,12 +67,12 @@ void fsverity_readahead(struct fsverity_info *vi, pgoff_t index,
 		unsigned long next_start_hidx = start_hidx >> params->log_arity;
 		unsigned long next_end_hidx = end_hidx >> params->log_arity;
 		pgoff_t start_idx = (level_start + next_start_hidx) >>
-				params->log_blocks_per_page;
+				    params->log_blocks_per_page;
 		pgoff_t end_idx = (level_start + next_end_hidx) >>
-				params->log_blocks_per_page;
+				  params->log_blocks_per_page;
 
-		inode->i_sb->s_vop->readahead_merkle_tree(inode, start_idx,
-				end_idx - start_idx + 1);
+		inode->i_sb->s_vop->readahead_merkle_tree(
+			inode, start_idx, end_idx - start_idx + 1);
 
 		start_hidx = next_start_hidx;
 		end_hidx = next_end_hidx;
@@ -244,7 +243,7 @@ static bool verify_data_block(struct fsverity_info *vi,
 			  (params->block_size - 1);
 
 		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
-				hpage_idx);
+								  hpage_idx);
 		if (IS_ERR(hpage)) {
 			fsverity_err(inode,
 				     "Error %ld reading Merkle tree page %lu",
@@ -320,7 +319,7 @@ fsverity_init_verification_context(struct fsverity_verification_context *ctx,
 	ctx->inode = vi->inode;
 	ctx->vi = vi;
 	ctx->num_pending = 0;
-	if (ctx->vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
+	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
 	    sha256_finup_2x_is_optimized())
 		ctx->max_pending = 2;
 	else
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 501ba8c960844..fed91023bea9c 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -115,7 +115,7 @@ struct fsverity_operations {
 	 * cached data instead of issuing dependent I/O.
 	 */
 	void (*readahead_merkle_tree)(struct inode *inode, pgoff_t index,
-			unsigned long nr_pages);
+				      unsigned long nr_pages);
 
 	/**
 	 * Write a Merkle tree block to the given file.
@@ -158,6 +158,7 @@ static inline bool fsverity_active(const struct inode *inode)
 	return false;
 }
 
+struct fsverity_info *__fsverity_get_info(const struct inode *inode);
 /**
  * fsverity_get_info - get fsverity information for an inode
  * @inode: inode to operate on.
@@ -166,7 +167,6 @@ static inline bool fsverity_active(const struct inode *inode)
  * knowin that a fsverity_info exist for @inode, including on file systems that
  * do not support fsverity.
  */
-struct fsverity_info *__fsverity_get_info(const struct inode *inode);
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
 	if (!fsverity_active(inode))
@@ -310,7 +310,7 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 
 void fsverity_cleanup_inode(struct inode *inode);
 void fsverity_readahead(struct fsverity_info *vi, pgoff_t index,
-		unsigned long nr_pages);
+			unsigned long nr_pages);
 
 struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
 void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
diff --git a/mm/readahead.c b/mm/readahead.c
index 25f81124beb60..f43d03558e625 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -205,8 +205,8 @@ static struct folio *ractl_alloc_folio(struct readahead_control *ractl,
  * or page_cache_sync_readahead() instead.
  *
  * Context: File is referenced by caller, and ractl->mapping->invalidate_lock
- * must be held by the caller in shared mode.  Mutexes may be held by caller.
- * May sleep, but will not reenter filesystem to reclaim memory.
+ * must be held by the caller at least in shared mode.  Mutexes may be held by
+ * caller.  May sleep, but will not reenter filesystem to reclaim memory.
  */
 void page_cache_ra_unbounded(struct readahead_control *ractl,
 		unsigned long nr_to_read, unsigned long lookahead_size)
@@ -229,7 +229,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 	 */
 	unsigned int nofs = memalloc_nofs_save();
 
-	lockdep_assert_held_read(&mapping->invalidate_lock);
+	lockdep_assert_held(&mapping->invalidate_lock);
 
 	trace_page_cache_ra_unbounded(mapping->host, index, nr_to_read,
 				      lookahead_size);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

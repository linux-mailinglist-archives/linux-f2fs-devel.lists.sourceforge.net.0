Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8033A124B5C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 16:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1tMPcPFLuGWP148pd0iSg3ZlGVM2/8r5nZgYQeSjKw=; b=iNzYRVGsRgS8ejYDAE5Ir8rnH
	iiIWaeWaIkANOP4Nw/coLwtcdTGE6uPUhFN6idscWeGkTLazKBgfvGXi97i8EUI92/CRz1me5jxx2
	N76Mk9RBXAio6aA3ejcy/WFnLt3d8iRz9/QskZJLi6MlRoaVhvIwFvyJ7ShTnLn57rldA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihb43-0007K8-AR; Wed, 18 Dec 2019 15:16:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Oj36XQYKAJMFxGLxG3BB381.zB9@flex--satyat.bounces.google.com>)
 id 1ihb42-0007Ju-1F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EADbsDRum38R86GWslHGIrQAClvnYHKnXEdwPqP/tUg=; b=FvY9nm473cCFmC+cdQS8Y8YR6
 DGkkg36eWeLVQ7goPMjM34YXVRKvInMh29jK/1KbAFDJTJoe8yux+2hhr9Dp62Cjjx2PzxX5cDoWY
 DvrWKUN8merJ+WU4xV5A3Rj/vxZO7THKDSrbwBc3+Z/KJ0YKirCyPy7peZsGUpgHRoA3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EADbsDRum38R86GWslHGIrQAClvnYHKnXEdwPqP/tUg=; b=WPiGlnh6n/hPqW/ku0+YorYRhA
 JB5isSZYub0TwgLLSPeYJTn5g+2V0BUEa7mhldep4u4HFPRRGqdB8+H6jBWxWH+1q5ESQp+V5gaxY
 bQV+F9TlaCejoQ5P7LdSiayeowRYiwVvm7CcbAkFWZim9/mDrGB0My7OEKZ11AktBZRA=;
Received: from mail-io1-f74.google.com ([209.85.166.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihb40-008vLb-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:16:37 +0000
Received: by mail-io1-f74.google.com with SMTP id 144so1577637iou.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 07:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=EADbsDRum38R86GWslHGIrQAClvnYHKnXEdwPqP/tUg=;
 b=DshjMIuOYKSldZF/54Op7s1VCWQoND4mCAFbEhT9QbBS3rzkIaxs4gGvc8LNZSnvka
 2SuLlMCCgC/x/SnvgNyrVTGFO781LoJ6HyijgLzCCp1SxOsQYdI4xGHQErCEjoTNi7c2
 1DNVekD88aMq++8iPhFpkae2xLJtPZNelRhSQS/Tlt6hlz2c/HNv7H2zrYg6nAlrlKJc
 ooiVFcdqwJCIZrpc26C9eqsVTMdqWLLBgDPtZKPY0ZGmUF58zBlBW4eTyy9bItS0ckzY
 UdRANIinc0QtGYMEY7p9TngCFANxIis44FAtjV2DB+N9oxMj7rzNHRc4QKxMTMMx1ZCd
 qrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=EADbsDRum38R86GWslHGIrQAClvnYHKnXEdwPqP/tUg=;
 b=VN4NJ7E/tlbV/tAD4LtRPDeTuLwuPCw8lpbacBzhnPCaIfpe9uoD+ybMQQVqmbuYGy
 0IaBIA+Km1Zqosp4XVcHuTMGHP5/1CRcsawFeuLnmtbCQ4o8rOak9WTWgv2dH5Jkg2hu
 gf2YU4ciGdK+xH6kZnUqS6dAozbKQqNErB34XUsqgMZBBQvEdgoUUh/W/MMKXuO8TXSJ
 Gt8QtkxSuRaeyIM5C4X6PtYnzIYOMnx3PBnzIr9JHog4DY4mTQKI/kdcIUD8bTQx1iwi
 OMPu1iMTLmRnrzRCUk27bhqdg5qUBBgczWKyLnb/FUfwYvgtr/6MvZmsyaTcxs4NMIPT
 IxZQ==
X-Gm-Message-State: APjAAAVjFlyZwR25GsdWZe4pVrTUpcY79PjYXobQajwHdFSz7Gfp7rgS
 Sc5Nkmjph7m+dejk3twmCmNYvOo4MkQ=
X-Google-Smtp-Source: APXvYqzMJy3yg26qq4fv0gxiTnua1iPpCfXQw2eTCgAqasIGdhcQVu41R/+wZ69Od9LX+ggQLAax4Syo2uk=
X-Received: by 2002:a63:211f:: with SMTP id h31mr3346195pgh.299.1576680762342; 
 Wed, 18 Dec 2019 06:52:42 -0800 (PST)
Date: Wed, 18 Dec 2019 06:51:36 -0800
In-Reply-To: <20191218145136.172774-1-satyat@google.com>
Message-Id: <20191218145136.172774-10-satyat@google.com>
Mime-Version: 1.0
References: <20191218145136.172774-1-satyat@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihb40-008vLb-Mk
Subject: [f2fs-dev] [PATCH v6 9/9] ext4: add inline encryption support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Eric Biggers <ebiggers@google.com>, Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wire up ext4 to support inline encryption via the helper functions which
fs/crypto/ now provides.  This includes:

- Adding a mount option 'inlinecrypt' which enables inline encryption
  on encrypted files where it can be used.

- Setting the bio_crypt_ctx on bios that will be submitted to an
  inline-encrypted file.

  Note: submit_bh_wbc() in fs/buffer.c also needed to be patched for
  this part, since ext4 sometimes uses ll_rw_block() on file data.

- Not adding logically discontiguous data to bios that will be submitted
  to an inline-encrypted file.

- Not doing filesystem-layer crypto on inline-encrypted files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/buffer.c        |  2 ++
 fs/ext4/ext4.h     |  1 +
 fs/ext4/inode.c    |  4 ++--
 fs/ext4/page-io.c  |  6 ++++--
 fs/ext4/readpage.c | 11 ++++++++---
 fs/ext4/super.c    | 13 +++++++++++++
 6 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index d8c7242426bb..3ad000db4a19 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3108,6 +3108,8 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	 */
 	bio = bio_alloc(GFP_NOIO, 1);
 
+	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
+
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_write_hint = write_hint;
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f8578caba40d..aeaa01724d7c 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1153,6 +1153,7 @@ struct ext4_inode_info {
 #define EXT4_MOUNT_JOURNAL_CHECKSUM	0x800000 /* Journal checksums */
 #define EXT4_MOUNT_JOURNAL_ASYNC_COMMIT	0x1000000 /* Journal Async Commit */
 #define EXT4_MOUNT_WARN_ON_ERROR	0x2000000 /* Trigger WARN_ON on error */
+#define EXT4_MOUNT_INLINECRYPT		0x4000000 /* Inline encryption support */
 #define EXT4_MOUNT_DELALLOC		0x8000000 /* Delalloc support */
 #define EXT4_MOUNT_DATA_ERR_ABORT	0x10000000 /* Abort on file data write */
 #define EXT4_MOUNT_BLOCK_VALIDITY	0x20000000 /* Block validity checking */
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 28f28de0c1b6..44d9651b8638 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1090,7 +1090,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	}
 	if (unlikely(err)) {
 		page_zero_new_buffers(page, from, to);
-	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
+	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
 		for (i = 0; i < nr_wait; i++) {
 			int err2;
 
@@ -3698,7 +3698,7 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 		/* Uhhuh. Read error. Complain and punt. */
 		if (!buffer_uptodate(bh))
 			goto unlock;
-		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
+		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 24aeedb8fc75..acde754cc5ca 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -404,6 +404,7 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	 * __GFP_DIRECT_RECLAIM is set, see comments for bio_alloc_bioset().
 	 */
 	bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
+	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_end_io = ext4_end_bio;
@@ -420,7 +421,8 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 {
 	int ret;
 
-	if (io->io_bio && bh->b_blocknr != io->io_next_block) {
+	if (io->io_bio && (bh->b_blocknr != io->io_next_block ||
+			   !fscrypt_mergeable_bio_bh(io->io_bio, bh))) {
 submit_and_retry:
 		ext4_io_submit(io);
 	}
@@ -508,7 +510,7 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
 	 * can't happen in the common case of blocksize == PAGE_SIZE.
 	 */
-	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit) {
+	if (fscrypt_inode_uses_fs_layer_crypto(inode) && nr_to_submit) {
 		gfp_t gfp_flags = GFP_NOFS;
 		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
 
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index fef7755300c3..7844e27518b4 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -183,7 +183,7 @@ static struct bio_post_read_ctx *get_bio_post_read_ctx(struct inode *inode,
 	unsigned int post_read_steps = 0;
 	struct bio_post_read_ctx *ctx = NULL;
 
-	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 
 	if (ext4_need_verity(inode, first_idx))
@@ -220,6 +220,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
 	const unsigned blocksize = 1 << blkbits;
+	sector_t next_block;
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
@@ -252,7 +253,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		if (page_has_buffers(page))
 			goto confused;
 
-		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
+		block_in_file = next_block =
+			(sector_t)page->index << (PAGE_SHIFT - blkbits);
 		last_block = block_in_file + nr_pages * blocks_per_page;
 		last_block_in_file = (ext4_readpage_limit(inode) +
 				      blocksize - 1) >> blkbits;
@@ -352,7 +354,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		 * This page will go to BIO.  Do we need to send this
 		 * BIO off first?
 		 */
-		if (bio && (last_block_in_bio != blocks[0] - 1)) {
+		if (bio && (last_block_in_bio != blocks[0] - 1 ||
+			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
 		submit_and_realloc:
 			submit_bio(bio);
 			bio = NULL;
@@ -366,6 +369,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			 */
 			bio = bio_alloc(GFP_KERNEL,
 				min_t(int, nr_pages, BIO_MAX_PAGES));
+			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
+						  GFP_KERNEL);
 			ctx = get_bio_post_read_ctx(inode, bio, page->index);
 			if (IS_ERR(ctx)) {
 				bio_put(bio);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 1d82b56d9b11..0a6b60620942 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1357,6 +1357,11 @@ static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
 	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
 }
 
+static bool ext4_inline_crypt_enabled(struct super_block *sb)
+{
+	return test_opt(sb, INLINECRYPT);
+}
+
 static const struct fscrypt_operations ext4_cryptops = {
 	.key_prefix		= "ext4:",
 	.get_context		= ext4_get_context,
@@ -1366,6 +1371,7 @@ static const struct fscrypt_operations ext4_cryptops = {
 	.max_namelen		= EXT4_NAME_LEN,
 	.has_stable_inodes	= ext4_has_stable_inodes,
 	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
+	.inline_crypt_enabled	= ext4_inline_crypt_enabled,
 };
 #endif
 
@@ -1460,6 +1466,7 @@ enum {
 	Opt_journal_path, Opt_journal_checksum, Opt_journal_async_commit,
 	Opt_abort, Opt_data_journal, Opt_data_ordered, Opt_data_writeback,
 	Opt_data_err_abort, Opt_data_err_ignore, Opt_test_dummy_encryption,
+	Opt_inlinecrypt,
 	Opt_usrjquota, Opt_grpjquota, Opt_offusrjquota, Opt_offgrpjquota,
 	Opt_jqfmt_vfsold, Opt_jqfmt_vfsv0, Opt_jqfmt_vfsv1, Opt_quota,
 	Opt_noquota, Opt_barrier, Opt_nobarrier, Opt_err,
@@ -1556,6 +1563,7 @@ static const match_table_t tokens = {
 	{Opt_noinit_itable, "noinit_itable"},
 	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
+	{Opt_inlinecrypt, "inlinecrypt"},
 	{Opt_nombcache, "nombcache"},
 	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
 	{Opt_removed, "check=none"},	/* mount option from ext2/3 */
@@ -1767,6 +1775,11 @@ static const struct mount_opts {
 	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
 	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
 	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_SET},
+#else
+	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_NOSUPPORT},
+#endif
 	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
 	{Opt_err, 0, 0}
 };
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

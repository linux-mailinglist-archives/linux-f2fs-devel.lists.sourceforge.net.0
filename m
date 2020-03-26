Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92B193681
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 04:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lGuxDpnkbgFo9TGZVKdv+t4Ymo4jClZItIEQDypTT2U=; b=Uq5Kc4DcjgaPhojvojuPIvtbm
	OrB6uld5GbDyRh4yZ/US2Y9MnHaO2Dqy4AjqRwWYdboqMo6UL9D6TD8NFv7vbOxy/E+NgfuBsexj7
	oRWcg2My20whuOrv8SIiVZk5z4q8s8iZVQZlGvAR22AwciCiaCMcASC9wKDQBgDFbR4TI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHIsu-0003iG-UB; Thu, 26 Mar 2020 03:08:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3tBx8XgYKANcL3MR3M9HH9E7.5HF@flex--satyat.bounces.google.com>)
 id 1jHIst-0003i5-QF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 03:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zm76QeF6taktnh5e54BxZA9RAiJwG0+jPa+LHHPF+mE=; b=brEtbzHEtlEHBlBGO47p2OJyc
 jp7y9l2AZhz+33b2/fYS1aaGVk71VeDzqaSi6mwYUIqAv4U3xC3H6fkQ+LfNhoNnozRhlWnFsjI6y
 r+ldS7UtqieNo+pdntncfq3wqW7cNVTU0ooKCE+sCDKIj7r4CKhSNKaRSqrxs99qLwaW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zm76QeF6taktnh5e54BxZA9RAiJwG0+jPa+LHHPF+mE=; b=chuIDiuz+oVSF/vCQrL/wxgvGj
 sSbtRzdlD8TjpqqBHNmb2Owcbxd9NqM0Uzhsq7Wr2sPI+ejBP7Z5CiCdnA6SQxy/45UNnwwiutAM2
 T3PqVKbKfj588U2xXME1qlRkwvHgkGEPBBwRmKtGMUfwrFt0NSB0coy7B7+X86ZFyvMo=;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHIss-007lxL-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 03:08:43 +0000
Received: by mail-pj1-f74.google.com with SMTP id t7so3240955pjb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 20:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zm76QeF6taktnh5e54BxZA9RAiJwG0+jPa+LHHPF+mE=;
 b=r1xlYYkFZCORE7cKTB1lZ6rdH/MjVnk8XIfSk/rZg+D2UCESzFUQutqOSVRm647NAh
 s+uHERM165tiPLOr7sZGwQUeM19ND5GyE4Mn3XIZCTahGTTeRE0lX5NBdpo0sy0Gqzv3
 58G4Fu/wjgFDHDg7DNpJ+C1xTXCUuI3ul31GVQsEz4f04W3fibjSfCo7dE8L33j7XMQX
 kSY/C7KdBkZYsMo0pGoIKsRQeb5qW99WVRoPTd/MY08pVchKEkDpZwqPTm47Ex+n4J/u
 84PYC9W6H/Mutc4lMejS7YpADzlt7zwBO4p/Orv3tsNJQXwFJzk0Q/xRJC/Frp88i9aG
 5Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zm76QeF6taktnh5e54BxZA9RAiJwG0+jPa+LHHPF+mE=;
 b=qasokt06yODYQGPjlYf0azj8ItvBJz2McgjmQnVGX3RPV4xrmtZNb84hCeQRRVc1Y+
 1byMX7bfI7yV009YoX7TqdF5N6u32m/fgvugrBU6tiYUreTABUEBQmoOPie5xFlEzFjA
 4lTu++rPw9PkZjZYx+CXe+OV6g/aczpSIzSoPr+wiRUfdoCdtbtx5RAmJxvd0gvxvd+0
 kQbCJxx6oQw4DZm2cWKmaTH38pBsNMXfTxF+bP2aD6qFIquFueCWffjqomoxK/4bdVvU
 n4Co74uloVzxVdIPx/yJIAvPF41ZPM5VPrDEkwKOsbCZcgbxnyIUpepwe+3YDRlmZU3f
 UqXw==
X-Gm-Message-State: ANhLgQ0C71o2xVGtc3QrPuS1rqr7TmLoHSkGU5IlsDJi+ldfhhx1sgw2
 lBS+9N0RicpV5CvapzhD2tW32Nb2ooU=
X-Google-Smtp-Source: ADFU+vtI5wdL4uFEoqaUj8yxqL1JLGpTyFwsyJsLf/tt/rgWldEHrASOEpGbruL+9qKMsIugh4TTLeZgIgs=
X-Received: by 2002:a17:90a:240a:: with SMTP id
 h10mr709109pje.123.1585192116205; 
 Wed, 25 Mar 2020 20:08:36 -0700 (PDT)
Date: Wed, 25 Mar 2020 20:07:02 -0700
In-Reply-To: <20200326030702.223233-1-satyat@google.com>
Message-Id: <20200326030702.223233-12-satyat@google.com>
Mime-Version: 1.0
References: <20200326030702.223233-1-satyat@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.74 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHIss-007lxL-1Y
Subject: [f2fs-dev] [PATCH v9 11/11] ext4: add inline encryption support
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
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

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
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/admin-guide/ext4.rst |  6 ++++++
 fs/buffer.c                        |  7 ++++---
 fs/ext4/inode.c                    |  4 ++--
 fs/ext4/page-io.c                  |  6 ++++--
 fs/ext4/readpage.c                 | 11 ++++++++---
 fs/ext4/super.c                    |  9 +++++++++
 6 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/ext4.rst b/Documentation/admin-guide/ext4.rst
index 9443fcef18760..ed997e3766781 100644
--- a/Documentation/admin-guide/ext4.rst
+++ b/Documentation/admin-guide/ext4.rst
@@ -395,6 +395,12 @@ When mounting an ext4 filesystem, the following option are accepted:
         Documentation/filesystems/dax.txt.  Note that this option is
         incompatible with data=journal.
 
+  inlinecrypt
+        Encrypt/decrypt the contents of encrypted files using the blk-crypto
+        framework rather than filesystem-layer encryption. This allows the use
+        of inline encryption hardware. The on-disk format is unaffected. For
+        more details, see Documentation/block/inline-encryption.rst.
+
 Data Mode
 =========
 There are 3 different data modes:
diff --git a/fs/buffer.c b/fs/buffer.c
index b8d28370cfd7f..226f1784eda74 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -331,9 +331,8 @@ static void decrypt_bh(struct work_struct *work)
 static void end_buffer_async_read_io(struct buffer_head *bh, int uptodate)
 {
 	/* Decrypt if needed */
-	if (uptodate && IS_ENABLED(CONFIG_FS_ENCRYPTION) &&
-	    IS_ENCRYPTED(bh->b_page->mapping->host) &&
-	    S_ISREG(bh->b_page->mapping->host->i_mode)) {
+	if (uptodate &&
+	    fscrypt_inode_uses_fs_layer_crypto(bh->b_page->mapping->host)) {
 		struct decrypt_bh_ctx *ctx = kmalloc(sizeof(*ctx), GFP_ATOMIC);
 
 		if (ctx) {
@@ -3085,6 +3084,8 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	 */
 	bio = bio_alloc(GFP_NOIO, 1);
 
+	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
+
 	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
 	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_write_hint = write_hint;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fa0ff78dc033f..5714ff6395a1c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1089,7 +1089,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	}
 	if (unlikely(err)) {
 		page_zero_new_buffers(page, from, to);
-	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
+	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
 		for (i = 0; i < nr_wait; i++) {
 			int err2;
 
@@ -3720,7 +3720,7 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 		/* Uhhuh. Read error. Complain and punt. */
 		if (!buffer_uptodate(bh))
 			goto unlock;
-		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
+		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			err = fscrypt_decrypt_pagecache_blocks(page, blocksize,
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 68b39e75446a1..0757145a31b26 100644
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
index c1769afbf7995..68eac0aeffad3 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -195,7 +195,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
 {
 	unsigned int post_read_steps = 0;
 
-	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 
 	if (ext4_need_verity(inode, first_idx))
@@ -232,6 +232,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
 	const unsigned blocksize = 1 << blkbits;
+	sector_t next_block;
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
@@ -264,7 +265,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		if (page_has_buffers(page))
 			goto confused;
 
-		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
+		block_in_file = next_block =
+			(sector_t)page->index << (PAGE_SHIFT - blkbits);
 		last_block = block_in_file + nr_pages * blocks_per_page;
 		last_block_in_file = (ext4_readpage_limit(inode) +
 				      blocksize - 1) >> blkbits;
@@ -364,7 +366,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		 * This page will go to BIO.  Do we need to send this
 		 * BIO off first?
 		 */
-		if (bio && (last_block_in_bio != blocks[0] - 1)) {
+		if (bio && (last_block_in_bio != blocks[0] - 1 ||
+			    !fscrypt_mergeable_bio(bio, inode, next_block))) {
 		submit_and_realloc:
 			submit_bio(bio);
 			bio = NULL;
@@ -376,6 +379,8 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			 */
 			bio = bio_alloc(GFP_KERNEL,
 				min_t(int, nr_pages, BIO_MAX_PAGES));
+			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
+						  GFP_KERNEL);
 			ext4_set_bio_post_read_ctx(bio, inode, page->index);
 			bio_set_dev(bio, bdev);
 			bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0c7c4adb664ec..2054da2ddde42 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1514,6 +1514,7 @@ enum {
 	Opt_journal_path, Opt_journal_checksum, Opt_journal_async_commit,
 	Opt_abort, Opt_data_journal, Opt_data_ordered, Opt_data_writeback,
 	Opt_data_err_abort, Opt_data_err_ignore, Opt_test_dummy_encryption,
+	Opt_inlinecrypt,
 	Opt_usrjquota, Opt_grpjquota, Opt_offusrjquota, Opt_offgrpjquota,
 	Opt_jqfmt_vfsold, Opt_jqfmt_vfsv0, Opt_jqfmt_vfsv1, Opt_quota,
 	Opt_noquota, Opt_barrier, Opt_nobarrier, Opt_err,
@@ -1611,6 +1612,7 @@ static const match_table_t tokens = {
 	{Opt_noinit_itable, "noinit_itable"},
 	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
+	{Opt_inlinecrypt, "inlinecrypt"},
 	{Opt_nombcache, "nombcache"},
 	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
 	{Opt_removed, "check=none"},	/* mount option from ext2/3 */
@@ -1898,6 +1900,13 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
 	case Opt_nolazytime:
 		sb->s_flags &= ~SB_LAZYTIME;
 		return 1;
+	case Opt_inlinecrypt:
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+		sb->s_flags |= SB_INLINECRYPT;
+#else
+		ext4_msg(sb, KERN_ERR, "inline encryption not supported");
+#endif
+		return 1;
 	}
 
 	for (m = ext4_mount_opts; m->token != Opt_err; m++)
-- 
2.25.1.696.g5e7596f4ac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E7167D4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 13:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pwjkLzcB0cUlzpCmE0FesiZJqLzCQpMUl7NRA5+qXXk=; b=Jq5BQkwegGWdGO0W7NCkFjoHg
	YJiY6QZVQvp2w4xHIyPLGHekbFP5I8/8v1uQ78F/SDljhiIFpTO37O2X893ZiFpZhCZf50mFUk9P5
	feA0J8+rr/iPJw2T5U6XhCSjlXYh9Oj1EIesJR3KhDMwt19SHDtZfxRdc3URg2utigoEU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j57HC-0008Iz-1w; Fri, 21 Feb 2020 12:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3OMRPXgYKAPcrZsxZsfnnfkd.bnl@flex--satyat.bounces.google.com>)
 id 1j57HB-0008Ik-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVpBP8njR5c/0VdJDbcHfaaWkqHB5/yUe3vOEAsYgT4=; b=DjINdHvBYxF1Rr/ymKcnDSPCD
 K03bh25VWeJdULcx5f+UmdBbnycppehPb7Q7Yo0kDgvy9ZkRwRzSoztujBZ/vF2L+8EI94K0ymEzK
 wxOd1a2Z4LeQcsgZfangHwUD7dgNyXGyKP3X66wjA6DFKZF/p/XGAJrECH7gvGd/ow3Pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nVpBP8njR5c/0VdJDbcHfaaWkqHB5/yUe3vOEAsYgT4=; b=JtUSVRMOWee/fwozLJZIk2SQyT
 fRa3+yXSe2TkVsuCcOB+Qxg2sjpJzDDVO7WmhLYIUwKZYLjQUYORIlhuFbgKWpk2FrjomfdB/y+hq
 ZoSVaFYLQAoDdvj9jetko5lQ89Ed0btZP8EOymNJG6lc9l1RwlGKjcsI88NdVs0rQbGo=;
Received: from mail-io1-f73.google.com ([209.85.166.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j57H9-0038Az-HR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:19:25 +0000
Received: by mail-io1-f73.google.com with SMTP id z26so1971899iog.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2020 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nVpBP8njR5c/0VdJDbcHfaaWkqHB5/yUe3vOEAsYgT4=;
 b=DykxxtRLKpTHwO6237RfHZgpZoLziLuesPR96/KV33vFVsu6uAF1CQQZxt/b/AMSXc
 OKQnAcUvJzeAIXKSn64VRpBDe+QISp8Yi+wZF0/R1YaDe8wrjaiuJ4R7Bn+rjzGR9nfM
 3Yyzc7rotB52zWSIe8BT0x4TLag7gIQqxNsSAVG60BE+p70ORItuARtMHaUxF0yEc85n
 T5XbNBRuHYPJk4Diu2cSPEtr8yEtxcr64p1Vx+aAlf/ZHaMcUgQyigS3KrsN4DkJ6O/q
 /FyB/XIGLFwKbBcI7HUBGsBAb7rabFcCWjRMpmJZGltuhcNccgoXFmMW0smFgRlpl4Ks
 76rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nVpBP8njR5c/0VdJDbcHfaaWkqHB5/yUe3vOEAsYgT4=;
 b=GbO8ZCEG8D2R2n1oZwmrYCB/eWlXvei1OKaV5+V0Lv45MRPJ37ZS7LYOn34jArr1Rp
 Xh899042bZuE6EDjDx/ubpyaLYhrwXCZRYAtofhDKS39p+TAWUdhP6L0wfPLzOPB5nlM
 ehSbr8rDX+SbCZb3bSEXafvHB6q6begE09joQVdB0D/9KTq1+83E5Od5vtZKj0ruUh46
 E/yEFmGo9m1mYpfwzyUwbx6PbmeMXMvEZvkWPa/NIW5zNdPNi7h/M0jcAqz4MjCu0tkI
 dXDjlz51efpL1eZulGDUHq8zaGJzz9ocDJq4UZagcx3+2zY8TlQzob6COuS8PapvJhvL
 DrBw==
X-Gm-Message-State: APjAAAUIvWwAo3BujVt5EMJ7EdpHGv2hsc/oJ9i0cRxrUFm+ff5yiL/+
 rXwgHW4U4EbRs7i4cK0ESvI/slJIwIM=
X-Google-Smtp-Source: APXvYqyutSoI/BqbEEyxs7ahm+apo7mQoW1rZeI9CaImHeXJSWcxFyZWrTZI8B+utJ/FzHEiYnG06PuC3zI=
X-Received: by 2002:a65:4c82:: with SMTP id m2mr36698986pgt.432.1582285880111; 
 Fri, 21 Feb 2020 03:51:20 -0800 (PST)
Date: Fri, 21 Feb 2020 03:50:49 -0800
In-Reply-To: <20200221115050.238976-1-satyat@google.com>
Message-Id: <20200221115050.238976-9-satyat@google.com>
Mime-Version: 1.0
References: <20200221115050.238976-1-satyat@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.73 listed in list.dnswl.org]
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
X-Headers-End: 1j57H9-0038Az-HR
Subject: [f2fs-dev] [PATCH v7 8/9] f2fs: add inline encryption support
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

Wire up f2fs to support inline encryption via the helper functions which
fs/crypto/ now provides.  This includes:

- Adding a mount option 'inlinecrypt' which enables inline encryption
  on encrypted files where it can be used.

- Setting the bio_crypt_ctx on bios that will be submitted to an
  inline-encrypted file.

- Not adding logically discontiguous data to bios that will be submitted
  to an inline-encrypted file.

- Not doing filesystem-layer crypto on inline-encrypted files.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/filesystems/f2fs.txt |  4 ++
 fs/f2fs/compress.c                 |  2 +-
 fs/f2fs/data.c                     | 67 +++++++++++++++++++++++++-----
 fs/f2fs/f2fs.h                     |  3 ++
 fs/f2fs/super.c                    | 35 ++++++++++++++++
 5 files changed, 100 insertions(+), 11 deletions(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 4eb3e2ddd00e..e8d6a9240f55 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -246,6 +246,10 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
                        on compression extension list and enable compression on
                        these file by default rather than to enable it via ioctl.
                        For other files, we can still enable compression via ioctl.
+inlinecrypt
+                       Use blk-crypto, rather than fscrypt, for file content
+                       en/decryption. See
+                       Documentation/block/inline-encryption.rst
 
 ================================================================================
 DEBUGFS ENTRIES
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d8a64be90a50..6ae313ea5432 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -775,7 +775,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.need_lock = LOCK_RETRY,
 		.io_type = io_type,
 		.io_wbc = wbc,
-		.encrypted = f2fs_encrypted_file(cc->inode),
+		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode),
 	};
 	struct dnode_of_data dn;
 	struct node_info ni;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b27b72107911..6d42ecceb08b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -436,6 +436,33 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	return bio;
 }
 
+static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
+				  pgoff_t first_idx,
+				  const struct f2fs_io_info *fio,
+				  gfp_t gfp_mask)
+{
+	/*
+	 * The f2fs garbage collector sets ->encrypted_page when it wants to
+	 * read/write raw data without encryption.
+	 */
+	if (!fio || !fio->encrypted_page)
+		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+}
+
+static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
+				     pgoff_t next_idx,
+				     const struct f2fs_io_info *fio)
+{
+	/*
+	 * The f2fs garbage collector sets ->encrypted_page when it wants to
+	 * read/write raw data without encryption.
+	 */
+	if (fio && fio->encrypted_page)
+		return !bio_has_crypt_ctx(bio);
+
+	return fscrypt_mergeable_bio(bio, inode, next_idx);
+}
+
 static inline void __submit_bio(struct f2fs_sb_info *sbi,
 				struct bio *bio, enum page_type type)
 {
@@ -632,6 +659,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
+	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+			       fio->page->index, fio, GFP_NOIO);
+
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
 		return -EFAULT;
@@ -820,12 +850,16 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
-						fio->new_blkaddr))
+	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
+				       fio->new_blkaddr) ||
+		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
+					      fio->page->index, fio)))
 		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+				       fio->page->index, fio, GFP_NOIO);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
@@ -882,8 +916,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
 	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
 
-	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
-			io->last_block_in_bio, fio->new_blkaddr))
+	if (io->bio &&
+	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
+			      fio->new_blkaddr) ||
+	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
+				       fio->page->index, fio)))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
@@ -895,6 +932,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+				       fio->page->index, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
 
@@ -938,11 +977,14 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES), false);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
+
+	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
+
 	f2fs_target_device(sbi, blkaddr, bio);
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
-	if (f2fs_encrypted_file(inode))
+	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 	if (f2fs_compressed_file(inode))
 		post_read_steps |= 1 << STEP_DECOMPRESS;
@@ -1972,8 +2014,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	 * This page will go to BIO.  Do we need to send this
 	 * BIO off first?
 	 */
-	if (bio && !page_is_mergeable(F2FS_I_SB(inode), bio,
-				*last_block_in_bio, block_nr)) {
+	if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
+				       *last_block_in_bio, block_nr) ||
+		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
 submit_and_realloc:
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
@@ -2099,8 +2142,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		blkaddr = datablock_addr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
 
-		if (bio && !page_is_mergeable(sbi, bio,
-					*last_block_in_bio, blkaddr)) {
+		if (bio && (!page_is_mergeable(sbi, bio,
+					*last_block_in_bio, blkaddr) ||
+		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
 submit_and_realloc:
 			__submit_bio(sbi, bio, DATA);
 			bio = NULL;
@@ -2319,6 +2363,9 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
+	if (fscrypt_inode_uses_inline_crypto(inode))
+		return 0;
+
 retry_encrypt:
 	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page,
 					PAGE_SIZE, 0, gfp_flags);
@@ -2492,7 +2539,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			f2fs_unlock_op(fio->sbi);
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
-			if (f2fs_encrypted_file(inode))
+			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(&fio->encrypted_page);
 			if (PageWriteback(page))
 				end_page_writeback(page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..75817f0dc6f8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -139,6 +139,9 @@ struct f2fs_mount_info {
 	int alloc_mode;			/* segment allocation policy */
 	int fsync_mode;			/* fsync policy */
 	bool test_dummy_encryption;	/* test dummy encryption */
+#ifdef CONFIG_FS_ENCRYPTION
+	bool inlinecrypt;		/* inline encryption enabled */
+#endif
 	block_t unusable_cap;		/* Amount of space allowed to be
 					 * unusable when disabling checkpoint
 					 */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 65a7a432dfee..fb94ea555c30 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -137,6 +137,7 @@ enum {
 	Opt_alloc,
 	Opt_fsync,
 	Opt_test_dummy_encryption,
+	Opt_inlinecrypt,
 	Opt_checkpoint_disable,
 	Opt_checkpoint_disable_cap,
 	Opt_checkpoint_disable_cap_perc,
@@ -202,6 +203,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_alloc, "alloc_mode=%s"},
 	{Opt_fsync, "fsync_mode=%s"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
+	{Opt_inlinecrypt, "inlinecrypt"},
 	{Opt_checkpoint_disable, "checkpoint=disable"},
 	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
 	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
@@ -790,6 +792,13 @@ static int parse_options(struct super_block *sb, char *options)
 			f2fs_info(sbi, "Test dummy encryption mode enabled");
 #else
 			f2fs_info(sbi, "Test dummy encryption mount option ignored");
+#endif
+			break;
+		case Opt_inlinecrypt:
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+			sb->s_flags |= SB_INLINE_CRYPT;
+#else
+			f2fs_info(sbi, "inline encryption not supported");
 #endif
 			break;
 		case Opt_checkpoint_disable_cap_perc:
@@ -1538,6 +1547,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 #ifdef CONFIG_FS_ENCRYPTION
 	if (F2FS_OPTION(sbi).test_dummy_encryption)
 		seq_puts(seq, ",test_dummy_encryption");
+	if (sbi->sb->s_flags & SB_INLINE_CRYPT)
+		seq_puts(seq, ",inlinecrypt");
 #endif
 
 	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_DEFAULT)
@@ -1568,6 +1579,9 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).test_dummy_encryption = false;
+#ifdef CONFIG_FS_ENCRYPTION
+	sbi->sb->s_flags &= ~SB_INLINE_CRYPT;
+#endif
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
 	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
@@ -2415,6 +2429,25 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
 	*lblk_bits_ret = 8 * sizeof(block_t);
 }
 
+static int f2fs_get_num_devices(struct super_block *sb)
+{
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+
+	if (f2fs_is_multi_device(sbi))
+		return sbi->s_ndevs;
+	return 1;
+}
+
+static void f2fs_get_devices(struct super_block *sb,
+			     struct request_queue **devs)
+{
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	int i;
+
+	for (i = 0; i < sbi->s_ndevs; i++)
+		devs[i] = bdev_get_queue(FDEV(i).bdev);
+}
+
 static const struct fscrypt_operations f2fs_cryptops = {
 	.key_prefix		= "f2fs:",
 	.get_context		= f2fs_get_context,
@@ -2424,6 +2457,8 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
+	.get_num_devices	= f2fs_get_num_devices,
+	.get_devices		= f2fs_get_devices,
 };
 #endif
 
-- 
2.25.0.265.gbab2e86ba0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

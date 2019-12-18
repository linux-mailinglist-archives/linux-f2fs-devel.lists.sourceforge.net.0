Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4E124B81
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 16:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ZM1zIjwTK3KY/5MPim3vCRCzFg60s2ocGvcp2gv4Vo=; b=RyOBXfz1/D14rWfvmPTbsdGij
	y91WrDfLQvNjknC4E8fT+7dsX3QsEdYfRUdIYKYPb17pr1PbBJlZPLdQc3eIYFCzoRNR/SErCeoIR
	XpjmJJ8QgP9qkWDzsELNE4+Uke4YRgOnYbU+XltSEb+IfPQq1cq6QBMZiuXLn02bDTFes=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihbAj-00056m-5b; Wed, 18 Dec 2019 15:23:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Nz36XQYKAJACuDIuD08805y.w86@flex--satyat.bounces.google.com>)
 id 1ihbAi-00056W-CM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENEj/1BO1ugeO8FPAEs1/3L7kkxZuF2zB3HNc8VqXUU=; b=Ga2chXLbr65VbT/676IQwhM75
 gBAM9lkMeHZkbQSo4S3RigiTrSW08QRzAJxAnvZRnPa7N1ezSXptZ2txEZOlM4ei4OFNeTfIfObor
 MmoT4XFnCnZpNxrSUAcZSo2D0LsGwc9QkLtSK+YdBIQ2ROIvRaTZvmFlcatNgMLnCNjuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ENEj/1BO1ugeO8FPAEs1/3L7kkxZuF2zB3HNc8VqXUU=; b=Ni1sxjmb90pRypK12RrPtwaNFL
 Aq2hX+Z0Sw1tEOIZVTeaenzdcU5jLjNilyvKeph24Hnhrln8QzvuRBdV/573CcTv+xqLR8KaQEJwj
 8VN4eGsJUB4p0WLpRSXNRYma71ErBI7Sd2CteWZ4n2aGhxL/Z9MPZ8epsDrJ5FhRhj/4=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihbAg-008mm8-TB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:23:32 +0000
Received: by mail-pj1-f73.google.com with SMTP id m61so1365062pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ENEj/1BO1ugeO8FPAEs1/3L7kkxZuF2zB3HNc8VqXUU=;
 b=nJgsyu5lb2elqBKYo5MraImnh64iOWc7LS5Il1uv5iyNZV4DVyrQSt73Pcj3SCsrDb
 PP17KyKOcMNa6qfTkGecKokGUanzYHwzBPLk+1FZF1EciWXjf3EKST5wljzlwKSpqr+S
 NXgVxxQLy6Mw7TdBSPadtIBFJy8NSs4mpABVhf/hQCA80RRfqqCWtsAAm1imvcDNV/U9
 koaUx1TJTUv1AL/9DUhWW55eXBM9HERmvLZ3iJdakkBOtMpbM598p5wyPJ2CvGb3eIUb
 eVpi2W9/aNQDHzPaB/W+RHamF3x97niiGrLN9/x13VApecKJyr/Ow6X7AvqEQSlPHZux
 Gk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ENEj/1BO1ugeO8FPAEs1/3L7kkxZuF2zB3HNc8VqXUU=;
 b=eDVCyvS5Um8JmM27Fn1kbbNfb9ezt2Od1YzIGToRq6AdbZ4psoPb0YBBK/4+dhZ4oS
 ZyS+eHNErnZKvQ2WnR5lMYB/Ze1xNX7Fe7npf6yTXhl5jhwWqyNJOz2RSgSNmtoBFrUF
 7KJ9GWSeHsLivCrjABIhEsNnvmouIK1ufx4niDakxgKluGoYc7IQgPqOoGuqirCxZZxk
 iAXQHQRHzjPBf4tbIJY8At1SpPagayo2fqpPZmv5/5EbdOSW/nLk14yc69uzeK2/Ii0x
 G+4Bw2ASX7qD5FU8m+ombsSMUqYeU3B88+d/Ams8yhqqWfJIwM7g2qnBfkZQvCwE+ccG
 28NA==
X-Gm-Message-State: APjAAAWr6YthpZSuk1oAKc0sVTcjDh1BjfTkI/fh0s4ZPmnjBahzevpb
 h6UJIgdTECqJFmpzcnn0WoZT3b54S8o=
X-Google-Smtp-Source: APXvYqweaH8/6iaeRnKligmYfGMnxbqkyWQFfrTD4mSllE/XHSPXJ4zhBHd7E1wNwvP0SXCvr5pn60EePmo=
X-Received: by 2002:a63:954f:: with SMTP id t15mr3477010pgn.137.1576680759818; 
 Wed, 18 Dec 2019 06:52:39 -0800 (PST)
Date: Wed, 18 Dec 2019 06:51:35 -0800
In-Reply-To: <20191218145136.172774-1-satyat@google.com>
Message-Id: <20191218145136.172774-9-satyat@google.com>
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
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
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
X-Headers-End: 1ihbAg-008mm8-TB
Subject: [f2fs-dev] [PATCH v6 8/9] f2fs: add inline encryption support
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
 fs/f2fs/data.c  | 65 +++++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c | 41 +++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a034cd0ce021..ad63aa30d0c7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -308,6 +308,33 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
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
@@ -491,6 +518,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
+	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+			       fio->page->index, fio, GFP_NOIO);
+
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
 		return -EFAULT;
@@ -678,12 +708,18 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
-						fio->new_blkaddr))
+	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
+				       fio->new_blkaddr) ||
+		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
+					      fio->page->index, fio))) {
 		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
+}
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+				       fio->page->index, fio,
+				       GFP_NOIO);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
@@ -735,8 +771,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
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
@@ -748,6 +787,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+				       fio->page->index, fio,
+				       GFP_NOIO);
 		io->fio = *fio;
 	}
 
@@ -791,11 +833,14 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
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
 
 	if (f2fs_need_verity(inode, first_idx))
@@ -1832,8 +1877,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
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
@@ -1973,6 +2019,9 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
+	if (fscrypt_inode_uses_inline_crypto(inode))
+		return 0;
+
 retry_encrypt:
 	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(fio->page,
 							       PAGE_SIZE, 0,
@@ -2147,7 +2196,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			f2fs_unlock_op(fio->sbi);
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
-			if (f2fs_encrypted_file(inode))
+			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(&fio->encrypted_page);
 			if (PageWriteback(page))
 				end_page_writeback(page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f..d96cfb74ba31 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -137,6 +137,9 @@ struct f2fs_mount_info {
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
index 5111e1ffe58a..0e9c2303e86f 100644
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
@@ -199,6 +200,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_alloc, "alloc_mode=%s"},
 	{Opt_fsync, "fsync_mode=%s"},
 	{Opt_test_dummy_encryption, "test_dummy_encryption"},
+	{Opt_inlinecrypt, "inlinecrypt"},
 	{Opt_checkpoint_disable, "checkpoint=disable"},
 	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
 	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
@@ -783,6 +785,13 @@ static int parse_options(struct super_block *sb, char *options)
 			f2fs_info(sbi, "Test dummy encryption mode enabled");
 #else
 			f2fs_info(sbi, "Test dummy encryption mount option ignored");
+#endif
+			break;
+		case Opt_inlinecrypt:
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+			F2FS_OPTION(sbi).inlinecrypt = true;
+#else
+			f2fs_info(sbi, "inline encryption not supported");
 #endif
 			break;
 		case Opt_checkpoint_disable_cap_perc:
@@ -1446,6 +1455,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 #ifdef CONFIG_FS_ENCRYPTION
 	if (F2FS_OPTION(sbi).test_dummy_encryption)
 		seq_puts(seq, ",test_dummy_encryption");
+	if (F2FS_OPTION(sbi).inlinecrypt)
+		seq_puts(seq, ",inlinecrypt");
 #endif
 
 	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_DEFAULT)
@@ -1474,6 +1485,9 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).test_dummy_encryption = false;
+#ifdef CONFIG_FS_ENCRYPTION
+	F2FS_OPTION(sbi).inlinecrypt = false;
+#endif
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
 
@@ -2328,6 +2342,30 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
 	*lblk_bits_ret = 8 * sizeof(block_t);
 }
 
+static bool f2fs_inline_crypt_enabled(struct super_block *sb)
+{
+	return F2FS_OPTION(F2FS_SB(sb)).inlinecrypt;
+}
+
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
@@ -2337,6 +2375,9 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
+	.inline_crypt_enabled	= f2fs_inline_crypt_enabled,
+	.get_num_devices	= f2fs_get_num_devices,
+	.get_devices		= f2fs_get_devices,
 };
 #endif
 
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38890E6DFE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4CNdptv7JMSLwi7qTHRaWjIYGnE204MlPtFJHnBi5o=; b=N3ghUz+44BLbcHJVuv3HZjXy6
	M+/8iqxigbS/XSAwyDXAbrymdw6k0lOTYRtnmp2259AJpfh2NnjFQ3L9JfMjHbvDdWjvh0nNFXqSk
	ISRlMAedrUDmB4FaTx07ocjeBXfREjIDd5kaMObUKsfTBVZncN/UWrMirwFECqAZspWW8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iP0Jj-0001CK-3s; Mon, 28 Oct 2019 08:23:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <32pa2XQYKANUJ1KP1K7FF7C5.3FD@flex--satyat.bounces.google.com>)
 id 1iP0Jd-0001AZ-Ri
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 08:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Je2tK/cj4wTX6JzO/38HbqzCHuS2GQAUkCJGvwCMB5o=; b=j0wu25dEhRbVV833O+r0bCvja
 n8LTO2MkUBVp6Ch197pYJWdIpuRfTcFhs9sJ1SZ43CsD/fLTZDcd6ypkMYyAL+f3twuauEZDWvgNb
 yytTKKc4LnmkbiGc9a2D+6hOg+0Lcgd20Kfqrtx9xT7ORY5/ArdZqWHoI0MCcHjCRgIGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Je2tK/cj4wTX6JzO/38HbqzCHuS2GQAUkCJGvwCMB5o=; b=ahzj1kZZsFcrbbdMjEX/KbmDtF
 g8kazehGaiFBtbb68bki2dToAz3Pg6xsc0iR3S0eBLMmr2x/HOrfUTd3T8GpZzNfkN2y99Ri7KPHc
 5viSZahZAXjAmX4tjMoHAu+7uKnH8RZnuhMtbahEnSZuFUF/0eflS3qPf/5RNAtIXbWs=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iP0Jc-003BDi-5F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 08:23:53 +0000
Received: by mail-pf1-f201.google.com with SMTP id v11so315964pfm.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2019 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Je2tK/cj4wTX6JzO/38HbqzCHuS2GQAUkCJGvwCMB5o=;
 b=AK4N6yQo4Pn0xpbQWr7fGwE2KgpxDrdb/K7wxh8C5xgeMoLkqVfQTvzlTY0DjTwqMB
 MzDbZ/sKoI3cZc0Z6ILWxI251cPgM9o8MSuBNMiaV6KYuBY5+M4CM/B0jCHak28SQuwE
 5RJ5OeQN3AhIvNBUvMXAbMRFT5SV9/Z7+HJdxgE75HSPU06FNxupFYxUZKqU68DmFfHK
 LKTpUGMIx34kTUsEkqlrVh443L6mA+v+Q9anf33YjXhHggOMg/HO8FkZzWxb4qJ2gAD6
 uD/jfKMxVyuaXqCGg3wE1OXovpBNiWuOEQOPtPZj08TqiUjPk7su0oq/0POfdMlvJUcC
 QDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Je2tK/cj4wTX6JzO/38HbqzCHuS2GQAUkCJGvwCMB5o=;
 b=GPEcKCqChvlwBIydm/Xys/keENPnVfYSWlnqe+WC6uTzbG1sn3VfN8r7dJxGbXog51
 kqqrsWv7snSehezZ5QfQMAqZs+gOraOHHnNooARBQRmwwVIPhC7Yj/Qg6N9Ai7p+LGqQ
 xbLRCrUebmJzaVvQRMFc4VOd/CqjEJByczPyZ/O1vcLcCC79aBoOCg6bu4exdX6rb0nP
 F3crhj+Jb1TgDCqQp0lbkMFIrzFfhJwaRfgTuY93fRlrIjbdSgnvpjQ4cw/WWzXT0Zg4
 +p9olsvk9fkQBg1IFTXYmhQpD1Qwwr6RjHRIx0u4obpGVJ+TQwxyleEKYxnfk6eBcjJj
 eX3w==
X-Gm-Message-State: APjAAAXqh893W1zQrY82sZ0420nsJWiNviWyIR61Ax7KwK7woDAl3hDt
 8KwOuw5U9lkKSQk8k7Qof/PzIuPJgls=
X-Google-Smtp-Source: APXvYqzAvkxwt92MM/xTqQy93H4FGyxOr+/D+EkAIxr0f/2SANtxWusUXJqBqp0P2xHUnHTp6OC7c6cm9M4=
X-Received: by 2002:a63:511f:: with SMTP id f31mr8624766pgb.204.1572247258496; 
 Mon, 28 Oct 2019 00:20:58 -0700 (PDT)
Date: Mon, 28 Oct 2019 00:20:31 -0700
In-Reply-To: <20191028072032.6911-1-satyat@google.com>
Message-Id: <20191028072032.6911-9-satyat@google.com>
Mime-Version: 1.0
References: <20191028072032.6911-1-satyat@google.com>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iP0Jc-003BDi-5F
Subject: [f2fs-dev] [PATCH v5 8/9] f2fs: add inline encryption support
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
 fs/f2fs/data.c  | 76 +++++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h  |  3 ++
 fs/f2fs/super.c | 20 +++++++++++++
 3 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5755e897a5f0..b5a7b540e630 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -306,6 +306,35 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	return bio;
 }
 
+static int f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
+				  pgoff_t first_idx,
+				  const struct f2fs_io_info *fio,
+				  gfp_t gfp_mask)
+{
+	/*
+	 * The f2fs garbage collector sets ->encrypted_page when it wants to
+	 * read/write raw data without encryption.
+	 */
+	if (fio && fio->encrypted_page)
+		return 0;
+
+	return fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
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
+		return true;
+
+	return fscrypt_mergeable_bio(bio, inode, next_idx);
+}
+
 static inline void __submit_bio(struct f2fs_sb_info *sbi,
 				struct bio *bio, enum page_type type)
 {
@@ -477,6 +506,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	struct bio *bio;
 	struct page *page = fio->encrypted_page ?
 			fio->encrypted_page : fio->page;
+	int err;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
@@ -489,6 +519,13 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
+	err = f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+				     fio->page->index, fio, GFP_NOIO);
+	if (err) {
+		bio_put(bio);
+		return err;
+	}
+
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
 		return -EFAULT;
@@ -556,14 +593,19 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
-						fio->new_blkaddr)) {
+	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
+				       fio->new_blkaddr) ||
+		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
+					      fio->page->index, fio))) {
 		__submit_bio(fio->sbi, bio, fio->type);
 		bio = NULL;
 	}
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
+				       fio->page->index, fio,
+				       GFP_NOIO | __GFP_NOFAIL);
 		bio_set_op_attrs(bio, fio->op, fio->op_flags);
 	}
 
@@ -629,8 +671,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
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
@@ -642,6 +687,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 			goto skip;
 		}
 		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
+		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+				       fio->page->index, fio,
+				       GFP_NOIO | __GFP_NOFAIL);
 		io->fio = *fio;
 	}
 
@@ -681,15 +729,23 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	struct bio *bio;
 	struct bio_post_read_ctx *ctx;
 	unsigned int post_read_steps = 0;
+	int err;
 
 	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES), false);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
+
+	err = f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
+	if (err) {
+		bio_put(bio);
+		return ERR_PTR(err);
+	}
+
 	f2fs_target_device(sbi, blkaddr, bio);
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
-	if (f2fs_encrypted_file(inode))
+	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 
 	if (f2fs_need_verity(inode, first_idx))
@@ -1726,8 +1782,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
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
@@ -1867,6 +1924,9 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
+	if (fscrypt_inode_uses_inline_crypto(inode))
+		return 0;
+
 retry_encrypt:
 	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(fio->page,
 							       PAGE_SIZE, 0,
@@ -2041,7 +2101,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			f2fs_unlock_op(fio->sbi);
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
-			if (f2fs_encrypted_file(inode))
+			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(&fio->encrypted_page);
 			if (PageWriteback(page))
 				end_page_writeback(page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4024790028aa..e04fda00b4ef 100644
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
index 851ac9522926..850a2a2394d8 100644
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
@@ -1438,6 +1447,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 #ifdef CONFIG_FS_ENCRYPTION
 	if (F2FS_OPTION(sbi).test_dummy_encryption)
 		seq_puts(seq, ",test_dummy_encryption");
+	if (F2FS_OPTION(sbi).inlinecrypt)
+		seq_puts(seq, ",inlinecrypt");
 #endif
 
 	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_DEFAULT)
@@ -1466,6 +1477,9 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).test_dummy_encryption = false;
+#ifdef CONFIG_FS_ENCRYPTION
+	F2FS_OPTION(sbi).inlinecrypt = false;
+#endif
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
 
@@ -2320,6 +2334,11 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
 	*lblk_bits_ret = 8 * sizeof(block_t);
 }
 
+static bool f2fs_inline_crypt_enabled(struct super_block *sb)
+{
+	return F2FS_OPTION(F2FS_SB(sb)).inlinecrypt;
+}
+
 static const struct fscrypt_operations f2fs_cryptops = {
 	.key_prefix		= "f2fs:",
 	.get_context		= f2fs_get_context,
@@ -2329,6 +2348,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.max_namelen		= F2FS_NAME_LEN,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
+	.inline_crypt_enabled	= f2fs_inline_crypt_enabled,
 };
 #endif
 
-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

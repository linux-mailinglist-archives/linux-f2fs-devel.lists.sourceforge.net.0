Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E764EFF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 00:56:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hSIhTAU/BMk4bTjINqF82SGuZ1pLR4rWEvw08qGurR4=; b=FbFIhc3ixI2ylu1ED/QpncwJM
	hncCWuaF35MIDihcYwnNlpOJFEfmMl3rJC8E812DnRa9/D10lab+8HXCPzjM7+9nn49UPplH2JcBH
	MFXmZlTA84NgNXxh0ZKYdKiW8QTDTJ8JOIoQ+Xka1/+gPsUjxLvBL6ab9uVwEACfh/zgU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlLW9-0003sw-4u; Wed, 10 Jul 2019 22:56:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3LW0mXQYKAJACuDIuD08805y.w86@flex--satyat.bounces.google.com>)
 id 1hlLW8-0003sp-Ih
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LUW76wulPtAQJ8tF39qY7tplldIIDt/m1N3Ol2sQlm4=; b=JrLURYe9FCoCSPz4iutWMh6WA
 51JsOdPoia+7nqu2gDeSyx4seTrdc/lsHxH9P0z/z5fbNzc38uwgwmReJe7SZkK7E7c1njDdzLTXu
 ShTuuCzEcKSuiAUo0OjHG/jCujbrTyDkv8u98CMVHBbDFGvf8Qx6WFu5GmDIfochQCK60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LUW76wulPtAQJ8tF39qY7tplldIIDt/m1N3Ol2sQlm4=; b=DpcpVodmlekZEY73eyVI7ZLYjt
 RAotqJXylkJaYWoplC+oLlbD3VXK8M/2rm/OZ8qbU3joSarog9Exyry1ecPbsvmwUxow+lMY8Epy+
 0BikAWDOX3Y3n0rKjE9f53UAiKGtcochl73tshQpx6g3zJcCQwdAW3B8nPEACXEQdits=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlLW7-00ERmF-7y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:52 +0000
Received: by mail-pl1-f202.google.com with SMTP id 91so2064926pla.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2019 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LUW76wulPtAQJ8tF39qY7tplldIIDt/m1N3Ol2sQlm4=;
 b=kho3XDqcjmOl8GDbw4318WLtIgRvB6gKjfbUaa7DKgW+XE8DUl+dZcSAoNp20MjToB
 15QtsLB/h7Kf8Mmovg6F7KOeJLDBlGCiyuTOAlF8H6ri/aQfWxLrFUtNXdIlTqI9PBuC
 GNGybI3Ps6EfquuIUvHCCXmW2W+FU647sue0RV9biZwfUpGfedOakHsQ9kH/kVSFDYcb
 e0MeRtRBh5lm7MMEANcnywoJk2cv/IOuxYZu+pemlXjWF3SwVC+0UGwIUB2LuJj8KQHq
 ZKIkQhZ0ebofXsn97/AhQ7scm4Vf+FIM3quhOFgQguZyBt6lVN/2/BXayvISrW++RMiR
 P4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LUW76wulPtAQJ8tF39qY7tplldIIDt/m1N3Ol2sQlm4=;
 b=Hoxz9eCBkBfhuw23pOdAN0v7eILryEPVI1Hgpk2aBHY5n35Iy6teNh34/FeumBQ6NG
 XY/FZEYYfLp16i9xM40TsSd4x6lYtOY76WPdUPMpoJUUeSpi37iWEn1q+k5FGJ/euLHT
 ZbE9TNXh5WmQmu4u/uXy3TB8IHyIqTP57RzBdD5S2NMpaYwxPDe9Ud1zc75KPlyzIo2H
 Pha2U4UA7TE/mF+lSyVZ3mPDLWPYhE4GqhJNw4CizFF/Y6rRJNdyvugXDMW1A/iGb8gg
 nle7OQMaI1JsSF/917EgLFE2fbZsX3phKx3XrjBAqtyjdywONBioPr7nPJhS776ndY3O
 nFjQ==
X-Gm-Message-State: APjAAAUcc6SWvJ62Z9rCKhj0XUpZP8Dx5WJBzP0ImlUqGx0Z97H8qJHs
 XcGdkIk9QqIIzCmm1TVl+nK9vkIBXvU=
X-Google-Smtp-Source: APXvYqw32IMJ529CC2GTWHf+cGlz2NO953GXJ0xYwvrMmv68MViep9809UYsLy0nOxUjV4tCHruZKCd7v/U=
X-Received: by 2002:a63:6981:: with SMTP id e123mr773006pgc.136.1562799405213; 
 Wed, 10 Jul 2019 15:56:45 -0700 (PDT)
Date: Wed, 10 Jul 2019 15:56:09 -0700
In-Reply-To: <20190710225609.192252-1-satyat@google.com>
Message-Id: <20190710225609.192252-9-satyat@google.com>
Mime-Version: 1.0
References: <20190710225609.192252-1-satyat@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hlLW7-00ERmF-7y
Subject: [f2fs-dev] [PATCH 8/8] f2fs: Wire up f2fs to use inline encryption
 via fscrypt
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Satya Tangirala <satyat@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/f2fs/data.c  | 83 +++++++++++++++++++++++++++++++++++++++++++++----
 fs/f2fs/super.c | 13 ++++----
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eda4181d2092..6fa947725fc2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -142,6 +142,8 @@ static bool f2fs_bio_post_read_required(struct bio *bio)
 
 static void f2fs_read_end_io(struct bio *bio)
 {
+	fscrypt_unset_bio_crypt_ctx(bio);
+
 	if (time_to_inject(F2FS_P_SB(bio_first_page_all(bio)),
 						FAULT_READ_IO)) {
 		f2fs_show_injection_info(FAULT_READ_IO);
@@ -165,6 +167,8 @@ static void f2fs_write_end_io(struct bio *bio)
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
+	fscrypt_unset_bio_crypt_ctx(bio);
+
 	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
 		f2fs_show_injection_info(FAULT_WRITE_IO);
 		bio->bi_status = BLK_STS_IOERR;
@@ -282,9 +286,18 @@ static struct bio *__bio_alloc(struct f2fs_sb_info *sbi, block_t blk_addr,
 	return bio;
 }
 
+static inline u64 inline_crypt_dun(struct inode *inode, pgoff_t offset)
+{
+	return (((u64)inode->i_ino) << 32) | lower_32_bits(offset);
+}
+
 static inline void __submit_bio(struct f2fs_sb_info *sbi,
 				struct bio *bio, enum page_type type)
 {
+	struct page *page;
+	struct inode *inode;
+	int err = 0;
+
 	if (!is_read_io(bio_op(bio))) {
 		unsigned int start;
 
@@ -326,7 +339,22 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
 	else
 		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
-	submit_bio(bio);
+
+	if (bio_has_data(bio)) {
+		page = bio_page(bio);
+		if (page && page->mapping && page->mapping->host) {
+			inode = page->mapping->host;
+			err = fscrypt_set_bio_crypt_ctx(inode, bio,
+						inline_crypt_dun(inode,
+								 page->index));
+		}
+	}
+	if (err) {
+		bio->bi_status = BLK_STS_IOERR;
+		bio_endio(bio);
+	} else {
+		submit_bio(bio);
+	}
 }
 
 static void __submit_merged_bio(struct f2fs_bio_info *io)
@@ -487,6 +515,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
 	struct page *bio_page;
+	struct inode *fio_inode, *bio_inode;
+	struct page *first_page;
+	u64 next_dun = 0;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
@@ -513,10 +544,28 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
 	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
 
+	fio_inode = fio->page->mapping->host;
+	bio_inode = NULL;
+	first_page = NULL;
+	next_dun = 0;
+	if (io->bio && bio_page(io->bio)->mapping) {
+		first_page = bio_page(io->bio);
+		bio_inode = first_page->mapping->host;
+		if (fscrypt_inode_is_inline_crypted(bio_inode)) {
+			next_dun = inline_crypt_dun(bio_inode,
+						    first_page->index) +
+				   (io->bio->bi_iter.bi_size >> PAGE_SHIFT);
+		}
+	}
 	if (io->bio && (io->last_block_in_bio != fio->new_blkaddr - 1 ||
 	    (io->fio.op != fio->op || io->fio.op_flags != fio->op_flags) ||
-			!__same_bdev(sbi, fio->new_blkaddr, io->bio)))
+			!__same_bdev(sbi, fio->new_blkaddr, io->bio) ||
+			!fscrypt_inode_crypt_mergeable(bio_inode, fio_inode) ||
+			(fscrypt_inode_is_inline_crypted(bio_inode) &&
+			 next_dun != inline_crypt_dun(fio_inode,
+						  fio->page->index))))
 		__submit_merged_bio(io);
+
 alloc_new:
 	if (io->bio == NULL) {
 		if ((fio->type == DATA || fio->type == NODE) &&
@@ -568,8 +617,9 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
-	if (f2fs_encrypted_file(inode))
+	if (fscrypt_needs_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
+
 	if (post_read_steps) {
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 		if (!ctx) {
@@ -1519,6 +1569,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 					struct f2fs_map_blocks *map,
 					struct bio **bio_ret,
 					sector_t *last_block_in_bio,
+					u64 *next_dun,
 					bool is_readahead)
 {
 	struct bio *bio = *bio_ret;
@@ -1592,6 +1643,13 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
 	}
+
+	if (bio && fscrypt_inode_is_inline_crypted(inode) &&
+	    *next_dun != inline_crypt_dun(inode, page->index)) {
+		__submit_bio(F2FS_I_SB(inode), bio, DATA);
+		bio = NULL;
+	}
+
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				is_readahead ? REQ_RAHEAD : 0);
@@ -1611,6 +1669,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 		goto submit_and_realloc;
 
+	if (fscrypt_inode_is_inline_crypted(inode))
+		*next_dun = inline_crypt_dun(inode, page->index) + 1;
+
 	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 	ClearPageError(page);
 	*last_block_in_bio = block_nr;
@@ -1644,6 +1705,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct f2fs_map_blocks map;
 	int ret = 0;
+	u64 next_dun = 0;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -1667,7 +1729,8 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 		}
 
 		ret = f2fs_read_single_page(inode, page, nr_pages, &map, &bio,
-					&last_block_in_bio, is_readahead);
+					&last_block_in_bio, &next_dun,
+					is_readahead);
 		if (ret) {
 			SetPageError(page);
 			zero_user_segment(page, 0, PAGE_SIZE);
@@ -1720,7 +1783,7 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
 	struct page *mpage;
 	gfp_t gfp_flags = GFP_NOFS;
 
-	if (!f2fs_encrypted_file(inode))
+	if (!fscrypt_needs_fs_layer_crypto(inode))
 		return 0;
 
 	/* wait for GCed page writeback via META_MAPPING */
@@ -1899,7 +1962,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 			f2fs_unlock_op(fio->sbi);
 		err = f2fs_inplace_write_data(fio);
 		if (err) {
-			if (f2fs_encrypted_file(inode))
+			if (fscrypt_needs_fs_layer_crypto(inode))
 				fscrypt_pullback_bio_page(&fio->encrypted_page,
 									true);
 			if (PageWriteback(page))
@@ -2617,6 +2680,8 @@ static void f2fs_dio_end_io(struct bio *bio)
 {
 	struct f2fs_private_dio *dio = bio->bi_private;
 
+	fscrypt_unset_bio_crypt_ctx(bio);
+
 	dec_page_count(F2FS_I_SB(dio->inode),
 			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
 
@@ -2633,12 +2698,18 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 {
 	struct f2fs_private_dio *dio;
 	bool write = (bio_op(bio) == REQ_OP_WRITE);
+	u64 data_unit_num = inline_crypt_dun(inode, file_offset >> PAGE_SHIFT);
 
 	dio = f2fs_kzalloc(F2FS_I_SB(inode),
 			sizeof(struct f2fs_private_dio), GFP_NOFS);
 	if (!dio)
 		goto out;
 
+	if (fscrypt_set_bio_crypt_ctx(inode, bio, data_unit_num) != 0) {
+		kvfree(dio);
+		goto out;
+	}
+
 	dio->inode = inode;
 	dio->orig_end_io = bio->bi_end_io;
 	dio->orig_private = bio->bi_private;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6b959bbb336a..2a7b3bae98aa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2223,12 +2223,13 @@ static bool f2fs_dummy_context(struct inode *inode)
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
-	.key_prefix	= "f2fs:",
-	.get_context	= f2fs_get_context,
-	.set_context	= f2fs_set_context,
-	.dummy_context	= f2fs_dummy_context,
-	.empty_dir	= f2fs_empty_dir,
-	.max_namelen	= F2FS_NAME_LEN,
+	.key_prefix		= "f2fs:",
+	.get_context		= f2fs_get_context,
+	.set_context		= f2fs_set_context,
+	.dummy_context		= f2fs_dummy_context,
+	.empty_dir		= f2fs_empty_dir,
+	.max_namelen		= F2FS_NAME_LEN,
+	.inline_crypt_supp	= true,
 };
 #endif
 
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6FA3686F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 01:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y+kkxd2rx1I1p+nhAX4h2J6xB68bdlSvP0oddutqw94=; b=TP0h9hNwpMphygaw2wB5eZQQA
	1ztAFc1qNxBJD8hWsqzkCJ4/fY5pV6JbKgY/YIh58c3czZBS9LmqsY7wnTXhUPX2iMCOy0gRt9Yxf
	i6KmyuxED42PRzbwccFEghls8T0AWVe9xpJkXwvPsEJjO0EVSAteZVc5TM31ePN3/aIxc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYfmr-0005xQ-7N; Wed, 05 Jun 2019 23:57:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3RlD4XAYKALUnVotVobjjbgZ.Xjh@flex--satyat.bounces.google.com>)
 id 1hYfmp-0005xI-7f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IFpE5yY4uVy5eFXAmN1frsf7z5fTOKO1cmVK9sZaWVc=; b=XrLv+G2EVcuXeRxsvJ6yLuFcO
 LSt/AaOux7KeVRV6ikPG7YpymM2xpnjEqoacXNISW54vRkqoOMGzT49vsd043O6DAmJMNGMB9B2Wf
 TpIUWB5/zkKLmt6EzLGn3TMoxtBAfaZm2Lz0vcKHfBoCrFUR+FnZ1Ul7URlEn4p3L2eXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IFpE5yY4uVy5eFXAmN1frsf7z5fTOKO1cmVK9sZaWVc=; b=L9gij6E1wAhpWKtrxKNdI9THl9
 ubuoZMPX9rTNJ8arYky6nvkVwxa7MtLkGGrbXJTo+iKIzhy9EPHHGgbe7eBBGPAi9tqLumXplfqNG
 HbyQRN4nQGpzA9/crXTD2pYw1ZUJFiCxtHMJgD+45abQPd8UtqVLvqdWKQVVmF7I41fM=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYfmn-00BDvZ-TW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:57:43 +0000
Received: by mail-pl1-f201.google.com with SMTP id i3so341498plb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2019 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=IFpE5yY4uVy5eFXAmN1frsf7z5fTOKO1cmVK9sZaWVc=;
 b=FU8rnwe1RegyvrOecsJEpG1pFQI4RUd1Vo1UIoIR/SrsVO41rWV6cbVPHlVWDb0v7B
 z0kmjgINHwJPLmeAyFbuf8K1xWTRBYbt/mv7lg4uuGqr0OxoCg+7nkCKGgkLLjAZNo6w
 0yIEwWTHEQRcrBpFxvJpsJkFnIdnbKmITJaZHaSuIGjY0akBDFK7E7gjWWqfQZGlTziO
 q1bjOfoBiNfAIIyYGTYb2wh1SASy6ipB+5MebW9rxKc1346omXSSLOjJFXvfyjXZK6fu
 BZ4DotlesX6doWgd5LqUXcXJ6AxeiEN6sq+RzhXUmiPrMWABtugBhDRlja86zAVld5oJ
 NPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IFpE5yY4uVy5eFXAmN1frsf7z5fTOKO1cmVK9sZaWVc=;
 b=KlEt7tcyZqkXCEeAWmXW2dBQ5qosWc7aTYthQD8Yc4tRiJXuxMzzUJCrsbsmJkTVxs
 aTdGbq3P9/hEhVOvwgyhAzHVE8j5NznkbNwWTI9pgus6BbEV/VhxaOWs0veCyg5nCh/C
 zmaVxwboifPLku6LSG9mU8hkZFZno9ri6Msx1TNA92dCYtbsmYCHPqbOwAHJn1Uc+68R
 oVx5yOlt0IwWXH2rkdNnVLX8wY3fgCeIbNAXyBHi5wk+hWovpEgmrJsg4xsulo8VU7Is
 sACDvcqnS4S+qgH4GsiZadjttQzvGGWvYfT420rIslL8FYprZtgaV/j/Bu9sFvHPuPFJ
 mZDA==
X-Gm-Message-State: APjAAAV5VItFJ3LckMhgvhXkoA1mnNXbIFvqoH+m4NT0T1aqnjbw+3Pe
 cSbuCy7DwiEFWr5JdEupMaDwivXssU8=
X-Google-Smtp-Source: APXvYqwCyWWOaof96qMS2G9ax3JA8Spbk2YLf/KWQHCJlpezMKSHXZq/bfr1w/bkaJPp4DPNAoIaOhJw/dY=
X-Received: by 2002:aca:f582:: with SMTP id t124mr2372182oih.71.1559777350673; 
 Wed, 05 Jun 2019 16:29:10 -0700 (PDT)
Date: Wed,  5 Jun 2019 16:28:37 -0700
In-Reply-To: <20190605232837.31545-1-satyat@google.com>
Message-Id: <20190605232837.31545-9-satyat@google.com>
Mime-Version: 1.0
References: <20190605232837.31545-1-satyat@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hYfmn-00BDvZ-TW
Subject: [f2fs-dev] [RFC PATCH v2 8/8] f2fs: Wire up f2fs to use inline
 encryption via fscrypt
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
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/f2fs/data.c  | 77 ++++++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/super.c |  1 +
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eda4181d2092..25e691947fb4 100644
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
 
+static inline u64 hw_crypt_dun(struct inode *inode, pgoff_t offset)
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
+						hw_crypt_dun(inode,
+							     page->index));
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
 
@@ -513,10 +544,27 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
 	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
 
+	fio_inode = fio->page->mapping->host;
+	bio_inode = NULL;
+	first_page = NULL;
+	next_dun = 0;
+	if (io->bio && bio_page(io->bio)->mapping) {
+		first_page = bio_page(io->bio);
+		bio_inode = first_page->mapping->host;
+		if (fscrypt_inode_is_hw_encrypted(bio_inode)) {
+			next_dun = hw_crypt_dun(bio_inode, first_page->index) +
+				   (io->bio->bi_iter.bi_size >> PAGE_SHIFT);
+		}
+	}
 	if (io->bio && (io->last_block_in_bio != fio->new_blkaddr - 1 ||
 	    (io->fio.op != fio->op || io->fio.op_flags != fio->op_flags) ||
-			!__same_bdev(sbi, fio->new_blkaddr, io->bio)))
+			!__same_bdev(sbi, fio->new_blkaddr, io->bio) ||
+			!fscrypt_inode_crypt_mergeable(bio_inode, fio_inode) ||
+			(fscrypt_inode_is_hw_encrypted(bio_inode) &&
+			 next_dun != hw_crypt_dun(fio_inode,
+						  fio->page->index))))
 		__submit_merged_bio(io);
+
 alloc_new:
 	if (io->bio == NULL) {
 		if ((fio->type == DATA || fio->type == NODE) &&
@@ -568,7 +616,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
-	if (f2fs_encrypted_file(inode))
+	if (f2fs_encrypted_file(inode) && !fscrypt_inode_is_hw_encrypted(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 	if (post_read_steps) {
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
@@ -1519,6 +1567,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 					struct f2fs_map_blocks *map,
 					struct bio **bio_ret,
 					sector_t *last_block_in_bio,
+					u64 *next_dun,
 					bool is_readahead)
 {
 	struct bio *bio = *bio_ret;
@@ -1592,6 +1641,13 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		__submit_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
 	}
+
+	if (bio && fscrypt_inode_is_hw_encrypted(inode) &&
+	    *next_dun != hw_crypt_dun(inode, page->index)) {
+		__submit_bio(F2FS_I_SB(inode), bio, DATA);
+		bio = NULL;
+	}
+
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				is_readahead ? REQ_RAHEAD : 0);
@@ -1611,6 +1667,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 		goto submit_and_realloc;
 
+	if (fscrypt_inode_is_hw_encrypted(inode))
+		*next_dun = hw_crypt_dun(inode, page->index) + 1;
+
 	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 	ClearPageError(page);
 	*last_block_in_bio = block_nr;
@@ -1644,6 +1703,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct f2fs_map_blocks map;
 	int ret = 0;
+	u64 next_dun = 0;
 
 	map.m_pblk = 0;
 	map.m_lblk = 0;
@@ -1667,7 +1727,8 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
 		}
 
 		ret = f2fs_read_single_page(inode, page, nr_pages, &map, &bio,
-					&last_block_in_bio, is_readahead);
+					&last_block_in_bio, &next_dun,
+					is_readahead);
 		if (ret) {
 			SetPageError(page);
 			zero_user_segment(page, 0, PAGE_SIZE);
@@ -2617,6 +2678,8 @@ static void f2fs_dio_end_io(struct bio *bio)
 {
 	struct f2fs_private_dio *dio = bio->bi_private;
 
+	fscrypt_unset_bio_crypt_ctx(bio);
+
 	dec_page_count(F2FS_I_SB(dio->inode),
 			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
 
@@ -2633,12 +2696,18 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 {
 	struct f2fs_private_dio *dio;
 	bool write = (bio_op(bio) == REQ_OP_WRITE);
+	u64 data_unit_num = hw_crypt_dun(inode, file_offset >> PAGE_SHIFT);
 
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
index 6b959bbb336a..6399373777ce 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2229,6 +2229,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.dummy_context	= f2fs_dummy_context,
 	.empty_dir	= f2fs_empty_dir,
 	.max_namelen	= F2FS_NAME_LEN,
+	.hw_crypt_supp	= true,
 };
 #endif
 
-- 
2.22.0.rc1.311.g5d7573a151-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

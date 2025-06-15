Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A51ABADA23D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Jun 2025 17:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcBmA49aX3TIVbkMq5afAU+cHvjeqY9ffBH5q5FkuSc=; b=IZfWGTj7sbhwW1RSrkjfyZ+bO7
	asA9pR3o7OX7DsAu5N7IwKQJKPeUjrWEj+X1yB21uvDsXvsRFSeDFsV2bA9WvAP8GD7fqRiwAHRnj
	nGVDxwHkPbQP4r7FkTYmuismv5tuiZw5GsnhHUtEgfFqO3fjJ99UPttDIDUxiBxEJXVk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQown-0000u2-M9;
	Sun, 15 Jun 2025 15:07:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <349tOaAcKACA8DQHHAACKKCHA.8KI@flex--chullee.bounces.google.com>)
 id 1uQowm-0000to-6x for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=; b=Tr+K/wQuU2v1Yo1WyeRbILcO//
 D2SJMnHmN/UmZPqQthwtDxHylUJewxQjRbqRwQH7D43ILjLMeFJ4gnL8fPSfPkj7P3MVLzeweJlQr
 4d09ovmzYH7TKXl9Gs/njZyPUxwf8HOvyOmaykGX5KW9Wah+8nQNbHpR+blEP4Qbwgqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=; b=cyZgCHH8v73xglvhd0Q+D2LveB
 J+2x1jt5ff4rqV17kVrQjSIYV0qvHS9cEpgFviJkRafuYpvUI6pPDEedLXeGaaRZNY33d+F12TUAN
 1uvxA5KW0WJIsKAy8FHYQQxr+Wazp0FUMMFfkuVIwDZbu07FaAYiGxQ0rRTGPmKbeoss=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQowl-0004YX-PU for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:07:00 +0000
Received: by mail-ot1-f73.google.com with SMTP id
 46e09a7af769-739f234f43bso3750128a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jun 2025 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750000014; x=1750604814;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=;
 b=RBPjAg1x1k/QXy5X02sVPGdlGJjKA9Cp7Uqad91fDb3EUi2gZ2SFeudmFWaW13p1Fb
 sblFMunabpPzCyM3JDrdvGbLJ24G8Gy0MdGfdJl9Z9rmsKYhtsvHcXPM2MM78Q+NJSVG
 dME6x2Dlo5zfusKbEXDiS1GHc5JDf3Cxfeh06H2bFXWKo9Jim+PX9nybASrZVJm3sM3D
 lYneZlKw+IodpZUa1wfTo/82/9wB70AdUQxHzY7qUFcr/YBApRZP9qTFpyx1HF0L62Hv
 A/3deSv122nms6UaoymCsHJUSoYEJwHT4GgE0nYFbiUsEgQE0tNIi+itS/GaLvG6xXjN
 Nqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750000014; x=1750604814;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=;
 b=HN4jhM05VmYizp6tUTHZYZ8zQif6WN0ofVBJyd7uJpjfMHACNwqH2Dz7dsP9KQYeye
 /87e/jbae3ba1LhPDGjSia0Uy2K2ePsV/zq/YfMDYfKhu6UdDHln26I90GKwhT5PLT2R
 X4Pgjm77ex2bUCyYBx62a/VRo/hPFZiZFAGZ60584i87/PS46CH9h5elNDdAl05Mmzk0
 7/tVKxdJgsXyt2G4grhfEe8fgRessI/8FaJ0CO0JH2e0dH8+gafCNrWya8iQ+biJa5PL
 NdTxIdO1DCZNOXZWDFL2faUJ8RBhxmKE6kDelCmUvvIhLTvaGssSGHeyO/WwM/UseL5n
 L1jQ==
X-Gm-Message-State: AOJu0Yy5pDaFmv5WyG+CYDQFC3IeU6/KeBhoAfS9FAywHEj2MOu7f8w5
 ol3ppAAxR1sfA5Nbe/Fd+RPEwNXAWgWPRigVGbGK4eONv92jvxxQMJbQHQ1UJin28eognD9x7ht
 jadr/s17j5A==
X-Google-Smtp-Source: AGHT+IHzP7AUKodFfcUQEoSRgZ1jidwGwp2ewdXVIHXUuxsVHg64QnNNcwNp4YCCkeylIh30mSg5nKzfGvto
X-Received: from pfjc11.prod.google.com ([2002:a05:6a00:8b:b0:746:2e25:5c93])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c9:b0:748:2d1d:f7b3
 with SMTP id d2e1a72fcca58-7489d008a33mr7049901b3a.22.1749998563600; Sun, 15
 Jun 2025 07:42:43 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:34 -0700
In-Reply-To: <20250615144235.1836469-1-chullee@google.com>
Mime-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-2-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined
 by f2fs_io_flags(), were not being applied to direct I/O (DIO) writes. This
 meant that DIO writes would not respect filesystem-level hints (f [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uQowl-0004YX-PU
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
This meant that DIO writes would not respect filesystem-level hints
(for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).

This patch refactors f2fs_io_flags() to use a direct inode pointer
instead of deriving it from a page. The function is then called from
the DIO write path, ensuring that bio flags are handled consistently
for both buffered and DIO writes.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/data.c | 10 +++++-----
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 11 +++++++++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..71dde494b892 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
-static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
-	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
 
-	if (fio->type == DATA &&
-	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+	if (inode && fio->type == DATA &&
+	    F2FS_I(inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
 		op_flags |= REQ_PRIO;
 
 	return op_flags;
@@ -459,10 +458,11 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	struct block_device *bdev;
 	sector_t sector;
 	struct bio *bio;
+	struct inode *inode = fio->page ? fio->page->mapping->host : NULL;
 
 	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
 	bio = bio_alloc_bioset(bdev, npages,
-				fio->op | fio->op_flags | f2fs_io_flags(fio),
+				fio->op | fio->op_flags | f2fs_io_flags(fio, inode),
 				GFP_NOIO, &f2fs_bioset);
 	bio->bi_iter.bi_sector = sector;
 	if (is_read_io(fio->op)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..3e02687c1b58 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3972,6 +3972,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode);
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..3eb40d7bf602 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5015,6 +5015,17 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
+	/* if fadvise set to hot, override the temperature */
+	struct f2fs_io_info fio = {
+		.sbi = sbi,
+		.type = DATA,
+		.op = REQ_OP_WRITE,
+		.temp = file_is_hot(inode) ? HOT : temp,
+		.op_flags = bio->bi_opf,
+		.page = NULL,
+	};
+	bio->bi_opf |= f2fs_io_flags(&fio, inode);
+
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
 	submit_bio(bio);
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

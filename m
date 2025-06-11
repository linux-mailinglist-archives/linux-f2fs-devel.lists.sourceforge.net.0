Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B02AD6430
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 02:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O0yu2uU6wMrVpYn97nkagjuIrHapHPwNdUEodlQohA=; b=XvYLNs3Rf/EoCrli0nhSnfpiG8
	WD4lt9QNQOX09To5QREa7A0XWH68DpnG3CLP2tfKr5zU9tLWfcj+NsMwq61F+pr89w2tReXo+wBV3
	xgWgWN+5VhJY/VgFA9E4G5AEmIhrmXSjrd79E/hug2HjcXab3C7d8dTXDuO4DtbBW0RM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPVPD-0005Fd-Ug;
	Thu, 12 Jun 2025 00:02:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jRNKaAcKACYEJWNNGGIQQING.EQO@flex--chullee.bounces.google.com>)
 id 1uPVPC-0005FX-1J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=; b=c7yZ2JS7tMLdQsAcU4ZRa1ZK/F
 sHGjuOkB6xcSJpcIip5e8dXM+6YTMEH+Kcvj/FiQOoC0to1F73qDaSaXsSgAUIqtpfILR6TveOUq2
 wpcO6sRIdGy7q+QerXRXXmTnT4wj0N3c+pqVa3xut8PtaeiXAUY5xOdq5jNo6CktiQEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=; b=h517VKMq8LY3QvNlX3oaNHbOBy
 fXmY4zOhQ/I00d6c8WAeW3xTtQ3zOPuYM637AK2f2H805I+zYHwSbroeYLnBtF4KWMN2koUPnplfx
 1jtoqF9dqpGAkwZfsynGlJnyICDtpZ5CMBipaLlf/W4Ugo4FtSTZ6BKSzQrXI3V4hH9M=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPVPB-0005IO-Id for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:02:53 +0000
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-235e3f93687so4314595ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jun 2025 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749686563; x=1750291363;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=;
 b=LVmFqMURMqRIBBELPu6H4gMpCL8DRiguDxor0Px8ibJ6ijbcaz60eqejw2FOaNq1h0
 1KDFGA0f6yNYAXavCyhM6lDHK9tOQCvHMhdK7x1w+IrecyE/o1CGRhawVnmDIIQZCH/h
 s0FckMzK4Ov51vvzkq/7fR0wzEohUlQuO9XepIiQFwv5KhiYg2vJIT2BeWmXL1Zb8RBa
 cY6bVIaNDEl2CNHQx2zTo38PKGB52mZbdopIxJRa1/o1m9/NzZtkzURgJSINmCt+/Cq4
 pZw6rq1vQ3hlSb8ccCB0JZF6OCN/AsMUuk5wJqokLRIww2LbcR2BCIahNsM9FrolYJ0P
 Wn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749686563; x=1750291363;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=;
 b=ZV8D+j2RjCMcTU3T4dp1izcrGm4AlHt1BlI4uwqApJlk67hBbWezXx8vKHxc7SxQba
 vgbfi77/s2uxjxpZEV2Bt7Q4Vz+HdmnQfkE1t2XWR/RGjmZWzY+tK0jwFlQg6z4Fin4g
 BXc6BFQrUcdAPhHdmRzT/zxDBPj9oOdRSAOil468iaFP7Ncr7IHZi27skWjWzyLQuBz1
 zz6fDOEr1K54ZNlViBy/IrFM/Wnj85thukeAhIU+rf9LOn1a3wWaHtbtwnOe/DbRMmrg
 zhbOed/pJ6JOKgVyeFWdERZfYCv9tuZyzR0dmDjqAvoJgkwL4jDpZ4G6NOFm9d7IabnE
 XxIg==
X-Gm-Message-State: AOJu0YzY0rJBcp02Nshsg9rcaLZgWi4Zuk2m9WQHQ+fWNj4zNRZ9jVCW
 lSfgOTV+1/OsK/1RU9TC3pyWDjwBg8vS33NLO0MkTESijzewRUMISePOSu6w/ROHPctsbFlMN+E
 gnWeQ4s57/w==
X-Google-Smtp-Source: AGHT+IH525RHk7TKEj1hUHKOafM1gtCu87+O6jYclIwLkjc6aiNko3Kn8b5jCg8kjhrgWjnMnklTsPnuEiJg
X-Received: from plbmn13.prod.google.com ([2002:a17:903:a4d:b0:231:cb69:764d])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:a509:b0:235:ea29:28da
 with SMTP id d9443c01a7336-2364c8d0c21mr12020205ad.17.1749685133982; Wed, 11
 Jun 2025 16:38:53 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:05 -0700
In-Reply-To: <20250611233706.572784-1-chullee@google.com>
Mime-Version: 1.0
References: <20250611233706.572784-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-2-chullee@google.com>
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
 [209.85.214.201 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uPVPB-0005IO-Id
Subject: [f2fs-dev] [PATCH 1/2] f2fs: Apply bio flags to direct I/O
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
 fs/f2fs/data.c |  8 ++++----
 fs/f2fs/f2fs.h |  2 ++
 fs/f2fs/file.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..966cea75874c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
-static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
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
+	if (fio->inode && fio->type == DATA &&
+	    F2FS_I(fio->inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
 		op_flags |= REQ_PRIO;
 
 	return op_flags;
@@ -2783,6 +2782,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	int err = 0;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
+		.inode = inode,
 		.ino = inode->i_ino,
 		.type = DATA,
 		.op = REQ_OP_WRITE,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..162d79a3c1a5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1233,6 +1233,7 @@ enum iostat_type {
 
 struct f2fs_io_info {
 	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
+	struct inode *inode;
 	nid_t ino;		/* inode number */
 	enum page_type type;	/* contains DATA/NODE/META/META_FLUSH */
 	enum temp_type temp;	/* contains HOT/WARM/COLD */
@@ -3972,6 +3973,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio);
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..4fd45e94661a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5015,6 +5015,18 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
+	/* if fadvise set to hot, override the temperature */
+	struct f2fs_io_info fio = {
+		.sbi = sbi,
+		.inode = inode,
+		.type = DATA,
+		.op = REQ_OP_WRITE,
+		.temp = file_is_hot(inode) ? HOT : temp,
+		.op_flags = bio->bi_opf,
+		.page = NULL,
+	};
+	bio->bi_opf |= f2fs_io_flags(&fio);
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

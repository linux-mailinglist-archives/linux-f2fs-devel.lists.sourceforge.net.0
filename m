Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF07B333C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0BCxLWBfvfgj4xlEcTAdvGgFzTYiY9FRNSUsV/EMSQ=; b=Oqt988xHAXfDYxlhnMP4D1Wh0i
	AyZu4xvFkIs+t9oy47j4Fc6tnqklKMQbS4LQMWrvb6DdXOYZQ+ziOpZnZkY1dHZZJ/PRKqKdMlopv
	HdqroQx5VlHgMF1tWOeoPDNhCUHEcoEPz2uyrf10w/hmTy2elKU9C/gZQvSpvhdphGEM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRn-0004ai-OO;
	Mon, 25 Aug 2025 01:56:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRm-0004aY-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lGY0K+z2Vr3Oj91UnlN3aMgFpkE79SFm6YSj3+iugxA=; b=BJTDljo8JZh6juB6//GxpViAX2
 yboFlJGFw9LXqGgOwuAtq58JyJhSvNiKTyNmh/tbLhfwCveYG3saBQxTlb25rWCw6SlJyJpbUk7pJ
 XR+uEVVthaDLxkia+kYGcOYDQUJ5UHmjNGft2NCeZYSNFi8d/hTEcXrJlAYtxHvjNOac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lGY0K+z2Vr3Oj91UnlN3aMgFpkE79SFm6YSj3+iugxA=; b=FNOkNZQwK+BAWieQCVfFeFKiCp
 +4sZg6hg7jOcwN8Cw9ovlYrGxJahp05PmpMr8JW3JMFiV1bf1T2y0qfArRC2zpgfjrZDfsvrPUKus
 PgCig6iFGY4ZZQxrH0Ag2CMkpa+/60OrUHYXttCfrvuezBdkhHBfKI4gWT2HXf3ytqvM=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRl-0002qW-CT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:34 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b482fd89b0eso3096190a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086983; x=1756691783; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGY0K+z2Vr3Oj91UnlN3aMgFpkE79SFm6YSj3+iugxA=;
 b=bTiCUfu92lhlfVDAIufg2Wv8eZqrZMX9uKuWS1REk0FrueEA9Msqv4nZ+hvCBNasoZ
 9g9xolzFQCJF77xiOwD7cJYVFnFxqNq5XVqYLuqZmVZ8eaO1HCRdPgDXgwoWyuzXDSw3
 ZRxdchXSimUI7b4khfe3ufLTiBPd8o/b7mCN52iblu2h+RAdaipZZY1q8IsUEITNLk4F
 zG1WoJjIhkB45UfvHNiFfiIOm8XztJzF19CGL7BEblDMCxMhNYlQtddTYElLwn0WttsV
 kf+FwdcojVQW6q0HtdLDzekWUeRzsQweW+V8oDj//cdnSLbqDj5+iqjxL+l/m6MoV72n
 zhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086983; x=1756691783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lGY0K+z2Vr3Oj91UnlN3aMgFpkE79SFm6YSj3+iugxA=;
 b=iQ33V8xPi4Sx1mvSJypX85wkO3ZZBpbUMyGNSMHeIRAZzchE27euvqo/EdsiUPtnxU
 /xW3PDzXXhf2T8PueaOBXRhz2mrGOJkOyZVMiNIwFSj7sl43WPGCpcfxljy+lDLLToy4
 P6TMCpoGBiMsiiAW984FTuyq+kUSCmw92R1UAZIT2J4GUXPKeSkeA3pqyfo18U2TWUm/
 kKKtiytpjOp8sdZoS0znEt3BFqSxd9KlD5Aekzh1TQb6uVyebbmxiKSwuWMiPt5XEUzg
 uLkbUB6E2XX6f6ybPPaI/JHBhgMKW4WfYtGSPBWvmwIrPRuDT8r6I1OSCAWJtn0oODaf
 MtKg==
X-Gm-Message-State: AOJu0Yxwv9LzTHlQ+X1PTM3QONn90C1gF5xa7BxehM8jZXUYcqhCALGF
 dYHeyC2s7qasdGHbh2xMEr3RoHKFWDDFxhzIiSiMzFrFUeGfgRGKhf8x
X-Gm-Gg: ASbGncvZNDIzCijBtr2RPfXycXToPVUIcJqQRdZ24cESQoDcrWUHI7E5Wjo2IQtJrLM
 0ILRaKt14e5eLNCcnBOULHEIm2CoeFXmJFolLPh2V4WDORDU94fEpsSbPlmBj+e4TwJ2ReF8pc0
 TVu9+XgXmfK+3pOjsIFJnRasEUbvG9FTy0fEQTN7wJwHrsh8H3lKdVlSwt7+olHxaXmD7VAtZ3A
 9No3Cc8hyTO0hrEEUt5IIl9ZkqHkdCzoYK0YugbPDMlRgNWFz/P88gpdpNTouR2OtHcUuuq11Fr
 LzqSTbtJwAPfZhPSXcfQmEVZ5n0cQx+w8pgXGI5el72lgxlgRX21mq+38WHojXbCHE77iU25okM
 bQmBukssSXUWB5SaaDgQJTv48ah8T
X-Google-Smtp-Source: AGHT+IHxeaOo/iHsDfh9XqiYNfEQTUjm5hozH6/IGNI3247LfMr/015gl84Hwumb/6rDdjFKKXXFiQ==
X-Received: by 2002:a05:6a20:4310:b0:232:7628:9968 with SMTP id
 adf61e73a8af0-24340ab3128mr13903671637.1.1756086982690; 
 Sun, 24 Aug 2025 18:56:22 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:22 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:52 +0800
Message-ID: <20250825015455.3826644-11-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong The following members are added to inject
 more fields in cp: * next_blkaddr: inject fsync dnodes 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRl-0002qW-CT
Subject: [f2fs-dev] [PATCH v4 10/13] inject.f2fs: add members in inject_cp
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

The following members are added to inject more fields in cp:

* next_blkaddr: inject fsync dnodes

  An error is returned if no fsync dnode is found.
  Furthermore, the injection is not supported on a zoned device. This
  is because fsync dnodes must remains at the end of current warm node
  segment, any dnode change causes all previous dnodes in the chain to
  be updated out-of-place, and there may not have enough space left in
  the curseg. To simplify the injection, it returns an error on the
  zoned device.
  An example of dnode chain shows:
    [inject_cp: 608] [   0] blkaddr:0x1204
    [inject_cp: 608] [   1] blkaddr:0x1205
    [inject_cp: 608] [   2] blkaddr:0x1206
    [inject_cp: 608] [   3] blkaddr:0x1207
    [inject_cp: 608] [   4] blkaddr:0x1208
    [inject_cp: 608] [   5] blkaddr:0x1209
    [inject_cp: 608] [   6] blkaddr:0x120a
    [inject_cp: 608] [   7] blkaddr:0x120b
    [inject_cp: 608] [   8] blkaddr:0x120c
    [inject_cp: 608] [   9] blkaddr:0x120d
  where `0' indicates next free blkaddr of warm node curseg, thus
  start blkaddr + next_blkoff of warm node curseg, which cannot be
  injected. `1~9` indicate next_blkaddr in node_footer of dnodes in
  the chain, which can be injected.

* alloc_type: inject curseg's alloc type
* crc: inject cp's checksum
* elapsed_time: inject cp's mount elapsed time

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v4: * update manual page
v3: * update commit message to show dnode chain and the injectable range
    * free(node) before return
---
 fsck/fsck.h       |  4 ++-
 fsck/inject.c     | 86 ++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/mount.c      | 18 +++++-----
 man/inject.f2fs.8 | 14 +++++++-
 4 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 40cb6d9a6417..05daa2de9531 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -223,6 +223,8 @@ extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
 extern int f2fs_do_mount(struct f2fs_sb_info *);
 extern void f2fs_do_umount(struct f2fs_sb_info *);
 extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
+extern int f2fs_find_fsync_inode(struct f2fs_sb_info *, struct list_head *);
+extern void f2fs_destroy_fsync_dnodes(struct list_head *);
 
 extern void flush_journal_entries(struct f2fs_sb_info *);
 extern void update_curseg_info(struct f2fs_sb_info *, int);
@@ -239,7 +241,7 @@ extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
 extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
-			struct f2fs_checkpoint *cp, int which);
+			struct f2fs_checkpoint *cp, int which, bool update_crc);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
 			struct f2fs_node *);
diff --git a/fsck/inject.c b/fsck/inject.c
index 5ca105b60f8e..272a4a64dc05 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -151,6 +151,10 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
 	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+	MSG(0, "  alloc_type: inject alloc_type array selected by --idx <index>\n");
+	MSG(0, "  next_blkaddr: inject next_blkaddr of fsync dnodes selected by --idx <index>\n");
+	MSG(0, "  crc: inject crc checksum\n");
+	MSG(0, "  elapsed_time: inject elapsed_time\n");
 }
 
 static void inject_nat_usage(void)
@@ -456,6 +460,7 @@ out:
 static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 {
 	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	bool update_crc = true;
 	char *buf = NULL;
 	int ret = 0;
 
@@ -534,6 +539,85 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
 		    (u16)opt->val);
 		set_cp(cur_data_blkoff[opt->idx], (u16)opt->val);
+	} else if (!strcmp(opt->mb, "alloc_type")) {
+		if (opt->idx >= MAX_ACTIVE_LOGS) {
+			ERR_MSG("invalid index %u of cp->alloc_type[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject alloc_type[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, cp->alloc_type[opt->idx],
+		    (unsigned char)opt->val);
+		cp->alloc_type[opt->idx] = (unsigned char)opt->val;
+	} else if (!strcmp(opt->mb, "next_blkaddr")) {
+		struct fsync_inode_entry *entry;
+		struct list_head inode_list = LIST_HEAD_INIT(inode_list);
+		struct f2fs_node *node;
+		block_t blkaddr;
+		int i = 0;
+
+		if (c.zoned_model == F2FS_ZONED_HM) {
+			ERR_MSG("inject fsync dnodes not supported in "
+				"zoned device\n");
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		if (!need_fsync_data_record(sbi)) {
+			ERR_MSG("no need to recover fsync dnodes\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ret = f2fs_find_fsync_inode(sbi, &inode_list);
+		if (ret) {
+			ERR_MSG("failed to find fsync inodes: %d\n", ret);
+			goto out;
+		}
+
+		list_for_each_entry(entry, &inode_list, list) {
+			if (i == opt->idx)
+				blkaddr = entry->blkaddr;
+			DBG(0, "[%4d] blkaddr:0x%x\n", i++, entry->blkaddr);
+		}
+
+		f2fs_destroy_fsync_dnodes(&inode_list);
+
+		if (opt->idx == 0 || opt->idx >= i) {
+			ERR_MSG("invalid index %u of fsync dnodes range [1, %u]\n",
+				opt->idx, i);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		MSG(0, "Info: inject next_blkaddr[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, blkaddr, (u32)opt->val);
+
+		node = malloc(F2FS_BLKSIZE);
+		ASSERT(node);
+		ret = dev_read_block(node, blkaddr);
+		ASSERT(ret >= 0);
+		F2FS_NODE_FOOTER(node)->next_blkaddr = cpu_to_le32((u32)opt->val);
+		if (IS_INODE(node))
+			ret = update_inode(sbi, node, &blkaddr);
+		else
+			ret = update_block(sbi, node, &blkaddr, NULL);
+		free(node);
+		ASSERT(ret >= 0);
+		goto out;
+	} else if (!strcmp(opt->mb, "crc")) {
+		__le32 *crc = (__le32 *)((unsigned char *)cp +
+						get_cp(checksum_offset));
+
+		MSG(0, "Info: inject crc of cp %d: 0x%x -> 0x%x\n",
+		    opt->cp, le32_to_cpu(*crc), (u32)opt->val);
+		*crc = cpu_to_le32((u32)opt->val);
+		update_crc = false;
+	} else if (!strcmp(opt->mb, "elapsed_time")) {
+		MSG(0, "Info: inject elapsed_time of cp %d: %llu -> %"PRIu64"\n",
+		    opt->cp, get_cp(elapsed_time), (u64)opt->val);
+		set_cp(elapsed_time, (u64)opt->val);
 	} else {
 		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
 		ret = -EINVAL;
@@ -541,7 +625,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 
 	print_ckpt_info(sbi);
-	write_raw_cp_blocks(sbi, cp, opt->cp);
+	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
 
 out:
 	free(buf);
diff --git a/fsck/mount.c b/fsck/mount.c
index f9f780d4aff6..f03fa2d6861a 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3510,17 +3510,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 	write_checkpoint(sbi);
 }
 
-void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
-			 struct f2fs_checkpoint *cp, int which)
+void write_raw_cp_blocks(struct f2fs_sb_info *sbi, struct f2fs_checkpoint *cp,
+			 int which, bool update_crc)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	uint32_t crc;
 	block_t cp_blkaddr;
 	int ret;
 
-	crc = f2fs_checkpoint_chksum(cp);
-	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
+	if (update_crc) {
+		crc = f2fs_checkpoint_chksum(cp);
+		*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
 							cpu_to_le32(crc);
+	}
 
 	cp_blkaddr = get_sb(cp_blkaddr);
 	if (which == 2)
@@ -3754,7 +3756,7 @@ static void del_fsync_inode(struct fsync_inode_entry *entry)
 	free(entry);
 }
 
-static void destroy_fsync_dnodes(struct list_head *head)
+void f2fs_destroy_fsync_dnodes(struct list_head *head)
 {
 	struct fsync_inode_entry *entry, *tmp;
 
@@ -3860,7 +3862,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
-static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
+int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
 	struct f2fs_node *node_blk, *node_blk_fast;
@@ -4056,7 +4058,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	if (!need_fsync_data_record(sbi))
 		return 0;
 
-	ret = find_fsync_inode(sbi, &inode_list);
+	ret = f2fs_find_fsync_inode(sbi, &inode_list);
 	if (ret)
 		goto out;
 
@@ -4071,7 +4073,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 
 	ret = traverse_dnodes(sbi, &inode_list);
 out:
-	destroy_fsync_dnodes(&inode_list);
+	f2fs_destroy_fsync_dnodes(&inode_list);
 	return ret;
 }
 
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 65ac658a129b..df1d25ea33a9 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -45,7 +45,7 @@ The available \fImb\fP of \fIsb\fP are:
 .RS 1.2i
 .TP
 .BI magic
-magic numbe.
+magic number.
 .TP
 .BI s_stop_reason
 s_stop_reason array.
@@ -79,6 +79,18 @@ cur_data_segno array.
 .TP
 .BI cur_data_blkoff
 cur_data_blkoff array.
+.TP
+.BI next_blkaddr
+fsync dnodes.
+.TP
+.BI alloc_type
+alloc_type array.
+.TP
+.BI crc
+crc checksum.
+.TP
+.BI elapsed_time
+elapsed mount time.
 .RE
 .TP
 .BI \-\-nat " 0 or 1 or 2"
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

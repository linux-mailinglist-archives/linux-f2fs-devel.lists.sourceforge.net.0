Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B4AD3C7C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZImQHyDWvcrLzfuLpMdYUspr5OeDpIZpcKuQ52HAc0=; b=mogZ4tDrhJtqlyg+3QLHM62U03
	7q+j70sw5mR4t3unq1bJTCchOOEyKfga8hYlgn8vugbdfDuyODkcOLTF7BaZ+YppguA8lOK9BWXIE
	hVoNEvoOMkRmzne3nS+x8zAzr0INI1k0yi8g9X3841S4sSX0zX+BOwRfF6FgoYVxXF3c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0ie-00039k-Jo;
	Tue, 10 Jun 2025 15:16:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0id-00039Z-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q85EfytKQG8yMInt5NhI3ac7us3zD2xTQYuhq2Nl4Fk=; b=lrvPMopDEbKpHbvEnebnXpsdhI
 7zfsBLG3HFy4zHUqFEtPeBhVj89qDW3jeTIC7/ZMY5k0GLhYbJxT/ZjY6bDXUQNbUt64ZP3x1y+ZD
 9NKlLdvWCfU0cmD5Cqxyi+dj91FGXhvtZR1Q9BKXICwYMx5xUvfVhWrBSi8kVCLHdAuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q85EfytKQG8yMInt5NhI3ac7us3zD2xTQYuhq2Nl4Fk=; b=FIdIYYmf4mb3tx1Pr9VTF7m52D
 2Prd3RYE4od9byNSvH3l/q23YZlj/edh6y5DDvw1TiQ2P3nJrRSMDrNtBsFM3bDnTovaXFuFRm/v6
 aJ8mJZ0iiHMkKFiiyr7tVnNT5FW4wmuqHudCbd/SD8nEMiXrOQU+GrWYnXAwpfzzeMbw=;
Received: from mail-yw1-f170.google.com ([209.85.128.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0id-0003Kr-3Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:16:55 +0000
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-70e1d8c2dc2so52313497b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568604; x=1750173404; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q85EfytKQG8yMInt5NhI3ac7us3zD2xTQYuhq2Nl4Fk=;
 b=BLaSKJiIhAOFvFxOwPCMXis2VbV6CB0OsRpEGC6cgEUUwDSiD8oebUrmyDLv9cxUEx
 /LAw/rub3pHJE8hd17yVJ4L8Tn53M8/UcWPRPn9PyvnfLi1y9RDnkkAgOKLEqvF9f8/G
 jehi7jS3dOqdst6rsYhfLhtGSfkrERKeRgkWILU3+UBzJ4+BahOejgOd0gZ0uY0P1YMk
 mPd7WAiPP9cbOHhGquwqk/Mio90f2y86bYwW9f9zt3Cb2UYNGHy5eeXzgAsNHjvWCwbD
 UDKdu6ZIDFl7izL8DeayL8HRpNf7qqDMdBMfrm35yZYRCtT+NMVyKbUsc4hVCtzYpN3K
 ARWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568604; x=1750173404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q85EfytKQG8yMInt5NhI3ac7us3zD2xTQYuhq2Nl4Fk=;
 b=KKOsPI6w8R+WgomOI7+XtKD0j6iGuTHDT+b4fQmFi7Rkifmf4ULBqeQ/rcPZXOJbmS
 i6gOAnqkf+tsw1e9CbObBqPBeV6cgbgeRogilajys2zOp13lUej5hf1TRTcHERPGy0FQ
 d3yAgPaNJlY5cIZRThaLr3T00Hy7YBTpTHbMZSjYDhE6pG2qkH9kJFVpSfY4uklG3PFE
 bP4kZuY6HbFGtac1jWMmqEz21x/jzgVDixDFcY4Dw5JZvXIE07BiAkuNmZpY5yjlNcem
 0cfGOeNe0AoeA7hgfuAWNALt6nhPmD0faidZj8srfFqcdPDVokbDQEp0RQEOxn9+VNpo
 XM/A==
X-Gm-Message-State: AOJu0Yyh8Fx/V6WYJ+zvZsDE32XIwMxfpBrKe4HjrfU/yrsCnmYJf8rm
 hd8w5Gpr9TZ1wHnZFtWtog74Z9Kw3ODarKAEEBkZAmaqnADCRogYpTWu/ZqXmQ==
X-Gm-Gg: ASbGnct6XNXBi/2oaojzf5Zvk+/Rs3d1wHY3CfaekNHL/cXECXsUecIoaRNFJEEaKRM
 O9m0ZJF/qPU8tpYLnGEtc/MMWFsJmYLmfscwqEE4CEvkZwjXpy2EgYvC11HfYn7TDerAcG32f7g
 mu+5qC9Zsj4oXcFicGbjLB8fAqckWYpQZIJ41FjDcn8CY+RqSlsDjsPO3bJVfXLvd5DHPdXNHeT
 vMpK7devZBd0gxGKrWD+sxCPvEu4UWA6nR5PRRgCpbVfvXef/xWO6orNdfCQa8JftrjknnzguPL
 Hz4zDGSakKRBmvi/tbVjY4iEDA9axnmq3Qqb9j9TSzZbbwTRiXyQJZj25oQaiRykPU2l
X-Google-Smtp-Source: AGHT+IEJTqFXu/LJLLcIJ4AVVsPBl3huwy2kK29qJun66uG5glBMk/9hkmRec8owQX2OE/HA47reIA==
X-Received: by 2002:a05:6a00:1882:b0:740:b5f8:ac15 with SMTP id
 d2e1a72fcca58-74827e7b394mr20647319b3a.10.1749559101713; 
 Tue, 10 Jun 2025 05:38:21 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:21 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:20 +0800
Message-ID: <20250610123743.667183-11-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.170 listed in wl.mailspike.net]
X-Headers-End: 1uP0id-0003Kr-3Q
Subject: [f2fs-dev] [RFC PATCH v2 10/32] inject.f2fs: add members in
 inject_cp
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

However, the injection is not supported on zoned device. This is because
fsync dnodes must remains at the end of current warm node segment, any
dnode change causes all previous dnodes in the chain to be updated
out-of-place, and there may not have enough space left in the curseg.
To simplify the injection, it returns an error on zoned device.

* alloc_type: inject curseg's alloc type
* crc: inject cp's checksum
* elapsed_time: inject cp's mount elapsed time

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/fsck.h       |  4 ++-
 fsck/inject.c     | 85 ++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/mount.c      | 18 +++++-----
 man/inject.f2fs.8 | 11 +++++-
 4 files changed, 107 insertions(+), 11 deletions(-)

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
index c879ca99c0d8..53667730775f 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -139,6 +139,10 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
 	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+	MSG(0, "  alloc_type: inject alloc_type array selected by --idx <index>\n");
+	MSG(0, "  next_blkaddr: inject next_blkaddr of fsync dnodes selected by --idx <index>\n");
+	MSG(0, "  crc: inject crc checksum\n");
+	MSG(0, "  elapsed_time: inject elapsed_time\n");
 }
 
 static void inject_nat_usage(void)
@@ -443,6 +447,7 @@ out:
 static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 {
 	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	bool update_crc = true;
 	char *buf = NULL;
 	int ret = 0;
 
@@ -521,6 +526,84 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
@@ -528,7 +611,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 
 	print_ckpt_info(sbi);
-	write_raw_cp_blocks(sbi, cp, opt->cp);
+	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
 
 out:
 	free(buf);
diff --git a/fsck/mount.c b/fsck/mount.c
index 1f2cc960b9c0..eb019ad6826e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3503,17 +3503,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
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
@@ -3747,7 +3749,7 @@ static void del_fsync_inode(struct fsync_inode_entry *entry)
 	free(entry);
 }
 
-static void destroy_fsync_dnodes(struct list_head *head)
+void f2fs_destroy_fsync_dnodes(struct list_head *head)
 {
 	struct fsync_inode_entry *entry, *tmp;
 
@@ -3853,7 +3855,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
-static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
+int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
 	struct f2fs_node *node_blk, *node_blk_fast;
@@ -4049,7 +4051,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	if (!need_fsync_data_record(sbi))
 		return 0;
 
-	ret = find_fsync_inode(sbi, &inode_list);
+	ret = f2fs_find_fsync_inode(sbi, &inode_list);
 	if (ret)
 		goto out;
 
@@ -4064,7 +4066,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 
 	ret = traverse_dnodes(sbi, &inode_list);
 out:
-	destroy_fsync_dnodes(&inode_list);
+	f2fs_destroy_fsync_dnodes(&inode_list);
 	return ret;
 }
 
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 01d58effbfe4..975d8c65030a 100644
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
@@ -79,6 +79,15 @@ cur_data_segno array.
 .TP
 .BI cur_data_blkoff
 cur_data_blkoff array.
+.TP
+.BI next_blkaddr
+fsync dnodes.
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

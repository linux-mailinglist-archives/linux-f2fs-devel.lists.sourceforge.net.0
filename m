Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61393A9F933
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Apr 2025 21:07:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9ToY-0001TQ-Mi;
	Mon, 28 Apr 2025 19:06:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1u9ToX-0001TK-Pk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 19:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zYh0Z9BzwdTLVi1PA1kSqGTg+bkCsY6ffdwlg/kRax0=; b=VMKL6PLK7s2E7cABrFj8IcT9Ts
 JCa90hlkmajTHNbPY+fODKVlsF3h9H+BjSVki5F7PW/iJPWc+Zgg9Hvuo1MUa9PJHu631cgGO6T0G
 RRwqApxKi1gApyOvP1Hr1gqKXE38/B3H24LSzEenGgKLqntm872WW0NbfQ+IzVBnaAeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zYh0Z9BzwdTLVi1PA1kSqGTg+bkCsY6ffdwlg/kRax0=; b=a
 mmMj7sDCHhu9kok8uWI8Xv1osK7hy6wdJCkfDL97Y9sDfKhvLmuliAwRL6DVOQ0PuV7IXwLBgA9Rt
 RJXB0Jx3lPyWztNgFMm46jz/9ffZ3n1+DF8J64TNaayAVEbfbBASEEYN88g1SbYMlavuZxD/46ohR
 SJHUcnlubFLU08ZE=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u9ToG-0005lQ-M5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 19:06:49 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22c33677183so54880955ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745867181; x=1746471981; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zYh0Z9BzwdTLVi1PA1kSqGTg+bkCsY6ffdwlg/kRax0=;
 b=cGIo7SFp70LpLuufIAyWBPEf91vXIJRGMA9eNI77DOaAnuYPbPDm/h5zexiyDb9JXT
 qDOxq2SLHq+khgLn18pZpM15zsYG3zWjd9tMwELX7BTJKPHPv5G7VS8oIySHOCceN2xA
 ZnBojzv966qwirUWMrnzemgb/ABzhooVzU7p9JfoJVpYAr7BTXVXS7G1VwNKM+Tu9+lS
 6O81fwT0pi9uTrWBv84eMieTJP+f2JRaFXQ5LKW8aJqoOUNbE2iKpcFLWKEs8D7asUBM
 aKdcfdg8fPNYvFEZKE5Zic/KaiMXHaBnjzY5KzrqYWzSsA0BJCXUT6WkEfE537FPiHka
 mWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745867181; x=1746471981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYh0Z9BzwdTLVi1PA1kSqGTg+bkCsY6ffdwlg/kRax0=;
 b=szbz5277wXEkRJAWxDueyQqQoutxMOZowBXXBOf9gCTvUhE5DzmfaishZaNHGJEi5V
 3xmYF1vu5xmLmwXXPs65lGURty7BsevFwgNz17Lai3gcJI4uVJvTUHrpqrRS8w87Bwt1
 WllQoVpyKa1U7XS5TLm4arPXC9H+ycSaxljym0QPu2BPcYvkAwGQ5aA+SjQh0YIhXCrS
 3ZZZPBpW8e5WqKLXmPQ1Ymmn1BkRZm7pwQmS2c/7N6tnd9iYvZUUmQjEmapBscNkqfLu
 NHLfaDIaEQ4yLOi4oQ7ikMe5IkBX2t7Fh7h0g94AbOJp5u9MzDdEQCRiLiYmu0NOtBMA
 WhVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOH1vuP8Sd3/hBPTHhK2ST7zR9psmGPrPsQvHhKE0b2V18K3wZL42KtmWPLM5Y9buP+feTm5WwTKY0DJ9T/Gom@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy/LdoKRG1rnRCalG9+Yi8sHi1NbYpWSz7gHZY+nzjvzwmCXodl
 sevT+ms6Eloq195AK5NH6Os434NrocjCTMq0RFa7QLhhOeYRXtRJ
X-Gm-Gg: ASbGnctxa0C8tGaO2rn3523ms7zV/mG086NyevGGm3nH88k7rH1CKvPO1ksLwWV3IAF
 9CE8Q3b6m03iCE+x6BtLWfpk3SlcyLkhdsfmNWoB9EnxyZODCsJXla8zfqoh9J94Q7wYUj80ncF
 fJzT68cF1qa+O4e4GDF0aY+5cr6WETVxvvlrLeBnPQtv3pC/ReuZoUBQ74yJtB60Nh6KUv7uBsf
 Xp3P5EDNH4TIi0m9nIw25yMG/x5bGriiJHtqodxMWA2EjVNVnb779ZYlnBsu3HfbSA/AdkkqaHP
 TthEHTtdHLWm/TYt96K3MAnD/K+kn/xuy9oVYtoi3NtzgoNN/32bK8oHwD84ZR74xr6tgVo9PWW
 g1wr0tagcMKN+ZmLPpkgPu8t5fMa4uA==
X-Google-Smtp-Source: AGHT+IEPFhdpRUoAJYXNs/7RGP6C3/611OJxLvsblP5yB6aMJfvak2QOmBOKkQn7k0rARIwfSrttVg==
X-Received: by 2002:a17:903:41c9:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-22dc6a040dcmr144149195ad.19.1745867180704; 
 Mon, 28 Apr 2025 12:06:20 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a278:2d:9878:a294])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22dc8e24231sm50521425ad.125.2025.04.28.12.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 12:06:20 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 28 Apr 2025 12:06:15 -0700
Message-ID: <20250428190615.2559383-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Due to the difficulty of intentionally
 corrupting
 specific metadata on some storage devices like zoned storage devices, it
 is challenging to effectively verify fsck functionality. To facilitate this
 v [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in sa-accredit.habeas.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1u9ToG-0005lQ-M5
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: introduce fault injection to fsck
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Due to the difficulty of intentionally corrupting specific metadata on
some storage devices like zoned storage devices, it is challenging to
effectively verify fsck functionality. To facilitate this verification,
it is necessary to add a fault injection mode.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: set limit on fault counts
v2: print fault injection result
---
 fsck/fsck.c       | 123 +++++++++++++++++++++++++++++++++++-----------
 fsck/main.c       |  22 +++++++++
 fsck/mkquota.c    |   3 ++
 include/f2fs_fs.h |  58 ++++++++++++++++++++++
 man/fsck.f2fs.8   |  36 ++++++++++++++
 5 files changed, 213 insertions(+), 29 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8155cbd..30ea5e7 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -16,6 +16,20 @@
 char *tree_mark;
 uint32_t tree_mark_size = 256;
 
+const char *f2fs_fault_name[FAULT_MAX] = {
+	[FAULT_SEG_TYPE]	= "FAULT_SEG_TYPE",
+	[FAULT_SUM_TYPE]	= "FAULT_SUM_TYPE",
+	[FAULT_SUM_ENT]		= "FAULT_SUM_ENTRY",
+	[FAULT_NAT]		= "FAULT_NAT_ENTRY",
+	[FAULT_NODE]		= "FAULT_NODE_BLOCK",
+	[FAULT_XATTR_ENT]	= "FAULT_XATTR_ENTRY",
+	[FAULT_COMPR]		= "FAULT_COMPR_TYPE",
+	[FAULT_INODE]		= "FAULT_INODE_ENTRY",
+	[FAULT_DENTRY]		= "FAULT_DENTRY_BLOCK",
+	[FAULT_DATA]		= "FAULT_DATA_BLOCK",
+	[FAULT_QUOTA]		= "FAULT_QUOTA",
+};
+
 int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u32 blk, int type)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -23,9 +37,9 @@ int f2fs_set_main_bitmap(struct f2fs_sb_info *sbi, u32 blk, int type)
 	int fix = 0;
 
 	se = get_seg_entry(sbi, GET_SEGNO(sbi, blk));
-	if (se->type >= NO_CHECK_TYPE)
-		fix = 1;
-	else if (IS_DATASEG(se->type) != IS_DATASEG(type))
+	if (time_to_inject(FAULT_SEG_TYPE) ||
+			(se->type >= NO_CHECK_TYPE) ||
+			(IS_DATASEG(se->type) != IS_DATASEG(type)))
 		fix = 1;
 
 	/* just check data and node types */
@@ -168,7 +182,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	sum_blk = get_sum_block(sbi, segno, &type);
 
-	if (type != SEG_TYPE_NODE && type != SEG_TYPE_CUR_NODE) {
+	if (time_to_inject(FAULT_SUM_TYPE) ||
+			(type != SEG_TYPE_NODE && type != SEG_TYPE_CUR_NODE)) {
 		/* can't fix current summary, then drop the block */
 		if (!c.fix_on || type < 0) {
 			ASSERT_MSG("Summary footer is not for node segment");
@@ -189,7 +204,8 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	sum_entry = &(sum_blk->entries[offset]);
 
-	if (le32_to_cpu(sum_entry->nid) != nid) {
+	if (time_to_inject(FAULT_SUM_ENT) ||
+			(le32_to_cpu(sum_entry->nid) != nid)) {
 		if (!c.fix_on || type < 0) {
 			DBG(0, "nid                       [0x%x]\n", nid);
 			DBG(0, "target blk_addr           [0x%x]\n", blk_addr);
@@ -282,7 +298,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 	struct f2fs_summary *sum_entry;
 	struct seg_entry * se;
 	u32 segno, offset;
-	int need_fix = 0, ret = 0;
+	int need_fix = 0, ret = 0, fault_sum_ent = 0;
 	int type;
 
 	if (get_sb(feature) & F2FS_FEATURE_RO)
@@ -293,7 +309,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 
 	sum_blk = get_sum_block(sbi, segno, &type);
 
-	if (type != SEG_TYPE_DATA && type != SEG_TYPE_CUR_DATA) {
+	if (time_to_inject(FAULT_SUM_TYPE) ||
+			(type != SEG_TYPE_DATA && type != SEG_TYPE_CUR_DATA)) {
 		/* can't fix current summary, then drop the block */
 		if (!c.fix_on || type < 0) {
 			ASSERT_MSG("Summary footer is not for data segment");
@@ -314,7 +331,10 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 
 	sum_entry = &(sum_blk->entries[offset]);
 
-	if (le32_to_cpu(sum_entry->nid) != parent_nid ||
+	if (time_to_inject(FAULT_SUM_ENT))
+		fault_sum_ent = 1;
+
+	if (fault_sum_ent || le32_to_cpu(sum_entry->nid) != parent_nid ||
 			sum_entry->version != version ||
 			le16_to_cpu(sum_entry->ofs_in_node) != idx_in_node) {
 		if (!c.fix_on || type < 0) {
@@ -333,7 +353,8 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 			DBG(0, "Target data block addr    [0x%x]\n", blk_addr);
 			ASSERT_MSG("Invalid data seg summary\n");
 			ret = -EINVAL;
-		} else if (is_valid_summary(sbi, sum_entry, blk_addr)) {
+		} else if (!fault_sum_ent &&
+				is_valid_summary(sbi, sum_entry, blk_addr)) {
 			/* delete wrong index */
 			ret = -EINVAL;
 		} else {
@@ -397,6 +418,9 @@ err:
 static int sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid,
 						struct node_info *ni)
 {
+	if (time_to_inject(FAULT_NAT))
+		return -EINVAL;
+
 	if (!IS_VALID_NID(sbi, nid)) {
 		ASSERT_MSG("nid is not valid. [0x%x]", nid);
 		return -EINVAL;
@@ -436,6 +460,9 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	int ret;
 
+	if (time_to_inject(FAULT_NODE))
+		return -EINVAL;
+
 	ret = sanity_check_nat(sbi, nid, ni);
 	if (ret)
 		return ret;
@@ -865,7 +892,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 				"end of list", nid);
 		need_fix = true;
 	}
-	if (need_fix && c.fix_on) {
+	if ((time_to_inject(FAULT_XATTR_ENT) || need_fix) && c.fix_on) {
 		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
 		write_all_xattrs(sbi, inode, xattr_size, xattr);
 		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
@@ -907,7 +934,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	if (!compressed)
 		goto check_next;
 
-	if (!compr_supported || (node_blk->i.i_inline & F2FS_INLINE_DATA)) {
+	if (time_to_inject(FAULT_COMPR) || !compr_supported ||
+			(node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		/*
 		 * The 'compression' flag in i_flags affects the traverse of
 		 * the node tree.  Thus, it must be fixed unconditionally
@@ -943,12 +971,13 @@ check_next:
 			f2fs_set_main_bitmap(sbi, ni->blk_addr,
 							CURSEG_WARM_NODE);
 
-			if (i_links == 0 && (ftype == F2FS_FT_CHRDEV ||
+			if (time_to_inject(FAULT_INODE) ||
+				(i_links == 0 && (ftype == F2FS_FT_CHRDEV ||
 				ftype == F2FS_FT_BLKDEV ||
 				ftype == F2FS_FT_FIFO ||
 				ftype == F2FS_FT_SOCK ||
 				ftype == F2FS_FT_SYMLINK ||
-				ftype == F2FS_FT_REG_FILE)) {
+				ftype == F2FS_FT_REG_FILE))) {
 				ASSERT_MSG("ino: 0x%x ftype: %d has i_links: %u",
 							nid, ftype, i_links);
 				if (c.fix_on) {
@@ -1008,7 +1037,8 @@ check_next:
 		if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 			unsigned int isize =
 				le16_to_cpu(node_blk->i.i_extra_isize);
-			if (isize > 4 * DEF_ADDRS_PER_INODE) {
+			if (time_to_inject(FAULT_INODE) ||
+					(isize > 4 * DEF_ADDRS_PER_INODE)) {
 				ASSERT_MSG("[0x%x] wrong i_extra_isize=0x%x",
 						nid, isize);
 				if (c.fix_on) {
@@ -1038,8 +1068,9 @@ check_next:
 			unsigned int inline_size =
 				le16_to_cpu(node_blk->i.i_inline_xattr_size);
 
-			if (!inline_size ||
-					inline_size > MAX_INLINE_XATTR_SIZE) {
+			if (time_to_inject(FAULT_INODE) ||
+					(!inline_size ||
+					inline_size > MAX_INLINE_XATTR_SIZE)) {
 				ASSERT_MSG("[0x%x] wrong inline_xattr_size:%u",
 						nid, inline_size);
 				if (c.fix_on) {
@@ -1056,9 +1087,10 @@ check_next:
 	}
 	ofs = get_extra_isize(node_blk);
 
-	if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
-	    (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
-	     !(c.feature & F2FS_FEATURE_CASEFOLD))) {
+	if (time_to_inject(FAULT_INODE) ||
+		 ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
+		  (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
+		   !(c.feature & F2FS_FEATURE_CASEFOLD)))) {
 		ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
 		if (c.fix_on) {
 			FIX_MSG("ino[0x%x] clear casefold flag", nid);
@@ -1077,7 +1109,8 @@ check_next:
 			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
-		if (blkaddr != NULL_ADDR) {
+		if (time_to_inject(FAULT_INODE) ||
+				(blkaddr != NULL_ADDR)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 					nid, blkaddr);
 			if (c.fix_on) {
@@ -1088,7 +1121,8 @@ check_next:
 				need_fix = 1;
 			}
 		}
-		if (i_size > inline_size) {
+		if (time_to_inject(FAULT_INODE) ||
+				(i_size > inline_size)) {
 			ASSERT_MSG("[0x%x] wrong inline size:%lu",
 					nid, (unsigned long)i_size);
 			if (c.fix_on) {
@@ -1118,7 +1152,7 @@ check_next:
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
 		DBG(3, "ino[0x%x] has inline dentry!\n", nid);
-		if (blkaddr != 0) {
+		if (time_to_inject(FAULT_INODE) || (blkaddr != 0)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 								nid, blkaddr);
 			if (c.fix_on) {
@@ -1728,6 +1762,9 @@ static int f2fs_check_hash_code(int encoding, int casefolded,
 			struct f2fs_dir_entry *dentry,
 			const unsigned char *name, u32 len, int enc_name)
 {
+	if (time_to_inject(FAULT_DENTRY))
+		return 1;
+
 	/* Casefolded Encrypted names require a key to compute siphash */
 	if (enc_name && casefolded)
 		return 0;
@@ -1799,7 +1836,8 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	int fixed = 0;
 
 	if ((name[0] == '.' && len == 1)) {
-		if (le32_to_cpu(dentry->ino) != child->p_ino) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(le32_to_cpu(dentry->ino) != child->p_ino)) {
 			ASSERT_MSG("Bad inode number[0x%x] for '.', parent_ino is [0x%x]\n",
 				le32_to_cpu(dentry->ino), child->p_ino);
 			dentry->ino = cpu_to_le32(child->p_ino);
@@ -1809,13 +1847,16 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 
 	if (name[0] == '.' && name[1] == '.' && len == 2) {
 		if (child->p_ino == F2FS_ROOT_INO(sbi)) {
-			if (le32_to_cpu(dentry->ino) != F2FS_ROOT_INO(sbi)) {
+			if (time_to_inject(FAULT_DENTRY) ||
+					(le32_to_cpu(dentry->ino) !=
+					 F2FS_ROOT_INO(sbi))) {
 				ASSERT_MSG("Bad inode number[0x%x] for '..'\n",
 					le32_to_cpu(dentry->ino));
 				dentry->ino = cpu_to_le32(F2FS_ROOT_INO(sbi));
 				fixed = 1;
 			}
-		} else if (le32_to_cpu(dentry->ino) != child->pp_ino) {
+		} else if (time_to_inject(FAULT_DENTRY) ||
+				(le32_to_cpu(dentry->ino) != child->pp_ino)) {
 			ASSERT_MSG("Bad inode number[0x%x] for '..', parent parent ino is [0x%x]\n",
 				le32_to_cpu(dentry->ino), child->pp_ino);
 			dentry->ino = cpu_to_le32(child->pp_ino);
@@ -1826,7 +1867,7 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	if (f2fs_check_hash_code(get_encoding(sbi), casefolded, dentry, name, len, enc_name))
 		fixed = 1;
 
-	if (name[len] != '\0') {
+	if (time_to_inject(FAULT_DENTRY) || (name[len] != '\0')) {
 		ASSERT_MSG("'.' is not NULL terminated\n");
 		name[len] = '\0';
 		memcpy(*filename, name, len);
@@ -1889,7 +1930,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 			i++;
 			continue;
 		}
-		if (!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid NID/ino 0x%x",
 				    i, le32_to_cpu(dentry[i].ino));
 			if (c.fix_on) {
@@ -1903,7 +1945,9 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 		}
 
 		ftype = dentry[i].file_type;
-		if ((ftype <= F2FS_FT_UNKNOWN || ftype > F2FS_FT_LAST_FILE_TYPE)) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(ftype <= F2FS_FT_UNKNOWN ||
+				 ftype > F2FS_FT_LAST_FILE_TYPE)) {
 			ASSERT_MSG("Bad dentry 0x%x with unexpected ftype 0x%x",
 						le32_to_cpu(dentry[i].ino), ftype);
 			if (c.fix_on) {
@@ -1918,7 +1962,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 
 		name_len = le16_to_cpu(dentry[i].name_len);
 
-		if (name_len == 0 || name_len > F2FS_NAME_LEN) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(name_len == 0 || name_len > F2FS_NAME_LEN)) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid name_len", i);
 			if (c.fix_on) {
 				FIX_MSG("Clear bad dentry 0x%x", i);
@@ -2153,6 +2198,9 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		return 0;
 	}
 
+	if (time_to_inject(FAULT_DATA))
+		return -EINVAL;
+
 	if (!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) {
 		ASSERT_MSG("blkaddress is not valid. [0x%x]", blk_addr);
 		return -EINVAL;
@@ -3540,6 +3588,19 @@ int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+void print_fault_cnt(struct f2fs_fault_info *ffi)
+{
+	int i;
+
+	printf("[Fault injection result]\n");
+	for (i = 0; i < FAULT_MAX; i++) {
+		printf("%s: %d", f2fs_fault_name[i], ffi->fault_cnt[i]);
+		if (i < FAULT_MAX - 1)
+			printf(", ");
+	}
+	printf("\n");
+}
+
 int fsck_verify(struct f2fs_sb_info *sbi)
 {
 	unsigned int i = 0;
@@ -3548,12 +3609,16 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	u32 nr_unref_nid = 0;
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL;
+	struct f2fs_fault_info *ffi = &c.fault_info;
 	bool verify_failed = false;
 	uint64_t max_blks, data_secs, node_secs, free_blks;
 
 	if (c.show_file_map)
 		return 0;
 
+	if (ffi->inject_rate)
+		print_fault_cnt(ffi);
+
 	printf("\n");
 
 	if (c.zoned_model == F2FS_ZONED_HM) {
diff --git a/fsck/main.c b/fsck/main.c
index 47ba6c9..29792d8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -91,6 +91,8 @@ void fsck_usage()
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
 	MSG(0, "  --kernel-check checks kernel change\n");
 	MSG(0, "  --debug-cache to debug cache when -c is used\n");
+	MSG(0, "  --fault_injection=%%d to enable fault injection with specified injection rate\n");
+	MSG(0, "  --fault_type=%%d to configure enabled fault injection type\n");
 	exit(1);
 }
 
@@ -263,6 +265,8 @@ void f2fs_parse_options(int argc, char *argv[])
 			{"no-kernel-check", no_argument, 0, 2},
 			{"kernel-check", no_argument, 0, 3},
 			{"debug-cache", no_argument, 0, 4},
+			{"fault_injection", required_argument, 0, 5},
+			{"fault_type", required_argument, 0, 6},
 			{0, 0, 0, 0}
 		};
 
@@ -287,6 +291,24 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 4:
 				c.cache_config.dbg_en = true;
 				break;
+			case 5:
+				val = atoi(optarg);
+				if ((unsigned int)val <= 1) {
+					MSG(0, "\tError: injection rate must be larger "
+							"than 1: %d\n", val);
+					fsck_usage();
+				}
+				c.fault_info.inject_rate = val;
+				c.fault_info.inject_type = F2FS_ALL_FAULT_TYPE;
+				break;
+			case 6:
+				val = atoi(optarg);
+				if (val >= (1UL << (FAULT_MAX))) {
+					MSG(0, "\tError: Invalid inject type: %x\n", val);
+					fsck_usage();
+				}
+				c.fault_info.inject_type = val;
+				break;
 			case 'a':
 				c.auto_fix = 1;
 				MSG(0, "Info: Automatic fix mode enabled.\n");
diff --git a/fsck/mkquota.c b/fsck/mkquota.c
index 2451b58..eb63fc9 100644
--- a/fsck/mkquota.c
+++ b/fsck/mkquota.c
@@ -372,6 +372,9 @@ errcode_t quota_compare_and_update(struct f2fs_sb_info *sbi,
 	dict_t *dict = qctx->quota_dict[qtype];
 	errcode_t err = 0;
 
+	if (time_to_inject(FAULT_QUOTA))
+		return -EINVAL;
+
 	if (!dict)
 		goto out;
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index bb40adc..99bb3ed 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -29,6 +29,7 @@
 #include <string.h>
 #include <time.h>
 #include <stdbool.h>
+#include <limits.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -1476,6 +1477,34 @@ enum {
 	F2FS_FEATURE_NAT_BITS = 0x0001,
 };
 
+/* Fault inject control */
+enum {
+	FAULT_SEG_TYPE,
+	FAULT_SUM_TYPE,
+	FAULT_SUM_ENT,
+	FAULT_NAT,
+	FAULT_NODE,
+	FAULT_XATTR_ENT,
+	FAULT_COMPR,
+	FAULT_INODE,
+	FAULT_DENTRY,
+	FAULT_DATA,
+	FAULT_QUOTA,
+	FAULT_MAX
+};
+
+#define F2FS_ALL_FAULT_TYPE	((1UL << (FAULT_MAX)) - 1)
+
+struct f2fs_fault_info {
+	int inject_ops;
+	int inject_rate;
+	unsigned int inject_type;
+	unsigned int fault_cnt[FAULT_MAX];
+};
+
+extern const char *f2fs_fault_name[FAULT_MAX];
+#define IS_FAULT_SET(fi, type) ((fi)->inject_type & (1UL << (type)))
+
 struct f2fs_configuration {
 	uint32_t conf_reserved_sections;
 	uint32_t reserved_segments;
@@ -1604,6 +1633,9 @@ struct f2fs_configuration {
 		struct f2fs_journal nat_jnl;
 		char nat_bytes[F2FS_MAX_BLKSIZE];
 	};
+
+	/* Fault injection control */
+	struct f2fs_fault_info fault_info;
 };
 
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
@@ -2131,4 +2163,30 @@ static inline void check_block_struct_sizes(void)
 			+ NR_DENTRY_IN_BLOCK * F2FS_SLOT_LEN * sizeof(u8) == F2FS_BLKSIZE);
 }
 
+/* Fault inject control */
+#define time_to_inject(type) __time_to_inject(type, __func__, \
+					__builtin_return_address(0))
+static inline bool __time_to_inject(int type, const char *func,
+		const char *parent_func)
+{
+	struct f2fs_fault_info *ffi = &c.fault_info;
+
+	if (!ffi->inject_rate)
+		return false;
+
+	if (!IS_FAULT_SET(ffi, type))
+		return false;
+
+	ffi->inject_ops++;
+	if (ffi->inject_ops >= ffi->inject_rate) {
+		ffi->inject_ops = 0;
+		if (ffi->fault_cnt[type] != UINT_MAX)
+			ffi->fault_cnt[type]++;
+		MSG(0, "inject %s in %s of %p\n",
+				f2fs_fault_name[type], func, parent_func);
+		return true;
+	}
+	return false;
+}
+
 #endif	/*__F2FS_FS_H */
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index e39a846..3762e6d 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -67,6 +67,42 @@ Enable to show every directory entries in the partition.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-\-fault_injection=%d " enable fault injection"
+Enable fault injection in all supported types with specified injection rate.
+.TP
+.BI \-\-fault_type=%d " configure fault injection type"
+Support configuring fault injection type, should be enabled with
+fault_injection option, fault type value is shown below, it supports
+single or combined type.
+.br
+===========================      ===========
+.br
+Type_Name                        Type_Value
+.br
+===========================      ===========
+.br
+FAULT_SEG_TYPE                   0x000000001
+.br
+FAULT_SUM_TYPE                   0x000000002
+.br
+FAULT_SUM_ENT                    0x000000004
+.br
+FAULT_NAT                        0x000000008
+.br
+FAULT_NODE                       0x000000010
+.br
+FAULT_XATTR_ENT                  0x000000020
+.br
+FAULT_COMPR                      0x000000040
+.br
+FAULT_INODE                      0x000000080
+.br
+FAULT_DENTRY                     0x000000100
+.br
+FAULT_DATA                       0x000000200
+.br
+FAULT_QUOTA                      0x000000400
+.TP
 .SH AUTHOR
 Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.
 Jaegeuk Kim <jaegeuk@kernel.org> reworked most parts of the codes to support
-- 
2.49.0.901.g37484f566f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

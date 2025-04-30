Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6EAA53CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 20:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NBDexJEPNokDraeb9tsv87yWjAGiZOpmo93zkn9aX+Y=; b=TIAcmkna17IdfROIMyd/U4i+lb
	RTh1jg8VnoenQBTz4BgZ1vfKfqVTHvhx6Jw5Tj/B49rGXgGjMrvECRGmu0CbcnRHfXuF4D/FxoyQ6
	Wk2eVHa7qtpkWMFsVBGC16HDlN7cQpPHEFssbSlUvmDrOHe0PbndObKqAcopDChML4Lo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uACHt-0000pB-WA;
	Wed, 30 Apr 2025 18:36:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uACHs-0000p5-5T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 18:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/k2V3a6IuNUogPtD0BCT7KcvtqpWHV5eTO7owG46Ck0=; b=St6NcJSMTHMIlxlC8lIdIVkmTJ
 68QeWz5lBSaCoqMtraou2gEKBEFBaZOC98nh+nBAxgo8ErAL2wiv+qaftJoX8pD14qro2XZv0dhvU
 ejPkOLjrPXBtT68qt4vFfve1MntRPKKeNgU8RjzGP3ijVacLrGXV8yvo0c+/M9Tuevb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/k2V3a6IuNUogPtD0BCT7KcvtqpWHV5eTO7owG46Ck0=; b=k
 8Dp8DGsnFwJJQQnd828Y27jmEqUzs5ablSIJvMfACbRc3KHGChVySR6c42S795eMNxvBQiAnl1aAy
 NoFGGuO8nM0lD0VARn81S/xZ7bBUHOp9CqdqmCHA8lR+bNa3vyzWsZHxbZRGtSBEeHsCizqakmeYU
 qbpdba2reMAh231k=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uACHb-0002Bh-Pc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 18:36:04 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-af52a624283so235432a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 11:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746038137; x=1746642937; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/k2V3a6IuNUogPtD0BCT7KcvtqpWHV5eTO7owG46Ck0=;
 b=Jq5WeZMJhdDb8VQKA7tcn1FYz/iMOBvXr7sZyx6Vve5A54yxaha9VE4snd4np4PLYP
 fdskp/4fq6cPZ8q3jXZLKrjPsUruX4c7GqSjzMFen0a6e9WDWJMODBs97hZNz8z/oI79
 V1NDSFgQuMRdB1qOVwpYZwugETOxPDrOtOr//8Pn1WIwPwowyalZMv2b82C3UIhRs3Ob
 KSL+bwioxbhIB5JKAnq8QdN6HdlViwa/3LAJzE0aQfpC7X6Jp6xg4ZR6tZvr8cE8s0YI
 GL1QZwyRzCFfSQtPOgaXGA9FF/3d2IozArLdMgry/JTjuOXBQXF67j4C2aZvJKsX6VHc
 GD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746038137; x=1746642937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/k2V3a6IuNUogPtD0BCT7KcvtqpWHV5eTO7owG46Ck0=;
 b=IZNuKzDLTq5z3dZHTKavraL7ZvLg1g4orrGc24rwm7BorSQaCO05oswO6yBZ1875Wh
 yEjMYaSex7cZkopngwMQ4F2bVj6XxR30AbnxuHHwVV1zpaZchPivLJ+fC1RIH+dWUMlu
 5KiyHv1QQVvZWhzufKp0m3+odJYn2vkuF5VeAoINX5bnV6MuyVcUmRg006eLc9FP5bwX
 AKTYU0AupEQOWrl4i+uGOcSeLkQMhh5u3/j7d1eiAc3KvFyuZN1dY+jHOMfitkwQdPCG
 I0xJRmjoqZQBrwZ981mV/4p0QQO4Ijd6VE8hY4B8Ux7ifT28W15qgmRkTITG8f+WKXGw
 UErA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxxxkyz15hp6iEE5O9iUKK9VCZG/GigXbHS6joU0vb8JWzsi7Wt/cI0LMTB0/tK1yauH6zEvWamg8arzZRa5tH@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyz1X1IN9g36G5NXllqIIC9Hbrx8RbeRfRLuYzZyHZ7cVAGsqhU
 e1KXzBhZn11I1en0BVksmVlXo9ZAf4fxIco2GS3MUIA2BiFzqYci
X-Gm-Gg: ASbGnctan1rSPxW/+XSoeKDYDziuyvN7zUo1cPmSGEEtfvGZdKUokKwVAh/Kv2y5RqS
 ckKK89dZ+46qop34sW4GxrUdoC+wndsg2iqKECxA9dLWontlCI511PT0tJ9lNSnNHLT0ZnhLPM5
 FMKu5uVP0ykTXEHesLXgL+yrKe8PduJzDwp1TYzPyBY2H8gT1TvuYJCT+9xzQcjdHXomukFWGx5
 7mWQKcw01/95q/dkIQauzE8AdUitjhDERv3He2zUtIMWYHUkyY+qdnybIqC9iksMQF7BnZKe+1R
 YpRnLZfkAs4ZWFqSFNAV9E9QmOBwR3B6uqJ/lK+zjk1gItfy3RCDTSZAyE30sdkbkqusDmlmrNu
 bE3y+Fiy7voDqO4Du/IRCm/jb2OuBN88=
X-Google-Smtp-Source: AGHT+IFV1qtxiHtD/XwAlW+boFX6QE8d+DlTnzRF4fb2Ql+KLFq18lOss4tuJEiY0Olsi1bTqL827Q==
X-Received: by 2002:a05:6a20:2d26:b0:1f3:323e:3743 with SMTP id
 adf61e73a8af0-20b9774a6f5mr702896637.12.1746038136743; 
 Wed, 30 Apr 2025 11:35:36 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:68e1:5e8b:62e8:977])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7403991fe17sm2080724b3a.51.2025.04.30.11.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 11:35:36 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 30 Apr 2025 11:35:30 -0700
Message-ID: <20250430183530.3254943-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 [209.85.215.177 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.177 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uACHb-0002Bh-Pc
Subject: [f2fs-dev] [PATCH v5] f2fs-tools: introduce fault injection to fsck
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
v5: add ASSERT_MSG()
v4: fix print type and typos in man page
v3: set limit on fault counts
v2: print fault injection result
---
 fsck/fsck.c       | 131 ++++++++++++++++++++++++++++++++++++----------
 fsck/main.c       |  22 ++++++++
 fsck/mkquota.c    |   5 ++
 include/f2fs_fs.h |  58 ++++++++++++++++++++
 man/fsck.f2fs.8   |  36 +++++++++++++
 5 files changed, 223 insertions(+), 29 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2cff33f..72a632e 100644
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
@@ -397,6 +418,11 @@ err:
 static int sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid,
 						struct node_info *ni)
 {
+	if (time_to_inject(FAULT_NAT)) {
+		ASSERT_MSG("%s is injected.", f2fs_fault_name[FAULT_NAT]);
+		return -EINVAL;
+	}
+
 	if (!IS_VALID_NID(sbi, nid)) {
 		ASSERT_MSG("nid is not valid. [0x%x]", nid);
 		return -EINVAL;
@@ -436,6 +462,11 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	int ret;
 
+	if (time_to_inject(FAULT_NODE)) {
+		ASSERT_MSG("%s is injected.", f2fs_fault_name[FAULT_NODE]);
+		return -EINVAL;
+	}
+
 	ret = sanity_check_nat(sbi, nid, ni);
 	if (ret)
 		return ret;
@@ -865,7 +896,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 				"end of list", nid);
 		need_fix = true;
 	}
-	if (need_fix && c.fix_on) {
+	if ((time_to_inject(FAULT_XATTR_ENT) || need_fix) && c.fix_on) {
 		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
 		write_all_xattrs(sbi, inode, xattr_size, xattr);
 		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
@@ -907,7 +938,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	if (!compressed)
 		goto check_next;
 
-	if (!compr_supported || (node_blk->i.i_inline & F2FS_INLINE_DATA)) {
+	if (time_to_inject(FAULT_COMPR) || !compr_supported ||
+			(node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		/*
 		 * The 'compression' flag in i_flags affects the traverse of
 		 * the node tree.  Thus, it must be fixed unconditionally
@@ -943,12 +975,13 @@ check_next:
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
@@ -1008,7 +1041,8 @@ check_next:
 		if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 			unsigned int isize =
 				le16_to_cpu(node_blk->i.i_extra_isize);
-			if (isize > 4 * DEF_ADDRS_PER_INODE) {
+			if (time_to_inject(FAULT_INODE) ||
+					(isize > 4 * DEF_ADDRS_PER_INODE)) {
 				ASSERT_MSG("[0x%x] wrong i_extra_isize=0x%x",
 						nid, isize);
 				if (c.fix_on) {
@@ -1038,8 +1072,9 @@ check_next:
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
@@ -1056,9 +1091,10 @@ check_next:
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
@@ -1077,7 +1113,8 @@ check_next:
 			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
-		if (blkaddr != NULL_ADDR) {
+		if (time_to_inject(FAULT_INODE) ||
+				(blkaddr != NULL_ADDR)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 					nid, blkaddr);
 			if (c.fix_on) {
@@ -1088,7 +1125,8 @@ check_next:
 				need_fix = 1;
 			}
 		}
-		if (i_size > inline_size) {
+		if (time_to_inject(FAULT_INODE) ||
+				(i_size > inline_size)) {
 			ASSERT_MSG("[0x%x] wrong inline size:%lu",
 					nid, (unsigned long)i_size);
 			if (c.fix_on) {
@@ -1118,7 +1156,7 @@ check_next:
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs]);
 
 		DBG(3, "ino[0x%x] has inline dentry!\n", nid);
-		if (blkaddr != 0) {
+		if (time_to_inject(FAULT_INODE) || (blkaddr != 0)) {
 			ASSERT_MSG("[0x%x] wrong inline reserve blkaddr:%u",
 								nid, blkaddr);
 			if (c.fix_on) {
@@ -1728,6 +1766,11 @@ static int f2fs_check_hash_code(int encoding, int casefolded,
 			struct f2fs_dir_entry *dentry,
 			const unsigned char *name, u32 len, int enc_name)
 {
+	if (time_to_inject(FAULT_DENTRY)) {
+		ASSERT_MSG("%s is injected.", f2fs_fault_name[FAULT_DENTRY]);
+		return 1;
+	}
+
 	/* Casefolded Encrypted names require a key to compute siphash */
 	if (enc_name && casefolded)
 		return 0;
@@ -1806,7 +1849,8 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	int fixed = 0;
 
 	if ((name[0] == '.' && len == 1)) {
-		if (le32_to_cpu(dentry->ino) != child->p_ino) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(le32_to_cpu(dentry->ino) != child->p_ino)) {
 			ASSERT_MSG("Bad inode number[0x%x] for '.', parent_ino is [0x%x]\n",
 				le32_to_cpu(dentry->ino), child->p_ino);
 			dentry->ino = cpu_to_le32(child->p_ino);
@@ -1816,13 +1860,16 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 
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
@@ -1833,7 +1880,7 @@ static int __chk_dots_dentries(struct f2fs_sb_info *sbi,
 	if (f2fs_check_hash_code(get_encoding(sbi), casefolded, dentry, name, len, enc_name))
 		fixed = 1;
 
-	if (name[len] != '\0') {
+	if (time_to_inject(FAULT_DENTRY) || (name[len] != '\0')) {
 		ASSERT_MSG("'.' is not NULL terminated\n");
 		name[len] = '\0';
 		memcpy(*filename, name, len);
@@ -1896,7 +1943,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 			i++;
 			continue;
 		}
-		if (!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				!IS_VALID_NID(sbi, le32_to_cpu(dentry[i].ino))) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid NID/ino 0x%x",
 				    i, le32_to_cpu(dentry[i].ino));
 			if (c.fix_on) {
@@ -1910,7 +1958,9 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 		}
 
 		ftype = dentry[i].file_type;
-		if ((ftype <= F2FS_FT_UNKNOWN || ftype > F2FS_FT_LAST_FILE_TYPE)) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(ftype <= F2FS_FT_UNKNOWN ||
+				 ftype > F2FS_FT_LAST_FILE_TYPE)) {
 			ASSERT_MSG("Bad dentry 0x%x with unexpected ftype 0x%x",
 						le32_to_cpu(dentry[i].ino), ftype);
 			if (c.fix_on) {
@@ -1925,7 +1975,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 
 		name_len = le16_to_cpu(dentry[i].name_len);
 
-		if (name_len == 0 || name_len > F2FS_NAME_LEN) {
+		if (time_to_inject(FAULT_DENTRY) ||
+				(name_len == 0 || name_len > F2FS_NAME_LEN)) {
 			ASSERT_MSG("Bad dentry 0x%x with invalid name_len", i);
 			if (c.fix_on) {
 				FIX_MSG("Clear bad dentry 0x%x", i);
@@ -2160,6 +2211,11 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		return 0;
 	}
 
+	if (time_to_inject(FAULT_DATA)) {
+		ASSERT_MSG("%s is injected.", f2fs_fault_name[FAULT_DATA]);
+		return -EINVAL;
+	}
+
 	if (!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) {
 		ASSERT_MSG("blkaddress is not valid. [0x%x]", blk_addr);
 		return -EINVAL;
@@ -3575,6 +3631,19 @@ int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+void print_fault_cnt(struct f2fs_fault_info *ffi)
+{
+	int i;
+
+	printf("[Fault injection result]\n");
+	for (i = 0; i < FAULT_MAX; i++) {
+		printf("%s: %u", f2fs_fault_name[i], ffi->fault_cnt[i]);
+		if (i < FAULT_MAX - 1)
+			printf(", ");
+	}
+	printf("\n");
+}
+
 int fsck_verify(struct f2fs_sb_info *sbi)
 {
 	unsigned int i = 0;
@@ -3583,12 +3652,16 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
index cb51673..9e7027d 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -92,6 +92,8 @@ void fsck_usage()
 	MSG(0, "  --kernel-check checks kernel change\n");
 	MSG(0, "  --debug-cache to debug cache when -c is used\n");
 	MSG(0, "  --nolinear-lookup=X X=1: disable linear lookup, X=0: enable linear lookup\n");
+	MSG(0, "  --fault_injection=%%d to enable fault injection with specified injection rate\n");
+	MSG(0, "  --fault_type=%%d to configure enabled fault injection type\n");
 	exit(1);
 }
 
@@ -270,6 +272,8 @@ void f2fs_parse_options(int argc, char *argv[])
 			{"kernel-check", no_argument, 0, 3},
 			{"debug-cache", no_argument, 0, 4},
 			{"nolinear-lookup", required_argument, 0, 5},
+			{"fault_injection", required_argument, 0, 6},
+			{"fault_type", required_argument, 0, 7},
 			{0, 0, 0, 0}
 		};
 
@@ -300,6 +304,24 @@ void f2fs_parse_options(int argc, char *argv[])
 				else
 					c.nolinear_lookup = LINEAR_LOOKUP_DISABLE;
 				break;
+			case 6:
+				val = atoi(optarg);
+				if ((unsigned int)val <= 1) {
+					MSG(0, "\tError: injection rate must be larger "
+							"than 1: %d\n", val);
+					fsck_usage();
+				}
+				c.fault_info.inject_rate = val;
+				c.fault_info.inject_type = F2FS_ALL_FAULT_TYPE;
+				break;
+			case 7:
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
index 2451b58..3f491d7 100644
--- a/fsck/mkquota.c
+++ b/fsck/mkquota.c
@@ -372,6 +372,11 @@ errcode_t quota_compare_and_update(struct f2fs_sb_info *sbi,
 	dict_t *dict = qctx->quota_dict[qtype];
 	errcode_t err = 0;
 
+	if (time_to_inject(FAULT_QUOTA)) {
+		ASSERT_MSG("%s is injected.", f2fs_fault_name[FAULT_QUOTA]);
+		return -EINVAL;
+	}
+
 	if (!dict)
 		goto out;
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 12b08fb..c78c039 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -29,6 +29,7 @@
 #include <string.h>
 #include <time.h>
 #include <stdbool.h>
+#include <limits.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -1486,6 +1487,34 @@ enum {
 	LINEAR_LOOKUP_DISABLE,
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
@@ -1616,6 +1645,9 @@ struct f2fs_configuration {
 		struct f2fs_journal nat_jnl;
 		char nat_bytes[F2FS_MAX_BLKSIZE];
 	};
+
+	/* Fault injection control */
+	struct f2fs_fault_info fault_info;
 };
 
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
@@ -2143,4 +2175,30 @@ static inline void check_block_struct_sizes(void)
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
index 606e288..89cc455 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -70,6 +70,42 @@ The default number is 0, which shows basic debugging messages.
 .BI \--nolinear-lookup
 Tune linear lookup fallback, must specify an argument, 0: enable linear lookup, 1: disable linear lookup.
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
+FAULT_SEG_TYPE                   0x00000001
+.br
+FAULT_SUM_TYPE                   0x00000002
+.br
+FAULT_SUM_ENT                    0x00000004
+.br
+FAULT_NAT                        0x00000008
+.br
+FAULT_NODE                       0x00000010
+.br
+FAULT_XATTR_ENT                  0x00000020
+.br
+FAULT_COMPR                      0x00000040
+.br
+FAULT_INODE                      0x00000080
+.br
+FAULT_DENTRY                     0x00000100
+.br
+FAULT_DATA                       0x00000200
+.br
+FAULT_QUOTA                      0x00000400
+.TP
 .SH AUTHOR
 Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.
 Jaegeuk Kim <jaegeuk@kernel.org> reworked most parts of the codes to support
-- 
2.49.0.906.g1f30a19c02-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

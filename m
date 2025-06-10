Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF69AD3D35
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4vkgiqbHSzp5BrMvF72KsyT27xPNgyEDCZh5gjkcMM=; b=boEOUeOEvLRRUTeruPvviUwO/M
	bh4QA3bhDTVyrUOwTcKzDTSMgONm5QI1tSHEl8a7EukOZsz/olhoH56IUB+e9H0yM6MDdEvqh5yUA
	bqqR8pQihFYazANIWKFOMdVFsfyZxamIhAfjg5CvZGzo5D6zw/A8m2bskHLa/Hkh0/IM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0xW-0004is-EV;
	Tue, 10 Jun 2025 15:32:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0xV-0004ik-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWGRVWpKYUbwQO4Sngl5/pxKsLRBpsIEYZ3eb21nAeE=; b=CqVnIM7fXCVpmH6lVHe7XUWMRj
 Hb9rJ9MPXKMNXlY4xL1/+zpoCwoiC9j8R+0UlOgzEffXZR16Ii+cxnvEHSSMJxeWQrzkd2Qd6Kt59
 MZCvsgTVEK44GEEhJsdlSdghmqpyrivRn1+Tt9a7Ql1f8B9v7/tsC1aKYAt41FiTq1LE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWGRVWpKYUbwQO4Sngl5/pxKsLRBpsIEYZ3eb21nAeE=; b=LiY0wwv1UQP9N2PUDBvZ/XdPJ5
 5QCrI9iT9lhnVYwJXQuR9sDnCN3KZaUSveoSuTPVC2Ndexr6V5H1/Tp+xnucMGneE6Rr7fVlgv4ip
 KxvFGjaSpRiXZRnf07JcB27YDF9ogx6bSvZBpTn7ABJsY2Q72XMO0My2f79nm4KCZ6dY=;
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0xU-0005Nr-ND for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:32:17 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2da73155e91so2282797fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569526; x=1750174326; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWGRVWpKYUbwQO4Sngl5/pxKsLRBpsIEYZ3eb21nAeE=;
 b=FjtXhO0VmZ/PGexajv9hNk7T+W48+Nxj/iZMj6eauT5dsoiHUekgMVkAJrER9V84Wm
 8Aby99/7jP+Up2+GjyZiVGZX2hJLeIu70tFwnx8Za9m1VQjFPLCrrYAslQY3kp/tNYC+
 MrpQCkEW5AuT3v92pAmUPWmnmz/e0VkMidDsmErmIvniHGrfXSXTPnFvT2eaJc7dCQP7
 6uzoyU8BChTiRH2JcfBKvZAVu6GkD6sYzzUDKuXRboa9nTi/us4glX2S+u1oUQlhZ60n
 c8qvHt3g6k49DVLikv5B2tk+x3Z9iGglytpILmdNMf8FOPv+yuGk9hvbIRy4vh7/Pvrg
 iGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569526; x=1750174326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWGRVWpKYUbwQO4Sngl5/pxKsLRBpsIEYZ3eb21nAeE=;
 b=JHJmhdgDOS72cEI96cQ49SgatzHasDuH2XaTfue23XFc8PyqSDoTR+DXwmokFhD0fY
 AJDVza6/zaWVG+sKSgGx8Cr8rXedqzuqZMl0Vyd5CysKlKBG0I4/YeLPj6xL9kWezw0D
 uRHzln+xFvLq6BEusLyTR9BAsYpBto+9Itx4kIGLCrFfs6yY5XTiUcWyednIDYmHSTq7
 d7mCa51SBJ4fVPJf4/g542qlOSPKPh86BBzirb1FyIyAZ5WbYyPzv5byKkDhV1XUDJaZ
 zTo/+x8Z1bEIVoNznWjtbza8X9TxoWTy1IEmPM3CfEg6EIKoUbA6pCi5OmZP4aCJK8hL
 5KiA==
X-Gm-Message-State: AOJu0YzeZNTNXMPf2NxorVPWlMfY19+WSOrXrNqoFQ7cu6hESOmV3D+a
 gZpP4ZDdbY0ZliPjQ6pFTxEUGaEKcrsRyja8CKOC5O6xNAiM+33yizxlKIBA8A==
X-Gm-Gg: ASbGncsR+15fqlZJ9iHLx5byhMYPR1H2DEdRLEuyvspMGOrIyub/JXTcfd0k1ZRyUYK
 zBe6+V0H9aHrvPglc6P04OvDbIUsc0N9SC5xw1QlqtpdOB8mEGC42NCNeM43bL1Z7H6Zz+x9JJd
 rLd1UG97jcVOU3seyGkFIdpSNGVWstn8t4YTHvsM0K5M6uJR+1WcMef1on3U96pSL2CIVP/tuQF
 dIwUoAPw6JpnMQSeDxrN5+tvMf2e/KohIdOQaSlkGYFmExS33YBmdUczrjTZ8OOIxps8OmPBO6g
 ab0FsF8ZIkJWlAXZsTHw8DMOaP4o+e0f5Pe/WO64K7Pdpa91H9QGj1HM2mdanHFmTNed
X-Google-Smtp-Source: AGHT+IFAJb3c+ORQtvOiOyKOwnjApOcYtqF7MEQrtvW3cS4JEKyE4wOj73UWYJGzUvp1Fw4uiwVIHg==
X-Received: by 2002:a05:6a00:244f:b0:740:596e:1489 with SMTP id
 d2e1a72fcca58-74827f3d35emr22331142b3a.23.1749559095665; 
 Tue, 10 Jun 2025 05:38:15 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:15 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:17 +0800
Message-ID: <20250610123743.667183-8-shengyong1@xiaomi.com>
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
 Content preview:  From: Sheng Yong Previously when injecting sit/nat entry,
 we only inject SIT/NAT pack. If the valid target is in journal, the injection
 has no effect. So we have to check whether the valid target is in journal,
 and in [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.47 listed in wl.mailspike.net]
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
X-Headers-End: 1uP0xU-0005Nr-ND
Subject: [f2fs-dev] [RFC PATCH v2 07/32] inject.f2fs: fix injecting sit/nat
 in journal
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

Previously when injecting sit/nat entry, we only inject SIT/NAT pack.
If the valid target is in journal, the injection has no effect. So we
have to check whether the valid target is in journal, and inject the
target at its valid position.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c | 181 ++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 132 insertions(+), 49 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index bd6ab8480972..b3228621de48 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -10,6 +10,7 @@
  */
 
 #include <getopt.h>
+#include "f2fs.h"
 #include "node.h"
 #include "inject.h"
 
@@ -533,6 +534,31 @@ out:
 	return ret;
 }
 
+static void rewrite_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
+				   struct f2fs_nat_entry *nat)
+{
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	block_t blkaddr;
+	int ret, i;
+
+	for (i = 0; i < nats_in_cursum(journal); i++) {
+		if (nid_in_journal(journal, i) == nid) {
+			memcpy(&nat_in_journal(journal, i), nat, sizeof(*nat));
+			break;
+		}
+	}
+
+	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_HOT_DATA);
+	else
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_HOT_DATA);
+
+	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
+	ASSERT(ret >= 0);
+}
+
 static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
@@ -541,7 +567,7 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct f2fs_nat_entry *ne;
 	block_t blk_addr;
 	unsigned int offs;
-	bool is_set;
+	bool is_set, in_journal = false;
 	int ret;
 
 	if (!IS_VALID_NID(sbi, opt->nid)) {
@@ -555,38 +581,49 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	nat_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_blk);
 
-	/* change NAT version bitmap temporarily to select specified pack */
-	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
-	if (opt->nat == 0) {
-		opt->nat = is_set ? 2 : 1;
+	if (lookup_nat_in_journal(sbi, opt->nid, &nat_blk->entries[0]) >= 0) {
+		offs = 0;
+		in_journal = true;
 	} else {
-		if (opt->nat == 1)
-			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
-		else
-			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+		/*
+		 * read nat entry from NAT area, change NAT version bitmap
+		 * temporarily to select specified pack
+		 */
+		is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
+		if (opt->nat == 0) {
+			opt->nat = is_set ? 2 : 1;
+		} else {
+			if (opt->nat == 1)
+				f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+			else
+				f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+		}
+		blk_addr = current_nat_addr(sbi, opt->nid, NULL);
+		ret = dev_read_block(nat_blk, blk_addr);
+		ASSERT(ret >= 0);
+		offs = opt->nid % NAT_ENTRY_PER_BLOCK;
 	}
-
-	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
-
-	ret = dev_read_block(nat_blk, blk_addr);
-	ASSERT(ret >= 0);
-
-	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
 	ne = &nat_blk->entries[offs];
 
 	if (!strcmp(opt->mb, "version")) {
 		MSG(0, "Info: inject nat entry version of nid %u "
-		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    "in %s %d: %d -> %d\n", opt->nid,
+		    in_journal ? "journal" : "pack",
+		    in_journal ? 0 : opt->nat,
 		    ne->version, (u8)opt->val);
 		ne->version = (u8)opt->val;
 	} else if (!strcmp(opt->mb, "ino")) {
 		MSG(0, "Info: inject nat entry ino of nid %u "
-		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    "in %s %d: %d -> %d\n", opt->nid,
+		    in_journal ? "journal" : "pack",
+		    in_journal ? 0 : opt->nat,
 		    le32_to_cpu(ne->ino), (nid_t)opt->val);
 		ne->ino = cpu_to_le32((nid_t)opt->val);
 	} else if (!strcmp(opt->mb, "block_addr")) {
 		MSG(0, "Info: inject nat entry block_addr of nid %u "
-		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
+		    "in %s %d: 0x%x -> 0x%x\n", opt->nid,
+		    in_journal ? "journal" : "pack",
+		    in_journal ? 0 : opt->nat,
 		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
 		ne->block_addr = cpu_to_le32((block_t)opt->val);
 	} else {
@@ -596,16 +633,45 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 	print_raw_nat_entry_info(ne);
 
-	ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
-	ASSERT(ret >= 0);
-	/* restore NAT version bitmap */
-	if (is_set)
-		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
-	else
-		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+	if (in_journal) {
+		rewrite_nat_in_journal(sbi, opt->nid, ne);
+	} else {
+		ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
+		ASSERT(ret >= 0);
+		/* restore NAT version bitmap */
+		if (is_set)
+			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+		else
+			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+	}
 
 	free(nat_blk);
-	return ret;
+	return 0;
+}
+
+static void rewrite_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+				   struct f2fs_sit_entry *sit)
+{
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	block_t blkaddr;
+	int ret, i;
+
+	for (i = 0; i < sits_in_cursum(journal); i++) {
+		if (segno_in_journal(journal, i) == segno) {
+			memcpy(&sit_in_journal(journal, i), sit, sizeof(*sit));
+			break;
+		}
+	}
+
+	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_COLD_DATA);
+	else
+		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_COLD_DATA);
+
+	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
+	ASSERT(ret >= 0);
 }
 
 static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
@@ -614,7 +680,7 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct f2fs_sit_block *sit_blk;
 	struct f2fs_sit_entry *sit;
 	unsigned int segno, offs;
-	bool is_set;
+	bool is_set, in_journal = false;
 
 	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
 		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
@@ -627,29 +693,39 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	ASSERT(sit_blk);
 
 	segno = GET_SEGNO(sbi, opt->blk);
-	/* change SIT version bitmap temporarily to select specified pack */
-	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
-	if (opt->sit == 0) {
-		opt->sit = is_set ? 2 : 1;
+	if (lookup_sit_in_journal(sbi, segno, &sit_blk->entries[0]) >= 0) {
+		offs = 0;
+		in_journal = true;
 	} else {
-		if (opt->sit == 1)
-			f2fs_clear_bit(segno, sit_i->sit_bitmap);
-		else
-			f2fs_set_bit(segno, sit_i->sit_bitmap);
+		/*
+		 * read sit entry from SIT area, change SIT version bitmap
+		 * temporarily to select specified pack
+		 */
+		is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
+		if (opt->sit == 0) {
+			opt->sit = is_set ? 2 : 1;
+		} else {
+			if (opt->sit == 1)
+				f2fs_clear_bit(segno, sit_i->sit_bitmap);
+			else
+				f2fs_set_bit(segno, sit_i->sit_bitmap);
+		}
+		get_current_sit_page(sbi, segno, sit_blk);
+		offs = SIT_ENTRY_OFFSET(sit_i, segno);
 	}
-	get_current_sit_page(sbi, segno, sit_blk);
-	offs = SIT_ENTRY_OFFSET(sit_i, segno);
 	sit = &sit_blk->entries[offs];
 
 	if (!strcmp(opt->mb, "vblocks")) {
 		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
-		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
+		    "in %s %d: %u -> %u\n", opt->blk,
+		    in_journal ? "journal" : "pack",
+		    in_journal ? 0 : opt->sit,
 		    le16_to_cpu(sit->vblocks), (u16)opt->val);
 		sit->vblocks = cpu_to_le16((u16)opt->val);
 	} else if (!strcmp(opt->mb, "valid_map")) {
 		if (opt->idx == -1) {
-			MSG(0, "Info: auto idx = %u\n", offs);
-			opt->idx = offs;
+			opt->idx = OFFSET_IN_SEG(sbi, opt->blk);
+			MSG(0, "Info: auto idx = %u\n", opt->idx);
 		}
 		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
 			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
@@ -657,8 +733,10 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 			return -ERANGE;
 		}
 		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
-		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
-		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
+		    "in %s %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
+		    in_journal ? "journal" : "pack",
+		    in_journal ? 0 : opt->sit,
+		    sit->valid_map[opt->idx], (u8)opt->val);
 		sit->valid_map[opt->idx] = (u8)opt->val;
 	} else if (!strcmp(opt->mb, "mtime")) {
 		MSG(0, "Info: inject sit entry mtime of block 0x%x "
@@ -672,12 +750,17 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 	print_raw_sit_entry_info(sit);
 
-	rewrite_current_sit_page(sbi, segno, sit_blk);
-	/* restore SIT version bitmap */
-	if (is_set)
-		f2fs_set_bit(segno, sit_i->sit_bitmap);
-	else
-		f2fs_clear_bit(segno, sit_i->sit_bitmap);
+	if (in_journal) {
+		rewrite_sit_in_journal(sbi, segno, sit);
+	} else {
+		rewrite_current_sit_page(sbi, segno, sit_blk);
+
+		/* restore SIT version bitmap */
+		if (is_set)
+			f2fs_set_bit(segno, sit_i->sit_bitmap);
+		else
+			f2fs_clear_bit(segno, sit_i->sit_bitmap);
+	}
 
 	free(sit_blk);
 	return 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

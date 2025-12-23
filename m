Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06678CD9B6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Dec 2025 15:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/n4yQXt/KeJlItQmOK+SIYOFhprjdFAGK+9zpyeDe3g=; b=PIO4+wbgZ/RVofAUc+RC4T46C+
	Zx8o6tTdicAtR393RsHuVmQjXC/KZX9YjWhRTeYfqGPrZZ/TpE0HoffZdXcHxHi3gCZn/73ezZLdg
	TzTMuAtTcYB6TrNp5wG9qKizdjCFGlMU0mwlEIwVi1/+9oFhZDMfgKRLo0bkzhO+s3fg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vY3ec-0000NY-6n;
	Tue, 23 Dec 2025 14:46:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vY3ea-0000NR-Np
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 14:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAWmp6Bybw1b1H0Hazb+3PEJBLI9ju56nG5hq1iBcj4=; b=hPwXHslatXKqA+eQImr/2UMqqZ
 klchz57IFZf8+/dk1LN12oIzuU9LXz80uu3fiRJ33o8zDjZ/C/I9OQrxd5wQ527hS4CNLCmzIrTOY
 SzFcRAzV6TRhYwNNY9AHTDDzwN3c4ZmAc3G5CbGUlZbi6SEocJ+yu3nYOm55H4yaUsuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KAWmp6Bybw1b1H0Hazb+3PEJBLI9ju56nG5hq1iBcj4=; b=T
 UrpR+iLpu7nPo+mcYeYjf6omS6HHkHOExJUf2pgU5n1wWxF9gtMBWoIV2KAR19vCPjT9jmRYyO3TP
 orSQ7LhIXeBY99R7J56TqUHAzNxINxzpIfccCR3kIYraz9/SKTxgCeK+AG5BWjPfb5YN076TpP6Vo
 Liovf7K6g7CndjfA=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vY3eZ-0007m1-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 14:46:24 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-bf5ac50827dso3212975a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Dec 2025 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766501173; x=1767105973; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KAWmp6Bybw1b1H0Hazb+3PEJBLI9ju56nG5hq1iBcj4=;
 b=lTnLlOBELcoV4610KNbsfQG5sIepBZxqm5gre+5GETt/l98/aM//KgYUKETvcOdpCL
 IDB7j/kd8RO/qStVrbYWJOwqEQF85sQhXmjDDoi2LDcMzqlV1cS88u6mHLEcrDwnM9QW
 o4X6PZnjbJOpWDt3UO0SQAiT5C4N1CKpTqcjyIj3e9wFJjIgXRATl6ujPfmVnA/hfew7
 WMeCcqxzF75R3YY/A1/OrjWC6+1naw2ondu6zb61tn8CM6buhXlDSuqg2faN2a3TA889
 qPybMcycEz1VfMRlzzb22R9/NdiFhPVGq8btR/IlDPheNuw8RBB6puVFDJOkHlralEKV
 6GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766501173; x=1767105973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAWmp6Bybw1b1H0Hazb+3PEJBLI9ju56nG5hq1iBcj4=;
 b=l4liGDMeCdxAUyExWO6LKS7KEuhNK91n0pFhUUFVIXio5/+l2JxhOZ1PopAVzBw7j7
 qiZb9fL+CHXSv0DEowu+BG4rmOGx3ccAkA3w3Z1QKGtsnBNYGou30ZykEKS8x2jlVwNn
 QDrtAUpKM4QPdvBAPBmCSt2Rm/eBNKKXTl9b1lw5CtTmC2iTNvWOXyStfzv5InIsRgf0
 /zpgbeLjZQlFMnGtq0f1N+wAIFSTMLFGK2B1rgezZCjM8qkwzPdYwdt5OKCm8kKEENer
 WKnqUqsSTD/Wvr8dD5JW8lF77fARZBNcrpG7sV0t9uXszt6sHOrcm2MpLWxVhZVCWpnl
 kdEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOFR8DSmMZWt26numLtU/zz4rra8K5haCJgcd3y5TAeGeBmzK9RWMwZ8gcD3FkwS6PtBbMRz9ypn5Cp/ONE4mH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwuqRuVB32jpN1Q/AhaO18LJD5PUc+q1jfWktxWQddAR6hBAkag
 PHvNM1xQrr2gn0i3FoUiS6DiFxwJrdCTbeX1IhQ6KqfnWtU+5BsCYCO8EDWcYw==
X-Gm-Gg: AY/fxX5yJODUzb4H4GgW28QsJsk9KNg6Cz8L3HRpdKl8abFfhRiaSm9vYvjtSuu5bUv
 dZ/V6K2mApG43aWtmOs/oz26UjwfjIYzxWNZOBjPQJ1lkEAf4v8h8pwMy4OCGWgmiLrLji3Rm5X
 /LX8gQBuBYGx6k1rJEJhzuSCu35BKgBHb9ipwtFpwYuMulkwhzTfjld6ddgGoiaRFUo/yIRpaGa
 qeENxbdiOrK54Savu0vyA4PMKGBF0tvXzfIZ5A7o2+DP2fIeJLJuTB5m6gESGb1yS+LaJqk3F4p
 yYuZA1UfwrnJgNJSyy5hM3iGekrR6gSsfTvb8Wu9B4wq+JUK8eJVoTEAEX/qxosK3kz9j8ciZIH
 be0vxUxip/yO2r5T5axDmqE6DWnFXURqZx2QY4bB5y0w0oFBbx96ZDWTDTfOvusibuehqMHciXT
 ZWNbZ9mBDe5R0EN5021+Aaqhz3akBB35dW+MSgiEtqXlk0vWsU9AauGmU1VJNTZXueDkZGbf/nC
 fyegKudF52HS24F/g==
X-Google-Smtp-Source: AGHT+IHXRDo7xVAN/+JVaC8m7qk25hGD4IhxYfAeNvwgYhNlFQA2VBS+Bw0NXe+eZfzIdck9M5khbw==
X-Received: by 2002:a05:7022:2586:b0:11d:f037:891c with SMTP id
 a92af1059eb24-12172311ffamr11277832c88.44.1766501172431; 
 Tue, 23 Dec 2025 06:46:12 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:7c0a:9ce9:e0f0:d0a7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm59244216c88.0.2025.12.23.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 06:46:11 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 23 Dec 2025 06:46:07 -0800
Message-ID: <20251223144607.1473230-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong The recent increase in the number of
 Segment
 Summary Area (SSA) entries from 512 to 2048 was an unintentional change in
 logic of 16kb block support. This commit corrects the issue. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vY3eZ-0007m1-Gd
Subject: [f2fs-dev] [PATCH v6] f2fs-tools: revert summary entry count from
 2048 to 512 in 16kb block support
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

The recent increase in the number of Segment Summary Area (SSA) entries
from 512 to 2048 was an unintentional change in logic of 16kb block
support. This commit corrects the issue.

To better utilize the space available from the erroneous 2048-entry
calculation, we are implementing a solution to share the currently
unused SSA space with neighboring segments. This enhances overall
SSA utilization without impacting the established 8MB segment size.

Fixes: 50fd00b168d7 ("f2fs-tools: Support different block sizes")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v6: adjust buffer size and minor style fix
v5: support both old and new format with packed_ssa feature option
v4: move enabling the feature position.
v3: add a feature to prevent from mounting deprecated format
v2: detect legacy layout and prevent mount.
    fix ssa block calculation bug in resize tool.
---
 fsck/f2fs.h             | 27 ++++++++++-
 fsck/fsck.c             | 16 +++----
 fsck/inject.c           |  4 +-
 fsck/mount.c            | 55 +++++++++++------------
 fsck/resize.c           | 99 ++++++++++++++++++++++++++---------------
 include/f2fs_fs.h       | 18 +++++---
 lib/libf2fs_io.c        | 12 +++++
 mkfs/f2fs_format.c      | 10 ++++-
 mkfs/f2fs_format_main.c |  6 +++
 9 files changed, 161 insertions(+), 86 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 60e3a2e..5e7eb63 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -447,12 +447,37 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 	(SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :				\
 		le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment0_blkaddr))
 
+#define SUMS_PER_BLOCK (F2FS_BLKSIZE / F2FS_SUM_BLKSIZE)
 #define GET_SUM_BLKADDR(sbi, segno)					\
-	((sbi->sm_info->ssa_blkaddr) + segno)
+	(c.feature & F2FS_FEATURE_PACKED_SSA ? \
+	((SM_I(sbi)->ssa_blkaddr) + (segno) / SUMS_PER_BLOCK) : \
+	((SM_I(sbi)->ssa_blkaddr) + (segno)))
+#define GET_SUM_BLKOFF(segno)					\
+	(c.feature & F2FS_FEATURE_PACKED_SSA ? \
+	((segno) % SUMS_PER_BLOCK) : 0)
 
 #define GET_SEGOFF_FROM_SEG0(sbi, blk_addr)				\
 	((blk_addr) - SM_I(sbi)->seg0_blkaddr)
 
+static inline int write_sum_block(struct f2fs_sb_info *sbi,
+		void *buf, unsigned int segno, enum rw_hint whint)
+{
+	if (c.feature & F2FS_FEATURE_PACKED_SSA)
+		return dev_write_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
+				GET_SUM_BLKOFF(segno), whint);
+	return dev_write_block(buf, GET_SUM_BLKADDR(sbi, segno), whint);
+}
+
+static inline int read_sum_block(struct f2fs_sb_info *sbi,
+		void *buf, unsigned int segno)
+{
+	if (c.feature & F2FS_FEATURE_PACKED_SSA)
+		return dev_read_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
+				GET_SUM_BLKOFF(segno));
+	return dev_read_block(buf, GET_SUM_BLKADDR(sbi, segno));
+}
+
+
 #define GET_SEGNO_FROM_SEG0(sbi, blk_addr)				\
 	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) >> sbi->log_blocks_per_seg)
 
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 0b53c67..db44f9d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -228,11 +228,9 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 		}
 	}
 	if (need_fix && f2fs_dev_is_writable()) {
-		u64 ssa_blk;
 		int ret2;
 
-		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
-		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
+		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 		ASSERT(ret2 >= 0);
 	}
 out:
@@ -367,11 +365,9 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 		}
 	}
 	if (need_fix && f2fs_dev_is_writable()) {
-		u64 ssa_blk;
 		int ret2;
 
-		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
-		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
+		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 		ASSERT(ret2 >= 0);
 	}
 out:
@@ -3879,14 +3875,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			rewrite_sit_area_bitmap(sbi);
 			if (c.zoned_model == F2FS_ZONED_HM) {
 				struct curseg_info *curseg;
-				u64 ssa_blk;
 
 				for (i = 0; i < NO_CHECK_TYPE; i++) {
 					curseg = CURSEG_I(sbi, i);
-					ssa_blk = GET_SUM_BLKADDR(sbi,
-							curseg->segno);
-					ret = dev_write_block(curseg->sum_blk,
-							ssa_blk,
+					ret = write_sum_block(sbi,
+							curseg->sum_blk,
+							curseg->segno,
 							WRITE_LIFE_NONE);
 					ASSERT(ret >= 0);
 				}
diff --git a/fsck/inject.c b/fsck/inject.c
index 0e46b1b..b00e356 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -935,7 +935,6 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct summary_footer *footer;
 	struct f2fs_summary *sum;
 	u32 segno, offset;
-	block_t ssa_blkaddr;
 	int type;
 	int ret;
 
@@ -1000,8 +999,7 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
 
 	print_sum_footer_info(footer);
 
-	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
-	ret = dev_write_block(sum_blk, ssa_blkaddr, WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 
 out:
diff --git a/fsck/mount.c b/fsck/mount.c
index f03fa2d..6f640a0 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2150,6 +2150,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 	struct curseg_info *curseg;
 	unsigned int segno = 0;
 	block_t blk_addr = 0;
+	__u32 blk_offset = 0;
 	int ret;
 
 	if (IS_DATASEG(type)) {
@@ -2160,24 +2161,29 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			blk_addr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, type);
 	} else {
 		segno = get_cp(cur_node_segno[type - CURSEG_HOT_NODE]);
-		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
 			blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
 							type - CURSEG_HOT_NODE);
-		else
+		} else {
 			blk_addr = GET_SUM_BLKADDR(sbi, segno);
+			blk_offset = GET_SUM_BLKOFF(segno);
+		}
 	}
 
-	sum_blk = malloc(F2FS_BLKSIZE);
+	sum_blk = malloc(F2FS_SUM_BLKSIZE);
 	ASSERT(sum_blk);
 
-	ret = dev_read_block(sum_blk, blk_addr);
+	if (c.feature & F2FS_FEATURE_PACKED_SSA)
+		ret = dev_read_4k_block(sum_blk, blk_addr, blk_offset);
+	else
+		ret = dev_read_block(sum_blk, blk_addr);
 	ASSERT(ret >= 0);
 
 	if (IS_NODESEG(type) && !is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
 		restore_node_summary(sbi, segno, sum_blk);
 
 	curseg = CURSEG_I(sbi, type);
-	memcpy(curseg->sum_blk, sum_blk, F2FS_BLKSIZE);
+	memcpy(curseg->sum_blk, sum_blk, F2FS_SUM_BLKSIZE);
 	reset_curseg(sbi, type);
 	free(sum_blk);
 }
@@ -2205,8 +2211,7 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
 							SUM_TYPE_DATA;
 
 	/* write SSA all the time */
-	ret = dev_write_block(sum_blk, GET_SUM_BLKADDR(sbi, segno),
-			      WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 
 	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
@@ -2244,7 +2249,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 	SM_I(sbi)->curseg_array = array;
 
 	for (i = 0; i < NR_CURSEG_TYPE; i++) {
-		array[i].sum_blk = calloc(F2FS_BLKSIZE, 1);
+		array[i].sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
 		if (!array[i].sum_blk) {
 			MSG(1, "\tError: Calloc failed for build_curseg!!\n");
 			goto seg_cleanup;
@@ -2405,11 +2410,9 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	struct f2fs_summary_block *sum_blk;
 	struct curseg_info *curseg;
 	int type, ret;
-	u64 ssa_blk;
 
 	*ret_type= SEG_TYPE_MAX;
 
-	ssa_blk = GET_SUM_BLKADDR(sbi, segno);
 	for (type = 0; type < NR_CURSEG_NODE_TYPE; type++) {
 		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
 		if (segno == curseg->segno) {
@@ -2440,10 +2443,10 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	sum_blk = calloc(F2FS_BLKSIZE, 1);
+	sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
 	ASSERT(sum_blk);
 
-	ret = dev_read_block(sum_blk, ssa_blk);
+	ret = read_sum_block(sbi, sum_blk, segno);
 	ASSERT(ret >= 0);
 
 	if (IS_SUM_NODE_SEG(sum_blk))
@@ -3059,8 +3062,7 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 	if (c.zoned_model == F2FS_ZONED_HM && !new_sec) {
 		struct curseg_info *curseg = CURSEG_I(sbi, want_type);
 		unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
-		char buf[F2FS_BLKSIZE];
-		u64 ssa_blk;
+		char buf[F2FS_SUM_BLKSIZE];
 		int ret;
 
 		*to = NEXT_FREE_BLKADDR(sbi, curseg);
@@ -3078,17 +3080,15 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 				segno = GET_SEGNO(sbi, new_blkaddr);
 			}
 
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_write_block(curseg->sum_blk, ssa_blk,
-					      WRITE_LIFE_NONE);
+			ret = write_sum_block(sbi, curseg->sum_blk,
+					curseg->segno, WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
 
 			curseg->segno = segno;
 			curseg->next_blkoff = 0;
 			curseg->alloc_type = LFS;
 
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_read_block(&buf, ssa_blk);
+			ret = read_sum_block(sbi, &buf, curseg->segno);
 			ASSERT(ret >= 0);
 
 			memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
@@ -3164,9 +3164,9 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, i);
-	char buf[F2FS_BLKSIZE];
+	char buf[F2FS_SUM_BLKSIZE];
 	u32 old_segno;
-	u64 ssa_blk, to;
+	u64 to;
 	int ret;
 
 	if ((get_sb(feature) & F2FS_FEATURE_RO)) {
@@ -3184,8 +3184,8 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 	}
 
 	/* update original SSA too */
-	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-	ret = dev_write_block(curseg->sum_blk, ssa_blk, WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, curseg->sum_blk, curseg->segno,
+			WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 bypass_ssa:
 	to = from;
@@ -3199,8 +3199,7 @@ bypass_ssa:
 	curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
 
 	/* update new segno */
-	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-	ret = dev_read_block(buf, ssa_blk);
+	ret = read_sum_block(sbi, buf, curseg->segno);
 	ASSERT(ret >= 0);
 
 	memcpy(curseg->sum_blk, buf, SUM_ENTRIES_SIZE);
@@ -3464,7 +3463,6 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	/* update summary blocks having nullified journal entries */
 	for (i = 0; i < NO_CHECK_TYPE; i++) {
 		struct curseg_info *curseg = CURSEG_I(sbi, i);
-		u64 ssa_blk;
 
 		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
 			continue;
@@ -3475,9 +3473,8 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 
 		if (!(get_sb(feature) & F2FS_FEATURE_RO)) {
 			/* update original SSA too */
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_write_block(curseg->sum_blk, ssa_blk,
-					      WRITE_LIFE_NONE);
+			ret = write_sum_block(sbi, curseg->sum_blk,
+					curseg->segno, WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
 		}
 	}
diff --git a/fsck/resize.c b/fsck/resize.c
index bef05d6..e650283 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -115,7 +115,11 @@ static int get_new_sb(struct f2fs_super_block *sb)
 			get_sb(segment_count_sit) +
 			get_sb(segment_count_nat))) * blks_per_seg;
 
-	blocks_for_ssa = total_valid_blks_available / blks_per_seg + 1;
+	if (c.feature & F2FS_FEATURE_PACKED_SSA)
+		blocks_for_ssa = round_up(total_valid_blks_available / blks_per_seg,
+				SUMS_PER_BLOCK);
+	else
+		blocks_for_ssa = total_valid_blks_available / blks_per_seg + 1;
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
 
@@ -209,23 +213,36 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
 				START_BLOCK(sbi, 0) + offset);
 }
 
-static void move_ssa(struct f2fs_sb_info *sbi, unsigned int segno,
-					block_t new_sum_blk_addr)
+#define GET_SUM_NEW_BLKADDR(new_sb, segno)	\
+	(c.feature & F2FS_FEATURE_PACKED_SSA ?	\
+	(get_newsb(ssa_blkaddr) +		\
+	 (segno >> (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS))) :	\
+	(get_newsb(ssa_blkaddr) + segno))
+#define GET_SUM_NEW_BLKOFF(new_sb, segno)	\
+	(c.feature & F2FS_FEATURE_PACKED_SSA ?	\
+	(segno % (1 << (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS))) : 0)
+
+static void move_ssa(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb,
+		unsigned int old_segno, unsigned int new_segno)
 {
 	struct f2fs_summary_block *sum_blk;
 	int type;
 
-	sum_blk = get_sum_block(sbi, segno, &type);
+	sum_blk = get_sum_block(sbi, old_segno, &type);
 	if (type < SEG_TYPE_MAX) {
 		int ret;
-
-		ret = dev_write_block(sum_blk, new_sum_blk_addr,
-				      WRITE_LIFE_NONE);
+		u64 new_blkaddr = GET_SUM_NEW_BLKADDR(new_sb, new_segno);
+		if (c.feature & F2FS_FEATURE_PACKED_SSA)
+			ret = dev_write_4k_block(sum_blk, new_blkaddr,
+					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					WRITE_LIFE_NONE);
+		else
+			ret = dev_write_block(sum_blk, new_blkaddr,
+					WRITE_LIFE_NONE);
 		ASSERT(ret >= 0);
 		DBG(1, "Write summary block: (%d) segno=%x/%x --> (%d) %x\n",
-				type, segno, GET_SUM_BLKADDR(sbi, segno),
-				IS_SUM_NODE_SEG(sum_blk),
-				new_sum_blk_addr);
+			type, old_segno, GET_SUM_BLKADDR(sbi, old_segno),
+			IS_SUM_NODE_SEG(sum_blk), (unsigned int)new_blkaddr);
 	}
 	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
 			type == SEG_TYPE_MAX) {
@@ -240,36 +257,48 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
-	block_t end_sum_blkaddr = get_newsb(main_blkaddr);
-	block_t expand_sum_blkaddr = new_sum_blkaddr +
-					MAIN_SEGS(sbi) - offset;
-	block_t blkaddr;
-	int ret;
-	void *zero_block = calloc(F2FS_BLKSIZE, 1);
+	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
+	unsigned int new_seg_total = get_newsb(segment_count);
+	int new_segno;
+	int ret = 0;
+	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
 	ASSERT(zero_block);
 
-	if (offset && new_sum_blkaddr < old_sum_blkaddr + offset) {
-		blkaddr = new_sum_blkaddr;
-		while (blkaddr < end_sum_blkaddr) {
-			if (blkaddr < expand_sum_blkaddr) {
-				move_ssa(sbi, offset++, blkaddr++);
-			} else {
-				ret = dev_write_block(zero_block, blkaddr++,
-						      WRITE_LIFE_NONE);
-				ASSERT(ret >=0);
-			}
+	if (offset && new_sum_blkaddr <= (old_sum_blkaddr +
+				offset / SUMS_PER_BLOCK)) {
+		new_segno = 0;
+		while (new_segno < new_seg_total) {
+			if (new_segno < expand_segno)
+				move_ssa(sbi, new_sb, offset++, new_segno);
+			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
+				ret = dev_write_4k_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					WRITE_LIFE_NONE);
+			else
+				ret = dev_write_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					WRITE_LIFE_NONE);
+			ASSERT(ret >= 0);
+			new_segno++;
 		}
 	} else {
-		blkaddr = end_sum_blkaddr - 1;
+		new_segno = new_seg_total - 1;
 		offset = MAIN_SEGS(sbi) - 1;
-		while (blkaddr >= new_sum_blkaddr) {
-			if (blkaddr >= expand_sum_blkaddr) {
-				ret = dev_write_block(zero_block, blkaddr--,
-						      WRITE_LIFE_NONE);
-				ASSERT(ret >=0);
-			} else {
-				move_ssa(sbi, offset--, blkaddr--);
-			}
+		while (new_segno >= 0) {
+			if (new_segno < expand_segno)
+				move_ssa(sbi, new_sb, offset--, new_segno);
+			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
+				ret = dev_write_4k_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					WRITE_LIFE_NONE);
+			else
+				ret = dev_write_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					WRITE_LIFE_NONE);
+			ASSERT(ret >= 0);
+			new_segno--;
 		}
 	}
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index b85ded2..3095b59 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -655,6 +655,8 @@ enum {
 #define F2FS_MIN_BLKSIZE		4096
 #define F2FS_MAX_BLKSIZE		16384
 #define F2FS_BLKSIZE			c.blksize	/* support configurable block size */
+#define F2FS_SUM_BLKSIZE	((c.feature & F2FS_FEATURE_PACKED_SSA) ? \
+					F2FS_MIN_BLKSIZE : F2FS_BLKSIZE)
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
@@ -715,6 +717,7 @@ enum {
 #define F2FS_FEATURE_COMPRESSION	0x2000
 #define F2FS_FEATURE_RO			0x4000
 #define F2FS_FEATURE_DEVICE_ALIAS	0x8000
+#define F2FS_FEATURE_PACKED_SSA		0x10000
 
 #define MAX_NR_FEATURE			32
 
@@ -1219,7 +1222,7 @@ struct f2fs_sit_block {
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
+#define ENTRIES_IN_SUM		(F2FS_SUM_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
 #define SUM_ENTRIES_SIZE	(SUMMARY_SIZE * ENTRIES_IN_SUM)
@@ -1249,7 +1252,7 @@ struct summary_footer {
 
 static_assert(sizeof(struct summary_footer) == 5, "");
 
-#define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
+#define SUM_JOURNAL_SIZE	(F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE -\
 				SUM_ENTRIES_SIZE)
 #define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
 				sizeof(struct nat_journal_entry))
@@ -1348,7 +1351,7 @@ struct f2fs_summary_block {
 };
 #define F2FS_SUMMARY_BLOCK_JOURNAL(blk) ((struct f2fs_journal *)(&(blk)->entries[ENTRIES_IN_SUM]))
 #define F2FS_SUMMARY_BLOCK_FOOTER(blk) ((struct summary_footer *)&((char *)\
-					(&(blk)->entries[0]))[F2FS_BLKSIZE - SUM_FOOTER_SIZE])
+		(&(blk)->entries[0]))[F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE])
 
 /*
  * For directory operations
@@ -1711,6 +1714,8 @@ extern int dev_fill_block(void *, __u64, enum rw_hint);
 
 extern int dev_read_block(void *, __u64);
 extern int dev_reada_block(__u64);
+extern int dev_write_4k_block(void *, __u64, __u32, enum rw_hint);
+extern int dev_read_4k_block(void *, __u64, __u32);
 
 extern int dev_read_version(void *, __u64, size_t);
 extern void get_kernel_version(__u8 *);
@@ -2022,6 +2027,7 @@ struct feature feature_table[] = {					\
 	{ "compression",		F2FS_FEATURE_COMPRESSION,	1}, \
 	{ "ro",				F2FS_FEATURE_RO,		1}, \
 	{ "device_alias",		F2FS_FEATURE_DEVICE_ALIAS,	0}, \
+	{ "packed_ssa",			F2FS_FEATURE_PACKED_SSA,	1}, \
 	{ NULL,				0x0,				0}, \
 };
 
@@ -2161,18 +2167,18 @@ static inline void check_block_struct_sizes(void)
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
 			+ offsetof(struct f2fs_journal, nat_j)
 			+ NAT_JOURNAL_ENTRIES * sizeof(struct nat_journal_entry)
-			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check SIT Journal Block Size */
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
 			+ offsetof(struct f2fs_journal, sit_j)
 			+ SIT_JOURNAL_ENTRIES * sizeof(struct sit_journal_entry)
-			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check Info Journal Block Size */
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
 			+ offsetof(struct f2fs_journal, info)
-			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check Dentry Block Size */
 	assert(sizeof(__u8) * (SIZE_OF_DENTRY_BITMAP + SIZE_OF_RESERVED)
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index c31f3b8..6aafa0f 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -734,6 +734,18 @@ int dev_reada_block(__u64 blk_addr)
 	return dev_readahead(blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
 }
 
+int dev_write_4k_block(void *buf, __u64 blk_addr, __u32 offset, enum rw_hint whint)
+{
+	return dev_write(buf, (blk_addr << F2FS_BLKSIZE_BITS) +
+			offset * F2FS_MIN_BLKSIZE, F2FS_MIN_BLKSIZE, whint);
+}
+
+int dev_read_4k_block(void *buf, __u64 blk_addr, __u32 offset)
+{
+	return dev_read(buf, (blk_addr << F2FS_BLKSIZE_BITS) +
+			offset * F2FS_MIN_BLKSIZE, F2FS_MIN_BLKSIZE);
+}
+
 int f2fs_fsync_device(void)
 {
 #ifdef HAVE_FSYNC
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d05e897..b3dccd0 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -500,8 +500,16 @@ static int f2fs_prepare_super_block(void)
 	if (c.feature & F2FS_FEATURE_RO) {
 		blocks_for_ssa = 0;
 	} else {
+		unsigned int ssa_per_block;
+
 		ASSERT((total_valid_blks_available % c.blks_per_seg) == 0);
-		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
+		if (c.feature & F2FS_FEATURE_PACKED_SSA) {
+			ssa_per_block = c.blksize / F2FS_SUM_BLKSIZE;
+			blocks_for_ssa = round_up(total_valid_blks_available /
+					c.blks_per_seg, ssa_per_block);
+		} else {
+			blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
+		}
 	}
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 8f8e975..8d44a9b 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -380,6 +380,12 @@ static void f2fs_parse_options(int argc, char *argv[])
 		}
 	}
 
+	if ((c.feature & F2FS_FEATURE_PACKED_SSA) &&
+			(c.blksize == F2FS_MIN_BLKSIZE)) {
+		c.feature &= ~F2FS_FEATURE_PACKED_SSA;
+		MSG(0, "\tInfo: packed_ssa feature is disabled for 4k block.\n");
+	}
+
 	if (optind >= argc) {
 		MSG(0, "\tError: Device not specified\n");
 		mkfs_usage();
-- 
2.52.0.351.gbe84eed79e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

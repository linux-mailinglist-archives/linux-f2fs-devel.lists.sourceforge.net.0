Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C02132071B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2019 14:41:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hRFhN-0002FE-OT; Thu, 16 May 2019 12:41:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hRFhM-0002Ey-BO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 12:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GaBp3iXeFauInpM04DWEK3m06EnRWNO61+E9ERWI33g=; b=NexhHgazRImJI1VCJeAzMi6Q7U
 ToKdpmyNwwWGWsPZVJTLUxCLteIapmSKgAJoQe5a3s7B4VS728xKrNZ1IfiVu7p7n5SGZJYcTe114
 iTVo7ggNyXGGijPfz7oNvEbvRalu8y6xcrySImgisPAPamedcU3RrN3+whU5T+sRbaOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GaBp3iXeFauInpM04DWEK3m06EnRWNO61+E9ERWI33g=; b=O9ApH2UjppG9ZziSsPFbPY8ltM
 qUJQZ747f3glFa+PPnAEBIRuYTAdMbfKhGP+67iDqFCv2HhjC2SCvBEq+7GZVzynl2Gz2EoZtTq7G
 OWbNkOPzVvxBNS8eN4s4owpKY8NY/w6fQWN4qD26wVizBa5fhBbpOeA3JcwKh3+C5asQ=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hRFhD-000pB9-JU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 12:41:19 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 96ADAAE412D2DD01526C;
 Thu, 16 May 2019 20:41:06 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 May 2019 20:41:04 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 16 May 2019 20:41:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 16 May 2019 20:40:43 +0800
Message-ID: <20190516124043.90103-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190516124043.90103-1-yuchao0@huawei.com>
References: <20190516124043.90103-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme757-chm.china.huawei.com (10.3.19.103) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hRFhD-000pB9-JU
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: update curseg
 .next_blkoff/.alloc_type preferential
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If .next_blkoff is inconsistent, we can update curseg .next_blkoff
to first unused block address, and change .alloc_type to SSR
preferential, instead of move curseg to other position.

This can help to repair fuzzed image which has no more free segment.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c  | 23 ++++++++++++++++++-----
 fsck/fsck.h  |  1 +
 fsck/mount.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b10b201..6075d22 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2172,6 +2172,23 @@ int check_curseg_offsets(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+static void fix_curseg_info(struct f2fs_sb_info *sbi)
+{
+	int i, need_update = 0;
+
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		if (check_curseg_offset(sbi, i)) {
+			update_curseg_info(sbi, i);
+			need_update = 1;
+		}
+	}
+
+	if (need_update) {
+		write_curseg_info(sbi);
+		flush_curseg_sit_entries(sbi);
+	}
+}
+
 int check_sit_types(struct f2fs_sb_info *sbi)
 {
 	unsigned int i;
@@ -2760,11 +2777,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
-			if (check_curseg_offsets(sbi)) {
-				move_curseg_info(sbi, SM_I(sbi)->main_blkaddr, 0);
-				write_curseg_info(sbi);
-				flush_curseg_sit_entries(sbi);
-			}
+			fix_curseg_info(sbi);
 			fix_checksum(sbi);
 			fix_checkpoint(sbi);
 		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 72076eb..270597a 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -184,6 +184,7 @@ extern void f2fs_do_umount(struct f2fs_sb_info *);
 extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
 
 extern void flush_journal_entries(struct f2fs_sb_info *);
+extern void update_curseg_info(struct f2fs_sb_info *, int);
 extern void zero_journal_entries(struct f2fs_sb_info *);
 extern void flush_sit_entries(struct f2fs_sb_info *);
 extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
diff --git a/fsck/mount.c b/fsck/mount.c
index f596722..3dd6711 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2169,6 +2169,30 @@ void flush_sit_entries(struct f2fs_sb_info *sbi)
 	free(sit_blk);
 }
 
+int relocate_curseg_offset(struct f2fs_sb_info *sbi, int type)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
+	unsigned int i;
+
+	for (i = 0; i < sbi->blocks_per_seg; i++) {
+		if (!f2fs_test_bit(i, (const char *)se->cur_valid_map))
+			break;
+	}
+
+	if (i == sbi->blocks_per_seg)
+		return -EINVAL;
+
+	DBG(1, "Update curseg[%d].next_blkoff %u -> %u, alloc_type %s -> SSR\n",
+			type, curseg->next_blkoff, i,
+			curseg->alloc_type == LFS ? "LFS" : "SSR");
+
+	curseg->next_blkoff = i;
+	curseg->alloc_type = SSR;
+
+	return 0;
+}
+
 int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int type)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -2265,6 +2289,13 @@ void move_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left)
 	}
 }
 
+void update_curseg_info(struct f2fs_sb_info *sbi, int type)
+{
+	if (!relocate_curseg_offset(sbi, type))
+		return;
+	move_curseg_info(sbi, SM_I(sbi)->main_blkaddr, 0);
+}
+
 void zero_journal_entries(struct f2fs_sb_info *sbi)
 {
 	int i;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

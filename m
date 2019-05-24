Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F829229
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 09:56:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU54S-0006IE-Le; Fri, 24 May 2019 07:56:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hU54R-0006I3-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 07:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2vnvAm8SJ8N7mpLFN/gWy5L8Xt/YguTi126dwmkh3Y=; b=eIxPPaVx3FWmO/wRC3jUbb6Zlf
 CH+i+MagseZSics6tVANwodmNqaL54uOhKys1YAbVyQ59vjobqMEqjxXUo9Wz7KqX4AnRrvRty6ou
 C0NSpG4+yCSwj7B7UPjQHQ+N0WBiCLHegM9aoBJQBZb145e7gqqLzP3GzhM+PTYWWkXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K2vnvAm8SJ8N7mpLFN/gWy5L8Xt/YguTi126dwmkh3Y=; b=B
 sKbRLaBbRoydaeJKNRCKawHntaIz6/0PmZE729b5LtBiBobloGzdipp3F5senxX5J3wWgsjQ45Nyy
 SUOgg4dr0knBj4X8qhvCbbaC0jNBXedEzQ+BCcjb0o2xa7ApRDUFZt081XPmQQXoXKvqe/oej7zUA
 v2cUmxAhOGOXRlKU=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU54P-005hFR-IU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 07:56:55 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 6C64F603ABC4F116B8BF;
 Fri, 24 May 2019 15:56:45 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 May 2019 15:56:45 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 May 2019 15:56:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 24 May 2019 15:56:27 +0800
Message-ID: <20190524075627.107151-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
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
X-Headers-End: 1hU54P-005hFR-IU
Subject: [f2fs-dev] [PATCH] fsck.f2fs: write checkpoint with OPU mode
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

This original patch was from Weichao Guo.

We may encounter both checkpoints invalid in such a case:
1. kernel writes CP A;
2. power-cut when kernel writes CP B, then CP B is corrupted;
3. fsck: load CP A, fix meta/data;
4. power-cut when fsck writes CP A in-place, then CP A is corrupted too;

To avoid both checkpoints being invalid, this patch changes to enables
fsck to write checkpoint with out-place-update method first, and then
write checkpoint in original place.

This can make sure during fsck repairing, even there is sudden power-cut,
filesystem will still have at least one valid checkpoint.

Signed-off-by: Weichao Guo <guoweichao@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- clean up codes
- cover flush_journal_entries() case
- update commet message
 fsck/fsck.c  | 17 +++++++++++++++--
 fsck/fsck.h  |  1 +
 fsck/mount.c | 15 ++++++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6f0f262..6aed51d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2121,6 +2121,19 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 		write_nat_bits(sbi, sb, cp, sbi->cur_cp);
 }
 
+static void fix_checkpoints(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < 2; i++) {
+		/* write checkpoint out of place first */
+		sbi->cur_cp = sbi->cur_cp % 2 + 1;
+		fix_checkpoint(sbi);
+		ret = f2fs_fsync_device();
+		ASSERT(ret >= 0);
+	}
+}
+
 int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -2771,10 +2784,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			rewrite_sit_area_bitmap(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
-			fix_checkpoint(sbi);
+			fix_checkpoints(sbi);
 		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
 			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
-			write_checkpoint(sbi);
+			write_checkpoints(sbi);
 		}
 	}
 	return ret;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index d38e8de..8fe5db1 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -192,6 +192,7 @@ extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
 extern void write_curseg_info(struct f2fs_sb_info *);
 extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
 extern void write_checkpoint(struct f2fs_sb_info *);
+extern void write_checkpoints(struct f2fs_sb_info *);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
diff --git a/fsck/mount.c b/fsck/mount.c
index 1c5cd93..bbb1af7 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2127,7 +2127,7 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
 	int n_sits = flush_sit_journal_entries(sbi);
 
 	if (n_nats || n_sits)
-		write_checkpoint(sbi);
+		write_checkpoints(sbi);
 }
 
 void flush_sit_entries(struct f2fs_sb_info *sbi)
@@ -2452,6 +2452,19 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 }
 
+void write_checkpoints(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < 2; i++) {
+		/* write checkpoint out of place first */
+		sbi->cur_cp = sbi->cur_cp % 2 + 1;
+		write_checkpoint(sbi);
+		ret = f2fs_fsync_device();
+		ASSERT(ret >= 0);
+	}
+}
+
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0026D9E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 13:10:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIrnm-0002Rq-Jr; Thu, 17 Sep 2020 11:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1kIrnl-0002RY-86
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 11:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uw4pMnKqeIgBrzJtLhUVx5XvRqt7oAW3PhdxhSB7krE=; b=MdROV/Hhvz5I+3LQ0NvNlaCUie
 s4slgGH6e0tZKNXAaUtsYjKmiGKZWCIgqM3OpINMNyA716pgxQbL7vfOkM6aNB0+LT2TLjY8oEZAX
 SY6bIbRmUvGLMfL7ddTxcf1heE6XP7EeHUMlhSr/BNrWpS1ToK6pcLayQykZXPgIW92M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Uw4pMnKqeIgBrzJtLhUVx5XvRqt7oAW3PhdxhSB7krE=; b=K
 sD3S2kbx1934QWH9pbSJW4MaT9I8+gGjkyV5ty7TEJfpBcnK4e+/YIa+PwvZp/G1LJYfbvm9GLpfI
 BwfHXF9glosnB0TMhb5sQsgd0gZoGCXNDPPDqpoKZL+3zxE/5p8VBUHDkB6BrayLeP1SqNINsMIlW
 wG0gpJheu6Nap2lc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIrnc-00Csxx-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 11:10:09 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B9A41E76C9A4476D369A;
 Thu, 17 Sep 2020 19:09:45 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 19:09:35 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 17 Sep 2020 19:11:58 +0800
Message-ID: <20200917111158.3480458-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kIrnc-00Csxx-Qi
Subject: [f2fs-dev] [PATCH v2] f2fs: fix wrong total_sections check and
 fsmeta check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Meta area is not included in section_count computation.
So the minimum number of total_sections is 1 meanwhile it cannot be
greater than segment_count_main.

The minimum number of meta segments is 8 (SB + 2 (CP + SIT + NAT) + SSA).

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/segment.h | 1 +
 fs/f2fs/super.c   | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 752b177073b2..6b60b302e26b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -16,6 +16,7 @@
 #define DEF_MAX_RECLAIM_PREFREE_SEGMENTS	4096	/* 8GB in maximum */
 
 #define F2FS_MIN_SEGMENTS	9 /* SB + 2 (CP + SIT + NAT) + SSA + MAIN */
+#define F2FS_MIN_META_SEGMENTS	8 /* SB + 2 (CP + SIT + NAT) + SSA */
 
 /* L: Logical segment # in volume, R: Relative segment # in main area */
 #define GET_L2R_SEGNO(free_i, segno)	((segno) - (free_i)->start_segno)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfa072fa8081..70c5f07e65f1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2715,7 +2715,7 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 				struct buffer_head *bh)
 {
-	block_t segment_count, segs_per_sec, secs_per_zone;
+	block_t segment_count, segs_per_sec, secs_per_zone, segment_count_main;
 	block_t total_sections, blocks_per_seg;
 	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
 					(bh->b_data + F2FS_SUPER_OFFSET);
@@ -2786,6 +2786,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	segment_count = le32_to_cpu(raw_super->segment_count);
+	segment_count_main = le32_to_cpu(raw_super->segment_count_main);
 	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	total_sections = le32_to_cpu(raw_super->section_count);
@@ -2799,8 +2800,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	if (total_sections > segment_count ||
-			total_sections < F2FS_MIN_SEGMENTS ||
+	if (total_sections > segment_count_main || total_sections < 1 ||
 			segs_per_sec > segment_count || !segs_per_sec) {
 		f2fs_info(sbi, "Invalid segment/section count (%u, %u x %u)",
 			  segment_count, total_sections, segs_per_sec);
@@ -2907,7 +2907,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
 	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
 
-	if (unlikely(fsmeta < F2FS_MIN_SEGMENTS ||
+	if (unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
 			ovp_segments == 0 || reserved_segments == 0)) {
 		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
 		return 1;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

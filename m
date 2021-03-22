Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A170E34407F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Mar 2021 13:10:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOJOC-0007SX-2U; Mon, 22 Mar 2021 12:10:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lOJOA-0007SE-AY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Mar 2021 12:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BFjeJe6rWtkdU4R4V7ikO27eAP2psCdNB1RxUttoj9M=; b=WakCmaAlTmyyPNIp3nVd/dH7GQ
 KLZJ+UnCVOX6AN/NqmEEIGfrRsz2i56NmcrDZhmmEv3fbceSxHkToFSDJcK2YKXqiu8IYoUVtUQFu
 OIbctf/V5qzdBr9SkJJnPFIjrFTcTFWWap1zrtf64SXt3E4BkL1/3QIg8+YNT/oxA/tQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BFjeJe6rWtkdU4R4V7ikO27eAP2psCdNB1RxUttoj9M=; b=f
 24aMj99zFPMSeHirjOGxMb0slLP6FKnprk8/0V0DkZtD6bxvUcgRI2W8HJfJs0wetQKpqCZDVdoor
 fKLcq15LrdL4hST5loT2+P39SYZJOiUFU4uPLv29LV6792Nk4fEtKjJVcfdxtgkRXXF+Ug0PYtNm/
 HsOUIric0nGSzXwM=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOJO5-00E4EA-1j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Mar 2021 12:10:29 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F3t4F71BPzkdG0;
 Mon, 22 Mar 2021 19:46:05 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 19:47:32 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 22 Mar 2021 19:47:20 +0800
Message-ID: <20210322114720.71007-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lOJO5-00E4EA-1j
Subject: [f2fs-dev] [PATCH] f2fs: fix to check ckpt blocks of section in
 get_victim_by_default()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In image which enables large section, if we disable checkpoint, during
background GC, it needs to check whether there is checkpointed data in
selected victim section, rather than segment, fix this.

Fixes: 4354994f097d ("f2fs: checkpoint disabling")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c      |  4 ++--
 fs/f2fs/segment.c | 18 ++++--------------
 fs/f2fs/segment.h | 15 ++++++++++++++-
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 318840c69b74..a73db53deb05 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -726,8 +726,8 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			goto next;
 		/* Don't touch checkpointed data */
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
-					get_ckpt_valid_blocks(sbi, segno) &&
-					p.alloc_mode == LFS))
+				get_ckpt_valid_blocks(sbi, segno, true) &&
+				p.alloc_mode == LFS))
 			goto next;
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 81fe335b860e..788aa0f2250e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -865,7 +865,7 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
 	mutex_lock(&dirty_i->seglist_lock);
 
 	valid_blocks = get_valid_blocks(sbi, segno, false);
-	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno);
+	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno, false);
 
 	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
 		ckpt_valid_blocks == usable_blocks)) {
@@ -950,7 +950,7 @@ static unsigned int get_free_segment(struct f2fs_sb_info *sbi)
 	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
 		if (get_valid_blocks(sbi, segno, false))
 			continue;
-		if (get_ckpt_valid_blocks(sbi, segno))
+		if (get_ckpt_valid_blocks(sbi, segno, false))
 			continue;
 		mutex_unlock(&dirty_i->seglist_lock);
 		return segno;
@@ -2933,18 +2933,8 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 		get_valid_blocks(sbi, curseg->segno, new_sec))
 		goto alloc;
 
-	if (new_sec) {
-		unsigned int segno = START_SEGNO(curseg->segno);
-		int i;
-
-		for (i = 0; i < sbi->segs_per_sec; i++, segno++) {
-			if (get_ckpt_valid_blocks(sbi, segno))
-				goto alloc;
-		}
-	} else {
-		if (!get_ckpt_valid_blocks(sbi, curseg->segno))
-			return;
-	}
+	if (!get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
+		return;
 
 alloc:
 	old_segno = curseg->segno;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 144980b62f9e..0b4b3796faaa 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -359,8 +359,21 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
 }
 
 static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
-				unsigned int segno)
+				unsigned int segno, bool use_section)
 {
+	if (use_section && __is_large_section(sbi)) {
+		unsigned int start_segno = START_SEGNO(segno);
+		unsigned int blocks = 0;
+		int i;
+
+		for (i = 0; i < sbi->segs_per_sec; i++, start_segno++) {
+			struct seg_entry *se = get_seg_entry(sbi, start_segno);
+
+			blocks += se->ckpt_valid_blocks;
+		}
+		return blocks;
+	}
+
 	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

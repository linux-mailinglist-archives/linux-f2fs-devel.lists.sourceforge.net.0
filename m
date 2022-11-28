Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0363A54F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:44:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozagz-0000DZ-B6;
	Mon, 28 Nov 2022 09:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozagH-0000Cp-JT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmZeHGmGMX9erUATqVHb6Z339EvgQbXU2VsRJVxYnjE=; b=MgOjr6Iu9YrfnVKWZHVCRSujEW
 Kkfc688JMpEIPhO7DCg2Y4snuddJBwOobbqCkC7tdWycPFmPaP7UtssoPRaRmt3k5o97aV7VMnqXz
 phEPOTuugT2DW9zshl6f+zS9+KxpFPFRE0/UC1xAVns11UUO+jFqKE58+n2Yj7Yvvpng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xmZeHGmGMX9erUATqVHb6Z339EvgQbXU2VsRJVxYnjE=; b=FbEryQv+lFB6yN34JLnxovBtPS
 bQwCArFtTpT7/ee5/tdDwD0Du0OF0T6QsWhY+N4fdqjldIpTj3I5qyGkud98xwzHJSMHEM8bqpxB6
 7budr8NuiUCsSorjlEzQ19e1m4czemR3sK7118d7oiZXQVofJla5Ob00vr+cvcmOkv/c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozag9-00GTuz-NU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xmZeHGmGMX9erUATqVHb6Z339EvgQbXU2VsRJVxYnjE=; b=E/siVsCblPK0C0nmeXZTSMbu/R
 aJjkSgU8DoXM7VolYYf7MH0/OAhIrN+fKH8wsH+Na9AyEfLn73S4agwTovZ0xPnropYLTjjWT+XYP
 7JOtirVPXMJQCq4Xwk83W165HC4bNnwEWlWM2kXJrYTX97pxbeIaYNedOxiGx5VFJJa1/r4OqepBn
 Ti4tDl7z8KyTjMKDkwQxrdb/Rv4WjuimtgZROiZTVnWdCm0sYx+qLtKEw3qgsGhm/NpAw1Ix2+R+m
 RhCxwWSsmtknx/vNgKATI3KwmQ7c2wgVwAMUCADAf5ZP+cLiSg7IqGwJ27ncxVfG95S8UDk+9hITc
 +sBVXNlw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozag3-000mBs-Qc; Mon, 28 Nov 2022 09:43:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:43:44 +0100
Message-Id: <20221128094346.1256688-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128094346.1256688-1-hch@lst.de>
References: <20221128094346.1256688-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There is only single instance of these ops, so remove the
 indirection and call allocate_segment_by_default directly. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/segment.c | 11 ++---------
 fs/f2fs/segment.h
 | 6 ------ 2 files changed, 2 insertions(+), 15 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozag9-00GTuz-NU
Subject: [f2fs-dev] [PATCH 1/3] f2fs: remove struct segment_allocation
 default_salloc_ops
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is only  single instance of these ops, so remove the indirection
and call allocate_segment_by_default directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 11 ++---------
 fs/f2fs/segment.h |  6 ------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 371d0aa6fc5baf..714f9114d9aac0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2913,7 +2913,7 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 		return;
 alloc:
 	old_segno = curseg->segno;
-	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
+	allocate_segment_by_default(sbi, type, true);
 	locate_dirty_segment(sbi, old_segno);
 }
 
@@ -2944,10 +2944,6 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 }
 
-static const struct segment_allocation default_salloc_ops = {
-	.allocate_segment = allocate_segment_by_default,
-};
-
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 						struct cp_control *cpc)
 {
@@ -3272,7 +3268,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			get_atssr_segment(sbi, type, se->type,
 						AT_SSR, se->mtime);
 		else
-			sit_i->s_ops->allocate_segment(sbi, type, false);
+			allocate_segment_by_default(sbi, type, false);
 	}
 	/*
 	 * segment dirty status should be updated after segment allocation,
@@ -4258,9 +4254,6 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 #endif
 
-	/* init SIT information */
-	sit_i->s_ops = &default_salloc_ops;
-
 	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
 	sit_i->sit_blocks = sit_segs << sbi->log_blocks_per_seg;
 	sit_i->written_valid_blocks = 0;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 95b2b104da395b..d97afd2496a22c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -222,10 +222,6 @@ struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
 };
 
-struct segment_allocation {
-	void (*allocate_segment)(struct f2fs_sb_info *, int, bool);
-};
-
 #define MAX_SKIP_GC_COUNT			16
 
 struct revoke_entry {
@@ -235,8 +231,6 @@ struct revoke_entry {
 };
 
 struct sit_info {
-	const struct segment_allocation *s_ops;
-
 	block_t sit_base_addr;		/* start block address of SIT area */
 	block_t sit_blocks;		/* # of blocks used by SIT area */
 	block_t written_valid_blocks;	/* # of valid blocks in main area */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

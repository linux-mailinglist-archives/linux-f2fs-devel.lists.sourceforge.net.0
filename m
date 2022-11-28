Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B089C63A54B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:44:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozagn-0001h6-6y;
	Mon, 28 Nov 2022 09:44:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozagE-0001gZ-SM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wm28VBkFE9q8WxO+p3IoFqlL+QKPOQ9tS6/cT6LBEDM=; b=KFgAK55069aONd8YF03kJcJpQr
 WQv+MF1uv/w5f6u19t1UYuek2XUv4jiCTJgEYjJQoFjfFDqaRV4PPe9DDo+5kQbwqrS7p6etDBBw/
 Mr80Htd6tN1qSY47iKez/lk2IVUmSS1I4SjIwnQfFa0xe3nV1fdrmrNi6tQbNoIgN1rk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wm28VBkFE9q8WxO+p3IoFqlL+QKPOQ9tS6/cT6LBEDM=; b=bGB5Fh0nKl6iFqeEfF+YBreBXz
 LUIHDPGMS+0jF05eN5DWXO2hlyycLHB6eTs3c/We6k/yx6Z+0g47xO877XsZJ+OE2V6kdyk+UiXsO
 8T4Wm3DPTSY5yNMzB4yls8EimHBXRBcRCmva+mzhPhBfGOua2OwoFG7skX58cthi/wz8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozagC-00GTvH-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wm28VBkFE9q8WxO+p3IoFqlL+QKPOQ9tS6/cT6LBEDM=; b=g/bM+/yt6MJEVQpcLLef+/bzIk
 TYVfPTZzaN5YscpCmytpQ0K3C0smIJnqmccGuoOihOJgFllE9PQ/BoVaADylr6E7XUqxJrDx+YMjU
 ohv4tz6kTW75ApGFsAEGmYZPXGwbUkijONUUhHMcwhi3gOrVnyREFA29zAI6CNS0ixBLS64eV7aO3
 O76LMImlH3x5NDRjspuU5s6cPz06Wcbdn3Fu+7ndD9FlRtAmAGkFd4bV3EH5hFs19/MxqApGzyXQu
 V/+EjPO6BqTZUlygXzAyes6lum+mKcbRTtD4HXioeAEOqvaJxJu7grNcLGLw8IJPFrzwNJcvwsI+q
 h1kZejKw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozag6-000mD7-QF; Mon, 28 Nov 2022 09:43:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:43:45 +0100
Message-Id: <20221128094346.1256688-3-hch@lst.de>
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
 Content preview:  allocate_segment_by_default has just two callers, which use
 very different code pathes inside it based on the force paramter. Just open
 code the logic in the two callers using a new helper to decided [...] 
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
X-Headers-End: 1ozagC-00GTvH-LQ
Subject: [f2fs-dev] [PATCH 2/3] f2fs: open code allocate_segment_by_default
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

allocate_segment_by_default has just two callers, which use very
different code pathes inside it based on the force paramter.  Just
open code the logic in the two callers using a new helper to decided
if a new segment should be allocated.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 50 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 714f9114d9aac0..2e54df1d3feea5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2836,31 +2836,20 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	return 0;
 }
 
-/*
- * flush out current segment and replace it with new segment
- * This function should be returned with success, otherwise BUG
- */
-static void allocate_segment_by_default(struct f2fs_sb_info *sbi,
-						int type, bool force)
+static bool need_new_seg(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 
-	if (force)
-		new_curseg(sbi, type, true);
-	else if (!is_set_ckpt_flags(sbi, CP_CRC_RECOVERY_FLAG) &&
-					curseg->seg_type == CURSEG_WARM_NODE)
-		new_curseg(sbi, type, false);
-	else if (curseg->alloc_type == LFS &&
-			is_next_segment_free(sbi, curseg, type) &&
-			likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		new_curseg(sbi, type, false);
-	else if (f2fs_need_SSR(sbi) &&
-			get_ssr_segment(sbi, type, SSR, 0))
-		change_curseg(sbi, type, true);
-	else
-		new_curseg(sbi, type, false);
-
-	stat_inc_seg_type(sbi, curseg);
+	if (!is_set_ckpt_flags(sbi, CP_CRC_RECOVERY_FLAG) &&
+	    curseg->seg_type == CURSEG_WARM_NODE)
+		return true;
+	if (curseg->alloc_type == LFS &&
+	    is_next_segment_free(sbi, curseg, type) &&
+	    likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+		return true;
+	if (!f2fs_need_SSR(sbi) || !get_ssr_segment(sbi, type, SSR, 0))
+		return true;
+	return false;
 }
 
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
@@ -2913,7 +2902,8 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 		return;
 alloc:
 	old_segno = curseg->segno;
-	allocate_segment_by_default(sbi, type, true);
+	new_curseg(sbi, type, true);
+	stat_inc_seg_type(sbi, curseg);
 	locate_dirty_segment(sbi, old_segno);
 }
 
@@ -3264,11 +3254,19 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		update_sit_entry(sbi, old_blkaddr, -1);
 
 	if (!__has_curseg_space(sbi, curseg)) {
-		if (from_gc)
+		/*
+		 * Flush out current segment and replace it with new segment.
+		 */
+		if (from_gc) {
 			get_atssr_segment(sbi, type, se->type,
 						AT_SSR, se->mtime);
-		else
-			allocate_segment_by_default(sbi, type, false);
+		} else {
+			if (need_new_seg(sbi, type))
+				new_curseg(sbi, type, false);
+			else
+				change_curseg(sbi, type, true);
+			stat_inc_seg_type(sbi, curseg);
+		}
 	}
 	/*
 	 * segment dirty status should be updated after segment allocation,
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

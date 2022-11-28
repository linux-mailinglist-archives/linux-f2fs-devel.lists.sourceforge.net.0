Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1663A54E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:44:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozah0-0000ig-0D;
	Mon, 28 Nov 2022 09:44:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozagJ-0000gj-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AQ0kWsXosWnuoUioVzFZ+mAVyDGtwwscoPSQz19M5SY=; b=e3os0q2hfDbgGHRN7sCBKnWOhu
 uceKAvEm3Dg3pqAywOuAYJ8IR8qIOrpLh10HD3m3r+mBRjasy2x15+LYA1TQcv2p6TvK2HKv5k56V
 D8fZPDK5aD+imzjo1y+lcXhXD67E30+/Q+MK617WTL3OUz8nBCUwwENHR0UidZCRE1u0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AQ0kWsXosWnuoUioVzFZ+mAVyDGtwwscoPSQz19M5SY=; b=azxLpcL1isGSAZyumayNxua8fQ
 zLOxKoijAHVQZ/RklDv4RFqameF0DklvPdhniQ0i7IgneuUAVBeb2WjrweWLh8ZBVfA4/sQfujE43
 mKdjzKjzfAn73cxbwe6nXUgN+df9WGo46k66qWMh3H6DOY+JZ1xZiik0NFGLJ+Dl9c38=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozagJ-00GTvv-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=AQ0kWsXosWnuoUioVzFZ+mAVyDGtwwscoPSQz19M5SY=; b=gYAvd6V99UuSpnDecoJO1CUb8q
 HBM+zp67doMC1x+QmPAA5AhaUaLGUVj3EQo0Rhz7kXAHYYwlKDe0FKAouLUjpy5O8NFk973pbk0TY
 jZiEz6HBhSU2+S8GTl0qK2bdA/HFiiTOLQdasatE4SJ8wEpgsU/kG9Rb9prRo7qXb6eKz5y07LvAK
 Ng22nfMMpI+AZUI5ichehiKSbL9qosKAHEQXcscpy7BiO199cGlFD4cbSsodWiTtMrlFi7R4MBJCB
 MaPCpo4je75A7cUhDEGkQBjxLy4PujhuQOF5ZhbKQR3xXMm9nAvq44qXaEP3O5pOH0RSvLYskqzwy
 PIx1zIiA==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozagD-000mEr-CB; Mon, 28 Nov 2022 09:44:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:43:46 +0100
Message-Id: <20221128094346.1256688-4-hch@lst.de>
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
 Content preview: Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/segment.c
 | 16 +++++++--------- 1 file changed, 7 insertions(+), 9 deletions(-) diff
 --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 2e54df1d3feea5..b3b7ea6559f95e
 100644 --- a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -2643,7 +2643,7
 @@ bool f2fs_segment_has_free_slot(str [...] 
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
X-Headers-End: 1ozagJ-00GTvv-EQ
Subject: [f2fs-dev] [PATCH 3/3] f2fs: remove the unused flush argument to
 change_curseg
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2e54df1d3feea5..b3b7ea6559f95e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2643,7 +2643,7 @@ bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
  * This function always allocates a used segment(from dirty seglist) by SSR
  * manner, so it should recover the existing segment information of valid blocks
  */
-static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)
+static void change_curseg(struct f2fs_sb_info *sbi, int type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -2651,9 +2651,7 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)
 	struct f2fs_summary_block *sum_node;
 	struct page *sum_page;
 
-	if (flush)
-		write_sum_page(sbi, curseg->sum_blk,
-					GET_SUM_BLOCK(sbi, curseg->segno));
+	write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, curseg->segno));
 
 	__set_test_and_inuse(sbi, new_segno);
 
@@ -2692,7 +2690,7 @@ static void get_atssr_segment(struct f2fs_sb_info *sbi, int type,
 		struct seg_entry *se = get_seg_entry(sbi, curseg->next_segno);
 
 		curseg->seg_type = se->type;
-		change_curseg(sbi, type, true);
+		change_curseg(sbi, type);
 	} else {
 		/* allocate cold segment by default */
 		curseg->seg_type = CURSEG_COLD_DATA;
@@ -2867,7 +2865,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 		goto unlock;
 
 	if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type, SSR, 0))
-		change_curseg(sbi, type, true);
+		change_curseg(sbi, type);
 	else
 		new_curseg(sbi, type, true);
 
@@ -3264,7 +3262,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			if (need_new_seg(sbi, type))
 				new_curseg(sbi, type, false);
 			else
-				change_curseg(sbi, type, true);
+				change_curseg(sbi, type);
 			stat_inc_seg_type(sbi, curseg);
 		}
 	}
@@ -3527,7 +3525,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	/* change the current segment */
 	if (segno != curseg->segno) {
 		curseg->next_segno = segno;
-		change_curseg(sbi, type, true);
+		change_curseg(sbi, type);
 	}
 
 	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
@@ -3555,7 +3553,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (recover_curseg) {
 		if (old_cursegno != curseg->segno) {
 			curseg->next_segno = old_cursegno;
-			change_curseg(sbi, type, true);
+			change_curseg(sbi, type);
 		}
 		curseg->next_blkoff = old_blkoff;
 		curseg->alloc_type = old_alloc_type;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

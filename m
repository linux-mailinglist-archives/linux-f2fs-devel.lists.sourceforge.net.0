Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D236686678E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:32:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePrF-0007ca-Vv;
	Mon, 26 Feb 2024 01:32:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rePrD-0007cT-Kr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=03glMeje/iLpaIb+B6GH7CT34zGmE/V0Lp7YdCIZMbw=; b=UuoSHAojIanskqTAgLFoy3hNop
 riqjwok8nm2RBT5yxiTnUGJ/7GzWg+8GIH/E2g/3dKgr8pX0ugFfxb68h/cy2/raCLldfppECNbA4
 xkHzNNiwobtQJfh9OnRThi38E+cjvIeF7l6rRwVKbT24NJgMyOLUZak3XNE681s2IRnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=03glMeje/iLpaIb+B6GH7CT34zGmE/V0Lp7YdCIZMbw=; b=WZM3URTL1WPHT2gNuQqYEhGNBu
 o4c2NWIFrORH3znV07H6GaqtG5VruTNmDdFzgm6cC7g8XxlGehd8yy+JCWbT+KK7siC0HmevCasno
 ZkCTiEkFqJI2W2ml5pew2ZFuTh/K2F3+QwkOijWm7WKWxWmxVO4FsCytMvlIYAbB2Vq4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePrA-0007wW-MS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02B3ACE11E7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 01:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF2EC43390;
 Mon, 26 Feb 2024 01:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708911144;
 bh=7/djeaK+/NFoE++1IozOSNTPK98LJgs6sV030L2n1tw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lWyg8I8Pg2PCw71IP12fMFIHDuAm3fqRKfnA9rFN0gPFb6kcT91MwHqEJyIji0ByZ
 auPFCDznLaELDhRTAee29UojTw8lGc0gSWWUwbM43K+ynZSMCVn8pfAm6Fnt666s9v
 WFtPKn33AySGF6bufcBV1R/JrxZ4byX2hcHeTc36cWy0f2/DchrnpFDMQMuUR74sNQ
 z4SyUf0KxzHEXY/nVkxr4yxn7qgqW+MgIhbBFgMGdZVQHitGMza+yN2BZvYGkBi5Wr
 AGywWzms+as6pTBJiK3IpXo7sP6DDPozZm4aelQZVqSxw63U2G5YcuovxNwFwZp62v
 EdypU4okNf3AA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 09:32:07 +0800
Message-Id: <20240226013208.2389246-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240226013208.2389246-1-chao@kernel.org>
References: <20240226013208.2389246-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move f2fs_valid_pinned_area() check logic from new_curseg()
 to get_new_segment(), it can avoid calling __set_free() if it fails to find
 free segment in conventional zone for pinned file. Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/segment.c | 23 ++++++++++++++--------- 1 file
 changed, 14 insertions(+), 9 deletions(-) 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rePrA-0007wW-MS
Subject: [f2fs-dev] [PATCH 3/4] f2fs: clean up new_curseg()
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

Move f2fs_valid_pinned_area() check logic from new_curseg() to
get_new_segment(), it can avoid calling __set_free() if it fails
to find free segment in conventional zone for pinned file.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 847fe0b7f29f..c159b0985596 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2715,12 +2715,19 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 got_it:
 	/* set it as dirty segment in free segmap */
 	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
+
+	/* no free section in conventional zone */
+	if (new_sec && pinning &&
+		!f2fs_valid_pinned_area(sbi, START_BLOCK(sbi, segno))) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
 	__set_inuse(sbi, segno);
 	*newseg = segno;
 out_unlock:
 	spin_unlock(&free_i->segmap_lock);
 
-	if (ret) {
+	if (ret == -ENOSPC) {
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
 		f2fs_bug_on(sbi, 1);
 	}
@@ -2796,19 +2803,17 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int segno = curseg->segno;
 	bool pinning = type == CURSEG_COLD_DATA_PINNED;
+	int ret;
 
 	if (curseg->inited)
 		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
 
 	segno = __get_next_segno(sbi, type);
-	if (get_new_segment(sbi, &segno, new_sec, pinning)) {
-		curseg->segno = NULL_SEGNO;
-		return -ENOSPC;
-	}
-	if (new_sec && pinning &&
-	    !f2fs_valid_pinned_area(sbi, START_BLOCK(sbi, segno))) {
-		__set_free(sbi, segno);
-		return -EAGAIN;
+	ret = get_new_segment(sbi, &segno, new_sec, pinning);
+	if (ret) {
+		if (ret == -ENOSPC)
+			curseg->segno = NULL_SEGNO;
+		return ret;
 	}
 
 	curseg->next_segno = segno;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D2518ED6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 22:30:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlzAb-0004Oy-TN; Tue, 03 May 2022 20:30:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nlzAa-0004Oo-6d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pcGoFXMiq3tMyvtHsAcnC2M58JaEUdrbkZpnXvEFIwI=; b=Qyvd5+cCSX+lHrjh4EIfnAX3dI
 5qPYKcakXISpRHIJTOSbU13rotfLQXy1bunMhOocR5qtHKraUzTgHPkNH6jMmnWXUZFYnONXI5TgL
 tXlBHE16/JrF/He6cPw6OgTYe3AtmBsxmlyzYwYLKPjdtjJhRBKkb4X6IJg8ASmhhZAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pcGoFXMiq3tMyvtHsAcnC2M58JaEUdrbkZpnXvEFIwI=; b=H
 EqBjskSvT30KcGxBbzAKl7mL/NZ5I+JJ3v1qIdAIbzfCgMk7c/2IyTQAiAZqX85XS2CT6tekcqms0
 k9F81CJIa0Zb9b1NlGLVY/Rq5FWPQvujDB83ELfhWW0g4N9C+fhFUvofWl/zbQfjtKCVC5lt6KxkC
 LlP3AzHnoA0rxXNA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlzAW-000QnR-NX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:30:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5347360A37;
 Tue,  3 May 2022 20:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD220C385A9;
 Tue,  3 May 2022 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651609842;
 bh=XuBREE6g46APypvC2dWPjYla3kMTxG8UR8mmKhvjx6U=;
 h=From:To:Cc:Subject:Date:From;
 b=sttJSLn0i/QQDPKkIHO2wumlL00Mb6Ufs3lbXtgxBQBI8dHx3ogwik7mSMJzhm9sd
 W4CzPZC5WThrVxMXwjlyYwuLWOcGe1oxAdEWkFiNz/6BKwXz4yDPl/ZFOYBnY7FAHm
 du/QULgIq7aXVuh1wacfU5Qu9nt5Lro7qgEFtmoT2NvLucZ18diHMc6JJ0BiaoOP1X
 1BoRdf1KeMfVQjoyno55p4OWFhyWSy28C9Zra0S3nlRo/zQMchAGsCESpTlv9Y2phs
 u8DpBmWxyQPnK0p403eZ3dOfWypIH06EfcZA7+yOYMvMX+5yztCy4LHAkzSjtiX1Vx
 cItGGeWkCnNLg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 May 2022 13:30:39 -0700
Message-Id: <20220503203040.365028-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Byungki Lee <dominicus79@gmail.com> If there's not
 enough
 free sections each of which consistis of large segments, we can hit no free
 section for upcoming section allocation. Let's reclaim some prefree segments
 by writing checkpoints. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlzAW-000QnR-NX
Subject: [f2fs-dev] [PATCH 1/2] f2fs: write checkpoint during FG_GC
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Byungki Lee <dominicus79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Byungki Lee <dominicus79@gmail.com>

If there's not enough free sections each of which consistis of large segments,
we can hit no free section for upcoming section allocation. Let's reclaim some
prefree segments by writing checkpoints.

Signed-off-by: Byungki Lee <dominicus79@gmail.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index eddd2e81a2a2..4d47723523c3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1841,23 +1841,31 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	if (sync)
 		goto stop;
 
-	if (has_not_enough_free_secs(sbi, sec_freed, 0)) {
-		if (skipped_round <= MAX_SKIP_GC_COUNT ||
-					skipped_round * 2 < round) {
-			segno = NULL_SEGNO;
-			goto gc_more;
-		}
+	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
+		goto stop;
 
-		if (first_skipped < last_skipped &&
-				(last_skipped - first_skipped) >
-						sbi->skipped_gc_rwsem) {
-			f2fs_drop_inmem_pages_all(sbi, true);
-			segno = NULL_SEGNO;
-			goto gc_more;
-		}
-		if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
+	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {
+
+		/* Write checkpoint to reclaim prefree segments */
+		if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
+				prefree_segments(sbi) &&
+				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 			ret = f2fs_write_checkpoint(sbi, &cpc);
-	}
+			if (ret)
+				goto stop;
+		}
+		segno = NULL_SEGNO;
+		goto gc_more;
+	}
+	if (first_skipped < last_skipped &&
+			(last_skipped - first_skipped) >
+					sbi->skipped_gc_rwsem) {
+		f2fs_drop_inmem_pages_all(sbi, true);
+		segno = NULL_SEGNO;
+		goto gc_more;
+	}
+	if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
+		ret = f2fs_write_checkpoint(sbi, &cpc);
 stop:
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
-- 
2.36.0.464.gb9c8b46e94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

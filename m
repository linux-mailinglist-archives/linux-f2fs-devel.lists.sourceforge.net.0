Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5BD388F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 22:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgGLQrcoEug266J92rLLDH5UOV2HfuOCt6djf69KUs8=; b=a4kvIRboN/eneJre1+R89N4IaB
	XgUwx08qlO19HZLbk70+fC7ho9GH6rI4O9iV+nUefEguFjQzqGzucZSbVt1HoTsanXSqJlk2uyfO9
	Y1MIrGbnlXSuSUt98EQRgYYhFyvmLl3EiNcKSUdWuTE1eHe++AB8J75RiwAPn8jvFPnc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgriY-00031F-H2;
	Fri, 16 Jan 2026 21:50:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vgriW-000319-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 21:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9RE6+RFKZAMK+pC3nYy0bp8+RmtjUJblypQXbL6A7Qs=; b=R6ngDoD9HJnX8nyoJm9GyyYlSz
 B1HmE6PY4w3CaxZ/O/IA+kMa5zKmIrFsr8oIzbo9g9DN4m7GtJNqzUG1f7THzmeBmTwuv/U6KNYpk
 UoG785Xh851yRrCLnoLlBSogoKufYQzKvPc7OcNvZ1RxFyCopkb14ue7jj1tLKnrvBI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9RE6+RFKZAMK+pC3nYy0bp8+RmtjUJblypQXbL6A7Qs=; b=c
 cj5iq1qIlox7a33Ks3JpSQkzrU0jFq+SJpI5utL91wouTyoBJYdk0x27Nl7dQXRr/pD+Q/Y6jK0oI
 sz4ZI/dP0mFCTn0J3/FpOOUoFvXTpIuL++Ra4eXy0yneLZcNEZBMTwW1Fz9LnsFMaAygl1M9W0YDL
 QsMcSk/z9lgbKC1M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgriW-0006Nn-7I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 21:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9327C60178
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 21:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F88C116C6;
 Fri, 16 Jan 2026 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768600246;
 bh=8imb9l/H9y8epjMETOpvGibEPDP53dhptvPGTDqYUoU=;
 h=From:To:Cc:Subject:Date:From;
 b=B/8m4eRuqCQ2HgnvWiykZa7XkqZ9R2EZuIDvngGFaalCC6C+rWCbYzJ4l4voKS2RR
 qAkMXVGdJnBpV2mu9nHKgczjc7OSTJakzhIuu6vI3ee8bOpEI1bcbBqe5LeaEr8pIC
 AnVF92y9YKUc85tZd77cFId59s/XSxChy/KIqRabSZXIiUeXCRiT/y/d9pkxiZS5FB
 9V6DsVjaokn6+6fU6KooShJzlr2q1bJKk664s+OFFdAkx/kRFrabGwH6YQVsX+N6KS
 ihN3kD4Y0Ul6HQ5ag/YnuN1nlJdqvy3iuWU4bxaojNC3S78EYKIuXuHpVl7XBZFQG9
 aNeRylQTcQkVw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Jan 2026 21:50:44 +0000
Message-ID: <20260116215044.2565391-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 4bc347779698b5e67e1514bab105c2c083e55502.
 For stability, let's keep flushing all the data. Cc: stable@kernel.org Fixes:
 4bc347779698 (f2fs: add timeout in f2fs_enable_checkpoint()") Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/f2fs.h | 2 -- fs/f2fs/super.c
 | 15 ++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgriW-0006Nn-7I
Subject: [f2fs-dev] [PATCH] Revert "f2fs: add timeout in
 f2fs_enable_checkpoint()"
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 4bc347779698b5e67e1514bab105c2c083e55502.

For stability, let's keep flushing all the data.

Cc: stable@kernel.org
Fixes: 4bc347779698 (f2fs: add timeout in f2fs_enable_checkpoint()")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h  |  2 --
 fs/f2fs/super.c | 15 ++++-----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 90aa1d53722a..8c256fcdcf5b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -311,7 +311,6 @@ enum {
 #define DEF_CP_INTERVAL			60	/* 60 secs */
 #define DEF_IDLE_INTERVAL		5	/* 5 secs */
 #define DEF_DISABLE_INTERVAL		5	/* 5 secs */
-#define DEF_ENABLE_INTERVAL		16	/* 16 secs */
 #define DEF_DISABLE_QUICK_INTERVAL	1	/* 1 secs */
 #define DEF_UMOUNT_DISCARD_TIMEOUT	5	/* 5 secs */
 
@@ -1482,7 +1481,6 @@ enum {
 	DISCARD_TIME,
 	GC_TIME,
 	DISABLE_TIME,
-	ENABLE_TIME,
 	UMOUNT_DISCARD_TIMEOUT,
 	MAX_TIME,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 25f796232ad9..4869145531cc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2686,7 +2686,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
-	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
+	int retry = DEFAULT_RETRY_IO_COUNT;
 	long long start, writeback, end;
 	int ret;
 	struct f2fs_lock_context lc;
@@ -2696,22 +2696,16 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 					get_pages(sbi, F2FS_DIRTY_NODES),
 					get_pages(sbi, F2FS_DIRTY_DATA));
 
-	f2fs_update_time(sbi, ENABLE_TIME);
-
 	start = ktime_get();
 
 	/* we should flush all the data to keep data consistency */
-	while (get_pages(sbi, F2FS_DIRTY_DATA)) {
-		writeback_inodes_sb_nr(sbi->sb, nr_pages, WB_REASON_SYNC);
+	do {
+		sync_inodes_sb(sbi->sb);
 		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
 
-		if (f2fs_time_over(sbi, ENABLE_TIME))
-			break;
-	}
 	writeback = ktime_get();
 
-	sync_inodes_sb(sbi->sb);
-
 	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA)))
 		f2fs_warn(sbi, "checkpoint=enable has some unwritten data: %lld",
 					get_pages(sbi, F2FS_DIRTY_DATA));
@@ -4335,7 +4329,6 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->interval_time[DISCARD_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[GC_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_INTERVAL;
-	sbi->interval_time[ENABLE_TIME] = DEF_ENABLE_INTERVAL;
 	sbi->interval_time[UMOUNT_DISCARD_TIMEOUT] =
 				DEF_UMOUNT_DISCARD_TIMEOUT;
 	clear_sbi_flag(sbi, SBI_NEED_FSCK);
-- 
2.52.0.457.g6b5491de43-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

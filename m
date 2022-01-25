Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CB49BCF4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jan 2022 21:23:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCSLS-0000X6-1H; Tue, 25 Jan 2022 20:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nCSLR-0000Wy-4R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 20:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diKApOmmlUl7VKOC9j8TZEdi4iRwpWyFyS5IoXhPjNI=; b=ZCJ4+LECOb0lP1+r3ppoPjJK80
 1pjEQpZ39mZZrk0Y4pbedBHHUj0u8iqOXk+esoosSxYXwQxzXR71sXezlq6+Mg2n8G1rqKZzvmgG2
 QWYALSO4U5LFr3r/HFiUr7JCm2wpbQ4Udzhita0D6RuacahoCuiKsQidAHrR+vwsq8hU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=diKApOmmlUl7VKOC9j8TZEdi4iRwpWyFyS5IoXhPjNI=; b=m
 eGiihZYXespaK0XbS6nm+VegvXlkFAuv7D0Vf8sFEQMSoY9Qly/izmupdmlkIsHfn3jCLVikkrY07
 m2KvOrGdHtob9gobwstXGazEcF01ade3HS66ttnkEmNpg8qKMMAR3AwjsQm3yr+l/KFu5BCu5fs1k
 IlHR+FSRgQ8kbpxk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCSLO-00Cyb4-4g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 20:23:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC2B96164C;
 Tue, 25 Jan 2022 20:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C622C340E0;
 Tue, 25 Jan 2022 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643142179;
 bh=Vhh6AI4AOoZbcGx6PVrCy7EGGWcFf1i53vnevyRykCo=;
 h=From:To:Cc:Subject:Date:From;
 b=NmzIsqN96Zg6fxi4BZY2TWYOEVleoJD1jo7JKczg/RyCInirH07JtTy2/UXDtsOat
 rOEHc2nE/Tf7e4NUqLpwTZ5cu3tIY0yVgrP1EZTGanBU9mlM7Cp3Yli6ujkTbxpZOY
 +XdHAyXNXGkT3U7KWcIL6E5ZH47xxt0eD5nvPRwf2UeeHk5fMiF5ILumfqK1zZAd2T
 sD73gLddkBXAsFlNdjPDYM+S1kLf1pwMLRVSpOEeYXdd4Y5B8WtnxcwCrUu/RoGDCB
 Sg9VENPaQu5aCj7ZyMH50De11f9GC2n2HLtZqkgmICTuqDNRUr61r9g1Jm659BNq1Z
 qsSC7BGiSxNxg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 25 Jan 2022 12:22:53 -0800
Message-Id: <20220125202254.3111474-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Konstantin Vyshetsky <vkon@google.com> This patch
 unifies
 parameters related to how often discard is issued and how many requests go
 out at the same time by placing them in discard_cmd_control. The move will
 allow the parameters to be modi [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nCSLO-00Cyb4-4g
Subject: [f2fs-dev] [PATCH 1/2] f2fs: move discard parameters into
 discard_cmd_control
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Konstantin Vyshetsky <vkon@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Konstantin Vyshetsky <vkon@google.com>

This patch unifies parameters related to how often discard is issued and
how many requests go out at the same time by placing them in
discard_cmd_control. The move will allow the parameters to be modified
in the future without relying on hard-coded values.

Signed-off-by: Konstantin Vyshetsky <vkon@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h    |  4 ++++
 fs/f2fs/segment.c | 22 +++++++++++++---------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8178a9152e49..63c90416364b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -398,6 +398,10 @@ struct discard_cmd_control {
 	struct mutex cmd_lock;
 	unsigned int nr_discards;		/* # of discards in the list */
 	unsigned int max_discards;		/* max. discards to be issued */
+	unsigned int max_discard_request;	/* max. discard request per round */
+	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
+	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
+	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 216538b57331..56211e201d51 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1156,14 +1156,14 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	dpolicy->ordered = false;
 	dpolicy->granularity = granularity;
 
-	dpolicy->max_requests = DEF_MAX_DISCARD_REQUEST;
+	dpolicy->max_requests = dcc->max_discard_request;
 	dpolicy->io_aware_gran = MAX_PLIST_NUM;
 	dpolicy->timeout = false;
 
 	if (discard_type == DPOLICY_BG) {
-		dpolicy->min_interval = DEF_MIN_DISCARD_ISSUE_TIME;
-		dpolicy->mid_interval = DEF_MID_DISCARD_ISSUE_TIME;
-		dpolicy->max_interval = DEF_MAX_DISCARD_ISSUE_TIME;
+		dpolicy->min_interval = dcc->min_discard_issue_time;
+		dpolicy->mid_interval = dcc->mid_discard_issue_time;
+		dpolicy->max_interval = dcc->max_discard_issue_time;
 		dpolicy->io_aware = true;
 		dpolicy->sync = false;
 		dpolicy->ordered = true;
@@ -1171,12 +1171,12 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 			dpolicy->granularity = 1;
 			if (atomic_read(&dcc->discard_cmd_cnt))
 				dpolicy->max_interval =
-					DEF_MIN_DISCARD_ISSUE_TIME;
+					dcc->min_discard_issue_time;
 		}
 	} else if (discard_type == DPOLICY_FORCE) {
-		dpolicy->min_interval = DEF_MIN_DISCARD_ISSUE_TIME;
-		dpolicy->mid_interval = DEF_MID_DISCARD_ISSUE_TIME;
-		dpolicy->max_interval = DEF_MAX_DISCARD_ISSUE_TIME;
+		dpolicy->min_interval = dcc->min_discard_issue_time;
+		dpolicy->mid_interval = dcc->mid_discard_issue_time;
+		dpolicy->max_interval = dcc->max_discard_issue_time;
 		dpolicy->io_aware = false;
 	} else if (discard_type == DPOLICY_FSTRIM) {
 		dpolicy->io_aware = false;
@@ -1781,7 +1781,7 @@ static int issue_discard_thread(void *data)
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	wait_queue_head_t *q = &dcc->discard_wait_queue;
 	struct discard_policy dpolicy;
-	unsigned int wait_ms = DEF_MIN_DISCARD_ISSUE_TIME;
+	unsigned int wait_ms = dcc->min_discard_issue_time;
 	int issued;
 
 	set_freezable();
@@ -2180,6 +2180,10 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	atomic_set(&dcc->discard_cmd_cnt, 0);
 	dcc->nr_discards = 0;
 	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
+	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
+	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
+	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
+	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
 	dcc->undiscard_blks = 0;
 	dcc->next_pos = 0;
 	dcc->root = RB_ROOT_CACHED;
-- 
2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

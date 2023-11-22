Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B97F4945
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 15:47:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5oVz-0000pF-Mr;
	Wed, 22 Nov 2023 14:47:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r5oVs-0000p8-PM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 14:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QK90s82XY3dSWKa6fc2NgIYkXCuKfXDGhK5tiJxq7M8=; b=UMNQwxaX9uvG9o09zxWfGCF311
 3YaIK0rWMlGk5xGhDoqw7pZ3ANTsez5N6sEYgrFLJhKZBGh5P9Vj0tN2ZG+UjRWNbPsSmi40THXhg
 cMl1j8BxuWrV8ORU66D+AuUR5wq7mCFOuV1LgZ+IMYqCEiwAH4G9d+yKBBX760hUZRjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QK90s82XY3dSWKa6fc2NgIYkXCuKfXDGhK5tiJxq7M8=; b=n
 OBc903ZjsaHWxb0YbMAyVyYTrYNKyw6aPesDAUJfbIO0pi/6sXC1iNJ8dAlqgYACRzxtsEjKLLoe/
 C8tu6s+VLr3J6iNcg7Kcm54JEW0LIBWNcs0NjNItIjvmsbxAs9NvG1Ew8PX704qDrxjhnuOLiTmL4
 3znqToJywskPnKPc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5oVs-00CpzM-4z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 14:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E9D32CE2009
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Nov 2023 14:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C9EC433C8;
 Wed, 22 Nov 2023 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700664443;
 bh=2iDkyy2pYuw/tH7EYuXZS9rOXSZNR28XOlJHo6ZUDdc=;
 h=From:To:Cc:Subject:Date:From;
 b=QyTy7j7meGO9qKAr0c6GbSYsAbArXo04NjyVeodowq4Wn5GvYhRETi0lq5vrNTZqI
 XdYsY8wpQ4VSf271TevH3ZLCcu5jefHtGNfEIgpS3OJbCHTbSdUxojiWNmSYbU/r4A
 u970WvgT43UpiGEPX4Ux5LPdIqO2MKFHnHreNFW82QlSm9q5iwOu7p+/M5HB0/WDa3
 g+8S977gf0m/YP9yCfBqR91ASWZa8Wavlh2xRJsDv/BjwZ8aemRLN+LL8X8WgKTDA4
 8jbpgY1fWVZyJI+eksAFXIC0ax39/8zD2fOOB3NGakhfko0SXFODUtMjvWozAURLaG
 zJcUDCWoTUWgw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 22 Nov 2023 22:47:15 +0800
Message-Id: <20231122144715.518256-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It gives a way to enable/disable IO aware feature for
 background discard,
 so that we can tune background discard more precisely based on undiscard
 condition. e.g. force to disable IO aware if there ar [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r5oVs-00CpzM-4z
Subject: [f2fs-dev] [PATCH] f2fs: sysfs: support discard_io_aware
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

It gives a way to enable/disable IO aware feature for background
discard, so that we can tune background discard more precisely
based on undiscard condition. e.g. force to disable IO aware if
there are large number of discard extents, and discard IO may
always be interrupted by frequent common IO.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/f2fs.h                          | 7 +++++++
 fs/f2fs/segment.c                       | 6 +++++-
 fs/f2fs/sysfs.c                         | 9 +++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 36c3cb547901..4f1d4e636d67 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -740,3 +740,9 @@ Description:	When compress cache is on, it controls cached page
 		If cached page percent exceed threshold, then deny caching compress page.
 		The value should be in range of (0, 100], by default it was initialized
 		as 20(%).
+
+What:		/sys/fs/f2fs/<disk>/discard_io_aware
+Date:		November 2023
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	It controls to enable/disable IO aware feature for background discard.
+		By default, the value is 1 which indicates IO aware is on.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9043cedfa12b..86a145be4e53 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -374,6 +374,12 @@ enum {
 	MAX_DPOLICY,
 };
 
+enum {
+	DPOLICY_IO_AWARE_DISABLE,	/* force to not be aware of IO */
+	DPOLICY_IO_AWARE_ENABLE,	/* force to be aware of IO */
+	DPOLICY_IO_AWARE_MAX,
+};
+
 struct discard_policy {
 	int type;			/* type of discard */
 	unsigned int min_interval;	/* used for candidates exist */
@@ -406,6 +412,7 @@ struct discard_cmd_control {
 	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
+	unsigned int discard_io_aware;		/* io_aware policy */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
 	atomic_t issued_discard;		/* # of issued discard */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f4ffd64b44b2..08e2f44a1264 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1172,7 +1172,10 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 		dpolicy->min_interval = dcc->min_discard_issue_time;
 		dpolicy->mid_interval = dcc->mid_discard_issue_time;
 		dpolicy->max_interval = dcc->max_discard_issue_time;
-		dpolicy->io_aware = true;
+		if (dcc->discard_io_aware == DPOLICY_IO_AWARE_ENABLE)
+			dpolicy->io_aware = true;
+		else if (dcc->discard_io_aware == DPOLICY_IO_AWARE_DISABLE)
+			dpolicy->io_aware = false;
 		dpolicy->sync = false;
 		dpolicy->ordered = true;
 		if (utilization(sbi) > dcc->discard_urgent_util) {
@@ -2275,6 +2278,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
+	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
 		dcc->discard_granularity = sbi->blocks_per_seg;
 	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 417fae96890f..7099ffa57299 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -516,6 +516,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_io_aware")) {
+		if (t >= DPOLICY_IO_AWARE_MAX)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "migration_granularity")) {
 		if (t == 0 || t > sbi->segs_per_sec)
 			return -EINVAL;
@@ -926,6 +933,7 @@ DCC_INFO_GENERAL_RW_ATTR(discard_io_aware_gran);
 DCC_INFO_GENERAL_RW_ATTR(discard_urgent_util);
 DCC_INFO_GENERAL_RW_ATTR(discard_granularity);
 DCC_INFO_GENERAL_RW_ATTR(max_ordered_discard);
+DCC_INFO_GENERAL_RW_ATTR(discard_io_aware);
 
 /* NM_INFO ATTR */
 NM_INFO_RW_ATTR(max_roll_forward_node_blocks, max_rf_node_blocks);
@@ -1074,6 +1082,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
+	ATTR_LIST(discard_io_aware),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(gc_mode),
 	ATTR_LIST(ipu_policy),
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

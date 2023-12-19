Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580C817FBB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 03:22:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFPkH-00038p-FG;
	Tue, 19 Dec 2023 02:22:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rFPkE-00038a-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 02:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eC7Rr/fW2X8leBLS+pCX7C5as7ZLIGzdQALlj8zWCtY=; b=Hdap7cg0HGOBzlhOLzWa1Wyi/T
 9UxO0+hDt9lql2t61xzdvwx16mIyfJZEao+BOfXg96MHBA1roLcmYIoiyTN7xSmfJHA/ulf4dTD4E
 1JeHosgSN+mz6/0/4D1u/Ir8MkyZOUBjTE8qqfecpKoQyWweqxw8TNRxgdrWa+wsroQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eC7Rr/fW2X8leBLS+pCX7C5as7ZLIGzdQALlj8zWCtY=; b=K
 atvkyi2vHja+XjXlIoUcJ+ErhHmk0chA60/91EZN+pyJfiayHGetvbLQ48MgP1vg+YyVaXq/a5M68
 tGBt+uAcZ4bMNg0fC4SHuisUoby/sQBNG5NSTMC8BHsYUBPjoe6jBktkTX6rkgWEm2EGQVHWnHdME
 vzDUBxfSXUOHRT5w=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFPkC-00063n-WD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 02:22:07 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3BJ2LOSe060334;
 Tue, 19 Dec 2023 10:21:24 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SvKz30Xv3z2P0R2m;
 Tue, 19 Dec 2023 10:15:11 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 19 Dec 2023 10:21:21 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 19 Dec 2023 10:21:04 +0800
Message-ID: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3BJ2LOSe060334
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The current pending_discard attr just only shows the
 discard_cmd_cnt
 information. More discard status can be shown so that we can check them
 through
 sysfs when needed. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> ---
 changes of v2: Improve the patch according to Chao's suggestions. changes
 of v3: Add a blank line for easy reading. changes of v4: Split to three [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFPkC-00063n-WD
Subject: [f2fs-dev] [PATCH V4] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current pending_discard attr just only shows the discard_cmd_cnt
information. More discard status can be shown so that we can check
them through sysfs when needed.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v2: Improve the patch according to Chao's suggestions.
changes of v3: Add a blank line for easy reading.
changes of v4: Split to three entries
---
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 15 +++++++++++++++
 fs/f2fs/sysfs.c                         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 4f1d4e6..606a298 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -159,6 +159,21 @@ Date:		November 2021
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Shows the number of pending discard commands in the queue.
 
+What:           /sys/fs/f2fs/<disk>/issued_discard
+Date:           December 2023
+Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
+Description:    Shows the number of issued discard.
+
+What:           /sys/fs/f2fs/<disk>/queued_discard
+Date:           December 2023
+Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
+Description:    Shows the number of queued discard.
+
+What:           /sys/fs/f2fs/<disk>/undiscard_blks
+Date:           December 2023
+Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
+Description:    Shows the total number of undiscard blocks.
+
 What:		/sys/fs/f2fs/<disk>/max_victim_search
 Date:		January 2014
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 7099ffa..666efdd 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -143,6 +143,33 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
 				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
 }
 
+static ssize_t issued_discard_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (!SM_I(sbi)->dcc_info)
+		return -EINVAL;
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
+				&SM_I(sbi)->dcc_info->issued_discard));
+}
+
+static ssize_t queued_discard_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (!SM_I(sbi)->dcc_info)
+		return -EINVAL;
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
+				&SM_I(sbi)->dcc_info->queued_discard));
+}
+
+static ssize_t undiscard_blks_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (!SM_I(sbi)->dcc_info)
+		return -EINVAL;
+	return sysfs_emit(buf, "%u\n",
+				SM_I(sbi)->dcc_info->undiscard_blks);
+}
+
 static ssize_t gc_mode_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1025,6 +1052,9 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
+F2FS_GENERAL_RO_ATTR(issued_discard);
+F2FS_GENERAL_RO_ATTR(queued_discard);
+F2FS_GENERAL_RO_ATTR(undiscard_blks);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
@@ -1084,6 +1114,9 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(discard_io_aware),
 	ATTR_LIST(pending_discard),
+	ATTR_LIST(issued_discard),
+	ATTR_LIST(queued_discard),
+	ATTR_LIST(undiscard_blks),
 	ATTR_LIST(gc_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC3246202E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Nov 2021 20:16:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mrm8w-0006r6-BQ; Mon, 29 Nov 2021 19:16:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mrm8v-0006qx-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 19:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1NyEebT1wk6LnRhQJKzJYxELh/8IfkzO7MbSool7zo=; b=gIXrdB/FpgIb4Y6W2+aJ1ikuK3
 LK7NE/arEwQzA5ji4KSiBMb09HCOlXqxxa4xw4hCWbR58h9MHl4XlWzjHX2BwdQDxZ/ou9e9xO7KL
 l29r02kp7luIYamvBE2bmWVHZeHAeYYqeDIY50OLeuI8N6fIn9qYjJ5VshMbfnilcb50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l1NyEebT1wk6LnRhQJKzJYxELh/8IfkzO7MbSool7zo=; b=e
 AVuPKiVIToBw3aMY3pEzMZRfc+l+i42cLiymSNxu76lwSvIKMuP59bQ65o9H1hnoACTUH4Ty/m+mB
 LPmqEGOT1IpUaK8Fjplsr3OQ6cVMk4Dw0vIpnDKBR4pKQ0QCGazNSJ5r70BS6qPanB4X6appzri9l
 WJ+0/qgLc7KEZRKk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mrm8Q-00Ed3u-RZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 19:16:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BAB7ACE139A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Nov 2021 19:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C2FC53FC7;
 Mon, 29 Nov 2021 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638212448;
 bh=VFjdBV+1MP8kWP3KLfc2GhDfYqlzcaAmHQtzSwB0EnA=;
 h=From:To:Cc:Subject:Date:From;
 b=oed8vzV/xbK9n0Al68xmkbVSHrwxf8xB460U8yJbGCvGlPLzJ1qfDOwKaMlp3LShw
 xaWHX8UCOnuYijI5C/3e/3FlANWV5BbQRJmk16Zuq4psTIX9GYQqhvTSCzW0dLrE4n
 BlBdEC+7M0zHKwrGAPxfenlb8Vp2lyCAfn3dWlH2i/4A2xE1aPqLLU3Ay0F6b7VF22
 QfPt2HvOwfCPtcenJiqrZcIfH5jeZpESOA9yLlf0yiIY4FsXd7J1dFn+mBD5RfBGEK
 90YrsI45KE9nEBFUbuuThc28h4R72/IyIlfg6QMmvjbcEnh3lcM6AbCLd5nH+KXCJf
 4cWx8pCr/STyw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 29 Nov 2021 11:00:39 -0800
Message-Id: <20211129190039.598115-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
X-Headers-End: 1mrm8Q-00Ed3u-RZ
Subject: [f2fs-dev] [PATCH] f2fs: show number of pending discard commands
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This information can be used to check how much time we need to give to issue
all the discard commands.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++++
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index b268e3e18b4a..9f3c355bb70e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -112,6 +112,11 @@ Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Set timeout to issue discard commands during umount.
 	        Default: 5 secs
 
+What:		/sys/fs/f2fs/<disk>/pending_discard
+Date:		November 2021
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Shows the number of pending discard commands in the queue.
+
 What:		/sys/fs/f2fs/<disk>/max_victim_search
 Date:		January 2014
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 7d289249cd7e..47c950f65b6f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -118,6 +118,15 @@ static ssize_t sb_status_show(struct f2fs_attr *a,
 	return sprintf(buf, "%lx\n", sbi->s_flag);
 }
 
+static ssize_t pending_discard_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (!SM_I(sbi)->dcc_info)
+		return -EINVAL;
+	return sprintf(buf, "%llu\n", (unsigned long long)atomic_read(
+				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -744,6 +753,7 @@ F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
+F2FS_GENERAL_RO_ATTR(pending_discard);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -812,6 +822,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(main_blkaddr),
 	ATTR_LIST(max_small_discards),
 	ATTR_LIST(discard_granularity),
+	ATTR_LIST(pending_discard),
 	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
-- 
2.34.0.rc2.393.gf8c9666880-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

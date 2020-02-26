Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E821704BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 17:46:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6zpZ-0004nP-J7; Wed, 26 Feb 2020 16:46:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j6zpX-0004nG-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 16:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dEAZxHEsmh3xiwtVjuRoZ895lWOnuAsPPifn6uvLoUI=; b=A83h6MErKbkhDrH0GsoNfnMqT4
 OmzJ1ab45JpoFz59Knt0xDMKVdY1APXWlrZoaxuZ44N+Phg3i1yq5TRSH054z0qJt7TdCRhYMEFqG
 QMnwe7pHvrlIkdgxIwFDca6lHxCvuhiNSUPs/s+llSVHMy+gh2bCD4sdhXRRYRpNez7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dEAZxHEsmh3xiwtVjuRoZ895lWOnuAsPPifn6uvLoUI=; b=l
 4pIDeTP33SpTa9YYVeiSthnWNJWfHL2uh/4oN75Vgp3es7kJc9MEdJohD7RvJs+gNjn9Hzre7MTOG
 GNfh6yAsemCzJUgWnVuOSVJjlEyh5tzWYmsnfEKD7bBRvCMWXqtKdGF88/H04bRua40L+gZfQtsIY
 PYzriY/EayZfw+U8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6zpR-00APxM-Fr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 16:46:39 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E7B72467B;
 Wed, 26 Feb 2020 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582735577;
 bh=XR/8znWaIZkzuVuXdkhEvUCV1wqIXiLMa2utNOk7NmI=;
 h=From:To:Cc:Subject:Date:From;
 b=V56ibXmkhXq81YKCACADLwlYK9uemqb+8lNM6YoKD7RISqR+u9kkgv8hlUZiv3oQi
 SwEzeBgX8lLD68uOQPjOIFj1v7S2EiYCS22fUBaZox8qsIL3FwjOuKLETa6XzObqnq
 gujwyO2MFfffS7GNPcoyXG/PrIyp47WiBA1Ovdvk=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 26 Feb 2020 08:46:15 -0800
Message-Id: <20200226164615.170424-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j6zpR-00APxM-Fr
Subject: [f2fs-dev] [PATCH] f2fs: show mounted time
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

Let's show mounted time.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 5 +++++
 fs/f2fs/debug.c                         | 3 +++
 fs/f2fs/segment.c                       | 2 +-
 fs/f2fs/segment.h                       | 2 +-
 fs/f2fs/sysfs.c                         | 8 ++++++++
 5 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 1a6cd5397129..ddee45e88270 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -318,3 +318,8 @@ Date:		September 2019
 Contact:	"Hridya Valsaraju" <hridya@google.com>
 Description:	Average number of valid blocks.
 		Available when CONFIG_F2FS_STAT_FS=y.
+
+What:		/sys/fs/f2fs/<disk>/mounted_time
+Date:		February 2020
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Show the mounted time of this partition.
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 6b89eae5e4ca..a8cf9626f71f 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -301,6 +301,9 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->ssa_area_segs, si->main_area_segs);
 		seq_printf(s, "(OverProv:%d Resv:%d)]\n\n",
 			   si->overp_segs, si->rsvd_segs);
+		seq_printf(s, "Current Time: %llu s / Mounted Time: %llu s\n\n",
+					ktime_get_boottime_seconds(),
+					SIT_I(si->sbi)->mounted_time);
 		if (test_opt(si->sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
 				si->utilization, si->valid_count, si->discard_blks);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index fb3e531a36d2..601d67e72c50 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4073,7 +4073,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_i->dirty_sentries = 0;
 	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
 	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
-	sit_i->mounted_time = ktime_get_real_seconds();
+	sit_i->mounted_time = ktime_get_boottime_seconds();
 	init_rwsem(&sit_i->sentry_lock);
 	return 0;
 }
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 459dc3901a57..7a83bd530812 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -756,7 +756,7 @@ static inline unsigned long long get_mtime(struct f2fs_sb_info *sbi,
 						bool base_time)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	time64_t diff, now = ktime_get_real_seconds();
+	time64_t diff, now = ktime_get_boottime_seconds();
 
 	if (now >= sit_i->mounted_time)
 		return sit_i->elapsed_time + now - sit_i->mounted_time;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4e8aae03f26c..7bfbead98c04 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -187,6 +187,12 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 	return sprintf(buf, "(none)");
 }
 
+static ssize_t mounted_time_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%llu", SIT_I(sbi)->mounted_time);
+}
+
 #ifdef CONFIG_F2FS_STAT_FS
 static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
 				struct f2fs_sb_info *sbi, char *buf)
@@ -546,6 +552,7 @@ F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
+F2FS_GENERAL_RO_ATTR(mounted_time);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -623,6 +630,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
+	ATTR_LIST(mounted_time),
 #ifdef CONFIG_F2FS_STAT_FS
 	ATTR_LIST(cp_foreground_calls),
 	ATTR_LIST(cp_background_calls),
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

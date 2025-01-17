Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C4A15494
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 17:44:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYpS4-0006tR-V7;
	Fri, 17 Jan 2025 16:44:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYpS2-0006tH-79
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 16:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9apYPZCK6iiRlvg31grIPApRFGsdu1wFq4DyEMUcomA=; b=WW8zJ/d/aRxc7j+brPwFO9KefJ
 1RhNEnotNf/5B6LY2EMbSSjiiM+jUWdakh4oIWLpU2KBGGuKR5Ia6Csiwiz/6/NrqmwDpH468lhp+
 6DOznLjegI96+ia/iCLyhKYsKGdua9G9XnNSOTlO4KUBt8lwyEDO58GVFwNX61sdIYrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9apYPZCK6iiRlvg31grIPApRFGsdu1wFq4DyEMUcomA=; b=gUqDgyZaWVojgJPbpvncJ/BaBe
 s1O78jzL06Dw4E6ed/FZowC2L3U4ZP4leJxU4pIt2eK2dL2hLXs7w1gOyuarhrzwA4FgYIi2VobDP
 hv7QPGI/rtqU8wjXtnKjR9DRfw3f+vJVGE9wyfCIj6frKO8J6QZU8AqfVCjNENpjEjy4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYpS0-0005Iz-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 16:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F3E9A4322D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2025 16:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C046EC4CEE4;
 Fri, 17 Jan 2025 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737132238;
 bh=F0vkTJTkyTvfngV4uDlYkjuPGTuyhZdjL5IwXGCY0oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l/p07+nLpXRj0WiPsh9fF1NE7XMzh09Qa/w+Vra5F5NbsyTvdYX24AMVeFUaPRZSd
 vvgevZfpt3vgNL802WFab4d2Dt5fOPnkQ0xe+f6YvI/BggTZo+z40skRERDuuzG1B8
 C/IQN/dMFQ2WyZfEOxXwyMNs8C/gAJFNyActsP/Qp/zz3ADyoD3V5kK4r8ntz8j6tx
 iML8V788vIyGfre51L9Kkzw7gCMN9lCQZ6dP9PIOlKd9z3O4Qzhvyn15zumuydqtfb
 RrU9sKvIUtOrEbFxe9/0sCgq8H7vKpnsRPOJX597Ab5fblHTcTjVP0MVX1RxzMaYsN
 ct1VharAAT/FA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 17 Jan 2025 16:41:18 +0000
Message-ID: <20250117164350.2419840-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250117164350.2419840-1-jaegeuk@kernel.org>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3}); 2. ioctl(fd2,
 F2FS_IOC_DONATE_RANGE, {1,2}); 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
 4. echo 3 > /sys/fs/f2fs/blk/donate_caches will reclaim 3 page cache ranges,
 registered by #1, #2, and #3. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYpS0-0005Iz-P0
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to request donate
 file-backed pages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
4. echo 3 > /sys/fs/f2fs/blk/donate_caches

will reclaim 3 page cache ranges, registered by #1, #2, and #3.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
 fs/f2fs/f2fs.h                          |  2 ++
 fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..6f9d8b8889fd 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -828,3 +828,10 @@ Date:		November 2024
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls max read extent count for per-inode, the value of threshold
 		is 10240 by default.
+
+What:		/sys/fs/f2fs/<disk>/donate_caches
+Date:		December 2024
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	It reclaims the certian file-backed pages registered by
+		ioctl(F2FS_IOC_DONATE_RANGE).
+		For example, writing N tries to drop N address spaces in LRU.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 951fbc3f94c7..399ddd10a94f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1637,6 +1637,7 @@ struct f2fs_sb_info {
 
 	/* control donate caches */
 	unsigned int donate_files;
+	unsigned int donate_caches;
 
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
@@ -4259,6 +4260,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 			struct shrink_control *sc);
 unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 			struct shrink_control *sc);
+void f2fs_donate_caches(struct f2fs_sb_info *sbi);
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 83d6fb97dcae..22f62813910b 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -130,6 +130,33 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
+void f2fs_donate_caches(struct f2fs_sb_info *sbi)
+{
+	struct inode *inode;
+	struct f2fs_inode_info *fi;
+	int nfiles = sbi->donate_caches;
+
+	while (nfiles--) {
+		spin_lock(&sbi->inode_lock[DONATE_INODE]);
+		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
+			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+			break;
+		}
+		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
+					struct f2fs_inode_info, gdonate_list);
+		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
+		inode = igrab(&fi->vfs_inode);
+		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+
+		if (!inode)
+			continue;
+
+		invalidate_inode_pages2_range(inode->i_mapping,
+					fi->donate_start, fi->donate_end);
+		iput(inode);
+	}
+}
+
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 {
 	spin_lock(&f2fs_list_lock);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6b99dc49f776..f81190fabdd3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -811,6 +811,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "donate_caches")) {
+		sbi->donate_caches = min(t, sbi->donate_files);
+		f2fs_donate_caches(sbi);
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1030,6 +1036,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
+F2FS_SBI_GENERAL_RW_ATTR(donate_caches);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1178,6 +1185,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(migration_granularity),
 	ATTR_LIST(migration_window_granularity),
 	ATTR_LIST(dir_level),
+	ATTR_LIST(donate_caches),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
 	ATTR_LIST(dirty_nats_ratio),
-- 
2.48.0.rc2.279.g1de40edade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C244A11277
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2025 21:50:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXnrY-0005OX-0d;
	Tue, 14 Jan 2025 20:50:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tXnrW-0005OR-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 20:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDphvq9nYW5MOgA7OVnsxDz+tIzgTtV/lKbm1P5RuQs=; b=lMTCzm0Zn8LQ8oQdK+isVLqLNg
 npUpzJT6CS1I2/mhT22WztfjhI/97tQyFP7P6fYS0IMvKPqclJFmxvO/s2tQsbd3gx0KUrDtNCM7T
 R0+RLeKuVSJ9hOZPwC+JRzEx2ES2eed6NxsVqdNorlsfYgBZzQueWPP3ts1k3lyO3ruI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDphvq9nYW5MOgA7OVnsxDz+tIzgTtV/lKbm1P5RuQs=; b=fSDiV6yk3dtVkl2Ahz7cfhtQ8P
 7m+kqgZX+c+KAargupaUxDImtr0rdrud3MWOT3FKXv2QfJ58zxXo52j41No7w/LzjeXIE7auwVsMS
 hgegC9r0pLMqMHJp9+98X7Xawvav1H8l6bSyLCxXEmmIubC4uh7w2rsEarkGTuRADPpE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXnrV-0005M9-2M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 20:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 39370A41C20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jan 2025 20:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0B9C4CEDD;
 Tue, 14 Jan 2025 20:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736887803;
 bh=xywEB6174dtPdWBjW29hQKectre6rAgw2JolaXd3fVc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JHMZmTL8Fe6Rym0mjG+KS+W65aWe3GEdp6IkPDsKtZwSfxpOCeG2ryggkoVkbRQTt
 p8lRGU+E1mVGGrWpBtZ7PRP1XnUVQ82K0PS46IeojcbEetDhO2g9GZNrgd3/pxzbLi
 P7HSuZUqodVTiQY5MM+fTm/+92tsJteExJb0rZ4TgbWneL6KZ4wePv7xE3agGHe/Hj
 iPUrz+zzdiWocw7s6nCGqtdKuBvDEg0WJajUF89zcTBLrjkVXlJRppzUVBiwNvicd0
 5WDTOfL4w/Q8bxDP5I2dpUFrNMjG7i2WyRnChM4WlLyXNGGzqhXYeI0usam0xRhfMQ
 GRBfS2SCztimw==
Date: Tue, 14 Jan 2025 20:50:01 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Z4bN-eeUTEbDhNaD@google.com>
References: <20250113183933.1268282-1-jaegeuk@kernel.org>
 <20250113183933.1268282-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113183933.1268282-2-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXnrV-0005M9-2M
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: add a sysfs entry to request
 donate file-backed pages
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

 Change log from v1:
  - don't use sbi->ndirty_inode which is not defined by default

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
 fs/f2fs/f2fs.h                          |  4 ++++
 fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 4 files changed, 46 insertions(+)

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
index 7ce3e3eab17a..6c434ae94cb1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1635,6 +1635,9 @@ struct f2fs_sb_info {
 	unsigned int warm_data_age_threshold;
 	unsigned int last_age_weight;
 
+	/* control donate caches */
+	unsigned int donate_caches;
+
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
@@ -4256,6 +4259,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 			struct shrink_control *sc);
 unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 			struct shrink_control *sc);
+void f2fs_donate_caches(struct f2fs_sb_info *sbi);
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 83d6fb97dcae..a3e2063392a7 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -130,6 +130,33 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
+void f2fs_donate_caches(struct f2fs_sb_info *sbi)
+{
+	struct inode *inode = NULL;
+	struct f2fs_inode_info *fi;
+	int nfiles = sbi->donate_caches;
+next:
+	spin_lock(&sbi->inode_lock[DONATE_INODE]);
+	if (list_empty(&sbi->inode_list[DONATE_INODE]) || !nfiles) {
+		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+		return;
+	}
+
+	fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
+				struct f2fs_inode_info, gdonate_list);
+	list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
+	inode = igrab(&fi->vfs_inode);
+	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+
+	if (inode) {
+		invalidate_inode_pages2_range(inode->i_mapping,
+			fi->donate_start, fi->donate_end);
+		iput(inode);
+	}
+	if (nfiles--)
+		goto next;
+}
+
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 {
 	spin_lock(&f2fs_list_lock);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6b99dc49f776..2a6b01257ad8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -811,6 +811,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "donate_caches")) {
+		sbi->donate_caches = t;
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

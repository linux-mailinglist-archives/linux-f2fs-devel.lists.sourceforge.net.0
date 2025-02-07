Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F0A2C8D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Feb 2025 17:29:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tgRDw-0003Bf-Ha;
	Fri, 07 Feb 2025 16:29:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tgRDv-0003BU-EV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Feb 2025 16:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AScHAlIgNfIOA8L0BsKCflt3XcvaovBd+SHX/UBC0HM=; b=fdIw8GK6A/GHciBVgEIUA16lju
 ZeWPVzjr+dYoXGPCY4GIrelA9T/GYtjVZnQtZo5nGt5/1YZS+etAwYR0LI28IJ+JjiI0FuapX74Yz
 QG0/SYst1hfEn2sFOPUTBpXi6lAbXDtbcTmfGBsOuzQuC/mxnZZlXINJSgGn/G0eJ36A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AScHAlIgNfIOA8L0BsKCflt3XcvaovBd+SHX/UBC0HM=; b=XFsYz8/DpdJEkUceF5Xq7s6NTj
 HODhPyjh/vYd53VXvoVrDnXwzewhUYZkAVwENUwk6TPdPWHjbYg44uY82C2FQkYfwItQHMQQscMux
 jo1JvsS8AyAqfUm0NCT/LoWIqwCCHV18OqlZNiUPXJMKC/AVHHYwdLFzMfnwsBFJNXaU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tgRDv-0004S8-72 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Feb 2025 16:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 075405C106F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Feb 2025 16:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DFFC4CEE2;
 Fri,  7 Feb 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738945733;
 bh=LSY31goj1tYIw1e01CJVdsNoPnEqJ5sTGIfGWCrlWrE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=cbxrziWTlTlGhAGQmI/kht7rEIJzB93kJ8HAWJKJZ3Tgb4QE+kJFt/pBnUFgaq365
 8iJ6kWRaFqB2NF43Q/mCmiuDC+UOgnUt9i4ffMwtJIa2OhCxhCtTiJGM2H8meb6JUg
 ntHFS5Fo2uN2dcuiXvpepei67Ybio+LWixuRqK22UTaLqsMrLnZZf8YoQhZn3R+ksh
 THzMo+nXsxXBdt5nTMy3ZUFwHbyJqZMwIc0G12FNLWDMTDcbtNKpw5oL0xFN9ay3VF
 cRKGaHqiJ7CYuc8RA0bnHr5NTHr1ivHPIcLJ1fewvItoNFCc5PPKN2o1/vw1rADuUS
 3Ny6jRY75LFNw==
Date: Fri, 7 Feb 2025 16:28:51 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Z6Y0w1iALudX9GA7@google.com>
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <20250131222914.1634961-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250131222914.1634961-3-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3}); 2. ioctl(fd2,
 F2FS_IOC_DONATE_RANGE, {1,2}); 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
 4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb This gives a way to
 reclaim file-backed pages by iterating all f2fs mounts until reclaiming 1MB
 page cache ranges, registered by #1, #2, and #3. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tgRDv-0004S8-72
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
4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb

This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
reclaiming 1MB page cache ranges, registered by #1, #2, and #3.

5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
-> gives total number of registered file ranges.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 From v1:
   - Minor revision to clean up the flow.

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 fs/f2fs/f2fs.h                          |  2 +
 fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
 4 files changed, 162 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..81deae2af84d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -828,3 +828,10 @@ Date:		November 2024
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls max read extent count for per-inode, the value of threshold
 		is 10240 by default.
+
+What:		/sys/fs/f2fs/tuning/reclaim_caches_kb
+Date:		February 2025
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	It reclaims the given KBs of file-backed pages registered by
+		ioctl(F2FS_IOC_DONATE_RANGE).
+		For example, writing N tries to drop N KBs spaces in LRU.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 805585a7d2b6..bd0d8138b71d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4241,6 +4241,8 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 			struct shrink_control *sc);
 unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 			struct shrink_control *sc);
+unsigned int f2fs_donate_files(void);
+void f2fs_reclaim_caches(unsigned int reclaim_caches_kb);
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 83d6fb97dcae..45efff635d8e 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -130,6 +130,96 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
+unsigned int f2fs_donate_files(void)
+{
+	struct f2fs_sb_info *sbi;
+	struct list_head *p;
+	unsigned int donate_files = 0;
+
+	spin_lock(&f2fs_list_lock);
+	p = f2fs_list.next;
+	while (p != &f2fs_list) {
+		sbi = list_entry(p, struct f2fs_sb_info, s_list);
+
+		/* stop f2fs_put_super */
+		if (!mutex_trylock(&sbi->umount_mutex)) {
+			p = p->next;
+			continue;
+		}
+		spin_unlock(&f2fs_list_lock);
+
+		donate_files += sbi->donate_files;
+
+		spin_lock(&f2fs_list_lock);
+		p = p->next;
+		mutex_unlock(&sbi->umount_mutex);
+	}
+	spin_unlock(&f2fs_list_lock);
+
+	return donate_files;
+}
+
+static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
+				unsigned int reclaim_caches_kb)
+{
+	struct inode *inode;
+	struct f2fs_inode_info *fi;
+	unsigned int nfiles = sbi->donate_files;
+	pgoff_t npages = reclaim_caches_kb >> (PAGE_SHIFT - 10);
+
+	while (npages && nfiles--) {
+		pgoff_t len;
+
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
+		len = fi->donate_end - fi->donate_start + 1;
+		npages = npages < len ? 0 : npages - len;
+		invalidate_inode_pages2_range(inode->i_mapping,
+					fi->donate_start, fi->donate_end);
+		iput(inode);
+		cond_resched();
+	}
+	return npages << (PAGE_SHIFT - 10);
+}
+
+void f2fs_reclaim_caches(unsigned int reclaim_caches_kb)
+{
+	struct f2fs_sb_info *sbi;
+	struct list_head *p;
+
+	spin_lock(&f2fs_list_lock);
+	p = f2fs_list.next;
+	while (p != &f2fs_list && reclaim_caches_kb) {
+		sbi = list_entry(p, struct f2fs_sb_info, s_list);
+
+		/* stop f2fs_put_super */
+		if (!mutex_trylock(&sbi->umount_mutex)) {
+			p = p->next;
+			continue;
+		}
+		spin_unlock(&f2fs_list_lock);
+
+		reclaim_caches_kb = do_reclaim_caches(sbi, reclaim_caches_kb);
+
+		spin_lock(&f2fs_list_lock);
+		p = p->next;
+		mutex_unlock(&sbi->umount_mutex);
+	}
+	spin_unlock(&f2fs_list_lock);
+}
+
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 {
 	spin_lock(&f2fs_list_lock);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b419555e1ea7..b27336acf519 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -916,6 +916,39 @@ static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
 	.show	= f2fs_feature_show,				\
 }
 
+static ssize_t f2fs_tune_show(struct f2fs_base_attr *a, char *buf)
+{
+	unsigned int res = 0;
+
+	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
+		res = f2fs_donate_files();
+
+	return sysfs_emit(buf, "%u\n", res);
+}
+
+static ssize_t f2fs_tune_store(struct f2fs_base_attr *a,
+			const char *buf, size_t count)
+{
+	unsigned long t;
+	int ret;
+
+	ret = kstrtoul(skip_spaces(buf), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
+		f2fs_reclaim_caches(t);
+
+	return count;
+}
+
+#define F2FS_TUNE_RW_ATTR(_name)				\
+static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
+	.attr = {.name = __stringify(_name), .mode = 0644 },	\
+	.show	= f2fs_tune_show,				\
+	.store	= f2fs_tune_store,				\
+}
+
 static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1368,6 +1401,14 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
 
+F2FS_TUNE_RW_ATTR(reclaim_caches_kb);
+
+static struct attribute *f2fs_tune_attrs[] = {
+	BASE_ATTR_LIST(reclaim_caches_kb),
+	NULL,
+};
+ATTRIBUTE_GROUPS(f2fs_tune);
+
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
 	.store	= f2fs_attr_store,
@@ -1401,6 +1442,20 @@ static struct kobject f2fs_feat = {
 	.kset	= &f2fs_kset,
 };
 
+static const struct sysfs_ops f2fs_tune_attr_ops = {
+	.show	= f2fs_base_attr_show,
+	.store	= f2fs_base_attr_store,
+};
+
+static const struct kobj_type f2fs_tune_ktype = {
+	.default_groups = f2fs_tune_groups,
+	.sysfs_ops	= &f2fs_tune_attr_ops,
+};
+
+static struct kobject f2fs_tune = {
+	.kset	= &f2fs_kset,
+};
+
 static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
 				struct attribute *attr, char *buf)
 {
@@ -1637,6 +1692,11 @@ int __init f2fs_init_sysfs(void)
 	if (ret)
 		goto put_kobject;
 
+	ret = kobject_init_and_add(&f2fs_tune, &f2fs_tune_ktype,
+				   NULL, "tuning");
+	if (ret)
+		goto put_kobject;
+
 	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	if (!f2fs_proc_root) {
 		ret = -ENOMEM;
@@ -1644,7 +1704,9 @@ int __init f2fs_init_sysfs(void)
 	}
 
 	return 0;
+
 put_kobject:
+	kobject_put(&f2fs_tune);
 	kobject_put(&f2fs_feat);
 	kset_unregister(&f2fs_kset);
 	return ret;
@@ -1652,6 +1714,7 @@ int __init f2fs_init_sysfs(void)
 
 void f2fs_exit_sysfs(void)
 {
+	kobject_put(&f2fs_tune);
 	kobject_put(&f2fs_feat);
 	kset_unregister(&f2fs_kset);
 	remove_proc_entry("fs/f2fs", NULL);
-- 
2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

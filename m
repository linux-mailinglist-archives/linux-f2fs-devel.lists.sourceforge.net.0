Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4B39D2A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 03:31:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lq47G-0003xR-EK; Mon, 07 Jun 2021 01:31:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lq47E-0003xF-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSzeuTgkFqpTEAZqEHkktE9OfMF2BN49wtun8nx9qMk=; b=fkrLanECKnNybGXRK7Cb5YbuSd
 0yF5xKh8E+wh45U+3bjogdlECCgcM9mg0qGgbB3c47R5x2LraGO+KoGXaDz6TBj73+gDcwLOraEdt
 GC99oW4rNV76bS8MW4lMEU3P+T69gfM9YhhgIApuVqwtvni3Pj/R8WS/T8F0/jq8cUHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSzeuTgkFqpTEAZqEHkktE9OfMF2BN49wtun8nx9qMk=; b=aSTunX+OJe/9SER60Rcy33Z9kt
 8b/+GNI+kzW2NPtRFP4xW8zKL6qqoSlqeDygOx5nMBEfxRNiqUowoEaKM92WmRyR4YnBc0VHl+2xy
 ez42LtQG/7JAcLlvhlEO8SN72+OHvx+z9BwGquDy7dFyN04jJvSVS/Kr4wwsnO53K6wg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lq477-00077Y-EE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:31:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4516611AE;
 Sun,  6 Jun 2021 05:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622957771;
 bh=gIGsXA+pftSdkHOHgX5jbsid1MDK3VUG54tOemhivfw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=IMLTulX6CIS9BmEA/b34DEbPpdVlIW9IQBaK2BE+CEfmYpYicU0mzD3w5iMy3vdUj
 VgTijOCIXS9Z83bJ2zUAN/VX82GZzQBQcxduEYo1whzM+L2F9fuyQBIfrdQD7VI5jl
 Z5oNosoE8aJFntT/UFbZ312SN3UI3mSsW2yE6TyD8OelU6gZQ2kUB3BoSBgoiVeQse
 40rpVtfR1Zea663ikWMV71Z21tFm/j6RUMW6GglYodxr9q6XX3nyflALBAHBTRdCVH
 bRFmFpXYxD92vGeJ7PmREwtEkvNRrWqfVPYE4ZvzVYHW+j47Ib/TnsgvXfVy5rdV+I
 GV/c7rv25QCZQ==
Date: Sat, 5 Jun 2021 22:36:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YLxeynwR0v23c3sV@google.com>
References: <20210605003210.856458-1-jaegeuk@kernel.org>
 <20210605003210.856458-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210605003210.856458-3-jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lq477-00077Y-EE
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] f2fs: clean up
 /sys/fs/f2fs/<disk>/features
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's create /sys/fs/f2fs/<disk>/feature_list/ to meet sysfs rule.

Note that there are three feature list entries:
1) /sys/fs/f2fs/features
  : shows runtime features supported by in-kernel f2fs along with Kconfig.
    - ref. F2FS_FEATURE_RO_ATTR()

2) /sys/fs/f2fs/$s_id/features <deprecated>
  : shows on-disk features enabled by mkfs.f2fs, used for old kernels. This
    won't add new feature anymore, and thus, users should check entries in 3)
    instead of this 2).

3) /sys/fs/f2fs/$s_id/feature_list
  : shows on-disk features enabled by mkfs.f2fs per instance, which follows
    sysfs entry rule where each entry should expose single value.
    This list covers old feature list provided by 2) and beyond. Therefore,
    please add new on-disk feature in this list only.
    - ref. F2FS_SB_FEATURE_RO_ATTR()

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

change log from v1:
 - adjust Eric's comment

 Documentation/ABI/testing/sysfs-fs-f2fs |  29 +++-
 fs/f2fs/f2fs.h                          |   3 +
 fs/f2fs/sysfs.c                         | 196 ++++++++++++++++--------
 3 files changed, 163 insertions(+), 65 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 5088281e312e..95155e4ec7fe 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -203,7 +203,34 @@ Description:	Shows total written kbytes issued to disk.
 What:		/sys/fs/f2fs/<disk>/features
 Date:		July 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:	Shows all enabled features in current device.
+Description:	<deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
+		Shows all enabled features in current device.
+		Supported features:
+		encryption, blkzoned, extra_attr, projquota, inode_checksum,
+		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
+		verity, sb_checksum, casefold, readonly, compression, pin_file.
+
+What:		/sys/fs/f2fs/<disk>/feature_list/
+Date:		June 2021
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
+		Supported on-disk features:
+		encryption, block_zoned (aka blkzoned), extra_attr,
+		project_quota (aka projquota), inode_checksum,
+		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
+		verity, sb_checksum, casefold, readonly, compression.
+		Note that, pin_file is moved into /sys/fs/f2fs/features/.
+
+What:		/sys/fs/f2fs/features/
+Date:		July 2017
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Shows all enabled kernel features.
+		Supported features:
+		encryption, block_zoned, extra_attr, project_quota,
+		inode_checksum, flexible_inline_xattr, quota_ino,
+		inode_crtime, lost_found, verity, sb_checksum,
+		casefold, readonly, compression, test_dummy_encryption_v2,
+		atomic_write, pin_file, encrypted_casefold.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8903c43091f8..bbc36828a9d9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1665,6 +1665,9 @@ struct f2fs_sb_info {
 	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
 	struct completion s_stat_kobj_unregister;
 
+	struct kobject s_feature_list_kobj;		/* /sys/fs/f2fs/<devname>/feature_list */
+	struct completion s_feature_list_kobj_unregister;
+
 	/* For shrinker support */
 	struct list_head s_list;
 	int s_ndevs;				/* number of devices */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e4d5090b7cb3..616eb46184f9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -566,50 +566,49 @@ static void f2fs_sb_release(struct kobject *kobj)
 	complete(&sbi->s_kobj_unregister);
 }
 
-enum feat_id {
-	FEAT_CRYPTO = 0,
-	FEAT_BLKZONED,
-	FEAT_ATOMIC_WRITE,
-	FEAT_EXTRA_ATTR,
-	FEAT_PROJECT_QUOTA,
-	FEAT_INODE_CHECKSUM,
-	FEAT_FLEXIBLE_INLINE_XATTR,
-	FEAT_QUOTA_INO,
-	FEAT_INODE_CRTIME,
-	FEAT_LOST_FOUND,
-	FEAT_VERITY,
-	FEAT_SB_CHECKSUM,
-	FEAT_CASEFOLD,
-	FEAT_COMPRESSION,
-	FEAT_RO,
-	FEAT_TEST_DUMMY_ENCRYPTION_V2,
-	FEAT_ENCRYPTED_CASEFOLD,
-};
-
+/*
+ * Note that there are three feature list entries:
+ * 1) /sys/fs/f2fs/features
+ *   : shows runtime features supported by in-kernel f2fs along with Kconfig.
+ *     - ref. F2FS_FEATURE_RO_ATTR()
+ *
+ * 2) /sys/fs/f2fs/$s_id/features <deprecated>
+ *   : shows on-disk features enabled by mkfs.f2fs, used for old kernels. This
+ *     won't add new feature anymore, and thus, users should check entries in 3)
+ *     instead of this 2).
+ *
+ * 3) /sys/fs/f2fs/$s_id/feature_list
+ *   : shows on-disk features enabled by mkfs.f2fs per instance, which follows
+ *     sysfs entry rule where each entry should expose single value.
+ *     This list covers old feature list provided by 2) and beyond. Therefore,
+ *     please add new on-disk feature in this list only.
+ *     - ref. F2FS_SB_FEATURE_RO_ATTR()
+ */
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	switch (a->id) {
-	case FEAT_CRYPTO:
-	case FEAT_BLKZONED:
-	case FEAT_ATOMIC_WRITE:
-	case FEAT_EXTRA_ATTR:
-	case FEAT_PROJECT_QUOTA:
-	case FEAT_INODE_CHECKSUM:
-	case FEAT_FLEXIBLE_INLINE_XATTR:
-	case FEAT_QUOTA_INO:
-	case FEAT_INODE_CRTIME:
-	case FEAT_LOST_FOUND:
-	case FEAT_VERITY:
-	case FEAT_SB_CHECKSUM:
-	case FEAT_CASEFOLD:
-	case FEAT_COMPRESSION:
-	case FEAT_RO:
-	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
-	case FEAT_ENCRYPTED_CASEFOLD:
+	return sprintf(buf, "supported\n");
+}
+
+#define F2FS_FEATURE_RO_ATTR(_name)				\
+static struct f2fs_attr f2fs_attr_##_name = {			\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show	= f2fs_feature_show,				\
+}
+
+static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	if (F2FS_HAS_FEATURE(sbi, a->id))
 		return sprintf(buf, "supported\n");
-	}
-	return 0;
+	return sprintf(buf, "unsupported\n");
+}
+
+#define F2FS_SB_FEATURE_RO_ATTR(_name, _feat)			\
+static struct f2fs_attr f2fs_attr_sb_##_name = {		\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show	= f2fs_sb_feature_show,				\
+	.id	= F2FS_FEATURE_##_feat,				\
 }
 
 #define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset) \
@@ -629,13 +628,6 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 #define F2FS_GENERAL_RO_ATTR(name) \
 static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 
-#define F2FS_FEATURE_RO_ATTR(_name, _id)			\
-static struct f2fs_attr f2fs_attr_##_name = {			\
-	.attr = {.name = __stringify(_name), .mode = 0444 },	\
-	.show	= f2fs_feature_show,				\
-	.id	= _id,						\
-}
-
 #define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
 static struct f2fs_attr f2fs_attr_##_name = {			\
 	.attr = {.name = __stringify(_name), .mode = 0444 },	\
@@ -709,33 +701,33 @@ F2FS_GENERAL_RO_ATTR(avg_vblocks);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
-F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
-F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2, FEAT_TEST_DUMMY_ENCRYPTION_V2);
+F2FS_FEATURE_RO_ATTR(encryption);
+F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2);
 #ifdef CONFIG_UNICODE
-F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
+F2FS_FEATURE_RO_ATTR(encrypted_casefold);
 #endif
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
-F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
+F2FS_FEATURE_RO_ATTR(block_zoned);
 #endif
-F2FS_FEATURE_RO_ATTR(atomic_write, FEAT_ATOMIC_WRITE);
-F2FS_FEATURE_RO_ATTR(extra_attr, FEAT_EXTRA_ATTR);
-F2FS_FEATURE_RO_ATTR(project_quota, FEAT_PROJECT_QUOTA);
-F2FS_FEATURE_RO_ATTR(inode_checksum, FEAT_INODE_CHECKSUM);
-F2FS_FEATURE_RO_ATTR(flexible_inline_xattr, FEAT_FLEXIBLE_INLINE_XATTR);
-F2FS_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
-F2FS_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
-F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
+F2FS_FEATURE_RO_ATTR(atomic_write);
+F2FS_FEATURE_RO_ATTR(extra_attr);
+F2FS_FEATURE_RO_ATTR(project_quota);
+F2FS_FEATURE_RO_ATTR(inode_checksum);
+F2FS_FEATURE_RO_ATTR(flexible_inline_xattr);
+F2FS_FEATURE_RO_ATTR(quota_ino);
+F2FS_FEATURE_RO_ATTR(inode_crtime);
+F2FS_FEATURE_RO_ATTR(lost_found);
 #ifdef CONFIG_FS_VERITY
-F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
+F2FS_FEATURE_RO_ATTR(verity);
 #endif
-F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
+F2FS_FEATURE_RO_ATTR(sb_checksum);
 #ifdef CONFIG_UNICODE
-F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
+F2FS_FEATURE_RO_ATTR(casefold);
 #endif
-F2FS_FEATURE_RO_ATTR(readonly, FEAT_RO);
+F2FS_FEATURE_RO_ATTR(readonly);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
+F2FS_FEATURE_RO_ATTR(compression);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
@@ -866,6 +858,40 @@ static struct attribute *f2fs_stat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
 
+F2FS_SB_FEATURE_RO_ATTR(encryption, ENCRYPT);
+F2FS_SB_FEATURE_RO_ATTR(block_zoned, BLKZONED);
+F2FS_SB_FEATURE_RO_ATTR(extra_attr, EXTRA_ATTR);
+F2FS_SB_FEATURE_RO_ATTR(project_quota, PRJQUOTA);
+F2FS_SB_FEATURE_RO_ATTR(inode_checksum, INODE_CHKSUM);
+F2FS_SB_FEATURE_RO_ATTR(flexible_inline_xattr, FLEXIBLE_INLINE_XATTR);
+F2FS_SB_FEATURE_RO_ATTR(quota_ino, QUOTA_INO);
+F2FS_SB_FEATURE_RO_ATTR(inode_crtime, INODE_CRTIME);
+F2FS_SB_FEATURE_RO_ATTR(lost_found, LOST_FOUND);
+F2FS_SB_FEATURE_RO_ATTR(verity, VERITY);
+F2FS_SB_FEATURE_RO_ATTR(sb_checksum, SB_CHKSUM);
+F2FS_SB_FEATURE_RO_ATTR(casefold, CASEFOLD);
+F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
+F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
+
+static struct attribute *f2fs_sb_feat_attrs[] = {
+	ATTR_LIST(sb_encryption),
+	ATTR_LIST(sb_block_zoned),
+	ATTR_LIST(sb_extra_attr),
+	ATTR_LIST(sb_project_quota),
+	ATTR_LIST(sb_inode_checksum),
+	ATTR_LIST(sb_flexible_inline_xattr),
+	ATTR_LIST(sb_quota_ino),
+	ATTR_LIST(sb_inode_crtime),
+	ATTR_LIST(sb_lost_found),
+	ATTR_LIST(sb_verity),
+	ATTR_LIST(sb_sb_checksum),
+	ATTR_LIST(sb_casefold),
+	ATTR_LIST(sb_compression),
+	ATTR_LIST(sb_readonly),
+	NULL,
+};
+ATTRIBUTE_GROUPS(f2fs_sb_feat);
+
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
 	.store	= f2fs_attr_store,
@@ -932,6 +958,34 @@ static struct kobj_type f2fs_stat_ktype = {
 	.release	= f2fs_stat_kobj_release,
 };
 
+static ssize_t f2fs_sb_feat_attr_show(struct kobject *kobj,
+				struct attribute *attr, char *buf)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+							s_feature_list_kobj);
+	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
+
+	return a->show ? a->show(a, sbi, buf) : 0;
+}
+
+static void f2fs_feature_list_kobj_release(struct kobject *kobj)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+							s_feature_list_kobj);
+	complete(&sbi->s_feature_list_kobj_unregister);
+}
+
+static const struct sysfs_ops f2fs_feature_list_attr_ops = {
+	.show	= f2fs_sb_feat_attr_show,
+};
+
+static struct kobj_type f2fs_feature_list_ktype = {
+	.default_groups = f2fs_sb_feat_groups,
+	.sysfs_ops	= &f2fs_feature_list_attr_ops,
+	.release	= f2fs_feature_list_kobj_release,
+};
+
+
 static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
 						void *offset)
 {
@@ -1148,6 +1202,14 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 	if (err)
 		goto put_stat_kobj;
 
+	sbi->s_feature_list_kobj.kset = &f2fs_kset;
+	init_completion(&sbi->s_feature_list_kobj_unregister);
+	err = kobject_init_and_add(&sbi->s_feature_list_kobj,
+					&f2fs_feature_list_ktype,
+					&sbi->s_kobj, "feature_list");
+	if (err)
+		goto put_feature_list_kobj;
+
 	if (f2fs_proc_root)
 		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
 
@@ -1162,6 +1224,9 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	}
 	return 0;
+put_feature_list_kobj:
+	kobject_put(&sbi->s_feature_list_kobj);
+	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 put_stat_kobj:
 	kobject_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
@@ -1184,6 +1249,9 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 	kobject_del(&sbi->s_stat_kobj);
 	kobject_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
+	kobject_del(&sbi->s_feature_list_kobj);
+	kobject_put(&sbi->s_feature_list_kobj);
+	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

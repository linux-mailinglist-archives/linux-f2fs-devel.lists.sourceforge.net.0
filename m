Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3493A39AD78
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 00:09:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lovWO-0006UL-Oq; Thu, 03 Jun 2021 22:09:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lovWM-0006UC-M6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 22:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ujEL5Nkg6YAyBEp2DlO6gEgZ48HKuxUbF65dfL+Twik=; b=GlPB4zhSOZWGAyriwy+Adq7tDk
 cft7bTd2YDyZa8CLOVCPX4R5cF2j+37NESit2v92+JHvuLuZ2Lo1Lyp07B4CiBhHLjcMOuoYpRJD/
 PJil9Y0m/lGBVlHELkzbzM+NoCn+MdWrJpT8iggpl5ufFoQ3xhh+XpjB/lHjVuhpdpk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ujEL5Nkg6YAyBEp2DlO6gEgZ48HKuxUbF65dfL+Twik=; b=b
 c4TiZEoXv0FH5r6qKMdkJctR9SnLBfiQqzRv/wQg9pTFkUPBDDWROei/O++6GuToRUWBd1xjGPr8k
 T5IBDc9BMxC8IGLPkirew+W54bCnI4gjjCTpTCUg/u5ewM8FbC0cqS29uDqdSEUDraLGixe0vsccB
 vavupa0Qz/sPHWmM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lovWF-009Taz-JY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 22:08:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F60C613F9;
 Thu,  3 Jun 2021 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622758120;
 bh=W3YnTuFowyxh6PaM08Dc2jipblg6Axyh4ECrxVAo774=;
 h=From:To:Cc:Subject:Date:From;
 b=IkKxfoamWQiVM58iFQ9rb3aUyEWu1Egze7QJ1f74hqU72eoEEaA13MVM475KCtEC5
 5qqBeOaeY38tmuHMkd94m6aZ8ENypcRB0iCsFhqGW+LZqKg51I1bQ/FQ1fOdfZp5a2
 WdiXTw1QcapOWw0JRApeipETRROnO6Kn9pUDsFME5ojBwlVNsWYoWOA/sjqugkFHXz
 SdU7zSK9EFQFXyvZJWN7fpdEjl1rsQ1Nf9dMNNZAF5VlLASshMJp2vz+TZQO9yPnzN
 V89bcKkcXIKzyJGSn8AZ/5MhTz0f1W/l5YKerfTY/vkiccGZdsJXmuwp9TsJbEJI5E
 0LMoRAMdtChnw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Jun 2021 15:08:34 -0700
Message-Id: <20210603220834.1949988-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lovWF-009Taz-JY
Subject: [f2fs-dev] [PATCH] f2fs: clean up /sys/fs/f2fs/<disk>/features
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

Let's create /sys/fs/f2fs/<disk>/feature_list/ to meet sysfs rule.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  18 ++-
 fs/f2fs/f2fs.h                          |   3 +
 fs/f2fs/sysfs.c                         | 152 +++++++++++++++++++++++-
 3 files changed, 168 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 5088281e312e..43b2cde80b70 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -203,7 +203,23 @@ Description:	Shows total written kbytes issued to disk.
 What:		/sys/fs/f2fs/<disk>/features
 Date:		July 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:	Shows all enabled features in current device.
+Description:	<deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
+		Shows all enabled features in current device.
+		Supported features:
+		encryption, blkzoned, extra_attr, projquota, inode_checksum,
+		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
+		verity, sb_checksum, casefold, readonly, compression,
+		encrypted_casefold, pin_file.
+
+What:		/sys/fs/f2fs/<disk>/feature_list/
+Date:		June 2021
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
+		Supported features:
+		encryption, block_zoned, extra_attr, projquota, inode_checksum,
+		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
+		verity, sb_checksum, casefold, readonly, compression,
+		encrypted_casefold, pin_file.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8903c43091f8..17ade71547f1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1665,6 +1665,9 @@ struct f2fs_sb_info {
 	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
 	struct completion s_stat_kobj_unregister;
 
+	struct kobject s_disk_feat_kobj;		/* /sys/fs/f2fs/<devname>/feature_list */
+	struct completion s_disk_feat_kobj_unregister;
+
 	/* For shrinker support */
 	struct list_head s_list;
 	int s_ndevs;				/* number of devices */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2a76c959a7b4..5d591f0b79b7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -587,32 +587,85 @@ enum feat_id {
 	FEAT_RO,
 	FEAT_TEST_DUMMY_ENCRYPTION_V2,
 	FEAT_ENCRYPTED_CASEFOLD,
+	FEAT_PIN_FILE,
 };
 
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
+	unsigned long feat_supp = 0;
+
 	switch (a->id) {
 	case FEAT_CRYPTO:
+		feat_supp |= f2fs_sb_has_encrypt(sbi) ?
+					(1 << FEAT_CRYPTO) : 0;
+		fallthrough;
 	case FEAT_BLKZONED:
-	case FEAT_ATOMIC_WRITE:
+		feat_supp |= f2fs_sb_has_blkzoned(sbi) ?
+					(1 << FEAT_BLKZONED) : 0;
+		fallthrough;
 	case FEAT_EXTRA_ATTR:
+		feat_supp |= f2fs_sb_has_extra_attr(sbi) ?
+					(1 << FEAT_EXTRA_ATTR) : 0;
+		fallthrough;
 	case FEAT_PROJECT_QUOTA:
+		feat_supp |= f2fs_sb_has_project_quota(sbi) ?
+					(1 << FEAT_PROJECT_QUOTA) : 0;
+		fallthrough;
 	case FEAT_INODE_CHECKSUM:
+		feat_supp |= f2fs_sb_has_inode_chksum(sbi) ?
+					(1 << FEAT_INODE_CHECKSUM) : 0;
+		fallthrough;
 	case FEAT_FLEXIBLE_INLINE_XATTR:
+		feat_supp |= f2fs_sb_has_flexible_inline_xattr(sbi) ?
+					(1 << FEAT_FLEXIBLE_INLINE_XATTR) : 0;
+		fallthrough;
 	case FEAT_QUOTA_INO:
+		feat_supp |= f2fs_sb_has_quota_ino(sbi) ?
+					(1 << FEAT_QUOTA_INO) : 0;
+		fallthrough;
 	case FEAT_INODE_CRTIME:
+		feat_supp |= f2fs_sb_has_inode_crtime(sbi) ?
+					(1 << FEAT_INODE_CRTIME) : 0;
+		fallthrough;
 	case FEAT_LOST_FOUND:
+		feat_supp |= f2fs_sb_has_lost_found(sbi) ?
+					(1 << FEAT_LOST_FOUND) : 0;
+		fallthrough;
 	case FEAT_VERITY:
+		feat_supp |= f2fs_sb_has_verity(sbi) ?
+					(1 << FEAT_VERITY) : 0;
+		fallthrough;
 	case FEAT_SB_CHECKSUM:
+		feat_supp |= f2fs_sb_has_sb_chksum(sbi) ?
+					(1 << FEAT_SB_CHECKSUM) : 0;
+		fallthrough;
 	case FEAT_CASEFOLD:
+		feat_supp |= f2fs_sb_has_casefold(sbi) ?
+					(1 << FEAT_CASEFOLD) : 0;
+		fallthrough;
 	case FEAT_COMPRESSION:
+		feat_supp |= f2fs_sb_has_compression(sbi) ?
+					(1 << FEAT_COMPRESSION) : 0;
+		fallthrough;
 	case FEAT_RO:
-	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
+		feat_supp |= f2fs_sb_has_readonly(sbi) ?
+					(1 << FEAT_RO) : 0;
+		fallthrough;
 	case FEAT_ENCRYPTED_CASEFOLD:
-		return sprintf(buf, "supported\n");
+		feat_supp |= (f2fs_sb_has_casefold(sbi) &&
+				f2fs_sb_has_encrypt(sbi)) ?
+					(1 << FEAT_ENCRYPTED_CASEFOLD) : 0;
+		fallthrough;
+	case FEAT_PIN_FILE:
+		feat_supp |= (1 << FEAT_PIN_FILE);
+		fallthrough;
+	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
+	case FEAT_ATOMIC_WRITE:
+		if (!a->offset || feat_supp & (1 << a->id))
+			return sprintf(buf, "supported\n");
 	}
-	return 0;
+	return sprintf(buf, "not supported\n");
 }
 
 #define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset) \
@@ -636,6 +689,7 @@ static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 static struct f2fs_attr f2fs_attr_##_name = {			\
 	.attr = {.name = __stringify(_name), .mode = 0444 },	\
 	.show	= f2fs_feature_show,				\
+	.offset	= 0,						\
 	.id	= _id,						\
 }
 
@@ -743,6 +797,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
+F2FS_FEATURE_RO_ATTR(pin_file, FEAT_PIN_FILE);
 
 /* For ATGC */
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
@@ -856,6 +911,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
+	ATTR_LIST(pin_file),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
@@ -867,6 +923,52 @@ static struct attribute *f2fs_stat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
 
+#define F2FS_DISK_FEATURE_RO_ATTR(_name, _id)			\
+static struct f2fs_attr f2fs_attr_disk_##_name = {		\
+	.attr = {.name = __stringify(_name), .mode = 0444 },	\
+	.show	= f2fs_feature_show,				\
+	.offset	= 1,						\
+	.id	= _id,						\
+}
+
+F2FS_DISK_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
+F2FS_DISK_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
+F2FS_DISK_FEATURE_RO_ATTR(extra_attr, FEAT_EXTRA_ATTR);
+F2FS_DISK_FEATURE_RO_ATTR(project_quota, FEAT_PROJECT_QUOTA);
+F2FS_DISK_FEATURE_RO_ATTR(inode_checksum, FEAT_INODE_CHECKSUM);
+F2FS_DISK_FEATURE_RO_ATTR(flexible_inline_xattr, FEAT_FLEXIBLE_INLINE_XATTR);
+F2FS_DISK_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
+F2FS_DISK_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
+F2FS_DISK_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
+F2FS_DISK_FEATURE_RO_ATTR(verity, FEAT_VERITY);
+F2FS_DISK_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
+F2FS_DISK_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
+F2FS_DISK_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
+F2FS_DISK_FEATURE_RO_ATTR(readonly, FEAT_RO);
+F2FS_DISK_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
+F2FS_DISK_FEATURE_RO_ATTR(pin_file, FEAT_PIN_FILE);
+
+static struct attribute *f2fs_disk_feat_attrs[] = {
+	ATTR_LIST(disk_encryption),
+	ATTR_LIST(disk_block_zoned),
+	ATTR_LIST(disk_extra_attr),
+	ATTR_LIST(disk_project_quota),
+	ATTR_LIST(disk_inode_checksum),
+	ATTR_LIST(disk_flexible_inline_xattr),
+	ATTR_LIST(disk_quota_ino),
+	ATTR_LIST(disk_inode_crtime),
+	ATTR_LIST(disk_lost_found),
+	ATTR_LIST(disk_verity),
+	ATTR_LIST(disk_sb_checksum),
+	ATTR_LIST(disk_casefold),
+	ATTR_LIST(disk_compression),
+	ATTR_LIST(disk_readonly),
+	ATTR_LIST(disk_encrypted_casefold),
+	ATTR_LIST(disk_pin_file),
+	NULL,
+};
+ATTRIBUTE_GROUPS(f2fs_disk_feat);
+
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
 	.store	= f2fs_attr_store,
@@ -933,6 +1035,34 @@ static struct kobj_type f2fs_stat_ktype = {
 	.release	= f2fs_stat_kobj_release,
 };
 
+static ssize_t f2fs_disk_feat_attr_show(struct kobject *kobj,
+				struct attribute *attr, char *buf)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+							s_disk_feat_kobj);
+	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
+
+	return a->show ? a->show(a, sbi, buf) : 0;
+}
+
+static void f2fs_disk_feat_kobj_release(struct kobject *kobj)
+{
+	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
+							s_disk_feat_kobj);
+	complete(&sbi->s_disk_feat_kobj_unregister);
+}
+
+static const struct sysfs_ops f2fs_disk_feat_attr_ops = {
+	.show	= f2fs_disk_feat_attr_show,
+};
+
+static struct kobj_type f2fs_disk_feat_ktype = {
+	.default_groups = f2fs_disk_feat_groups,
+	.sysfs_ops	= &f2fs_disk_feat_attr_ops,
+	.release	= f2fs_disk_feat_kobj_release,
+};
+
+
 static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
 						void *offset)
 {
@@ -1149,6 +1279,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 	if (err)
 		goto put_stat_kobj;
 
+	sbi->s_disk_feat_kobj.kset = &f2fs_kset;
+	init_completion(&sbi->s_disk_feat_kobj_unregister);
+	err = kobject_init_and_add(&sbi->s_disk_feat_kobj,
+						&f2fs_disk_feat_ktype,
+						&sbi->s_kobj, "feature_list");
+	if (err)
+		goto put_stat_kobj;
+
+
 	if (f2fs_proc_root)
 		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
 
@@ -1166,6 +1305,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 put_stat_kobj:
 	kobject_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
+	kobject_put(&sbi->s_disk_feat_kobj);
+	wait_for_completion(&sbi->s_disk_feat_kobj_unregister);
 put_sb_kobj:
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
@@ -1185,6 +1326,9 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 	kobject_del(&sbi->s_stat_kobj);
 	kobject_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
+	kobject_del(&sbi->s_disk_feat_kobj);
+	kobject_put(&sbi->s_disk_feat_kobj);
+	wait_for_completion(&sbi->s_disk_feat_kobj_unregister);
 
 	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

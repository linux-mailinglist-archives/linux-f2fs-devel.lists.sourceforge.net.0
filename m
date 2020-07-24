Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EF22C06D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 10:05:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyshr-0008Dt-PL; Fri, 24 Jul 2020 08:05:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jyshq-0008Di-Et
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 08:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kjLhdXlI27u6/r9aJEkKSD9Y8jnaUNnrNsGdXQOuXeY=; b=G1s+k4GYXaqIoxbOQEaWhCeYue
 sH0BdMxm/iNfjlM7bCY6QXEvjhg4+0S83oToZ8aZYQCtw2mjtTIfHB9s6IINYp3OjyfMHNj6dDMSN
 o1PKv/wbWMCkjEvvStb2nkwtinNN6qtB/OgkniYaxFbu8izZeZRArcebSL+f48w4sQzk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kjLhdXlI27u6/r9aJEkKSD9Y8jnaUNnrNsGdXQOuXeY=; b=i
 PxBwYRFH3o73uKCbzbsC29aOpZtwCS1p5eFahj3wX22dmKsBVsWB9mZHfNYU8YDZ4KszsyL7/Zzhg
 qESxEwPnZmnAdPmKIVP3Nmr/6KHV4e7HmGT/MBKV0EguOfWxlLeKuQD7z87dXwo0xoCRGji6gi4So
 qr4Sf00jftCcGAHo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jysho-007Hj8-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 08:05:26 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AB6ED2E3930A5198B047
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 16:05:15 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 16:05:05 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <jack.qiu@huawei.com>
Date: Fri, 24 Jul 2020 16:55:28 +0800
Message-ID: <20200724085528.29685-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jysho-007Hj8-Ij
Subject: [f2fs-dev] [PATCH v2] f2fs: space related cleanup
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

Just for code style, no logic change
1. delete useless space
2. change spaces into tab

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
Changes in v2:
 - Merge into one patch
---
 fs/f2fs/checkpoint.c   | 2 +-
 fs/f2fs/data.c         | 4 ++--
 fs/f2fs/extent_cache.c | 2 +-
 fs/f2fs/f2fs.h         | 4 ++--
 fs/f2fs/namei.c        | 8 ++++----
 fs/f2fs/node.c         | 4 ++--
 fs/f2fs/sysfs.c        | 4 ++--
 fs/f2fs/xattr.c        | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 236064930251..cbff5e2a6b18 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1415,7 +1415,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 				curseg_alloc_type(sbi, i + CURSEG_HOT_DATA);
 	}

-	/* 2 cp  + n data seg summary + orphan inode blocks */
+	/* 2 cp + n data seg summary + orphan inode blocks */
 	data_sum_blocks = f2fs_npages_for_summary_flush(sbi, false);
 	spin_lock_irqsave(&sbi->cp_lock, flags);
 	if (data_sum_blocks < NR_CURSEG_DATA_TYPE)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 326c63879ddc..b6d5cc2de5ba 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -86,7 +86,7 @@ static bool __is_cp_guaranteed(struct page *page)
 	sbi = F2FS_I_SB(inode);

 	if (inode->i_ino == F2FS_META_INO(sbi) ||
-			inode->i_ino ==  F2FS_NODE_INO(sbi) ||
+			inode->i_ino == F2FS_NODE_INO(sbi) ||
 			S_ISDIR(inode->i_mode) ||
 			(S_ISREG(inode->i_mode) &&
 			(f2fs_is_atomic_file(inode) || IS_NOQUOTA(inode))) ||
@@ -1145,7 +1145,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)

 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 {
-	struct extent_info ei  = {0,0,0};
+	struct extent_info ei = {0, 0, 0};
 	struct inode *inode = dn->inode;

 	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index e60078460ad1..f23cf0eaa0a1 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -365,7 +365,7 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e

 bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
 {
-	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
+	bool ret = __f2fs_init_extent_tree(inode, i_ext);

 	if (!F2FS_I(inode)->extent_tree)
 		set_inode_flag(inode, FI_NO_EXTENT);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..dfa28d3f83a5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1438,7 +1438,7 @@ struct f2fs_sb_info {
 	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
 	long interval_time[MAX_TIME];		/* to store thresholds */

-	struct inode_management im[MAX_INO_ENTRY];      /* manage inode cache */
+	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */

 	spinlock_t fsync_node_lock;		/* for node entry lock */
 	struct list_head fsync_node_list;	/* node list head */
@@ -1517,7 +1517,7 @@ struct f2fs_sb_info {
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
 	/* for skip statistic */
-	unsigned int atomic_files;              /* # of opened atomic file */
+	unsigned int atomic_files;		/* # of opened atomic file */
 	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e94e02c6580a..63d2300d2391 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -600,7 +600,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
-	 * negative dentries at f2fs_lookup(), when it is  better
+	 * negative dentries at f2fs_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
 	if (IS_CASEFOLDED(dir))
@@ -1285,7 +1285,7 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 }

 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
-	.get_link       = f2fs_encrypted_get_link,
+	.get_link	= f2fs_encrypted_get_link,
 	.getattr	= f2fs_getattr,
 	.setattr	= f2fs_setattr,
 	.listxattr	= f2fs_listxattr,
@@ -1311,7 +1311,7 @@ const struct inode_operations f2fs_dir_inode_operations = {
 };

 const struct inode_operations f2fs_symlink_inode_operations = {
-	.get_link       = f2fs_get_link,
+	.get_link	= f2fs_get_link,
 	.getattr	= f2fs_getattr,
 	.setattr	= f2fs_setattr,
 	.listxattr	= f2fs_listxattr,
@@ -1319,7 +1319,7 @@ const struct inode_operations f2fs_symlink_inode_operations = {

 const struct inode_operations f2fs_special_inode_operations = {
 	.getattr	= f2fs_getattr,
-	.setattr        = f2fs_setattr,
+	.setattr	= f2fs_setattr,
 	.get_acl	= f2fs_get_acl,
 	.set_acl	= f2fs_set_acl,
 	.listxattr	= f2fs_listxattr,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 03e24df1c84f..3a6d5ba7e306 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1726,7 +1726,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 					set_dentry_mark(page,
 						f2fs_need_dentry_mark(sbi, ino));
 				}
-				/*  may be written by other thread */
+				/* may be written by other thread */
 				if (!PageDirty(page))
 					set_page_dirty(page);
 			}
@@ -2097,7 +2097,7 @@ const struct address_space_operations f2fs_node_aops = {
 	.invalidatepage	= f2fs_invalidate_page,
 	.releasepage	= f2fs_release_page,
 #ifdef CONFIG_MIGRATION
-	.migratepage    = f2fs_migrate_page,
+	.migratepage	= f2fs_migrate_page,
 #endif
 };

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e877c59b9fdb..0744633f0edc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -27,7 +27,7 @@ enum {
 	NM_INFO,	/* struct f2fs_nm_info */
 	F2FS_SBI,	/* struct f2fs_sb_info */
 #ifdef CONFIG_F2FS_STAT_FS
-	STAT_INFO,      /* struct f2fs_stat_info */
+	STAT_INFO,	/* struct f2fs_stat_info */
 #endif
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
@@ -706,7 +706,7 @@ static struct kobj_type f2fs_ktype = {
 };

 static struct kset f2fs_kset = {
-	.kobj   = {.ktype = &f2fs_ktype},
+	.kobj	= {.ktype = &f2fs_ktype},
 };

 static struct kobj_type f2fs_feat_ktype = {
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 4f6582ef7ee3..1b0736ce0918 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -175,8 +175,8 @@ const struct xattr_handler f2fs_xattr_trusted_handler = {
 const struct xattr_handler f2fs_xattr_advise_handler = {
 	.name	= F2FS_SYSTEM_ADVISE_NAME,
 	.flags	= F2FS_XATTR_INDEX_ADVISE,
-	.get    = f2fs_xattr_advise_get,
-	.set    = f2fs_xattr_advise_set,
+	.get	= f2fs_xattr_advise_get,
+	.set	= f2fs_xattr_advise_set,
 };

 const struct xattr_handler f2fs_xattr_security_handler = {
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

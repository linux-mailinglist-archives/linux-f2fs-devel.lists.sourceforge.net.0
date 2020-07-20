Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49773225D6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 13:29:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxTym-0000tj-1W; Mon, 20 Jul 2020 11:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jxTyj-0000tZ-4v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 11:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sU9PbbO/zllaj199E4RQvxsnYzHO3kMMAgpi4Am9MKg=; b=fVVboZnwqZVsqRMjOkyK8sOwgR
 J7nu92ZArwOx98doeivX/Vwcy1TR0YCTBbE3AvQdfuuybOSBAE5XC55s31ywKWZsATCL9swYiZ6DN
 He7P+JuW6SeZTyNDTpTGqyLHA+lA10yMipk6x4gEqR0ydNCCzLW+wgHZkBOXqm7Fd6EI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sU9PbbO/zllaj199E4RQvxsnYzHO3kMMAgpi4Am9MKg=; b=mJwAx/LWb27aFyXkznUcyRSrEE
 YyzAhMENR5QncPMYtMc8FksdhUyl0GxmkqQ+rqMQT5QHeO0T39T75HH6SJvESqMfeDP330+a/Lvw3
 i9wOftwzaC3Tj5KXTRrE16D3gpD1dNrR4QBIVy8A3NOWGyI9RaU5ARzgrjj/9sLo/l0A=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxTyg-00DfPl-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 11:29:05 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 87F74F5BB79B8B767949
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 19:28:54 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 19:28:48 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 20 Jul 2020 20:19:16 +0800
Message-ID: <20200720121916.37756-2-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720121916.37756-1-jack.qiu@huawei.com>
References: <20200720121916.37756-1-jack.qiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jxTyg-00DfPl-Sw
Subject: [f2fs-dev] [PATCH 2/2] f2fs: change spaces into tab
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

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/f2fs.h  | 4 ++--
 fs/f2fs/namei.c | 6 +++---
 fs/f2fs/node.c  | 2 +-
 fs/f2fs/sysfs.c | 4 ++--
 fs/f2fs/xattr.c | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

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
index 664e220e0c80..63d2300d2391 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
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
index 0bf5bd22d460..3a6d5ba7e306 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
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

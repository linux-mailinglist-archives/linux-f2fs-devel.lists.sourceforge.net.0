Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3A9B74B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2024 07:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6Ozm-00049H-3S;
	Thu, 31 Oct 2024 06:49:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leo.lilong@huawei.com>) id 1t6Ozj-00048w-Hp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 06:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOe6hkPr1YyWofIRAeAsDyRj5xX+Lhm2hk+codhWPrQ=; b=RHFPpC6aZNzb3zFvF4eaWqTT+o
 /EvpRFnoTrdOdMdd/sy/sbUtQfMDwgC2d5IkRPzGa8ehoM+di8u+phr30Pvx3owynAxFjUs33cEGX
 R7pSWsSUa+5dUFvoc9TsWnzyDFvoylmOmjUckFKFe7sOR4T7HeuSIxcehtNotE9mUwlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oOe6hkPr1YyWofIRAeAsDyRj5xX+Lhm2hk+codhWPrQ=; b=UarsY3UhQc+zUalJR0ri0sbMHD
 bZtK1jvmD43wAEIGD7owQ8JwAcvEo4cIswZS9LjvvdadC+CNvoPDwiTtXDRBiN2f+/UqcXSusmJc9
 nYou9ytJOg2j+0gcwo5GfXoAassFvrsp22tajE01+/kQpS61EO5KSP2QNFtk6gjalrNw=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6Ozh-0006Ay-Lm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 06:49:23 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XfDxg6jNPz1HLfd;
 Thu, 31 Oct 2024 14:44:39 +0800 (CST)
Received: from dggpemf500017.china.huawei.com (unknown [7.185.36.126])
 by mail.maildlp.com (Postfix) with ESMTPS id 612E61401F3;
 Thu, 31 Oct 2024 14:49:09 +0800 (CST)
Received: from huawei.com (10.175.104.67) by dggpemf500017.china.huawei.com
 (7.185.36.126) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 31 Oct
 2024 14:49:08 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 31 Oct 2024 14:45:53 +0800
Message-ID: <20241031064553.55283-2-leo.lilong@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241031064553.55283-1-leo.lilong@huawei.com>
References: <20241031064553.55283-1-leo.lilong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500017.china.huawei.com (7.185.36.126)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit c7f114d864ac91515bb07ac271e9824a20f5ed95.
 The race conditions between concurrent f2fs_stop_gc_thread() calls are now
 protected by a dedicated lock, making the additional s_umount lock protection
 unnecessary. Therefore, revert this patch. 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.191 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t6Ozh-0006Ay-Lm
Subject: [f2fs-dev] [PATCH 2/2] Revert "f2fs: fix to avoid use-after-free in
 f2fs_stop_gc_thread()"
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
From: Long Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Long Li <leo.lilong@huawei.com>
Cc: yi.zhang@huawei.com, lonuxli.64@gmail.com, yangerkun@huawei.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 leo.lilong@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit c7f114d864ac91515bb07ac271e9824a20f5ed95.

The race conditions between concurrent f2fs_stop_gc_thread() calls
are now protected by a dedicated lock, making the additional s_umount
lock protection unnecessary. Therefore, revert this patch.

Signed-off-by: Long Li <leo.lilong@huawei.com>
---
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/file.c  | 11 ++---------
 fs/f2fs/super.c |  2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7ae1e2a4789f..2143604ce416 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3522,7 +3522,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count);
 int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
-						bool readonly, bool need_lock);
+							bool readonly);
 int f2fs_precache_extents(struct inode *inode);
 int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa);
 int f2fs_fileattr_set(struct mnt_idmap *idmap,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 75a8b22da664..5d7b4fdae9c4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2318,7 +2318,7 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
 }
 
 int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
-						bool readonly, bool need_lock)
+							bool readonly)
 {
 	struct super_block *sb = sbi->sb;
 	int ret = 0;
@@ -2365,19 +2365,12 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 	if (readonly)
 		goto out;
 
-	/* grab sb->s_umount to avoid racing w/ remount() */
-	if (need_lock)
-		down_read(&sbi->sb->s_umount);
-
 	f2fs_stop_gc_thread(sbi);
 	f2fs_stop_discard_thread(sbi);
 
 	f2fs_drop_discard_cmd(sbi);
 	clear_opt(sbi, DISCARD);
 
-	if (need_lock)
-		up_read(&sbi->sb->s_umount);
-
 	f2fs_update_time(sbi, REQ_TIME);
 out:
 
@@ -2414,7 +2407,7 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		}
 	}
 
-	ret = f2fs_do_shutdown(sbi, in, readonly, true);
+	ret = f2fs_do_shutdown(sbi, in, readonly);
 
 	if (need_drop)
 		mnt_drop_write_file(filp);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 47a15050ea9c..a720fb9ef196 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2569,7 +2569,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 static void f2fs_shutdown(struct super_block *sb)
 {
-	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false, false);
+	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false);
 }
 
 #ifdef CONFIG_QUOTA
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

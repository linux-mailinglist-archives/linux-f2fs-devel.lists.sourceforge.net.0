Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155D534899
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 May 2022 04:08:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nu2up-00080Z-2p; Thu, 26 May 2022 02:07:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1nu2un-00080T-3M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 May 2022 02:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=euNux8306sc5btCy/RzxCUZpPvU1t/ETpknokZDNVmo=; b=NGUvm/D9stLiBAoIn5MAKOfKYk
 IyA2P77TDLlDPxc8UyOJgPerNwddPDn+C7Mq+PjUM1uBEjK580H+WM7dqMuvXxzOVihVuUq1AExt8
 SCws6JKOL0ixagHi6HWiqhvxmlS/hzoPUizB7tu/0gju0LfmmPkuVPQwnCevdRxcvXn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=euNux8306sc5btCy/RzxCUZpPvU1t/ETpknokZDNVmo=; b=C
 qfxarV43jlILPcHuZtp2pZX1/7IWcxWF1ZFF73qg/XOTZDJ8RSdBdZclf8vlBvxE0JF6yHC0LXdTI
 lfI6Ad2tg2f5lntZ1KPue9FQrV95fl8e6C/X1MSXYNh0VcyLLBdkskMFq5Q2TK7NDbItvOQ7O1vQD
 iSFu1/xVCvqa5rLc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nu2uf-0005uJ-IE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 May 2022 02:07:51 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L7rs86JVDzjX7f;
 Thu, 26 May 2022 10:06:36 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 10:07:37 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 10:07:37 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 26 May 2022 10:21:06 +0800
Message-ID: <20220526022106.3848304-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We have define 'fi' at the begin of the functions, just use
 it, rather than use F2FS_I(inode) again. Signed-off-by: Yufen Yu
 <yuyufen@huawei.com>
 --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/file.c | 14 +++++++------- fs/f2fs/inode.c
 | 12 ++++++------ 3 files changed, 14 insertions(+), 14 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nu2uf-0005uJ-IE
Subject: [f2fs-dev] [PATCH v2] f2fs: replace F2FS_I(inode) by the local
 variable
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We have define 'fi' at the begin of the functions, just use it,
rather than use F2FS_I(inode) again.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/file.c  | 14 +++++++-------
 fs/f2fs/inode.c | 12 ++++++------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 02e2dc17938c..1490239f1582 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4425,8 +4425,8 @@ static inline bool f2fs_may_compress(struct inode *inode)
 static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 						u64 blocks, bool add)
 {
-	int diff = F2FS_I(inode)->i_cluster_size - blocks;
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	int diff = fi->i_cluster_size - blocks;
 
 	/* don't update i_compr_blocks if saved blocks were released */
 	if (!add && !atomic_read(&fi->i_compr_blocks))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index eba27fb24c19..38ef52426405 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2024,7 +2024,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	if (ret)
 		goto out;
 
-	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 
 	/*
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
@@ -2035,7 +2035,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 			  inode->i_ino, get_dirty_pages(inode));
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret) {
-		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 		goto out;
 	}
 
@@ -2048,10 +2048,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	/* add inode in inmem_list first and set atomic_file */
 	set_inode_flag(inode, FI_ATOMIC_FILE);
 	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
-	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-	F2FS_I(inode)->inmem_task = current;
+	fi->inmem_task = current;
 	stat_update_max_atomic_write(inode);
 out:
 	inode_unlock(inode);
@@ -3017,7 +3017,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 
 	kprojid = make_kprojid(&init_user_ns, (projid_t)projid);
 
-	if (projid_eq(kprojid, F2FS_I(inode)->i_projid))
+	if (projid_eq(kprojid, fi->i_projid))
 		return 0;
 
 	err = -EPERM;
@@ -3037,7 +3037,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	if (err)
 		goto out_unlock;
 
-	F2FS_I(inode)->i_projid = kprojid;
+	fi->i_projid = kprojid;
 	inode->i_ctime = current_time(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 out_unlock:
@@ -3987,7 +3987,7 @@ static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int blk_per_seg = sbi->blocks_per_seg;
-	int cluster_size = F2FS_I(inode)->i_cluster_size;
+	int cluster_size = fi->i_cluster_size;
 	int count, ret;
 
 	if (!f2fs_sb_has_compression(sbi) ||
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 83639238a1fe..65297eb36597 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -260,8 +260,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
-	if (F2FS_I(inode)->extent_tree) {
-		struct extent_info *ei = &F2FS_I(inode)->extent_tree->largest;
+	if (fi->extent_tree) {
+		struct extent_info *ei = &fi->extent_tree->largest;
 
 		if (ei->len &&
 			(!f2fs_is_valid_blkaddr(sbi, ei->blk,
@@ -466,10 +466,10 @@ static int do_read_inode(struct inode *inode)
 		}
 	}
 
-	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
-	F2FS_I(inode)->i_disk_time[1] = inode->i_ctime;
-	F2FS_I(inode)->i_disk_time[2] = inode->i_mtime;
-	F2FS_I(inode)->i_disk_time[3] = F2FS_I(inode)->i_crtime;
+	fi->i_disk_time[0] = inode->i_atime;
+	fi->i_disk_time[1] = inode->i_ctime;
+	fi->i_disk_time[2] = inode->i_mtime;
+	fi->i_disk_time[3] = fi->i_crtime;
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

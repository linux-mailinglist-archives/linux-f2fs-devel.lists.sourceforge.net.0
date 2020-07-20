Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A4225D6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 13:29:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxTyn-0006M2-VT; Mon, 20 Jul 2020 11:29:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jxTyj-0006Ln-1e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 11:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chwwU5CxJ5nwKS8x/Voiu3yFil+j76z1FGq8BxeU6jo=; b=a/f8sbo5IkoTVMZtpcV7W1JEd0
 rCPVCyNHqob36b9L0KPRqDDPWOy0ewOhFkWYrGzSS0dU9R1IbSSh90TGi2LhK40ZqLYH8COfPNqhi
 CYMA3PogIlgkwtpE9VDfl0DpWUX/xplAEaOS1mw3VKIWQRf2d4X17lqfaPMziFGrhi44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=chwwU5CxJ5nwKS8x/Voiu3yFil+j76z1FGq8BxeU6jo=; b=C
 U/Dwqehxo+Slg/BXKYEXWXzGf2ngwsV/2r/QRSS5XuTuoUkvTwnP/b+TRuPOlxOpA6pfAcAZM5Ul9
 fxFH0bqHLm9XtnptbUgrqFelA2daWdbdfn6aZ9AgwEbJoGVB3q1FVqfyxGB0Ov1D1qKIgaFO++C7e
 3gTqtoXpCMpo5ruY=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxTyf-00AfqJ-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 11:29:04 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8090D5ACCB909851CE92
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 19:28:54 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Jul 2020
 19:28:47 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 20 Jul 2020 20:19:15 +0800
Message-ID: <20200720121916.37756-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
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
X-Headers-End: 1jxTyf-00AfqJ-Bz
Subject: [f2fs-dev] [PATCH 1/2] f2fs: delete useless space
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
 fs/f2fs/checkpoint.c   | 2 +-
 fs/f2fs/data.c         | 4 ++--
 fs/f2fs/extent_cache.c | 2 +-
 fs/f2fs/namei.c        | 2 +-
 fs/f2fs/node.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

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
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e94e02c6580a..664e220e0c80 100644
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
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 03e24df1c84f..0bf5bd22d460 100644
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
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

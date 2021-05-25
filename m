Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB9390026
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 13:39:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llVPK-0002Co-4u; Tue, 25 May 2021 11:39:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1llVPI-0002CG-59
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 11:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Kfim4J02sph4hQJnV+fEI8enNu3o6UbjHo1SaWrHi0=; b=bMm4KPNm2AOJoBv6F6XHXSyVDz
 tuJ+B8rljAYnja9RkAUqfCjihilvHZgqmYt3ioV6tbsYBHF6QMvqRW/hZlQovrIvz7LBZ10s/ak8b
 tCICYoZhMBQpXxQUmGKUXU1jYSjveli1H9ykqHAdkqyyBKPC+RZ2W8tASZvMHMhm3FqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6Kfim4J02sph4hQJnV+fEI8enNu3o6UbjHo1SaWrHi0=; b=F
 np/vNU5VMSd6afe4CrKhiixjoAayc3HKBoxtvxWhh6/6uRskPldD8F+KsH3Rg0znVtQk0tyQEocZP
 ZirnXhMO+IFmecfD1QJlrdLCaZdI1/e49v+M29eJjzxB7As+UaYdG9sZQXU5GRo3Xxl780ullLAMI
 mdJVd1UrWRLcIOD0=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llVPE-005Gji-4i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 11:39:32 +0000
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqBqb4F09zwTRn;
 Tue, 25 May 2021 19:36:27 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 19:39:18 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 25 May 2021 19:39:17 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 25 May 2021 19:39:09 +0800
Message-ID: <20210525113909.113486-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llVPE-005Gji-4i
Subject: [f2fs-dev] [PATCH] f2fs: avoid attaching SB_ACTIVE flag during
 mount/remount
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
Cc: Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Quoted from [1]

"I do remember that I've added this code back then because otherwise
orphan cleanup was losing updates to quota files. But you're right
that now I don't see how that could be happening and it would be nice
if we could get rid of this hack"

[1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00

Related fix in ext4 by
commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").

f2fs has the same hack implementation in
- f2fs_recover_orphan_inodes()
- f2fs_recover_fsync_data()
- f2fs_disable_checkpoint()

Let's get rid of this hack as well in f2fs.

Cc: Zhang Yi <yi.zhang@huawei.com>
Cc: Jan Kara <jack@suse.cz>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c |  3 ---
 fs/f2fs/recovery.c   |  8 ++------
 fs/f2fs/super.c      | 11 ++++-------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6c208108d69c..a578c7d13d81 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -691,9 +691,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	}
 
 #ifdef CONFIG_QUOTA
-	/* Needed for iput() to work correctly and not trash data */
-	sbi->sb->s_flags |= SB_ACTIVE;
-
 	/*
 	 * Turn on quotas which were not enabled for read-only mounts if
 	 * filesystem has quota feature, so that they are updated correctly.
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4b2f7d1d5bf4..4cfe36fa41be 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -782,8 +782,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	}
 
 #ifdef CONFIG_QUOTA
-	/* Needed for iput() to work correctly and not trash data */
-	sbi->sb->s_flags |= SB_ACTIVE;
 	/* Turn on quotas so that they are updated correctly */
 	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
 #endif
@@ -811,10 +809,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
 	if (!err)
 		f2fs_bug_on(sbi, !list_empty(&inode_list));
-	else {
-		/* restore s_flags to let iput() trash data */
-		sbi->sb->s_flags = s_flags;
-	}
+	else
+		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
 skip:
 	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0a77808ebb8f..e7bd983fbddc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1881,17 +1881,15 @@ static int f2fs_enable_quotas(struct super_block *sb);
 
 static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 {
-	unsigned int s_flags = sbi->sb->s_flags;
 	struct cp_control cpc;
 	int err = 0;
 	int ret;
 	block_t unusable;
 
-	if (s_flags & SB_RDONLY) {
+	if (sbi->sb->s_flags & SB_RDONLY) {
 		f2fs_err(sbi, "checkpoint=disable on readonly fs");
 		return -EINVAL;
 	}
-	sbi->sb->s_flags |= SB_ACTIVE;
 
 	f2fs_update_time(sbi, DISABLE_TIME);
 
@@ -1909,13 +1907,13 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	ret = sync_filesystem(sbi->sb);
 	if (ret || err) {
 		err = ret ? ret : err;
-		goto restore_flag;
+		goto out;
 	}
 
 	unusable = f2fs_get_unusable_blocks(sbi);
 	if (f2fs_disable_cp_again(sbi, unusable)) {
 		err = -EAGAIN;
-		goto restore_flag;
+		goto out;
 	}
 
 	down_write(&sbi->gc_lock);
@@ -1931,8 +1929,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 out_unlock:
 	up_write(&sbi->gc_lock);
-restore_flag:
-	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
+out:
 	return err;
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

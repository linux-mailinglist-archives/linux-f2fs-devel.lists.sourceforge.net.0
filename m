Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 459162BFFA4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 06:29:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kh4Ph-00073q-QN; Mon, 23 Nov 2020 05:29:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kh4Pg-00073U-E2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 05:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDh9u37lBrJNl2jBeZqDrURG7xBb2r4TgSKLEjPenr8=; b=TuR3Y4juPZAxy6PnhbenaPTZot
 xgf6f6PCehSNxhaplPiXzFuk5Gr2AIqoRffLD3DDM8astDptgaBe0kMUKu+VIRvEsHoJl0o8qrRAP
 4po4ETW/AnkcqpKqqPfHRcHe/2g8Q9CAJh/8lcdriSVX6JD8phoH08MrJQqmdE7sW1Ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IDh9u37lBrJNl2jBeZqDrURG7xBb2r4TgSKLEjPenr8=; b=kL/uFNzUwSnISYPyyDYI/LgViX
 +UMWdWiUoDyJUftirqse59Nao/6fV9M7zcdf0ZkLdCG7cb86L1ODSfAKsqNLGYILIgFqvhhzmMDdk
 RGA1jwp9jBkIF2k8Ba71BmgXH5VF6FZUt1vdbx2U+cguweFC0/7SygrhDLquWzcpv7ug=;
Received: from z5.mailgun.us ([104.130.96.5])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kh4PR-00H06s-64
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 05:29:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606109345; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IDh9u37lBrJNl2jBeZqDrURG7xBb2r4TgSKLEjPenr8=;
 b=sh7+sGeK+7D6enBIJiyRvXm8O4E3en3euC61IqCCuD+vuCANcGphb7OfUJBgCkP/HH1CsFOn
 uF+Ngts08RZRKeFLmbl2MxvUePTS8sRAEjP8Qh7FRWhbCqFl9togWZrOhQJoTmFt6KsESxAg
 Qsw2DOsOUJ3JgAxk9wvvkDc8ZFM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fbb48987f0cfa6a16fd5146 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 05:28:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5EF89C43463; Mon, 23 Nov 2020 05:28:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 793E7C433ED;
 Mon, 23 Nov 2020 05:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 793E7C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 23 Nov 2020 10:58:32 +0530
Message-Id: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?104.130.96.5>]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [104.130.96.5 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kh4PR-00H06s-64
Subject: [f2fs-dev] [PATCH] f2fs: change to use rwsem for cp_mutex
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use rwsem to ensure serialization of the callers and to avoid
starvation of high priority tasks, when the system is under
heavy IO workload.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/checkpoint.c | 8 ++++----
 fs/f2fs/f2fs.h       | 2 +-
 fs/f2fs/gc.c         | 4 ++--
 fs/f2fs/recovery.c   | 4 ++--
 fs/f2fs/super.c      | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 023462e..7fb8c80 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -348,13 +348,13 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 		goto skip_write;
 
 	/* if locked failed, cp will flush dirty pages instead */
-	if (!mutex_trylock(&sbi->cp_mutex))
+	if (!down_write_trylock(&sbi->cp_global_sem))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, META);
 	diff = nr_pages_to_write(sbi, META, wbc);
 	written = f2fs_sync_meta_pages(sbi, META, wbc->nr_to_write, FS_META_IO);
-	mutex_unlock(&sbi->cp_mutex);
+	up_write(&sbi->cp_global_sem);
 	wbc->nr_to_write = max((long)0, wbc->nr_to_write - written - diff);
 	return 0;
 
@@ -1572,7 +1572,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		f2fs_warn(sbi, "Start checkpoint disabled!");
 	}
 	if (cpc->reason != CP_RESIZE)
-		mutex_lock(&sbi->cp_mutex);
+		down_write(&sbi->cp_global_sem);
 
 	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
 		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
@@ -1647,7 +1647,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
 out:
 	if (cpc->reason != CP_RESIZE)
-		mutex_unlock(&sbi->cp_mutex);
+		up_write(&sbi->cp_global_sem);
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e082677..842c2ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1369,7 +1369,7 @@ struct f2fs_sb_info {
 	int cur_cp_pack;			/* remain current cp pack */
 	spinlock_t cp_lock;			/* for flag in ckpt */
 	struct inode *meta_inode;		/* cache meta blocks */
-	struct mutex cp_mutex;			/* checkpoint procedure lock */
+	struct rw_semaphore cp_global_sem;	/* checkpoint procedure lock */
 	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
 	struct rw_semaphore node_write;		/* locking node writes */
 	struct rw_semaphore node_change;	/* locking node change */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 05641a1..3ef84e6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1986,7 +1986,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 
 	freeze_super(sbi->sb);
 	down_write(&sbi->gc_lock);
-	mutex_lock(&sbi->cp_mutex);
+	down_write(&sbi->cp_global_sem);
 
 	spin_lock(&sbi->stat_lock);
 	if (shrunk_blocks + valid_user_blocks(sbi) +
@@ -2031,7 +2031,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 		spin_unlock(&sbi->stat_lock);
 	}
 out_err:
-	mutex_unlock(&sbi->cp_mutex);
+	up_write(&sbi->cp_global_sem);
 	up_write(&sbi->gc_lock);
 	thaw_super(sbi->sb);
 	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 0947d36..da75d5d 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -799,7 +799,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	INIT_LIST_HEAD(&dir_list);
 
 	/* prevent checkpoint */
-	mutex_lock(&sbi->cp_mutex);
+	down_write(&sbi->cp_global_sem);
 
 	/* step #1: find fsynced inode numbers */
 	err = find_fsync_dnodes(sbi, &inode_list, check_only);
@@ -850,7 +850,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (!err)
 		clear_sbi_flag(sbi, SBI_POR_DOING);
 
-	mutex_unlock(&sbi->cp_mutex);
+	up_write(&sbi->cp_global_sem);
 
 	/* let's drop all the directory inodes for clean checkpoint */
 	destroy_fsync_dnodes(&dir_list, err);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87f7a6e..e33b0da 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3552,7 +3552,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sbi->valid_super_block = valid_super_block;
 	init_rwsem(&sbi->gc_lock);
 	mutex_init(&sbi->writepages);
-	mutex_init(&sbi->cp_mutex);
+	init_rwsem(&sbi->cp_global_sem);
 	init_rwsem(&sbi->node_write);
 	init_rwsem(&sbi->node_change);
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

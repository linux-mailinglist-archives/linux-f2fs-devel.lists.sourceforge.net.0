Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F063015C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 19:57:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hWPIr-0003Xt-NY; Thu, 30 May 2019 17:57:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hWPIq-0003Xh-OE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 17:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hrc8XuhBrxIPAwfcE132mEphHOEJi7GYs9rtbNlIUlQ=; b=jAilVsm2E8gLm/hj/UP3X0pCDh
 jb+b2o0amjOlP5X+dl/qp0QIEms9srxxyuDyaCRXANSS1nH+xX670gbtAqQaccKbEXXAsl0ORsuDO
 iCIBBzwjv7PiFTkmzUJJM0W/uF7x9sA094gDykE1TD0j5ufsgnxZgD0qDstw/Xk7dGQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hrc8XuhBrxIPAwfcE132mEphHOEJi7GYs9rtbNlIUlQ=; b=KeCzodZ+/q+K4zEU+XJAEm1ZCM
 SyEUpw6IN6XiQLYwEsLb5eYlANDg5JHIq7lgR2c264sBiFZ01SoPndCBBuEdKG5V9ya9kx+y5iPoT
 /PUmE0lmJfgd2wSrDyHE7GIKsLThcFg/BLTIDQNhIL5rSQP5JMvCNI0mjMOaTs3T/CDM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hWPIo-00F5St-I0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 17:57:24 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47EE725EDD;
 Thu, 30 May 2019 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559239035;
 bh=w8hNSnfYZ3vC8KLmmbKZFRJHcMSb2JVko1p4pcUentA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=xN8e76AtwOSE3SMEmWxCUpUerbHkDmGhS1c9DeamLHkX5Ws5DnCZLtI96X8CGsJYB
 2ZjwIezD8mkoC9tbl2Q6AVAWXNDeiVm3l9nN82Sx6bqcH3ChfP9sMjFIdEZab6+RzF
 Rtzdpsn5e2Fw8ld/mr9Bp4pXrG6tWW1i5xZA3vAs=
Date: Thu, 30 May 2019 10:57:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190530175714.GB28719@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190530033115.16853-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530033115.16853-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hWPIo-00F5St-I0
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a rw_sem to cover quota flag
 changes
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

thread 1:                        thread 2:
writeback                        checkpoint
set QUOTA_NEED_FLUSH
                                 clear QUOTA_NEED_FLUSH
f2fs_dquot_commit
dquot_commit
clear_dquot_dirty
                                 f2fs_quota_sync
                                 dquot_writeback_dquots
				 nothing to commit
commit_dqblk
quota_write
f2fs_quota_write
waiting for f2fs_lock_op()
				 pass __need_flush_quota
                                 (no F2FS_DIRTY_QDATA)

-> up-to-date quota is not written

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

v2 from v1:
 - avoid deadlock.
 - shorten the loop path

 fs/f2fs/checkpoint.c | 40 ++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/super.c      | 27 ++++++++++++++++++++++-----
 3 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 89825261d474..66f29907fc0e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1131,17 +1131,26 @@ static void __prepare_cp_block(struct f2fs_sb_info *sbi)
 
 static bool __need_flush_quota(struct f2fs_sb_info *sbi)
 {
+	bool ret;
+
 	if (!is_journalled_quota(sbi))
 		return false;
-	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
-		return false;
-	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
-		return false;
-	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
-		return true;
-	if (get_pages(sbi, F2FS_DIRTY_QDATA))
+
+	if (!down_write_trylock(&sbi->quota_sem))
 		return true;
-	return false;
+
+	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
+		ret = false;
+	else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
+		ret = false;
+	else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
+		ret = true;
+	else if (get_pages(sbi, F2FS_DIRTY_QDATA))
+		ret = true;
+	else
+		ret = false;
+	up_write(&sbi->quota_sem);
+	return ret;
 }
 
 /*
@@ -1160,14 +1169,16 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	blk_start_plug(&plug);
 
 retry_flush_quotas:
+	f2fs_lock_all(sbi);
 	if (__need_flush_quota(sbi)) {
 		int locked;
 
 		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
 			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
-			f2fs_lock_all(sbi);
 			goto retry_flush_dents;
 		}
+
+		f2fs_unlock_all(sbi);
 		clear_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
 
 		/* only failed during mount/umount/freeze/quotactl */
@@ -1175,11 +1186,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		f2fs_quota_sync(sbi->sb, -1);
 		if (locked)
 			up_read(&sbi->sb->s_umount);
-	}
-
-	f2fs_lock_all(sbi);
-	if (__need_flush_quota(sbi)) {
-		f2fs_unlock_all(sbi);
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1201,12 +1207,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	 */
 	down_write(&sbi->node_change);
 
-	if (__need_flush_quota(sbi)) {
-		up_write(&sbi->node_change);
-		f2fs_unlock_all(sbi);
-		goto retry_flush_quotas;
-	}
-
 	if (get_pages(sbi, F2FS_DIRTY_IMETA)) {
 		up_write(&sbi->node_change);
 		f2fs_unlock_all(sbi);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9b3d9977cd1e..692c0922f5b2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1250,6 +1250,7 @@ struct f2fs_sb_info {
 	block_t unusable_block_count;		/* # of blocks saved by last cp */
 
 	unsigned int nquota_files;		/* # of quota sysfile */
+	struct rw_semaphore quota_sem;		/* blocking cp for flags */
 
 	/* # of pages, see count_type */
 	atomic_t nr_pages[NR_COUNT_TYPE];
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1dc02101e5e5..7a6d70d8e851 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1946,7 +1946,10 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	int cnt;
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_writeback_dquots(sb, type);
+	up_read(&sbi->quota_sem);
+
 	if (ret)
 		goto out;
 
@@ -2076,32 +2079,40 @@ static void f2fs_truncate_quota_inode_pages(struct super_block *sb)
 
 static int f2fs_dquot_commit(struct dquot *dquot)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_commit(dquot);
 	if (ret < 0)
-		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_acquire(struct dquot *dquot)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_acquire(dquot);
 	if (ret < 0)
-		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
-
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_release(struct dquot *dquot)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_release(dquot);
 	if (ret < 0)
-		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	up_read(&sbi->quota_sem);
 	return ret;
 }
 
@@ -2111,22 +2122,27 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_mark_dquot_dirty(dquot);
 
 	/* if we are using journalled quota */
 	if (is_journalled_quota(sbi))
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
 
+	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_commit_info(struct super_block *sb, int type)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int ret;
 
+	down_read(&sbi->quota_sem);
 	ret = dquot_commit_info(sb, type);
 	if (ret < 0)
-		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	up_read(&sbi->quota_sem);
 	return ret;
 }
 
@@ -3235,6 +3251,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 	init_rwsem(&sbi->cp_rwsem);
+	init_rwsem(&sbi->quota_sem);
 	init_waitqueue_head(&sbi->cp_wait);
 	init_sb_info(sbi);
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

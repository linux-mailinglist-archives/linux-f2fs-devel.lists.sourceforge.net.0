Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A909611792B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:24:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRRg-0006Ej-E2; Mon, 09 Dec 2019 22:24:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRRf-0006EF-Jz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYnahTGQQvx23zazvjYuGgA0YACGNMtX/Xy0pXzVMh8=; b=V2xjAPcj/mL0LLYcAuG0bb6hQf
 +/0L39pexIuGvJ43IdxO5VIxixqA/sAfxBzkTyv2MkhD4CwtHv00M0damL9YXLGJ0URNZOyWLIFrA
 TMUWQWE7vDf4Jm08tyN2SVjuZNQB9RBShPiTxXW1avVgjRRtXqastwmby5v+DglmagqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KYnahTGQQvx23zazvjYuGgA0YACGNMtX/Xy0pXzVMh8=; b=RZg2dLuPu566DMvg3ClERAPb2a
 z5jADQWM3RCsrk3mTJFvaNPBNpSNjjSXEhbf7uvr3cZU3t4qYNePH+wZaC1/FwiR+CPVQD6pRWNCP
 wfoMe4hje6KFlGqv0QzsyCzLxZ7H2upIZfbj+HrQjTisCBRQAL/WuY6nJiEtb+pgJ6CQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRRZ-00Fing-3B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B9762071E;
 Mon,  9 Dec 2019 22:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930227;
 bh=A+gppiBF+YkBTBbG9jAbQcsegmphuu6BqQl55N2MGpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QoM6NzNiGJqicb+Ws8gUtxZCWYelOHpEef3cGJYk6HEfrAGJOGUz/RZ4SFzVt5GsQ
 2Y9TUW4k9V5XXjX9g2774ksy4/mngjfVobySy5Tr2vaC99Y6KI5FQ0VahT0cmV60St
 wqF73/kj7rWlziKSdt+p6MhcVScbmlwg2IEW+2qw=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 14:23:41 -0800
Message-Id: <20191209222345.1078-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20191209222345.1078-1-jaegeuk@kernel.org>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ieRRZ-00Fing-3B
Subject: [f2fs-dev] [PATCH 2/6] f2fs: declare nested quota_sem and remove
 unnecessary sems
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

1.
f2fs_quota_sync
 -> down_read(&sbi->quota_sem)
 -> dquot_writeback_dquots
  -> f2fs_dquot_commit
   -> down_read(&sbi->quota_sem)

2.
f2fs_quota_sync
 -> down_read(&sbi->quota_sem)
  -> f2fs_write_data_pages
   -> f2fs_write_single_data_page
    -> down_write(&F2FS_I(inode)->i_sem)

f2fs_mkdir
 -> f2fs_do_add_link
   -> down_write(&F2FS_I(inode)->i_sem)
   -> f2fs_init_inode_metadata
    -> f2fs_new_node_page
     -> dquot_alloc_inode
      -> f2fs_dquot_mark_dquot_dirty
       -> down_read(&sbi->quota_sem)

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5111e1ffe58a..15888ca02e7f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2156,39 +2156,30 @@ static void f2fs_truncate_quota_inode_pages(struct super_block *sb)
 static int f2fs_dquot_commit(struct dquot *dquot)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
-	int ret;
+	int ret = dquot_commit(dquot);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_commit(dquot);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_acquire(struct dquot *dquot)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
-	int ret;
+	int ret = dquot_acquire(dquot);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_acquire(dquot);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
 static int f2fs_dquot_release(struct dquot *dquot)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
-	int ret;
+	int ret = dquot_release(dquot);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_release(dquot);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
@@ -2198,7 +2189,7 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int ret;
 
-	down_read(&sbi->quota_sem);
+	down_read_nested(&sbi->quota_sem, SINGLE_DEPTH_NESTING);
 	ret = dquot_mark_dquot_dirty(dquot);
 
 	/* if we are using journalled quota */
@@ -2212,13 +2203,10 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
 static int f2fs_dquot_commit_info(struct super_block *sb, int type)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int ret;
+	int ret = dquot_commit_info(sb, type);
 
-	down_read(&sbi->quota_sem);
-	ret = dquot_commit_info(sb, type);
 	if (ret < 0)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
 	return ret;
 }
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

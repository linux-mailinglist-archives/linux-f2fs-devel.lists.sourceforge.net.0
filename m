Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C438E1252C5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 21:10:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfe0-0000iN-DN; Wed, 18 Dec 2019 20:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ihfdx-0000hP-LW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NFzT/D6FFPxhoZ/pqizjRUBdcOsuHBfUb4Z3CuppKwI=; b=S5EX6wAGJr/wpRYhWo352IMgdq
 3x1wencB/qeFeoDfjUojlGhMM4ftYtvAUn8sgiXld4YrmDAYmXB4pG8NH4v2tz6+6uoyIdSUPDOnM
 WMlOl7Rr5lmwjGDCcWP4H9ajv3I82YIcbnUSvWh1XZU27eLIzOwd0fu25FGZBK9d5MQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NFzT/D6FFPxhoZ/pqizjRUBdcOsuHBfUb4Z3CuppKwI=; b=bAIx/gQYXM+zFMIBtpB7TsRm7U
 nWpi0hpQ28BE+OHb9vrllFIQApytVpj734WcNsp8lihpK45aisutZE4iNbesSO4Cvk5iRd+x6H4y2
 ZZZQEyogTzgZF9O1xlSFLNENDKyEWk2qjdlGTfBt543A3kNurDfzb+VLphC33nBe1U7o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfdv-009Ago-I6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:01 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 030A821D7D;
 Wed, 18 Dec 2019 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576699789;
 bh=Rod+bJ2QMrojGgJqYQnIMGlsLvajxvwq+9925iKpS+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X/xImYerBfbvNWoa9mF0Ye/pmPU3bqMMPKLjR53RlCEEdyd+kT4scluxwEVn4OTMG
 lCAyR7kgoh1+9w9UZ2lgeMvIhbqGgkHgD33R6v7uKGeJIZ0nPwQY4odbkBhgRS4TtX
 c+Xd/UcA4lO/1xzAdZnL/MT/qEBOY87ICRtrDF9s=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Dec 2019 12:09:45 -0800
Message-Id: <20191218200947.20445-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191218200947.20445-1-jaegeuk@kernel.org>
References: <20191218200947.20445-1-jaegeuk@kernel.org>
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
X-Headers-End: 1ihfdv-009Ago-I6
Subject: [f2fs-dev] [PATCH 2/4] f2fs: don't put new_page twice in f2fs_rename
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

In f2fs_rename(), new_page is gone after f2fs_set_link(), but it tries
to put again when whiteout is failed and jumped to put_out_dir.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 61615ab466c2..91e7b8360d2a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -850,7 +850,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct inode *old_inode = d_inode(old_dentry);
 	struct inode *new_inode = d_inode(new_dentry);
 	struct inode *whiteout = NULL;
-	struct page *old_dir_page;
+	struct page *old_dir_page = NULL;
 	struct page *old_page, *new_page = NULL;
 	struct f2fs_dir_entry *old_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry;
@@ -941,6 +941,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			goto put_out_dir;
 
 		f2fs_set_link(new_dir, new_entry, new_page, old_inode);
+		new_page = NULL;
 
 		new_inode->i_ctime = current_time(new_inode);
 		down_write(&F2FS_I(new_inode)->i_sem);
@@ -980,6 +981,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_mark_inode_dirty_sync(old_inode, false);
 
 	f2fs_delete_entry(old_entry, old_page, old_dir, NULL);
+	old_page = NULL;
 
 	if (whiteout) {
 		set_inode_flag(whiteout, FI_INC_LINK);
@@ -1015,8 +1017,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 put_out_dir:
 	f2fs_unlock_op(sbi);
-	if (new_page)
-		f2fs_put_page(new_page, 0);
+	f2fs_put_page(new_page, 0);
 out_dir:
 	if (old_dir_entry)
 		f2fs_put_page(old_dir_page, 0);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

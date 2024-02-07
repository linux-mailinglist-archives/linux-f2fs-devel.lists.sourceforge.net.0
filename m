Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195884C576
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 08:06:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXc0X-0003Bp-Gf;
	Wed, 07 Feb 2024 07:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rXc0W-0003Bj-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 07:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOH/1Yw7xu4CiOrLZOqKWg3Q1NN5WKQC1agoIwUFN5I=; b=eILWfsbFdM5Q4vu32DjV8OLiWK
 KaLl/f8DwTNzV+CZIzBGV5NcDg0OulNrLpEFFKONj84mSWG97UDX5kINavYaeEh8g9dfDAyI84ueK
 deAaUMrzv6az5IjOWQ8uK5gC6/9yFptKr5GUcXHJWSBvw+zmHa8vf3c+eNeQPSOag8To=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vOH/1Yw7xu4CiOrLZOqKWg3Q1NN5WKQC1agoIwUFN5I=; b=O
 TUw6mh2Ev0ogroiWwXPoPuKyASOhhE4xxpkYaw+hLwdY+TfI9/nBMsEO8tJdOsCoB8Ja9eyyibpcW
 RW/VYKkHQv3ial55uMR0QAv48lSYUzH/pVNtImwFBCvWnL32iuTfnVZDHer0DLdhKhyN7D3CafSTN
 mJn2eAqLoTz6C4uU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXc0V-00031L-5H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 07:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CB1B6179E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Feb 2024 07:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998AEC433F1;
 Wed,  7 Feb 2024 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707289557;
 bh=HNMxCXvkbowQz//LS7XjumNniPUW5mVxhUuwb9xHlXc=;
 h=From:To:Cc:Subject:Date:From;
 b=oWPVvnHHynNKfgK0pUIPBIwiQs/IdPsMrAKOXNUiRCv4hpQw/ZbItBAq+I9Paq3HL
 nZ/D6o3sLFjG1HTQXwoswaBM5Ztiy0+QmDYC+POggnHhzb1bw8jtcT9+u7KX9DE7Jb
 4Qq5JcF0dBKvBJKtCd4IIumgkpjekoQZPL2LcNsrCoua0lzlwCbYSWjoEqEKiiVb0D
 qStj+lqmzRwGSUTQ5X0/n/KaVgr80++MGJnBtGEMxwjdvkpfkN06JUaQrIYod3yBSN
 4qC8NyzJFTRnd/Q5PdhtfBUo6gApvdbMaOFwpXfg4fAXj3S2dq5VrBjDWic2NGYPE9
 vzei+lG3Wf5Qg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  7 Feb 2024 15:05:48 +0800
Message-Id: <20240207070548.3095087-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/700 - output mismatch (see
 /media/fstests/results//generic/700.out.bad)
 --- tests/generic/700.out 2023-03-28 10:40:42.735529223 +0000 +++
 /media/fstests/results//generic/700.out.bad 2024-02-06 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rXc0V-00031L-5H
Subject: [f2fs-dev] [PATCH] f2fs: fix to create selinux label during
 whiteout initialization
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/700       - output mismatch (see /media/fstests/results//generic/700.out.bad)
    --- tests/generic/700.out	2023-03-28 10:40:42.735529223 +0000
    +++ /media/fstests/results//generic/700.out.bad	2024-02-06 04:37:56.000000000 +0000
    @@ -1,2 +1,4 @@
     QA output created by 700
    +/mnt/scratch_f2fs/f1: security.selinux: No such attribute
    +/mnt/scratch_f2fs/f2: security.selinux: No such attribute
     Silence is golden
    ...
    (Run 'diff -u /media/fstests/tests/generic/700.out /media/fstests/results//generic/700.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      70b589a37e1a xfs: add selinux labels to whiteout inodes

Previously, it missed to create selinux labels during whiteout inode
initialization, fix this issue.

Fixes: 7e01e7ad746b ("f2fs: support RENAME_WHITEOUT")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/dir.c   |  5 +++--
 fs/f2fs/f2fs.h  |  3 ++-
 fs/f2fs/namei.c | 25 +++++++++++++++++--------
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 3f20d94e12f9..02c9355176d3 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -830,13 +830,14 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 	return err;
 }
 
-int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
+int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
+					struct f2fs_filename *fname)
 {
 	struct page *page;
 	int err = 0;
 
 	f2fs_down_write(&F2FS_I(inode)->i_sem);
-	page = f2fs_init_inode_metadata(inode, dir, NULL, NULL);
+	page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
 	if (IS_ERR(page)) {
 		err = PTR_ERR(page);
 		goto fail;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d44e2c43d8ab..af766404f454 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3589,7 +3589,8 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 			struct inode *dir, struct inode *inode);
-int f2fs_do_tmpfile(struct inode *inode, struct inode *dir);
+int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
+					struct f2fs_filename *fname);
 bool f2fs_empty_dir(struct inode *dir);
 
 static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index ba11298b7837..0875602e2406 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -852,7 +852,7 @@ static int f2fs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 			  struct file *file, umode_t mode, bool is_whiteout,
-			  struct inode **new_inode)
+			  struct inode **new_inode, struct f2fs_filename *fname)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct inode *inode;
@@ -880,7 +880,7 @@ static int __f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out;
 
-	err = f2fs_do_tmpfile(inode, dir);
+	err = f2fs_do_tmpfile(inode, dir, fname);
 	if (err)
 		goto release_out;
 
@@ -931,22 +931,24 @@ static int f2fs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	err = __f2fs_tmpfile(idmap, dir, file, mode, false, NULL);
+	err = __f2fs_tmpfile(idmap, dir, file, mode, false, NULL, NULL);
 
 	return finish_open_simple(file, err);
 }
 
 static int f2fs_create_whiteout(struct mnt_idmap *idmap,
-				struct inode *dir, struct inode **whiteout)
+				struct inode *dir, struct inode **whiteout,
+				struct f2fs_filename *fname)
 {
-	return __f2fs_tmpfile(idmap, dir, NULL,
-				S_IFCHR | WHITEOUT_MODE, true, whiteout);
+	return __f2fs_tmpfile(idmap, dir, NULL, S_IFCHR | WHITEOUT_MODE,
+						true, whiteout, fname);
 }
 
 int f2fs_get_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 		     struct inode **new_inode)
 {
-	return __f2fs_tmpfile(idmap, dir, NULL, S_IFREG, false, new_inode);
+	return __f2fs_tmpfile(idmap, dir, NULL, S_IFREG,
+				false, new_inode, NULL);
 }
 
 static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
@@ -990,7 +992,14 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	if (flags & RENAME_WHITEOUT) {
-		err = f2fs_create_whiteout(idmap, old_dir, &whiteout);
+		struct f2fs_filename fname;
+
+		err = f2fs_setup_filename(old_dir, &old_dentry->d_name,
+							0, &fname);
+		if (err)
+			return err;
+
+		err = f2fs_create_whiteout(idmap, old_dir, &whiteout, &fname);
 		if (err)
 			return err;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

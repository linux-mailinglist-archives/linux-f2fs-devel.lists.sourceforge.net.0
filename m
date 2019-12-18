Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 346291252C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 21:10:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfe2-0007BD-Ed; Wed, 18 Dec 2019 20:10:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ihfdy-0007AC-6o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9wlYAg8NHN5uZ3ydGRdYz8rlf6RYtg1kQkxacdV9d84=; b=LGN8vIjm1Ze+NFAuS28mHQVr5y
 HIh5OREEId6lkjANRQm8ujmaBu019GgYB3u9KaJKKUDyRAb5Jlf9BvSnwfW4CUeVSWpqvy/HW3CAW
 lMMCnNZSAyVCZAxbO7WOvbJRrFCtATH0+E0Q94bCiN714wLtsxBq/qiEMXHgW1IFOl1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9wlYAg8NHN5uZ3ydGRdYz8rlf6RYtg1kQkxacdV9d84=; b=W
 YLBLEE7Kz7wmISlgcYvF3mp5Hj30kGwGARi988RUh/+Q41WzHn57dz48632COIXTncifFfkBiYdKG
 POXJ1TjRXavgkTOBplyWPWfLAfWyJh7fhi49jd5ac9sBtczTYxq224C0JGvZ+TiplwnCsmn2lDzpE
 xMuNkBQ+l/5z7W9M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfdu-0091lE-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:02 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DFEA2176D;
 Wed, 18 Dec 2019 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576699788;
 bh=/KD7EM6C7AOfwLcr9C9xpVsfMo+pOZkTit5WAuTRmPU=;
 h=From:To:Cc:Subject:Date:From;
 b=2csad9tys+XBfYmT6nRuod03RfXeQE02r+DxP54UNLUBf7n32ThbskR3t6v5WcKzO
 27xZeBLu3zNBIqVL45BPIS0vj2dZL3cD9/lcpIDGnjyiAQgCwceFGBBukcV2rZn8kX
 zLBO6TgZHPvKEAoWLzsCi04ew4/2uu5aW1opLFTI=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Dec 2019 12:09:44 -0800
Message-Id: <20191218200947.20445-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihfdu-0091lE-Sy
Subject: [f2fs-dev] [PATCH 1/4] f2fs: convert inline_dir early before
 starting rename
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

If we hit an error during rename, we'll get two dentries in different
directories.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/inline.c | 30 ++++++++++++++++++++++++++++--
 fs/f2fs/namei.c  | 36 +++++++++++++-----------------------
 3 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dbc20d33d0e1..8d64525743cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3490,6 +3490,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 int f2fs_read_inline_data(struct inode *inode, struct page *page);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
+int f2fs_convert_inline_dir(struct inode *dir);
 int f2fs_write_inline_data(struct inode *inode, struct page *page);
 bool f2fs_recover_inline_data(struct inode *inode, struct page *npage);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 52f85ed07a15..f82c3d9cf333 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -530,7 +530,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
 	return err;
 }
 
-static int f2fs_convert_inline_dir(struct inode *dir, struct page *ipage,
+static int do_convert_inline_dir(struct inode *dir, struct page *ipage,
 							void *inline_dentry)
 {
 	if (!F2FS_I(dir)->i_dir_level)
@@ -539,6 +539,32 @@ static int f2fs_convert_inline_dir(struct inode *dir, struct page *ipage,
 		return f2fs_move_rehashed_dirents(dir, ipage, inline_dentry);
 }
 
+int f2fs_convert_inline_dir(struct inode *dir)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	struct page *ipage;
+	void *inline_dentry = NULL;
+	int err;
+
+	if (!f2fs_has_inline_dentry(dir))
+		return 0;
+
+	f2fs_lock_op(sbi);
+
+	ipage = f2fs_get_node_page(sbi, dir->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	inline_dentry = inline_data_addr(dir, ipage);
+
+	err = do_convert_inline_dir(dir, ipage, inline_dentry);
+	if (!err)
+		f2fs_put_page(ipage, 1);
+
+	f2fs_unlock_op(sbi);
+	return err;
+}
+
 int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 				const struct qstr *orig_name,
 				struct inode *inode, nid_t ino, umode_t mode)
@@ -562,7 +588,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 	if (bit_pos >= d.max) {
-		err = f2fs_convert_inline_dir(dir, ipage, inline_dentry);
+		err = do_convert_inline_dir(dir, ipage, inline_dentry);
 		if (err)
 			return err;
 		err = -EAGAIN;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 5d9584281935..61615ab466c2 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -855,7 +855,6 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct f2fs_dir_entry *old_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry;
 	struct f2fs_dir_entry *new_entry;
-	bool is_old_inline = f2fs_has_inline_dentry(old_dir);
 	int err;
 
 	if (unlikely(f2fs_cp_error(sbi)))
@@ -868,6 +867,19 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			F2FS_I(old_dentry->d_inode)->i_projid)))
 		return -EXDEV;
 
+	/*
+	 * old entry and new entry can locate in the same inline
+	 * dentry in inode, when attaching new entry in inline dentry,
+	 * it could force inline dentry conversion, after that,
+	 * old_entry and old_page will point to wrong address, in
+	 * order to avoid this, let's do the check and update here.
+	 */
+	if (old_dir == new_dir && !new_inode) {
+		err = f2fs_convert_inline_dir(old_dir);
+		if (err)
+			return err;
+	}
+
 	if (flags & RENAME_WHITEOUT) {
 		err = f2fs_create_whiteout(old_dir, &whiteout);
 		if (err)
@@ -954,28 +966,6 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 		if (old_dir_entry)
 			f2fs_i_links_write(new_dir, true);
-
-		/*
-		 * old entry and new entry can locate in the same inline
-		 * dentry in inode, when attaching new entry in inline dentry,
-		 * it could force inline dentry conversion, after that,
-		 * old_entry and old_page will point to wrong address, in
-		 * order to avoid this, let's do the check and update here.
-		 */
-		if (is_old_inline && !f2fs_has_inline_dentry(old_dir)) {
-			f2fs_put_page(old_page, 0);
-			old_page = NULL;
-
-			old_entry = f2fs_find_entry(old_dir,
-						&old_dentry->d_name, &old_page);
-			if (!old_entry) {
-				err = -ENOENT;
-				if (IS_ERR(old_page))
-					err = PTR_ERR(old_page);
-				f2fs_unlock_op(sbi);
-				goto out_dir;
-			}
-		}
 	}
 
 	down_write(&F2FS_I(old_inode)->i_sem);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525618E11E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 13:20:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFd6r-0005sx-S5; Sat, 21 Mar 2020 12:20:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jFd6q-0005sa-9g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqrIWbvP5SvmQ+aqj8hJJFushZwxe8NNtDFsm2YIYzY=; b=a/f3ULVl/Rj+zbMD7E6GEDbjeF
 udeWUT+F1Z+UpPioWWEJ/xhsmX4LmDbBYzCUTPqJbgN7n3Up60HJ7HzamAuitWGBLtgeBjhzoEBQu
 8OjjPmm5x8z5GPmoc5FKY6zG1SI4Yngy7Lm+bw1XGCk+lCK0Rsc9P3WJm6r2StnAgHQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KqrIWbvP5SvmQ+aqj8hJJFushZwxe8NNtDFsm2YIYzY=; b=c
 vFEdi9g2wTgzhspqwRD7vOHqFSPnW21Agk1+OKzisG9P2rT55cmW+jQIarVK/CX8TQI6v91Dr76jD
 CuZTpPGqgbp5EssLIXLE3AzUmG5up4mpcj+cCqMurueqCWQj85QJcUta8J4GBHJ2K80gHHFUrLh92
 9H+Z/vFMepJ7RQjk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFd6o-00GIbd-9v
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:20:12 +0000
Received: from localhost.localdomain (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 308B020722;
 Sat, 21 Mar 2020 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584793199;
 bh=dAEeJBsBD8vPgIWoHtkB7iVfjDZMwlGNTPBlVTUgEyo=;
 h=From:To:Cc:Subject:Date:From;
 b=KQm646WSgVFJGEc8ROvdcbEXR7+q9y6Iuhid9lNRfvqAriTzuCIikvr5d0sHjMgV0
 oTDapfUuoeOfOqi9iE8Z2zgkUv5ZDh0WEFbiVKqZUZemvHZ8lXThAlYaSh8MQvvfFV
 Qclgk9KXTBQoucmzHypwjXFLik4SPjwZIWsM/rFA=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 21 Mar 2020 20:19:33 +0800
Message-Id: <20200321121933.22297-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
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
X-Headers-End: 1jFd6o-00GIbd-9v
Subject: [f2fs-dev] [PATCH v2] f2fs: clean up f2fs_may_encrypt()
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

From: Chao Yu <yuchao0@huawei.com>

Merge below two conditions into f2fs_may_encrypt() for cleanup
- IS_ENCRYPTED()
- DUMMY_ENCRYPTION_ENABLED()

Check IS_ENCRYPTED(inode) condition in f2fs_init_inode_metadata()
is enough since we have already set encrypt flag in f2fs_new_inode().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- remove unneeded check condition in f2fs_init_inode_metadata() suggested
by Eric.
 fs/f2fs/dir.c   |  4 +---
 fs/f2fs/f2fs.h  | 13 +++++++++----
 fs/f2fs/namei.c |  4 +---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 0971ccc4664a..44bfc464df78 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -471,7 +471,6 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			struct page *dpage)
 {
 	struct page *page;
-	int dummy_encrypt = DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(dir));
 	int err;
 
 	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
@@ -498,8 +497,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (err)
 			goto put_error;
 
-		if ((IS_ENCRYPTED(dir) || dummy_encrypt) &&
-					f2fs_may_encrypt(inode)) {
+		if (IS_ENCRYPTED(inode)) {
 			err = fscrypt_inherit_context(dir, inode, page, false);
 			if (err)
 				goto put_error;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 09db79a20f8e..fcafa68212eb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3946,15 +3946,20 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
-static inline bool f2fs_may_encrypt(struct inode *inode)
+static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	umode_t mode = inode->i_mode;
 
-	return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
-#else
-	return false;
+	/*
+	 * If the directory encrypted or dummy encryption enabled,
+	 * then we should encrypt the inode.
+	 */
+	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
+		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
 #endif
+	return false;
 }
 
 static inline bool f2fs_may_compress(struct inode *inode)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b75c70813f9e..95cfbce062e8 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -75,9 +75,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 
 	set_inode_flag(inode, FI_NEW_INODE);
 
-	/* If the directory encrypted, then we should encrypt the inode. */
-	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
-				f2fs_may_encrypt(inode))
+	if (f2fs_may_encrypt(dir, inode))
 		f2fs_set_encrypted_inode(inode);
 
 	if (f2fs_sb_has_extra_attr(sbi)) {
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

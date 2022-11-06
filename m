Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AE61E167
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Nov 2022 10:49:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1orcHL-0000zy-Tc;
	Sun, 06 Nov 2022 09:49:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1orcHI-0000zj-23
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 09:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hHl3M4unfg9iAvscWP4Ydk2FKBZFJIjOYqW7CUuezc=; b=Ekbj2idpbe830W4kxisUNl9skU
 4uRtVNr+haRMdTeI8PI5UymeAZr9V34oSs1N8a8DbA70siNG7C8OW8fLiX4zb0maqxt6nadytefW7
 8vk8cu2mXKmlDHAyeAmG3fD1Hymw4rhUXA+xm5z4MUTnxciHCYEr0aa8CfC5Mi+dnW+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3hHl3M4unfg9iAvscWP4Ydk2FKBZFJIjOYqW7CUuezc=; b=J
 SvFSLrDxG4KlCuAIe5P68kMFF1Rv4hn0+ooYJALtiJGEIuc9T3IXDLlsWE4etI4ToAo+Q5PMKiQwC
 5mJakAD/jaFrEvtFUC4teQeUKqTRaa54IY6wtYWtyrRwEw00m1LrA6agwKopbmFMvzvQm7AR/0f0M
 AXj0lXy+W+BttpLc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1orcHG-0005E0-2G for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 09:49:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F60F60C01;
 Sun,  6 Nov 2022 09:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05551C433D6;
 Sun,  6 Nov 2022 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667728145;
 bh=/3J3K4T2zDP17/yegl4QUIVFBcn3+M5lXwbalWCE2mA=;
 h=From:To:Cc:Subject:Date:From;
 b=Z2Nk+cZClDHW6V/lWjQXKCDQ0jfxn4VZOCPuTZ6gm0QoE8CpONzrmdbpZIeMOVU8P
 hE38IxujJB5ApZ+7Jn3MowucGWbaIxaJRbczWzhNIbx80CQFSQ+1kaaL7g/DjR3bnu
 GDsH1v9DWH0NaLfYFlBejvN1h6iKd8qFYJlbOvfNMZcaPyipkO/Yu4flIUIfBbNn7u
 foPlN5/0RYlh9A3chWc0QhxqL/VCJMihFcNlZDOkWReiDwYoyn0lctYYGT4HDy9Jbo
 GOAr65wL+j2/wT4gOlNCkBOOJ7QQnPb7Cqg336w+cTLtgPTNjhWYrQWgZRf1ybccFs
 CSZm151KuhbZQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  6 Nov 2022 17:48:55 +0800
Message-Id: <20221106094855.131967-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Wei Chen reports a kernel bug as blew: INFO: task
 syz-executor.0:29056
 blocked for more than 143 seconds. Not tainted 5.15.0-rc5 #1 "echo 0 >
 /proc/sys/kernel/hung_task_timeout_secs"
 disables this message. task:syz-executor.0 state:D stack [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1orcHG-0005E0-2G
Subject: [f2fs-dev] [PATCH] f2fs: speed up f2fs_empty_dir()
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
Cc: Wei Chen <harperchen1110@gmail.com>, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wei Chen reports a kernel bug as blew:

INFO: task syz-executor.0:29056 blocked for more than 143 seconds.
      Not tainted 5.15.0-rc5 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:14632 pid:29056 ppid:  6574 flags:0x00000004
Call Trace:
 __schedule+0x4a1/0x1720
 schedule+0x36/0xe0
 rwsem_down_write_slowpath+0x322/0x7a0
 fscrypt_ioctl_set_policy+0x11f/0x2a0
 __f2fs_ioctl+0x1a9f/0x5780
 f2fs_ioctl+0x89/0x3a0
 __x64_sys_ioctl+0xe8/0x140
 do_syscall_64+0x34/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Eric did some investigation on this issue, quoted from reply of Eric:

"Well, the quality of this bug report has a lot to be desired (not on
upstream kernel, reproducer is full of totally irrelevant stuff, not
sent to the mailing list of the filesystem whose disk image is being
fuzzed, etc.).  But what is going on is that f2fs_empty_dir() doesn't
consider the case of a directory with an extremely large i_size on a
malicious disk image.

Specifically, the reproducer mounts an f2fs image with a directory
that has an i_size of 14814520042850357248, then calls
FS_IOC_SET_ENCRYPTION_POLICY on it.

That results in a call to f2fs_empty_dir() to check whether the
directory is empty.  f2fs_empty_dir() then iterates through all
3616826182336513 blocks the directory allegedly contains to check
whether any contain anything.  i_rwsem is held during this, so
anything else that tries to take it will hang."

In order to solve this issue, let's use f2fs_get_next_page_offset()
to speed up iteration by skipping holes for all below functions:
- f2fs_empty_dir
- f2fs_readdir
- find_in_level

The way why we can speed up iteration was described in
'commit 3cf4574705b4 ("f2fs: introduce get_next_page_offset to speed
up SEEK_DATA")'.

Meanwhile, in f2fs_empty_dir(), let's use f2fs_find_data_page()
instead f2fs_get_lock_data_page(), due to i_rwsem was held in
caller of f2fs_empty_dir(), there shouldn't be any races, so it's
fine to not lock dentry page during lookuping dirents in the page.

Link: https://lore.kernel.org/lkml/536944df-a0ae-1dd8-148f-510b476e1347@kernel.org/T/
Reported-by: Wei Chen <harperchen1110@gmail.com>
Cc: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 17 ++++++++++++-----
 fs/f2fs/dir.c  | 34 ++++++++++++++++++++++++----------
 fs/f2fs/f2fs.h |  5 +++--
 fs/f2fs/gc.c   |  4 ++--
 4 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 51f7ae777711..560fa80590e9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1206,7 +1206,8 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 }
 
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-				     blk_opf_t op_flags, bool for_write)
+				     blk_opf_t op_flags, bool for_write,
+				     pgoff_t *next_pgofs)
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
@@ -1232,12 +1233,17 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
-	if (err)
+	if (err) {
+		if (err == -ENOENT && next_pgofs)
+			*next_pgofs = f2fs_get_next_page_offset(&dn, index);
 		goto put_err;
+	}
 	f2fs_put_dnode(&dn);
 
 	if (unlikely(dn.data_blkaddr == NULL_ADDR)) {
 		err = -ENOENT;
+		if (next_pgofs)
+			*next_pgofs = index + 1;
 		goto put_err;
 	}
 	if (dn.data_blkaddr != NEW_ADDR &&
@@ -1281,7 +1287,8 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 	return ERR_PTR(err);
 }
 
-struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index)
+struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
+					pgoff_t *next_pgofs)
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct page *page;
@@ -1291,7 +1298,7 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index)
 		return page;
 	f2fs_put_page(page, 0);
 
-	page = f2fs_get_read_data_page(inode, index, 0, false);
+	page = f2fs_get_read_data_page(inode, index, 0, false, next_pgofs);
 	if (IS_ERR(page))
 		return page;
 
@@ -1317,7 +1324,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct page *page;
 repeat:
-	page = f2fs_get_read_data_page(inode, index, 0, for_write);
+	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
 	if (IS_ERR(page))
 		return page;
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 21960a899b6a..030b7fd4142f 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -340,6 +340,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	unsigned int bidx, end_block;
 	struct page *dentry_page;
 	struct f2fs_dir_entry *de = NULL;
+	pgoff_t next_pgofs;
 	bool room = false;
 	int max_slots;
 
@@ -350,12 +351,13 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			       le32_to_cpu(fname->hash) % nbucket);
 	end_block = bidx + nblock;
 
-	for (; bidx < end_block; bidx++) {
+	while (bidx < end_block) {
 		/* no need to allocate new dentry pages to all the indices */
-		dentry_page = f2fs_find_data_page(dir, bidx);
+		dentry_page = f2fs_find_data_page(dir, bidx, &next_pgofs);
 		if (IS_ERR(dentry_page)) {
 			if (PTR_ERR(dentry_page) == -ENOENT) {
 				room = true;
+				bidx = next_pgofs;
 				continue;
 			} else {
 				*res_page = dentry_page;
@@ -376,6 +378,8 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 		if (max_slots >= s)
 			room = true;
 		f2fs_put_page(dentry_page, 0);
+
+		bidx++;
 	}
 
 	if (!de && room && F2FS_I(dir)->chash != fname->hash) {
@@ -956,7 +960,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 
 bool f2fs_empty_dir(struct inode *dir)
 {
-	unsigned long bidx;
+	unsigned long bidx = 0;
 	struct page *dentry_page;
 	unsigned int bit_pos;
 	struct f2fs_dentry_block *dentry_blk;
@@ -965,13 +969,17 @@ bool f2fs_empty_dir(struct inode *dir)
 	if (f2fs_has_inline_dentry(dir))
 		return f2fs_empty_inline_dir(dir);
 
-	for (bidx = 0; bidx < nblock; bidx++) {
-		dentry_page = f2fs_get_lock_data_page(dir, bidx, false);
+	while (bidx < nblock) {
+		pgoff_t next_pgofs;
+
+		dentry_page = f2fs_find_data_page(dir, bidx, &next_pgofs);
 		if (IS_ERR(dentry_page)) {
-			if (PTR_ERR(dentry_page) == -ENOENT)
+			if (PTR_ERR(dentry_page) == -ENOENT) {
+				bidx = next_pgofs;
 				continue;
-			else
+			} else {
 				return false;
+			}
 		}
 
 		dentry_blk = page_address(dentry_page);
@@ -983,10 +991,12 @@ bool f2fs_empty_dir(struct inode *dir)
 						NR_DENTRY_IN_BLOCK,
 						bit_pos);
 
-		f2fs_put_page(dentry_page, 1);
+		f2fs_put_page(dentry_page, 0);
 
 		if (bit_pos < NR_DENTRY_IN_BLOCK)
 			return false;
+
+		bidx++;
 	}
 	return true;
 }
@@ -1104,7 +1114,8 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 		goto out_free;
 	}
 
-	for (; n < npages; n++, ctx->pos = n * NR_DENTRY_IN_BLOCK) {
+	for (; n < npages; ctx->pos = n * NR_DENTRY_IN_BLOCK) {
+		pgoff_t next_pgofs;
 
 		/* allow readdir() to be interrupted */
 		if (fatal_signal_pending(current)) {
@@ -1118,11 +1129,12 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 			page_cache_sync_readahead(inode->i_mapping, ra, file, n,
 				min(npages - n, (pgoff_t)MAX_DIR_RA_PAGES));
 
-		dentry_page = f2fs_find_data_page(inode, n);
+		dentry_page = f2fs_find_data_page(inode, n, &next_pgofs);
 		if (IS_ERR(dentry_page)) {
 			err = PTR_ERR(dentry_page);
 			if (err == -ENOENT) {
 				err = 0;
+				n = next_pgofs;
 				continue;
 			} else {
 				goto out_free;
@@ -1141,6 +1153,8 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 		}
 
 		f2fs_put_page(dentry_page, 0);
+
+		n++;
 	}
 out_free:
 	fscrypt_fname_free_buffer(&fstr);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c767cc714958..473f2902435d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3820,8 +3820,9 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-			blk_opf_t op_flags, bool for_write);
-struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
+			blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
+struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
+							pgoff_t *next_pgofs);
 struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct page *f2fs_get_new_data_page(struct inode *inode,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 72f165048a3c..69d7d8db3daa 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1562,8 +1562,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				continue;
 			}
 
-			data_page = f2fs_get_read_data_page(inode,
-						start_bidx, REQ_RAHEAD, true);
+			data_page = f2fs_get_read_data_page(inode, start_bidx,
+							REQ_RAHEAD, true, NULL);
 			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			if (IS_ERR(data_page)) {
 				iput(inode);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

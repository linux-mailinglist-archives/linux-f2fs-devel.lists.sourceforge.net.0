Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B374536A5BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 10:34:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1laaDH-0002cf-Ui; Sun, 25 Apr 2021 08:33:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1laaDF-0002cU-BB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+v3W8TvFm8tbJduGFhpsLEuohpUSdchsv9MD/2/gGVI=; b=PR8BXVj9+SKEakRpxsm3v9EP70
 KVs7lEI6TOCR6k4cAm69kgGj6qHXdqkk8/8e6xcGUaj+v/uEDPaWAMBZ5BkN2m9fV4qYcbYCGFvwo
 MZBrqWf+zOD6Sw70PBsZgM/G8Y50tsqdxBSAyX82cJ1OQGjW8E/llcaLQnmNbY+2ZOFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+v3W8TvFm8tbJduGFhpsLEuohpUSdchsv9MD/2/gGVI=; b=f
 FbQBD5oLBNHxZGgLu4PT06Zk1gojFRJHwxFUztOLAyf0uwc1SyfNq18hVaTUF9R3CnCMG2trz1M9e
 mV9b/5VuffnaTIqT3SfWkMPQsHaeVyGluTdM93PPA6sfbM4wrSLaiumYJAeCvur8f9F/o1QeNR9nc
 NAP0n6/0zGNmA4NU=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1laaD7-005nMO-QE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:33:57 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FSVK366lDz7vyN;
 Sun, 25 Apr 2021 09:08:39 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sun, 25 Apr 2021 09:11:00 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sun, 25 Apr 2021 09:10:53 +0800
Message-ID: <20210425011053.44436-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1laaD7-005nMO-QE
Subject: [f2fs-dev] [PATCH v2] f2fs: reduce expensive checkpoint trigger
 frequency
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

We may trigger high frequent checkpoint for below case:
1. mkdir /mnt/dir1; set dir1 encrypted
2. touch /mnt/file1; fsync /mnt/file1
3. mkdir /mnt/dir2; set dir2 encrypted
4. touch /mnt/file2; fsync /mnt/file2
...

Although, newly created dir and file are not related, due to
commit bbf156f7afa7 ("f2fs: fix lost xattrs of directories"), we will
trigger checkpoint whenever fsync() comes after a new encrypted dir
created.

In order to avoid such condition, let's record an entry including
directory's ino into global cache when we initialize encryption policy
in a checkpointed directory, and then only trigger checkpoint() when
target file's parent has non-persisted encryption policy, for the case
its parent is not checkpointed, need_do_checkpoint() has cover that
by verifying it with f2fs_is_checkpointed_node().

Reported-by: Yunlei He <heyunlei@hihonor.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix to set ENC_DIR_INO only for encrypted directory
 fs/f2fs/f2fs.h              | 2 ++
 fs/f2fs/file.c              | 3 +++
 fs/f2fs/xattr.c             | 6 ++++--
 include/trace/events/f2fs.h | 3 ++-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b9d5317db0a7..0fe881309a20 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -246,6 +246,7 @@ enum {
 	APPEND_INO,		/* for append ino list */
 	UPDATE_INO,		/* for update ino list */
 	TRANS_DIR_INO,		/* for trasactions dir ino list */
+	ENC_DIR_INO,		/* for encrypted dir ino list */
 	FLUSH_INO,		/* for multiple device flushing */
 	MAX_INO_ENTRY,		/* max. list */
 };
@@ -1090,6 +1091,7 @@ enum cp_reason_type {
 	CP_FASTBOOT_MODE,
 	CP_SPEC_LOG_NUM,
 	CP_RECOVER_DIR,
+	CP_ENC_DIR,
 };
 
 enum iostat_type {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a595050c56d3..62af29ec0879 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -218,6 +218,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
 		f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
 							TRANS_DIR_INO))
 		cp_reason = CP_RECOVER_DIR;
+	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
+							ENC_DIR_INO))
+		cp_reason = CP_ENC_DIR;
 
 	return cp_reason;
 }
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c8f34decbf8e..70615d504f7e 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -630,6 +630,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 			const char *name, const void *value, size_t size,
 			struct page *ipage, int flags)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_xattr_entry *here, *last;
 	void *base_addr, *last_base_addr;
 	int found, newsize;
@@ -745,8 +746,9 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
 		f2fs_set_encrypted_inode(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
-	if (!error && S_ISDIR(inode->i_mode))
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
+	if (!error && S_ISDIR(inode->i_mode) && f2fs_encrypted_file(inode) &&
+			f2fs_is_checkpointed_node(sbi, inode->i_ino))
+		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
 
 same:
 	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 56b113e3cd6a..ca0cf12226e9 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -145,7 +145,8 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
 		{ CP_NODE_NEED_CP,	"node needs cp" },		\
 		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
 		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
-		{ CP_RECOVER_DIR,	"dir needs recovery" })
+		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
+		{ CP_ENC_DIR,		"persist encryption policy" })
 
 #define show_shutdown_mode(type)					\
 	__print_symbolic(type,						\
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

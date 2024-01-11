Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BF82A8E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 09:18:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNqGU-0004Kx-Dh;
	Thu, 11 Jan 2024 08:18:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNqGS-0004Kg-Hp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 08:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b/c+RVnNVZSFV5Prl/4HdTyOdL9FXA0wLrusL4y8nK4=; b=bjh0gcpFoz24VF9BmLLnGm2cY7
 2mGwG7i4K66dP2yr6riIyTAhrKdXRAKLIlPd6f3lXU95dwSeHrPw+5tqQDzqVhXHM16HU+YkMSjRq
 jrMmHJG6RidjOIXStDoOP+tqdfOr/xxEGO93kt5EJ6I2iBUvAvwZuxwHwgnMnVpLS3J4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b/c+RVnNVZSFV5Prl/4HdTyOdL9FXA0wLrusL4y8nK4=; b=C
 2faErgs3yfdNIY7qT4zp2QiwyySfgSwk91Jlox7HLUl8GHQGTONZFh37LaOcV0at/Lg4fdTenKR4H
 u7eHlM2nNkzBJNh5YfjV9t4NkQRa3m3zaNWFaD8wt/VpjNFfzYeHN1Dk9IlGbVoDbIDRt1qPvUjVg
 uhrAJNaoWaQPLXcQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNqGR-0004W5-F0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 08:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D4BE1CE1E86;
 Thu, 11 Jan 2024 08:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00909C433C7;
 Thu, 11 Jan 2024 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704961079;
 bh=6/KBhRJKvbOmR2LyqIZkaOwcwJm2RpzWRnpJUkpAL8I=;
 h=From:To:Cc:Subject:Date:From;
 b=PutPWzbtL476sPg8chP7RJKKWMAj+mYS2f7POak1nJalGkex+UvOwOUwJ7wGjIPZ+
 HTTazRqMpZIg+5qs0a1ykErqMwRq2LN6nrVK2Tfp8td8le5913ErcR4VV/9PRKUkfH
 tVGFe2xc57o64UYKfDwR2JcJ5q7mesWmu47yfPidp0FyibB0zYcSAiV0Di/YuLjcFM
 YcxA7mU9a/tV3N0NmMPaAkc0a+piApu9/Dd6L+iGdjca1cYMK6CHzmyVx6ULUGoY5T
 csAU/hTvog+6EBY3zGlivZYPtEMr/4yvpYroyjy92t/9TcKbc3/QfmKGLcIcyoVoVc
 QSH2xjPnBH97w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jan 2024 16:17:43 +0800
Message-Id: <20240111081743.2999210-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We may trigger high frequent checkpoint for below case: 1.
 mkdir /mnt/dir1; set dir1 encrypted 2. touch /mnt/file1; fsync /mnt/file1
 3. mkdir /mnt/dir2; set dir2 encrypted 4. touch /mnt/file2; fsync / [...]
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNqGR-0004W5-F0
Subject: [f2fs-dev] [PATCH v3] f2fs: reduce expensive checkpoint trigger
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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

Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Tested-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Reported-by: Yunlei He <heyunlei@hihonor.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- Recently, Zhiguo Niu reported the same issue, so I repost this
patch for comments.
 fs/f2fs/f2fs.h              |  2 ++
 fs/f2fs/file.c              |  3 +++
 fs/f2fs/xattr.c             | 16 ++++++++++++++--
 include/trace/events/f2fs.h |  3 ++-
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2e0ca45f881..0094a8c85f4a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -279,6 +279,7 @@ enum {
 	APPEND_INO,		/* for append ino list */
 	UPDATE_INO,		/* for update ino list */
 	TRANS_DIR_INO,		/* for transactions dir ino list */
+	ENC_DIR_INO,		/* for encrypted dir ino list */
 	FLUSH_INO,		/* for multiple device flushing */
 	MAX_INO_ENTRY,		/* max. list */
 };
@@ -1147,6 +1148,7 @@ enum cp_reason_type {
 	CP_FASTBOOT_MODE,
 	CP_SPEC_LOG_NUM,
 	CP_RECOVER_DIR,
+	CP_ENC_DIR,
 };
 
 enum iostat_type {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8198afb5fb9c..18b33b1f0c83 100644
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
index f290fe9327c4..cbd1b88297fe 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -629,6 +629,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 			const char *name, const void *value, size_t size,
 			struct page *ipage, int flags)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_xattr_entry *here, *last;
 	void *base_addr, *last_base_addr;
 	int found, newsize;
@@ -772,8 +773,19 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (index == F2FS_XATTR_INDEX_ENCRYPTION &&
 			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
 		f2fs_set_encrypted_inode(inode);
-	if (S_ISDIR(inode->i_mode))
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
+
+	if (S_ISDIR(inode->i_mode)) {
+		/*
+		 * In restrict mode, fsync() always tries triggering checkpoint
+		 * for all metadata consistency, in other mode, it only triggers
+		 * checkpoint when parent's encryption metadata updates.
+		 */
+		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
+			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
+		else if (IS_ENCRYPTED(inode) &&
+			f2fs_is_checkpointed_node(sbi, inode->i_ino))
+			f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
+	}
 
 same:
 	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 7ed0fc430dc6..48f2e399e184 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -139,7 +139,8 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
 		{ CP_NODE_NEED_CP,	"node needs cp" },		\
 		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
 		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
-		{ CP_RECOVER_DIR,	"dir needs recovery" })
+		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
+		{ CP_ENC_DIR,		"persist encryption policy" })
 
 #define show_shutdown_mode(type)					\
 	__print_symbolic(type,						\
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD204E9BCF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 18:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYrpu-0004Qr-R4; Mon, 28 Mar 2022 16:03:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nYrpt-0004Ql-OY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 16:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rf0Q4o1GGvlCI92jlxalmkGvonjuggFeR32lGRWc7a4=; b=lGvo4JFQCceZosTPIoodAuUMk8
 d56/skoxaxoReJS7Trvm+QSXAc/486liIj+SH+pqwmc5ZBIbxy6Q4lnf+zu3FTNGXcZlHu8/VKd3T
 2hAMVqn8xJ1mcYQ25g7gpG/+t3W+BelGj2vtFd6MfO+CPTCzzmfOBhZGOQGOAzedLVnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rf0Q4o1GGvlCI92jlxalmkGvonjuggFeR32lGRWc7a4=; b=m
 7el6zq8y+RIQIuVzUnUE3PKw9isQtfcDrmiD4a/QSIAga3ln3kStpng3P3mK2fHy3zbhQBdziGSOx
 W2QlTFwh/BqfP7XXJF0nFy4QtQuqrSgXLAGZqa6Ouegz2ZETqW/tcfQx/tZfVHrdU3taoR/5je4j4
 ASrWzz5HWtSQ4xfU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYrpp-00ElT9-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 16:03:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DACA2B81164;
 Mon, 28 Mar 2022 16:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74BC004DD;
 Mon, 28 Mar 2022 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648483385;
 bh=P0P3Lnt4gmVt++k6Xk8i+eUeKJePtopQkH5guyzaals=;
 h=From:To:Cc:Subject:Date:From;
 b=oEzW3aC2jtw45GDsyEznM0jFg8h+Yzbq/A+p0lUe6s0UE/V+mpj8F1WgbxJpOC1T/
 yPgto4nsBiPimjOwwvze5QLkxulYoqi3uh7+YyIGHf/Em/ACHGvYfjrhw5FM3z9pNt
 CdbLyYP3WOvSLPfWzJF++nW79ZiQClnPj1D3yFuNE3QLDx29iUO6EdDNGkLfxDWWQ8
 TPJl/vI91vEINeKuW7cDofEkBBUhxPqyvQomUur8LciuSTtpnGPhcygAf1cYNpZTuh
 qRrAel1D7zGYsEMNIZZoKiAZjnkr4YEfXbxmXpJDLTlZ6OXDt74jeS8Kspx82WcLn4
 g+ERzIdLrxWew==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 29 Mar 2022 00:02:53 +0800
Message-Id: <20220328160253.3102-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Wenqing reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215765
 It will cause a kernel panic with steps: - mkdir mnt - mount tmp40.img mnt
 - ls mnt 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYrpp-00ElT9-Ap
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on inline_dots inode
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
Cc: Wenqing Liu <wenqingliu0120@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Wenqing reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215765

It will cause a kernel panic with steps:
- mkdir mnt
- mount tmp40.img mnt
- ls mnt

folio_mark_dirty+0x33/0x50
f2fs_add_regular_entry+0x541/0xad0 [f2fs]
f2fs_add_dentry+0x6c/0xb0 [f2fs]
f2fs_do_add_link+0x182/0x230 [f2fs]
__recover_dot_dentries+0x2d6/0x470 [f2fs]
f2fs_lookup+0x5af/0x6a0 [f2fs]
__lookup_slow+0xac/0x200
lookup_slow+0x45/0x70
walk_component+0x16c/0x250
path_lookupat+0x8b/0x1f0
filename_lookup+0xef/0x250
user_path_at_empty+0x46/0x70
vfs_statx+0x98/0x190
__do_sys_newlstat+0x41/0x90
__x64_sys_newlstat+0x1a/0x30
do_syscall_64+0x37/0xb0
entry_SYSCALL_64_after_hwframe+0x44/0xae

The root cause is for special file: e.g. character, block, fifo or
socket file, f2fs doesn't assign address space operations pointer array
for mapping->a_ops field, so, in a fuzzed image, if inline_dots flag was
tagged in special file, during lookup(), when f2fs runs into
__recover_dot_dentries(), it will cause NULL pointer access once
f2fs_add_regular_entry() calls a_ops->set_dirty_page().

Fixes: 510022a85839 ("f2fs: add F2FS_INLINE_DOTS to recover missing dot dentries")
Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/namei.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 906e9e301ac8..e3f23ae9bb19 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -461,6 +461,13 @@ static int __recover_dot_dentries(struct inode *dir, nid_t pino)
 		return 0;
 	}
 
+	if (!S_ISDIR(dir->i_mode)) {
+		f2fs_err(sbi, "inconsistent inode status, skip recovering inline_dots inode (ino:%lu, i_mode:%u, pino:%u)",
+			  dir->i_ino, dir->i_mode, pino);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -ENOTDIR;
+	}
+
 	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

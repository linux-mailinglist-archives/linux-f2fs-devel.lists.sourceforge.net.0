Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D37905129A9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 04:50:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njuEM-0007J5-5W; Thu, 28 Apr 2022 02:50:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1njuEK-0007Iz-MK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 02:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6IPoD7eD/smBby01D7AtjMMfsxzGHbTiIxTkYSWMlAU=; b=bIm3F5oGMgEmmu21OsQ4r5zTTW
 9zVaHJfDdV56IOlkOFzCUZK5d2Kx8ZXuxaOXMA8s2+ShK8DckpYMjm6Crwt3O6NDu05oAOvVXZ524
 6RxA1SWDMWHN3WKmyJIGbdAWjP7uhC1k9nRQen3j5iP7GIaEa5plkj1KUXwCCwWBJvd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6IPoD7eD/smBby01D7AtjMMfsxzGHbTiIxTkYSWMlAU=; b=L
 mN81s1f26CJKBAwU0R4ZsxlDEBCFPEjlRNFOk75SZ+5lkPICvk+gu/KZM227sp5917rzhaZrcDoV8
 GsoAKh+prMjqA1gh4n8YtQkjJVGTe37Z3pJUIl1LSWEXZkiaja8qRvLtkE/tw7ncGmGdsFS+NiEMP
 1fqgyrp8s2FI9J3c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njuEF-0007Ik-RB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 02:50:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0209FB82B33;
 Thu, 28 Apr 2022 02:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BB9C385A9;
 Thu, 28 Apr 2022 02:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651114190;
 bh=+QjhRstIP0l49yEI8x36m/NyfYc/s4NAkMUHD/Mjies=;
 h=From:To:Cc:Subject:Date:From;
 b=kjlY47SHJq9f31TN4d5rVmz9o9AYA+jovPHmtb5OZ4m34zPVJyX4iaOU0U5htexFy
 T2dIx1OwDp6kn2dA292lIikXa99zBTjBO00ZELmH7PsD1PsR/a+BnRgw5k/UOrw8cu
 lRn+nr+0scKxp7Bfq/Juu9EFy6JIi1aMQy0YLPd1529LqbO/JiFKVPVSjn9Su/knuI
 dj70qjUNEa1wyODnw3Ewfee9yO9nerrsScAamgm6pwQNO6cAAiLnD8RgBLHF7QH+st
 a/T0YeMPBKTRgSvxFXtDW+4E14IZ61TNw03ZSO3FCOe8enE2xmSqfmuvCOgeE9frJ1
 CmC/DwOgFtZhg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Apr 2022 10:49:40 +0800
Message-Id: <20220428024940.12102-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Yanming reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215895
 I have encountered a bug in F2FS file system in kernel v5.17. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njuEF-0007Ik-RB
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check for inline inode
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Yanming reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215895

I have encountered a bug in F2FS file system in kernel v5.17.

The kernel message is shown below:

kernel BUG at fs/inode.c:611!
Call Trace:
 evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 dput+0x2dd/0x720
 do_renameat2+0x596/0x970
 __x64_sys_rename+0x78/0x90
 do_syscall_64+0x3b/0x90

The root cause is: fuzzed inode has both inline_data flag and encrypted
flag, so after it was deleted by rename(), during f2fs_evict_inode(),
it will cause inline data conversion due to flags confilction, then
page cache will be polluted and trigger panic in clear_inode().

This patch tries to fix the issue by do more sanity checks for inline
data inode in sanity_check_inode().

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/f2fs.h  | 7 +++++++
 fs/f2fs/inode.c | 3 +--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 27aa93caec06..64c511b498cc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
  */
 static inline bool f2fs_post_read_required(struct inode *inode)
 {
+	/*
+	 * used by sanity_check_inode(), when disk layout fields has not
+	 * been synchronized to inmem fields.
+	 */
+	if (file_is_encrypt(inode) || file_is_verity(inode) ||
+			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
+		return true;
 	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
 		f2fs_compressed_file(inode);
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 83639238a1fe..234b8ed02644 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_has_inline_data(inode) &&
-			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
+	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAD52983D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 05:31:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqnvw-0006XU-NB; Tue, 17 May 2022 03:31:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nqnvv-0006XO-9V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 03:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3S+sh9sJNWPWIiKzEHvrETf3MC5yZNje+OQy6ssFX4=; b=E4JPswlG7kQTDTltukzz1vHBve
 OpCzHCnCO17l4hXSOJlnnb6ev6DekxgeWwqKa+yeaTg5G3yL3Uh05Xf/dai7HBLHeZwGr0bGT3aO5
 amUdrb9EDykHnLTicMP4Gg49AGO5zjZbt+KvC6kZvgLiDrFU1zoiujvjcpovnWxyEbIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i3S+sh9sJNWPWIiKzEHvrETf3MC5yZNje+OQy6ssFX4=; b=f
 F5ynGRQI6bQTY2Rt6VkW2wWEC1YbsfqoBPgKhoWoxWbQSptflPqg8nECLoynzsPscaGFd09nN2o9F
 Y9SafQIpoYHnoZ/DnoAzZf9WMzvjwWZY1OqOmhO+TemUsAaq/u4/xY47uBFCZ4vAyPT6XMxhJUi+3
 zKVg/YODBnreGov0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqnvs-00045b-1E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 03:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA7BDB815CE;
 Tue, 17 May 2022 03:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F31C34115;
 Tue, 17 May 2022 03:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652758287;
 bh=Dw8tFsGPNJpxwowTVAncpYfXnADMbsZZPIOSovGKhzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Khe0QJphBHv/ItTDiC0/Nntn2UhwH0EarPo+c+kYatw70l1PfANB5IsP9UWHhSm5L
 pgKoKpUe9P1Ge/LA9Y0U0Mq687i4eqZw+/DlN48z9HSrJaeVXAE/miXryOa2jSFLCT
 475WBoVHfvnNtoVb1iCg4ElJ1OpWiVzl/tynN2b+n31GWHDW1xB8rjxn01hmXq54r7
 E3S8yDwC/Oo5ZuC9JV1+ta4s7P3UalHVfqoVfL2+PqdC+sa3XYn/FS1MvYmaJhq8a8
 Pet21wpbDbmtrhE6fXcIauc3JgCPJuu8q86MISR0MOPdokjmo9Xr2LgXGS0LT2nC5e
 v68Na99U742FA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 17 May 2022 11:31:20 +0800
Message-Id: <20220517033120.3564912-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yanming reported a kernel bug in Bugzilla kernel [1], which
 can be reproduced. The bug message is: The kernel message is shown below:
 kernel BUG at fs/inode.c:611! Call Trace: evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 dput+0x2dd/0x720 do_renameat2+0x596/0x970 __x64_sys_rename+0x78/0x90
 do_syscall_64+0x3b/0x90
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqnvs-00045b-1E
Subject: [f2fs-dev] [PATCH v4] f2fs: fix to do sanity check for inline inode
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

Yanming reported a kernel bug in Bugzilla kernel [1], which can be
reproduced. The bug message is:

The kernel message is shown below:

kernel BUG at fs/inode.c:611!
Call Trace:
 evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 dput+0x2dd/0x720
 do_renameat2+0x596/0x970
 __x64_sys_rename+0x78/0x90
 do_syscall_64+0x3b/0x90

[1] https://bugzilla.kernel.org/show_bug.cgi?id=215895

The bug is due to fuzzed inode has both inline_data and encrypted flags.
During f2fs_evict_inode(), as the inode was deleted by rename(), it
will cause inline data conversion due to conflicting flags. The page
cache will be polluted and the panic will be triggered in clear_inode().

Try fixing the bug by doing more sanity checks for inline data inode in
sanity_check_inode().

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v4:
- introduce and use f2fs_post_read_required_ondisk() only for
sanity_check_inode().
 fs/f2fs/f2fs.h   | 15 ++++++++++++++-
 fs/f2fs/file.c   |  2 +-
 fs/f2fs/inline.c | 11 ++++++++---
 fs/f2fs/inode.c  |  3 +--
 fs/f2fs/namei.c  |  2 +-
 5 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7faf230f101f..65442ab03d32 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4039,7 +4039,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 /*
  * inline.c
  */
-bool f2fs_may_inline_data(struct inode *inode);
+bool f2fs_may_inline_data(struct inode *inode, bool sanity_check);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
@@ -4141,6 +4141,19 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
 #endif
 }
 
+static inline bool f2fs_post_read_required_ondisk(struct inode *inode)
+{
+	/*
+	 * used by sanity_check_inode(), when disk layout fields has not
+	 * been synchronized to inmem fields.
+	 */
+	if (S_ISREG(inode->i_mode) && (file_is_encrypt(inode) ||
+		F2FS_I(inode)->i_flags & F2FS_COMPR_FL ||
+		file_is_verity(inode)))
+		return true;
+
+	return false;
+}
 /*
  * Returns true if the reads of the inode's data need to undergo some
  * postprocessing step, like decryption or authenticity verification.
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0a554730d2c4..73ba1c6dceaa 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -796,7 +796,7 @@ int f2fs_truncate(struct inode *inode)
 		return err;
 
 	/* we should check inline_data size */
-	if (!f2fs_may_inline_data(inode)) {
+	if (!f2fs_may_inline_data(inode, false)) {
 		err = f2fs_convert_inline_inode(inode);
 		if (err)
 			return err;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index a578bf83b803..331ecd8af80c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -14,7 +14,7 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-bool f2fs_may_inline_data(struct inode *inode)
+bool f2fs_may_inline_data(struct inode *inode, bool sanity_check)
 {
 	if (f2fs_is_atomic_file(inode))
 		return false;
@@ -25,8 +25,13 @@ bool f2fs_may_inline_data(struct inode *inode)
 	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
 		return false;
 
-	if (f2fs_post_read_required(inode))
-		return false;
+	if (sanity_check) {
+		if (f2fs_post_read_required_ondisk(inode))
+			return false;
+	} else {
+		if (f2fs_post_read_required(inode))
+			return false;
+	}
 
 	return true;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2fce8fa0dac8..3384100dde0b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_has_inline_data(inode) &&
-			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
+	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode, true)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index c549acb52ac4..514088f707ed 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -89,7 +89,7 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (test_opt(sbi, INLINE_XATTR))
 		set_inode_flag(inode, FI_INLINE_XATTR);
 
-	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
+	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode, false))
 		set_inode_flag(inode, FI_INLINE_DATA);
 	if (f2fs_may_inline_dentry(inode))
 		set_inode_flag(inode, FI_INLINE_DENTRY);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

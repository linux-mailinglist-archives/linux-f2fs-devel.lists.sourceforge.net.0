Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D5852B9CE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 14:29:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrInV-0007Jy-Em; Wed, 18 May 2022 12:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nrInU-0007Jr-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 12:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BlkcrvDBnFx8UKIV/NoJ5fCdHOqx8wqu8as3u/eOYL4=; b=gP50xLmJT+eILEC0qmXNx6rq+T
 tRZ3krI1ycMmeAZLbyNV2X/zFlXAItB8rqJtYuc67YpNCGMHjNg3/NVTIEl/EWm1ci2zalIC6N0Y8
 nFcslfzLsKGgT4QSL6X8vnCgBA1vCqfhVartfpzDMVjS9afQZ0KnLdNUGQiO8plJHfxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BlkcrvDBnFx8UKIV/NoJ5fCdHOqx8wqu8as3u/eOYL4=; b=D
 0KsOjiOKbHJTyMuUi1PVA2gJNJ0hMnJlCfENGVSibYEZgJ8C22BTrf8z5JnTdlpFfctim5B1kQoJd
 ySrxPuAjxwp3arEUOnwHNuL5YxnjOVG/qBpt6quZPvGPmFE0d1jeDWte/QcKkiYJZY+fFQRW1TFkF
 Fz1rDhMKdqU4w6Ko=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrInS-006lLR-1w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 12:28:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DADC361290;
 Wed, 18 May 2022 12:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFACC385A5;
 Wed, 18 May 2022 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876927;
 bh=eeWVzhQfZJawr1ulEAO9X0x7Zypu4MY/8i2DFCdQrGk=;
 h=From:To:Cc:Subject:Date:From;
 b=eRSlZlMmxxnz0bwRoFeeMIHJqkS2ZfUOkw3rqmoXZ2sC0wTlh7vNSl3xrjViNfFQe
 4e5iob2b3GDummc18pz2lYDwzKinm+Lc3e/p6ZWqWRkcH3eR8igaU9T8X3pPsu72rQ
 ehpVjsEdjGdzL0OHoCisLXdPo5Ap7eJlVeg5VGIh90jS2baGtfCdPwZ5b73k/nFxZU
 uCNAtY7HnCgVnEfArVut7x51iEd6wmPEYwpLubScDTEpa3GL962yWjxq3hX8LdgjBo
 bIhASvwmyRVH+3mp1IfuQk77gG/TWwUGnUR71Q2zgViPMMSQ7eRw10Qbus7ld0ugAl
 +gTZktWi7hc3g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 18 May 2022 20:28:41 +0800
Message-Id: <20220518122841.12323-1-chao@kernel.org>
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
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nrInS-006lLR-1w
Subject: [f2fs-dev] [PATCH v5] f2fs: fix to do sanity check for inline inode
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
v5:
- clean up codes.
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/inline.c | 29 ++++++++++++++++++++++++-----
 fs/f2fs/inode.c  |  3 +--
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e9e32bc814df..000468bf06ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4019,6 +4019,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
+bool f2fs_sanity_check_inline_data(struct inode *inode);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index a578bf83b803..bf46a7dfbea2 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -14,21 +14,40 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-bool f2fs_may_inline_data(struct inode *inode)
+static bool support_inline_data(struct inode *inode)
 {
 	if (f2fs_is_atomic_file(inode))
 		return false;
-
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
-
 	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
 		return false;
+	return true;
+}
 
-	if (f2fs_post_read_required(inode))
+bool f2fs_may_inline_data(struct inode *inode)
+{
+	if (!support_inline_data(inode))
 		return false;
 
-	return true;
+	return !f2fs_post_read_required(inode);
+}
+
+bool f2fs_sanity_check_inline_data(struct inode *inode)
+{
+	if (!f2fs_has_inline_data(inode))
+		return false;
+
+	if (!support_inline_data(inode))
+		return true;
+
+	/*
+	 * used by sanity_check_inode(), when disk layout fields has not
+	 * been synchronized to inmem fields.
+	 */
+	return (S_ISREG(inode->i_mode) &&
+		(file_is_encrypt(inode) || file_is_verity(inode) ||
+		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
 }
 
 bool f2fs_may_inline_dentry(struct inode *inode)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2fce8fa0dac8..938961a9084e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_has_inline_data(inode) &&
-			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
+	if (f2fs_sanity_check_inline_data(inode)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

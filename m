Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145F47190E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 08:20:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwJ9a-0005IQ-Ff; Sun, 12 Dec 2021 07:20:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwJ9P-0005IG-G1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 07:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TWt3+Oo5U8Lx0wpcLRjL9SQcsJxf889NuxGJwpyiP7o=; b=F4MzMEQpdlsaeuKHhopb6lmUWg
 x+Qk2Ghlk49WSzhu39NTm74qXUy3AlouXGUJPeJAfX2hKYfP+k9s2yKFBi5Kt/V2leKpnlUb7BjMQ
 jpfafQ2bAHwSiHaWLDMl5bRp36XcCusswZwuctF/F8zKBjkP2g6vIFc/CFGnuagUL2Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TWt3+Oo5U8Lx0wpcLRjL9SQcsJxf889NuxGJwpyiP7o=; b=K
 zfC32rdPKjhtpi4c7rfZRBmT3br4vECIsQS67FFAyzzitpgZzFEQvS/tmQvpFnt2unF0hGyxrjacC
 GUnslHfuKVbBNmQkweTpXIPSEPUP2mrAEBhQCPXknpKByVMk3+TMEBNhoJF2lGLL6oaI5WfcmNyg1
 JUSpAJbxi6Z8A8Es=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwJ9N-00CprW-2N
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 07:20:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFC8AB80B8C;
 Sun, 12 Dec 2021 07:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1672C341C5;
 Sun, 12 Dec 2021 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639293585;
 bh=V7kAbXSXwi5srCFHvF2h3hII0OQYzFVrVzd3HQ9ktxY=;
 h=From:To:Cc:Subject:Date:From;
 b=iI8nDt5GYykrysW/GdFHG3hx1CVg4d+kuuVLfvuQdm0YqfP9SHP+VBS1NLDy++3Zc
 4xolRWkWsTKgXJpKAFyrCBcIVTlbB3wlSrV9nOGFRT6RO72BG3GEN+PmktINnYxnyl
 MrvNicmY/HCbmguUn8w4Re9LSSyEMZTjEt9xoHY9d4ZWhK+L4sIvH5VQ+yFrHRnXWV
 QoAPDuUBohWOGV8B6+adPhoCIwryOVnOughaSi6z/n4xsfIjZvVxyLz3pL7XUDZPML
 HUXY9hk+1K+05TyadaC1wArBC7q9XguJAgipTAYVlzP5iMmF/7q3RFccVy3432Mlr1
 phfQVZH6Jpnvw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 12 Dec 2021 15:19:23 +0800
Message-Id: <20211212071923.2398-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Wenqing Liu reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215235
 - Overview page fault in f2fs_setxattr() when mount and operate on corrupted
 image Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwJ9N-00CprW-2N
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check on last xattr
 entry in __f2fs_setxattr()
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
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Wenqing Liu reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215235

- Overview
page fault in f2fs_setxattr() when mount and operate on corrupted image

- Reproduce
tested on kernel 5.16-rc3, 5.15.X under root

1. unzip tmp7.zip
2. ./single.sh f2fs 7

Sometimes need to run the script several times

- Kernel dump
loop0: detected capacity change from 0 to 131072
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 7548c2ee
BUG: unable to handle page fault for address: ffffe47bc7123f48
RIP: 0010:kfree+0x66/0x320
Call Trace:
 __f2fs_setxattr+0x2aa/0xc00 [f2fs]
 f2fs_setxattr+0xfa/0x480 [f2fs]
 __f2fs_set_acl+0x19b/0x330 [f2fs]
 __vfs_removexattr+0x52/0x70
 __vfs_removexattr_locked+0xb1/0x140
 vfs_removexattr+0x56/0x100
 removexattr+0x57/0x80
 path_removexattr+0xa3/0xc0
 __x64_sys_removexattr+0x17/0x20
 do_syscall_64+0x37/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The root cause is in __f2fs_setxattr(), we missed to do sanity check on
last xattr entry, result in out-of-bound memory access during updating
inconsistent xattr data of target inode.

After the fix, it can detect such xattr inconsistency as below:

F2FS-fs (loop11): inode (7) has invalid last xattr entry, entry_size: 60676
F2FS-fs (loop11): inode (8) has corrupted xattr
F2FS-fs (loop11): inode (8) has corrupted xattr
F2FS-fs (loop11): inode (8) has invalid last xattr entry, entry_size: 47736

Cc: stable@vger.kernel.org
Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix compile warning:
format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
 fs/f2fs/xattr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index e348f33bcb2b..796a55c14d69 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -684,8 +684,17 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	}
 
 	last = here;
-	while (!IS_XATTR_LAST_ENTRY(last))
+	while (!IS_XATTR_LAST_ENTRY(last)) {
+		if ((void *)(last) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(last) > last_base_addr) {
+			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has invalid last xattr entry, entry_size: %u",
+					inode->i_ino, ENTRY_SIZE(last));
+			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+			error = -EFSCORRUPTED;
+			goto exit;
+		}
 		last = XATTR_NEXT_ENTRY(last);
+	}
 
 	newsize = XATTR_ALIGN(sizeof(struct f2fs_xattr_entry) + len + size);
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

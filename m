Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE11515D74
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 15:20:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkn1J-0004eX-25; Sat, 30 Apr 2022 13:20:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nkn1H-0004eN-FQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 13:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1dcmy6rERMsu7OKSMKekZ+hYSyIF/xfBnnoQngD1taM=; b=lPSRAPa4XKcvS1v1AA+9NEulVs
 B2kwI845lWFEN6yd5G0me0M+117WrHCPACbVNf3LOAyBw/GAww+t60ONWzGDPUblm7jKcdy2OlHBx
 L0Nv0kjhTGh9+WroAVHAtQbJcxUGprW0E0Rtdend0ehlYR3a5gFKSEVIxsCxpiwcNscA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1dcmy6rERMsu7OKSMKekZ+hYSyIF/xfBnnoQngD1taM=; b=M
 161oj6w7t1LN+8jNlt9yLp1cLBOKH9T0IQqPXgaGpnqO7fCD/2/P24wEhHb/89ZGyhkbGkR9AD+55
 0YOp5qcpRGVFcV9v15BgUFePT+JIZzisf0Bwd08T3VbR/xDA9QLNA5ttnyGGaRhgVca68o09YlYro
 GTma9okL/QiKPAmU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkn1A-00EsD8-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 13:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D910CB82B71;
 Sat, 30 Apr 2022 13:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A47AC385AA;
 Sat, 30 Apr 2022 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651324804;
 bh=2bW4XRxDo/i043/+6bLD3Znmhyws4zpnzO2sCxB8iVQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SRjSBFTBQ63LLRy4sAt0JbBplYktN00OuAXZi11yBuRoO3+L7cHXJQph96aL+kcCk
 wVSQ+DjHfTSlluniONQj9vMIR/QCdh6fi8rTLjGURKoZoH5l32PxI7lx2mDI9DirGp
 5N40WzcNhEjcvuYfVH/qEHMyf82JThBDFceOH/PcFwEeInHVrSOQZ6ONOO9ZVf9TZk
 X7ptYFgBn875tTyo3bY7D7TW3gViar0EYbSLFOKYRA7M73TJGoOb3M8D9DJu+hKs1X
 bnNo9Iq6QE9lEe/uZ2/LKD85xfdaixcS4SVefxeWcS86HcWqvylNiP+Xq9MWlsI6uY
 RQp8SDwCW9v9g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 30 Apr 2022 21:19:24 +0800
Message-Id: <20220430131924.10218-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Yanming reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215904
 The kernel message is shown below: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkn1A-00EsD8-Cq
Subject: [f2fs-dev] [PATCH] f2fs: fix to clear dirty inode in
 f2fs_evict_inode()
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

https://bugzilla.kernel.org/show_bug.cgi?id=215904

The kernel message is shown below:

kernel BUG at fs/f2fs/inode.c:825!
Call Trace:
 evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 shrink_dentry_list+0x17c/0x4f0
 shrink_dcache_parent+0x143/0x1e0
 do_one_tree+0x9/0x30
 shrink_dcache_for_umount+0x51/0x120
 generic_shutdown_super+0x5c/0x3a0
 kill_block_super+0x90/0xd0
 kill_f2fs_super+0x225/0x310
 deactivate_locked_super+0x78/0xc0
 cleanup_mnt+0x2b7/0x480
 task_work_run+0xc8/0x150
 exit_to_user_mode_prepare+0x14a/0x150
 syscall_exit_to_user_mode+0x1d/0x40
 do_syscall_64+0x48/0x90

The root cause is: inode node and dnode node share the same nid,
so during f2fs_evict_inode(), dnode node truncation will invalidate
its NAT entry, so when truncating inode node, it fails due to
invalid NAT entry, result in inode is still marked as dirty, fix
this issue by clearing dirty for inode and setting SBI_NEED_FSCK
flag in filesystem.

output from dump.f2fs:
[print_node_info: 354] Node ID [0xf:15] is inode
i_nid[0]                      		[0x       f : 15]

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/inode.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 234b8ed02644..030474b842ce 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -795,8 +795,22 @@ void f2fs_evict_inode(struct inode *inode)
 		f2fs_lock_op(sbi);
 		err = f2fs_remove_inode_page(inode);
 		f2fs_unlock_op(sbi);
-		if (err == -ENOENT)
+		if (err == -ENOENT) {
 			err = 0;
+
+			/*
+			 * in fuzzed image, another node may has the same
+			 * block address as inode's, if it was truncated
+			 * previously, truncation of inode node will fail.
+			 */
+			if (is_inode_flag_set(inode, FI_DIRTY_INODE)) {
+				f2fs_warn(F2FS_I_SB(inode),
+					"f2fs_evict_inode: inconsistent node id, ino:%lu",
+					inode->i_ino);
+				f2fs_inode_synced(inode);
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
+			}
+		}
 	}
 
 	/* give more chances, if ENOMEM case */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

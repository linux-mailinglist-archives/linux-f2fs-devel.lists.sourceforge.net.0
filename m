Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B7B511A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Sep 2025 10:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FL8y99VeD+iHRFKTjqP9QMNMnWTlPIA67cNiOGOwpgc=; b=IpuMGWmtdZcD26KA1YdCnIXfve
	90eTR7d+XEQLsyTCIfGh+fvBQq7almHHHimmfitt2yCk0mnmyuH0ttKEvLdEbnJUaRfcpbqdY0+ux
	pjObdSeBhT41DKtwNBF6LKTFlKSNfSw44sx02sr0QhnsjAiPQTkT/62SnLb6v846QDl0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwGNg-0007g4-GL;
	Wed, 10 Sep 2025 08:40:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwGNe-0007fy-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 08:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAfW8GgjApNvy9TjGR8PDI7BWpA7zopMpXtxvk9GSAE=; b=EPOetUkiKwuaNQ00xaoGhmoHMO
 V1nijthk2Bo4AAPe2ESQbuXYts2/FMLq13WxU037zswklDJhihsNYl7+f6GXRHq49FS4trrqg09mH
 /Zz75YUchNfEPU58A1Gyttvtk3HttF9hVRThZwrWRjcaheQtPio1IMXUVG9F+mmPglTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eAfW8GgjApNvy9TjGR8PDI7BWpA7zopMpXtxvk9GSAE=; b=K
 Zbdm357Mrxn0mu4k4KE6+5DgO7Y+WT4+7I9XeWbjwB/UeU0auOjwajXom+GbTAvjStlQ1IUCQMWX/
 YLT5kzwUcxyQQzfAcNwPVcRjxka+twqvfQxYrboEw9mVtdWT0FVsTAoII1z2+5JT5XNueUZpCIYFi
 ujld9CZN2oO1p5g0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwGNf-0000N7-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 08:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 999E940B44;
 Wed, 10 Sep 2025 08:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592A3C4CEFA;
 Wed, 10 Sep 2025 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757493632;
 bh=GPDaP11QrembyBGG0diAjU9KLEUd1GQl7AIT0DvpbQE=;
 h=From:To:Cc:Subject:Date:From;
 b=kQdZ+NyVUhBogJAYXdPGo+VWUjQne8Ir5gG8JfDRnff6xNlkjbxgoKDIEDVa8WAI4
 e//oUTN/W437niexorIoyMa2Ykp/WY8GLo/+EIxCSKiEGzOXCdb8GgCtOMVt+YnD+5
 UCHzHpohkAmRh4WlYJi79lcWRTNaJa5lTgx2YCwJwKWm6tNfIfIU1JaVSoT8QnQWYl
 ADgPo1jlMPV5cVN0QWJ4netH4SCigWg9JyCUzPifTGgqwvg7s32WuAFo9DezFPuZKb
 2KJS77qTxECcsvF/QASe0E7/ddNgx4/i25TvKnqS6mYa1L6YNs3NhHvlBSGEvWeOBI
 i2jJKax5CjDGQ==
To: jaegeuk@kernel.org
Date: Wed, 10 Sep 2025 16:40:24 +0800
Message-ID: <20250910084024.1722790-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a bug as below: loop0: detected capacity
 change
 from 0 to 40427 F2FS-fs (loop0): Wrong SSA boundary, start(3584) end(4096)
 blocks(3072) F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th
 superblock F2FS-fs (loo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwGNf-0000N7-1Q
Subject: [f2fs-dev] [PATCH] f2fs: fix to truncate first page in error path
 of f2fs_truncate()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a bug as below:

loop0: detected capacity change from 0 to 40427
F2FS-fs (loop0): Wrong SSA boundary, start(3584) end(4096) blocks(3072)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): f2fs_convert_inline_folio: corrupted inline inode ino=3, i_addr[0]:0x1601, run fsck to fix.
------------[ cut here ]------------
kernel BUG at fs/inode.c:753!
RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
Call Trace:
 <TASK>
 evict+0x504/0x9c0 fs/inode.c:810
 f2fs_fill_super+0x5612/0x6fa0 fs/f2fs/super.c:5047
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1815
 do_new_mount+0x2a2/0x9e0 fs/namespace.c:3808
 do_mount fs/namespace.c:4136 [inline]
 __do_sys_mount fs/namespace.c:4347 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4324
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

During f2fs_evict_inode(), clear_inode() detects that we missed to truncate
all page cache before destorying inode, that is because in below path, we
will create page #0 in cache, but missed to drop it in error path, let's fix
it.

- evict
 - f2fs_evict_inode
  - f2fs_truncate
   - f2fs_convert_inline_inode
    - f2fs_grab_cache_folio
    : create page #0 in cache
    - f2fs_convert_inline_folio
    : sanity check failed, return -EFSCORRUPTED
  - clear_inode detects that inode->i_data.nrpages is not zero

Fixes: 92dffd01790a ("f2fs: convert inline_data when i_size becomes large")
Reported-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68c09802.050a0220.3c6139.000e.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 42faaed6a02d..1aae4361d0a8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -904,8 +904,16 @@ int f2fs_truncate(struct inode *inode)
 	/* we should check inline_data size */
 	if (!f2fs_may_inline_data(inode)) {
 		err = f2fs_convert_inline_inode(inode);
-		if (err)
+		if (err) {
+			/*
+			 * Always truncate page #0 to avoid page cache
+			 * leak in evict() path.
+			 */
+			truncate_inode_pages_range(inode->i_mapping,
+					F2FS_BLK_TO_BYTES(0),
+					F2FS_BLK_END_BYTES(0));
 			return err;
+		}
 	}
 
 	err = f2fs_truncate_blocks(inode, i_size_read(inode), true);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22DBC835D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 11:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0ZPyCFrrpr4AQo+MS5bm6FHEelK27MKuN3wnfYF4YY=; b=LvZOb5K4N8Lht9khl2NElBy+ug
	+DLZCJD8MG2YhE+Ng+950YILFf9InmwFhF9d3vye2shl3FaNvjxkLA2cybKRXpkxaYv1XgtN2Pja+
	MSsfClDPVzQ06JFq8nkl0Ze4U5dBPeLw0vr9WGGNCpHpkB1F4ec4Q5dTRYBODcDbNFQs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6mfI-0006UJ-94;
	Thu, 09 Oct 2025 09:10:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6mfH-0006U7-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VQhcw0ydQ0pW6s+crKm9/vjcyk+PtD6VXiNHwnCXat0=; b=WiCOQksrJk/gvWilcrCjwlXN7c
 RUrJgUDRbCIWrE31F1/+tXDsX40l4ct1Hk8d7gvWzFUZ9lpL+UH2D4ArjznKGuEsr9Fxi4vqwbunb
 xry7VMS3Xz4mX8weHjnBnngIy0sAQEhbQB/ZZ4zr0CnB6K7a94qSIivXODKIqPAQYTSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VQhcw0ydQ0pW6s+crKm9/vjcyk+PtD6VXiNHwnCXat0=; b=Z
 NL7BJd0fTXWRoIiQRFGdSotGLE1AX9lwfyPSv6g08XKUIoUKjZbqQCJgArXPQHaHnwtoX68YkldHM
 NQVdK2zuXmCLHHLlm0cXfDNfWOVLe8ObkO7UctXn4mqVFcfOYBEdcgaXDHAaj/LeM54CjOLHkMXoA
 4+YzC3df2PF9aLhE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6mfH-0006KI-He for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EAD245090;
 Thu,  9 Oct 2025 09:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A42C4CEF9;
 Thu,  9 Oct 2025 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760001018;
 bh=cQmyOA1kdsDXT6q0amBPUls1NNiXk6QdOgjeKYuRvB0=;
 h=From:To:Cc:Subject:Date:From;
 b=D/JRXv8I6v9O04pRy64kW+PaTp1lVj8R3x4mwsrA7lzrzjEDHfjUjhwSuSoUBMKiM
 z9KgsCvzwbJ/CoWpN6fDcrF0DaUPwwdO2+F9v+NTolaj6t5mNuL4v2l6gv94w8rFuc
 cefaoPU4J16ywJ3VWWoN29V9awNcsoB8GudrUKemKbNjCBg1zqjZj7IISbEes85hiI
 B3hhOBeshcMMaV87IjAsy0Hx3KTq8XJdm/+Y0KnREFgmMrIrRCDPrfxJiZTNozeM45
 nWjXQnECJ0xk8EAS/LYT8ZZow6M/Lul5fXD9gv634wI9lX4NxywfqCxtEv/I6C6sIE
 Ov9Ipq7CH9q0w==
To: jaegeuk@kernel.org
Date: Thu,  9 Oct 2025 16:52:30 +0800
Message-Id: <20251009085230.17146-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As syzbot reported: F2FS-fs (loop0):
 __update_extent_tree_range:
 extent len is zero, type: 0, extent [0, 0, 0], age [0, 0] [ cut here ] kernel
 BUG at fs/f2fs/extent_cache.c:678! Oops: invalid opco [...] 
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
X-Headers-End: 1v6mfH-0006KI-He
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid updating zero-sized extent in
 extent cache
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+24124df3170c3638b35f@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As syzbot reported:

F2FS-fs (loop0): __update_extent_tree_range: extent len is zero, type: 0, extent [0, 0, 0], age [0, 0]
------------[ cut here ]------------
kernel BUG at fs/f2fs/extent_cache.c:678!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__update_extent_tree_range+0x13bc/0x1500 fs/f2fs/extent_cache.c:678
Call Trace:
 <TASK>
 f2fs_update_read_extent_cache_range+0x192/0x3e0 fs/f2fs/extent_cache.c:1085
 f2fs_do_zero_range fs/f2fs/file.c:1657 [inline]
 f2fs_zero_range+0x10c1/0x1580 fs/f2fs/file.c:1737
 f2fs_fallocate+0x583/0x990 fs/f2fs/file.c:2030
 vfs_fallocate+0x669/0x7e0 fs/open.c:342
 ioctl_preallocate fs/ioctl.c:289 [inline]
 file_ioctl+0x611/0x780 fs/ioctl.c:-1
 do_vfs_ioctl+0xb33/0x1430 fs/ioctl.c:576
 __do_sys_ioctl fs/ioctl.c:595 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f07bc58eec9

In error path of f2fs_zero_range(), it may add a zero-sized extent
into extent cache, it should be avoided.

Fixes: 6e9619499f53 ("f2fs: support in batch fzero in dnode page")
Reported-by: syzbot+24124df3170c3638b35f@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68e5d698.050a0220.256323.0032.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ffa045b39c01..c045e38e60ee 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1654,8 +1654,11 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		f2fs_set_data_blkaddr(dn, NEW_ADDR);
 	}
 
-	f2fs_update_read_extent_cache_range(dn, start, 0, index - start);
-	f2fs_update_age_extent_cache_range(dn, start, index - start);
+	if (index > start) {
+		f2fs_update_read_extent_cache_range(dn, start, 0,
+							index - start);
+		f2fs_update_age_extent_cache_range(dn, start, index - start);
+	}
 
 	return ret;
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

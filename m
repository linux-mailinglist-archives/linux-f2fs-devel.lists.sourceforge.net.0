Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D1299DC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 01:10:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXCYu-0002m4-GQ; Tue, 27 Oct 2020 00:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCYs-0002lo-OR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 00:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yd8cgkiQSKkoJsNpitBXt5b8SUSmrbFH1vZRJinFYw4=; b=fWQ8oJZdPpgMsM61nWrDPP0j9a
 nxdfosdy6daGMLImOBfa4mTpHvy/mcbQYpQikuUVDbO/I+wrhp8gT63fH36Gn9PDXB56ufgHe7Lu1
 9cUenVn4Plb7xr+clHHgQ5yNojtwvgLKWrBx+fBVsB5TbExx65umebSqO+7FMwatAsQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yd8cgkiQSKkoJsNpitBXt5b8SUSmrbFH1vZRJinFYw4=; b=g093Hg6Sjn63sFNcrlI3xop69M
 wUrQ09dne9xIeNFlz4Z6P20d+7488tT8AmB2TWg9FwHE20ehAgLnIhuX5WipLgQAeGH+NREseqkWY
 CThlISR+lWt5vH78YfZzoEWclbTE2oIKWJhycj7jWoxk25IJHRKtLTi30jsMNJ6X3BXA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCYo-008D82-Fm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 00:10:02 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F7A520791;
 Tue, 27 Oct 2020 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757393;
 bh=0X0tnhoKdddmHP3JfuD4JDjMsDmBV8ucPvpSa+0Vu4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDNtOSQH84XVNYbtCnmGMz7LUYb/pDiZlW24HptTjxnNbJN2NBBmEBA7b+P90/aqp
 2cagpV49XvMxroXW8xGoWGTLygAOlqzODXvF340xaITf8PW5/Fw8ewSGca9p1LhkfN
 bVM1dJF1Tva3Xcvwob2nl4FlAvviVu7R7OiqlLvQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 20:09:04 -0400
Message-Id: <20201027000946.1026923-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000946.1026923-1-sashal@kernel.org>
References: <20201027000946.1026923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kXCYo-008D82-Fm
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 05/46] f2fs: fix to check segment
 boundary during SIT page readahead
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 syzbot+3698081bcf0bb2d12174@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 6a257471fa42c8c9c04a875cd3a2a22db148e0f0 ]

As syzbot reported:

kernel BUG at fs/f2fs/segment.h:657!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 16220 Comm: syz-executor.0 Not tainted 5.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:f2fs_ra_meta_pages+0xa51/0xdc0 fs/f2fs/segment.h:657
Call Trace:
 build_sit_entries fs/f2fs/segment.c:4195 [inline]
 f2fs_build_segment_manager+0x4b8a/0xa3c0 fs/f2fs/segment.c:4779
 f2fs_fill_super+0x377d/0x6b80 fs/f2fs/super.c:3633
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x2070 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

@blkno in f2fs_ra_meta_pages could exceed max segment count, causing panic
in following sanity check in current_sit_addr(), add check condition to
avoid this issue.

Reported-by: syzbot+3698081bcf0bb2d12174@syzkaller.appspotmail.com
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index eab37a7dca5f5..0f2286e57907c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -202,6 +202,8 @@ int ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 					blkno * NAT_ENTRY_PER_BLOCK);
 			break;
 		case META_SIT:
+			if (unlikely(blkno >= TOTAL_SEGS(sbi)))
+				goto out;
 			/* get sit block addr */
 			fio.new_blkaddr = current_sit_addr(sbi,
 					blkno * SIT_ENTRY_PER_BLOCK);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

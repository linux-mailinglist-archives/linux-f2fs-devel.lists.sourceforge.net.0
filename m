Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A497268D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 03:16:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snpUm-0004Tr-8p;
	Tue, 10 Sep 2024 01:16:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snpUk-0004Tl-8O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 01:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHbfU9v8HvpKvvgNdcrXIc1MgU6iLnvFNMXQW9bs1yE=; b=Y+LMI5WTKogh7VEBtJGrSY/UjZ
 U4XbcB9GOgBsO/pKC1w9aYx4ud5AczCq7mNQmx/ZnRp583vZ/oZenrIfTILYacK6PU99PDKfjVsFH
 REG0QkPHGeLFEFnzNRggp+1ldHmbPCZGU/aFMhf5nnBfdsH6pmWYTTRejKIQ5HvNtC3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dHbfU9v8HvpKvvgNdcrXIc1MgU6iLnvFNMXQW9bs1yE=; b=i
 RymRt9zRqTfToW8ifQA76jeWCCKEKefauBUsc/7eWl/LZhgACHNLdwsWIIY+aWpaK/dMwfg9LX+77
 AVFrxHh0ShAb0PlPA9F2HCnV7TVR0N2TnYwyKzR5aSssS2t+Y9rvBWHrStK4CWDy4YWiov5OIgV6j
 Mbjk2xJJY3zqr0kY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snpUj-0004Rs-JP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 01:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E09C5C032E;
 Tue, 10 Sep 2024 01:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDDCC4CEC5;
 Tue, 10 Sep 2024 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725930986;
 bh=MGe+BNv8B4iO9+CV0hsGc6mktkx0QtjV/qWP+6ZV+L8=;
 h=From:To:Cc:Subject:Date:From;
 b=XhlnPAa3MBcEKdNAPW9QT62dvF2zPiaV2D+9pOvA1ko9fwvJcglmLN97hhxZ2bB81
 kbfc4l+egYDTvfHb3dRryEHlFelVA1DR6xW5vC3ENnYdo6Wu6yysdPgGq+TzpQio+D
 2E8hwUPwUgUBR37tlQJqQ8A3Pi6Ldcdfau34jxRdj/PDJ/nAfJnlCZRvuUppjalLmC
 WLSWhSLZRkarrEHA/w7S3z6mV3FyDEYQitNljkNjTksWohPeGTh56YZ3yL1/Q33+j3
 Y6FCWisX4Xpo8CjE1/GL5Ipaiutg70Vuc/RMaP/V5EemOHDXzhae1i0SbE27PwrUO6
 RgV4MNlzES/ag==
To: jaegeuk@kernel.org
Date: Tue, 10 Sep 2024 09:16:19 +0800
Message-Id: <20240910011619.3582861-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs: fix to don't panic system for no free segment fault
 injection syzbot reports a f2fs bug as below: F2FS-fs (loop0): inject no free
 segment in get_new_segment of __allocate_new_segment+0x1ce/0x940
 fs/f2fs/segment.c:3167
 F2FS-fs (loop0): Stopped filesystem due to reason: 7 [ cut here ]--- [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snpUj-0004Rs-JP
Subject: [f2fs-dev] [PATCH] f2fs: fix to don't panic system for no free
 segment fault injection
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
Cc: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs: fix to don't panic system for no free segment fault injection

syzbot reports a f2fs bug as below:

F2FS-fs (loop0): inject no free segment in get_new_segment of __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
F2FS-fs (loop0): Stopped filesystem due to reason: 7
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2748!
CPU: 0 UID: 0 PID: 5109 Comm: syz-executor304 Not tainted 6.11.0-rc6-syzkaller-00363-g89f5e14d05b4 #0
RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836
Call Trace:
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3167
 f2fs_allocate_new_section fs/f2fs/segment.c:3181 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3195
 f2fs_expand_inode_data+0x5d6/0xbb0 fs/f2fs/file.c:1799
 f2fs_fallocate+0x448/0x960 fs/f2fs/file.c:1903
 vfs_fallocate+0x553/0x6c0 fs/open.c:334
 do_vfs_ioctl+0x2592/0x2e50 fs/ioctl.c:886
 __do_sys_ioctl fs/ioctl.c:905 [inline]
 __se_sys_ioctl+0x81/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0010:get_new_segment fs/f2fs/segment.c:2748 [inline]
RIP: 0010:new_curseg+0x1f61/0x1f70 fs/f2fs/segment.c:2836

The root cause is when we inject no free segment fault into f2fs,
we should not panic system, fix it.

Fixes: 8b10d3653735 ("f2fs: introduce FAULT_NO_SEGMENT")
Reported-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000f0ee5b0621ab694b@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 112d58d566d4..b7c1ca51ea32 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2730,6 +2730,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 								MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
 			ret = -ENOSPC;
+			f2fs_bug_on(sbi, 1);
 			goto out_unlock;
 		}
 	}
@@ -2740,6 +2741,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 							MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
 			ret = -ENOSPC;
+			f2fs_bug_on(sbi, 1);
 			goto out_unlock;
 		}
 	}
@@ -2781,10 +2783,8 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 out_unlock:
 	spin_unlock(&free_i->segmap_lock);
 
-	if (ret == -ENOSPC) {
+	if (ret == -ENOSPC)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
-		f2fs_bug_on(sbi, 1);
-	}
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

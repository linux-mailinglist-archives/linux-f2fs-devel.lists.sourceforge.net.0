Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C4A6EB19
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 09:07:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twzJh-0003dC-6g;
	Tue, 25 Mar 2025 08:07:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twzJd-0003bC-2p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dx4/Gw9Z9yuS8Oa+70nqcIA/zMbW0N+RxMx5oPZTCec=; b=JnWJFlqq44ah5SO54ZlajxMSCE
 F2LvmbgC5kJ+CvxyuoFKyXrkZf3O6SyY0B5TTvKm0fcYN9V4kk7SLkQqfL+S5q+CEIALsm1hGvk7p
 OZz5/7pnQKVcEHJnqBwbv8NrcFkACkh2ppxWf66zxXtHdy8/mAcWyh6Qb7RUE2QnKH74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dx4/Gw9Z9yuS8Oa+70nqcIA/zMbW0N+RxMx5oPZTCec=; b=G2NP0RONy7SEcVapM8mdXIi4/1
 BURTRr9SlfnvvZrQtmBk6FiD5ulb/TDehk340pWE/tsf0/bQCCVX6LHGJuvgH16UzciexpoSbR1WZ
 eJ//b3etVVL+Sf4/PqML9tfzrdbhPxNpxBsV1S4ffK94MpsrY83ufS6pXS5F0Yq829nc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twzJO-0000uC-US for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3BCBB6158D;
 Tue, 25 Mar 2025 08:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78C5C4CEEF;
 Tue, 25 Mar 2025 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742890017;
 bh=aK4cVtkeCzV7Vtkp8T5BWdByXypevspHRuz/pAuSwYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAiLQstlI4Sb3/grA+mB67yXAM8b7Hxv/qSQG0qoCFUffhSwOTqxkt2g2CSLj1lYa
 FTtgwSEcAGDuCxJrnjygWpLPM48jA026JD2TvzMK1Lv42ixb2B3c4p/BJc8swWRCIE
 0YRi3kCd8iHuyea8Xpf+NQc1nrFWKIim2iBXgnJ92kKjoc0kXjZvuIO0TFgB841qqH
 iubAJUIT5/6Ywj188fKtk3Yd4Z0Woz4AMEib11XiwuFv817j59pecV7lKl/YmTgFES
 X6pKXs1bwPhui1H3J0e3+8DljOElw4p+m9M4fIV466mpnLl9Klz6EfpMtaHgbTM3PV
 4WvDEcnqJj4dA==
To: jaegeuk@kernel.org
Date: Tue, 25 Mar 2025 16:06:46 +0800
Message-ID: <20250325080646.3291947-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250325080646.3291947-1-chao@kernel.org>
References: <20250325080646.3291947-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ below testcase, it will cause inconsistence in between
 SIT and SSA. create_null_blk 512 2 1024 1024 mkfs.f2fs -m /dev/nullb0 mount
 /dev/nullb0 /mnt/f2fs/ touch /mnt/f2fs/file f2fs_io pinfile set /mnt/f2fs/file
 fallocate -l 4GiB /mnt/f2fs/file 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twzJO-0000uC-US
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: zone: fix to avoid inconsistence in
 between SIT and SSA
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w/ below testcase, it will cause inconsistence in between SIT and SSA.

create_null_blk 512 2 1024 1024
mkfs.f2fs -m /dev/nullb0
mount /dev/nullb0 /mnt/f2fs/
touch /mnt/f2fs/file
f2fs_io pinfile set /mnt/f2fs/file
fallocate -l 4GiB /mnt/f2fs/file

F2FS-fs (nullb0): Inconsistent segment (0) type [1, 0] in SSA and SIT
CPU: 5 UID: 0 PID: 2398 Comm: fallocate Tainted: G           O       6.13.0-rc1 #84
Tainted: [O]=OOT_MODULE
Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Call Trace:
 <TASK>
 dump_stack_lvl+0xb3/0xd0
 dump_stack+0x14/0x20
 f2fs_handle_critical_error+0x18c/0x220 [f2fs]
 f2fs_stop_checkpoint+0x38/0x50 [f2fs]
 do_garbage_collect+0x674/0x6e0 [f2fs]
 f2fs_gc_range+0x12b/0x230 [f2fs]
 f2fs_allocate_pinning_section+0x5c/0x150 [f2fs]
 f2fs_expand_inode_data+0x1cc/0x3c0 [f2fs]
 f2fs_fallocate+0x3c3/0x410 [f2fs]
 vfs_fallocate+0x15f/0x4b0
 __x64_sys_fallocate+0x4a/0x80
 x64_sys_call+0x15e8/0x1b80
 do_syscall_64+0x68/0x130
 entry_SYSCALL_64_after_hwframe+0x67/0x6f
RIP: 0033:0x7f9dba5197ca
F2FS-fs (nullb0): Stopped filesystem due to reason: 4

The reason is f2fs_gc_range() may try to migrate block in curseg, however,
its SSA block is not uptodate due to the last summary block data is still
in cache of curseg.

In this patch, we add a condition in f2fs_gc_range() to check whether
section is opened or not, and skip block migration for opened section.

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add rvb tag from Daeho
 fs/f2fs/gc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..8b5a55b72264 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2066,6 +2066,9 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
+		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+			continue;
+
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true, false);
 		put_gc_inode(&gc_list);
 
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

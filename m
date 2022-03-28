Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA344E9FDD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 21:42:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYvFz-0002bc-Iv; Mon, 28 Mar 2022 19:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1nYvFx-0002bW-No
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NT7tkGKKB0t0I3hduNbc8WfsfbsZQUUnpdwPy3RZ42U=; b=QROmyKrZLp9n32SO426T0g/EpY
 +q5Kt8oCeers495oDyNSkTV6S6EZXXcAksQ4CN46rc0UllA9Zu92USH2ij4cbLclRTTjhgU3XjM/G
 Fac1XtBh50FHwiW2p44p35HlNyLyN5qumAjoGmcadUcbLSIN6RsuawJxbM0gG490Uvmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NT7tkGKKB0t0I3hduNbc8WfsfbsZQUUnpdwPy3RZ42U=; b=ZHZaLPEa3YsIXGc1VOHYJDXCr7
 e7L/izOqA1X7tSIAlIkqC9RgPfs+3f8JRdnQaoOY3nIDI/9+gxW/WnARpF34ics5VEu2SnP9vOsPo
 UwBw7w8JikANmwjDLKVoH6zZV/FmQQhzE0uYWEFbRGuB7CQ6q8U4dkNxFT8Z9FYKW/nM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYvFr-0006rm-IL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25720612AE;
 Mon, 28 Mar 2022 19:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2582C3410F;
 Mon, 28 Mar 2022 19:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648496528;
 bh=cbFoD/cSl0Wwoo5hfS907/U1A0IK3iWQWOOCuvSG7/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SfqqIB4Ny8ZXGsErkUM6fDyFckH4bbQFbw6fAC9Gi9FZcy08L4KOu5Lgg9gAwiDOq
 ZN1ASV9qAxAIZsQ/Tu/AOd/4cQnQwQW/simrgx6G0abXD1M8DW+3s56exelwSgfSU/
 YH0W4xhGaWkvvIzyMzwl8d45eIBr8OmiC+F1pGFhfbpbimu6Nfm+ygM4ewUpRTH88V
 L5VT8oTQYKx3oHt2Q6oC15Mg1aT1JDb2SvrNbXtqSq+ZFLw+x8pMOaDe3hcz7fPKq8
 aDXX600Er3AJLTqfXwufTA4s+q14ww3E4WcmZyDnEtwpj3KMNvAUnRLbr87o9eA7PN
 sTALGoju9DpEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Mar 2022 15:41:43 -0400
Message-Id: <20220328194157.1585642-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328194157.1585642-1-sashal@kernel.org>
References: <20220328194157.1585642-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 f41ee8b91c00770d718be2ff4852a80017ae9ab3
 ] As Wenqing Liu reported in bugzilla: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYvFr-0006rm-IL
Subject: [f2fs-dev] [PATCH AUTOSEL 5.17 08/21] f2fs: fix to do sanity check
 on curseg->alloc_type
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
 yuchao0@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit f41ee8b91c00770d718be2ff4852a80017ae9ab3 ]

As Wenqing Liu reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215657

- Overview
UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c:3460:2 when mount and operate a corrupted image

- Reproduce
tested on kernel 5.17-rc4, 5.17-rc6

1. mkdir test_crash
2. cd test_crash
3. unzip tmp2.zip
4. mkdir mnt
5. ./single_test.sh f2fs 2

- Kernel dump
[   46.434454] loop0: detected capacity change from 0 to 131072
[   46.529839] F2FS-fs (loop0): Mounted with checkpoint version = 7548c2d9
[   46.738319] ================================================================================
[   46.738412] UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c:3460:2
[   46.738475] index 231 is out of range for type 'unsigned int [2]'
[   46.738539] CPU: 2 PID: 939 Comm: umount Not tainted 5.17.0-rc6 #1
[   46.738547] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.13.0-1ubuntu1.1 04/01/2014
[   46.738551] Call Trace:
[   46.738556]  <TASK>
[   46.738563]  dump_stack_lvl+0x47/0x5c
[   46.738581]  ubsan_epilogue+0x5/0x50
[   46.738592]  __ubsan_handle_out_of_bounds+0x68/0x80
[   46.738604]  f2fs_allocate_data_block+0xdff/0xe60 [f2fs]
[   46.738819]  do_write_page+0xef/0x210 [f2fs]
[   46.738934]  f2fs_do_write_node_page+0x3f/0x80 [f2fs]
[   46.739038]  __write_node_page+0x2b7/0x920 [f2fs]
[   46.739162]  f2fs_sync_node_pages+0x943/0xb00 [f2fs]
[   46.739293]  f2fs_write_checkpoint+0x7bb/0x1030 [f2fs]
[   46.739405]  kill_f2fs_super+0x125/0x150 [f2fs]
[   46.739507]  deactivate_locked_super+0x60/0xc0
[   46.739517]  deactivate_super+0x70/0xb0
[   46.739524]  cleanup_mnt+0x11a/0x200
[   46.739532]  __cleanup_mnt+0x16/0x20
[   46.739538]  task_work_run+0x67/0xa0
[   46.739547]  exit_to_user_mode_prepare+0x18c/0x1a0
[   46.739559]  syscall_exit_to_user_mode+0x26/0x40
[   46.739568]  do_syscall_64+0x46/0xb0
[   46.739584]  entry_SYSCALL_64_after_hwframe+0x44/0xae

The root cause is we missed to do sanity check on curseg->alloc_type,
result in out-of-bound accessing on sbi->block_count[] array, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1dabc8244083..416d802ebbea 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4789,6 +4789,13 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 
 		sanity_check_seg_type(sbi, curseg->seg_type);
 
+		if (curseg->alloc_type != LFS && curseg->alloc_type != SSR) {
+			f2fs_err(sbi,
+				 "Current segment has invalid alloc_type:%d",
+				 curseg->alloc_type);
+			return -EFSCORRUPTED;
+		}
+
 		if (f2fs_test_bit(blkofs, se->cur_valid_map))
 			goto out;
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

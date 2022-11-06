Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B018061E254
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Nov 2022 14:26:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1orff3-0000mt-3Q;
	Sun, 06 Nov 2022 13:26:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1orff1-0000mn-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TF5fOvwaHqjBMf11CHksUa5X2ie40Pz2fs8W7o1Plys=; b=C89iC4A2gzHep6cIADe4p6gHPj
 8K7J4ecg+NshnodmJCeJy0AZ6hPVlLj/aIhoGHUt6v4ds44DKxYyfmCORrIMiRSSmHX3kBRMxEgP0
 qBuZRHYEsrQLUP+8rek2lxowDOC4cLrsG3GT1DVxIc3Pjtv07Fr3LOlMRcwHqyRYlJqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TF5fOvwaHqjBMf11CHksUa5X2ie40Pz2fs8W7o1Plys=; b=M
 CJWanU0NPaplt/Zug0Mbn72ml1kHln7kTemYoeR0pAGStobGhGWlKoureidONgq+IdXKw+MG8u+7X
 fNHC4N0/JFl77g1RGHbhnsO9aliJS1BHUCRrlBZVY3rmOV+e+uOpcVkqxxuOK860UNgIcuKnvS82p
 EKxjRr1uWIFOkQXk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1orfex-0005Dk-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:26:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D10BAB80B35;
 Sun,  6 Nov 2022 13:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979B8C433D6;
 Sun,  6 Nov 2022 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667741151;
 bh=+MmMyt0H+pMj6g7aw1FjUfH2SUbgsnE3GDogLM3xQXY=;
 h=From:To:Cc:Subject:Date:From;
 b=ezNgUoNRf4t4jLZNYzqQ5Fhnq+2YZiNzluw4jutLlsyI8FWkJoFvVxG+1Mv20fhnt
 hY7bmHVZT3nZ49qVzZAqA/RKpqiu1h1Kl+XXOASHJrqfRpbdRHduayM44JG2YtWqvN
 +vwj2naQw2j1QtK72A91vVBtCTnS5tgyJllvF5wBedNS8oqHJqkGASmmZ1e9s4bl42
 yxXF4whjUyGIQiIISuPfSTAde4A5OOOQ/7FiRjLUlT5GIgh4g3I4J2xHdYo+JMewRA
 85OnEIMufK9LdyrIXNqnmjyxv+49PoPJt03kNpiNxomMYR3NxGym8Fw0uPCUqtdfVZ
 GM/PgmLx9EaFQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  6 Nov 2022 21:25:44 +0800
Message-Id: <20221106132544.134179-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a kernel bug: __dump_stack lib/dump_stack.c:88
 [inline] dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
 assign_lock_key+0x22a/0x240
 kernel/locking/lockdep.c:981 register_lock_class+0x287/0x9b0
 kernel/locking/lockd [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1orfex-0005Dk-Uq
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 spinlock
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
Cc: syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a kernel bug:

 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
 assign_lock_key+0x22a/0x240 kernel/locking/lockdep.c:981
 register_lock_class+0x287/0x9b0 kernel/locking/lockdep.c:1294
 __lock_acquire+0xe4/0x1f60 kernel/locking/lockdep.c:4934
 lock_acquire+0x1a7/0x400 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 f2fs_save_errors fs/f2fs/super.c:3868 [inline]
 f2fs_handle_error+0x29/0x230 fs/f2fs/super.c:3896
 f2fs_iget+0x215/0x4bb0 fs/f2fs/inode.c:516
 f2fs_fill_super+0x47d3/0x7b50 fs/f2fs/super.c:4222
 mount_bdev+0x26c/0x3a0 fs/super.c:1401
 legacy_get_tree+0xea/0x180 fs/fs_context.c:610
 vfs_get_tree+0x88/0x270 fs/super.c:1531
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2e3/0x3d0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

F2FS-fs (loop1): Failed to read F2FS meta data inode

The root cause is if sbi->error_lock may be accessed before
its initialization, fix it.

Link: https://lore.kernel.org/linux-f2fs-devel/0000000000007edb6605ecbb6442@google.com/T/#u
Reported-by: syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com
Fixes: 95fa90c9e5a7 ("f2fs: support recording errors into superblock")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fc800444f86..afa6f9155bed 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4205,6 +4205,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_bio_info;
 
+	spin_lock_init(&sbi->error_lock);
+	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
+
 	init_f2fs_rwsem(&sbi->cp_rwsem);
 	init_f2fs_rwsem(&sbi->quota_sem);
 	init_waitqueue_head(&sbi->cp_wait);
@@ -4272,9 +4275,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
-	spin_lock_init(&sbi->error_lock);
-	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
-
 	sbi->total_valid_node_count =
 				le32_to_cpu(sbi->ckpt->valid_node_count);
 	percpu_counter_set(&sbi->total_valid_inode_count,
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

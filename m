Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97C7942A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Sep 2023 20:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdws7-0006Gr-M4;
	Wed, 06 Sep 2023 18:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qduLY-00047g-ML
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 15:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kN6IeP/MiTBxZNbqK3N/03TjMBlBdpmsvy+ETX9yb/g=; b=E4ZuaXPnjpSPJnfGIQslZ1kyo3
 k5V5vPLJViRpWVn32pux7QGdD4KIo9ZXHKrtNk1VBSesc28hr4BXfHVDkYM/tpIvdPitYGKL5g49A
 yQGv7c7AG2p58LlZCqXHSA4+jdUrQcl1SiTEKVspg2kuFAv9Cs+zL+m/C7UM+t5Kyiqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kN6IeP/MiTBxZNbqK3N/03TjMBlBdpmsvy+ETX9yb/g=; b=P
 HwRxrcu6QtObAih6ZRhT3FGt8cMwzSoWp5ZKhKGT6rJttwpkw7Uzq+8SpzHcJjYXb9j890Zf/goVA
 VaflRMjK08MJe137s9M4BeKCIQYuKuA7LEUo0QFNAfUD2RtAVGIIfmvAaykecu+IFglDuBHV/yek2
 thlld8ydew17s8eY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qduLW-00BMwC-Mz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Sep 2023 15:21:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9F4A3CE16E9;
 Wed,  6 Sep 2023 15:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D132C433C7;
 Wed,  6 Sep 2023 15:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694013684;
 bh=M0wKTdttSbADfAJzI3iMp+6JG4zAwz1hMigpOg8NOd8=;
 h=From:To:Cc:Subject:Date:From;
 b=ImqbeTvcl1XoYws71WEIJW3sAkwiQ4Eg9L91uHCbbzdXXl0qIIk5JCYrAw9/g0tk9
 TsKLa7V3fH15vEWvCrv8VE3vV8qFZsRe9ySyKrvVZw9PL/adEPqfpgwbnxRIoDLXKf
 fPWYA+RMO4diF9YKGd8P0iYAdbkHKQmzu81kZnmvCq7fzMyL136b08qp+68hVDkLba
 KpKBWxL2E+E7gMpQRJjYXEHrUug8g0zpohpSiGLcw6gnLv1iulOQE7Otlm5EsHV5sW
 SQRSxyJREdNtfmn7Fiiwn+Vc+KUVpLW4q/ZlB+dsaTOuf1zp2TOuWaGM99moNKtDUY
 n+FMmmirN9hxg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  5 Sep 2023 12:57:53 +0800
Message-Id: <20230905045753.24964-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a kernel bug as below: F2FS-fs (loop1): detect
 filesystem reference count leak during umount, type: 10, count: 1 kernel
 BUG at fs/f2fs/super.c:1639! CPU: 0 PID: 15451 Comm: syz-executor.1 Not
 tainted 6.5.0-syzkaller-09338-g [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qduLW-00BMwC-Mz
Subject: [f2fs-dev] [PATCH] f2fs: fix to drop meta_inode's page cache in
 f2fs_put_super()
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
Cc: syzbot+ebd7072191e2eddd7d6e@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a kernel bug as below:

F2FS-fs (loop1): detect filesystem reference count leak during umount, type: 10, count: 1
kernel BUG at fs/f2fs/super.c:1639!
CPU: 0 PID: 15451 Comm: syz-executor.1 Not tainted 6.5.0-syzkaller-09338-ge0152e7481c6 #0
RIP: 0010:f2fs_put_super+0xce1/0xed0 fs/f2fs/super.c:1639
Call Trace:
 generic_shutdown_super+0x161/0x3c0 fs/super.c:693
 kill_block_super+0x3b/0x70 fs/super.c:1646
 kill_f2fs_super+0x2b7/0x3d0 fs/f2fs/super.c:4879
 deactivate_locked_super+0x9a/0x170 fs/super.c:481
 deactivate_super+0xde/0x100 fs/super.c:514
 cleanup_mnt+0x222/0x3d0 fs/namespace.c:1254
 task_work_run+0x14d/0x240 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x210/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x1d/0x60 kernel/entry/common.c:296
 do_syscall_64+0x44/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

In f2fs_put_super(), it tries to do sanity check on dirty and IO
reference count of f2fs, once there is any reference count leak,
it will trigger panic.

The root case is, during f2fs_put_super(), if there is any IO error
in f2fs_wait_on_all_pages(), we missed to truncate meta_inode's page
cache later, result in panic, fix this case.

Fixes: 20872584b8c0 ("f2fs: fix to drop all dirty meta/node pages during umount()")
Reported-by: syzbot+ebd7072191e2eddd7d6e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000a14f020604a62a98@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9ef9d5baece0..973184f267cb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1675,7 +1675,7 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 
-	if (err) {
+	if (err || f2fs_cp_error(sbi)) {
 		truncate_inode_pages_final(NODE_MAPPING(sbi));
 		truncate_inode_pages_final(META_MAPPING(sbi));
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

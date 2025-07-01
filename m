Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F80AEF33E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 11:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=utjP2OWPcP1sb1tPfBDNctkDYDH6zZH/7J/LTRk1Th0=; b=f5ChWCVGCKSqWJj+wvQIMd4EnX
	MoNFeGK+MkBWA+8LsTMBSbbdxP6UzKsLRY+wb/3ldW+AFovJM9rkB4/g0IrfWkRRN3V5df3IqFBw/
	1OARYwJd1Ofj2t59P46ekr3omRzVreIHDm3aP1RUtAaEr9mJAdsk8356AnWpX/M9pw0c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWXG5-0003D3-U3;
	Tue, 01 Jul 2025 09:26:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWXG2-0003Cx-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 09:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kk2yPMtnXD3Ql9+ApMYHewOzsYY16xWL+qm2lCYLF5I=; b=id7cIG8eTmTWicWDBVvJXYqbwn
 VmPMoNxnvsYJKX/yOKV8AKxch+11hrUx4gQLSMhab1kuB/x8dBBY4TTekw+yjqlw1oj9OrsEeaeos
 bBprE+xcuZGMxbq2EXMvKQUCt2B9DcCP6yQ+P4Z0HQ50FCRdMEJiTpW2iar3nxv7eOHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kk2yPMtnXD3Ql9+ApMYHewOzsYY16xWL+qm2lCYLF5I=; b=h
 CVlwW0y97v58/YP2Hr39o9kW7v67d7RA81iPoVWXn7BaZRwdard+z/8pbP8NQNy99JhotoGPwYrbr
 iOecuKbUtivKOksK5QCxi9YtYtEc1BJnszB5+3Ij2wLUxM+MUb2Y6Cf4X+K/Nafh8wcp+eNQctS1z
 f46FwZyeQPJXprAY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWXG1-0007gm-IY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 09:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E639EA52CE9;
 Tue,  1 Jul 2025 09:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3EDC4CEEE;
 Tue,  1 Jul 2025 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751361978;
 bh=Hv5oD2MchPa+sxKfOPqs/fhxZY2OH/uArq2h36gdvl4=;
 h=From:To:Cc:Subject:Date:From;
 b=la7ebupbPz7HaRXwt44Dr/c+fm1u/pZfXfSGQvCUMq1y5jCbO0LdmkqriaZiR9Un7
 b0xGtYwCTTUFGvxQJ9HxifPTSi3z2nXcIg4vNMb2BSOgYDZwzq9SY7jkgsdng5zj9t
 AUWpHXOtp4ilRzYP5n1RTgGH7yWsU18NlhqkMrUn0/1GN0t2UBJtJeGPLqL1tBha25
 zzOKmBCs6t+6C/QgH1xWUslmqIyrGstPRYyU0TNySxogMns3P/wSoy5RgGlk799L3h
 /b1Nt8qbjnH3GGwQYiAHt84q0yTLRSKj53TlafozsallWQeGNtMXF8/ZWxZrvEHpDa
 lOjaTPG6/RBjA==
To: jaegeuk@kernel.org
Date: Tue,  1 Jul 2025 17:26:10 +0800
Message-ID: <20250701092610.511964-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As syzbot reported as below: F2FS-fs (loop9): inject invalid
 blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10
 fs/f2fs/segment.c:3956
 [ cut here ] kernel BUG at fs/f2fs/segment.c:3957! Oops: in [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWXG1-0007gm-IY
Subject: [f2fs-dev] [PATCH] f2fs: fix to use f2fs_is_valid_blkaddr_raw() in
 do_write_page()
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
Cc: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As syzbot reported as below:

F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:3957!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full)
Call Trace:
 <TASK>
 f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
 f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
 do_writepages+0x32b/0x550 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 __filemap_fdatawrite mm/filemap.c:425 [inline]
 filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
 f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
 block_operations fs/f2fs/checkpoint.c:1247 [inline]
 f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
 kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

If we inject block address fault, it may trigger kernel panic, we need
to use f2fs_is_valid_blkaddr_raw() instead of f2fs_is_valid_blkaddr()
in do_write_page() to avoid such issue.

Fixes: 70b6e8500431 ("f2fs: do sanity check on fio.new_blkaddr in do_write_page()")
Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68639520.a70a0220.3b7e22.17e6.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5653716460ea..b89bdb867508 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3953,7 +3953,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		goto out;
 	}
 
-	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr(fio->sbi,
+	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr_raw(fio->sbi,
 				fio->new_blkaddr, DATA_GENERIC_ENHANCE));
 
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

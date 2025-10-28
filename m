Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5E2C16623
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 19:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKptRLb5mlZjeo8tIiZgM+E0tB06IdkrnlYo+2rRwRI=; b=gaEruWHb6VOI0/Gj+JaC1hYk7b
	wv6tIWqEkor29gdWpTfG1oG5wxK1qX+YbDZgz+zfpW2Vr2F8QnHmpK1+Gq7y2ORpEV+awri2mBSwX
	B//H+tVC2XLDyoja3Gz+OCly7iMQkrDu0n0f4ZrF7v7MjCpyjrj3we+VY1Bm0bx2IwMI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDo5O-00037m-Iv;
	Tue, 28 Oct 2025 18:06:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vDo5N-00037X-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 18:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4EAM0ln3dpGHbqCjHCkoLIlSZ6dHjEpCHTkA3O67qb4=; b=OcRMtrUS0f1jh7wDbHrkRPXdfH
 r2UpG5r1sUny32CzI/JBJWwOQ9++tJfyhBM0i7vDL3CusYrl6KLfMSdmepHTH9+DX8WXu3hhLEhv8
 cSvuHHTn0mUlg52uz1TGSs/1Wzb583xEMXiyB+o0gcrXlZEqKvfEqjm9gTnRLnMk5Erg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4EAM0ln3dpGHbqCjHCkoLIlSZ6dHjEpCHTkA3O67qb4=; b=JqX3VTwTPFk94eWJX70yspDHxP
 MkwzQ3OgAPOKfv7eMdGvabAqdC2jdpRC38bvbCmtvjjPoAq+EAMDVy2TG8XDeHJdq/O3aiOqG7RWj
 MWeaoR9qStWHUMPeqZoykyLvQxe/hZYX2g+4RvmtlX5z9zktjCYpD4OlAWYY+tgAtF1k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDo5N-0006LJ-El for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 18:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE662434C0;
 Tue, 28 Oct 2025 18:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E352C4CEE7;
 Tue, 28 Oct 2025 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761674775;
 bh=gqjXzQwjIIkD9IpQ+kDj6XXKiUnNxxmvMSC7CWvzBxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rxhjmmrw912PiJlxFLwH5DJOyDz3ys0GYWZNsprPyAAGeB6C0A92jzRmRn3O+pIbn
 lfyfD4q36CIfQmPEIcaGV/WfIy/5krYJlPQixHK3vKPJ59GF0JkeUWCS7RkLzTO2/O
 87BKSS6mdwGAJztEBwwqHfdddOmbRI2uTpupc70+7ykqadWARbBFJObIBvF3Pp7h8/
 /xBP8MDm21BzmsAqWwlJcAAnbFqKpcWSjugm0cADiu0WSJRfOCjtlcrdbJsSlVTLlf
 H5Vlk63FBktZPKW4yEPgjtfBeXOzi0JtMYnLc7DYHRgxIbZOjEcZ/qUdzUHUAiKL/2
 N/WBTxsg6WTJQ==
Date: Tue, 28 Oct 2025 18:06:13 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aQEGFWy7AmP2RcVM@google.com>
References: <20251006084615.2585252-1-jprusakowski@google.com>
 <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
 <aOkuA_Ffq2klE5g6@google.com>
 <ac1bcf67-cc5f-4288-a2f3-c4fb6013c38a@kernel.org>
 <aPEvpeM_cXWcxcZe@google.com>
 <b4a0af34-bd8b-4130-a96f-6aacbe0fb576@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4a0af34-bd8b-4130-a96f-6aacbe0fb576@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Testing this patch: Xfstests generic/335,
 generic/336 sometimes
 crash with the following message: F2FS-fs (dm-0): detect filesystem reference
 count leak during umount, type: 9,
 count: 1 [ cut here ] kernel BUG at fs/f2fs/super.c:1939!
 Oops: invalid opcode: 0000 [#1] SMP NOP [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDo5N-0006LJ-El
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure node page reads complete before
 f2fs_put_super() finishes
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Testing this patch:

Xfstests generic/335, generic/336 sometimes crash with the following message:

F2FS-fs (dm-0): detect filesystem reference count leak during umount, type: 9, count: 1
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1939!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 1 UID: 0 PID: 609351 Comm: umount Tainted: G        W           6.17.0-rc5-xfstests-g9dd1835ecda5 #1 PREEMPT(none)
Tainted: [W]=WARN
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:f2fs_put_super+0x3b3/0x3c0
Call Trace:
 <TASK>
 generic_shutdown_super+0x7e/0x190
 kill_block_super+0x1a/0x40
 kill_f2fs_super+0x9d/0x190
 deactivate_locked_super+0x30/0xb0
 cleanup_mnt+0xba/0x150
 task_work_run+0x5c/0xa0
 exit_to_user_mode_loop+0xb7/0xc0
 do_syscall_64+0x1ae/0x1c0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
 </TASK>
---[ end trace 0000000000000000 ]---

It appears that sometimes it is possible that f2fs_put_super() is called before
all node page reads are completed.
Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.

Fixes: 20872584b8c0b ("f2fs: fix to drop all dirty meta/node pages during umount()")
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bdb5ddb4f966..0b0ef8ba243b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1989,14 +1989,6 @@ static void f2fs_put_super(struct super_block *sb)
 		truncate_inode_pages_final(META_MAPPING(sbi));
 	}
 
-	for (i = 0; i < NR_COUNT_TYPE; i++) {
-		if (!get_pages(sbi, i))
-			continue;
-		f2fs_err(sbi, "detect filesystem reference count leak during "
-			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
-		f2fs_bug_on(sbi, 1);
-	}
-
 	f2fs_bug_on(sbi, sbi->fsync_node_num);
 
 	f2fs_destroy_compress_inode(sbi);
@@ -2007,6 +1999,15 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	/* Should check the page counts after dropping all node/meta pages */
+	for (i = 0; i < NR_COUNT_TYPE; i++) {
+		if (!get_pages(sbi, i))
+			continue;
+		f2fs_err(sbi, "detect filesystem reference count leak during "
+			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
+		f2fs_bug_on(sbi, 1);
+	}
+
 	/*
 	 * iput() can update stat information, if f2fs_write_checkpoint()
 	 * above failed with error.
-- 
2.51.1.851.g4ebd6896fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

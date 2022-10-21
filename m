Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A09606DD2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:34:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhrv-0003dx-Gb;
	Fri, 21 Oct 2022 02:34:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1olhru-0003dr-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1wgIypwdn9SOXs6g/3584fsvIMdmLVGb86gGiVc2lA=; b=ArIkYauhz6ENfLaGQ+xnUdysPV
 gxHrZoAS3BbmiKOLXUx+YnXou8DzVp1rczQRxQQQBSRQTRJX/zRVQMnqecL7wSF5xcbZ8cck+EE/m
 brh4N3Lh2ddIwB3dBM9ShZILVDM0UW4CMaiGVzIoizSF040tY7t+5XS9LEHD/02CopKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s1wgIypwdn9SOXs6g/3584fsvIMdmLVGb86gGiVc2lA=; b=c
 U6SukBuFxIUcZehvN/UTCkiUT/vOy11C0QjutZgBsibxy2BxgU7ufTqpNq3mUtrLJKH2cenv5rP4C
 AUGENt6Rb3bfvbpWR7x0a4eKDownVpAggqybtMjDvZOsCscjGtLmjM6lp1cHXEyv39b/OAVbZHk6X
 9z4XMDMSXnoPO3zs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olhrt-00BfXr-Ma for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:34:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7028CB8093B;
 Fri, 21 Oct 2022 02:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55601C4FEB9;
 Fri, 21 Oct 2022 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666319674;
 bh=580rqartSgXXhJapFprYMMcudTR1XAKCGjA2+wbw7n0=;
 h=From:To:Cc:Subject:Date:From;
 b=CGXMB7pFLUwX0p6r8P7m3dddcVf8gdsoPBzDzWG0l+lK/r7v4x/nEExifC6QyObmF
 zAnu7jChIwUvsGFqnK41++j/hSrhpfsACUVDVWOI5XTyro93r/zqZUjlfU1s4m77KO
 gjqVYYBnxYfTCKIBZUCE/XVIM2525JQpSVOA1RnXeJBniR5Xj0KbHz8Vuy+LYvHAdX
 SGWaZcMXu6qXTtPCJaHNDnckA3feuWCls0b6S4w9Tu0AZnsTXh9K9cqMPRFzCJAP19
 HqgLHGyUtF9/jcVtOSazyp3M7QQNBurKnP45rBSOglYk+si+KlBoB1PGRiSt20KUYK
 XTXirLrSraxZw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 21 Oct 2022 10:34:22 +0800
Message-Id: <20221021023422.3101585-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Syzbot reports a NULL pointer dereference issue as below:
 __refcount_add include/linux/refcount.h:193 [inline] __refcount_inc
 include/linux/refcount.h:250
 [inline] refcount_inc include/linux/refcount.h:267 [inline] get_task_struct
 include/linux/sched/task.h [...] 
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
X-Headers-End: 1olhrt-00BfXr-Ma
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to invalidate
 dcc->f2fs_issue_discard in error path
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
Cc: syzbot+729c925c2d9fc495ddee@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org,
 syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Syzbot reports a NULL pointer dereference issue as below:

 __refcount_add include/linux/refcount.h:193 [inline]
 __refcount_inc include/linux/refcount.h:250 [inline]
 refcount_inc include/linux/refcount.h:267 [inline]
 get_task_struct include/linux/sched/task.h:110 [inline]
 kthread_stop+0x34/0x1c0 kernel/kthread.c:703
 f2fs_stop_discard_thread+0x3c/0x5c fs/f2fs/segment.c:1638
 kill_f2fs_super+0x5c/0x194 fs/f2fs/super.c:4522
 deactivate_locked_super+0x70/0xe8 fs/super.c:332
 deactivate_super+0xd0/0xd4 fs/super.c:363
 cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
 task_work_run+0xc4/0x14c kernel/task_work.c:177
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x26c/0xbe0 kernel/exit.c:795
 do_group_exit+0x60/0xe8 kernel/exit.c:925
 __do_sys_exit_group kernel/exit.c:936 [inline]
 __se_sys_exit_group kernel/exit.c:934 [inline]
 __wake_up_parent+0x0/0x40 kernel/exit.c:934
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581

The root cause of this issue is in error path of f2fs_start_discard_thread(),
it missed to invalidate dcc->f2fs_issue_discard, later kthread_stop() may
access invalid pointer.

Fixes: 4d67490498ac ("f2fs: Don't create discard thread when device doesn't support realtime discard")
Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
Reported-by: syzbot+729c925c2d9fc495ddee@syzkaller.appspotmail.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add more commit message and Fixes and Reported-by tag.
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..7a4f7c88b8b9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2025,8 +2025,10 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 
 	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
 				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(dcc->f2fs_issue_discard))
+	if (IS_ERR(dcc->f2fs_issue_discard)) {
 		err = PTR_ERR(dcc->f2fs_issue_discard);
+		dcc->f2fs_issue_discard = NULL;
+	}
 
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

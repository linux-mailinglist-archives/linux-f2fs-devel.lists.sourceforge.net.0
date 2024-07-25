Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BF93BA85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 04:09:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWnui-00045E-2O;
	Thu, 25 Jul 2024 02:09:04 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWnug-00044x-Bw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j78lWJaske/MRAtR1l+m/jgGr+52FeDdmaH1GDPEDXY=; b=CuDy/LQYVkQiTjovaj1+M80Nw3
 5HlOL+uSi+T45+NeI2TUYgBFWnT58BreOf6nBfCf10U96Qyq4FPprOqIsD0nmsjyOkOw2+dL7UKFd
 MSxH7LR76zd8bUVLTGu/5pBzczJ602e1Q/E3Ns+v7ht6BjHIb6fPMPk2hzbv4jJQo0DY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j78lWJaske/MRAtR1l+m/jgGr+52FeDdmaH1GDPEDXY=; b=E
 LlJkTSJgiz+GcczZSle1ksKg2nDg2ma45q9mxc/kbP6uyfjXZaiBmB7w37IGHKhNOwJbqHP+KBGYP
 j4N+0Q9K7znaLn7E8A53OUlAidtPkPxwSoduA6SRVGiZlcOW1cN2cKU6tP8LSKihxyfMLoYYkGejE
 j7IBhoW7PDOh4S44=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWnuf-0000tF-Dt for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1434CE10CE;
 Thu, 25 Jul 2024 02:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B3DC32781;
 Thu, 25 Jul 2024 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721873329;
 bh=hZLfXkRQOcL/yljHe3PrGXlzhVc26RzCNlLV2gPi8CA=;
 h=From:To:Cc:Subject:Date:From;
 b=tBdWxGzL64Mr4pUx0gjhtN2hihht0CzcvZAbXYcmuyKIOmABqQtf8NHMmhsOBmEYL
 O57J+vcsbbHfCjehLl1Nlx4GY9YFY5IrwtSDbu9eVS16NCZqOlfmFDi5dXMD7lB8i5
 R8yfrC45eZ56RbhjuC+PT+EeYOqtc8KfUfu2mYFfKDeVUzzJ6hVAyKufcCvLlmCmmJ
 hborJvsHX1RGNDK3Bze+VLFLyLGEAkb3Q/0vU8kxXzqy5P1VCwAwN4Wdp0p+PgfpUJ
 3kusAWvIpvZJcHd2bxf5uKz3iwXg9+to6tMdzmJkf6PGDW6yERvYycazFnr/OwJR60
 b6ApY+wjJeB3w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 25 Jul 2024 10:08:41 +0800
Message-Id: <20240725020841.894814-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a f2fs bug as below: __dump_stack
 lib/dump_stack.c:88
 [inline] dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_report+0xe8/0x550
 mm/kasan/report.c:491 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_rang [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWnuf-0000tF-Dt
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free in
 f2fs_stop_gc_thread()
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
Cc: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_report+0xe8/0x550 mm/kasan/report.c:491
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
 __refcount_add include/linux/refcount.h:184 [inline]
 __refcount_inc include/linux/refcount.h:241 [inline]
 refcount_inc include/linux/refcount.h:258 [inline]
 get_task_struct include/linux/sched/task.h:118 [inline]
 kthread_stop+0xca/0x630 kernel/kthread.c:704
 f2fs_stop_gc_thread+0x65/0xb0 fs/f2fs/gc.c:210
 f2fs_do_shutdown+0x192/0x540 fs/f2fs/file.c:2283
 f2fs_ioc_shutdown fs/f2fs/file.c:2325 [inline]
 __f2fs_ioctl+0x443a/0xbe60 fs/f2fs/file.c:4325
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is below race condition, it may cause use-after-free
issue in sbi->gc_th pointer.

- remount
 - f2fs_remount
  - f2fs_stop_gc_thread
   - kfree(gc_th)
				- f2fs_ioc_shutdown
				 - f2fs_do_shutdown
				  - f2fs_stop_gc_thread
				   - kthread_stop(gc_th->f2fs_gc_task)

We will call f2fs_do_shutdown() in two paths:
- for f2fs_ioc_shutdown() path, we should grab sb->s_umount semaphore
for fixing.
- for f2fs_shutdown() path, it's safe since caller has already grabbed
sb->s_umount semaphore.

Reported-by: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/0000000000005c7ccb061e032b9b@google.com
Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7a37f2b393b9..62d72da25754 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2388,7 +2388,10 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		}
 	}
 
+	/* grab sb->s_umount to avoid racing w/ remount() */
+	down_read(&sbi->sb->s_umount);
 	ret = f2fs_do_shutdown(sbi, in, readonly);
+	up_read(&sbi->sb->s_umount);
 
 	if (need_drop)
 		mnt_drop_write_file(filp);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

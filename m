Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB1C962DEA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2024 18:54:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjLwS-0006PJ-Js;
	Wed, 28 Aug 2024 16:54:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sjLwR-0006P5-Ct
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 16:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maENbqQ9rupduUpvBioLzq6uP9AprJlBe/pp6XMiOLg=; b=ByagsyKG7XepZnRYx0AKZZB6KQ
 dogajyclrWA9s9lejkTiszUE0uzGuKm0aQhZROuquX8Byh2DGc9BjtKHD3MI+l9LNR9gVdV2Cqo6b
 bm6+UPH8pJI1n9+zLdu/1Vn4Tc100NnGKj4zq7TayGJ/fGPkYu2vbRZ2WTe5LDPhLtwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=maENbqQ9rupduUpvBioLzq6uP9AprJlBe/pp6XMiOLg=; b=N
 a1U8FvoctevDXs/xYNIE5ohaxnFlepXmT0AKtjUWcDZ5k7iNVQRdKfOPiIfptlP91drOCTHiPEtfc
 t6gaes+fN7wBf2seLHSsjANR3nz3j3zUXM5dr/HPhWL645NhPpeWjW8ET0eqQHmdvhY9nCzYMPL5O
 iXr/4AAUGrDqEJMk=;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjLwQ-0005c0-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 16:54:43 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-70942ebcc29so5952907a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Aug 2024 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724864071; x=1725468871; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=maENbqQ9rupduUpvBioLzq6uP9AprJlBe/pp6XMiOLg=;
 b=eRaENjQMxYqEvznbes35hnsETpUj4yfr60kTj8iiumnQ1CQ051RpWqnuOn1Ve3TIRI
 KsJObp7xHSKSuybNH+Dgi/0+O/xB+ucqHd+/ZXRBkoOodJ7gZLce48vS5jZzFgD/zqYB
 SsrtjCN/f3MOqAOO2sOB3H6SiDSEM1dl31gFRIlfMQ58EuPqH72gbRR52lGV5blsvi8W
 tT+U+y+nEfFHEX60NgoeTtr2Q6BjK0TfVAs7tu7XilPyWqrSbJZxKFMDv+eYn8QknYPc
 9UpDLil7I0JzGATTCVKU/E+fEnsx5uviF330KltZtpYZnRgKg56r7KZgOvZFx+TwSNtV
 Jz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724864071; x=1725468871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maENbqQ9rupduUpvBioLzq6uP9AprJlBe/pp6XMiOLg=;
 b=wx+6qfYUkZh+AZy/WVGRPflh6foaM0JNexScQPyNZ5NwHoRZjjGFznmP9dZcds4jn7
 ENw6sn+IqrOr634QX/6lpwFDTWKnMui+/w+huWKgoGb5GvWJV/c57zg0z43qqOFGyVcy
 88UeSWiPpsQU3ew9+W2Ostv26AsOHP9xDoUlprGwhBnAThjAo1OI9H2hrhKIvfzZ9pZe
 f0nnhl+CxT+XvKbXxTCx9vsyDWcuVHNHBGL3Sb+i/GnzWVNGiUELLqn7BQ+3EMTo8TTX
 UMneHnxjD6Y/9ij65snhzwO0g7nzKOunojq+pOR3vwQP2vdZM7U/uh6tjV7b3Woawo0l
 agxw==
X-Gm-Message-State: AOJu0YyHKHhZefKR8FZ+PjAvIMtAWwYMtFG0eebywcp26R+OJj+DgII+
 amklfGBkfG1ljhFKvPydCZgUiMgps39yafBEHty0wauBLTcHvTpPoIbCKp2m
X-Google-Smtp-Source: AGHT+IFPU7Ln1YrBKkH7iL2ZhVyIK8ZVoVejR9wWlVvhNApfL13xziziELWYh2mXT8bTRLDEroT3gg==
X-Received: by 2002:a05:6358:590a:b0:1aa:b8ba:8e with SMTP id
 e5c5f4694b2df-1b603cc8defmr47422855d.22.1724864071298; 
 Wed, 28 Aug 2024 09:54:31 -0700 (PDT)
Received: from localhost ([124.127.77.193]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ac9827bsm9808313a12.1.2024.08.28.09.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:54:30 -0700 (PDT)
From: Julian Sun <sunjunchao2870@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Aug 2024 00:54:25 +0800
Message-Id: <20240828165425.324845-1-sunjunchao2870@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, all. Recently syzbot reported a bug as following: kernel
 BUG at fs/f2fs/inode.c:896! CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605
 Not tainted 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0 RIP:
 0010:f2fs_evict_inode+0x1598/0x15c0
 fs/f2fs/inode.c:896 Ca [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.50 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.50 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sjLwQ-0005c0-Lz
Subject: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE flag
 when umounting a ro fs.
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
Cc: Julian Sun <sunjunchao2870@gmail.com>, jaegeuk@kernel.org,
 syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, all.

Recently syzbot reported a bug as following:

kernel BUG at fs/f2fs/inode.c:896!
CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Call Trace:
 <TASK>
 evict+0x532/0x950 fs/inode.c:704
 dispose_list fs/inode.c:747 [inline]
 evict_inodes+0x5f9/0x690 fs/inode.c:797
 generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1696
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x279/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The syzbot constructed the following scenario: concurrently
creating directories and setting the file system to read-only.
In this case, while f2fs was making dir, the filesystem switched to
readonly, and when it tried to clear the dirty flag, it triggered this
code path: f2fs_mkdir()-> f2fs_sync_fs()->f2fs_write_checkpoint()
->f2fs_readonly(). This resulted FI_DIRTY_INODE flag not being cleared,
which eventually led to a bug being triggered during the FI_DIRTY_INODE
check in f2fs_evict_inode().

In this case, we cannot do anything further, so if filesystem is readonly,
do not trigger the BUG. Instead, clean up resources to the best of our
ability to prevent triggering subsequent resource leak checks.

If there is anything important I'm missing, please let me know, thanks.

Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
Fixes: ca7d802a7d8e ("f2fs: detect dirty inode in evict_inode")
CC: stable@vger.kernel.org
Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
---
 fs/f2fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index aef57172014f..ebf825dba0a5 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -892,7 +892,8 @@ void f2fs_evict_inode(struct inode *inode)
 			atomic_read(&fi->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
-				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) &&
+				!f2fs_readonly(sbi->sb))
 		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
 	else
 		f2fs_inode_synced(inode);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

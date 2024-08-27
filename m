Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DE95FFEE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2024 05:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sin7O-0005tc-V3;
	Tue, 27 Aug 2024 03:43:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sin7J-0005tM-S7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 03:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hTaNDoHudMv3bzmqeleURjD4/FcotZDelM+rzdNVn6Q=; b=dmyf4FAmOoh+cZkT/hVTXEXSai
 P0BmX6O4lieZiDnND86+UsGkUUQo3CP0bRA7sEdAUD/izEq60BFtM4gWhi18iE7BhQpBMCQ6zGk5c
 6MoGWMjwwR7+qRztH30X9rB2YCYNJAIPjM/sO8fGRK5s2hzE+lkYaFrkiSwONST2TBh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hTaNDoHudMv3bzmqeleURjD4/FcotZDelM+rzdNVn6Q=; b=Oe5btCi+oDZxxcx9Dqc/5nbHlS
 cbV7FTicmNXXoktmoSAga/JWq/UQQJJFUqeUrEVUWBGAv35s0Dea25hRKVq/p6TlX8NZz/JRCIosM
 02QuIId839gZcXpWC/Ra9jZUFPeH29bVXu/Uw8Gm6NcmczDzhXF7J43JUZgda9DKmW14=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sin7I-0005Ih-GT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 03:43:37 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2d3d662631aso3890342a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724730211; x=1725335011; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTaNDoHudMv3bzmqeleURjD4/FcotZDelM+rzdNVn6Q=;
 b=YVfp0GpcQyigYXfjPDAbWY0pUi2QLUgX4Xosb7XpMpribCvPZPL4aJYvCaVMhC3LuR
 T3Ud9NiN0iiljkrLae60+OwIx7qqIq8o7F9zBBskuxw0HvQ4Tt6fZyAiOUvOmvmFnATo
 YTwApuGEJzzOpndkMLiw6AZy1vIoYsxsG1ro+wESPhbBn9XAQXIt5AO1phlAhKOPAuB0
 mwLHmpEUV3jK3177mqtPye0CM81jKj76IA4VhAcceipp4wPvdjPMmuwbX0HP1ErRxRH7
 1o7TqVLaPFRjXgvSVcmR0uyanVGI40tQXyTACjrdC/9+M7HwBZchI20VZ/VusNEI20Rt
 XDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724730211; x=1725335011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTaNDoHudMv3bzmqeleURjD4/FcotZDelM+rzdNVn6Q=;
 b=rUzp4ZoB+97tpUNVeq4px1ULtF2Jx9bS0eroB3xU/upOtEXdzqerr/LmdSndFKVz5O
 jCH/JEGkaKxLFNgsR8dgheghhMILE7zsh7ZyHXm1Gxpb71ZaHBwCo+/JBl4jgeY3svfm
 jFs4+Ml9CUj2Kcu6qbih1l2VmTg9sL2D3Rzu9PHhbYu0Q/xxM6RzsvPCNl7728pt6Ero
 oPMedT6ZFkQuYehxV7v4wUxBNkizWf4PXRGlPja136+XtKxiskCUlC13bEGp3peHMNy0
 qRNfti+O5P2G9MYFRuag1n+JZbggkNkdQzUrZwpkwAa53IcwoKdCwcnQW41PqZkj/kdY
 uzQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgQtcN1LKjU5apSgyJLDga3axqQR3pQX/BddC28k1TILOm7Ay3UwMmaWt860OlrJWCUV+dkMbNu6xNJrERHM6c@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxIisGXykrC5WrDBSCyFNqnNRr5PKJf74uMwOVImu2c0EmV5c9a
 9Qf6q69bR6sK3e8drNJxmW7FW282wmuY2kgedUXRn2YtSxFP9A9z
X-Google-Smtp-Source: AGHT+IEvnGKTv4Qjyeqw8RdfF5VIUg+jU6364AYs3SYNrNBJTvXwVoIbrOFLiA31uluktVcD83vvjg==
X-Received: by 2002:a17:90a:dd86:b0:2c9:84f9:a321 with SMTP id
 98e67ed59e1d1-2d646c26b9fmr12604597a91.23.1724730210560; 
 Mon, 26 Aug 2024 20:43:30 -0700 (PDT)
Received: from localhost ([123.113.110.156]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613af1884sm10676797a91.43.2024.08.26.20.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 20:43:29 -0700 (PDT)
From: Julian Sun <sunjunchao2870@gmail.com>
To: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
Date: Tue, 27 Aug 2024 11:43:24 +0800
Message-Id: <20240827034324.339129-1-sunjunchao2870@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <000000000000b0231406204772a1@google.com>
References: <000000000000b0231406204772a1@google.com>
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
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.51 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.216.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sin7I-0005Ih-GT
Subject: [f2fs-dev] [PATCH] f2fs: Do not check the FI_DIRTY_INODE flag when
 umounting a ro fs.
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
Cc: Julian Sun <sunjunchao2870@gmail.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
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
 fs/f2fs/inode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index aef57172014f..52d273383ec2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -892,8 +892,12 @@ void f2fs_evict_inode(struct inode *inode)
 			atomic_read(&fi->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
-				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
+				!is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (!f2fs_readonly(sbi->sb))
+			f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
+		else
+			f2fs_inode_synced(inode);
+	}
 	else
 		f2fs_inode_synced(inode);
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

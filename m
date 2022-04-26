Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522851180C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 14:51:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njh8L-0001hn-Ho; Wed, 27 Apr 2022 12:51:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1njh8K-0001hh-8c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 12:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNp0CtI/f4lUOFReW26HAgTiMRpavPn9jORpk8+aDMs=; b=ODgRjZHnY8WF6iHPb6xBkGMF4a
 RCnmL8gyIeyrTsnUzrOB+AEvfrFriOPKuno0sVmo1QJwDNNLVMqvk3YFyFkkIF0JJyZTbimAymDsr
 4hl8r7btPFpRx4oGiYXY8/wVEaLFw4HC9oKbnfpQ2cewciEhiHpE391tayGrRwB9jeU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zNp0CtI/f4lUOFReW26HAgTiMRpavPn9jORpk8+aDMs=; b=S
 qsFiUwwl/AIKQgexEbZRTTqopLDXtiobr7t+Qe0EvwZyxr0VqV2q3o5/vZkVg9PTkUOEABfgxE//4
 /Q8OfC5oYIOlQeL329WX9D9zxQQE49UFT7ouYeX3fDnQbqgNHA4gmCATS6VydVea6we4vTQ5g8a5d
 4FaWwJGIL7X3vHHg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njh8H-0003sO-0a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 12:51:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF07F61B57;
 Wed, 27 Apr 2022 12:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0D2C385A9;
 Wed, 27 Apr 2022 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651063850;
 bh=l6Uv1aghVwRUkGWE9Fea1FBCo3Be8k7dY9Jva4qOpe8=;
 h=From:To:Cc:Subject:Date:From;
 b=aNEhdpxQS99prDfh72nIUYHNrqoiN1aK5jb9lW6gWbnc9L5LSTyP7sOfIttEHHPwF
 kRPdd9I0pSfnM5//n4z0758Kfdu+ueWjNqpCUL8nS1aCGiGlXwSuCWnM5UbJZTWiQ4
 ALuEx6n4IiPXSZP1CZEFAHV03D2Pj53sdswcYkZrMijV2vMpmL5Hk0xkSijtfDbKuX
 17aB7vr3VWGRzP+5g/MLal4vWGWJ0bJWJ3DXD7gGQ+TasQcwjs/NeXf91AARFwTLHa
 0Rbw2reBnut8MISQanW19xpgZhVLxnwiCMG4Skyi7ud32fbLWpPZwJ/kpopOashCAi
 3ndOdBiRirH4A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 27 Apr 2022 01:06:02 +0800
Message-Id: <20220426170602.7431-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Yanming reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215897
 I have encountered a bug in F2FS file system in kernel v5.17. 
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njh8H-0003sO-0a
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid f2fs_bug_on() in
 dec_valid_node_count()
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Yanming reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215897

I have encountered a bug in F2FS file system in kernel v5.17.

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

The kernel message is shown below:

kernel BUG at fs/f2fs/f2fs.h:2511!
Call Trace:
 f2fs_remove_inode_page+0x2a2/0x830
 f2fs_evict_inode+0x9b7/0x1510
 evict+0x282/0x4e0
 do_unlinkat+0x33a/0x540
 __x64_sys_unlinkat+0x8e/0xd0
 do_syscall_64+0x3b/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The root cause is: .total_valid_block_count or .total_valid_node_count
could fuzzed to zero, then once dec_valid_node_count() was called, it
will cause BUG_ON(), this patch fixes to print warning info and set
SBI_NEED_FSCK into CP instead of panic.

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/f2fs.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f3eda4f13646..56adc3b68e14 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2605,11 +2605,17 @@ static inline void dec_valid_node_count(struct f2fs_sb_info *sbi,
 {
 	spin_lock(&sbi->stat_lock);
 
-	f2fs_bug_on(sbi, !sbi->total_valid_block_count);
-	f2fs_bug_on(sbi, !sbi->total_valid_node_count);
+	if (unlikely(!sbi->total_valid_block_count ||
+			!sbi->total_valid_node_count)) {
+		f2fs_warn(sbi, "dec_valid_node_count: inconsistent block counts, total_valid_block:%u, total_valid_node:%u",
+			  sbi->total_valid_block_count,
+			  sbi->total_valid_node_count);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+	} else {
+		sbi->total_valid_block_count--;
+		sbi->total_valid_node_count--;
+	}
 
-	sbi->total_valid_node_count--;
-	sbi->total_valid_block_count--;
 	if (sbi->reserved_blocks &&
 		sbi->current_reserved_blocks < sbi->reserved_blocks)
 		sbi->current_reserved_blocks++;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

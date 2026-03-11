Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKgvGuCSsWnkDAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88038266F5A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBEZrWrqdh2JEoDdox1qeoWKzpqtDIqHFyj0vvzwqfo=; b=dhxS2oQBe8lktb5EIQh/tq5UvU
	pIgHIAOwOLlWnBwPjiuezQo5Vj/C44scObaiHTQjstLSzTBfXC8LvuBBbP9yDZDpheZTbaAYJ78FG
	vnQl/ABN7xKyIj7r4mZV8FFZo+uSOf6rYyDFSOFDyZfdWzmTYHoVKvB/E0VEZY921Fnc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0M4C-0005IW-Ma;
	Wed, 11 Mar 2026 16:05:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0M42-0005IJ-Em
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuSJvCiJomcAXtJRslOIVuiHeyyCY5fUmdOYe7vNo7w=; b=Z6j4GrzDgQjgJQZ0E1Y2fmhPay
 8uo8uvJYs9aUdnE1pUzEVa2djdxAMR2OUjkQlDyuBJoOvcZKH9lMdqsNo7q1nUngxN7nMGFlc6dm3
 5XG9u8LvtyrPEZbp2Yno7GI4lqgkKTKiRuQpabXYqrucXMIt6YE+PBfqngnx/3oLOXwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vuSJvCiJomcAXtJRslOIVuiHeyyCY5fUmdOYe7vNo7w=; b=F
 t3Y6hFZMjaepUsdZ7KT9Q/+2pd+xIhnJl54xOOhBGQYRUYBoxI2BaZdH1fAd3mdYyjLg09cWw8072
 9NOUbLWRBxdYI5s5bGKUOUNxq1SuiTwZrN+7Hh6rgI58f/WyMC6gg2BSJ+17tAAqgLmLQ4cT/mPIi
 5/QvQr2QDc+ZLOVw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0M41-0007Om-IQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 171474329D;
 Wed, 11 Mar 2026 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8038AC4CEF7;
 Wed, 11 Mar 2026 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773236151;
 bh=B6w+pOLI4c0yj7mh9s6SnyB9dKoUajWjVyf4YAQI7mM=;
 h=From:To:Cc:Subject:Date:From;
 b=RpX76wfEcwMcsDM9OR8OP5WRDyQq5f7tccBuDKTvueWQYIrUxum9028wa7FDMBEBW
 QmqeXX8J+bFmgBNiJA/hxhwKV8fYCc7WemjwYjee35RsU9EWxwP2ohCWUic2dr2+Xl
 yq/vVNxFhV77nPM0xFmK+PIpsCFrOabtOHHEDdJLfq7AYwbT7lTQ7Qx8+EN7M5q0bT
 EOlGnAstsNopI/2F85M7+gyo04ZNjJ4jGSLMK5x67Mf2eUS5j0waJmUMx4a3K53WjD
 Uq6uSmAgePWpjN8IhQjrx9DkH55X19F1nyu9thzjWiXjPDOL5zaVwXUPeZgPBF+O7z
 My26tIu8KQtDA==
To: jaegeuk@kernel.org
Date: Wed, 11 Mar 2026 21:35:42 +0800
Message-ID: <20260311133542.1074617-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reported a f2fs bug as below: [ cut here ] kernel BUG
 at fs/f2fs/segment.c:1900! Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
 CPU: 1 UID: 0 PID: 6527 Comm: syz.5.110 Not tainted syzkaller #0 PREEMPT_{RT,
 (f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0M41-0007Om-IQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 dcc->discard_cmd_cnt conditionally
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+62538b67389ee582837a@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot+62538b67389ee582837a@syzkaller.appspotmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,62538b67389ee582837a];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 88038266F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Syzbot reported a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:1900!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6527 Comm: syz.5.110 Not tainted syzkaller #0 PREEMPT_{RT,(full)}
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:f2fs_issue_discard_timeout+0x59b/0x5a0 fs/f2fs/segment.c:1900
Code: d9 80 e1 07 80 c1 03 38 c1 0f 8c d6 fe ff ff 48 89 df e8 a8 5e fa fd e9 c9 fe ff ff e8 4e 46 94 fd 90 0f 0b e8 46 46 94 fd 90 <0f> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
RSP: 0018:ffffc9000494f940 EFLAGS: 00010283
RAX: ffffffff843009ca RBX: 0000000000000001 RCX: 0000000000080000
RDX: ffffc9001ca78000 RSI: 00000000000029f3 RDI: 00000000000029f4
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed100893a431 R12: 1ffff1100893a430
R13: 1ffff1100c2b702c R14: dffffc0000000000 R15: ffff8880449d2160
FS:  00007ffa35fed6c0(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2b68634000 CR3: 0000000039f62000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __f2fs_remount fs/f2fs/super.c:2960 [inline]
 f2fs_reconfigure+0x108a/0x1710 fs/f2fs/super.c:5443
 reconfigure_super+0x227/0x8a0 fs/super.c:1080
 do_remount fs/namespace.c:3391 [inline]
 path_mount+0xdc5/0x10e0 fs/namespace.c:4151
 do_mount fs/namespace.c:4172 [inline]
 __do_sys_mount fs/namespace.c:4361 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4338
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffa37dbda0a

The root cause is there will be race condition in between f2fs_ioc_fitrim()
and f2fs_remount():

- f2fs_remount			- f2fs_ioc_fitrim
 - f2fs_issue_discard_timeout
  - __issue_discard_cmd
  - __drop_discard_cmd
  - __wait_all_discard_cmd
				 - f2fs_trim_fs
				  - f2fs_write_checkpoint
				   - f2fs_clear_prefree_segments
				    - f2fs_issue_discard
				     - __issue_discard_async
				      - __queue_discard_cmd
				       - __update_discard_tree_range
				        - __insert_discard_cmd
				         - __create_discard_cmd
				         : atomic_inc(&dcc->discard_cmd_cnt);
  - sanity check on dcc->discard_cmd_cnt (expect discard_cmd_cnt to be zero)

This will only happen when fitrim races w/ remount rw, if we remount to
readonly filesystem, remount will wait until mnt_pcp.mnt_writers to zero,
that means fitrim is not in process at that time.

Cc: stable@kernel.org
Fixes: 2482c4325dfe ("f2fs: detect bug_on in f2fs_wait_discard_bios")
Reported-by: syzbot+62538b67389ee582837a@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/69b07d7c.050a0220.8df7.09a1.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/segment.c |  6 +++---
 fs/f2fs/super.c   | 11 ++++++++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8942b2a63cfd..e1c2d82ea64e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3989,7 +3989,7 @@ bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
 int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
-bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
+bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 23faf6725632..0bf25786667f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1880,7 +1880,7 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
  *
  * Return true if issued all discard cmd or no discard cmd need issue, otherwise return false.
  */
-bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
+bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_check)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct discard_policy dpolicy;
@@ -1897,7 +1897,7 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 	/* just to make sure there is no pending discard commands */
 	__wait_all_discard_cmd(sbi, NULL);
 
-	f2fs_bug_on(sbi, atomic_read(&dcc->discard_cmd_cnt));
+	f2fs_bug_on(sbi, need_check && atomic_read(&dcc->discard_cmd_cnt));
 	return !dropped;
 }
 
@@ -2367,7 +2367,7 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
 	 * Recovery can cache discard commands, so in error path of
 	 * fill_super(), it needs to give a chance to handle them.
 	 */
-	f2fs_issue_discard_timeout(sbi);
+	f2fs_issue_discard_timeout(sbi, true);
 
 	kfree(dcc);
 	SM_I(sbi)->dcc_info = NULL;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8774c60b4be4..40079fd7886b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2009,7 +2009,7 @@ static void f2fs_put_super(struct super_block *sb)
 	}
 
 	/* be sure to wait for any on-going discard commands */
-	done = f2fs_issue_discard_timeout(sbi);
+	done = f2fs_issue_discard_timeout(sbi, true);
 	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && done) {
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT | CP_TRIMMED,
@@ -2152,7 +2152,7 @@ static int f2fs_unfreeze(struct super_block *sb)
 	 * will recover after removal of snapshot.
 	 */
 	if (test_opt(sbi, DISCARD) && !f2fs_hw_support_discard(sbi))
-		f2fs_issue_discard_timeout(sbi);
+		f2fs_issue_discard_timeout(sbi, true);
 
 	clear_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
 	return 0;
@@ -2957,7 +2957,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 			need_stop_discard = true;
 		} else {
 			f2fs_stop_discard_thread(sbi);
-			f2fs_issue_discard_timeout(sbi);
+			/*
+			 * f2fs_ioc_fitrim() won't race w/ "remount ro"
+			 * so it's safe to check discard_cmd_cnt in
+			 * f2fs_issue_discard_timeout().
+			 */
+			f2fs_issue_discard_timeout(sbi, flags & SB_RDONLY);
 			need_restart_discard = true;
 		}
 	}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

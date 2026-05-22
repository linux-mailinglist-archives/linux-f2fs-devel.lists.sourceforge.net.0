Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMOQJJELEGpqSwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 09:53:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E055B0403
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 09:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VLaoG8EQz/zDmBSKMIIY6LL8oBE0C+Fk7oGAaqHXTFo=; b=TqRUEFs95T8trYfIQSn32L2o5k
	0Za1SkOntkIxjaDusQ90jwjWRH7zOXtkbdXYoBuL/LnqWuqonKjpo4RKtQ9inrCHVYcjAe5YK4oCB
	lLt9feNnHKmb8hjOpgfDPWPnUWqp9Tg9tMLRYZ8f7Mb592dJ1qlieZFDjZHfQaqExIqg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQKhS-0000UK-I9;
	Fri, 22 May 2026 07:53:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wQKhQ-0000U5-VA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 07:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSR5TM5dP8VMBQSWB1mR4M0bSsygysctU8QEmKMojsk=; b=OsqHCdzC+s9Hx7DbQMhqiYwbaG
 NCNWdrYZYYgTfoI8HCy3jqKgAntqPSYjUy6IVyAg/qBKe+RJt7znT5GZOoWJjt626yRyBsh3qb0Es
 ApkMKKt/oDpXnYCZSEf9APDYAPuzAEOinWLM7HgDsFx/o4tmlrjF4VuX6tEBPfiyQrZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eSR5TM5dP8VMBQSWB1mR4M0bSsygysctU8QEmKMojsk=; b=X
 CWsx5uK+Ai5ZYik7MAAw6+N8+n8uKZVOH9bjKjoXFm7rbgOpt1RfeXn3lxoB+oxuErSzZB4HRrn+q
 7hX57AROCaYx8YBkuWJSovJrGzo4ERP3uKG6withgTNPAGnV2nHxVpcgw1s62frYLLNdtRIZzT6nt
 HscheWe2Dq50zVtI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQKhP-0004Bi-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 07:53:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 898F860172;
 Fri, 22 May 2026 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA111F000E9;
 Fri, 22 May 2026 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779436409;
 bh=eSR5TM5dP8VMBQSWB1mR4M0bSsygysctU8QEmKMojsk=;
 h=From:To:Cc:Subject:Date;
 b=ipftsE9N14knQvSVxA+Iuv/pFBuMw1ffj2fDpKJWeTjDY66S9GZ9Ilt67rVy+1syD
 tz8lede4M86TKsbnKp5BdICp+B+hYtuVYKfkOXzfD47W8mIVvQKDQp6oSkbKMzaB3J
 fC++8SIi8r3YbH3AuHsWKxqV3/mKnZkUrMXfF6/y5wkLLcd40FRSxTetumjvnUrT+o
 jcbrkg2xE323FyA3yiPYREp85WuFg6yc+wiEk4yYFnncRRiZ9FuMQWprzzDosKpI4Y
 d5MDZtpjXS53fVVF4ozsFupdVOPcmjKLYvuQMG/vyAXBHR5h+guzWD5CqacrzbPdfP
 frfvdxuO1zMRA==
To: jaegeuk@kernel.org
Date: Fri, 22 May 2026 15:53:29 +0800
Message-Id: <20260522075329.12079-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: kernel BUG at fs/f2fs/file.c:845! Oops: invalid opcode: 0000
 [#1] SMP KASAN NOPTI CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted
 syzkaller
 #0 PREEMPT(full) Hardware name: QEMU Standard PC (Q35 + IC [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQKhP-0004Bi-Mc
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 f2fs_get_node_folio_ra()
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
Cc: syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
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
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,2488d8d751b27f7ce268];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email];
	NEURAL_HAM(-0.00)[-0.998];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: C7E055B0403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kernel BUG at fs/f2fs/file.c:845!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:f2fs_do_truncate_blocks+0x1115/0x1140 fs/f2fs/file.c:845
Code: fc fc 90 0f 0b e8 8b 9d 9a fd 90 0f 0b e8 83 9d 9a fd 48 89 df 48 c7 c6 60 d1 1a 8c e8 54 f1 fc fc 90 0f 0b e8 6c 9d 9a fd 90 <0f> 0b e8 64 9d 9a fd 90 0f 0b 90 e9 93 fd ff ff e8 56 9d 9a fd 90
RSP: 0018:ffffc9000e4474c0 EFLAGS: 00010283
RAX: ffffffff842b1d34 RBX: 0000000000000003 RCX: 0000000000100000
RDX: ffffc9000f03a000 RSI: 0000000000035503 RDI: 0000000000035504
RBP: ffffc9000e447608 R08: ffff8880123b0000 R09: 0000000000000002
R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000001
R13: 0000000000000000 R14: 1ffff92001c88ea0 R15: 00000000ffff039c
FS:  00007f7e02ee36c0(0000) GS:ffff88808c887000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff0305c4000 CR3: 0000000012d4c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:882
 f2fs_truncate+0x471/0x7c0 fs/f2fs/file.c:940
 f2fs_evict_inode+0xa3f/0x1ac0 fs/f2fs/inode.c:907
 evict+0x61e/0xb10 fs/inode.c:841
 f2fs_fill_super+0x5f43/0x78f0 fs/f2fs/super.c:5224
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
 vfs_get_tree+0x92/0x2a0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3758 [inline]
 do_new_mount+0x341/0xd30 fs/namespace.c:3834
 do_mount fs/namespace.c:4167 [inline]
 __do_sys_mount fs/namespace.c:4383 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

	count = ADDRS_PER_PAGE(dn.node_folio, inode);

	count -= dn.ofs_in_node;
	f2fs_bug_on(sbi, count < 0);

The fuzz test will trigger above bug_on in f2fs.

The root cause should be: in the corrupted inode, there is a direct node
which has the same ino and nid in its footer, so in f2fs_do_truncate_blocks(),
after f2fs_get_dnode_of_data() finds such dnode:
1) ADDRS_PER_PAGE(dn.node_folio, inode) will return 923
2) once dn.ofs_in_node points to addr[923, 1017]
Then it will trigger the system panic.

Let's introduce NODE_TYPE_NON_IXNODE to indicate current node should
not be an inode or xattr node, and then use it in below path to detect
inconsistent node chain in inode mapping table:

- f2fs_do_truncate_blocks
 - f2fs_get_dnode_of_data
  - f2fs_get_node_folio_ra
   -  __get_node_folio
    - f2fs_sanity_check_node_footer
     - case NODE_TYPE_NON_IXNODE -> check whether it is inode|xnode

Cc: stable@kernel.org
Reported-by: syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/69fa3697.170a0220.59368.0018.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fffb516b78f4..f528f9954764 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1593,6 +1593,7 @@ enum node_type {
 	NODE_TYPE_INODE,
 	NODE_TYPE_XATTR,
 	NODE_TYPE_NON_INODE,
+	NODE_TYPE_NON_IXNODE,	/* non inode and xnode */
 };
 
 /* a threshold of maximum elapsed time in critical region to print tracepoint */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cd5a394f6111..38917e4a7319 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1548,6 +1548,10 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 		if (is_inode)
 			goto out_err;
 		break;
+	case NODE_TYPE_NON_IXNODE:
+		if (is_inode || is_xnode)
+			goto out_err;
+		break;
 	default:
 		break;
 	}
@@ -1643,7 +1647,7 @@ static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start)
 	struct f2fs_sb_info *sbi = F2FS_F_SB(parent);
 	nid_t nid = get_nid(parent, start, false);
 
-	return __get_node_folio(sbi, nid, parent, start, NODE_TYPE_REGULAR);
+	return __get_node_folio(sbi, nid, parent, start, NODE_TYPE_NON_IXNODE);
 }
 
 static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

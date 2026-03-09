Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOyjKhQvrmlrAQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 03:23:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACB23334A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 03:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SyUJ33eVXysjuC+1ikc1WIvCB/1LnQJ08O1IAdVVaJ8=; b=A2jHhkUgk51bSYyHkCsE13rJ7T
	+oK/VP6WoNL3s+JCYBPA69iWH2QH14l5+RJgHMaFOV7sa+UZunkQzt2UGV/fEMGIQWhREomS1qzGO
	JjpgKk4Ji85C0BuuGegLF8R8v9QrZCjNrJ5GLppfs+3lgHcFJlozV/vtmCJjdo+gUxSs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzQGu-0004Z8-Po;
	Mon, 09 Mar 2026 02:23:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzQGt-0004Z1-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 02:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzyR8yDuHu67N5F2w848Db+XnTgjwugHo2X69ztJ9L4=; b=Bs6HQOb3XGoq7sK1y7GoHQP13r
 PfVz2bxDP+frBvZ0Sh5tdwNjhr9J9aG5WbTxqQXFOGqTTMCtCe4XmiIzOtqVkRaeXbkbT+C3dtZTT
 4US21oW0I42xbk427TwsoUdCpmpQwgIEZez7o2aOu7OoiPJfAGXANh0aJmCc6d4iGlNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xzyR8yDuHu67N5F2w848Db+XnTgjwugHo2X69ztJ9L4=; b=O
 1jVXsSZ6xddAdR2jRTu4jWLx5XG+xJkav3Ozt30O6J+jrKYzwnnnZFP6yb5y5DbIh+Z7t4i+kT9mz
 up1cXwfXtSRMhPeaHcSfYGlnYpve3IiCJISYTGhGXJIV9BTgXpiL3kn7Rt13ooq6uUDsm/pJiz7Al
 UjMMZ5QcUFxYskxA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzQGs-0003OH-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 02:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F39F43796;
 Mon,  9 Mar 2026 02:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB713C116C6;
 Mon,  9 Mar 2026 02:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773022971;
 bh=QY92ZT8kIt/iEYqDgvcfPZiPKBlUZ1FPa2zb9N0hQSw=;
 h=From:To:Cc:Subject:Date:From;
 b=tW49woeW8nglY7P/8TI6dK5ezHZ82ObEzAZqI72ovrNDowRgNo3VnLkwaPr/Y7jwU
 7wIxCydJBblYRk+RDLTkYnjRFh21ci9XdE+dtu/p9O3daeYZT6WBzImRLuDZd14XtO
 ZJ1TcqobiQmRA26ieK4/ushIe56pJUXFNxMGgEz0vooY4L29b8D9f1XXbCDPZ2FiqT
 maGM9ufCEimZdoURCIfgfjvE2pfw/UzLIDWl/HNeVM7uVE4KYcv39ER9iAwfRb/Oei
 VQWzjMMjzf2DF/IaTTxEpPArj7HJXH05IB+jZ3dB1TYR5hBZb3EFvSazjq2EiIlYoW
 BFremlRuVzcLA==
To: jaegeuk@kernel.org
Date: Mon,  9 Mar 2026 02:22:37 +0000
Message-ID: <20260309022237.1680736-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported a f2fs bug as below: BUG: KMSAN: uninit-value
 in f2fs_sanity_check_node_footer+0x374/0xa20 fs/f2fs/node.c:1520
 f2fs_sanity_check_node_footer+0x374/0xa20
 fs/f2fs/node.c:1520 f2fs_finish_read_bio+0xe1e/0x1d60 fs/f2fs/data.c [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzQGs-0003OH-Kq
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid uninit-value access in
 f2fs_sanity_check_node_footer
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
Cc: syzbot+9aac813cdc456cdd49f8@syzkaller.appspotmail.com, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C9ACB23334A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:syzbot+9aac813cdc456cdd49f8@syzkaller.appspotmail.com,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,9aac813cdc456cdd49f8];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

syzbot reported a f2fs bug as below:

BUG: KMSAN: uninit-value in f2fs_sanity_check_node_footer+0x374/0xa20 fs/f2fs/node.c:1520
 f2fs_sanity_check_node_footer+0x374/0xa20 fs/f2fs/node.c:1520
 f2fs_finish_read_bio+0xe1e/0x1d60 fs/f2fs/data.c:177
 f2fs_read_end_io+0x6ab/0x2220 fs/f2fs/data.c:-1
 bio_endio+0x1006/0x1160 block/bio.c:1792
 submit_bio_noacct+0x533/0x2960 block/blk-core.c:891
 submit_bio+0x57a/0x620 block/blk-core.c:926
 blk_crypto_submit_bio include/linux/blk-crypto.h:203 [inline]
 f2fs_submit_read_bio+0x12c/0x360 fs/f2fs/data.c:557
 f2fs_submit_page_bio+0xee2/0x1450 fs/f2fs/data.c:775
 read_node_folio+0x384/0x4b0 fs/f2fs/node.c:1481
 __get_node_folio+0x5db/0x15d0 fs/f2fs/node.c:1576
 f2fs_get_inode_folio+0x40/0x50 fs/f2fs/node.c:1623
 do_read_inode fs/f2fs/inode.c:425 [inline]
 f2fs_iget+0x1209/0x9380 fs/f2fs/inode.c:596
 f2fs_fill_super+0x8f5a/0xb2e0 fs/f2fs/super.c:5184
 get_tree_bdev_flags+0x6e6/0x920 fs/super.c:1694
 get_tree_bdev+0x38/0x50 fs/super.c:1717
 f2fs_get_tree+0x35/0x40 fs/f2fs/super.c:5436
 vfs_get_tree+0xb3/0x5d0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3763 [inline]
 do_new_mount+0x885/0x1dd0 fs/namespace.c:3839
 path_mount+0x7a2/0x20b0 fs/namespace.c:4159
 do_mount fs/namespace.c:4172 [inline]
 __do_sys_mount fs/namespace.c:4361 [inline]
 __se_sys_mount+0x704/0x7f0 fs/namespace.c:4338
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4338
 x64_sys_call+0x39f0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is: in f2fs_finish_read_bio(), we may access uninit data
in folio if we failed to read the data from device into folio, let's add
a check condition to avoid such issue.

Cc: stable@kernel.org
Fixes: 50ac3ecd8e05 ("f2fs: fix to do sanity check on node footer in {read,write}_end_io")
Reported-by: syzbot+9aac813cdc456cdd49f8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/69a9ca26.a70a0220.305d9a.0000.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 400f0400e13d..cb2332faf5f0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -173,7 +173,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		while (nr_pages--)
 			dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
 
-		if (F2FS_F_SB(folio)->node_inode && is_node_folio(folio) &&
+		if (bio->bi_status == BLK_STS_OK &&
+			F2FS_F_SB(folio)->node_inode && is_node_folio(folio) &&
 			f2fs_sanity_check_node_footer(F2FS_F_SB(folio),
 				folio, folio->index, NODE_TYPE_REGULAR, true))
 			bio->bi_status = BLK_STS_IOERR;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

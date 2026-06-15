Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgY0KZwaMGqtNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B2687B3A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="d/8pj+SO";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iQmtLFLE;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=IulpDyIh;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kmO0Wzm1;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srxOeajv64ARplQNwJ4HthJZ6TI23bVzTmpeoVGBWcY=; b=d/8pj+SOJF+X1HIqFA+ax5iDnN
	b2yAh4B8Xo9IWUFwdnvMXmv8VWhFl6ZAflCbIwZ6tbfJzaG2vANceJm/3wAKHltEONap5nEbUmuUU
	KQ2FbkBpzuFPsrJJPibjS8dTS9umZo3ymstQREkpZphaAaDe1IO4vlqB1n7MZ2fy8sxU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Gj-0000VE-7w;
	Mon, 15 Jun 2026 15:30:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9Gh-0000Ur-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdjMueh2SCW0j1KOXfn/s4HivU7jNluqzgTY7M+LHv8=; b=iQmtLFLE8Ba+0i11+1x2q/wrtB
 RngZikujxtBfZnp0mh175rqmqwh+q+vXWVbcwkZb9eJpHp7zedNvjdKlFXJtRTu30cB4e3yNYrNbk
 fK1asSc9kZTMZJS+CdpuQjbQ6D8zloG3g0Wq7JqKb82XMiLkeH3En74EDWx/ZjoRalqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdjMueh2SCW0j1KOXfn/s4HivU7jNluqzgTY7M+LHv8=; b=IulpDyIhIyEMvEoE1Q44qSycBX
 kWAm3gdKh6p0JGo2JHYKlWXabLBSOpx6LxRQVgszT6woQP8fjCONdXPZw4XWIYfgYI8BpYr94ZyZF
 iSN2E9jpTEQehQsVwLTXxI4OU7bMM5TZ2TCN09VZ9/rydf2V8OAoiIKAD7/U9fWEZYig=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9Gd-0002wY-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0DB454366F;
 Mon, 15 Jun 2026 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44081F000E9;
 Mon, 15 Jun 2026 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537417;
 bh=EdjMueh2SCW0j1KOXfn/s4HivU7jNluqzgTY7M+LHv8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=kmO0Wzm1VJQO4BSNJ59Yp09vV7VZWnEx/U6ExLFP6IuBUav9/+mctwEj3WPFcuHjI
 SpE0vmPqbtvzNMhQIHAF1AIdGMdBredDSxBVJHkNAGehzMq8KnPh3ugh3DqAeXiemC
 f71JIvvOVAi+7UAKu0jXtMXd0A9uhPzpzqOmXu4UueMANlMp1GsYGGSy3Qjmw3KFT7
 YrHmCfHOJcL/edfyXYi2gu4VvZwTpl4BBr4xu26qKRwSHCniaFYu3TUy7Bqu/RHTQi
 WaSaEtaOR0QUml4tQPey4SiJkh6ZTgPlooI/uM4F8++gRTHuoZ1x+lSQCYndRLjddC
 WlY51GXPM7JJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 567893811A64; Mon, 15 Jun 2026 15:30:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153741288.3946007.3531564657210021595.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 15:30:12 +0000
References: <20260522075329.12079-1-chao@kernel.org>
In-Reply-To: <20260522075329.12079-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 22 May 2026 15:53:29 +0800 you
 wrote: > kernel BUG at fs/f2fs/file.c:845! > Oops: invalid opcode: 0000 [#1]
 SMP KASAN NOPTI > CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller
 #0 PRE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ9Gd-0002wY-Qh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,2488d8d751b27f7ce268];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 296B2687B3A

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 22 May 2026 15:53:29 +0800 you wrote:
> kernel BUG at fs/f2fs/file.c:845!
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:f2fs_do_truncate_blocks+0x1115/0x1140 fs/f2fs/file.c:845
> Code: fc fc 90 0f 0b e8 8b 9d 9a fd 90 0f 0b e8 83 9d 9a fd 48 89 df 48 c7 c6 60 d1 1a 8c e8 54 f1 fc fc 90 0f 0b e8 6c 9d 9a fd 90 <0f> 0b e8 64 9d 9a fd 90 0f 0b 90 e9 93 fd ff ff e8 56 9d 9a fd 90
> RSP: 0018:ffffc9000e4474c0 EFLAGS: 00010283
> RAX: ffffffff842b1d34 RBX: 0000000000000003 RCX: 0000000000100000
> RDX: ffffc9000f03a000 RSI: 0000000000035503 RDI: 0000000000035504
> RBP: ffffc9000e447608 R08: ffff8880123b0000 R09: 0000000000000002
> R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000001
> R13: 0000000000000000 R14: 1ffff92001c88ea0 R15: 00000000ffff039c
> FS:  00007f7e02ee36c0(0000) GS:ffff88808c887000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ff0305c4000 CR3: 0000000012d4c000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:882
>  f2fs_truncate+0x471/0x7c0 fs/f2fs/file.c:940
>  f2fs_evict_inode+0xa3f/0x1ac0 fs/f2fs/inode.c:907
>  evict+0x61e/0xb10 fs/inode.c:841
>  f2fs_fill_super+0x5f43/0x78f0 fs/f2fs/super.c:5224
>  get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
>  vfs_get_tree+0x92/0x2a0 fs/super.c:1754
>  fc_mount fs/namespace.c:1193 [inline]
>  do_new_mount_fc fs/namespace.c:3758 [inline]
>  do_new_mount+0x341/0xd30 fs/namespace.c:3834
>  do_mount fs/namespace.c:4167 [inline]
>  __do_sys_mount fs/namespace.c:4383 [inline]
>  __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
    https://git.kernel.org/jaegeuk/f2fs/c/8c2776ee7ecc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

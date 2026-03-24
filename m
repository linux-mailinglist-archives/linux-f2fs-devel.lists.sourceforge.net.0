Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBs8JLnKwmn7mAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6FC31A11F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APVNJxac2VXsthH7Ha0q+8TLtLR7VQ7hjM0bKRazgJo=; b=gy9ga1Mif5CA8BjOrxgW1kiRDM
	jr29fwySTfRd35B5jAbcHxwY+My4o5m3vViHB9zIxB6NbcQKeRcHqtTtX3aqiAy5/g5VRTATjp0qq
	81Yl2Lzw/xxVllds7j5sAXrSH3jm5V6Q2KLUoKJcIcU+JbnvpGGUv4Fmk5i5u2fUM8Dk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cN-0003kp-M1;
	Tue, 24 Mar 2026 17:32:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cM-0003kh-Hu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a8uuB8c3xe+a5rrBK5bxV/QDCf9cY2UGRvm/34zQgvc=; b=mQtacPm5rcXi/Dyabe5GKZ4QPN
 0Er40bnXpK+Zz2KoqiYY3VDM6aJTKt6WhY+8QIHAUfcScAwEIZlKPRg/vtiJzPjn85NH9JuIsxrUO
 yGoHNaNADuLhNwxGe2zrZihjdxD6lq6dfCX9ZgksRBEq22IyPcTonY5qM4GM7FqZpt5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a8uuB8c3xe+a5rrBK5bxV/QDCf9cY2UGRvm/34zQgvc=; b=YY6XgKQhRWEKJO1LsiXmM46+M/
 aJlXEwgmIOzSt8uxF6n1anlAKdSTIOnnSpAm/3fTvhwAJGuyxnTlQYwkQiRdZBJP2a+3XMz5MIS9Y
 V0F0XuIc1Tv7ah7nXl6ZJWs8zINq4wSNeBLmenoPz/sr+hVxNLRZ10uDSBQ5YPbLTjpU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cL-0007qR-OT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1785F43E99;
 Tue, 24 Mar 2026 17:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB01C19424;
 Tue, 24 Mar 2026 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373550;
 bh=ei1ZV3QBgMMILpnHpvVFavcrEnOFR+gl09a69uDoZP0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bovRZGFfehk950Q/Qop3G2H05QQATpes1Lt+XWcPbJ0geGkmRA7quN92w9Dsjvyke
 /PfQH6lIDkSbwuKAlJorQhn7+kfuj2xwS+JeW4AZwrcO0+lbArZcWyWBBEkLolNfR8
 W+bQLkS+P4AoNqD0yl15sLhYglp5lWCz+9VYfYr3Vu3jZog11a1goGOivxSfDSQqn4
 4n/PP2QTZnm9vqM6V8Vg6dYwzsKUjaKcwmCAdacI/iHCkBx9l3CYPA08CyykTSyKS1
 U6iM7Cta4p4kgxx6/sAlk6AWt6k/kDDpsZoQVWZkUqoiXIxwGfTYyBlNCsZto+WNgj
 HjJ6PeHwZKvdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02C8A3808203; Tue, 24 Mar 2026 17:32:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437353778.1223048.18410496356878638835.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:17 +0000
References: <20260311133542.1074617-1-chao@kernel.org>
In-Reply-To: <20260311133542.1074617-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 11 Mar 2026 21:35:42 +0800 you
 wrote: > Syzbot reported a f2fs bug as below: > > [ cut here ] > kernel BUG
 at fs/f2fs/segment.c:1900! > Oops: invalid opcode: 0000 [#1] [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cL-0007qR-OT
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, syzbot+62538b67389ee582837a@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:syzbot+62538b67389ee582837a@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,62538b67389ee582837a];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 1F6FC31A11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 11 Mar 2026 21:35:42 +0800 you wrote:
> Syzbot reported a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:1900!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 1 UID: 0 PID: 6527 Comm: syz.5.110 Not tainted syzkaller #0 PREEMPT_{RT,(full)}
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
> RIP: 0010:f2fs_issue_discard_timeout+0x59b/0x5a0 fs/f2fs/segment.c:1900
> Code: d9 80 e1 07 80 c1 03 38 c1 0f 8c d6 fe ff ff 48 89 df e8 a8 5e fa fd e9 c9 fe ff ff e8 4e 46 94 fd 90 0f 0b e8 46 46 94 fd 90 <0f> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
> RSP: 0018:ffffc9000494f940 EFLAGS: 00010283
> RAX: ffffffff843009ca RBX: 0000000000000001 RCX: 0000000000080000
> RDX: ffffc9001ca78000 RSI: 00000000000029f3 RDI: 00000000000029f4
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: dffffc0000000000 R11: ffffed100893a431 R12: 1ffff1100893a430
> R13: 1ffff1100c2b702c R14: dffffc0000000000 R15: ffff8880449d2160
> FS:  00007ffa35fed6c0(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f2b68634000 CR3: 0000000039f62000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  __f2fs_remount fs/f2fs/super.c:2960 [inline]
>  f2fs_reconfigure+0x108a/0x1710 fs/f2fs/super.c:5443
>  reconfigure_super+0x227/0x8a0 fs/super.c:1080
>  do_remount fs/namespace.c:3391 [inline]
>  path_mount+0xdc5/0x10e0 fs/namespace.c:4151
>  do_mount fs/namespace.c:4172 [inline]
>  __do_sys_mount fs/namespace.c:4361 [inline]
>  __se_sys_mount+0x31d/0x420 fs/namespace.c:4338
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ffa37dbda0a
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
    https://git.kernel.org/jaegeuk/f2fs/c/2ab98eba8bc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

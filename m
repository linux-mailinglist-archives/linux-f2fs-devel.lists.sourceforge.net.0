Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ak0GhTYqWl5GAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:23:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8B2176D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/D5EzoUioDGUCUQkZgLqygqtCaeS0FbW71UdG8O0GQ=; b=NTp5FS39p3mvfP/jdQkDP9Bxuj
	50oh7cVlLbQBTOI/yEyJpge9An4F87rfbc7QwhtHbLnS6lFuJIYyr0DhTkndIjKCZvHuJvnbR70in
	Wj1TcR5eHFxgjYneQ19RsBgQ6B885gnnUn2L8k2GP332TxlsY294PwlT6wjWIAlrYvOk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyEHd-0001hV-HI;
	Thu, 05 Mar 2026 19:22:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vyEHc-0001hE-1o
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTJQKHW8A2VsxKG6xIPXzXKhzun8D62opZvaEumK+sA=; b=EE3+ta/vlncfdUHj8ZnqGggG0f
 POhJHwQsSZ7kyjq0F9PG4EGKkHZW/vcNkfe5QnDS45TXmcKX6c8iKOKsaZMIFXKue60cGMQ3ErxW5
 cWhj5gna81FMJhS72O6ZFVXygFztGr+82vK3WQ9ND95mr+j6eIN3VfUwNozdaypxnTzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTJQKHW8A2VsxKG6xIPXzXKhzun8D62opZvaEumK+sA=; b=Kv1BG3Okpa/RWfxrcr9RTfuRFk
 KTeDMUs2K9ncQN07Ztvi9KPaSO9tm8Ii3sJbEPG/eJzQiQYr2EY0wLeUOE2kjdArqpxJn9VoL1tDk
 BaEAMibBErnpqdbRGOZKkqISXNgMeWqWc2OP35mLM+bwquhn75k6eELCd9YtsKp+9w5o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyE5Z-0001v3-4N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1FB844576;
 Thu,  5 Mar 2026 19:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95399C2BC9E;
 Thu,  5 Mar 2026 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772737814;
 bh=sTtAmEsYD8SIEU/qEbBpKUIkBgc/87zAxqhtnY2MpIw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VRlulZMLdOIPoZVbQYcClldRM9uy1DhMXkCm6dkC8PR0BkFPbj4Znho5zS3r9eMvh
 tPcHqusU8aWW1eUUXczUThK5hmOHJT9qUj0VZM+8Am2Z+JCCNUQlGgf7AbPIrkIERr
 x+IxEfRYYAli7Stq9FOpSkI2kT8spgoWsqMm3dpLG3NebkiUiPV+T8BkuoFrIzfMAY
 RNPbo13LOFzk+gGML9XXBu11SZKn1upKQ83hPdcCMCZTOQpYo25y2JnAeamd3lxfqF
 J15+1QQti7D7mPrpbenPKDLOfKdveL96CT8ieCfdc8OfOImO73eghR6BA7Cu9XjF1S
 xTR48DnAGNDXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9E483808200; Thu,  5 Mar 2026 19:10:15 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177273781429.3248266.5417972090496758870.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 19:10:14 +0000
References: <20260304082231.599770-1-chao@kernel.org>
In-Reply-To: <20260304082231.599770-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 4 Mar 2026 16:22:31 +0800 you wrote:
 > syzbot reported a f2fs bug as below: > > BUG: memory leak > unreferenced
 object 0xffff888127f70830 (size 16): > comm "syz.0.23", pid 6144, jiffies
 429494 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vyE5Z-0001v3-4N
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid memory leak in
 f2fs_rename()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, jaegeuk@kernel.org,
 syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6EC8B2176D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:syzbot+cf7946ab25b21abc4b66@syzkaller.appspotmail.com,m:stable@kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cf7946ab25b21abc4b66];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  4 Mar 2026 16:22:31 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> BUG: memory leak
> unreferenced object 0xffff888127f70830 (size 16):
>   comm "syz.0.23", pid 6144, jiffies 4294943712
>   hex dump (first 16 bytes):
>     3c af 57 72 5b e6 8f ad 6e 8e fd 33 42 39 03 ff  <.Wr[...n..3B9..
>   backtrace (crc 925f8a80):
>     kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>     slab_post_alloc_hook mm/slub.c:4520 [inline]
>     slab_alloc_node mm/slub.c:4844 [inline]
>     __do_kmalloc_node mm/slub.c:5237 [inline]
>     __kmalloc_noprof+0x3bd/0x560 mm/slub.c:5250
>     kmalloc_noprof include/linux/slab.h:954 [inline]
>     fscrypt_setup_filename+0x15e/0x3b0 fs/crypto/fname.c:364
>     f2fs_setup_filename+0x52/0xb0 fs/f2fs/dir.c:143
>     f2fs_rename+0x159/0xca0 fs/f2fs/namei.c:961
>     f2fs_rename2+0xd5/0xf20 fs/f2fs/namei.c:1308
>     vfs_rename+0x7ff/0x1250 fs/namei.c:6026
>     filename_renameat2+0x4f4/0x660 fs/namei.c:6144
>     __do_sys_renameat2 fs/namei.c:6173 [inline]
>     __se_sys_renameat2 fs/namei.c:6168 [inline]
>     __x64_sys_renameat2+0x59/0x80 fs/namei.c:6168
>     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>     do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid memory leak in f2fs_rename()
    https://git.kernel.org/jaegeuk/f2fs/c/f1139c0b9a5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

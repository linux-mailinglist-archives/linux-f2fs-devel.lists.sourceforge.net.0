Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8979FCB4F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2024 15:02:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tQoRJ-0002LO-CC;
	Thu, 26 Dec 2024 14:02:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tQoRH-0002LG-Ea
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 14:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KebQMvH5ekl0WbZYvyzk7R55WHOyOIf/D3I2qPonQMs=; b=YugQB5uJOWyrnU2q/Q0faCcDZY
 qKX6J4pH3AWQMPJViKrTkg2Ky1d56K4+ZXVv9177l9+GEFPx3+G8p1VxQhRWJZBzki8FfJxz7h9t+
 t2kP6jl1R59usly6sjGuU0tIoa9/S0lim7B7gYcV9t6R8BBAOp+abS9qD7g7XP5SZ4CA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KebQMvH5ekl0WbZYvyzk7R55WHOyOIf/D3I2qPonQMs=; b=CEgYJbZL3qGVV6kTWB21A1NEl9
 IStHW2QeST3JWSWap8nuReH46DuVigss830jsGBaNZ+WrKlE+XoQA8R9iKS2Rjy/6w5QO9bgVerpi
 dP/tyjVy/yh8pdLecg0iR8EIvffuw36VOHEvBNm0MyRi0e6E962uz9hlOoI7TNjjGy+M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tQoRG-00061z-0N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 14:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EED285C5B1E;
 Thu, 26 Dec 2024 14:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A1DC4CED2;
 Thu, 26 Dec 2024 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735221724;
 bh=su9knhlNxkMsyauWUBR8t/hhTw2AboVx5LlsHhCYf0k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kpZ7+ZBdvlVUPnVgx4B7a0VRHrUh/O+QsUKEVj9O3JM9n+uFMzJ7nMEmlOJHU2abo
 +Yb7HQv8fYuw8NNo5sY+kzaObPYfxrUbVCvtIaFN/WUMGoSpBfTuAXKK3mylcOJdtX
 TZaQJ8upiHq+wIatxx0lwJuFnR2k06K1wH5iWEte8VQZ7QlL+NHRpHKJ6cetkxkHKG
 BymwIxgtRu83DJIBro0ibSgqXrX5dJZ5uUISVorIO4Q77dpilwMYINCTh6t3iEyp7u
 J4FeWSaZUH/EN604jxdqrEX7FH4j9xBBgNiZazlvMQUfSCoRu+5ofQmcVglVVphiT7
 QT7bDl1hSD5QQ==
Message-ID: <ff5f7b3f-8e93-46d0-b60a-b2f0fa370bd7@kernel.org>
Date: Thu, 26 Dec 2024 22:02:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <676864d5.050a0220.226966.002c.GAE@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <676864d5.050a0220.226966.002c.GAE@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2024/12/23 3:13, syzbot wrote: > syzbot has found a reproducer for
 the following issue on: > > HEAD commit: bcde95ce32b6 Merge tag
 'devicetree-fixes-for-6.13-1'
 of gi.. > git tree: upstream > conso [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tQoRG-00061z-0N
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 read_inline_xattr
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

On 2024/12/23 3:13, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    bcde95ce32b6 Merge tag 'devicetree-fixes-for-6.13-1' of gi..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=116c0adf980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
> dashboard link: https://syzkaller.appspot.com/bug?extid=69f5379a1717a0b982a1
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167f9f30580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142d7cf8580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/be6d4de70f82/disk-bcde95ce.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/70993500a1e4/vmlinux-bcde95ce.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1018443184c5/bzImage-bcde95ce.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/7e1b134be79c/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Failed to enable quota tracking (type=1, err=-22). Please run fsck to fix.
> F2FS-fs (loop0): Cannot turn on quotas: error -22
> F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
> ------------[ cut here ]------------
> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
> index 18446744073709500059 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
> CPU: 0 UID: 0 PID: 5820 Comm: syz-executor178 Not tainted 6.13.0-rc3-syzkaller-00301-gbcde95ce32b6 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>   ubsan_epilogue lib/ubsan.c:231 [inline]
>   __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>   read_inline_xattr+0x273/0x280
>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>   f2fs_getxattr+0x57b/0x13b0 fs/f2fs/xattr.c:533
>   __vfs_getxattr+0x433/0x470 fs/xattr.c:423
>   smk_fetch+0xb1/0x140 security/smack/smack_lsm.c:306
>   smack_d_instantiate+0x749/0xa50 security/smack/smack_lsm.c:3615
>   security_d_instantiate+0x107/0x1f0 security/security.c:4070
>   d_splice_alias+0x6f/0x330 fs/dcache.c:3001
>   f2fs_lookup+0x4ff/0x820 fs/f2fs/namei.c:523
>   lookup_one_qstr_excl+0x11f/0x260 fs/namei.c:1692
>   filename_create+0x297/0x540 fs/namei.c:4081
>   do_mkdirat+0xbd/0x3a0 fs/namei.c:4326
>   __do_sys_mkdir fs/namei.c:4354 [inline]
>   __se_sys_mkdir fs/namei.c:4352 [inline]
>   __x64_sys_mkdir+0x6c/0x80 fs/namei.c:4352
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f5566117ad7
> Code: ff ff 77 07 31 c0 c3 0f 1f 40 00 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff7eab6a58 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5566117ad7
> RDX: 0000000000000000 RSI: 00000000000001ff RDI: 0000000020000180
> RBP: 0000000020000180 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fff7eab6af0 R14: 0000000000000000 R15: 0000000000000000
>   </TASK>
> ---[ end trace ]---
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

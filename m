Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51A96CC47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 03:30:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm1K6-00074M-Bz;
	Thu, 05 Sep 2024 01:30:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sm1K4-00074F-W1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NkV5DWlS9DGg5SDoI0MkgzouYb70kkvJnHiIg0byjSU=; b=GJkDkBJbI/C9Cr/ItSi01TbLuR
 JdO06az0hE5MrU4ZrDmW2YVCoGzdVUKeJIUcPoT60KgGzrbQ2hepB+unyT9lWEHZ5TusfQ3yIYB82
 Ktpp5lqfD+7VtS8IUIfLadD/7mMRqXQMBkFzQuct/8PTfWoW+7z9yCoy5fQXUmigivZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NkV5DWlS9DGg5SDoI0MkgzouYb70kkvJnHiIg0byjSU=; b=FuuQ2E42jj+OTT6Q4SmOOtT8nz
 vRss5E5qWLtBRvzojFv59nScJSFAxRrHAoAgA4z9AxUPJolBQ9qClB0pazKrGrh83tMGK5DX0xiiK
 hsfPWw8ear7G2V2h1FuyYd8L4n7ycEtJmLdkcYDgCoT+Dg+pojXbFA0XeYq6MgLAi9Yw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm1K4-0007Ci-3s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B5A7A43430;
 Thu,  5 Sep 2024 01:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA817C4CEC2;
 Thu,  5 Sep 2024 01:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725499797;
 bh=isoZFrkj3HFjQpOArSk4EpDG37UlOrHX9AepiwxVVE8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=rejBnJm5VPnPwJixHXNKoh6ESVI3dl/HzrUTe8Qpcze1fFcmLmXE2pTwypYa3hf+C
 z91RzTxUaRoxtnPnhE4YMpPPoPWDcaz5ttcHlpL9BUEeLkjEcB303uz/IYOcW36Nc6
 cvSBsoj2JF6RIpOO/NDYAUdEdlmOFCl/WbaDEu2EXiFNSFcL8FqboOo8JbUN2mccmB
 ZlDzoG3P8aEYF2cFdK4Jg2HyDreq07tyWyAifPNhsAuPcGWJCJ2klvHxxExuzaJa3h
 DKVFugQWdT9nMZntK3uLq0IpxgWDwjoy7nZNGraxoKRfc/9YMUi4t/3+uc6JJytcGr
 A/wpPaCdIt0Hw==
Message-ID: <d4106e72-8a88-42d4-9300-233751e239bb@kernel.org>
Date: Thu, 5 Sep 2024 09:29:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000007dfbdb061fa35855@google.com>
Content-Language: en-US
In-Reply-To: <0000000000007dfbdb061fa35855@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz fix: f2fs: atomic: fix to forbid dio in atomic_file On
 2024/8/14 19:51, syzbot wrote: > Hello, > > syzbot found the following issue
 on: > > HEAD commit: 9e6869691724 Add linux-next specific files for 20240812
 > git tree: linux-next > console+strace: ht [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm1K4-0007Ci-3s
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_ioc_start_atomic_write
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

#syz fix: f2fs: atomic: fix to forbid dio in atomic_file

On 2024/8/14 19:51, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1431e405980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
> dashboard link: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=120ed77d980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130e0ef3980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/08b48c782593/mount_0.gz
> 
> The issue was bisected to:
> 
> commit 374a8881ce4ccf787f5381a39f825cb17a3f6b14
> Author: Chao Yu <chao@kernel.org>
> Date:   Tue Jun 25 03:13:51 2024 +0000
> 
>      f2fs: atomic: fix to forbid dio in atomic_file
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10741429980000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12741429980000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14741429980000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
> Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
> 
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
> syz-executor312: attempt to access beyond end of device
> loop0: rw=10241, sector=45096, nr_sectors = 8 limit=40427
> ================================================
> WARNING: lock held when returning to user space!
> 6.11.0-rc3-next-20240812-syzkaller #0 Not tainted
> ------------------------------------------------
> syz-executor312/5227 is leaving the kernel with locks still held!
> 1 lock held by syz-executor312/5227:
>   #0: ffff8880695aa0e0 (&fi->i_gc_rwsem[READ]){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
>   #0: ffff8880695aa0e0 (&fi->i_gc_rwsem[READ]){+.+.}-{3:3}, at: f2fs_ioc_start_atomic_write+0x2ed/0xac0 fs/f2fs/file.c:2163
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

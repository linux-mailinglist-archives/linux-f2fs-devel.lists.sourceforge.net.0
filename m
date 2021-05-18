Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D1387B17
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 16:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lj0gQ-0006GU-PU; Tue, 18 May 2021 14:26:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lj0gP-0006GG-TP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 14:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X7glS4Um8DDU9GQT6kyLIBtRlWx9+W4AN0iErbGmz38=; b=TdCPRT5DdYib7FYP60dTaV+OBE
 CXcXM1sJXKpiNJvyIBCq9EDV67wT8mC/38V2G4bz6VpeGZeb5nO3Y3jDzkzsP2/dCa1UWEhoEnjJq
 kYTcRmcHcSnuDxPXC9ZuKMPsKUac10XKOZOYl3g3c3lcKaK/RpBOj7IRJ8bm2QPlPssA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X7glS4Um8DDU9GQT6kyLIBtRlWx9+W4AN0iErbGmz38=; b=T50a2fmxVLHl8gawatxu6lqUGj
 eaH3VZ9hipvoW7kd2qT3KlFkr845eT8+jzpfCzcs0Ukato6ELgihoZ0qMhWhk6Ua16Q/hp9WyDnM9
 1fi65MhZCp2sD1gkWsihDzh/iLfx5DdeiXVAvGXW9FJ7Pu1j6fsbD0VYn2d4XIKVI6HI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lj0gM-0006AX-21
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 14:26:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 813EB600EF;
 Tue, 18 May 2021 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621348000;
 bh=H+LpGHGJlRYz2tRcV7bbh09+uY7GwLjHe4fZgcsXyN8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tTdCA2GmNgDx9sEllVfh5Q0PIHNdgPua2UYLB9far2mvxs0+nwJdE/tKo4iVvLlu/
 8ITUWpwQ/d1RPDrGECIGwXJx4tkOcj0PKsYdetB3kjY/P5V6fkxBJrvo30xrp2MQIH
 f3RZqsWex9NZrYjOLLPsKXDpEtK3hJsjqq8q9lyc93bRkMWx8J0kqKAhlT9Xp5ufVo
 RFRu1Ns2wj5e9xcuVotoAItmwiBujNNLgLwn8JKdRcq3KmvCiybuWphbhAU2pITgve
 weCvnlidH5wjOUvJU18Iy/O28Fb4c0GPfKHGRbz56NkAgvl7/Mxx7tmz6aNGr/DnmF
 zWdcxfemVSQog==
To: Marco Elver <elver@google.com>, linux-f2fs-devel@lists.sourceforge.net
References: <0000000000003f654905c168b09d@google.com>
 <CACT4Y+Zi_femntmu0qtUz1q1gbxs-0VNrLUULzY1bd+hrBngHA@mail.gmail.com>
 <CANpmjNPAKrwrqnsJHMmZTFZwZoTCPEj_DHZ1ecgMci3Pd8JjEg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <8ca64b7f-efd4-0d4a-3235-0b2a4755d8d6@kernel.org>
Date: Tue, 18 May 2021 22:26:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANpmjNPAKrwrqnsJHMmZTFZwZoTCPEj_DHZ1ecgMci3Pd8JjEg@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lj0gM-0006AX-21
Subject: Re: [f2fs-dev] [syzbot] KFENCE: use-after-free in kmem_cache_destroy
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
Cc: syzbot <syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, zhuangyi1@huawei.com, jaegeuk@kernel.org,
 Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Macro,

I've figured out a patch for this issue.

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=cad83c968c2ebe97905f900326988ed37146c347

Thanks,

On 2021/5/18 19:14, Marco Elver wrote:
> +Cc more people who recently touched f2fs
> 
> On Mon, 3 May 2021 at 10:27, 'Dmitry Vyukov' via syzkaller-bugs
> <syzkaller-bugs@googlegroups.com> wrote:
>> On Mon, May 3, 2021 at 10:24 AM syzbot <syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com> wrote:
>>>
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    d2b6f8a1 Merge tag 'xfs-5.13-merge-3' of git://git.kernel...
>>> git tree:       upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15f19ca5d00000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=53fdf14defd48c56
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=9d90dad32dd9727ed084
>>> compiler:       Debian clang version 11.0.1-2
>>>
>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com
>>
>> This looks like a bug in F2FS.
>> Interestingly this was detected by ARM MTE before but was
>> mis-root-caused I think:
>> https://lore.kernel.org/lkml/0000000000008d396205b9e4adee@google.com/
>> This can't be detected by KASAN directly because it doesn't instrument
>> mm/slab*. This can only be detected by MTE/KFENCE.
>>
>>> ==================================================================
>>> BUG: KFENCE: use-after-free write in kmem_cache_destroy+0x1f/0x120 mm/slab_common.c:486
>>>
>>> Use-after-free write at 0xffff88823bc16040 (in kfence-#10):
>>>   kmem_cache_destroy+0x1f/0x120 mm/slab_common.c:486
>>>   f2fs_recover_fsync_data+0x75b0/0x8380 fs/f2fs/recovery.c:869
> 
> This looks like a double-kmem_cache_destroy of fsync_entry_slab in the
> f2fs code. But looking at this code briefly, I couldn't say what the
> fix would be.
> 
>>>   f2fs_fill_super+0x9393/0xa420 fs/f2fs/super.c:3945
>>>   mount_bdev+0x26c/0x3a0 fs/super.c:1367
>>>   legacy_get_tree+0xea/0x180 fs/fs_context.c:592
>>>   vfs_get_tree+0x86/0x270 fs/super.c:1497
>>>   do_new_mount fs/namespace.c:2905 [inline]
>>>   path_mount+0x196f/0x2be0 fs/namespace.c:3235
>>>   do_mount fs/namespace.c:3248 [inline]
>>>   __do_sys_mount fs/namespace.c:3456 [inline]
>>>   __se_sys_mount+0x2f9/0x3b0 fs/namespace.c:3433
>>>   do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> kfence-#10 [0xffff88823bc16000-0xffff88823bc160df, size=224, cache=kmem_cache] allocated by task 15453:
>>>   kmem_cache_zalloc include/linux/slab.h:676 [inline]
>>>   create_cache mm/slab_common.c:247 [inline]
>>>   kmem_cache_create_usercopy+0x12a/0x2f0 mm/slab_common.c:350
>>>   kmem_cache_create+0xf/0x20 mm/slab_common.c:405
>>>   f2fs_kmem_cache_create fs/f2fs/f2fs.h:2463 [inline]
>>>   f2fs_recover_fsync_data+0x1f0/0x8380 fs/f2fs/recovery.c:790
>>>   f2fs_fill_super+0x9393/0xa420 fs/f2fs/super.c:3945
>>>   mount_bdev+0x26c/0x3a0 fs/super.c:1367
>>>   legacy_get_tree+0xea/0x180 fs/fs_context.c:592
>>>   vfs_get_tree+0x86/0x270 fs/super.c:1497
>>>   do_new_mount fs/namespace.c:2905 [inline]
>>>   path_mount+0x196f/0x2be0 fs/namespace.c:3235
>>>   do_mount fs/namespace.c:3248 [inline]
>>>   __do_sys_mount fs/namespace.c:3456 [inline]
>>>   __se_sys_mount+0x2f9/0x3b0 fs/namespace.c:3433
>>>   do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> freed by task 15448:
>>>   kobject_cleanup+0x1c9/0x280 lib/kobject.c:705
>>>   shutdown_cache mm/slab_common.c:463 [inline]
>>>   kmem_cache_destroy+0x93/0x120 mm/slab_common.c:492
>>>   f2fs_recover_fsync_data+0x75b0/0x8380 fs/f2fs/recovery.c:869
>>>   f2fs_fill_super+0x9393/0xa420 fs/f2fs/super.c:3945
>>>   mount_bdev+0x26c/0x3a0 fs/super.c:1367
>>>   legacy_get_tree+0xea/0x180 fs/fs_context.c:592
>>>   vfs_get_tree+0x86/0x270 fs/super.c:1497
>>>   do_new_mount fs/namespace.c:2905 [inline]
>>>   path_mount+0x196f/0x2be0 fs/namespace.c:3235
>>>   do_mount fs/namespace.c:3248 [inline]
>>>   __do_sys_mount fs/namespace.c:3456 [inline]
>>>   __se_sys_mount+0x2f9/0x3b0 fs/namespace.c:3433
>>>   do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> CPU: 0 PID: 15453 Comm: syz-executor.0 Not tainted 5.12.0-syzkaller #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>>> RIP: 0010:kmem_cache_destroy+0x1f/0x120 mm/slab_common.c:488
>>> Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 48 85 ff 0f 84 09 01 00 00 41 57 41 56 53 48 89 fb 48 c7 c7 b8 07 dc 8c 31 f6 e8 b1 c3 00 08 <ff> 4b 40 0f 85 c0 00 00 00 48 89 df e8 20 a2 14 00 48 89 df e8 18
>>> RSP: 0018:ffffc900030af320 EFLAGS: 00010286
>>> RAX: 0000000000000000 RBX: ffff88823bc16000 RCX: 0000000000000001
>>> RDX: 0000000000000001 RSI: 0000000000000008 RDI: 0000000000000001
>>> RBP: ffffc900030af870 R08: dffffc0000000000 R09: fffffbfff19b80f8
>>> R10: fffffbfff19b80f8 R11: 0000000000000000 R12: ffff88808c3a4000
>>> R13: dffffc0000000000 R14: 0000000000000000 R15: 1ffff92000615eb0
>>> FS:  00007f60a5228700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: ffff88823bc16040 CR3: 000000001ccd8000 CR4: 00000000001526f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> Call Trace:
>>>   f2fs_recover_fsync_data+0x75b0/0x8380 fs/f2fs/recovery.c:869
>>>   f2fs_fill_super+0x9393/0xa420 fs/f2fs/super.c:3945
>>>   mount_bdev+0x26c/0x3a0 fs/super.c:1367
>>>   legacy_get_tree+0xea/0x180 fs/fs_context.c:592
>>>   vfs_get_tree+0x86/0x270 fs/super.c:1497
>>>   do_new_mount fs/namespace.c:2905 [inline]
>>>   path_mount+0x196f/0x2be0 fs/namespace.c:3235
>>>   do_mount fs/namespace.c:3248 [inline]
>>>   __do_sys_mount fs/namespace.c:3456 [inline]
>>>   __se_sys_mount+0x2f9/0x3b0 fs/namespace.c:3433
>>>   do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> RIP: 0033:0x467b1a
>>> Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
>>> RSP: 002b:00007f60a5227fa8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
>>> RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 0000000000467b1a
>>> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f60a5228000
>>> RBP: 00007f60a5228040 R08: 00007f60a5228040 R09: 0000000020000000
>>> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
>>> R13: 0000000020000100 R14: 00007f60a5228000 R15: 0000000020014b00
>>> ==================================================================
>>>
>>>
>>> ---
>>> This report is generated by a bot. It may contain errors.
>>> See https://goo.gl/tpsmEJ for more information about syzbot.
>>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>>
>>> syzbot will keep track of this issue. See:
>>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

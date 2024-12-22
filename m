Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1199FA5D3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2024 14:38:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPMAA-0001aB-TG;
	Sun, 22 Dec 2024 13:38:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tPMA8-0001a4-No
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHnJXxiAsKRENu6GMwMHw0rcz7p/E0o+5kfk3d3o7fo=; b=fJaiEfgHtYAIIAu2F7VRpX5lD8
 4mBvlNPhiN+KXhlmzejt6j7cDmR8W+AgHESVbYcMAmL3tGhJcsC7xX3ysBqSAPdEbpxbZwth3W4Pq
 B5ynBg1I3ilTfXnDXk1k5OLXoLQF2Q2+3j5WYOTu/ssrgaQu37zesrHvKbQ1Xr58Bxnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hHnJXxiAsKRENu6GMwMHw0rcz7p/E0o+5kfk3d3o7fo=; b=Pqva7PRJq1bZJCl61nVWGYcVcp
 fHPfTgtYXbN3NC9PdjlyS8ZfvjWSfCjkOpoESvWFl8VucwUVr0WJGGPB1rFSZrSkC/kAL8kJVmmJn
 GCUM9WGomClkuWkW+SpNEEbV2jl5wd5Aqj/IVxU411XpcoxPYIrSM980bLh1B+Rzi0as=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPMA7-0002Vz-K2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59E1A5C45F9;
 Sun, 22 Dec 2024 13:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD0CC4CECD;
 Sun, 22 Dec 2024 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734874701;
 bh=6/dGTxmiKyxfGKy1d9zptGKy8mVdVrN4wN/M4n3W21E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Zt3UskQ9fRdd006K++sN1fMmQtGBKsy82alEuPgIOW+kcIrplobJCHSf2e/LHTpCb
 fc13Au6nkmdUwS2kiIT7l71tGh0FRqHr+j5sE7a/cOkAPaonbgsIllwjZ8rkmnwrgf
 Wq4oOGoD4jOfkEYXdSPPt/jPSxXzo9N5EcvTZeqpPHXckTl5n3ZbUf7WKnzics9Qr/
 I+IJjJLDIJcV/+G8f2xs2v5bLRWrKUi47ZGuPK/D7+pCKkk2ilWhyC//QqH+TlnqyR
 GPUfubVhTRfGygyXZN+ae2LViugzyucdXn0MsnR5QbrE5fxEhn2besOKUIwvIMH08U
 8lPoFIYSc+BzA==
Message-ID: <136d1e9b-cc8c-4c21-b7f9-abed5741d5e1@kernel.org>
Date: Sun, 22 Dec 2024 21:38:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6764cecc.050a0220.1bfc9e.0001.GAE@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <6764cecc.050a0220.1bfc9e.0001.GAE@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2024/12/20 9:56, syzbot wrote: > Hello, > > syzbot found the following
 issue on: > > HEAD commit: 2e7aff49b5da Merge branches 'for-next/core' and
 'for-next/.. > git tree: git://git.kernel.org/pub/s [...] 
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
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tPMA7-0002Vz-K2
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 inline_xattr_addr
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

#syz test: https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

On 2024/12/20 9:56, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=11b77344580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
> dashboard link: https://syzkaller.appspot.com/bug?extid=e4876215632c2d23b481
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1121d4f8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13511730580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/57bb66f25be5/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Failed to enable quota tracking (type=1, err=-22). Please run fsck to fix.
> F2FS-fs (loop0): Cannot turn on quotas: error -22
> F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
> ------------[ cut here ]------------
> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
> index 18446744073709500059 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call trace:
>   show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>   dump_stack+0x1c/0x28 lib/dump_stack.c:129
>   ubsan_epilogue lib/ubsan.c:231 [inline]
>   __ubsan_handle_out_of_bounds+0xf8/0x148 lib/ubsan.c:429
>   inline_xattr_addr+0x524/0x530 fs/f2fs/f2fs.h:3292
>   read_inline_xattr fs/f2fs/xattr.c:289 [inline]
>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>   f2fs_getxattr+0x5b4/0x1064 fs/f2fs/xattr.c:533
>   f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>   __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>   smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>   smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>   security_d_instantiate+0x100/0x204 security/security.c:4070
>   d_splice_alias+0x70/0x310 fs/dcache.c:3001
>   f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>   lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>   filename_create+0x230/0x468 fs/namei.c:4081
>   do_mkdirat+0xac/0x574 fs/namei.c:4326
>   __do_sys_mkdirat fs/namei.c:4349 [inline]
>   __se_sys_mkdirat fs/namei.c:4347 [inline]
>   __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> ---[ end trace ]---
> ==================================================================
> BUG: KASAN: slab-use-after-free in read_inline_xattr fs/f2fs/xattr.c:291 [inline]
> BUG: KASAN: slab-use-after-free in lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
> BUG: KASAN: slab-use-after-free in f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
> Read of size 209920 at addr ffff0000d7f1ebd4 by task syz-executor883/6410
> 
> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call trace:
>   show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0x198/0x538 mm/kasan/report.c:489
>   kasan_report+0xd8/0x138 mm/kasan/report.c:602
>   kasan_check_range+0x268/0x2a8 mm/kasan/generic.c:189
>   __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>   read_inline_xattr fs/f2fs/xattr.c:291 [inline]
>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>   f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
>   f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>   __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>   smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>   smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>   security_d_instantiate+0x100/0x204 security/security.c:4070
>   d_splice_alias+0x70/0x310 fs/dcache.c:3001
>   f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>   lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>   filename_create+0x230/0x468 fs/namei.c:4081
>   do_mkdirat+0xac/0x574 fs/namei.c:4326
>   __do_sys_mkdirat fs/namei.c:4349 [inline]
>   __se_sys_mkdirat fs/namei.c:4347 [inline]
>   __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> Allocated by task 6343:
>   kasan_save_stack mm/kasan/common.c:47 [inline]
>   kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>   kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:568
>   unpoison_slab_object mm/kasan/common.c:319 [inline]
>   __kasan_slab_alloc+0x74/0x8c mm/kasan/common.c:345
>   kasan_slab_alloc include/linux/kasan.h:250 [inline]
>   slab_post_alloc_hook mm/slub.c:4104 [inline]
>   slab_alloc_node mm/slub.c:4153 [inline]
>   kmem_cache_alloc_noprof+0x254/0x410 mm/slub.c:4160
>   getname_flags+0xcc/0x4b4 fs/namei.c:139
>   getname+0x24/0x34 fs/namei.c:223
>   do_sys_openat2+0xd0/0x1b8 fs/open.c:1396
>   do_sys_open fs/open.c:1417 [inline]
>   __do_sys_openat fs/open.c:1433 [inline]
>   __se_sys_openat fs/open.c:1428 [inline]
>   __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> Freed by task 6343:
>   kasan_save_stack mm/kasan/common.c:47 [inline]
>   kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>   kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:582
>   poison_slab_object mm/kasan/common.c:247 [inline]
>   __kasan_slab_free+0x64/0x8c mm/kasan/common.c:264
>   kasan_slab_free include/linux/kasan.h:233 [inline]
>   slab_free_hook mm/slub.c:2338 [inline]
>   slab_free mm/slub.c:4598 [inline]
>   kmem_cache_free+0x198/0x554 mm/slub.c:4700
>   putname+0x130/0x184 fs/namei.c:296
>   do_sys_openat2+0x164/0x1b8 fs/open.c:1410
>   do_sys_open fs/open.c:1417 [inline]
>   __do_sys_openat fs/open.c:1433 [inline]
>   __se_sys_openat fs/open.c:1428 [inline]
>   __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> The buggy address belongs to the object at ffff0000d7f1e600
>   which belongs to the cache names_cache of size 4096
> The buggy address is located 1492 bytes inside of
>   freed 4096-byte region [ffff0000d7f1e600, ffff0000d7f1f600)
> 
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x117f18
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
> head: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
> head: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
> head: 05ffc00000000003 fffffdffc35fc601 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffff0000d7f1ea80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff0000d7f1eb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffff0000d7f1eb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                   ^
>   ffff0000d7f1ec00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff0000d7f1ec80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
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

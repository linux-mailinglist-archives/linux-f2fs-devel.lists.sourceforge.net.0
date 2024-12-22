Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A76829FA5D2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2024 14:38:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPMAD-0005gh-W6;
	Sun, 22 Dec 2024 13:38:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3TxZoZwkbAF4OUVG6HHAN6LLE9.CKKCHAQOAN8KJPAJP.8KI@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPMAA-0005ga-Ia for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mO1sE7RMSoufrcCGDj/kWmsZJJx0Xlm3ogCwiIQMVlw=; b=IPjYPZ/RrDtBWFG/gBrXhLjtWU
 TlKNrJZYtZG0VZ9r/NTTdnoALRe1ZSREgOmh9cUADYL8QQr6qT80KH3q5TwPCn358BpX+sBXz1E3X
 wHyR4daDs/DFMznSJ40oxTzOTvh94FN/C7sp09hvndO7oMVGNpROS0y7Pf6uxed4VmiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mO1sE7RMSoufrcCGDj/kWmsZJJx0Xlm3ogCwiIQMVlw=; b=k
 RnA1MxKTuvpcWtwsCOTuIZj2JOvyecTj5hzCgM1gmcLEImRUVGlJR/mF0LJB6XvK6b4Ob3tdOvJTq
 GE9WHb5Rd3dLgdHGe83QJHu1VVE9LUTTEwfQsrqA1z3X4HacMPK+9tymAdNSyaxHFfNE3mHpcKMlx
 fLpYljOVMjGzCT/w=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPMA8-0002W7-TE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 13:38:29 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3a81570ea43so30982585ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Dec 2024 05:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734874703; x=1735479503;
 h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mO1sE7RMSoufrcCGDj/kWmsZJJx0Xlm3ogCwiIQMVlw=;
 b=aTz0tWh5imE/SRJytYe/c5aJlrFa3MmVdxzWjRSDiF7mI/eJAa5HHgsFJ8F83pc1O3
 eYthAOZ2vejH6OKXjccjxJo5ESOAxE9T8pLyDFj7DXykSfzXEJl48KyEiYQF1jE1QmXF
 vBPfHbE2rch+yNHIInciX0szfxdJQA1M/AiTBE01Hh0+NYD1FixpZXPlBghv+R3HO0gV
 7sUtDFtu+JNQ5gk9fKicKLiGy5RkYwfrtVAhgfdyicVs2CkCPSpN9LTbyL0f1NWbZrr6
 W8i/Sfws4Wma51u5WC2H1s9LGGFPgEGPUW+uM8fHvwawzuA2Amyjd+q7v0n9rKngo7VT
 wqYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy2pwZzTOibeDaDo8ll9XkdageJMBDD0xj8uFdowFTZOUkjvsWyy66aQ2Bw7xtsEa49bc/FUoarvr8CEYQqhOB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzjafDhPk3jIv/7fxoKjlA9mW1mAVH5Z8byFFDQ8bSPjDKC+Q1t
 3hJpRJVajEEmt3M+u8gx2FDeCR4Wz+XVhvVrAIP8Rpgl8BySDFH1NK1UtwG0xPtOQ++uD0sXMZb
 auNyLKXUHB0K6rt/2awLt6otiVzkN9qfImAQN66FmRLrSixn15F/zkOQ=
X-Google-Smtp-Source: AGHT+IEd8Y6ZGcCVQEun9Q9uRR7/XFm4MoXClH40B11p4TUJeaAqfVPGknY92+yY626a0zzbY7hEcmK9wQx5EyUfATEEwUY/niSo
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2e:b0:3a7:91a4:c752 with SMTP id
 e9e14a558f8ab-3c2d5919b63mr104703325ab.23.1734874703164; Sun, 22 Dec 2024
 05:38:23 -0800 (PST)
Date: Sun, 22 Dec 2024 05:38:23 -0800
In-Reply-To: <136d1e9b-cc8c-4c21-b7f9-abed5741d5e1@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6768164f.050a0220.25abdd.014a.GAE@google.com>
From: syzbot <syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com>
To: chao@kernel.org
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > #syz test:
 https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip "https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git"
 does not look like a valid git repo address. 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
X-Headers-End: 1tPMA8-0002W7-TE
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
Cc: jaegeuk@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> #syz test: https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

"https://https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git" does not look like a valid git repo address.

>
> On 2024/12/20 9:56, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>> console output: https://syzkaller.appspot.com/x/log.txt?x=11b77344580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
>> dashboard link: https://syzkaller.appspot.com/bug?extid=e4876215632c2d23b481
>> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
>> userspace arch: arm64
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1121d4f8580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13511730580000
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz
>> mounted in repro: https://storage.googleapis.com/syzbot-assets/57bb66f25be5/mount_0.gz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com
>> 
>> F2FS-fs (loop0): Failed to enable quota tracking (type=1, err=-22). Please run fsck to fix.
>> F2FS-fs (loop0): Cannot turn on quotas: error -22
>> F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
>> ------------[ cut here ]------------
>> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
>> index 18446744073709500059 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
>> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
>> Call trace:
>>   show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>>   __dump_stack lib/dump_stack.c:94 [inline]
>>   dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>>   dump_stack+0x1c/0x28 lib/dump_stack.c:129
>>   ubsan_epilogue lib/ubsan.c:231 [inline]
>>   __ubsan_handle_out_of_bounds+0xf8/0x148 lib/ubsan.c:429
>>   inline_xattr_addr+0x524/0x530 fs/f2fs/f2fs.h:3292
>>   read_inline_xattr fs/f2fs/xattr.c:289 [inline]
>>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>>   f2fs_getxattr+0x5b4/0x1064 fs/f2fs/xattr.c:533
>>   f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>>   __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>>   smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>>   smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>>   security_d_instantiate+0x100/0x204 security/security.c:4070
>>   d_splice_alias+0x70/0x310 fs/dcache.c:3001
>>   f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>>   lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>>   filename_create+0x230/0x468 fs/namei.c:4081
>>   do_mkdirat+0xac/0x574 fs/namei.c:4326
>>   __do_sys_mkdirat fs/namei.c:4349 [inline]
>>   __se_sys_mkdirat fs/namei.c:4347 [inline]
>>   __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> ---[ end trace ]---
>> ==================================================================
>> BUG: KASAN: slab-use-after-free in read_inline_xattr fs/f2fs/xattr.c:291 [inline]
>> BUG: KASAN: slab-use-after-free in lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>> BUG: KASAN: slab-use-after-free in f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
>> Read of size 209920 at addr ffff0000d7f1ebd4 by task syz-executor883/6410
>> 
>> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
>> Call trace:
>>   show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>>   __dump_stack lib/dump_stack.c:94 [inline]
>>   dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>>   print_address_description mm/kasan/report.c:378 [inline]
>>   print_report+0x198/0x538 mm/kasan/report.c:489
>>   kasan_report+0xd8/0x138 mm/kasan/report.c:602
>>   kasan_check_range+0x268/0x2a8 mm/kasan/generic.c:189
>>   __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>>   read_inline_xattr fs/f2fs/xattr.c:291 [inline]
>>   lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>>   f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
>>   f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>>   __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>>   smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>>   smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>>   security_d_instantiate+0x100/0x204 security/security.c:4070
>>   d_splice_alias+0x70/0x310 fs/dcache.c:3001
>>   f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>>   lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>>   filename_create+0x230/0x468 fs/namei.c:4081
>>   do_mkdirat+0xac/0x574 fs/namei.c:4326
>>   __do_sys_mkdirat fs/namei.c:4349 [inline]
>>   __se_sys_mkdirat fs/namei.c:4347 [inline]
>>   __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> 
>> Allocated by task 6343:
>>   kasan_save_stack mm/kasan/common.c:47 [inline]
>>   kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>>   kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:568
>>   unpoison_slab_object mm/kasan/common.c:319 [inline]
>>   __kasan_slab_alloc+0x74/0x8c mm/kasan/common.c:345
>>   kasan_slab_alloc include/linux/kasan.h:250 [inline]
>>   slab_post_alloc_hook mm/slub.c:4104 [inline]
>>   slab_alloc_node mm/slub.c:4153 [inline]
>>   kmem_cache_alloc_noprof+0x254/0x410 mm/slub.c:4160
>>   getname_flags+0xcc/0x4b4 fs/namei.c:139
>>   getname+0x24/0x34 fs/namei.c:223
>>   do_sys_openat2+0xd0/0x1b8 fs/open.c:1396
>>   do_sys_open fs/open.c:1417 [inline]
>>   __do_sys_openat fs/open.c:1433 [inline]
>>   __se_sys_openat fs/open.c:1428 [inline]
>>   __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> 
>> Freed by task 6343:
>>   kasan_save_stack mm/kasan/common.c:47 [inline]
>>   kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>>   kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:582
>>   poison_slab_object mm/kasan/common.c:247 [inline]
>>   __kasan_slab_free+0x64/0x8c mm/kasan/common.c:264
>>   kasan_slab_free include/linux/kasan.h:233 [inline]
>>   slab_free_hook mm/slub.c:2338 [inline]
>>   slab_free mm/slub.c:4598 [inline]
>>   kmem_cache_free+0x198/0x554 mm/slub.c:4700
>>   putname+0x130/0x184 fs/namei.c:296
>>   do_sys_openat2+0x164/0x1b8 fs/open.c:1410
>>   do_sys_open fs/open.c:1417 [inline]
>>   __do_sys_openat fs/open.c:1433 [inline]
>>   __se_sys_openat fs/open.c:1428 [inline]
>>   __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>>   invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>>   el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>>   do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>>   el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>> 
>> The buggy address belongs to the object at ffff0000d7f1e600
>>   which belongs to the cache names_cache of size 4096
>> The buggy address is located 1492 bytes inside of
>>   freed 4096-byte region [ffff0000d7f1e600, ffff0000d7f1f600)
>> 
>> The buggy address belongs to the physical page:
>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x117f18
>> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>> flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
>> page_type: f5(slab)
>> raw: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
>> raw: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
>> head: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
>> head: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
>> head: 05ffc00000000003 fffffdffc35fc601 ffffffffffffffff 0000000000000000
>> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected
>> 
>> Memory state around the buggy address:
>>   ffff0000d7f1ea80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>   ffff0000d7f1eb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>> ffff0000d7f1eb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                                                   ^
>>   ffff0000d7f1ec00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>   ffff0000d7f1ec80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ==================================================================
>> 
>> 
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>> 
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> 
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>> 
>> If you want syzbot to run the reproducer, reply with:
>> #syz test: git://repo/address.git branch-or-commit-hash
>> If you attach or paste a git patch, syzbot will apply it before testing.
>> 
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>> 
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>> 
>> If you want to undo deduplication, reply with:
>> #syz undup
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

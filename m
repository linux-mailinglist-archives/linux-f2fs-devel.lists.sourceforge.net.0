Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F362A03C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 12:11:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYSJS-0004rg-DB; Fri, 30 Oct 2020 11:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kitestramuort@autistici.org>) id 1kYSJP-0004rX-No
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 11:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mQj8uqM57Ml8GbR0qQVT1X+71RoBeD6Dg4CIaJg0gsA=; b=NzvrMMCK9axn5DShoDgQ0TjATm
 iuOvmjhb9czcoLC86G0GXm/oeKy+ADIzJhxaP3D//OGOr9tjuyVn+MlBvwwF24JBgAMCn49YqwFpw
 g0Y+2k9HfFare0NmXKVXZUt6p5DPt20gsOhQ4BPZQWRrAfenXiETXgllGcBO3ICJnW8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mQj8uqM57Ml8GbR0qQVT1X+71RoBeD6Dg4CIaJg0gsA=; b=MbsykvY3R+lGyBdpX5GeXx9F5G
 jBLx6rHZD4IPPrDHQ8xQLvRDK8B7NhH1WroChvUsEhSSdN/UHsGpiffhiMfjtQ3Ah9lGYr1Kvsjql
 yjMr60KBbL+jl8z3dtzFf9spHAla5xnMRXBWUIsyvAgAXK+5OjyRfWba5z07T2XMHV/0=;
Received: from confino.investici.org ([212.103.72.250])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYSJH-002Qtm-9c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 11:11:15 +0000
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 4CN03d5pxBz12bQ;
 Fri, 30 Oct 2020 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
 s=stigmate; t=1604056253;
 bh=mQj8uqM57Ml8GbR0qQVT1X+71RoBeD6Dg4CIaJg0gsA=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=RZ68GKoX5LWuam1f52LSsXt5//dBd0i8v8YmgOQXny8MH6UYDU6NX2bDIfKhakIjF
 SOvX49Jp/a+XtQ2rCxNKjg2IxYfZqnYsX/jDHIc+AE8EhyUf3ZMiKv/aVL2VZBsQmX
 x1BqHujZM8faMsvH9Z9gL970zF8NI936DZCZzNF8=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: kitestramuort@autistici.org) by localhost (Postfix)
 with ESMTPSA id 4CN03d16ylz110R; 
 Fri, 30 Oct 2020 11:10:53 +0000 (UTC)
Message-ID: <5d700f2a32e92ccef7e5925833c3893cc9bc0d2d.camel@autistici.org>
From: kitestramuort <kitestramuort@autistici.org>
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Oct 2020 12:10:51 +0100
In-Reply-To: <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
 <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
 <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
 <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [212.103.72.250 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.103.72.250 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kYSJH-002Qtm-9c
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 2020-10-30 at 17:06 +0800, Chao Yu wrote:
> On 2020/10/30 16:56, kitestramuort wrote:
> 
> 
> It doesn't print function name in callstack, could you check your
> linker option, I guess it needs to add -rdynamic option? not sure.

Apologies. The correct call trace and fsck follow. I just realised that
the error happens the moment I open Firefox

F2FS-fs (nvme0n1p4): access invalid blkaddr:1598541474
[   25.725898] ------------[ cut here ]------------
[   25.725903] WARNING: CPU: 6 PID: 2018 at
f2fs_is_valid_blkaddr+0x23a/0x250
[   25.725904] Modules linked in: r8168(O)
[   25.725908] CPU: 6 PID: 2018 Comm: Cache2 I/O Tainted: G S   U     O
5.10.0-rc1-S #10
[   25.725909] Hardware name: 51NB X213s/X213s, BIOS 4.12-3653-
gb544fe48af-dirty 10/29/2020
[   25.725912] RIP: 0010:f2fs_is_valid_blkaddr+0x23a/0x250
[   25.725913] Code: 01 c8 39 c6 73 09 41 8b 42 5c e9 26 fe ff ff 89 f2
48 c7 c6 ad f1 5c 9a 48 89 3c 24 e8 4a 62 7d 00 48 8b 3c 24 f0 80 4f 48
04 <0f> 0b 31 c0 e9 af fe ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 66 90
[   25.725915] RSP: 0018:ffffb43302cbf8e0 EFLAGS: 00010206
[   25.725916] RAX: 0000000000000036 RBX: 0000000000000369 RCX:
0000000000000000
[   25.725917] RDX: ffff96592f5a5920 RSI: ffff96592f5977c0 RDI:
ffff9655c0cdf000
[   25.725918] RBP: ffff9655c2334700 R08: ffffffff9aa14c48 R09:
00000000ffffffea
[   25.725919] R10: 00000000ffffbfff R11: 80000000ffffc000 R12:
0000000000000001
[   25.725919] R13: ffff9656063e95b8 R14: 0000000000000003 R15:
0000000000001000
[   25.725921] FS:  00007f7cf1930640(0000) GS:ffff96592f580000(0000)
knlGS:0000000000000000
[   25.725922] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   25.725923] CR2: 00007f7cef899485 CR3: 00000001028a4006 CR4:
00000000001706e0
[   25.725923] Call Trace:
[   25.725927]  ? f2fs_llseek+0x204/0x620
[   25.725929]  ? ovl_copy_up_data+0x14f/0x200
[   25.725931]  ? ovl_copy_up_inode+0x174/0x1e0
[   25.725933]  ? ovl_copy_up_one+0xa22/0xdf0
[   25.725936]  ? ovl_copy_up_flags+0xa6/0xf0
[   25.725938]  ? ovl_aio_cleanup_handler+0xd0/0xd0
[   25.725939]  ? ovl_maybe_copy_up+0x86/0xa0
[   25.725941]  ? ovl_open+0x22/0x80
[   25.725943]  ? do_dentry_open+0x136/0x350
[   25.725945]  ? path_openat+0xb7e/0xf40
[   25.725947]  ? __check_sticky+0x40/0x40
[   25.725948]  ? do_filp_open+0x70/0x100
[   25.725950]  ? __check_sticky+0x40/0x40
[   25.725951]  ? __check_sticky+0x40/0x40
[   25.725953]  ? __x64_sys_openat+0x1db/0x2c0
[   25.725955]  ? do_syscall_64+0x2d/0x40
[   25.725957]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   25.725959] CPU: 6 PID: 2018 Comm: Cache2 I/O Tainted: G S   U     O
5.10.0-rc1-S #10
[   25.725959] Hardware name: 51NB X213s/X213s, BIOS 4.12-3653-
gb544fe48af-dirty 10/29/2020
[   25.725960] Call Trace:
[   25.725962]  ? dump_stack+0x58/0x6b
[   25.725964]  ? __warn.cold+0x24/0x74
[   25.725966]  ? f2fs_is_valid_blkaddr+0x23a/0x250
[   25.725968]  ? report_bug+0x136/0x170
[   25.725969]  ? handle_bug+0x3c/0x60
[   25.725971]  ? exc_invalid_op+0x18/0x150
[   25.725972]  ? asm_exc_invalid_op+0xf/0x20
[   25.725974]  ? f2fs_is_valid_blkaddr+0x23a/0x250
[   25.725976]  ? f2fs_llseek+0x204/0x620
[   25.725978]  ? ovl_copy_up_data+0x14f/0x200
[   25.725980]  ? ovl_copy_up_inode+0x174/0x1e0
[   25.725981]  ? ovl_copy_up_one+0xa22/0xdf0
[   25.725984]  ? ovl_copy_up_flags+0xa6/0xf0
[   25.725986]  ? ovl_aio_cleanup_handler+0xd0/0xd0
[   25.725987]  ? ovl_maybe_copy_up+0x86/0xa0
[   25.725989]  ? ovl_open+0x22/0x80
[   25.725990]  ? do_dentry_open+0x136/0x350
[   25.725991]  ? path_openat+0xb7e/0xf40
[   25.725993]  ? __check_sticky+0x40/0x40
[   25.725995]  ? do_filp_open+0x70/0x100
[   25.725996]  ? __check_sticky+0x40/0x40
[   25.725998]  ? __check_sticky+0x40/0x40
[   25.725999]  ? __x64_sys_openat+0x1db/0x2c0
[   25.726000]  ? do_syscall_64+0x2d/0x40
[   25.726001]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   25.726003] ---[ end trace 3ad187bffec8b173 ]---


and fsck dry run with the last version:

Info: Dry run
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 1692427663 (826380 MB)
Info: MKFS version
  "Linux version 4.20.0-arch1-1-ARCH (builduser@heftig-29859) (gcc
version 8.2.1 20181127 (GCC)) #1 SMP PREEMPT Mon Dec 24 03:00:40 UTC
2018"
Info: FSCK version
  from "Linux version 5.2.5-arch1-1-ARCH (builduser@heftig-118908) (gcc
version 9.1.0 (GCC)) #1 SMP PREEMPT Wed Jul 31 08:30:34 UTC 2019"
    to "Linux version 5.10.0-rc1-S (root@x210) (gcc (GCC) 10.2.0, GNU
ld (GNU Binutils) 2.35.1) #10 SMP PREEMPT Fri Oct 30 12:00:34 CET 2020"
Info: superblock features = 0 : 
Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
Info: total FS sectors = 1692427656 (826380 MB)
Info: CKPT version = 284790b
Info: checkpoint state = 55 :  crc fsck compacted_summary unmount

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x50c]
[FSCK] valid_block_count matching with CP             [Ok..]
[0x958a824]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x2bec75]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x2bec75]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x29f961]
[FSCK] free segment_count matched with CP             [Ok..] [0x180e2]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 108.720284 secs



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7297D98F37
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2019 11:21:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0jI1-0001P0-M9; Thu, 22 Aug 2019 09:21:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i0jHz-0001Oa-Cl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 09:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=joGQyvhqx5Im4OOgrUBymdl12Pf/EoWS6n8vX1lTgxQ=; b=lCtxwLIi81ryJ8muPTfQ1zZkCV
 XxUj47Dlpg8HRBGr8/VL4Pg3qg1Nc+Kdfk9zKPCloM0oHS5xpymcDoyH2ItjJp5HiDK2+Q6XFzXdh
 HUh4gjZN/rxtCsF0N3O6fOwgn6Hx702xx6llMTIFRu8y0/FwSkheDebgZnk287Zh/vx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=joGQyvhqx5Im4OOgrUBymdl12Pf/EoWS6n8vX1lTgxQ=; b=PfBRms+PdNJTizaAVWFsmt/guD
 6PWdrOqbO4R5sCXvxSMK4ZK3ZoOoEwWyFRQmVLzxcanyMmyRIp55CSQV3GP6lmf/RQu09PqiHRe1j
 vVHeX5vFN6fpenkNc3T3v6YcuXsIHBXxH08oafCnLNdkA2C4eUcwnHlQymImA8Pp4gmU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0jHw-00Bug3-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 09:21:50 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8ADB6F6B66A6FDAE5D66;
 Thu, 22 Aug 2019 17:21:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 22 Aug
 2019 17:21:36 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20190729174140.GA169027@gmail.com>
 <13d9a0eb-2c5f-25c8-9ebb-16815a178d8f@huawei.com>
 <20190818160353.GD1118@sol.localdomain>
 <83af6f67-a47e-759a-5418-93ee46226486@huawei.com>
Message-ID: <191192bd-a96d-fc5d-412f-4907b310c74e@huawei.com>
Date: Thu, 22 Aug 2019 17:21:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <83af6f67-a47e-759a-5418-93ee46226486@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0jHw-00Bug3-Fd
Subject: Re: [f2fs-dev] kernel BUG at fs/f2fs/segment.c:2391 during xfstest
 generic/204
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/22 16:29, Chao Yu wrote:
> Hi Eric,
> 
> I've figured out one patch for this issue, could you have a try?

Could you only check 204? I just hit deadlock in 051, not sure it is caused by
this patch.

> 
> Thanks,
> 
> On 2019/8/19 0:03, Eric Biggers wrote:
>> On Fri, Aug 16, 2019 at 04:37:35PM +0800, Chao Yu wrote:
>>> Hi Eric,
>>>
>>> Sorry for late reply...
>>>
>>> I only hit ENOSPC error:
>>>
>>> QA output created by 204
>>> line 82: echo: write error: No space left on device
>>>
>>> What is your mkfs/mount option?
>>>
>>
>> It's:
>>
>> MKFS_OPTIONS  -- /dev/vdc
>> MOUNT_OPTIONS -- -o acl,user_xattr /dev/vdc /vdc
>>
>> Here's the output from 'kvm-xfstests -c f2fs/default generic/204':
>>
>> KERNEL: kernel	5.3.0-rc4-xfstests-00142-g8fde2832bd0b #1 SMP Sun Aug 18 08:57:34 PDT 2019 x86_64
>> FSTESTVER: blktests	0ee7eba (Wed, 17 Apr 2019 14:41:39 -0700)
>> FSTESTVER: fio		fio-3.2 (Fri, 3 Nov 2017 15:23:49 -0600)
>> FSTESTVER: fsverity	2151209 (Fri, 28 Jun 2019 14:34:41 -0700)
>> FSTESTVER: quota		59b280e (Mon, 5 Feb 2018 16:48:22 +0100)
>> FSTESTVER: xfsprogs	v5.2.0-rc0-13-g189981e6 (Mon, 12 Aug 2019 10:34:57 -0700)
>> FSTESTVER: xfstests	v1.1.0-2641-g43d96649 (Mon, 12 Aug 2019 09:34:21 -0700)
>> FSTESTVER: xfstests-bld	b9e2900 (Mon, 29 Jul 2019 00:01:44 -0400)
>> FSTESTCFG: "f2fs/default"
>> FSTESTSET: "generic/204"
>> FSTESTEXC: ""
>> FSTESTOPT: "aex"
>> MNTOPTS: ""
>> CPUS: "2"
>> MEM: "1970.49"
>>               total        used        free      shared  buff/cache   available
>> Mem:           1970          57        1828           8          84        1872
>> Swap:             0           0           0
>> [    3.504915] blk_update_request: operation not supported error, dev vdd, sector 8388606 op 0x3:(DISCARD) flags 0x0 phys_seg 2 prio class 0
>> [    4.149867] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
>> [    4.151515] NFSD: Using legacy client tracking operations.
>> [    4.248498] blk_update_request: operation not supported error, dev vdc, sector 8388606 op 0x3:(DISCARD) flags 0x0 phys_seg 2 prio class 0
>> BEGIN TEST default (1 test): f2fs Sun Aug 18 09:00:05 PDT 2019
>> DEVICE: /dev/vdd
>> MKFS_OPTIONS: 
>> F2FS_MOUNT_OPTIONS: 
>> FSTYP         -- f2fs
>> PLATFORM      -- Linux/x86_64 kvm-xfstests 5.3.0-rc4-xfstests-00142-g8fde2832bd0b #1 SMP Sun Aug 18 08:57:34 PDT 2019
>> MKFS_OPTIONS  -- /dev/vdc
>> MOUNT_OPTIONS -- -o acl,user_xattr /dev/vdc /vdc
>>
>> [    5.044711] blk_update_request: operation not supported error, dev vdc, sector 8388606 op 0x3:(DISCARD) flags 0x0 phys_seg 2 prio class 0
>> generic/204		[09:00:06][    5.400706] run fstests generic/204 at 2019-08-18 09:00:06
>> [    5.710696] blk_update_request: operation not supported error, dev vdc, sector 8388606 op 0x3:(DISCARD) flags 0x0 phys_seg 2 prio class 0
>> [    7.122703] ------------[ cut here ]------------
>> [    7.123209] kernel BUG at fs/f2fs/segment.c:2391!
>> [    7.124232] invalid opcode: 0000 [#1] SMP NOPTI
>> [    7.124675] CPU: 0 PID: 155 Comm: kworker/u4:2 Not tainted 5.3.0-rc4-xfstests-00142-g8fde2832bd0b #1
>> [    7.125548] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>> [    7.126565] Workqueue: writeback wb_workfn (flush-254:32)
>> [    7.127092] RIP: 0010:get_new_segment+0x275/0x280
>> [    7.127545] Code: 0b 49 8b 7c 24 58 8d 6b 01 89 ca 0f af f5 e8 42 07 09 00 41 0f af af 68 0d 00 00 89 c7 39 c5 0f 86 20 fe ff ff e9 fc fe ff ff <0f> 0b 0f 0b 0f 1f 80 00 00 00 00 0f 1f 44 00 00 41 57 41 56 41 89
>> [    7.129349] RSP: 0018:ffffae77401e35c0 EFLAGS: 00010246
>> [    7.129850] RAX: 0000000000000031 RBX: 0000000000000000 RCX: 0000000000000031
>> [    7.130534] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff942f740a76c0
>> [    7.131216] RBP: 0000000000000001 R08: 00000000d4def660 R09: 0000000000000000
>> [    7.131935] R10: 0000000000000001 R11: 0000000000000000 R12: ffff942f77a1ca80
>> [    7.132614] R13: 0000000000000000 R14: 0000000000000000 R15: ffff942f7788a000
>> [    7.133299] FS:  0000000000000000(0000) GS:ffff942f7d800000(0000) knlGS:0000000000000000
>> [    7.134100] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    7.134651] CR2: 00005653dde81238 CR3: 00000000745f4000 CR4: 00000000003406f0
>> [    7.135335] Call Trace:
>> [    7.135580]  new_curseg+0xdc/0x160
>> [    7.135917]  allocate_segment_by_default+0x9a/0x100
>> [    7.136357]  f2fs_allocate_data_block+0x1ff/0x600
>> [    7.136821]  ? __write_node_page+0x4c1/0x5d0
>> [    7.137239]  do_write_page+0x6a/0x120
>> [    7.137595]  f2fs_do_write_node_page+0x3a/0xb0
>> [    7.138026]  __write_node_page+0x279/0x5d0
>> [    7.138390]  f2fs_sync_node_pages+0x614/0x6a0
>> [    7.138773]  ? __lock_acquire+0x447/0x7c0
>> [    7.139144]  block_operations+0x260/0x380
>> [    7.139562]  ? f2fs_write_checkpoint+0xa7/0x540
>> [    7.140005]  f2fs_write_checkpoint+0x101/0x540
>> [    7.140434]  f2fs_sync_fs+0xc8/0x1c0
>> [    7.140782]  f2fs_balance_fs_bg+0x18d/0x2d0
>> [    7.141192]  ? __lock_acquire+0x447/0x7c0
>> [    7.141584]  f2fs_write_node_pages+0x54/0x2f0
>> [    7.142114]  do_writepages+0x41/0xe0
>> [    7.142580]  __writeback_single_inode+0x54/0x5f0
>> [    7.143159]  writeback_sb_inodes+0x1fe/0x4c0
>> [    7.143671]  wb_writeback+0x112/0x470
>> [    7.144053]  wb_workfn+0xf3/0x5d0
>> [    7.144425]  ? process_one_work+0x1b0/0x560
>> [    7.144827]  process_one_work+0x233/0x560
>> [    7.145220]  worker_thread+0x50/0x3b0
>> [    7.145573]  kthread+0x108/0x140
>> [    7.145890]  ? process_one_work+0x560/0x560
>> [    7.146290]  ? __kthread_create_on_node+0x1a0/0x1a0
>> [    7.146772]  ret_from_fork+0x27/0x50
>> [    7.147851] ---[ end trace c53970fd3fcc6658 ]---
>> [    7.148321] RIP: 0010:get_new_segment+0x275/0x280
>> [    7.148776] Code: 0b 49 8b 7c 24 58 8d 6b 01 89 ca 0f af f5 e8 42 07 09 00 41 0f af af 68 0d 00 00 89 c7 39 c5 0f 86 20 fe ff ff e9 fc fe ff ff <0f> 0b 0f 0b 0f 1f 80 00 00 00 00 0f 1f 44 00 00 41 57 41 56 41 89
>> [    7.150587] RSP: 0018:ffffae77401e35c0 EFLAGS: 00010246
>> [    7.151096] RAX: 0000000000000031 RBX: 0000000000000000 RCX: 0000000000000031
>> [    7.151791] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff942f740a76c0
>> [    7.152531] RBP: 0000000000000001 R08: 00000000d4def660 R09: 0000000000000000
>> [    7.153218] R10: 0000000000000001 R11: 0000000000000000 R12: ffff942f77a1ca80
>> [    7.153900] R13: 0000000000000000 R14: 0000000000000000 R15: ffff942f7788a000
>> [    7.154578] FS:  0000000000000000(0000) GS:ffff942f7d800000(0000) knlGS:0000000000000000
>> [    7.155400] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    7.155961] CR2: 00005653dde81238 CR3: 00000000745f4000 CR4: 00000000003406f0
>> [    7.156623] ------------[ cut here ]------------
>> [    7.157066] WARNING: CPU: 0 PID: 155 at kernel/exit.c:785 do_exit.cold+0x62/0xb9
>> [    7.157802] CPU: 0 PID: 155 Comm: kworker/u4:2 Tainted: G      D           5.3.0-rc4-xfstests-00142-g8fde2832bd0b #1
>> [    7.158802] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>> [    7.159772] Workqueue: writeback wb_workfn (flush-254:32)
>> [    7.160330] RIP: 0010:do_exit.cold+0x62/0xb9
>> [    7.160742] Code: 44 24 10 48 8b 44 24 10 e8 87 b0 a2 00 e9 81 f3 ff ff 48 c7 c7 10 41 27 a5 e8 1e 9d ff ff 48 c7 c7 50 21 26 a5 e8 81 7c 06 00 <0f> 0b e9 0b f3 ff ff 65 48 8b 04 25 c0 5d 01 00 8b 90 b0 03 00 00
>> [    7.162517] RSP: 0018:ffffae77401e3ee8 EFLAGS: 00010246
>> [    7.163054] RAX: 0000000000000024 RBX: ffff942f778600c0 RCX: 0000000000000006
>> [    7.163734] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff942f7d9d6600
>> [    7.164416] RBP: 000000000000000b R08: 0000000000000000 R09: 0000000000000000
>> [    7.165115] R10: 0000000000000000 R11: ffffae77401e3da5 R12: 000000000000000b
>> [    7.165875] R13: 0000000000000006 R14: ffff942f778600c0 R15: ffffffffa46d2ef5
>> [    7.166560] FS:  0000000000000000(0000) GS:ffff942f7d800000(0000) knlGS:0000000000000000
>> [    7.167333] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    7.167888] CR2: 00005653dde81238 CR3: 00000000745f4000 CR4: 00000000003406f0
>> [    7.168592] Call Trace:
>> [    7.168836]  ? kthread+0x108/0x140
>> [    7.169172]  ? get_new_segment+0x275/0x280
>> [    7.169567]  rewind_stack_do_exit+0x17/0x20
>> [    7.169982] irq event stamp: 221765
>> [    7.170322] hardirqs last  enabled at (221765): [<ffffffffa400168a>] trace_hardirqs_on_thunk+0x1a/0x20
>> [    7.171232] hardirqs last disabled at (221763): [<ffffffffa4e002a7>] __do_softirq+0x2a7/0x423
>> [    7.172042] softirqs last  enabled at (221764): [<ffffffffa4e00321>] __do_softirq+0x321/0x423
>> [    7.172857] softirqs last disabled at (217645): [<ffffffffa40b92af>] irq_exit+0x8f/0xc0
>> [    7.173673] ---[ end trace c53970fd3fcc6659 ]---
>> [    7.174154] BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:38
>> [    7.175010] in_atomic(): 1, irqs_disabled(): 0, pid: 155, name: kworker/u4:2
>> [    7.175679] INFO: lockdep is turned off.
>> [    7.176106] CPU: 0 PID: 155 Comm: kworker/u4:2 Tainted: G      D W         5.3.0-rc4-xfstests-00142-g8fde2832bd0b #1
>> [    7.177106] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-20181126_142135-anatol 04/01/2014
>> [    7.178071] Workqueue: writeback wb_workfn (flush-254:32)
>> [    7.178590] Call Trace:
>> [    7.178841]  dump_stack+0x67/0x90
>> [    7.179169]  ___might_sleep.cold+0x9f/0xaf
>> [    7.179563]  exit_signals+0x1c/0x300
>> [    7.179911]  do_exit+0xb7/0x7b0
>> [    7.180217]  ? kthread+0x108/0x140
>> [    7.180546]  ? get_new_segment+0x275/0x280
>> [    7.180945]  rewind_stack_do_exit+0x17/0x20
>> [    7.181365] note: kworker/u4:2[155] exited with preempt_count 1
>> .
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AB2F40F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 02:10:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzUg9-0006O9-LC; Wed, 13 Jan 2021 01:10:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kzUg4-0006Ny-W7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 01:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFH9TdeI0fHNbxJy/68a7XE+0b71DggUPHXzmYFNvds=; b=O3/r98d32c6Q09v7qXuEU+4zEc
 5MtAQVF3IdZtDmWREYJbhoK+68qFfi2CqJ2EVSjnPMXPncpeIkALcDCzdJisXEJ26YMwZrOiNIdFk
 /8k3B0HTzKlxk4QrRqP0QVId/L737tSf3DsrQ4nh4wAg/thY/8/buIPPDRCJP1uiwFhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFH9TdeI0fHNbxJy/68a7XE+0b71DggUPHXzmYFNvds=; b=IvvE0Ml0jpf24dNd+7qvqHcFOM
 +gUW8AeEtVyRzxfJUGsYiTEi0tQleVb7e/uD/F20NlZjggL/bnQJ7mALK7+xgSeBavKpzBUMpz+KI
 PBZ7bEGd7+y64GzcN3U2j/RcRGdrOoYACRw0NHku8YxnZAsGQ6pe3IPCg90qCiclfmTQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzUfu-005haC-1q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 01:10:24 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DFq8G1R3zzMJQn;
 Wed, 13 Jan 2021 09:08:46 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Jan
 2021 09:09:59 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210107093126.116958-1-yuchao0@huawei.com>
 <X/we0NoUqAwuW82+@google.com>
 <6b0060b9-460a-617a-3778-e67f35d551f0@huawei.com>
 <cdd681ad-462d-cb37-2b4b-8f9d547bc718@huawei.com>
 <b44c2af4-d142-baff-387c-6b967f76065c@huawei.com>
 <X/0DxG+AcX54730W@google.com>
 <160f2cf9-73ca-18cd-6ad0-2498821b8db6@huawei.com>
 <X/4kYf11oyoMY8P+@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
Date: Wed, 13 Jan 2021 09:09:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X/4kYf11oyoMY8P+@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kzUfu-005haC-1q
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/13 6:36, Jaegeuk Kim wrote:
> On 01/12, Chao Yu wrote:
>> On 2021/1/12 10:04, Jaegeuk Kim wrote:
>>> On 01/12, Chao Yu wrote:
>>>> On 2021/1/11 19:45, Chao Yu wrote:
>>>>> On 2021/1/11 18:31, Chao Yu wrote:
>>>>>> On 2021/1/11 17:48, Jaegeuk Kim wrote:
>>>>>>> Hi Chao,
>>>>>>>
>>>>>>> After quick test of fsstress w/ fault injection, it gave wrong block address
>>>>>>> errors. Could you please run the test a bit?
>>>>>>
>>>>>> Jaegeuk,
>>>>>>
>>>>>> Oh, I've covered with fstest cases and there is no such error message, let me
>>>>>> try fault injection + SPO case soon.
>>>>>
>>>>> Till now, I haven't see any problem... will let the test run for longer time in
>>>>> this night.
>>>>>
>>>>> Could you share me detailed error message you encounter?
>>>>
>>>> Still, I don't see wrong block address error...
>>>>
>>>> Did the error occur from below path:
>>>>
>>>> - f2fs_end_read_compressed_page
>>>>    - f2fs_cache_compressed_page
>>>>     - f2fs_is_valid_blkaddr
>>>
>>> [58690.176668] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73: 0000 [#1] SMP PTI
>>> [58690.180563] CPU: 0 PID: 29371 Comm: fsstress Tainted: G           O      5.11.0-rc3-custom #1
>>> [58690.186466] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
>>> [58690.189352] RIP: 0010:f2fs_read_multi_pages+0x413/0xa70 [f2fs]
>>> [58690.193366] Code: ad 54 ff ff ff 4c 8b ad 68 ff ff ff 25 00 00 08 00 89 85 78 ff ff ff 49 8d 47 6c 48 89 85 70 ff ff ff 48 63 45 a0 49 8b 57 30 <4c> 8b 34 c2 8b 45 c4 8d 50 01 48 8b 45 b8 48 2b 05 98 56 40 c8 48
>>> [58690.212479] RSP: 0018:ffffb429022dfa60 EFLAGS: 00010206
>>> [58690.218410] RAX: 0000000000000001 RBX: 00000000000078af RCX: 0000000000200000
>>> [58690.222473] RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc0a6872f RDI: 0000000000000246
>>> [58690.227349] RBP: ffffb429022dfb10 R08: 0000000000000000 R09: 0000000000000000
>>> [58690.234425] R10: ffff9c3af1f78200 R11: 0000000000000001 R12: 0000000000000000
>>> [58690.238503] R13: ffff9c3b84041000 R14: fffff5cc8166f5c0 R15: ffff9c3af1f78200
>>> [58690.242455] FS:  00007f0fee9d4b80(0000) GS:ffff9c3bbbc00000(0000) knlGS:0000000000000000
>>> [58690.246401] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [58690.250471] CR2: 0000563b839c1000 CR3: 000000002cb0e004 CR4: 0000000000370ef0
>>> [58690.250471] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> [58690.258758] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> [58690.262464] Call Trace:
>>> [58690.262464]  prepare_compress_overwrite+0x380/0x510 [f2fs]
>>> [58690.266489]  ? xas_load+0x9/0x80
>>> [58690.270452]  f2fs_prepare_compress_overwrite+0x5f/0x80 [f2fs]
>>> [58690.274466]  f2fs_write_begin+0x81e/0x1120 [f2fs]
>>> [58690.277213]  generic_perform_write+0xc2/0x1c0
>>> [58690.278698]  __generic_file_write_iter+0x167/0x1d0
>>> [58690.286472]  f2fs_file_write_iter+0x39e/0x590 [f2fs]
>>> [58690.290398]  new_sync_write+0x117/0x1b0
>>> [58690.290461]  vfs_write+0x185/0x250
>>> [58690.295197]  ksys_write+0x67/0xe0
>>> [58690.298173]  __x64_sys_write+0x1a/0x20
>>> [58690.298437]  do_syscall_64+0x38/0x90
>>> [58690.298437]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> [58690.961685] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of f2fs_quota_write+0x150/0x1f0 [f2fs]
>>> [58691.071481] F2FS-fs (vdb): Inconsistent error blkaddr:31058, sit bitmap:0
>>> [58691.077338] ------------[ cut here ]------------
>>> [58691.081461] WARNING: CPU: 5 PID: 8308 at fs/f2fs/checkpoint.c:151 f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
>>> [58691.086734] Modules linked in: f2fs(O) quota_v2 quota_tree dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua ppdev intel_rapl_msr intel_rapl_common sb_edac kvm_intel kvm irqbypass joydev parport_pc parport input_leds serio_raw mac_hid qemu_fw_cfg sch_fq_codel ip_tables x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy asy
>>> [58691.120632] CPU: 5 PID: 8308 Comm: kworker/u17:5 Tainted: G      D    O      5.11.0-rc3-custom #1
>>> [58691.125438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
>>> [58691.129625] Workqueue: f2fs_post_read_wq f2fs_post_read_work [f2fs]
>>> [58691.133142] RIP: 0010:f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
>>> [58691.136221] Code: 3c 07 b8 01 00 00 00 d3 e0 21 f8 75 57 83 fa 07 75 52 89 f2 31 c9 48 c7 c6 20 6a a7 c0 48 89 df e8 bc d6 03 00 f0 80 4b 48 04 <0f> 0b 31 c0 e9 5e fe ff ff 48 8b 57 10 8b 42 30 d3 e0 03 42 48 39
>>> [58691.143142] RSP: 0018:ffffb429047afd40 EFLAGS: 00010206
>>> [58691.145639] RAX: 0000000000000000 RBX: ffff9c3b84041000 RCX: 0000000000000000
>>> [58691.148899] RDX: 0000000000000000 RSI: ffff9c3bbbd58940 RDI: ffff9c3bbbd58940
>>> [58691.152130] RBP: ffffb429047afd48 R08: ffff9c3bbbd58940 R09: ffffb429047afaa8
>>> [58691.155266] R10: 00000000001ba090 R11: 0000000000000003 R12: 0000000000007952
>>> [58691.158304] R13: fffff5cc81266ac0 R14: 00000000000000db R15: 0000000000000000
>>> [58691.161160] FS:  0000000000000000(0000) GS:ffff9c3bbbd40000(0000) knlGS:0000000000000000
>>> [58691.164286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [58691.166869] CR2: 00007f0fee9d3000 CR3: 000000005ee76001 CR4: 0000000000370ee0
>>> [58691.169714] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> [58691.173102] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> [58691.176163] Call Trace:
>>> [58691.177948]  f2fs_cache_compressed_page+0x69/0x280 [f2fs]
>>> [58691.180549]  ? newidle_balance+0x253/0x3d0
>>> [58691.183238]  f2fs_end_read_compressed_page+0x5a/0x70 [f2fs]
>>> [58691.188205]  f2fs_post_read_work+0x11d/0x120 [f2fs]
>>> [58691.192489]  process_one_work+0x221/0x3a0
>>> [58691.194482]  worker_thread+0x4d/0x3f0
>>> [58691.198867]  kthread+0x114/0x150
>>> [58691.202243]  ? process_one_work+0x3a0/0x3a0
>>> [58691.205367]  ? kthread_park+0x90/0x90
>>> [58691.208244]  ret_from_fork+0x22/0x30
>>>
>>> [58691.910477] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of generic_perform_write+0xc2/0x1c0
>>> [58692.161597] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73: 0000 [#3] SMP PTI
>>> [58692.166490] CPU: 7 PID: 29391 Comm: fsstress Tainted: G      D W  O      5.11.0-rc3-custom #1
>>> [58692.170509] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
>>> [58692.174440] RIP: 0010:f2fs_read_multi_pages+0x413/0xa70 [f2fs]
>>> [58692.179095] Code: ad 54 ff ff ff 4c 8b ad 68 ff ff ff 25 00 00 08 00 89 85 78 ff ff ff 49 8d 47 6c 48 89 85 70 ff ff ff 48 63 45 a0 49 8b 57 30 <4c> 8b 34 c2 8b 45 c4 8d 50 01 48 8b 45 b8 48 2b 05 98 56 40 c8 48
>>> [58692.182436] RSP: 0018:ffffb4290236f710 EFLAGS: 00010206
>>> [58692.182436] RAX: 0000000000000001 RBX: 00000000001053b4 RCX: 0000000000200000
>>> [58692.190453] RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc0a6872f RDI: 0000000000000246
>>> [58692.194397] RBP: ffffb4290236f7c0 R08: 0000000000000000 R09: 0000000000000000
>>> [58692.194397] R10: ffff9c3af1f79d90 R11: 0000000000000001 R12: ffff9c3b8d90fac0
>>> [58692.198431] R13: ffff9c3b84041000 R14: fffff5cc8286b040 R15: ffff9c3af1f79d90
>>> [58692.202375] FS:  00007f629dff5b80(0000) GS:ffff9c3bbbdc0000(0000) knlGS:0000000000000000
>>> [58692.202375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [58692.206461] CR2: 00007f224daa9410 CR3: 000000007ece8002 CR4: 0000000000370ee0
>>> [58692.210457] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> [58692.214403] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> [58692.214437] Call Trace:
>>> [58692.218448]  f2fs_mpage_readpages+0x4e4/0xac0 [f2fs]
>>> [58692.218448]  f2fs_readahead+0x47/0x90 [f2fs]
>>> [58692.222514]  read_pages+0x8e/0x280
>>> [58692.222514]  ? add_to_page_cache_lru+0x78/0xd0
>>> [58692.226487]  page_cache_ra_unbounded+0x137/0x1f0
>>> [58692.226487]  do_page_cache_ra+0x3d/0x40
>>> [58692.226487]  ondemand_readahead+0x17d/0x2e0
>>> [58692.230524]  ? find_get_pages_contig+0x12a/0x250
>>> [58692.234404]  page_cache_sync_ra+0xd4/0xe0
>>> [58692.234404]  generic_file_buffered_read_get_pages+0x126/0x8d0
>>> [58692.238425]  ? arch_stack_walk+0x9e/0xf0
>>> [58692.238425]  generic_file_buffered_read+0x113/0x4a0
>>> [58692.242366]  ? __slab_free+0x25e/0x380
>>> [58692.242366]  ? f2fs_file_write_iter+0x9f/0x590 [f2fs]
>>> [58692.246402]  generic_file_read_iter+0xdf/0x140
>>> [58692.246423]  f2fs_file_read_iter+0x34/0xb0 [f2fs]
>>> [58692.246423]  generic_file_splice_read+0xf7/0x1a0
>>> [58692.250393]  do_splice_to+0x6e/0xa0
>>> [58692.250393]  splice_direct_to_actor+0xcd/0x250
>>> [58692.254439]  ? wait_for_space+0x90/0x90
>>> [58692.254439]  do_splice_direct+0x89/0xd0
>>> [58692.258493]  vfs_copy_file_range+0x1b1/0x470
>>> [58692.258493]  __x64_sys_copy_file_range+0xd4/0x200
>>> [58692.261742]  do_syscall_64+0x38/0x90
>>> [58692.263167]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> Jaegeuk,
>>
>> I rerun por_fsstress testcase on a mountpoint which enables compression,
>> sysfile quota, compress_cache, but it doesn't reproduce this issue.
> 
> Have you enable compress_extension=*?

Yup, I forced to enable this in default_options(), and during the test, I
have confirmed that regular inode is compressed by using lsattr.

> 
>>
>> Not sure, below diff would help to solve this issue, could you please
>> help to try this?
> 
> No luck with this diff.

If we disable compress_cache option, there is no issue during por_fsstress test,
right?

Thanks,

> 
>>
>>  From ac15dffa459ee734f3d66ea6bb7d936c8d7e0565 Mon Sep 17 00:00:00 2001
>> From: Chao Yu <yuchao0@huawei.com>
>> Date: Tue, 12 Jan 2021 15:26:59 +0800
>> Subject: [PATCH] f2fs: fix wrong blkaddr
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/data.c  | 8 ++++++++
>>   fs/f2fs/super.c | 7 +++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index f8578fad7cd1..b3973494b102 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3679,6 +3679,9 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
>>
>>   	clear_cold_data(page);
>>
>> +	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
>> +		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
>> +
>>   	if (IS_ATOMIC_WRITTEN_PAGE(page))
>>   		return f2fs_drop_inmem_page(inode, page);
>>
>> @@ -3695,6 +3698,11 @@ int f2fs_release_page(struct page *page, gfp_t wait)
>>   	if (IS_ATOMIC_WRITTEN_PAGE(page))
>>   		return 0;
>>
>> +	if (test_opt(F2FS_P_SB(page), COMPRESS_CACHE) &&
>> +			f2fs_compressed_file(page->mapping->host))
>> +		f2fs_invalidate_compress_pages(F2FS_P_SB(page),
>> +					page->mapping->host->i_ino);
>> +
>>   	clear_cold_data(page);
>>   	f2fs_clear_page_private(page);
>>   	return 1;
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 8b5975731439..a44dfc9a594a 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1915,6 +1915,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>   	bool disable_checkpoint = test_opt(sbi, DISABLE_CHECKPOINT);
>>   	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
>>   	bool no_atgc = !test_opt(sbi, ATGC);
>> +	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
>>   	bool checkpoint_changed;
>>   #ifdef CONFIG_QUOTA
>>   	int i, j;
>> @@ -2007,6 +2008,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>   		goto restore_opts;
>>   	}
>>
>> +	if (no_compress_cache == !!test_opt(sbi, COMPRESS_CACHE)) {
>> +		err = -EINVAL;
>> +		f2fs_warn(sbi, "switch compress_cache option is not allowed");
>> +		goto restore_opts;
>> +	}
>> +
>>   	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>>   		err = -EINVAL;
>>   		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
>> -- 
>> 2.29.2
>>
>>
>>
>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Linux-f2fs-devel mailing list
>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>> .
>>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Linux-f2fs-devel mailing list
>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

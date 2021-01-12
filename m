Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1BF2F2605
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 03:05:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kz93Z-0001ff-Pz; Tue, 12 Jan 2021 02:05:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kz93Y-0001fU-6a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 02:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZDi3GX/iZrZTb9G8A6nkAHD+2vLjPisraFjT9PNMsFA=; b=Wbp/ALDGRd7Dra31Ara1+KCo9/
 FKzNNOhrWUdG9neH+FA9tHzWKM76DRgAB1QMBy+28AMEf7JWQznb6FNVE3iwQLnmt8v8cj06gV/ye
 nxZbOYWWAvQA55v98h5jVUu4dSGKqQNt2AnCaD3EtYjL07utiTuxfz25VvUB63ckobjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZDi3GX/iZrZTb9G8A6nkAHD+2vLjPisraFjT9PNMsFA=; b=dqeXebUC0AFRqWS79fQB9133Lg
 cDzssVz3BbL5ij5LaEwNCUqsVoeXaud1Hzn3JZCE/o8OPyZAIbUghfKAt+ykjp+hrwoaOyeEvjr2n
 YYhp4CSCpBA+kotAkk7iwvEmfmTvV4SvmoSkXLwoO0EYBy80Slkc7t9MYRMVrIQWGnDQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kz93L-002UUY-6l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 02:05:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF9C320449;
 Tue, 12 Jan 2021 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610417093;
 bh=srOGivfKaLW91o0BK6FwSVOpYglxhklDlFUP+pDjzSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oefUMLb8WbfbfIQs1jRL/AFHrpBqVkc8q60g+RpA4pighIeCHGcHP0Y2IXBPk1ebf
 Fff2yeOvNyn4WdLXvY5qztvM1nS138RGZBSJPp1uhEelvzvh59cieIs6fbbR1NQcTl
 CWHdcabrPgWKC5pCM0vVMvnx5e53Q0duY8q2hPFStQGkiRbYq9nWEw6YBaa0R2hGYo
 lTVefTnFujSpqres6T+f7Udczo99Xp/mslaThDXoC98Z3p31osdqLB89UBzzZL2cMn
 GnoKYp+fOhEp4+7VLV5aWHv4y5CRrqFcL8/mb9KSaCJaE30vM/X4MRkCuPFvadRIfB
 Mf+jzkb90ZTLQ==
Date: Mon, 11 Jan 2021 18:04:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X/0DxG+AcX54730W@google.com>
References: <20210107093126.116958-1-yuchao0@huawei.com>
 <X/we0NoUqAwuW82+@google.com>
 <6b0060b9-460a-617a-3778-e67f35d551f0@huawei.com>
 <cdd681ad-462d-cb37-2b4b-8f9d547bc718@huawei.com>
 <b44c2af4-d142-baff-387c-6b967f76065c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b44c2af4-d142-baff-387c-6b967f76065c@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kz93L-002UUY-6l
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/12, Chao Yu wrote:
> On 2021/1/11 19:45, Chao Yu wrote:
> > On 2021/1/11 18:31, Chao Yu wrote:
> > > On 2021/1/11 17:48, Jaegeuk Kim wrote:
> > > > Hi Chao,
> > > > 
> > > > After quick test of fsstress w/ fault injection, it gave wrong block address
> > > > errors. Could you please run the test a bit?
> > > 
> > > Jaegeuk,
> > > 
> > > Oh, I've covered with fstest cases and there is no such error message, let me
> > > try fault injection + SPO case soon.
> > 
> > Till now, I haven't see any problem... will let the test run for longer time in
> > this night.
> > 
> > Could you share me detailed error message you encounter?
> 
> Still, I don't see wrong block address error...
> 
> Did the error occur from below path:
> 
> - f2fs_end_read_compressed_page
>  - f2fs_cache_compressed_page
>   - f2fs_is_valid_blkaddr

[58690.176668] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73: 0000 [#1] SMP PTI
[58690.180563] CPU: 0 PID: 29371 Comm: fsstress Tainted: G           O      5.11.0-rc3-custom #1
[58690.186466] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
[58690.189352] RIP: 0010:f2fs_read_multi_pages+0x413/0xa70 [f2fs]
[58690.193366] Code: ad 54 ff ff ff 4c 8b ad 68 ff ff ff 25 00 00 08 00 89 85 78 ff ff ff 49 8d 47 6c 48 89 85 70 ff ff ff 48 63 45 a0 49 8b 57 30 <4c> 8b 34 c2 8b 45 c4 8d 50 01 48 8b 45 b8 48 2b 05 98 56 40 c8 48
[58690.212479] RSP: 0018:ffffb429022dfa60 EFLAGS: 00010206
[58690.218410] RAX: 0000000000000001 RBX: 00000000000078af RCX: 0000000000200000
[58690.222473] RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc0a6872f RDI: 0000000000000246
[58690.227349] RBP: ffffb429022dfb10 R08: 0000000000000000 R09: 0000000000000000
[58690.234425] R10: ffff9c3af1f78200 R11: 0000000000000001 R12: 0000000000000000
[58690.238503] R13: ffff9c3b84041000 R14: fffff5cc8166f5c0 R15: ffff9c3af1f78200
[58690.242455] FS:  00007f0fee9d4b80(0000) GS:ffff9c3bbbc00000(0000) knlGS:0000000000000000
[58690.246401] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[58690.250471] CR2: 0000563b839c1000 CR3: 000000002cb0e004 CR4: 0000000000370ef0
[58690.250471] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[58690.258758] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[58690.262464] Call Trace:
[58690.262464]  prepare_compress_overwrite+0x380/0x510 [f2fs]
[58690.266489]  ? xas_load+0x9/0x80
[58690.270452]  f2fs_prepare_compress_overwrite+0x5f/0x80 [f2fs]
[58690.274466]  f2fs_write_begin+0x81e/0x1120 [f2fs]
[58690.277213]  generic_perform_write+0xc2/0x1c0
[58690.278698]  __generic_file_write_iter+0x167/0x1d0
[58690.286472]  f2fs_file_write_iter+0x39e/0x590 [f2fs]
[58690.290398]  new_sync_write+0x117/0x1b0
[58690.290461]  vfs_write+0x185/0x250
[58690.295197]  ksys_write+0x67/0xe0
[58690.298173]  __x64_sys_write+0x1a/0x20
[58690.298437]  do_syscall_64+0x38/0x90
[58690.298437]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

[58690.961685] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of f2fs_quota_write+0x150/0x1f0 [f2fs]
[58691.071481] F2FS-fs (vdb): Inconsistent error blkaddr:31058, sit bitmap:0
[58691.077338] ------------[ cut here ]------------
[58691.081461] WARNING: CPU: 5 PID: 8308 at fs/f2fs/checkpoint.c:151 f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
[58691.086734] Modules linked in: f2fs(O) quota_v2 quota_tree dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua ppdev intel_rapl_msr intel_rapl_common sb_edac kvm_intel kvm irqbypass joydev parport_pc parport input_leds serio_raw mac_hid qemu_fw_cfg sch_fq_codel ip_tables x_tables autofs4 btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy asy
[58691.120632] CPU: 5 PID: 8308 Comm: kworker/u17:5 Tainted: G      D    O      5.11.0-rc3-custom #1
[58691.125438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
[58691.129625] Workqueue: f2fs_post_read_wq f2fs_post_read_work [f2fs]
[58691.133142] RIP: 0010:f2fs_is_valid_blkaddr+0x1e9/0x280 [f2fs]
[58691.136221] Code: 3c 07 b8 01 00 00 00 d3 e0 21 f8 75 57 83 fa 07 75 52 89 f2 31 c9 48 c7 c6 20 6a a7 c0 48 89 df e8 bc d6 03 00 f0 80 4b 48 04 <0f> 0b 31 c0 e9 5e fe ff ff 48 8b 57 10 8b 42 30 d3 e0 03 42 48 39
[58691.143142] RSP: 0018:ffffb429047afd40 EFLAGS: 00010206
[58691.145639] RAX: 0000000000000000 RBX: ffff9c3b84041000 RCX: 0000000000000000
[58691.148899] RDX: 0000000000000000 RSI: ffff9c3bbbd58940 RDI: ffff9c3bbbd58940
[58691.152130] RBP: ffffb429047afd48 R08: ffff9c3bbbd58940 R09: ffffb429047afaa8
[58691.155266] R10: 00000000001ba090 R11: 0000000000000003 R12: 0000000000007952
[58691.158304] R13: fffff5cc81266ac0 R14: 00000000000000db R15: 0000000000000000
[58691.161160] FS:  0000000000000000(0000) GS:ffff9c3bbbd40000(0000) knlGS:0000000000000000
[58691.164286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[58691.166869] CR2: 00007f0fee9d3000 CR3: 000000005ee76001 CR4: 0000000000370ee0
[58691.169714] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[58691.173102] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[58691.176163] Call Trace:
[58691.177948]  f2fs_cache_compressed_page+0x69/0x280 [f2fs]
[58691.180549]  ? newidle_balance+0x253/0x3d0
[58691.183238]  f2fs_end_read_compressed_page+0x5a/0x70 [f2fs]
[58691.188205]  f2fs_post_read_work+0x11d/0x120 [f2fs]
[58691.192489]  process_one_work+0x221/0x3a0
[58691.194482]  worker_thread+0x4d/0x3f0
[58691.198867]  kthread+0x114/0x150
[58691.202243]  ? process_one_work+0x3a0/0x3a0
[58691.205367]  ? kthread_park+0x90/0x90
[58691.208244]  ret_from_fork+0x22/0x30

[58691.910477] F2FS-fs (vdb) : inject page get in f2fs_pagecache_get_page of generic_perform_write+0xc2/0x1c0
[58692.161597] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73: 0000 [#3] SMP PTI
[58692.166490] CPU: 7 PID: 29391 Comm: fsstress Tainted: G      D W  O      5.11.0-rc3-custom #1
[58692.170509] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
[58692.174440] RIP: 0010:f2fs_read_multi_pages+0x413/0xa70 [f2fs]
[58692.179095] Code: ad 54 ff ff ff 4c 8b ad 68 ff ff ff 25 00 00 08 00 89 85 78 ff ff ff 49 8d 47 6c 48 89 85 70 ff ff ff 48 63 45 a0 49 8b 57 30 <4c> 8b 34 c2 8b 45 c4 8d 50 01 48 8b 45 b8 48 2b 05 98 56 40 c8 48
[58692.182436] RSP: 0018:ffffb4290236f710 EFLAGS: 00010206
[58692.182436] RAX: 0000000000000001 RBX: 00000000001053b4 RCX: 0000000000200000
[58692.190453] RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc0a6872f RDI: 0000000000000246
[58692.194397] RBP: ffffb4290236f7c0 R08: 0000000000000000 R09: 0000000000000000
[58692.194397] R10: ffff9c3af1f79d90 R11: 0000000000000001 R12: ffff9c3b8d90fac0
[58692.198431] R13: ffff9c3b84041000 R14: fffff5cc8286b040 R15: ffff9c3af1f79d90
[58692.202375] FS:  00007f629dff5b80(0000) GS:ffff9c3bbbdc0000(0000) knlGS:0000000000000000
[58692.202375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[58692.206461] CR2: 00007f224daa9410 CR3: 000000007ece8002 CR4: 0000000000370ee0
[58692.210457] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[58692.214403] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[58692.214437] Call Trace:
[58692.218448]  f2fs_mpage_readpages+0x4e4/0xac0 [f2fs]
[58692.218448]  f2fs_readahead+0x47/0x90 [f2fs]
[58692.222514]  read_pages+0x8e/0x280
[58692.222514]  ? add_to_page_cache_lru+0x78/0xd0
[58692.226487]  page_cache_ra_unbounded+0x137/0x1f0
[58692.226487]  do_page_cache_ra+0x3d/0x40
[58692.226487]  ondemand_readahead+0x17d/0x2e0
[58692.230524]  ? find_get_pages_contig+0x12a/0x250
[58692.234404]  page_cache_sync_ra+0xd4/0xe0
[58692.234404]  generic_file_buffered_read_get_pages+0x126/0x8d0
[58692.238425]  ? arch_stack_walk+0x9e/0xf0
[58692.238425]  generic_file_buffered_read+0x113/0x4a0
[58692.242366]  ? __slab_free+0x25e/0x380
[58692.242366]  ? f2fs_file_write_iter+0x9f/0x590 [f2fs]
[58692.246402]  generic_file_read_iter+0xdf/0x140
[58692.246423]  f2fs_file_read_iter+0x34/0xb0 [f2fs]
[58692.246423]  generic_file_splice_read+0xf7/0x1a0
[58692.250393]  do_splice_to+0x6e/0xa0
[58692.250393]  splice_direct_to_actor+0xcd/0x250
[58692.254439]  ? wait_for_space+0x90/0x90
[58692.254439]  do_splice_direct+0x89/0xd0
[58692.258493]  vfs_copy_file_range+0x1b1/0x470
[58692.258493]  __x64_sys_copy_file_range+0xd4/0x200
[58692.261742]  do_syscall_64+0x38/0x90
[58692.263167]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

> 
> > 
> > Thanks,
> > 
> > > 
> > > Thanks,
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > .
> > > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7331E9BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 10:03:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQot1-000395-9F; Wed, 15 May 2019 08:03:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hagbardcelin@gmail.com>) id 1hQot0-00037h-2O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 08:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmDYfYtdSM9pgktTTRWk6Z1f4BEAwsZXdTVPpU3K7Pw=; b=GNi8W8M4N4q3wiCXU9F7BwArg3
 mFqOU/XdycqSOb86TXPAVV8Nnsxqln0C4K75XPsmMllw2GJ6zV14jzrqgLmHnyfxnm5oMpVq7O8xo
 e9wLAjMT85WghwXxAXBlI5a6zK3YGJnbJBo30nn/rFbJY+3w3rSCRq7EqSCPm2DeOmf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kmDYfYtdSM9pgktTTRWk6Z1f4BEAwsZXdTVPpU3K7Pw=; b=JrxCyi4rAk1W3jkm+8os75yTqh
 HM4ejY2MPdweGLW0p2NyzWppcTH8UcJx9NhGdEiIdxzKRkRjY21X9B9l9JB2szRmgFN2GSdhfdVpM
 xiDTU2+eQeMn31yNs6Hd/dqlNkBexC3Sqk2TCk/7DQdHfl/gS58KfKiK15RHRQ8KCGyA=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQosx-004Pvk-U1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 08:03:38 +0000
Received: by mail-lf1-f67.google.com with SMTP id y13so1231994lfh.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2019 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kmDYfYtdSM9pgktTTRWk6Z1f4BEAwsZXdTVPpU3K7Pw=;
 b=Cck5SDCq6Q5Q/YIW4dXj9h78kHW/kdf8go2XpNfIu39hgSGhVV0C8OBkQqP9c6i8Sm
 XXGe+6U1umvJvvsuqPo2bUAvnXdlu4DYmKB/7V1U4ly2xBxc0XpqM1bvQDsTtn+IkgRH
 BWx8OygZjR9eqAqKBAv0JViEuiyBDBQqJensAaxdUW/ImUMVzS+hS8dZGzmqxYXa0stP
 F7R4j4tqJjBXn3WbvPUEATlpOngo4E/LQPVc2V5do1JCe4OxCOylyi4niu3sgtjz2cRP
 +hFftZen5Ltpcx02kkRo0weXBIe7DQObl7gveW4RvR7eCulK/MGK5Ir9YKLyJryn9ZtC
 GPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kmDYfYtdSM9pgktTTRWk6Z1f4BEAwsZXdTVPpU3K7Pw=;
 b=h2lVRHrm0c3mFQAo5jzqdiK0V9tHVUyxlxqcA711U4UqApSxoWCf1zYM5Hzlv1Q9nX
 jsTBy44o8aC7recNMpxIlkMqIoUXGQXxuOTo+JqLsLQdgOQRvGWHuH0vR7RXwP1pSEVQ
 dvReumwIfxrrStVtXJ1qNRHSxRFfT0DG0MBBOQ1KxUfYdetdjgRcWL9NNgzvnABrVNPy
 zPbYH/z+tb3OSJBfH41HkxNrgHWMsVD1WUXEu10Ux8jfD5hAzDLmPb+yt9mWqlLcKiPF
 VPATozl6zS7bA8dMxL2S/10KPqDtgd2DTsDa3+MppsuPLezxD1XJ5fsEY3rrgW9f5h03
 XjVw==
X-Gm-Message-State: APjAAAW2P9ZdaWOruyS0HVyfWm/Kqg1QcRiZ7b2pNNHek5Bkupc1t+6N
 ZkSb1hATMPuEsODpBuTSlcDIJh62KLs1tEDWc1+3RW+L
X-Google-Smtp-Source: APXvYqz2zqooafnWlQz8f/43hAaDaIM2BPOGCjpoCT0tve+XfUhvMRdXqEmbwVcghCCirakSkxh5t5qtP+Bmwmoe5cY=
X-Received: by 2002:ac2:5222:: with SMTP id i2mr12997213lfl.80.1557907408837; 
 Wed, 15 May 2019 01:03:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8041:0:0:0:0:0 with HTTP; Wed, 15 May 2019 01:03:27
 -0700 (PDT)
In-Reply-To: <f657d41f-84d6-8cfa-5532-689a03ab2d2e@huawei.com>
References: <CADoWrG_NTz29eyaa3fUti2sNBP4xp7-zfhDVkix=Kty4rD=Otw@mail.gmail.com>
 <35b643e5-562c-942d-67ce-4a9dbef66d16@huawei.com>
 <5725124a-95c8-cedb-d3a8-d8be86d260dd@huawei.com>
 <CADoWrG9_5izaUMvB0mNLC7yp_Mnnm7yPrqcOvDL2ERR2YrkF2A@mail.gmail.com>
 <452dad75-a4aa-2366-b704-ee5448a3bd71@huawei.com>
 <CADoWrG9V7nD4wzj0DFDAKcjcZHhjC0yPetX_Ce6jj2_YNpU9YA@mail.gmail.com>
 <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
 <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
 <f657d41f-84d6-8cfa-5532-689a03ab2d2e@huawei.com>
From: Hagbard Celine <hagbardcelin@gmail.com>
Date: Wed, 15 May 2019 10:03:27 +0200
Message-ID: <CADoWrG-RBDWpjTyO4Yz68HRnaUW8OCvCZUkDDmaZM4hR-FNOGA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hagbardcelin[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hQosx-004Pvk-U1
Subject: Re: [f2fs-dev] BUG: kernel stack overflow when mounting with
 data_flush
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

2019-05-15 4:25 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
> On 2019/5/15 2:13, Hagbard Celine wrote:
>> 2019-04-02 15:31 GMT+02:00, Chao Yu <chao@kernel.org>:
>>> On 2019-4-2 20:41, Hagbard Celine wrote:
>>>> That seems to have fixed it. No more errors in syslog after extracting
>>>> my stage3 tarball. Also ran a couple of kernel compiles on a partition
>>>> mounted with data_flush and system seems stable.
>>>
>>> Thanks a lot for your quick test. :)
>>
>> My test might have been a little too quick, or I found another
>> data_flush bug that behaves similar.
>
> oops...
>
>>>>>
>>>>> -		if (is_dir)
>>>>> -			F2FS_I(inode)->cp_task = current;
>>>>> +		F2FS_I(inode)->cp_task = current;
>
> If you're sure that this patch was applying before you test, I guess we need
> an
> extra barrier here to avoid out-of-order execution.
>
> smp_mb()
>
>>>>>
>>>>>  		filemap_fdatawrite(inode->i_mapping);
>>>>>
>>>>> -		if (is_dir)
>>>>> -			F2FS_I(inode)->cp_task = NULL;
>>>>> +		F2FS_I(inode)->cp_task = NULL;
>
> Thanks,
>
If I did this correctly; it did not get rid of the stack overflow.
Here is what I did:

Added smb_mb() in checkpoint.c so the relevant part looks like this:

		unsigned long cur_ino = inode->i_ino;

		F2FS_I(inode)->cp_task = current;

		smp_mb();

		filemap_fdatawrite(inode->i_mapping);

		F2FS_I(inode)->cp_task = NULL;

		iput(inode);
		

Compiled, rebooted and ran my test-scripts again. And got this during
copy-phase in second script:

<5>[ 1215.731077] F2FS-fs (nvme0n1p7): Found nat_bits in checkpoint
<5>[ 1215.812730] F2FS-fs (nvme0n1p7): Mounted with checkpoint version
= 6319b5f3
<5>[ 1215.856781] F2FS-fs (nvme0n1p8): Mounted with checkpoint version
= 7a6b5e6d
<5>[ 1587.552859] F2FS-fs (nvme0n1p7): Found nat_bits in checkpoint
<5>[ 1587.597483] F2FS-fs (nvme0n1p7): Mounted with checkpoint version
= 6319b776
<5>[ 1587.630029] F2FS-fs (nvme0n1p8): Mounted with checkpoint version
= 7a6b5e71
<0>[ 1720.608369] BUG: stack guard page was hit at 0000000033d16c42
(stack is 00000000ed3eabe7..00000000ffbe4ff0)
<4>[ 1720.612537] kernel stack overflow (double-fault): 0000 [#1]
PREEMPT SMP PTI
<4>[ 1720.616750] CPU: 3 PID: 1982 Comm: kworker/u16:0 Not tainted
5.0.15-gentoo-f2fsbarr #3
<4>[ 1720.621057] Hardware name: To Be Filled By O.E.M. To Be Filled
By O.E.M./C226 WS, BIOS P3.40 06/25/2018
<4>[ 1720.625465] Workqueue: writeback wb_workfn (flush-259:0)
<4>[ 1720.629881] RIP: 0010:sched_clock_cpu+0x9/0xd0
<4>[ 1720.634283] Code: 08 e8 2b 9b f0 ff 48 89 03 48 03 05 a1 2e 62
01 48 2b 43 08 5b 48 89 05 8d 2e 62 01 c3 0f 1f 40 00 41 54 55 53 0f
1f 44 00 00 <e8> 02 9b f0 ff 48 03 05 7b 2e 62 01 48 89 c2 5b 48 89 d0
5d 41 5c
<4>[ 1720.639109] RSP: 0018:ffffa661c0364000 EFLAGS: 00010046
<4>[ 1720.643893] RAX: 0000000000000003 RBX: ffff91cf5ecd54c0 RCX:
ffffa661c03640f8
<4>[ 1720.648739] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
0000000000000003
<4>[ 1720.653589] RBP: ffffffffb16485c0 R08: 0000000000000004 R09:
0000000000020e00
<4>[ 1720.658441] R10: ffffffffb16485c0 R11: 00000000000000cb R12:
0000000000000000
<4>[ 1720.663255] R13: ffffa661c03640f8 R14: 0000000000000046 R15:
ffff91cf3c8a01c0
<4>[ 1720.668069] FS:  0000000000000000(0000)
GS:ffff91cf5ecc0000(0000) knlGS:0000000000000000
<4>[ 1720.672971] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[ 1720.677885] CR2: ffffa661c0363ff8 CR3: 000000069bc0c003 CR4:
00000000003606e0
<4>[ 1720.682859] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
<4>[ 1720.687839] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
<4>[ 1720.692821] Call Trace:
<4>[ 1720.697807]  record_times+0x16/0xb0
<4>[ 1720.702795]  psi_task_change+0xe9/0x210
<4>[ 1720.707795]  activate_task+0xac/0x120
<4>[ 1720.712772]  ttwu_do_activate+0x43/0x80
<4>[ 1720.717768]  try_to_wake_up+0x1ef/0x510
<4>[ 1720.722547]  __queue_work+0xf2/0x3f0
<4>[ 1720.727110]  mod_delayed_work_on+0x59/0xa0
<4>[ 1720.731725]  kblockd_mod_delayed_work_on+0x17/0x20
<4>[ 1720.736403]  blk_mq_run_hw_queue+0x88/0xe0
<4>[ 1720.741094]  blk_mq_flush_plug_list+0x19e/0x300
<4>[ 1720.745810]  blk_flush_plug_list+0xd7/0x100
<4>[ 1720.750534]  io_schedule_prepare+0x3c/0x40
<4>[ 1720.755171]  io_schedule+0xb/0x40
<4>[ 1720.759697]  __lock_page+0x13c/0x240
<4>[ 1720.764214]  ? file_check_and_advance_wb_err+0xe0/0xe0
<4>[ 1720.768762]  f2fs_write_cache_pages+0x253/0x450
<4>[ 1720.773297]  ? kmem_cache_alloc+0x81/0x6b0
<4>[ 1720.777858]  ? trace_hardirqs_on+0x2c/0xe0
<4>[ 1720.782426]  ? finish_wait+0x80/0x80
<4>[ 1720.787000]  ? mempool_alloc+0x65/0x190
<4>[ 1720.791586]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1720.796213]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.800864]  ? preempt_count_sub+0x5/0xa0
<4>[ 1720.805490]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.810088]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1720.814680]  do_writepages+0x41/0xd0
<4>[ 1720.819149]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.823515]  ? preempt_count_sub+0x5/0xa0
<4>[ 1720.827842]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1720.832150]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1720.836467]  ? si_meminfo+0x3f/0x60
<4>[ 1720.840774]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1720.845097]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1720.849405]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1720.853705]  ? up_read+0x5/0x20
<4>[ 1720.857997]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1720.862337]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1720.866668]  __write_data_page+0x5b7/0x6f0
<4>[ 1720.871012]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1720.875370]  ? account_entity_enqueue+0x4e/0x80
<4>[ 1720.879745]  ? __switch_to_asm+0x40/0x70
<4>[ 1720.884094]  ? __switch_to_asm+0x34/0x70
<4>[ 1720.888437]  ? __switch_to_asm+0x40/0x70
<4>[ 1720.892727]  ? __switch_to_asm+0x34/0x70
<4>[ 1720.896967]  ? __switch_to_asm+0x40/0x70
<4>[ 1720.901195]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.905468]  ? _raw_spin_lock+0x13/0x30
<4>[ 1720.909772]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1720.913993]  ? __switch_to_asm+0x34/0x70
<4>[ 1720.918122]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1720.922195]  do_writepages+0x41/0xd0
<4>[ 1720.926166]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.930068]  ? preempt_count_sub+0x5/0xa0
<4>[ 1720.933926]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1720.937584]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1720.941055]  ? si_meminfo+0x3f/0x60
<4>[ 1720.944467]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1720.947901]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1720.951335]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1720.954790]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1720.958268]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1720.961678]  __write_data_page+0x5b7/0x6f0
<4>[ 1720.965050]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1720.968391]  ? preempt_count_add+0x79/0xb0
<4>[ 1720.971723]  ? _raw_spin_lock+0x13/0x30
<4>[ 1720.975074]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1720.978392]  ? __switch_to_asm+0x40/0x70
<4>[ 1720.981712]  ? __schedule+0x2cd/0x8b0
<4>[ 1720.985020]  do_writepages+0x41/0xd0
<4>[ 1720.988323]  ? preempt_schedule_common+0xd/0x80
<4>[ 1720.991652]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1720.995001]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1720.998353]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.001699]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1721.005068]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.008422]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.011786]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.015164]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.018547]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.021935]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.025351]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.028747]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.032100]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.035423]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.038743]  do_writepages+0x41/0xd0
<4>[ 1721.042049]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.045372]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.048660]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.051932]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.055227]  ? si_meminfo+0x3f/0x60
<4>[ 1721.058534]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.061874]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.065222]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.068562]  ? up_read+0x5/0x20
<4>[ 1721.071909]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.075306]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.078700]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.082101]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.085507]  ? retint_kernel+0x2d/0x2d
<4>[ 1721.088900]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.092298]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.095689]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.099085]  do_writepages+0x41/0xd0
<4>[ 1721.102458]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.105844]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.109194]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.112525]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.115852]  ? si_meminfo+0x3f/0x60
<4>[ 1721.119202]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.122617]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.126073]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.129561]  ? up_read+0x5/0x20
<4>[ 1721.133033]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.136547]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.140054]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.143562]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.147088]  ? __switch_to_asm+0x40/0x70
<4>[ 1721.150605]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.154085]  ? __switch_to_asm+0x40/0x70
<4>[ 1721.157552]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.160992]  ? __switch_to_asm+0x40/0x70
<4>[ 1721.164398]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.167806]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.171197]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.174597]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.177989]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1721.181369]  do_writepages+0x41/0xd0
<4>[ 1721.184722]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.188086]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.191415]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.194726]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.198039]  ? si_meminfo+0x3f/0x60
<4>[ 1721.201335]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.204659]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.207995]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.211338]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1721.214704]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.218058]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.221412]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.224782]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.228130]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.231453]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.234791]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.238118]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.241411]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.244684]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.247946]  do_writepages+0x41/0xd0
<4>[ 1721.251192]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.254475]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.257756]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.261029]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.264308]  ? si_meminfo+0x3f/0x60
<4>[ 1721.267574]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.270894]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.274227]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.277556]  ? up_read+0x5/0x20
<4>[ 1721.280871]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.284217]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.287553]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.290896]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.294255]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.297602]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.300930]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.304276]  ? __attach_extent_node+0x87/0xb0
<4>[ 1721.307612]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.310939]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.314263]  do_writepages+0x41/0xd0
<4>[ 1721.317577]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.320898]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.324188]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.327461]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.330757]  ? si_meminfo+0x3f/0x60
<4>[ 1721.334056]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.337385]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.340718]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.344039]  ? up_read+0x5/0x20
<4>[ 1721.347338]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.350674]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.354005]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.357331]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.360661]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.363987]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.367298]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.370617]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.373972]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.377339]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.380720]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.384134]  do_writepages+0x41/0xd0
<4>[ 1721.387537]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.390953]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.394340]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.397713]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.401088]  ? si_meminfo+0x3f/0x60
<4>[ 1721.404451]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.407844]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.411262]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.414687]  ? up_read+0x5/0x20
<4>[ 1721.418099]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.421551]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.424989]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.428427]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.431880]  ? __x64_sys_sched_get_priority_min+0x3/0x40
<4>[ 1721.435348]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.438799]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.442241]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.445688]  ? __attach_extent_node+0x87/0xb0
<4>[ 1721.449130]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.452572]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.456005]  do_writepages+0x41/0xd0
<4>[ 1721.459421]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.462873]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.466323]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.469766]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.473212]  ? si_meminfo+0x3f/0x60
<4>[ 1721.476644]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.480131]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.483633]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.487129]  ? up_read+0x5/0x20
<4>[ 1721.490612]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.494125]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.497629]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.501138]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.504662]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.508175]  ? _raw_spin_lock+0x13/0x30
<4>[ 1721.511669]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.515177]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.518671]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1721.522161]  do_writepages+0x41/0xd0
<4>[ 1721.525643]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.529129]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.532587]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.536032]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.539482]  ? si_meminfo+0x3f/0x60
<4>[ 1721.542921]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.546389]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.549883]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.553385]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1721.556918]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.560449]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.563979]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1721.567530]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.571089]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.574636]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.578169]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1721.581694]  do_writepages+0x41/0xd0
<4>[ 1721.585209]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.588727]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.592211]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.595687]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.599160]  ? si_meminfo+0x3f/0x60
<4>[ 1721.602615]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.606128]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.609666]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.613204]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1721.616777]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.620346]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.623946]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.627569]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.631186]  ? __switch_to_asm+0x34/0x70
<4>[ 1721.634797]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1721.638404]  do_writepages+0x41/0xd0
<4>[ 1721.641994]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.645593]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.649164]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.652711]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.656247]  ? si_meminfo+0x3f/0x60
<4>[ 1721.659770]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.663313]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.666842]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.670347]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1721.673883]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.677413]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.680944]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1721.684505]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.688076]  ? __x64_sys_sched_get_priority_min+0xf/0x40
<4>[ 1721.691684]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.695294]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.698924]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.702560]  do_writepages+0x41/0xd0
<4>[ 1721.706188]  ? preempt_count_add+0x79/0xb0
<4>[ 1721.709828]  ? preempt_count_sub+0x5/0xa0
<4>[ 1721.713431]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1721.717016]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1721.720602]  ? si_meminfo+0x3f/0x60
<4>[ 1721.724175]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.727766]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.731347]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.734925]  ? up_read+0x5/0x20
<4>[ 1721.738476]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1721.742057]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1721.745639]  __write_data_page+0x5b7/0x6f0
<4>[ 1721.749222]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1721.752816]  ? perf_trace_sched_kthread_stop_ret+0xb3/0xe0
<4>[ 1721.756455]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1721.760099]  ? __switch_to_asm+0x40/0x70
<4>[ 1721.763738]  ? __schedule+0x2cd/0x8b0
<4>[ 1721.767387]  do_writepages+0x41/0xd0
<4>[ 1721.771034]  ? preempt_schedule_common+0xd/0x80
<4>[ 1721.774708]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1721.778397]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[ 1721.782078]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1721.785749]  ? retint_kernel+0x2d/0x2d
<4>[ 1721.789417]  f2fs_write_node_pages+0x51/0x220
<4>[ 1721.793085]  ? trace_hardirqs_on_caller+0x32/0xf0
<4>[ 1721.796752]  do_writepages+0x41/0xd0
<4>[ 1721.800409]  ? retint_kernel+0x2d/0x2d
<4>[ 1721.804053]  __writeback_single_inode+0x3d/0x3d0
<4>[ 1721.807708]  writeback_sb_inodes+0x1e8/0x410
<4>[ 1721.811369]  __writeback_inodes_wb+0x5d/0xb0
<4>[ 1721.815028]  wb_writeback+0x28f/0x340
<4>[ 1721.818685]  wb_workfn+0x2d3/0x420
<4>[ 1721.822323]  process_one_work+0x1a1/0x3d0
<4>[ 1721.825969]  ? process_one_work+0x3d0/0x3d0
<4>[ 1721.829644]  worker_thread+0x30/0x380
<4>[ 1721.833319]  ? process_one_work+0x3d0/0x3d0
<4>[ 1721.837003]  kthread+0x116/0x130
<4>[ 1721.840676]  ? kthread_create_worker_on_cpu+0x70/0x70
<4>[ 1721.844386]  ret_from_fork+0x3a/0x50
<4>[ 1721.848079] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
nls_cp437 sd_mod uas usb_storage pl2303 x86_pkg_temp_thermal kvm_intel
iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
firewire_ohci firewire_core igb crc_itu_t ahci libahci dca
processor_thermal_device intel_soc_dts_iosf int340x_thermal_zone
pcc_cpufreq efivarfs
<4>[ 1721.856652] ---[ end trace 64133457c53b53fc ]---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

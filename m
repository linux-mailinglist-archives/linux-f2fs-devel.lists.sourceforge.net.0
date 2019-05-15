Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A51F8F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 18:50:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQx71-0001FK-VS; Wed, 15 May 2019 16:50:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hagbardcelin@gmail.com>) id 1hQx71-0001FD-76
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 16:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z3rC4N7ybNAzfZT5EXdqnrtOGwXdlMKtIByBbmxHwfQ=; b=C1gDXJl+QzTbXQJlc9qZa+xhqr
 xq6BNvbgA/tWzue65IcL7QqcBryz7nSlpDB7EHnrm8VWrunE6m+mzZ02hgY79jvH77rC1vRZtYBds
 h2bsygdw6jHmngflGm1dWVR56u6mcT6jKFg4TgJMbQJe9fylPdMOIzKG6NXe4oph2bgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z3rC4N7ybNAzfZT5EXdqnrtOGwXdlMKtIByBbmxHwfQ=; b=Xnv9aObhgQKKEwYoDTd+M+9PJ1
 48mbPaJygM3BFjAM6fDX8ATrZAkGK2qpe4fKO8LL7mnMeLl9DlfkU2IbJ8oeOtSP82tANvuZAGW/m
 rHa4W3xtkk+jTE9nj596k6HKpRF0QM4qyEh35AB5hUgD4tVHy11miuJZuYRdKH5rhOvY=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQx6y-000HB9-E0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 16:50:39 +0000
Received: by mail-lf1-f65.google.com with SMTP id q17so373223lfo.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2019 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=z3rC4N7ybNAzfZT5EXdqnrtOGwXdlMKtIByBbmxHwfQ=;
 b=fwXBC/19UlvOo14AB5Mz6Y1MZMglV9DlO1g5xkv/vWXkivMyoDF6jqHaSTDjnhg41j
 CTD4dt/Qho+7psyozdmasKOMzgr63q19y5Uv26PPhl8h/CsO0EwKo8THiqNFZX+t8zfM
 1sCcBobT4V6PwMnP7aAGU9T6297dvZUrlRMefd5uwzQGRTs1zwXQ/yZRUDmGpIlSCylt
 amgobj9sE3bqEtn9zGJQizlW+ll6kY8VaGkFvOWaBcOBqFJzkVGoqNsDWFyvDLK+lIkM
 U75/z1zx5H9N5qOl4tb1u3fnzm6rNA2JuJAGxP5PXarM7LYKZ4J7cn90BmlSDWm0HqF2
 d0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=z3rC4N7ybNAzfZT5EXdqnrtOGwXdlMKtIByBbmxHwfQ=;
 b=anszFqKKeIOH1byxEYJ7dbAaR6cDsEGK4uTxfZ9ahuvoR6xz42BQxTsUEepADvIcvz
 AL7d2ctfbUdeCqyJgR1sPBzjsMDBUZ+PIBfQrm2SYWswpVdctSd0ZkOcKs59GXDZoFYe
 fcfx6TiPlXrzNybe6i3wRe+49+fUCnfBvvbOuaGmd4NpJ2FB0RHXHqXobcA5LxZGePPf
 MfqN158fM1uXdyolFe09SIlxjiIBVlthe0voRa4h06CxjtEBDm/FiqyceMohre0k/KT2
 Fp9PJJvuEq3vhcN2tWnZCxw+7STR1EnCgqY4i1EYc+TolYYIEgkav8AmyNpXZRkeI8Rt
 1Vcg==
X-Gm-Message-State: APjAAAUAttEH9+YX6IpSKLl3AwRCNhxyNh17Tc6PLLoXWl3DjjYM7/La
 O55vqxF+Npklp4i0s2OwKvBcbMft6KYbq51ucec=
X-Google-Smtp-Source: APXvYqxFuq4XOF6lMgi/UhNCQEk4K4XYHUUA1VzvLsAO5KByb9nrvncNqdy1M/lmOz7HGhH+CtToTIvmeJKRj7TlLz0=
X-Received: by 2002:ac2:51de:: with SMTP id u30mr13415421lfm.42.1557939028793; 
 Wed, 15 May 2019 09:50:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8041:0:0:0:0:0 with HTTP; Wed, 15 May 2019 09:50:27
 -0700 (PDT)
In-Reply-To: <2390a9e9-2365-6e9b-6e8c-22f4542dda1e@huawei.com>
References: <CADoWrG_NTz29eyaa3fUti2sNBP4xp7-zfhDVkix=Kty4rD=Otw@mail.gmail.com>
 <35b643e5-562c-942d-67ce-4a9dbef66d16@huawei.com>
 <5725124a-95c8-cedb-d3a8-d8be86d260dd@huawei.com>
 <CADoWrG9_5izaUMvB0mNLC7yp_Mnnm7yPrqcOvDL2ERR2YrkF2A@mail.gmail.com>
 <452dad75-a4aa-2366-b704-ee5448a3bd71@huawei.com>
 <CADoWrG9V7nD4wzj0DFDAKcjcZHhjC0yPetX_Ce6jj2_YNpU9YA@mail.gmail.com>
 <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
 <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
 <f657d41f-84d6-8cfa-5532-689a03ab2d2e@huawei.com>
 <CADoWrG-RBDWpjTyO4Yz68HRnaUW8OCvCZUkDDmaZM4hR-FNOGA@mail.gmail.com>
 <2390a9e9-2365-6e9b-6e8c-22f4542dda1e@huawei.com>
From: Hagbard Celine <hagbardcelin@gmail.com>
Date: Wed, 15 May 2019 18:50:27 +0200
Message-ID: <CADoWrG8MbLFJX8joszUdwYw6wE1XXvsV01zF=fLz3VgyRUeZXQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hagbardcelin[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hQx6y-000HB9-E0
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

2019-05-15 10:13 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
> On 2019/5/15 16:03, Hagbard Celine wrote:
>> 2019-05-15 4:25 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
>>> On 2019/5/15 2:13, Hagbard Celine wrote:
>>>> 2019-04-02 15:31 GMT+02:00, Chao Yu <chao@kernel.org>:
>>>>> On 2019-4-2 20:41, Hagbard Celine wrote:
>>>>>> That seems to have fixed it. No more errors in syslog after
>>>>>> extracting
>>>>>> my stage3 tarball. Also ran a couple of kernel compiles on a
>>>>>> partition
>>>>>> mounted with data_flush and system seems stable.
>>>>>
>>>>> Thanks a lot for your quick test. :)
>>>>
>>>> My test might have been a little too quick, or I found another
>>>> data_flush bug that behaves similar.
>>>
>>> oops...
>>>
>>>>>>>
>>>>>>> -		if (is_dir)
>>>>>>> -			F2FS_I(inode)->cp_task = current;
>>>>>>> +		F2FS_I(inode)->cp_task = current;
>>>
>>> If you're sure that this patch was applying before you test, I guess we
>>> need
>>> an
>>> extra barrier here to avoid out-of-order execution.
>>>
>>> smp_mb()
>>>
>>>>>>>
>>>>>>>  		filemap_fdatawrite(inode->i_mapping);
>>>>>>>
>>>>>>> -		if (is_dir)
>>>>>>> -			F2FS_I(inode)->cp_task = NULL;
>>>>>>> +		F2FS_I(inode)->cp_task = NULL;
>>>
>>> Thanks,
>>>
>> If I did this correctly; it did not get rid of the stack overflow.
>> Here is what I did:
>>
>> Added smb_mb() in checkpoint.c so the relevant part looks like this:
>>
>> 		unsigned long cur_ino = inode->i_ino;
>>
>> 		F2FS_I(inode)->cp_task = current;
>>
>> 		smp_mb();
>>
>> 		filemap_fdatawrite(inode->i_mapping);
>>
>> 		F2FS_I(inode)->cp_task = NULL;
>>
>> 		iput(inode);
>> 		
>>
>> Compiled, rebooted and ran my test-scripts again. And got this during
>> copy-phase in second script:
>
> It looks very easy to reproduce this bug, could you add log to track
> F2FS_I(inode)->cp_task's value:
That wasn't so easy, with all the logging from those prink the copy
process would hang where it would oops without the printk's.
I was able to reproduse the bug with one of the two printk's at a time
only, and I had to disable syslog-ng and fcron for it not to hang even
then.

Followig is log from two runs, one with each of the printk's, hope it helps.

--BEGIN log one
<4>[  593.806592] write_data_page: inode:710085, cp_task:          (null)
<4>[  593.806688] write_data_page: inode:710110, cp_task:          (null)
<4>[  593.808558] write_data_page: inode:710321, cp_task:          (null)
<4>[  593.808575] write_data_page: inode:710325, cp_task:          (null)
<4>[  593.808590] write_data_page: inode:710326, cp_task:          (null)
<4>[  593.808606] write_data_page: inode:710332, cp_task:          (null)
<4>[  593.966185] write_data_page: inode:721775, cp_task:          (null)
<4>[  593.966203] write_data_page: inode:721776, cp_task:          (null)
<4>[  593.966219] write_data_page: inode:721777, cp_task:          (null)
<4>[  593.966235] write_data_page: inode:721778, cp_task:          (null)
<4>[  593.966250] write_data_page: inode:721779, cp_task:          (null)
<4>[  593.966266] write_data_page: inode:721780, cp_task:          (null)
<4>[  593.966281] write_data_page: inode:721781, cp_task:          (null)
<4>[  593.966296] write_data_page: inode:721782, cp_task:          (null)
<4>[  593.966311] write_data_page: inode:721783, cp_task:          (null)
<4>[  593.966327] write_data_page: inode:721784, cp_task:          (null)
<4>[  593.966343] write_data_page: inode:721785, cp_task:          (null)
<4>[  593.966359] write_data_page: inode:721786, cp_task:          (null)
<4>[  593.966374] write_data_page: inode:721787, cp_task:          (null)
<4>[  594.340072] write_data_page: inode:746183, cp_task:          (null)
<0>[  594.923096] BUG: stack guard page was hit at 000000006e7354a5
(stack is 000000006445beb4..00000000988529ca)
<0>[  594.923108] BUG: stack guard page was hit at 00000000d2c9ec98
(stack is 00000000b417d4d3..000000001b88c4fe)
<4>[  594.926975] kernel stack overflow (double-fault): 0000 [#1]
PREEMPT SMP PTI
<4>[  594.934772] CPU: 7 PID: 2158 Comm: cp Not tainted
5.0.15-gentoo-f2fslog_data_page #5
<4>[  594.938757] Hardware name: To Be Filled By O.E.M. To Be Filled
By O.E.M./C226 WS, BIOS P3.40 06/25/2018
<4>[  594.942880] RIP: 0010:tag_pages_for_writeback+0x0/0x180
<4>[  594.947036] Code: 30 48 83 ff 07 0f 86 eb fe ff ff 49 8b 56 40
49 03 56 38 48 d1 ea 49 89 d0 e9 6a fe ff ff 66 66 2e 0f 1f 84 00 00
00 00 00 90 <e8> 2b 41 9f 00 41 54 48 83 c7 08 55 48 89 d5 53 48 83 ec
38 65 48
<4>[  594.951623] RSP: 0018:ffffb3f0028dc000 EFLAGS: 00010246
<4>[  594.956187] RAX: 0000000000000001 RBX: ffff9ea2d6bd7080 RCX:
ffffb3f0028dc060
<4>[  594.960816] RDX: 0007ffffffffffff RSI: 0000000000000000 RDI:
ffff9ea2d6bd71e0
<4>[  594.965375] RBP: ffffb3f0028dc1f0 R08: ffff9ea43eee0100 R09:
0000000000000000
<4>[  594.969873] R10: ffffffff97e485c0 R11: 0000000000000001 R12:
ffff9ea2d6bd71e0
<4>[  594.974384] R13: 0000000000000009 R14: 0000000000000000 R15:
ffff9ea43bfce000
<4>[  594.978892] FS:  000073c62042f740(0000)
GS:ffff9ea45edc0000(0000) knlGS:0000000000000000
<4>[  594.983467] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  594.988055] CR2: ffffb3f0028dbff8 CR3: 0000000073aa8005 CR4:
00000000003606e0
<4>[  594.992689] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
<4>[  594.997310] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
<4>[  595.001860] Call Trace:
<4>[  595.006323]  f2fs_write_cache_pages+0x102/0x450
<4>[  595.010829]  ? kmem_cache_alloc+0x81/0x6b0
<4>[  595.015219]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  595.019483]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.023749]  ? __enqueue_entity+0x5/0x60
<4>[  595.027995]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.032232]  do_writepages+0x41/0xd0
<4>[  595.036481]  ? preempt_count_add+0x79/0xb0
<4>[  595.040754]  ? preempt_count_sub+0x5/0xa0
<4>[  595.045017]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.049304]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.053594]  ? si_meminfo+0x3f/0x60
<4>[  595.057892]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.062218]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.066549]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.070880]  ? preempt_count_sub+0x5/0xa0
<4>[  595.075077]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.079177]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.083266]  __write_data_page+0x1c8/0x6e0
<4>[  595.087352]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.091460]  ? preempt_count_add+0x79/0xb0
<4>[  595.095565]  ? _raw_spin_lock+0x13/0x30
<4>[  595.099650]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.103769]  ? __enqueue_entity+0x5/0x60
<4>[  595.107922]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.112117]  do_writepages+0x41/0xd0
<4>[  595.116347]  ? preempt_count_add+0x79/0xb0
<4>[  595.120630]  ? preempt_count_sub+0x5/0xa0
<4>[  595.124931]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.129268]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.133636]  ? si_meminfo+0x3f/0x60
<4>[  595.138039]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.142520]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.146992]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.151467]  ? preempt_count_sub+0x5/0xa0
<4>[  595.155947]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.160466]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.164964]  __write_data_page+0x1c8/0x6e0
<4>[  595.169478]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.174019]  ? preempt_count_add+0x79/0xb0
<4>[  595.178545]  ? _raw_spin_lock+0x13/0x30
<4>[  595.183050]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.187613]  ? __enqueue_entity+0x5/0x60
<4>[  595.192150]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.196678]  do_writepages+0x41/0xd0
<4>[  595.201226]  ? preempt_count_add+0x79/0xb0
<4>[  595.205819]  ? preempt_count_sub+0x5/0xa0
<4>[  595.210430]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.214933]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.219454]  ? si_meminfo+0x3f/0x60
<4>[  595.223862]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.228245]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.232543]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.236761]  ? preempt_count_sub+0x5/0xa0
<4>[  595.240792]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.244662]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.248474]  __write_data_page+0x1c8/0x6e0
<4>[  595.252281]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.256076]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.259827]  ? __enqueue_entity+0x5/0x60
<4>[  595.263581]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.267280]  do_writepages+0x41/0xd0
<4>[  595.270917]  ? preempt_count_add+0x79/0xb0
<4>[  595.274529]  ? preempt_count_sub+0x5/0xa0
<4>[  595.278101]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.281681]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.285226]  ? si_meminfo+0x3f/0x60
<4>[  595.288729]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.292263]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.295800]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.299328]  ? preempt_count_sub+0x5/0xa0
<4>[  595.302854]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.306405]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.309936]  __write_data_page+0x1c8/0x6e0
<4>[  595.313471]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.317052]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.320637]  ? __enqueue_entity+0x5/0x60
<4>[  595.324215]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.327802]  do_writepages+0x41/0xd0
<4>[  595.331372]  ? preempt_count_add+0x79/0xb0
<4>[  595.334951]  ? preempt_count_sub+0x5/0xa0
<4>[  595.338497]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.342030]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.345555]  ? si_meminfo+0x3f/0x60
<4>[  595.349054]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.352579]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.356099]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.359604]  ? preempt_count_sub+0x5/0xa0
<4>[  595.363110]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.366639]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.370156]  __write_data_page+0x1c8/0x6e0
<4>[  595.373681]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.377218]  ? __schedule+0x2cd/0x8b0
<4>[  595.380747]  ? __lock_page+0x155/0x240
<4>[  595.384292]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.387868]  ? __enqueue_entity+0x5/0x60
<4>[  595.391445]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.395030]  do_writepages+0x41/0xd0
<4>[  595.398597]  ? preempt_count_add+0x79/0xb0
<4>[  595.402169]  ? preempt_count_sub+0x5/0xa0
<4>[  595.405716]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.409250]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.412777]  ? si_meminfo+0x3f/0x60
<4>[  595.416275]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.419810]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.423335]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.426850]  ? preempt_count_sub+0x5/0xa0
<4>[  595.430370]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.433904]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.437432]  __write_data_page+0x1c8/0x6e0
<4>[  595.440969]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.444511]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.448045]  ? preempt_count_add+0x79/0xb0
<4>[  595.451600]  ? preempt_count_sub+0x5/0xa0
<4>[  595.455136]  ? preempt_count_add+0x79/0xb0
<4>[  595.458661]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.462177]  do_writepages+0x41/0xd0
<4>[  595.465672]  ? preempt_count_add+0x79/0xb0
<4>[  595.469169]  ? preempt_count_sub+0x5/0xa0
<4>[  595.472643]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.476106]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.479555]  ? si_meminfo+0x3f/0x60
<4>[  595.482984]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.486441]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.489880]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.493322]  ? up_read+0x5/0x20
<4>[  595.496743]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  595.500205]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.503660]  __write_data_page+0x1c8/0x6e0
<4>[  595.507118]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.510615]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.514121]  ? __enqueue_entity+0x5/0x60
<4>[  595.517622]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.521142]  do_writepages+0x41/0xd0
<4>[  595.524630]  ? preempt_count_add+0x79/0xb0
<4>[  595.528135]  ? preempt_count_sub+0x5/0xa0
<4>[  595.531601]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.535056]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.538498]  ? si_meminfo+0x3f/0x60
<4>[  595.541912]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.545355]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.548792]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.552235]  ? preempt_count_sub+0x5/0xa0
<4>[  595.555665]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.559120]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.562568]  __write_data_page+0x1c8/0x6e0
<4>[  595.566033]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.569527]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.573022]  ? __enqueue_entity+0x5/0x60
<4>[  595.576517]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.580021]  do_writepages+0x41/0xd0
<4>[  595.583507]  ? preempt_count_add+0x79/0xb0
<4>[  595.586997]  ? preempt_count_sub+0x5/0xa0
<4>[  595.590462]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.593923]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.597377]  ? si_meminfo+0x3f/0x60
<4>[  595.600796]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.604249]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.607691]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.611124]  ? preempt_count_sub+0x5/0xa0
<4>[  595.614569]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.618024]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.621477]  __write_data_page+0x1c8/0x6e0
<4>[  595.624933]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.628396]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.631852]  ? __enqueue_entity+0x5/0x60
<4>[  595.635334]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.638828]  do_writepages+0x41/0xd0
<4>[  595.642314]  ? preempt_count_add+0x79/0xb0
<4>[  595.645816]  ? preempt_count_sub+0x5/0xa0
<4>[  595.649282]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.652726]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.656177]  ? si_meminfo+0x3f/0x60
<4>[  595.659610]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.663057]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.666491]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.669919]  ? preempt_count_sub+0x5/0xa0
<4>[  595.673342]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.676791]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.680243]  __write_data_page+0x1c8/0x6e0
<4>[  595.683722]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.687244]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.690766]  ? __enqueue_entity+0x5/0x60
<4>[  595.694278]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.697809]  do_writepages+0x41/0xd0
<4>[  595.701342]  ? preempt_count_add+0x79/0xb0
<4>[  595.704903]  ? preempt_count_sub+0x5/0xa0
<4>[  595.708451]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.711975]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.715488]  ? si_meminfo+0x3f/0x60
<4>[  595.718983]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.722508]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.726031]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.729539]  ? preempt_count_sub+0x5/0xa0
<4>[  595.733044]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.736581]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.740086]  __write_data_page+0x1c8/0x6e0
<4>[  595.743605]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.747130]  ? _raw_spin_lock+0x13/0x30
<4>[  595.750654]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.754190]  ? __enqueue_entity+0x5/0x60
<4>[  595.757724]  ? enqueue_task_fair+0x4b1/0xb20
<4>[  595.761288]  do_writepages+0x41/0xd0
<4>[  595.764855]  ? preempt_count_add+0x79/0xb0
<4>[  595.768435]  ? preempt_count_sub+0x5/0xa0
<4>[  595.772001]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.775544]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.779091]  ? si_meminfo+0x3f/0x60
<4>[  595.782617]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.786164]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.789709]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.793237]  ? preempt_count_sub+0x5/0xa0
<4>[  595.796755]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.800292]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.803843]  __write_data_page+0x1c8/0x6e0
<4>[  595.807384]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.810944]  ? __enqueue_entity+0x5/0x60
<4>[  595.814491]  ? preempt_count_add+0x79/0xb0
<4>[  595.818039]  ? _raw_spin_lock+0x13/0x30
<4>[  595.821621]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.825212]  ? preempt_count_sub+0x5/0xa0
<4>[  595.828808]  ? _raw_spin_unlock_irqrestore+0x22/0x40
<4>[  595.832427]  ? try_to_wake_up+0x52/0x510
<4>[  595.836032]  do_writepages+0x41/0xd0
<4>[  595.839623]  ? preempt_count_add+0x79/0xb0
<4>[  595.843222]  ? preempt_count_sub+0x5/0xa0
<4>[  595.846785]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.850328]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.853856]  ? si_meminfo+0x3f/0x60
<4>[  595.857374]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.860909]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.864465]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.867996]  ? up_read+0x5/0x20
<4>[  595.871514]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  595.875066]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.878612]  __write_data_page+0x1c8/0x6e0
<4>[  595.882190]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.885795]  ? preempt_count_add+0x79/0xb0
<4>[  595.889400]  ? _raw_spin_lock+0x13/0x30
<4>[  595.893018]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.896624]  ? mempool_alloc+0x65/0x190
<4>[  595.900219]  ? find_get_entry+0xdc/0x150
<4>[  595.903828]  do_writepages+0x41/0xd0
<4>[  595.907416]  ? preempt_count_add+0x79/0xb0
<4>[  595.911003]  ? preempt_count_sub+0x5/0xa0
<4>[  595.914549]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.918081]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.921610]  ? si_meminfo+0x3f/0x60
<4>[  595.925130]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.928670]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.932210]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.935742]  ? unlock_page+0x5/0x30
<4>[  595.939260]  f2fs_balance_fs+0xe5/0x2c0
<4>[  595.942818]  __write_data_page+0x1c8/0x6e0
<4>[  595.946381]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  595.949960]  ? find_busiest_group+0x40/0x580
<4>[  595.953544]  ? preempt_count_add+0x79/0xb0
<4>[  595.957121]  ? _raw_spin_lock+0x13/0x30
<4>[  595.960683]  f2fs_write_data_pages+0x2ed/0x320
<4>[  595.964267]  ? find_get_entry+0xdc/0x150
<4>[  595.967849]  do_writepages+0x41/0xd0
<4>[  595.971404]  ? preempt_count_add+0x79/0xb0
<4>[  595.974962]  ? preempt_count_sub+0x5/0xa0
<4>[  595.978489]  ? _raw_spin_unlock+0x12/0x30
<4>[  595.982005]  ? nr_blockdev_pages+0x59/0x70
<4>[  595.985505]  ? si_meminfo+0x3f/0x60
<4>[  595.988990]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  595.992488]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  595.995995]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  595.999497]  ? unlock_page+0x5/0x30
<4>[  596.002978]  f2fs_balance_fs+0xe5/0x2c0
<4>[  596.006497]  __write_data_page+0x1c8/0x6e0
<4>[  596.010031]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  596.013590]  ? stat_show+0xd01/0x1280
<4>[  596.017136]  ? up_read+0x5/0x20
<4>[  596.020661]  ? f2fs_getxattr+0x19e/0x3e0
<4>[  596.024194]  ? preempt_count_add+0x79/0xb0
<4>[  596.027720]  ? _raw_spin_lock+0x13/0x30
<4>[  596.031237]  f2fs_write_data_pages+0x2ed/0x320
<4>[  596.034759]  ? preempt_count_add+0x79/0xb0
<4>[  596.038254]  ? preempt_count_sub+0x5/0xa0
<4>[  596.041726]  ? _raw_spin_unlock+0x12/0x30
<4>[  596.045174]  ? f2fs_inode_dirtied+0x64/0xf0
<4>[  596.048619]  ? preempt_count_add+0x79/0xb0
<4>[  596.052066]  ? preempt_count_sub+0x5/0xa0
<4>[  596.055503]  do_writepages+0x41/0xd0
<4>[  596.058916]  ? preempt_count_add+0x79/0xb0
<4>[  596.062334]  ? preempt_count_sub+0x5/0xa0
<4>[  596.065718]  ? _raw_spin_unlock+0x12/0x30
<4>[  596.069076]  ? nr_blockdev_pages+0x59/0x70
<4>[  596.072438]  ? si_meminfo+0x3f/0x60
<4>[  596.075787]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  596.079190]  f2fs_sync_dirty_inodes+0xb7/0x1f0
<4>[  596.082605]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  596.086024]  f2fs_balance_fs+0xe5/0x2c0
<4>[  596.089415]  f2fs_create+0x131/0x3e0
<4>[  596.092781]  ? f2fs_lookup+0x20e/0x360
<4>[  596.096141]  path_openat+0x11a8/0x1590
<4>[  596.099493]  do_filp_open+0x93/0x100
<4>[  596.102836]  ? preempt_count_sub+0x5/0xa0
<4>[  596.106176]  do_sys_open+0x186/0x220
<4>[  596.109496]  do_syscall_64+0x69/0x399
<4>[  596.112799]  ? trace_hardirqs_off_thunk+0x1a/0x1c
<4>[  596.116121]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
<4>[  596.119459] RIP: 0033:0x73c62051f112
<4>[  596.122789] Code: 25 00 00 41 00 3d 00 00 41 00 74 4c 48 8d 05
d5 42 0d 00 8b 00 85 c0 75 6d 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff
ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a2 00 00 00 48 8b 4c 24 28 64 48
33 0c 25
<4>[  596.126545] RSP: 002b:00007ffe665bf1a0 EFLAGS: 00000246
ORIG_RAX: 0000000000000101
<4>[  596.130299] RAX: ffffffffffffffda RBX: 00007ffe665bf8f0 RCX:
000073c62051f112
<4>[  596.134110] RDX: 00000000000000c1 RSI: 00005670d5042690 RDI:
00000000ffffff9c
<4>[  596.137944] RBP: 00007ffe665bf5e0 R08: 00007ffe665bf8f0 R09:
00007ffe665bf8f0
<4>[  596.141784] R10: 0000000000000180 R11: 0000000000000246 R12:
00000000000001a4
<4>[  596.145664] R13: 0000000000000003 R14: 0000000000008000 R15:
0000000000000000
<4>[  596.149536] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
nls_cp437 uas usb_storage pl2303 sd_mod x86_pkg_temp_thermal kvm_intel
iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
firewire_ohci firewire_core igb ahci crc_itu_t
processor_thermal_device libahci dca intel_soc_dts_iosf
int340x_thermal_zone pcc_cpufreq efivarfs
<4>[  596.158385] ---[ end trace d508e01f5312dbde ]---
--END log one

--BEGIN log two
<4>[  462.870628] sync_dirty_inodes: inode:624255, cp_task:000000006480c3a0
<4>[  462.870633] sync_dirty_inodes: inode:624255, cp_task:000000002fea927f
<4>[  462.870634] sync_dirty_inodes: inode:624257, cp_task:000000006480c3a0
<4>[  462.870638] sync_dirty_inodes: inode:624257, cp_task:000000002fea927f
<4>[  462.870660] sync_dirty_inodes: inode:623968, cp_task:000000002fea927f
<4>[  462.870665] sync_dirty_inodes: inode:623970, cp_task:000000002fea927f
<4>[  462.870679] sync_dirty_inodes: inode:623974, cp_task:000000002fea927f
<4>[  462.870681] sync_dirty_inodes: inode:623974, cp_task:000000006480c3a0
<4>[  462.870691] sync_dirty_inodes: inode:623975, cp_task:000000002fea927f
<4>[  462.870696] sync_dirty_inodes: inode:623976, cp_task:000000002fea927f
<4>[  462.870697] sync_dirty_inodes: inode:623976, cp_task:000000006480c3a0
<4>[  462.870711] sync_dirty_inodes: inode:623978, cp_task:000000006480c3a0
<4>[  462.870715] sync_dirty_inodes: inode:623981, cp_task:000000006480c3a0
<4>[  462.870717] sync_dirty_inodes: inode:623981, cp_task:000000002fea927f
<4>[  462.870719] sync_dirty_inodes: inode:623982, cp_task:000000006480c3a0
<4>[  462.870721] sync_dirty_inodes: inode:623982, cp_task:000000002fea927f
<4>[  462.870754] sync_dirty_inodes: inode:623986, cp_task:000000002fea927f
<4>[  462.870755] sync_dirty_inodes: inode:623986, cp_task:000000006480c3a0
<4>[  462.870774] sync_dirty_inodes: inode:623987, cp_task:000000006480c3a0
<4>[  462.870775] sync_dirty_inodes: inode:623987, cp_task:000000002fea927f
<4>[  462.870783] sync_dirty_inodes: inode:623988, cp_task:000000002fea927f
<4>[  462.870788] sync_dirty_inodes: inode:623991, cp_task:000000002fea927f
<4>[  462.870794] sync_dirty_inodes: inode:623993, cp_task:000000002fea927f
<4>[  462.870795] sync_dirty_inodes: inode:623993, cp_task:000000006480c3a0
<4>[  462.870801] sync_dirty_inodes: inode:623995, cp_task:000000006480c3a0
<4>[  462.870808] sync_dirty_inodes: inode:623995, cp_task:000000002fea927f
<4>[  462.870810] sync_dirty_inodes: inode:623995, cp_task:000000002fea927f
<4>[  462.870812] sync_dirty_inodes: inode:623998, cp_task:000000002fea927f
<4>[  462.870813] sync_dirty_inodes: inode:623998, cp_task:000000006480c3a0
<4>[  462.870848] sync_dirty_inodes: inode:624000, cp_task:000000002fea927f
<4>[  462.870852] sync_dirty_inodes: inode:624000, cp_task:000000006480c3a0
<4>[  462.870853] sync_dirty_inodes: inode:624003, cp_task:000000002fea927f
<4>[  462.870856] sync_dirty_inodes: inode:624003, cp_task:000000006480c3a0
<4>[  462.870858] sync_dirty_inodes: inode:624004, cp_task:000000002fea927f
<4>[  462.870860] sync_dirty_inodes: inode:624004, cp_task:000000006480c3a0
<4>[  462.870862] sync_dirty_inodes: inode:624007, cp_task:000000002fea927f
<4>[  462.870863] sync_dirty_inodes: inode:624007, cp_task:000000006480c3a0
<4>[  462.870875] sync_dirty_inodes: inode:624009, cp_task:000000006480c3a0
<4>[  462.870902] sync_dirty_inodes: inode:624009, cp_task:000000002fea927f
<4>[  462.870905] sync_dirty_inodes: inode:624010, cp_task:000000002fea927f
<4>[  462.870908] sync_dirty_inodes: inode:624010, cp_task:000000006480c3a0
<4>[  462.870913] sync_dirty_inodes: inode:624013, cp_task:000000002fea927f
<4>[  462.870917] sync_dirty_inodes: inode:624014, cp_task:000000002fea927f
<4>[  462.870921] sync_dirty_inodes: inode:624014, cp_task:000000006480c3a0
<4>[  462.870947] sync_dirty_inodes: inode:624016, cp_task:000000006480c3a0
<4>[  462.870951] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
<4>[  462.870953] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
<4>[  462.870955] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
<4>[  462.870956] sync_dirty_inodes: inode:624017, cp_task:000000002fea927f
<4>[  462.870958] sync_dirty_inodes: inode:624017, cp_task:000000006480c3a0
<4>[  462.870961] sync_dirty_inodes: inode:624021, cp_task:000000002fea927f
<4>[  462.870962] sync_dirty_inodes: inode:624021, cp_task:000000006480c3a0
<4>[  462.870968] sync_dirty_inodes: inode:624022, cp_task:000000006480c3a0
<4>[  462.870970] sync_dirty_inodes: inode:624022, cp_task:000000002fea927f
<4>[  462.870975] sync_dirty_inodes: inode:624024, cp_task:000000006480c3a0
<4>[  462.870976] sync_dirty_inodes: inode:624024, cp_task:000000002fea927f
<4>[  462.870989] sync_dirty_inodes: inode:624026, cp_task:000000002fea927f
<4>[  462.870990] sync_dirty_inodes: inode:624026, cp_task:000000006480c3a0
<0>[  462.870997] BUG: stack guard page was hit at 0000000056e52d0a
(stack is 00000000f6235c3f..00000000f20b69a0)
<4>[  462.876404] kernel stack overflow (double-fault): 0000 [#1]
PREEMPT SMP PTI
<4>[  462.881794] CPU: 6 PID: 875 Comm: kworker/u16:9 Not tainted
5.0.15-gentoo-f2fslog_sync_dirty_inodes #5
<4>[  462.887185] Hardware name: To Be Filled By O.E.M. To Be Filled
By O.E.M./C226 WS, BIOS P3.40 06/25/2018
<4>[  462.892563] Workqueue: writeback wb_workfn (flush-259:0)
<4>[  462.897877] RIP: 0010:tracer_hardirqs_off+0x4/0xf0
<4>[  462.903078] Code: ee 48 0f 44 dd 4c 89 ff 48 89 da e8 d6 f9 ff
ff 49 c7 45 20 00 00 00 00 f0 41 ff 4d 00 e9 67 ff ff ff 0f 1f 40 00
41 57 41 56 <41> 55 41 54 55 53 48 83 ec 08 65 44 8b 25 0a 9f 06 4b f6
05 53 12
<4>[  462.908571] RSP: 0018:ffffaa364054c000 EFLAGS: 00010046
<4>[  462.913921] RAX: 0000000000000000 RBX: ffff962b5b81ca80 RCX:
ffffffffb6b66b50
<4>[  462.919235] RDX: ffffffffb6b66b40 RSI: 0000000000000000 RDI:
ffffffffb5059c74
<4>[  462.924523] RBP: 0000000000411200 R08: 0000000000000002 R09:
0000000000000001
<4>[  462.929772] R10: 0000000001cb731b R11: 0000000001cb731c R12:
0000000000411200
<4>[  462.934889] R13: 0000000000000246 R14: ffffaa364054c0c8 R15:
ffffffffb4f29520
<4>[  462.939888] FS:  0000000000000000(0000)
GS:ffff962b5ed80000(0000) knlGS:0000000000000000
<4>[  462.944841] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  462.949681] CR2: ffffaa364054bff8 CR3: 000000072380c002 CR4:
00000000003606e0
<4>[  462.954463] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
<4>[  462.959191] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
<4>[  462.963797] Call Trace:
<4>[  462.968280]  ? finish_wait+0x80/0x80
<4>[  462.972785]  trace_hardirqs_off+0x2b/0xe0
<4>[  462.977174]  kmem_cache_alloc+0x44/0x6b0
<4>[  462.981443]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  462.985703]  ? finish_wait+0x80/0x80
<4>[  462.989939]  mempool_alloc+0x65/0x190
<4>[  462.994143]  ? preempt_count_add+0x79/0xb0
<4>[  462.998379]  bio_alloc_bioset+0x140/0x210
<4>[  463.002628]  f2fs_submit_page_write+0x1bb/0x5e0
<4>[  463.006912]  do_write_page+0x99/0x180
<4>[  463.011201]  f2fs_outplace_write_data+0x55/0xe0
<4>[  463.015538]  f2fs_do_write_data_page+0x588/0x940
<4>[  463.019897]  __write_data_page+0x4f2/0x6f0
<4>[  463.024251]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.028616]  ? pointer+0x110/0x3b0
<4>[  463.032972]  ? log_store+0xf5/0x260
<4>[  463.037183]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.041277]  ? __down_trylock_console_sem.isra.14+0x42/0x50
<4>[  463.045404]  ? vprintk_emit+0x28f/0x2a0
<4>[  463.049517]  do_writepages+0x41/0xd0
<4>[  463.053634]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.057778]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.061911]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.066055]  ? up_read+0x5/0x20
<4>[  463.070224]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.074464]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.078742]  __write_data_page+0x5b7/0x6f0
<4>[  463.083072]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.087459]  ? pointer+0x110/0x3b0
<4>[  463.091880]  ? log_store+0xf5/0x260
<4>[  463.096333]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.100853]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.105422]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.109943]  do_writepages+0x41/0xd0
<4>[  463.114451]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.119000]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.123565]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.128116]  ? up_read+0x5/0x20
<4>[  463.132657]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.137238]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.141817]  __write_data_page+0x5b7/0x6f0
<4>[  463.146390]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[  463.151025]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.155642]  ? pointer+0x110/0x3b0
<4>[  463.160240]  ? log_store+0xf5/0x260
<4>[  463.164859]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.169533]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.174254]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.178838]  do_writepages+0x41/0xd0
<4>[  463.183323]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.187757]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.192105]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.196367]  ? up_read+0x5/0x20
<4>[  463.200592]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.204670]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.208563]  __write_data_page+0x5b7/0x6f0
<4>[  463.212425]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.216279]  ? pointer+0x110/0x3b0
<4>[  463.220107]  ? log_store+0xf5/0x260
<4>[  463.223927]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.227747]  ? __down_trylock_console_sem.isra.14+0x42/0x50
<4>[  463.231564]  ? vprintk_emit+0x28f/0x2a0
<4>[  463.235333]  do_writepages+0x41/0xd0
<4>[  463.239049]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.242783]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.246543]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.250250]  ? up_read+0x5/0x20
<4>[  463.253949]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.257687]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.261419]  __write_data_page+0x5b7/0x6f0
<4>[  463.265159]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.268916]  ? pointer+0x110/0x3b0
<4>[  463.272675]  ? log_store+0xf5/0x260
<4>[  463.276420]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.280192]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.283952]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.287664]  do_writepages+0x41/0xd0
<4>[  463.291360]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.295087]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.298810]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.302519]  ? up_read+0x5/0x20
<4>[  463.306207]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.309944]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.313670]  __write_data_page+0x5b7/0x6f0
<4>[  463.317379]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.321080]  ? pointer+0x110/0x3b0
<4>[  463.324773]  ? log_store+0xf5/0x260
<4>[  463.328444]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.332132]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.335820]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.339467]  do_writepages+0x41/0xd0
<4>[  463.343094]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.346740]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.350392]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.354029]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.357687]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.361353]  __write_data_page+0x5b7/0x6f0
<4>[  463.365020]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.368695]  ? pointer+0x110/0x3b0
<4>[  463.372399]  ? log_store+0xf5/0x260
<4>[  463.376091]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.379796]  ? __down_trylock_console_sem.isra.14+0x42/0x50
<4>[  463.383534]  ? vprintk_emit+0x28f/0x2a0
<4>[  463.387267]  do_writepages+0x41/0xd0
<4>[  463.390989]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.394729]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.398460]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.402181]  ? up_read+0x5/0x20
<4>[  463.405875]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.409590]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.413295]  __write_data_page+0x5b7/0x6f0
<4>[  463.417019]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.420752]  ? pointer+0x110/0x3b0
<4>[  463.424466]  ? log_store+0xf5/0x260
<4>[  463.428207]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.431971]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.435729]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.439437]  do_writepages+0x41/0xd0
<4>[  463.443137]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.446863]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.450581]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.454281]  ? up_read+0x5/0x20
<4>[  463.457962]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.461671]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.465368]  __write_data_page+0x5b7/0x6f0
<4>[  463.469084]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.472807]  ? pointer+0x110/0x3b0
<4>[  463.476499]  ? log_store+0xf5/0x260
<4>[  463.480154]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.483842]  ? __down_trylock_console_sem.isra.14+0x42/0x50
<4>[  463.487562]  ? vprintk_emit+0x28f/0x2a0
<4>[  463.491266]  do_writepages+0x41/0xd0
<4>[  463.494963]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.498684]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.502397]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.506098]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.509824]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.513542]  __write_data_page+0x5b7/0x6f0
<4>[  463.517257]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.521001]  ? pointer+0x110/0x3b0
<4>[  463.524731]  ? log_store+0xf5/0x260
<4>[  463.528437]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.532208]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.535979]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.539701]  do_writepages+0x41/0xd0
<4>[  463.543413]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.547150]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.550888]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.554611]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.558355]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.562091]  __write_data_page+0x5b7/0x6f0
<4>[  463.565824]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.569569]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.573317]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.577052]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.580741]  do_writepages+0x41/0xd0
<4>[  463.584464]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.588216]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.591965]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.595696]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.599454]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.603195]  __write_data_page+0x5b7/0x6f0
<4>[  463.606931]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.610679]  ? pointer+0x110/0x3b0
<4>[  463.614406]  ? log_store+0xf5/0x260
<4>[  463.618115]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.621860]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.625598]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.629284]  do_writepages+0x41/0xd0
<4>[  463.632926]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.636607]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.640281]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.643949]  ? up_read+0x5/0x20
<4>[  463.647596]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[  463.651274]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.654945]  __write_data_page+0x5b7/0x6f0
<4>[  463.658605]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.662281]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.665936]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.669582]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.673203]  do_writepages+0x41/0xd0
<4>[  463.676809]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.680434]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.684108]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.687775]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.691461]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.695135]  __write_data_page+0x5b7/0x6f0
<4>[  463.698813]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.702513]  ? pointer+0x110/0x3b0
<4>[  463.706187]  ? log_store+0xf5/0x260
<4>[  463.709837]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.713508]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.717171]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.720786]  do_writepages+0x41/0xd0
<4>[  463.724405]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.728046]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.731666]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.735258]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[  463.738885]  f2fs_balance_fs+0xe5/0x2c0
<4>[  463.742501]  __write_data_page+0x5b7/0x6f0
<4>[  463.746115]  f2fs_write_cache_pages+0x1e0/0x450
<4>[  463.749744]  ? pointer+0x110/0x3b0
<4>[  463.753345]  ? log_store+0xf5/0x260
<4>[  463.756920]  f2fs_write_data_pages+0x2ed/0x320
<4>[  463.760517]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.764105]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.767643]  do_writepages+0x41/0xd0
<4>[  463.771191]  __filemap_fdatawrite_range+0x81/0xb0
<4>[  463.774760]  f2fs_sync_dirty_inodes+0x1dd/0x200
<4>[  463.778328]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[  463.781928]  ? trace_hardirqs_on+0x2c/0xe0
<4>[  463.785524]  ? retint_kernel+0x2d/0x2d
<4>[  463.789100]  f2fs_write_node_pages+0x51/0x220
<4>[  463.792687]  ? trace_hardirqs_on_caller+0x32/0xf0
<4>[  463.796285]  do_writepages+0x41/0xd0
<4>[  463.799860]  ? retint_kernel+0x2d/0x2d
<4>[  463.803417]  __writeback_single_inode+0x3d/0x3d0
<4>[  463.806999]  writeback_sb_inodes+0x1e8/0x410
<4>[  463.810573]  __writeback_inodes_wb+0x5d/0xb0
<4>[  463.814158]  wb_writeback+0x28f/0x340
<4>[  463.817730]  wb_workfn+0x2d3/0x420
<4>[  463.821328]  process_one_work+0x1a1/0x3d0
<4>[  463.824935]  worker_thread+0x30/0x380
<4>[  463.828520]  ? process_one_work+0x3d0/0x3d0
<4>[  463.832105]  kthread+0x116/0x130
<4>[  463.835675]  ? kthread_create_worker_on_cpu+0x70/0x70
<4>[  463.839278]  ret_from_fork+0x3a/0x50
<4>[  463.842855] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
nls_cp437 uas usb_storage pl2303 sd_mod x86_pkg_temp_thermal kvm_intel
iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
firewire_ohci firewire_core igb crc_itu_t dca ahci libahci
processor_thermal_device intel_soc_dts_iosf int340x_thermal_zone
pcc_cpufreq efivarfs
<4>[  463.851196] ---[ end trace b6d0a43e90218d45 ]---
--END log two

>
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1074,6 +1074,11 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi,
> enum
> inode_type type)
>
>                 F2FS_I(inode)->cp_task = current;
>
> +               smp_mb();
> +
> +               printk("sync_dirty_inodes: inode:%lu, cp_task:%p",
> +                       inode->i_ino, F2FS_I(inode)->cp_task);
> +
>                 filemap_fdatawrite(inode->i_mapping);
>
>                 F2FS_I(inode)->cp_task = NULL;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 88988241a0e8..84fbbd337c37 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2392,6 +2392,10 @@ int f2fs_write_single_data_page(struct page *page,
> int
> *submitted,
>         if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
>                                         !F2FS_I(inode)->cp_task) {
>                 f2fs_submit_ipu_bio(sbi, bio, page);
> +
> +               printk("write_data_page: inode:%lu, cp_task:%p",
> +                       inode->i_ino, F2FS_I(inode)->cp_task);
> +
>                 f2fs_balance_fs(sbi, need_balance_fs);
>         }
>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

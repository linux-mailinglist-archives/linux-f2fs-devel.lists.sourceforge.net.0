Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2111CECE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 20:14:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQbwF-0008KE-56; Tue, 14 May 2019 18:14:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hagbardcelin@gmail.com>) id 1hQbwE-0008K7-0n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 18:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:References:In-Reply-To:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4tCRkgi27b1iCRS1TEBi6B1VYhBW7f3iqTZFf52IdQ0=; b=SCHNyZJwE16ngrh0tWesfrNGaT
 8JBOZPe+YO3yq+drE3xDC6uApTBRcwD7wm45izYQRMtwvXz36henwkXTyNBowRDXfQwJSwwvU9uUg
 Oj86BbyCbQ8K+fTUqzS7HADqCqCKh7Ykj4dwT44aubW8j/SulN85EaQy+FTTF02oLqFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4tCRkgi27b1iCRS1TEBi6B1VYhBW7f3iqTZFf52IdQ0=; b=Bq/XD73hXxXKlIfTnSgBSHk/0M
 /4p7/qr28TKYZ9bdid/LAyKKsxS1pe0PwEfQfVyFzpZlk+3BRkr7GLN3U/YpsS+ztGc3kY0OtiK2g
 FulTbo4uqZhnOIH7Ue30hYDlN80yr+tywh7FYOZAhm2ZY/rzDCz2f04hwCgybDv4qxPw=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQbwB-00GMrY-KX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 18:14:05 +0000
Received: by mail-lj1-f193.google.com with SMTP id a10so117737ljf.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 May 2019 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4tCRkgi27b1iCRS1TEBi6B1VYhBW7f3iqTZFf52IdQ0=;
 b=BBdQXGHerdCS5YhQ7V+VvMbXKW8MREL4gRwcGpBudKTRIb3hel7z+l7DQp70IZTKSM
 qm3NxayUn7ORWcL3IwX0gMXhAQNzhmMNitPJHC4U19MqpaXrX9DcYJmcSp7UIINNhYcH
 Ez3P5gcZN7kik++Ul2OHQ2yZocCc/eCZAjyPyvzDsm8jl80QjXrXgvanY769jFuMchr0
 qEXxKVxWtvM9zBOIbG7H3Bx+iQP8jWYl6LPcFzsfQZpgL8RMMCGIclrl9bTLdF8dUi8W
 qdgtEiDA0el5llwheh5Q8+JWeeeDVHIyFr9CLDKHLzbdXge6e7gkNX0+b63q/0T4r4Vm
 Yw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4tCRkgi27b1iCRS1TEBi6B1VYhBW7f3iqTZFf52IdQ0=;
 b=OdKOsaiw86ZwCyiCqh0Ee+hcUkUtSexyF80vAL1ty7UQAMHHZtixDzBYyGcKbCv7Nk
 YQzKot8D1mOtRdRdmc7xSd4wijI+zcx/PTNbiNOZvd6aXxpD0zNsSjUlh96HqCgD86tS
 6qbMCxyXI+F+H08muHD8sfx8Rgt/ZIDQPYOL06XMqEZCIa1GqU7lI645cVgXLRRqB2Fc
 3/cADsU3yI2yVzW4LyEpHVgxB9CrGeo4c2WUgcP3ApsJI7EJizTzbRrYBsrmTl3e2FQR
 2BM17ggVheNyE3LvdAwjic4nWJ64N2Oc2oEtOtVF4fTQLZSAygVCxdZOM5ta/qy2h4O2
 W/PQ==
X-Gm-Message-State: APjAAAWIMAyd2ty+ImM4BkWmsTTecbrrqwuI6hobzahy5BiQegyjgEL7
 t7d0nSaP1QJH3NN89bUAZaJXN14McVsAKo+5xog=
X-Google-Smtp-Source: APXvYqx5JDElTFHgfp09lYJv4UJXzmQn2RwoWcEZLYR9CtpHGX72agG5jYrITqx8/Z9Pu9WRGDVuC+JWDEdzPdtm26U=
X-Received: by 2002:a2e:8909:: with SMTP id d9mr12873141lji.93.1557857636331; 
 Tue, 14 May 2019 11:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8041:0:0:0:0:0 with HTTP; Tue, 14 May 2019 11:13:55
 -0700 (PDT)
In-Reply-To: <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
References: <CADoWrG_NTz29eyaa3fUti2sNBP4xp7-zfhDVkix=Kty4rD=Otw@mail.gmail.com>
 <35b643e5-562c-942d-67ce-4a9dbef66d16@huawei.com>
 <5725124a-95c8-cedb-d3a8-d8be86d260dd@huawei.com>
 <CADoWrG9_5izaUMvB0mNLC7yp_Mnnm7yPrqcOvDL2ERR2YrkF2A@mail.gmail.com>
 <452dad75-a4aa-2366-b704-ee5448a3bd71@huawei.com>
 <CADoWrG9V7nD4wzj0DFDAKcjcZHhjC0yPetX_Ce6jj2_YNpU9YA@mail.gmail.com>
 <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
From: Hagbard Celine <hagbardcelin@gmail.com>
Date: Tue, 14 May 2019 20:13:55 +0200
Message-ID: <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hagbardcelin[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hQbwB-00GMrY-KX
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

2019-04-02 15:31 GMT+02:00, Chao Yu <chao@kernel.org>:
> On 2019-4-2 20:41, Hagbard Celine wrote:
>> That seems to have fixed it. No more errors in syslog after extracting
>> my stage3 tarball. Also ran a couple of kernel compiles on a partition
>> mounted with data_flush and system seems stable.
>
> Thanks a lot for your quick test. :)

My test might have been a little too quick, or I found another
data_flush bug that behaves similar.

While trying to find a faster method to trigger the "watchdog: BUG:
soft lockup.. after heavy disk access" issue I reported in another
mail; I got again "stack guard page was hit...", "kernel stack
overflow (double-fault)..." which appear only when mounted with
data_flush.

What I did to trigger this time was I made two scripts:

--BEGIN first script
#!/bin/bash
mkfs.f2fs -a 1 -f -i -l NVME_Exherbo-ts2 -o 7 /dev/nvme0n1p7
mount -o "rw,relatime,lazytime,background_gc=on,disable_ext_identify,discard,heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,data_flush,mode=adaptive,active_logs=6,whint_mode=fs-based,alloc_mode=default,fsync_mode=strict"
/dev/nvme0n1p7 /mnt/exherbo-2tst/
mount -o "rw,relatime,lazytime,background_gc=on,disable_ext_identify,discard,heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,data_flush,mode=adaptive,active_logs=6,whint_mode=fs-based,alloc_mode=default,fsync_mode=strict"
/dev/nvme0n1p8 /mnt/exherbo
mkdir /mnt/exherbo-2tst/a
mkdir /mnt/exherbo-2tst/b
mkdir /mnt/exherbo-2tst/c
mkdir /mnt/exherbo-2tst/d
mkdir /mnt/exherbo-2tst/e
mkdir /mnt/exherbo-2tst/f
mkdir /mnt/exherbo-2tst/g
mkdir /mnt/exherbo-2tst/h
cd /mnt/exherbo
cp -a . /mnt/exherbo-2tst/a
cp -a . /mnt/exherbo-2tst/b
cp -a . /mnt/exherbo-2tst/c
cp -a . /mnt/exherbo-2tst/d
cp -a . /mnt/exherbo-2tst/e
cp -a . /mnt/exherbo-2tst/f
cp -a . /mnt/exherbo-2tst/g
cp -a . /mnt/exherbo-2tst/h
cd
df -h
umount /mnt/exherbo
umount /mnt/exherbo-2tst/
--END first script

--BEGIN second script
#!/bin/bash
mount -o "rw,relatime,lazytime,background_gc=on,disable_ext_identify,discard,heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,data_flush,mode=adaptive,active_logs=6,whint_mode=fs-based,alloc_mode=default,fsync_mode=strict"
/dev/nvme0n1p7 /mnt/exherbo-2tst/
mount -o "rw,relatime,lazytime,background_gc=on,disable_ext_identify,discard,heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,data_flush,mode=adaptive,active_logs=6,whint_mode=fs-based,alloc_mode=default,fsync_mode=strict"
/dev/nvme0n1p8 /mnt/exherbo
cd /mnt/exherbo-2tst/
rm -r *
cd
mkdir /mnt/exherbo-2tst/a
mkdir /mnt/exherbo-2tst/b
mkdir /mnt/exherbo-2tst/c
mkdir /mnt/exherbo-2tst/d
mkdir /mnt/exherbo-2tst/e
mkdir /mnt/exherbo-2tst/f
mkdir /mnt/exherbo-2tst/g
mkdir /mnt/exherbo-2tst/h
cd /mnt/exherbo
cp -a . /mnt/exherbo-2tst/a
cp -a . /mnt/exherbo-2tst/b
cp -a . /mnt/exherbo-2tst/c
cp -a . /mnt/exherbo-2tst/d
cp -a . /mnt/exherbo-2tst/e
cp -a . /mnt/exherbo-2tst/f
cp -a . /mnt/exherbo-2tst/g
cp -a . /mnt/exherbo-2tst/h
cd
df -h
umount /mnt/exherbo
umount /mnt/exherbo-2tst/
--END second script

I ran these in order, with /dev/nvme0n1p8(sorce partition) formatted
with same options as used on /dev/nvme0n1p7 in script and containing a
exherbo-install of 17GB according to "df -h".
When running the second script the bug triggers during copying every
time. If I remove data_flush from mount options in scripts, bug does
not trigger. Both partitions used are 128GB in size.

This was on kernel-5.0.15 with "[PATCH] f2fs: fix potential recursive
call when enabling data_flush" by Chao Yu

Syslog follows:
<6>[ 1020.669305] EXT4-fs (nvme0n1p2): mounted filesystem with ordered
data mode. Opts: discard
<5>[ 1400.426449] F2FS-fs (nvme0n1p7): Found nat_bits in checkpoint
<5>[ 1400.487987] F2FS-fs (nvme0n1p7): Mounted with checkpoint version
= 7f73ca21
<5>[ 1400.528024] F2FS-fs (nvme0n1p8): Mounted with checkpoint version
= 7a6b5e4a
<5>[ 1678.585243] F2FS-fs (nvme0n1p7): Found nat_bits in checkpoint
<5>[ 1678.629891] F2FS-fs (nvme0n1p7): Mounted with checkpoint version
= 7f73cba1
<5>[ 1678.664250] F2FS-fs (nvme0n1p8): Mounted with checkpoint version
= 7a6b5e4e
<0>[ 1810.859985] BUG: stack guard page was hit at 00000000973394e8
(stack is 000000005c69b096..000000005a84ab36)
<4>[ 1810.864326] kernel stack overflow (double-fault): 0000 [#1]
PREEMPT SMP PTI
<4>[ 1810.868562] CPU: 0 PID: 2328 Comm: cp Not tainted 5.0.15-gentoo #2
<4>[ 1810.872779] Hardware name: To Be Filled By O.E.M. To Be Filled
By O.E.M./C226 WS, BIOS P3.40 06/25/2018
<4>[ 1810.877036] RIP: 0010:__alloc_pages_nodemask+0x0/0x230
<4>[ 1810.881238] Code: 83 3c 24 08 0f 84 f7 fa ff ff 8b 4c 24 44 85
c9 0f 85 eb fa ff ff c7 44 24 38 00 00 00 00 e9 df f4 ff ff e8 b2 1c
ee ff 66 90 <e8> fb 64 9f 00 41 56 41 55 41 54 55 53 48 83 ec 30 65 48
8b 04 25
<4>[ 1810.885794] RSP: 0018:ffffa8b7c2bb4000 EFLAGS: 00010006
<4>[ 1810.890226] RAX: 0000000000000000 RBX: ffff98307ec1b840 RCX:
0000000000000000
<4>[ 1810.894584] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000415200
<4>[ 1810.898789] RBP: 0000000000411200 R08: ffff98307d654840 R09:
0000000000000002
<4>[ 1810.902961] R10: 0000000000024638 R11: ffffffffffffffb8 R12:
0000000000411200
<4>[ 1810.907099] R13: 0000000000000000 R14: ffffc8b7bfc06a90 R15:
000000000000000c
<4>[ 1810.911222] FS:  000078b3bca47740(0000)
GS:ffff98309ec00000(0000) knlGS:0000000000000000
<4>[ 1810.915417] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[ 1810.919645] CR2: ffffa8b7c2bb3ff8 CR3: 00000003c4d2e002 CR4:
00000000003606f0
<4>[ 1810.923967] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
<4>[ 1810.928339] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
<4>[ 1810.932722] Call Trace:
<4>[ 1810.937105]  cache_grow_begin.constprop.72+0x77/0x460
<4>[ 1810.941576]  kmem_cache_alloc+0x1ae/0x6b0
<4>[ 1810.946065]  ? finish_wait+0x80/0x80
<4>[ 1810.950549]  mempool_alloc+0x65/0x190
<4>[ 1810.955044]  ? finish_wait+0x80/0x80
<4>[ 1810.959549]  ? mempool_alloc+0x65/0x190
<4>[ 1810.964087]  bvec_alloc+0x81/0xd0
<4>[ 1810.968634]  bio_alloc_bioset+0x1a7/0x210
<4>[ 1810.973233]  f2fs_submit_page_write+0x1bb/0x5e0
<4>[ 1810.977889]  do_write_page+0x99/0x180
<4>[ 1810.982581]  f2fs_outplace_write_data+0x55/0xe0
<4>[ 1810.987334]  f2fs_do_write_data_page+0x588/0x940
<4>[ 1810.992080]  __write_data_page+0x4f2/0x6f0
<4>[ 1810.996845]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.001616]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.006369]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.011132]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.015812]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.020401]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.024987]  do_writepages+0x41/0xd0
<4>[ 1811.029546]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.034102]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.038650]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.043203]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.047772]  ? si_meminfo+0x3f/0x60
<4>[ 1811.052339]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.056963]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.061614]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.066257]  ? up_read+0x5/0x20
<4>[ 1811.070881]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.075546]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.080102]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.084566]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.089043]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.093494]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.097951]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.102384]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.106783]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.111157]  do_writepages+0x41/0xd0
<4>[ 1811.115515]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.119896]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.124261]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.128607]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.132962]  ? si_meminfo+0x3f/0x60
<4>[ 1811.137303]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.141674]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.146034]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.150416]  ? up_read+0x5/0x20
<4>[ 1811.154764]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.159046]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.163235]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.167386]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1811.171485]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.175509]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.179333]  ? __attach_extent_node+0x87/0xb0
<4>[ 1811.182968]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.186559]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.190152]  do_writepages+0x41/0xd0
<4>[ 1811.193731]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.197315]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.200878]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.204378]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.207829]  ? si_meminfo+0x3f/0x60
<4>[ 1811.211220]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.214633]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.218067]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.221447]  ? up_read+0x5/0x20
<4>[ 1811.224791]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.228162]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.231527]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.234913]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.238324]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.241741]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.245157]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.248589]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.252013]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.255405]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.258768]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.262129]  do_writepages+0x41/0xd0
<4>[ 1811.265471]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.268815]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.272134]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.275438]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.278766]  ? si_meminfo+0x3f/0x60
<4>[ 1811.282108]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.285487]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.288873]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.292252]  ? up_read+0x5/0x20
<4>[ 1811.295636]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.299072]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.302508]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.305952]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1811.309413]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.312879]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.316344]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.319797]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.323255]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.326702]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.330119]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.333506]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.336896]  do_writepages+0x41/0xd0
<4>[ 1811.340268]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.343675]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.347079]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.350475]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.353873]  ? si_meminfo+0x3f/0x60
<4>[ 1811.357256]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.360693]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.364144]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.367589]  ? up_read+0x5/0x20
<4>[ 1811.371021]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.374486]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.377938]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.381395]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.384869]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.388334]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.391776]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.395231]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.398672]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.402069]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.405454]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.408833]  do_writepages+0x41/0xd0
<4>[ 1811.412198]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.415578]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.418931]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.422276]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.425640]  ? si_meminfo+0x3f/0x60
<4>[ 1811.429006]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.432407]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.435807]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.439193]  ? up_read+0x5/0x20
<4>[ 1811.442554]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.445958]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.449358]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.452749]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.456141]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.459533]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.462907]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.466289]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.469672]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.473025]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.476353]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.479694]  do_writepages+0x41/0xd0
<4>[ 1811.483052]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.486426]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.489773]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.493110]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.496473]  ? si_meminfo+0x3f/0x60
<4>[ 1811.499831]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.503226]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.506629]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.510011]  ? up_read+0x5/0x20
<4>[ 1811.513377]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.516779]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.520171]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.523563]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.526954]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.530336]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.533697]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.537022]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.540316]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.543603]  do_writepages+0x41/0xd0
<4>[ 1811.546878]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.550159]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.553435]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.556728]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.560021]  ? si_meminfo+0x3f/0x60
<4>[ 1811.563311]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.566624]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.569966]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.573316]  ? up_read+0x5/0x20
<4>[ 1811.576650]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.580023]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.583389]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.586749]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.590126]  ? __schedule+0x2cd/0x8b0
<4>[ 1811.593495]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.596853]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.600197]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.603551]  ? __attach_extent_node+0x87/0xb0
<4>[ 1811.606899]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.610240]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.613574]  do_writepages+0x41/0xd0
<4>[ 1811.616895]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.620221]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.623548]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.626880]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.630222]  ? si_meminfo+0x3f/0x60
<4>[ 1811.633552]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.636912]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.640296]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.643686]  ? up_read+0x5/0x20
<4>[ 1811.647064]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.650478]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.653886]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.657290]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.660710]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.664130]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.667526]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.670931]  ? __switch_to_asm+0x34/0x70
<4>[ 1811.674335]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1811.677731]  do_writepages+0x41/0xd0
<4>[ 1811.681109]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.684503]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.687863]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.691207]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.694577]  ? si_meminfo+0x3f/0x60
<4>[ 1811.697957]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.701365]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.704786]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.708199]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1811.711663]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.715138]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.718619]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.722119]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.725608]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.729078]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.732563]  ? __switch_to_asm+0x34/0x70
<4>[ 1811.736039]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1811.739508]  do_writepages+0x41/0xd0
<4>[ 1811.742961]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.746431]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.749859]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.753284]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.756704]  ? si_meminfo+0x3f/0x60
<4>[ 1811.760139]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.763626]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.767119]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.770607]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1811.774124]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.777668]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.781223]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.784798]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.788373]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.791941]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.795510]  ? __switch_to_asm+0x34/0x70
<4>[ 1811.799076]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1811.802645]  do_writepages+0x41/0xd0
<4>[ 1811.806196]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.809742]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.813261]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.816762]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.820255]  ? si_meminfo+0x3f/0x60
<4>[ 1811.823738]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.827253]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.830765]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.834273]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1811.837804]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.841337]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.844883]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1811.848458]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.852063]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.855671]  ? __switch_to_asm+0x34/0x70
<4>[ 1811.859276]  ? _raw_spin_unlock_irq+0xd/0x30
<4>[ 1811.862886]  do_writepages+0x41/0xd0
<4>[ 1811.866477]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.870074]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.873644]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.877202]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.880747]  ? si_meminfo+0x3f/0x60
<4>[ 1811.884267]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.887815]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.891358]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.894890]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
<4>[ 1811.898458]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.902017]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.905579]  ? _raw_spin_unlock_irqrestore+0x34/0x40
<4>[ 1811.909176]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.912776]  ? perf_trace_sched_kthread_stop_ret+0xbf/0xe0
<4>[ 1811.916412]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.920079]  ? __attach_extent_node+0x87/0xb0
<4>[ 1811.923763]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.927444]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.931125]  do_writepages+0x41/0xd0
<4>[ 1811.934787]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.938449]  ? preempt_count_sub+0x5/0xa0
<4>[ 1811.942087]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1811.945697]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1811.949288]  ? si_meminfo+0x3f/0x60
<4>[ 1811.952865]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1811.956466]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1811.960062]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1811.963656]  ? up_read+0x5/0x20
<4>[ 1811.967232]  ? f2fs_do_write_data_page+0x2cb/0x940
<4>[ 1811.970843]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1811.974452]  __write_data_page+0x5b7/0x6f0
<4>[ 1811.978066]  f2fs_write_cache_pages+0x1e0/0x450
<4>[ 1811.981690]  ? __x64_sys_sched_get_priority_min+0x1/0x40
<4>[ 1811.985372]  ? preempt_count_add+0x79/0xb0
<4>[ 1811.989063]  ? _raw_spin_lock+0x13/0x30
<4>[ 1811.992749]  f2fs_write_data_pages+0x2ed/0x320
<4>[ 1811.996451]  ? preempt_count_sub+0x5/0xa0
<4>[ 1812.000141]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1812.003815]  ? f2fs_inode_dirtied+0x64/0xf0
<4>[ 1812.007493]  ? preempt_count_add+0x79/0xb0
<4>[ 1812.011155]  ? preempt_count_sub+0x5/0xa0
<4>[ 1812.014775]  do_writepages+0x41/0xd0
<4>[ 1812.018381]  ? preempt_count_add+0x79/0xb0
<4>[ 1812.021992]  ? preempt_count_sub+0x5/0xa0
<4>[ 1812.025571]  ? _raw_spin_unlock+0x12/0x30
<4>[ 1812.029142]  ? nr_blockdev_pages+0x59/0x70
<4>[ 1812.032708]  ? si_meminfo+0x3f/0x60
<4>[ 1812.036258]  __filemap_fdatawrite_range+0x81/0xb0
<4>[ 1812.039838]  f2fs_sync_dirty_inodes+0xb1/0x1f0
<4>[ 1812.043411]  f2fs_balance_fs_bg+0x2a7/0x2c0
<4>[ 1812.046984]  f2fs_balance_fs+0xe5/0x2c0
<4>[ 1812.050552]  f2fs_create+0x131/0x3e0
<4>[ 1812.054116]  ? f2fs_lookup+0x20e/0x360
<4>[ 1812.057682]  path_openat+0x11a8/0x1590
<4>[ 1812.061246]  do_filp_open+0x93/0x100
<4>[ 1812.064794]  ? preempt_count_sub+0x5/0xa0
<4>[ 1812.068344]  do_sys_open+0x186/0x220
<4>[ 1812.071879]  do_syscall_64+0x69/0x399
<4>[ 1812.075387]  ? trace_hardirqs_off_thunk+0x1a/0x1c
<4>[ 1812.078908]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
<4>[ 1812.082445] RIP: 0033:0x78b3bcb37112
<4>[ 1812.085962] Code: 25 00 00 41 00 3d 00 00 41 00 74 4c 48 8d 05
d5 42 0d 00 8b 00 85 c0 75 6d 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff
ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a2 00 00 00 48 8b 4c 24 28 64 48
33 0c 25
<4>[ 1812.089905] RSP: 002b:00007ffe484d4290 EFLAGS: 00000246
ORIG_RAX: 0000000000000101
<4>[ 1812.093850] RAX: ffffffffffffffda RBX: 00007ffe484d49e0 RCX:
000078b3bcb37112
<4>[ 1812.097834] RDX: 00000000000000c1 RSI: 00005d8c1b59f690 RDI:
00000000ffffff9c
<4>[ 1812.101846] RBP: 00007ffe484d46d0 R08: 00007ffe484d49e0 R09:
00007ffe484d49e0
<4>[ 1812.105875] R10: 0000000000000180 R11: 0000000000000246 R12:
00000000000001a4
<4>[ 1812.109922] R13: 0000000000000003 R14: 0000000000008000 R15:
0000000000000000
<4>[ 1812.113972] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
nls_cp437 uas usb_storage pl2303 sd_mod x86_pkg_temp_thermal kvm_intel
iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
firewire_ohci igb firewire_core crc_itu_t ahci libahci dca
processor_thermal_device intel_soc_dts_iosf int340x_thermal_zone
pcc_cpufreq efivarfs
<4>[ 1812.123203] ---[ end trace 58008f46c7a6df03 ]---

>
> Thanks,
>
>>
>> 2019-04-01 10:05 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
>>> On 2019/3/31 2:54, Hagbard Celine wrote:
>>>> First, yes it is caused by data_flush, this is what I am trying to
>>>> report. Without that option there is no "stack guard page was hit" and
>>>> no "kernel stack overflow" and kernel is stable.
>>>> This time I was using kernel 5.0.3, as can be seen in the log in my
>>>> first
>>>> mail.
>>>> I do not remember exactly what kernel version I tried the first time a
>>>> saw this bug, but I believe the mount option data_flush was just added
>>>> when I tried it the first time. The option has always lead to crash
>>>> here.
>>>
>>> Sorry, out of mind at that time, data_flush key words slip out of my
>>> eye...
>>>
>>> Could you please try below patch?
>>>
>>> From 65edbf14a198d0b50765e10340255e2071f7ae75 Mon Sep 17 00:00:00 2001
>>> From: Chao Yu <yuchao0@huawei.com>
>>> Date: Mon, 1 Apr 2019 15:59:16 +0800
>>> Subject: [PATCH] f2fs: fix potential recursive call when enabling
>>> data_flush
>>>
>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>> ---
>>>  fs/f2fs/checkpoint.c | 6 ++----
>>>  fs/f2fs/data.c       | 3 ++-
>>>  2 files changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index a98e1b02279e..935ebdb9cf47 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -1009,13 +1009,11 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info
>>> *sbi,
>>> enum inode_type type)
>>>  	if (inode) {
>>>  		unsigned long cur_ino = inode->i_ino;
>>>
>>> -		if (is_dir)
>>> -			F2FS_I(inode)->cp_task = current;
>>> +		F2FS_I(inode)->cp_task = current;
>>>
>>>  		filemap_fdatawrite(inode->i_mapping);
>>>
>>> -		if (is_dir)
>>> -			F2FS_I(inode)->cp_task = NULL;
>>> +		F2FS_I(inode)->cp_task = NULL;
>>>
>>>  		iput(inode);
>>>  		/* We need to give cpu to another writers. */
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index d87dfa5aa112..9d3c11e09a03 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -2038,7 +2038,8 @@ static int __write_data_page(struct page *page,
>>> bool
>>> *submitted,
>>>  	}
>>>
>>>  	unlock_page(page);
>>> -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
>>> +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
>>> +					!F2FS_I(inode)->cp_task)
>>>  		f2fs_balance_fs(sbi, need_balance_fs);
>>>
>>>  	if (unlikely(f2fs_cp_error(sbi))) {
>>> --
>>> 2.18.0.rc1
>>>
>>>
>>>
>>>>
>>>> 2019-03-30 8:29 GMT+01:00, Chao Yu <yuchao0@huawei.com>:
>>>>> Oh, sorry, it's quite possible that bug is caused by data_flush, could
>>>>> remove that mount option first?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> On 2019/3/30 11:25, Chao Yu wrote:
>>>>>> Hi Hagbard,
>>>>>>
>>>>>> Sorry for the delay.
>>>>>>
>>>>>> On 2019/3/27 21:59, Hagbard Celine wrote:
>>>>>>> Hi, this is a long standing bug that I've hit before on older
>>>>>>> kernels,
>>>>>>> but I was not able to get the syslog saved because of the nature of
>>>>>>> the bug. This time I had booted form a pen-drive, and was able to
>>>>>>> save
>>>>>>> the log to it's efi-partition.
>>>>>>
>>>>>> Now which version of kernel do you use? and do you remember what is
>>>>>> your
>>>>>> kernel version when this bug occured at first time?
>>>>>>
>>>> .
>>>>
>>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

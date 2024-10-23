Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C49ABC26
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 05:28:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3S2e-0002Za-CF;
	Wed, 23 Oct 2024 03:28:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3S2c-0002ZS-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qoUy41XkVDrIC9i+PWh1c6kDS+8X3ua7fy9J5TbaTEA=; b=fzVDeYEIBYBLm+/93nE9PRL100
 UQt02Q0aYUh+l8BTnU63q46v1g2Fo8XZGF+i3X9pdBsPkl6x/sy/HZLQCPy8ahdGuRjptQpS/CfrS
 g8T6KmY7yn8KaMpUj7g/yzKvxtcZYlfJb9F9RyIlH8Cc3kXU8okJKIFUepggyrCh+ioM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qoUy41XkVDrIC9i+PWh1c6kDS+8X3ua7fy9J5TbaTEA=; b=TcparITfSbdMhsF2LcexXg3uR4
 Hoxq2x8Fs8vp8SUEe8DmNmfJFoFnqxw7V403/0u3ErNpmSEyJYjIMXfl+bSe1EOQfro0ZiTSXf2V/
 /5mBX31GFMNHA7jjqQ4VIpfUsCJ6OALYKF6dxVsTMYTj5WKix+WCQVDQxJEUx7NBQDrY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3S2b-0006gL-4c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D293A406EC;
 Wed, 23 Oct 2024 03:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F2AC4CEC3;
 Wed, 23 Oct 2024 03:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729654078;
 bh=FVNEUeJZTBZp+VQNGgY0hojOs1npYOxyXS6RLQ00QqU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hwxwXNYqCOUkuRi0mgDEyn/3hv6AskvyP+PXfN3TJkLgh4J2Itxy57duDogFAUuqW
 6CTaOlykmJrNyLdZYDfrAJ0mzfxZGTv97tJGwzrRGsZD+Fbml5fGQVBTzrpTzpUgZL
 lr6Ulv7UOkxV+D2oBJEzRjaaZgcFECNF5h7H/D7pqCJrQG+osYP8T94sKZsOCqYgT8
 tetERVCP/lp4WDg05/KaFB8BDdk1kaycW5drVb3NEu6b8lEPlmvU3Fipx8DZDlOi7v
 t9JlrZ+P1u2E+nvJq8Dq0cv8fyXJ3J4vWMHha3VP/yjOrKZTRTbnuNS0t/PujvQnBC
 TNkWXoPH+ywbQ==
Message-ID: <419435a0-b4f0-43f7-bac9-2fb5dabb42f2@kernel.org>
Date: Wed, 23 Oct 2024 11:27:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241015025106.3203676-1-chao@kernel.org>
 <20241023023744.nvnuavzus26gjdj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <6ffdf1df-e4a3-4799-81d4-22f206beb720@kernel.org>
 <20241023031707.povvhtilr66bv2vi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241023031707.povvhtilr66bv2vi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/23 11:17, Zorro Lang wrote: > On Wed, Oct 23, 2024
 at 10:53:09AM +0800, Chao Yu wrote: >> On 2024/10/23 10:37, Zorro Lang wrote:
 >>> On Tue, Oct 15, 2024 at 10:51:05AM +0800, Chao Yu wrote: [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3S2b-0006gL-4c
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs/006: add testcase to check
 out-of-space case
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/23 11:17, Zorro Lang wrote:
> On Wed, Oct 23, 2024 at 10:53:09AM +0800, Chao Yu wrote:
>> On 2024/10/23 10:37, Zorro Lang wrote:
>>> On Tue, Oct 15, 2024 at 10:51:05AM +0800, Chao Yu wrote:
>>>> This is a regression test to check whether f2fs handles dirty
>>>> data correctly when checkpoint is disabled, if lfs mode is on,
>>>> it will trigger OPU for all overwritten data, this will cost
>>>> free segments, so f2fs must account overwritten data as OPU
>>>> data when calculating free space, otherwise, it may run out
>>>> of free segments in f2fs' allocation function, resulting in
>>>> panic.
>>>>
>>>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    tests/f2fs/006     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>    tests/f2fs/006.out |  6 ++++++
>>>>    2 files changed, 58 insertions(+)
>>>>    create mode 100755 tests/f2fs/006
>>>>    create mode 100644 tests/f2fs/006.out
>>>>
>>>> diff --git a/tests/f2fs/006 b/tests/f2fs/006
>>>> new file mode 100755
>>>> index 00000000..b359ef8f
>>>> --- /dev/null
>>>> +++ b/tests/f2fs/006
>>>> @@ -0,0 +1,52 @@
>>>> +#! /bin/bash
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>>>> +#
>>>> +# FS QA Test No. f2fs/006
>>>> +#
>>>> +# This is a regression test to check whether f2fs handles dirty
>>>> +# data correctly when checkpoint is disabled, if lfs mode is on,
>>>> +# it will trigger OPU for all overwritten data, this will cost
>>>> +# free segments, so f2fs must account overwritten data as OPU
>>>> +# data when calculating free space, otherwise, it may run out
>>>> +# of free segments in f2fs' allocation function, resulting in
>>>> +# panic.
>>>> +#
>>>> +. ./common/preamble
>>>> +_begin_fstest auto quick
>>>> +
>>>> +_cleanup()
>>>> +{
>>>> +	rm -f $img
>>>> +	_scratch_unmount >> $seqres.full
>>>> +	cd /
>>>> +	rm -r -f $tmp.*
>>>> +}
>>>> +
>>>> +_require_scratch
>>>> +_scratch_mkfs >> $seqres.full
>>>> +_scratch_mount >> $seqres.full
>>>> +
>>>> +img=$SCRATCH_MNT/f2fs.img
>>>> +mnt=$SCRATCH_MNT/f2fs.mnt
>>>> +testfile=$mnt/testfile
>>>> +
>>>> +mkdir $mnt
>>>> +dd if=/dev/zero of=$img bs=1M count=100 2>/dev/null
>>>> +$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
>>>> +sync
>>>> +
>>>> +# use mode=lfs to let f2fs always triggers OPU
>>>> +mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt
>>>
>>> Hi Chao,
>>>
>>> Is the loop device necessary? What if use SCRATCH_DEV and SCRATCH_MNT directly?
>>
>> Hi Zorro,
>>
>> It uses loop device to limit image size, so that we can speed
>> up padding steps of the test since it depends on ENOSPC state.
>>
>> Or maybe we can mkfs.f2fs $SCRATCH_DEV w/ specified sector size?
>> Any suggestion?
> 
> Can scratch_mkfs_sized() help? I saw it supports f2fs.

Yes, let me update this patch, thanks.

Thanks,

> 
> Thanks,
> Zorro
> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>> Zorro
>>>
>>>> +
>>>> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
>>>> +
>>>> +# it may run out of free space of f2fs and hang kernel
>>>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
>>>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
>>>> +
>>>> +mount -o remount,checkpoint=enable $mnt
>>>> +umount $mnt
>>>> +
>>>> +status=0
>>>> +exit
>>>> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
>>>> new file mode 100644
>>>> index 00000000..a2c7ba48
>>>> --- /dev/null
>>>> +++ b/tests/f2fs/006.out
>>>> @@ -0,0 +1,6 @@
>>>> +QA output created by 006
>>>> +50+0 records in
>>>> +50+0 records out
>>>> +dd: error writing '/mnt/scratch_f2fs/f2fs.mnt/testfile': No space left on device
>>>> +3+0 records in
>>>> +2+0 records out
>>>> -- 
>>>> 2.40.1
>>>>
>>>
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

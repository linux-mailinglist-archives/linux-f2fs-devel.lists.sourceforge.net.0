Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B16539B3213
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 14:46:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5Q51-0006WK-FP;
	Mon, 28 Oct 2024 13:46:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5Q4z-0006WE-Rf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 13:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yYY6v4DvSP5jKMrnsD22WFypma8DJG8uzRpttB7M3nw=; b=DVJCR1SDFCVCWGy22sTYUp9mD0
 In1FFkfq0a6AlafrdPzE32vIpF5FD8SFwGoKQMpnajRsWkFEbFAsAedKt21og+MJCbFM1UDoWLReF
 biHt7NkaTROSBQRaBrvclb/DE15LlzSDBPX8BMrOnlGc8FqwZC6h6zA+fBKl+6ct3zcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yYY6v4DvSP5jKMrnsD22WFypma8DJG8uzRpttB7M3nw=; b=mCT2cf+nIO2GTqA6F0H4et4ugu
 g8k2xNDi0krg4V3jlob1gv0HLszrsk/sujsVTyivCwrEcLgSUuDz7xWNbWFuwcP5g/UtrCVaBzE8m
 3f2sctJ6XTZnKTgbyhqmuftgZZz1o3OFrf3CokQ/X08fF6rtOz6QY1mvvK8h4UpJ7Vvw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5Q4z-0006Iz-RV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 13:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F53B5C5C26;
 Mon, 28 Oct 2024 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202C0C4CEC3;
 Mon, 28 Oct 2024 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730123195;
 bh=nry+gNH1QKnuFPQC+0UEBGG0WSi8qsv9vjSD2K03t0Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=L6Oohx65HC9VznjV6wcBQIa0A3T+rSZZONfIj4lFmE85YaAKt1sYlCs+XYWwZjaRS
 z4JtOJhNY6oTHrbRSK4lfqpPye9f5ILHNB4iMRvKyJrfIkW797H1cxJFJsuq7tXA6X
 lWm7EKN98w2qOL11GrdV8lckd89JMm1s9KxFY4WVtzND15Zi91USxiChqpibibJfOe
 2STRopyxc220w2F//rO4YiJ7OnE9yA069eea64q+mEqDyWzLFz1JGLjfKe1G94KCiU
 hk+zBb+NMYAE+hZChIi0QDRj9sM390w4+/djJhd0Or92p9zKBxwdRgP+etPFbuFs8B
 FC8VbSAEC75UA==
Message-ID: <0274ac17-246e-4a29-bf24-1d0123dce8e7@kernel.org>
Date: Mon, 28 Oct 2024 21:46:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241012101501.377899-1-chao@kernel.org>
 <20241025041115.fmv2wt7qy6s55hip@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241025041115.fmv2wt7qy6s55hip@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/25 12:11, Zorro Lang wrote: > On Sat, Oct 12, 2024
 at 06:15:01PM +0800, Chao Yu wrote: >> This patch introduce a regression
 test to check whether f2fs handles >> dirty inode correctly when [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5Q4z-0006Iz-RV
Subject: Re: [f2fs-dev] [PATCH] f2fs/005: add testcase to check checkpoint
 disabling functionality
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
Cc: Qi Han <hanqi@vivo.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/25 12:11, Zorro Lang wrote:
> On Sat, Oct 12, 2024 at 06:15:01PM +0800, Chao Yu wrote:
>> This patch introduce a regression test to check whether f2fs handles
>> dirty inode correctly when checkpoint is disabled in a corner case,
>> it may hang umount before the bug is fixed.
>>
>> Cc: Qi Han <hanqi@vivo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/005     | 59 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/005.out |  1 +
>>   2 files changed, 60 insertions(+)
>>   create mode 100755 tests/f2fs/005
>>   create mode 100644 tests/f2fs/005.out
>>
>> diff --git a/tests/f2fs/005 b/tests/f2fs/005
>> new file mode 100755
>> index 00000000..4faf1bb9
>> --- /dev/null
>> +++ b/tests/f2fs/005
>> @@ -0,0 +1,59 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/005
>> +#
>> +# This is a regression test to check whether f2fs handles dirty
>> +# inode correctly when checkpoint is disabled, it may hang umount
>> +# before the bug is fixed.
> 
> Is this a duplicated test of another patch from you?
> 
> https://lore.kernel.org/fstests/20241025034413.5s6ecilfgqcoeudt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/T/#t
> 
> Or just similar?
> 
> If this's a different test ...(see below)

It's a different one.

> 
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +_cleanup()
>> +{
>> +	rm -f $img
>> +	rmdir $mnt
>> +	_scratch_unmount >> $seqres.full
>> +	cd /
>> +	rm -r -f $tmp.*
>> +}
>> +
>> +_require_scratch
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount >> $seqres.full
>> +
>> +img=$SCRATCH_MNT/f2fs.img
>> +mnt=$SCRATCH_MNT/f2fs.mnt
>> +testfile=$mnt/testfile
>> +tmpfile=$mnt/tmpfile
>> +tmpdir=$mnt/tmpdir
>> +
>> +mkdir $mnt
>> +dd if=/dev/zero of=$img bs=1M count=50 2>/dev/null
>> +$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
>> +sync
>> +
>> +# use mode=lfs to let f2fs always triggers OPU
>> +mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt
> 
> You can use _scratch_mkfs_sized, don't need a loop device.
> And without the loop device, above _cleanup is not needed either.
> 
>> +
>> +dd if=/dev/zero of=$testfile bs=1M count=5 2>/dev/null
>> +mkdir $tmpdir
>> +touch $tmpfile
>> +sync
>> +
>> +# it dirties tmpdir inode by updating ctime,
>> +# but it doesn't moving the inode to gdirty_list.
>> +mv $tmpfile $tmpdir
>> +
>> +# it runs out of free segment
>> +dd if=/dev/zero of=$testfile bs=1M count=5 conv=notrunc conv=fsync 2>/dev/null
>> +
>> +mount -o remount,checkpoint=enable $mnt
>> +
>> +# it may hang umount if tmpdir is still dirty during evict()
>> +umount $mnt
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/005.out b/tests/f2fs/005.out
>> new file mode 100644
>> index 00000000..caa3c880
>> --- /dev/null
>> +++ b/tests/f2fs/005.out
>> @@ -0,0 +1 @@
>> +QA output created by 005
> 
> If nothing output, please:
> 
> echo "Silence is golden"

Will update this patch according to your comments, thank you!

Thanks,

> 
> Thanks,
> Zorro
> 
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

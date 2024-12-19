Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A416C9F7CB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2024 14:56:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOH13-0007Hf-9f;
	Thu, 19 Dec 2024 13:56:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tOH12-0007HX-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y76UFcP2qPh1J+nwlNgPpECee2mWNK/y4iBYGnTIAN8=; b=O+mrO/gyX2YuGn4WyA9WZShGA/
 oD32A9HxlnWT80561C6TA5zEYThj0cjz8elFr9dlzfQvDuHMneeb6gXTHNmfHN6lCXdzo/Jw4AZ0S
 tX7iV9CRxWNtKkwTFvRKbgXKX0zXnwUyKlbfUzXOoraGzItqmbaA6s9QTm+Kg4noPpmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y76UFcP2qPh1J+nwlNgPpECee2mWNK/y4iBYGnTIAN8=; b=R9iuBZykKj1/QTFdkSRbY8lWc9
 io4hOsDgPJ9cwUo3Pyf7Eys7Rh+Kdc3wMSCFp63tuC60Tm5W4Y1NXKC1eB6c5zTi1J+F/D5Q/RqRg
 kovKYlTnV4FXZqMYrjYYiDw+7xrodP8ARf56ljyna7yhZ7Fkz6iECAGUGQ587JIn14bI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOH11-0008Ba-GV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 224425C5CF3;
 Thu, 19 Dec 2024 13:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD675C4CECE;
 Thu, 19 Dec 2024 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734616589;
 bh=9Lb96h++/0LycNx83Skfbq84Su//al+7vAl4RFKa648=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PToTB57ExbYoQUcLEcAIaKDiJy03p2qrWp0j6hs4cqBa/0LPy/OiANtX9IJfuMznT
 NYuMJtJ6x/8um3g5cq/BsCYANvINc5cHHmmHTXb55tXeFNBGINpFoFz2qlGl1w3mOZ
 kfh7c3dfmfIKeRdI4WxUYpgcSQUgardqkHaS0aIr2ZtpswKsMLCyJ425Z7WDOkiL06
 iT7ziANzL28ksRtDLCakb+WpWAGdRq/FH3VX0WDUh5se+sbN72z2W20EJE8zFGYFvs
 TdeXe788KRTto2wTaE+vdZ6cB+PJhoc15bMj/foV6tx2sKqEvCcQCE2EUXucOGL8NR
 5B2B83FqgKBrg==
Message-ID: <bd8687df-8dea-4c33-821b-87b87b5554ef@kernel.org>
Date: Thu, 19 Dec 2024 21:56:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241202114307.2747-1-chao@kernel.org>
 <20241219131631.6imqcwg7zxcm6hj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <20241219131631.6imqcwg7zxcm6hj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/19 21:16, Zorro Lang wrote: > On Mon, Dec 02, 2024
 at 07:43:07PM +0800, Chao Yu wrote: >> This patch introduce a regression
 testcase to check whether >> f2fs can handle discard correctly on [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOH11-0008Ba-GV
Subject: Re: [f2fs-dev] [PATCH] f2fs/008: test snapshot creation/deletion on
 lvm device
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/12/19 21:16, Zorro Lang wrote:
> On Mon, Dec 02, 2024 at 07:43:07PM +0800, Chao Yu wrote:
>> This patch introduce a regression testcase to check whether
>> f2fs can handle discard correctly once underlying lvm device
>> changes to not support discard after user creates snapshot
>> on it.
>>
>> Related bug was fixed by commit bc8aeb04fd80 ("f2fs: fix to
>> drop all discards after creating snapshot on lvm device")
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/008     | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/008.out |  2 ++
>>   2 files changed, 55 insertions(+)
>>   create mode 100755 tests/f2fs/008
>>   create mode 100644 tests/f2fs/008.out
>>
>> diff --git a/tests/f2fs/008 b/tests/f2fs/008
>> new file mode 100755
>> index 00000000..a9a3f263
>> --- /dev/null
>> +++ b/tests/f2fs/008
>> @@ -0,0 +1,53 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/008
>> +#
>> +# This is a regression test to check whether f2fs can handle
>> +# discard correctly once underlying lvm device changes to not
>> +# support discard after user creates snapshot on it.
>> +#
>> +
>> +. ./common/preamble
>> +_begin_fstest auto quick rw
>> +
>> +_fixed_by_kernel_commit bc8aeb04fd80 \
>> +        "f2fs: fix to drop all discards after creating snapshot on lvm device"
>> +
>> +_require_scratch_nolvm
>> +_require_block_device $SCRATCH_DEV
>> +_require_command "$LVM_PROG" lvm
>> +
>> +lvname=lv_$sed
>> +vgname=vg_$Sseg
> 
> What's "$sed" and "$Sseg", I didn't find the definition of them.

Zorro,

Sorry, these are typos caused by copying codes, I have noticed this and
fixed it in v2.

https://lore.kernel.org/fstests/20241203124657.4997-1-chao@kernel.org

> 
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +_cleanup()
>> +{
> 
>    _unmount $SCRATCH_MNT >>$seqres.full 2>&1
> 
> for this test might be interrupted.
> 
>> +	$LVM_PROG lvremove -f /dev/mapper/$lvname-snapshot $vgname >>$seqres.full 2>&1
>> +	$LVM_PROG lvremove -f /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
>> +	$LVM_PROG vgremove -f $vgname >>$seqres.full 2>&1
>> +	$LVM_PROG pvremove -f $SCRATCH_DEV >>$seqres.full 2>&1
> 
> "-ff" might be better for cleanup.
> 
> According to 5f7a66b6dc4c ("fstests: use udevadm wait in preference to settle"), Dave
> recommend doing below command after above lines:

Thank you for this information. :)

> 
>    _udev_wait --removed /dev/mapper/$vgname-$lvname
> 
> Then, don't forget the default cleanup steps:
> 
>    cd /
>    rm -f $tmp.*
> 
>> +}
>> +
>> +$LVM_PROG pvcreate -f $SCRATCH_DEV >>$seqres.full 2>&1
>> +$LVM_PROG vgcreate -f $vgname $SCRATCH_DEV >>$seqres.full 2>&1
>> +$LVM_PROG lvcreate -L 1024m -n $lvname $vgname >>$seqres.full 2>&1
> 
> Also according to 5f7a66b6dc4c ("fstests: use udevadm wait in preference to settle"),
> Dave recommend using a:
>    _udev_wait /dev/mapper/$vgname-$lvname
> 
>> +
>> +$MKFS_F2FS_PROG /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> 
> "-f" to force overwrite ? Or use _mkfs_dev? But _mkfs_dev doesn't has a f2f2
> specific line, maybe you'd like to write one.

Sure, maybe adapting f2fs in a separated patch, anyway, let me check this.

> 
>> +mount -o discard /dev/mapper/$vgname-$lvname $SCRATCH_MNT >>$seqres.full 2>&1
> 
> _mount
> 
>> +
>> +dd if=/dev/zero of=$testfile bs=1M count=20 >>$seqres.full 2>&1
>> +sync
>> +rm $testfile
> 
> "-f" ?
> 
>> +sync
>> +
>> +# create a snapshot on lvm device
>> +$LVM_PROG lvcreate -L 1024m -s -n $lvname-snapshot /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
>> +umount $SCRATCH_MNT
> 
> Move this line to _cleanup, to always try to do it before removing lvm.

Will update in v3 according to all your comments.

Thanks,

> 
>> +
>> +echo "Silence is golden"
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/008.out b/tests/f2fs/008.out
>> new file mode 100644
>> index 00000000..dd68d5a4
>> --- /dev/null
>> +++ b/tests/f2fs/008.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 008
>> +Silence is golden
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

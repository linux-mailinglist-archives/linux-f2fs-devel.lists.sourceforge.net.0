Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D409B4372
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 08:46:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5gvz-0007vS-Mo;
	Tue, 29 Oct 2024 07:46:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5gvy-0007vG-JX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 07:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQ8Y5/S9N3FMuCOk1SeW/txigZoKrEEo9fQtGtlh7yw=; b=LSJx1As3+gFbhQedA8rjwWuqPi
 uQXO7phEhi0Z+BEnpGBiNXAFQBBFJpwYHdWK0dWRRzo+ml3gYF0t4oidaPuvsGGANkDF2gpyUcW/W
 nt3s41+7xM0zZHNNw21sfck5In6DK+cf+rNUlKCUheMxaHFvkaW9b7UODUuPCPC5+VeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zQ8Y5/S9N3FMuCOk1SeW/txigZoKrEEo9fQtGtlh7yw=; b=k+d9LJpitjpevjCKoa13JaW/lu
 WlMBXIhaa+yGzFQBmx5ww641yF0LZAkTUJHACGBWQf3GYIJazCCNJ8kvGppi+RqPkJqr17km4aipw
 EvX0daQDUZJ7nhYsJ5EDRp9nrGSo6KOkyt/wtlJXzpaVneFBg+XDQJOCGIRC4tkG+bh0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5gvx-0000hG-OI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 07:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D6A6A417E4;
 Tue, 29 Oct 2024 07:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8D6C4CECD;
 Tue, 29 Oct 2024 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730187987;
 bh=zQtVqG+vUkM4/CWYayjQrQhLYYn7E++L0ZgAR1wc8pI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=J0xeCrrQvz6Dj2/Nhp4X+yLfZTg9a6VYXCezOTrJJmtUCdAuQi0LzEv0sSlfAajR4
 07BJ3joQwDFkdgzBv8H0jf45Z/5E68mD93dJnMIBEPeAVVjHz3BlcELtDacUD5zYvn
 aQ79su9k94TXdWQ5yF3nRfkt4BtuEYfqI6PxJgvyeKNCjb0bh50yjh+cLly7GCTE7j
 Q8h7PrA8GhRlXF4eU9M2ZIBLX5Qpmsytn4OhLNc2tCD/U5TipAVI2YDpT3OncMFZAd
 5LVAGYoVeleVSBjGehb8yHBketzRlaERdU9axr6gQE1nVssBFUY0DBqSwIivyCqQkd
 0pKhjcJyZ+qkA==
Message-ID: <324c9b1a-ca86-43a4-8c3a-990199c714bc@kernel.org>
Date: Tue, 29 Oct 2024 15:46:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241028141800.1788356-1-chao@kernel.org>
 <20241029060919.gxyywjp3gykaqnuc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241029060919.gxyywjp3gykaqnuc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/29 14:09, Zorro Lang wrote: > On Mon, Oct 28, 2024
 at 10:17:59PM +0800, Chao Yu wrote: >> This is a regression test to check
 whether f2fs handles dirty >> data correctly when checkpoint is [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5gvx-0000hG-OI
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs/006: add testcase to check
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

On 2024/10/29 14:09, Zorro Lang wrote:
> On Mon, Oct 28, 2024 at 10:17:59PM +0800, Chao Yu wrote:
>> This is a regression test to check whether f2fs handles dirty
>> data correctly when checkpoint is disabled, if lfs mode is on,
>> it will trigger OPU for all overwritten data, this will cost
>> free segments, so f2fs must account overwritten data as OPU
>> data when calculating free space, otherwise, it may run out
>> of free segments in f2fs' allocation function. If kernel config
>> CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
>> dd may encounter I/O error.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v3:
>> - explain more about behavior on kernel w/ different config
>> - use _filter_scratch to filter $SCRATCH_MNT
>>   tests/f2fs/006     | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/006.out |  6 ++++++
>>   2 files changed, 48 insertions(+)
>>   create mode 100755 tests/f2fs/006
>>   create mode 100644 tests/f2fs/006.out
>>
>> diff --git a/tests/f2fs/006 b/tests/f2fs/006
>> new file mode 100755
>> index 00000000..f9560b2b
>> --- /dev/null
>> +++ b/tests/f2fs/006
>> @@ -0,0 +1,42 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/006
>> +#
>> +# This is a regression test to check whether f2fs handles dirty
>> +# data correctly when checkpoint is disabled, if lfs mode is on,
>> +# it will trigger OPU for all overwritten data, this will cost
>> +# free segments, so f2fs must account overwritten data as OPU
>> +# data when calculating free space, otherwise, it may run out
>> +# of free segments in f2fs' allocation function. If kernel config
>> +# CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
>> +# dd may encounter I/O error.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +_fixed_by_kernel_commit xxxxxxxxxxxx \
>> +	"f2fs: fix to account dirty data in __get_secs_required()"
>> +
>> +# Import common functions.
>> +. ./common/filter
>> +
>> +_require_scratch
>> +_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
>> +
>> +# use mode=lfs to let f2fs always triggers OPU
>> +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
>> +
>> +# it may run out of free space of f2fs and hang kernel
>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync 2>&1 | _filter_scratch
>> +
>> +_scratch_remount checkpoint=enable
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
>> new file mode 100644
>> index 00000000..2dc9efda
>> --- /dev/null
>> +++ b/tests/f2fs/006.out
>> @@ -0,0 +1,6 @@
>> +QA output created by 006
>> +50+0 records in
>> +50+0 records out
>> +dd: error writing 'SCRATCH_MNT/testfile': No space left on device
>> +3+0 records in
>> +2+0 records out
> 
> Hi Chao,
> 
> One more question about this patch.
> 
> I'm wondering can this output always be matched? If the test doesn't care the dd output,
> you can filter out them, to avoid it break golden image. Especially the second one, can
> you be sure it always "3 in and 2 out" before returning ENOSPC?

Zorro,

I got your concern, how about using _check_dmesg to catch the kernel
bug instead? since once the bug was triggered, f2fs will call BUG_ON
or WARN_ON optionally anyway.

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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BF9B2BCE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 10:47:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5MLJ-0003Wy-Km;
	Mon, 28 Oct 2024 09:47:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5MLI-0003Ws-Us
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uNYd2orsfRE59mjqYpYHEh5NPx+vfGeOf+aQoyQjT5Q=; b=VxvWMwwadrFHjMHHQXscaFJWr8
 ikJlATLZ4L5xoStWrz0mYlN2mf4NQrIQxXdiG3xSseVZQkNlKZQW8dX2wsdxfIjLY1bWDTAmb4TsY
 5H8QKZVlabImd65MeT3L+r/TPbFzio0L2zRcpSha0XT0JzWiqMLIb8AizUpNTw/SX5jI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uNYd2orsfRE59mjqYpYHEh5NPx+vfGeOf+aQoyQjT5Q=; b=QiH3DeTa7VaLSJEs1Rwp4tHwCx
 DtFLptp0hdQ+BfWPF1Sz2cLl58D71z4x3Uh5gfpL+JD0AMDnFCIS2+khMmW9mlunWpMDBCHdwfuFU
 zP23buDGgv0krdP7Ap6HXHO2J3DNMg+EwO5lxRZN3eZoXOCe/aUv+lfungV+yxPS2IRQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5MLI-0008Jh-SL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 739D75C4A49;
 Mon, 28 Oct 2024 09:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F014AC4CEC3;
 Mon, 28 Oct 2024 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730108830;
 bh=kwJTSKGVyruOkdDlspu/YLGyPpmGn9rmrK+Eg8Xn3aM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QtrSsrtTIVq6Yz/DFOpvXZuqOY9CBjgyNLpkgXhMhL1MNMAkvwUtvHCaUhfHO72zo
 iv6kKOhw+DK4sxswV2uqfXGS1jnqjHKTl3Q5lIXAeQUi+Bd6NlS0mjo2oyImesv3pn
 bELkzeExEDnUGSK++tr0zybvjozX/J6P52ZNGaj6VJ7lc/ncFmuEOglsVyCdh2p1zP
 MgqRh7xXEb4SY1+NqzmDoJTLRxk76zO3yJOT3qZ4bGg8zHdLhAxHrnfHogk+vcsIQH
 MB7C8FOs1tkqv+r7WjUFw/U8SY2RX9Q6gr9lr/xZPuwjPF0ZBR7cFwgE6kJNiymquf
 HZjVCA14p49VA==
Message-ID: <53cb9bde-d845-49d6-858e-147b0870fbbf@kernel.org>
Date: Mon, 28 Oct 2024 17:47:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241023081602.3806579-1-chao@kernel.org>
 <20241025034413.5s6ecilfgqcoeudt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241025034413.5s6ecilfgqcoeudt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/25 11:44, Zorro Lang wrote: > On Wed, Oct 23, 2024
 at 04:16:01PM +0800, Chao Yu wrote: >> This is a regression test to check
 whether f2fs handles dirty >> data correctly when checkpoint is [...] 
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
X-Headers-End: 1t5MLI-0008Jh-SL
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs/006: add testcase to check
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

On 2024/10/25 11:44, Zorro Lang wrote:
> On Wed, Oct 23, 2024 at 04:16:01PM +0800, Chao Yu wrote:
>> This is a regression test to check whether f2fs handles dirty
>> data correctly when checkpoint is disabled, if lfs mode is on,
>> it will trigger OPU for all overwritten data, this will cost
>> free segments, so f2fs must account overwritten data as OPU
>> data when calculating free space, otherwise, it may run out
>> of free segments in f2fs' allocation function, resulting in
>> panic.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - add _fixed_by_kernel_commit()
>> - use _scratch_mkfs_sized() rather than formating size-specified
>> loop device
>> - code cleanup
>>   tests/f2fs/006     | 38 ++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/006.out |  6 ++++++
>>   2 files changed, 44 insertions(+)
>>   create mode 100755 tests/f2fs/006
>>   create mode 100644 tests/f2fs/006.out
>>
>> diff --git a/tests/f2fs/006 b/tests/f2fs/006
>> new file mode 100755
>> index 00000000..63d00018
>> --- /dev/null
>> +++ b/tests/f2fs/006
>> @@ -0,0 +1,38 @@
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
>> +# of free segments in f2fs' allocation function, resulting in
>> +# panic.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +_fixed_by_kernel_commit xxxxxxxxxxxx \
>> +	"f2fs: fix to account dirty data in __get_secs_required()"
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +_require_scratch
>> +_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
>> +
>> +# use mode=lfs to let f2fs always triggers OPU
>> +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
>> +
>> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
>> +
>> +# it may run out of free space of f2fs and hang kernel
>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
>> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> 
> What kind of failure should be printed at here if test on unfixed kernel?

It will panic kernel w/o fix, can you please check dmesg?

> I got:
> 
> # diff -u /root/git/xfstests/tests/f2fs/006.out /root/git/xfstests/results//default/f2fs/006.out.bad|less
> --- /root/git/xfstests/tests/f2fs/006.out       2024-10-25 11:33:54.693883281 +0800
> +++ /root/git/xfstests/results//default/f2fs/006.out.bad        2024-10-25 11:34:55.907252401 +0800
> @@ -1,6 +1,6 @@
>   QA output created by 006
>   50+0 records in
>   50+0 records out
> -dd: error writing '/mnt/scratch_f2fs/testfile': No space left on device
> -3+0 records in
> -2+0 records out
> +dd: fsync failed for '/mnt/scratch/testfile': Input/output error
> +50+0 records in
> +50+0 records out
> 
> Does that mean the bug is reproduced?
 > >> +
>> +_scratch_remount checkpoint=enable
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
>> new file mode 100644
>> index 00000000..0d7b3910
>> --- /dev/null
>> +++ b/tests/f2fs/006.out
>> @@ -0,0 +1,6 @@
>> +QA output created by 006
>> +50+0 records in
>> +50+0 records out
>> +dd: error writing '/mnt/scratch_f2fs/testfile': No space left on device
> 
> The "/mnt/scratch_f2fs" should be SCRATCH_MNT, please use _filter_scratch()
> by importing common/filter.

Correct, let me fix this.

Thanks,

> 
>> +3+0 records in
>> +2+0 records out
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

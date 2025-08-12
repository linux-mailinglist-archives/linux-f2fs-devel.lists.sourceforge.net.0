Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C5B2270C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 14:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hexnqG5gYMc0escu4GebP8rzqqQ1PUAjr26m2euW2C4=; b=eSaeO/gHYX3AiOhtz5HV/2imWT
	EPGJUMdR45vgiqyBNWI7G0wYtObHg0POWksSUm+KBIwJOhCxht/B/sopOqZn9Tiyo032eWi+5hZx9
	Ze8wUFizuI9vDEkbIHkOMvLNhx6ojojK/8tFqE9/cL2kiVDWQV9c2ti9J8K6QI5qBtnU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uloEo-0001JY-O5;
	Tue, 12 Aug 2025 12:36:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uloEn-0001JH-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 12:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=US0P9QHNwq3Zq0T+/BjNRGK0YS+Ly1AYBCPJTArVcDY=; b=fdNBMzb5WmLLcZtHpuCWhy6mhu
 TZuSW/PZSqcVQF8r19WjX+HFEsf9uEOWAY3kNED+o/88km+9KBknh0FKSty3XRjpBPNsctQbvnmts
 iqz/QfqyJhsE8aktIrFL3nAp9AglhPkqnNIdIJLBpZUwAYmodE+N2UE4PAV9V8B+F35I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=US0P9QHNwq3Zq0T+/BjNRGK0YS+Ly1AYBCPJTArVcDY=; b=WjwAnMUJzUsipO0jVjlJecMHu+
 vSNdgj+y4ow81jqVsamK9+jEqq4AyTMoAVa60mmlS2ryztBplDZD6ReBk5bIxvvKtFrfkR2CgcdIA
 e0IAQJuiVlKOTgTfTzyH65BhXv2Pj6uM/LZidxDw4MOcuagjyqwj2pCLnhYOUgK8wvNU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uloEn-0006vV-90 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 12:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C1BCA556E8;
 Tue, 12 Aug 2025 12:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF669C4CEF0;
 Tue, 12 Aug 2025 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755002170;
 bh=prox4gHGKbGX3a9wsroZiJykHtZqi1ku5iRdaDj3zgk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dBRniQgzCZxUbgPvudVoG7a0TfmX4MYW4vuAxyeF34uTeIDpEv8ZTWQ4OqHCM5sNn
 KnCjPK7jFvRTujMMwsPYll/Vx/u6vZ6h1oYoXYqCWPoUdMk2b5z7eJ6gVfXzG8Y9cj
 LRogFMNhEBrlt0HOFqaxW+7sIBLxm0Y8DuuVH7uDmY3/lDBHsnIaGtVRsfRZON3TU4
 /9eMy4kBv1Z8WXj3zjxN8LqfvtsNSta8Q6HZwy5MzOCQPKVDB5JC5g/+NQC/Qmi8gR
 9wjkvRWop7dnfP8ctK/T1dZbqiNDiQu5YkCWD01fuP2HF8If7qW8omkVo7WWM/Oesj
 UN3iuLF6J1/CA==
Message-ID: <28c2bec6-4ebc-4ac3-9a87-8d5adbe91dbf@kernel.org>
Date: Tue, 12 Aug 2025 20:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250812085656.kg3dsukgbde6skrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250812085656.kg3dsukgbde6skrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/12/25 16:56, Zorro Lang wrote: > On Mon, Aug 11, 2025
 at 05:44:13PM +0800, Chao Yu wrote: >> This is a regression testcase, it
 is added to check below case >> and its variants: >> - write 16k dat [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uloEn-0006vV-90
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs/018: check data eof after partial
 truncation on compressed cluster
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/12/25 16:56, Zorro Lang wrote:
> On Mon, Aug 11, 2025 at 05:44:13PM +0800, Chao Yu wrote:
>> This is a regression testcase, it is added to check below case
>> and its variants:
>> - write 16k data into compressed file (data will be compressed)
>> - truncate file to 12k (truncate partial data in compressed cluster)
>> - truncate file to 20k
>> - verify data in range of [12k, 16k] to see whether data is all zero
>> or not
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  tests/f2fs/018     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/018.out |  2 ++
>>  2 files changed, 60 insertions(+)
>>  create mode 100755 tests/f2fs/018
>>  create mode 100644 tests/f2fs/018.out
>>
>> diff --git a/tests/f2fs/018 b/tests/f2fs/018
>> new file mode 100755
>> index 00000000..ca727d24
>> --- /dev/null
>> +++ b/tests/f2fs/018
>> @@ -0,0 +1,58 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/018
>> +#
>> +# This is a regression test to check whether page eof will be
>> +# zero or not after we truncate partial data in compressed
>> +# cluster.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick rw compress
>> +
>> +_fixed_by_kernel_commit ba8dac350faf \
>> +	"f2fs: fix to zero post-eof page"
>> +_fixed_by_kernel_commit xxxxxxxxxxxx \
>> +	"f2fs: fix to zero data after EOF for compressed file correctly"
>> +
>> +_require_scratch
>> +_require_fio
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +check_data_eof()
>> +{
>> +	local eof_start=$1
>> +	local eof_size=$2
>> +	local filesize=$3
>> +	local offset1=$4
>> +	local offset2=$5
>> +	local offset3=$6
>> +
>> +	_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
>> +	_scratch_mount "-o compress_extension=*" >> $seqres.full
>> +
>> +	xfs_io -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
>> +	xfs_io -c "truncate $offset1" $testfile
>> +	xfs_io -c "truncate $offset2" $testfile
> 
> replace "xfs_io" with "$XFS_IO_PROG"

Oops, yes, will update.

> 
>> +
>> +	if [ "$offset3" ]; then
>> +		xfs_io -c "truncate $offset3" $testfile
> 
> Same as above.
> 
> And generally we need: _require_xfs_io_command "truncate"

Ditto,

> 
>> +	fi
>> +
>> +	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
>> +		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
>> +		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"
> 
> Generally we do `_require_fio $fio_config` to make sure all arguments are supported
> by current fio version and FSTYP, refer to generic/366. But as this is a f2fs only
> test, and if you make sure you don't use any new/special fio arguments, I can accept
> this. Or you can refer to generic/366.

Okay, let me take a look.

> 
>> +	_scratch_unmount
> 
> I'm not familar with f2fs much, may I ask why we need to mkfs&mount ... umount
> in each test loop?

Oh, seems it doesn't need to, let me check and clean up it.

Thanks,

> 
> Thanks,
> Zorro
> 
>> +}
>> +
>> +check_data_eof 12k 4k 16k 12k 20k
>> +check_data_eof 10k 6k 16k 10k 20k
>> +check_data_eof 12k 4k 16k 8k 12k 20k
>> +check_data_eof 10k 6k 16k 8k 10k 20k
>> +
>> +echo "Silence is golden"
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/018.out b/tests/f2fs/018.out
>> new file mode 100644
>> index 00000000..8849e303
>> --- /dev/null
>> +++ b/tests/f2fs/018.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 018
>> +Silence is golden
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960EB27A08
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 09:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+k3eqv3KnUm6AiUtZBXfHlUQACmixjZamr+BC7DxgU=; b=lTdU4DOP96D0GbjsT00JrTvLmN
	mMP3xYSd7xhc2akSFpEgUgLQyU7GTAS1jZoogTTRQWS8lJh40GnjPVt+hpyNvmU8K6E+BTVPmOCJr
	q8qaflTpF7/psrmTwecg99/6PIsOjl8MliCQO1JztmWyyEEwbmCzzgYtUkTB8Mt3PAl0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umonl-00067b-3b;
	Fri, 15 Aug 2025 07:24:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umonk-00067V-An
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 07:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HMH6nQGcGME/DJjDH4eLG9NzyxYlGd5QgoqwbaHVdl8=; b=FMg/uyG2sf9U8jE52b3Efumytk
 2DnEBoTpBxJ+umoc9hZnGYLvKCu9/YZIH8h3X8JL57FpTa4z+33C8Eduf3xz6lvdEegrNv79avdgj
 SPM7mI2oKfGGbFVo46t+GN3UshEOFhg70YfwNg+lvjUKZrTIZldRVdEDyABYD5mOq7iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HMH6nQGcGME/DJjDH4eLG9NzyxYlGd5QgoqwbaHVdl8=; b=a7rR5NCecagyPHJw/NSpV8AqZE
 ECUl/fJ9YgXIxFViAD6OnMSd9VmndSxy4w9YcyUk+/TEyU9WA2U/Hrb+ogZniw8u3yUuzSo8GkpY4
 jSdH5q6NLAuThBacVxBG+eLNRUVrRzQ68iHTNwS1l0YqAIOtUIIiKN19hOUT+qnzJDX4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umonj-0003gA-NB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 07:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF4546116E;
 Fri, 15 Aug 2025 07:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163A2C4CEEB;
 Fri, 15 Aug 2025 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755242669;
 bh=FmbOj40jrFapiXTbimXsVNU3tIo0ZnAjE9hXb0fbSSY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CwKGYmhcQRPT0NxEnmjEn2J+Qo/RXbH586M3R++R0bA34MwBPdruyV3dyzaV22bca
 DYuGcy61loKr0XovQMs5btNuhl2XC/F5WGP2MSYECeDcn2tUkpr4J+12Gr3M676HZG
 dFXwTxX4Gagnz6F3oze+7/MClLThhnmlvcYSEBYtfZYsxK2xfTKSXd03QJ/Dl6OyCS
 PrDm6/Bb5QVrX1Yr4m3yKm8FPGlbVHmN12X8JYSvjUfuOWXpxjld3kdvQN/5aKSLCH
 BwM8tgWcg5Wu84v5gj4ccFwvaG/woW/Q8/gFgfIYiKAdohk3yiAPRAbusDMDLyQQFN
 ZA1NgMNbAYxuw==
Message-ID: <fd2ecc04-5958-49e4-8c01-a30420a204a5@kernel.org>
Date: Fri, 15 Aug 2025 15:24:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
 <20250814205334.obe6tmyhphngntdv@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250814205334.obe6tmyhphngntdv@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/15/25 04:53, Zorro Lang wrote: > On Thu, Aug 14, 2025
 at 05:07:10PM +0800, Chao Yu wrote: >> This is a regression testcase, it
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
X-Headers-End: 1umonj-0003gA-NB
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs/018: check data eof after
 partial truncation on compressed cluster
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

On 8/15/25 04:53, Zorro Lang wrote:
> On Thu, Aug 14, 2025 at 05:07:10PM +0800, Chao Yu wrote:
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
>> v2:
>> - add missing _require_xfs_io_command "truncate"
>> - add missing _require_fio $fio_config
>> - use $XFS_IO_PROG instead of xfs_io
>> - avoid mkfs&mount .. umount for each round test
>>  tests/f2fs/018     | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/018.out |  2 ++
>>  2 files changed, 79 insertions(+)
>>  create mode 100755 tests/f2fs/018
>>  create mode 100644 tests/f2fs/018.out
>>
>> diff --git a/tests/f2fs/018 b/tests/f2fs/018
>> new file mode 100755
>> index 00000000..e1047f78
>> --- /dev/null
>> +++ b/tests/f2fs/018
>> @@ -0,0 +1,77 @@
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
>> +_require_xfs_io_command "truncate"
>> +_require_scratch
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +fio_config=$tmp.fio
>> +
>> +cat >$fio_config <<EOF
>> +[global]

I updated task name from global to verify-data to avoid
"No job(s) defined" error from fio.

>> +filename=$testfile
>> +rw=read
>> +verify=pattern
>> +verify_pattern=0x00
>> +do_verify=1
>> +verify_only
>> +offset=0
>> +size=4k
>> +numjobs=1
>> +EOF
>> +_require_fio $fio_config
> 
> Hmm... that looks strange if you create fio config file but don't use it later :-D
> 
> How about:
> 
> build_fio_config()
> {
> 	local offset=$1
> 	local size=$2
> 
> 	cat >$fio_config <<EOF
> [global]
> filename=$testfile
> rw=read
> verify=pattern
> verify_pattern=0x00
> do_verify=1
> verify_only
> offset=$offset
> size=$size
> numjobs=1
> EOF

cat $fio_config >> $seqres.full

To record fio config in seqres.full

> }
> 
> build_fio_config 0 4k
> _require_fio $fio_config

Add _cleanup() to remove $testfile created in last testcase.

> 
>> +
>> +_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
>> +_scratch_mount "-o compress_extension=*" >> $seqres.full
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
>> +
> 
> rm -f $testfile
> 
>> +	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
>> +	$XFS_IO_PROG -c "truncate $offset1" $testfile
>> +	$XFS_IO_PROG -c "truncate $offset2" $testfile
>> +
>> +	if [ "$offset3" ]; then
>> +		xfs_io -c "truncate $offset3" $testfile
>                 ^^^^^^
>        $XFS_IO_PROG
> 
>> +	fi
>> +
>> +	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
>> +		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
>> +		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"
> 
> build_fio_config $eof_start $eof_size
> $FIO_PROG $fio_config >> $seqres.full 2>&1
> 
>> +
>> +	rm -f $testfile
> 
> Move this line to above, then
> 
> return $?
> 
>> +}
>> +
>> +check_data_eof 12k 4k 16k 12k 20k
>> +check_data_eof 10k 6k 16k 10k 20k
>> +check_data_eof 12k 4k 16k 8k 12k 20k
>> +check_data_eof 10k 6k 16k 8k 10k 20k
> 
> run_check check_data_eof 12k 4k 16k 12k 20k
> run_check check_data_eof 10k 6k 16k 10k 20k
> run_check check_data_eof 12k 4k 16k 8k 12k 20k
> run_check check_data_eof 10k 6k 16k 8k 10k 20k
> 
> This can help you to know which line fails if one of them is failed. Or you
> always get "eof data is not zero", no matter which line fails :)

Looks nice!

> 
>> +
>> +_scratch_unmount
> 
> This unmount looks useless, due to SCRATCH_DEV is always unmounted after a test done.

Thanks for all your suggestion, will update v3.

Thanks,

> 
> Thanks,
> Zorro
> 
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

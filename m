Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F693B28B4A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Aug 2025 09:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfPJ6gZHITzeewoWoWUOiZudZKFuUhKshKFzFESIOUA=; b=MQ3DPUOzFV3gEPvFgYJEUbuM4/
	JLwysEbDRW8SsBt4NRxdRpiSocbCtNEtcRn0Zfhc15jA7hiCTtV4a9k4ouBl6f0YNzQWOwSeJPuQP
	3Hn4ond101cYaAq0Tw33FtmxKFICox3KAtRR0gTTJDW1JpcaA/+7IrNKbMqZ3dm/lgLg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unB2y-0007Sp-1H;
	Sat, 16 Aug 2025 07:09:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unB2v-0007Sh-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHY7sPyFbNyqbklGMYxPy+lrSylzwYbhDZ48qYK2saM=; b=CgJnJLZ6wkxlMXucaDvokhNd/9
 5N7yxlB0V27wmUwgCi2kJedrE2fOyI0Qtoz5MagkNP2R9kvFGqoLZBoIu7Sm3Xk7hfRhLYyWeDREK
 Fb/jJjto91u6M6YCSSnP18ryPAATT6Y7+wRI9AnlgLfn0aTDUN5Te3Cr22BgEcqfV24M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IHY7sPyFbNyqbklGMYxPy+lrSylzwYbhDZ48qYK2saM=; b=jeudVRUNsaXfepq00Bm04JNfO3
 iluivVe28uXNqUBasGJYMEYn80wNE2B+dfErNRutRAQgAKWbKL14rLg83yumOg0BsU/uUkV/9YWob
 CYKyl9y5NFYVzHNJkqSad/fAv/QjRGt/faPi2Z8hbG+b39ToX0YCSmw4lOWIHzP6S+00=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unB2u-0002pj-SW for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3691BA584A2;
 Sat, 16 Aug 2025 07:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AEC4CEEF;
 Sat, 16 Aug 2025 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755328173;
 bh=lJ6wXxR2A+ClkwJB51oyVnDf1WJTdsz/gHtRcw3vA9Y=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ULJC82DlPmfbv5OgrKXCie3HV2HxI2xlMxGwxBvZ09YDtMhiRrcPJC9SBefCzEzfQ
 2lTTv49WXWegYlHZBGi08yWTacoQTCsSV/av653rtVEe5GNs8p+q71N9WE7u8sstrO
 ds59JKzyoqTC4+H08hQFVSntTP5p2PJfJig5U/15BvhkuyAyzfeYuhBB6qE6f723K0
 A9siD+8hCr2PIiI5elSag1cXGj3ultghSAcf1iWzDF5Np6gnw0PfIfyJpWlS143Rq4
 nc5XTKuFXvRcTjx+7mDfyRtRX9M+CS9SCSb7s7cTqJDv1fDb0j3wbK59qFvlF0NDzi
 DxZFtwmucS+AQ==
Message-ID: <5e82abea-1dab-4a0c-bb9b-e1ac4eb4544f@kernel.org>
Date: Sat, 16 Aug 2025 15:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250815081405.2523015-1-chao@kernel.org>
 <20250815153127.aqjzltcxsdktar23@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250815153127.aqjzltcxsdktar23@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/15 23:31, Zorro Lang wrote: > On Fri, Aug 15, 2025
 at 04:14:03PM +0800, Chao Yu wrote: >> This is a regression testcase, it
 is added to check below case >> and its variants: >> - write 16k d [...] 
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
X-Headers-End: 1unB2u-0002pj-SW
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs/018: check data eof after
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/8/15 23:31, Zorro Lang wrote:
> On Fri, Aug 15, 2025 at 04:14:03PM +0800, Chao Yu wrote:
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
>> v3:
>> - introduce build_fio_config() for cleanup
>> - use run_check() to check return value of check_data_eof()
>> - add _cleanup
>> - use $XFS_IO_PROG instead of xfs_io
>>   tests/f2fs/018     | 89 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/018.out |  2 ++
>>   2 files changed, 91 insertions(+)
>>   create mode 100755 tests/f2fs/018
>>   create mode 100644 tests/f2fs/018.out
>>
>> diff --git a/tests/f2fs/018 b/tests/f2fs/018
>> new file mode 100755
>> index 00000000..8013042d
>> --- /dev/null
>> +++ b/tests/f2fs/018
>> @@ -0,0 +1,89 @@
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
>> +build_fio_config()
>> +{
>> +	local offset=$1
>> +	local size=$2
>> +
>> +	cat >$fio_config <<EOF
>> +[verify-data]
>> +filename=$testfile
>> +rw=read
>> +verify=pattern
>> +verify_pattern=0x00
>> +do_verify=1
>> +verify_only
>> +offset=$offset
>> +size=$size
>> +numjobs=1
>> +EOF
>> +	cat $fio_config >> $seqres.full
>> +}
>> +
>> +build_fio_config 0 4k
>> +_require_fio $fio_config
>> +
>> +_cleanup()
>> +{
>> +       rm -f $testfile
>> +}
> 
> This _cleanup isn't necessary, the $testfile is on SCRATCH_DEV, we don't
> need to cleanup SCRATCH_DEV manually.
> 
> Others look good to me, I can help to remove above _cleanup function when
> I merge this patchset, if other 2 patches are good to merge too :)

Fine to me. :)

> 
> Reviewed-by: Zorro Lang <zlang@redhat.com>

Thanks a lot for all your review and suggestion.

Thanks,

> 
> Thanks,
> Zorro
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
>> +	rm -f $testfile
>> +
>> +	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
>> +	$XFS_IO_PROG -c "truncate $offset1" $testfile
>> +	$XFS_IO_PROG -c "truncate $offset2" $testfile
>> +
>> +	if [ "$offset3" ]; then
>> +		$XFS_IO_PROG -c "truncate $offset3" $testfile
>> +	fi
>> +
>> +	build_fio_config $eof_start $eof_size
>> +	$FIO_PROG $fio_config >> $seqres.full 2>&1
>> +
>> +	return $?
>> +}
>> +
>> +run_check check_data_eof 12k 4k 16k 12k 20k
>> +run_check check_data_eof 10k 6k 16k 10k 20k
>> +run_check check_data_eof 12k 4k 16k 8k 12k 20k
>> +run_check check_data_eof 10k 6k 16k 8k 10k 20k
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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D19B2C1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 10:57:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5MUa-0005ay-5V;
	Mon, 28 Oct 2024 09:56:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5MUY-0005ar-B3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TiSsZa6TiG1Ys5QE/Lsu5O2KE9DbgwibT6MzjVHFBrw=; b=FFuhyVBxibB245cRH0VX6LoBRk
 YGXBK+9iMs7mLnEZETJqoAoXyVZKon6k5PQLf/wJ/d8zf4fQsUNbRd1QJIL30QES4PyjXHLIcpAf7
 5OGyhHmGZblDqz9WvZ1Cq1VxcJuG6syNFXH7tYEdha41dbM7mtci2MhOFoDT3L3+elb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TiSsZa6TiG1Ys5QE/Lsu5O2KE9DbgwibT6MzjVHFBrw=; b=jIMe9E3a2q5PAqRieNrAH1FvCo
 GeO4d6w/zL3V/fEYhKBPwWNtzjLtEqktB5vr0CXzDlPvSr4/RkoQOj0krQGtvyyVTNOQ0e4yCWoxO
 oPx/QeFArIMsQKMMY1OLk3bxNt3IEXtYP4yFQnz4m9QgWiQEBn+o85uLN/lonWFU8lcM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5MUX-0000Xy-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0DF2D5C5986;
 Mon, 28 Oct 2024 09:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFAFC4CEC3;
 Mon, 28 Oct 2024 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730109402;
 bh=Aw1TCrslxEE8zF/NKWKONs8Tgt/MP8lPVbB9dltlncg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SD2K2MIu7RtjoaKThBfqnKXJaiFigFhtWMPd6EvOphgekE/75Vx8s+HRJHaAIK2AL
 QkU5O5PXfLjlYl4jZPCom3zaSeOZqLk/G80BtUZKI9IleSnWnOg26JlwHuMYU9klwc
 cRMyJUoX4v3iJHQZB3NIVoyWizrREUY8NZgpWNuRhvqGDrN6gsW9I/ZxHyvEogKp1g
 g9cXFddF6QPrtjSyCSKnNCXV5hvDVbjvPSbopocxT5+jmEvPvU3KB3hOonX/EJZZDb
 F2PwsmY3PChl1wOhwaasfotrA/0H0vvfWouUKiubONiNTOR4t7Nyh4gDqJhUHhvEY2
 GP1sX54mXOHaA==
Message-ID: <85043d8c-78e3-43ef-a5ae-2299b63b67b7@kernel.org>
Date: Mon, 28 Oct 2024 17:56:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241023081602.3806579-1-chao@kernel.org>
 <20241023081602.3806579-2-chao@kernel.org>
 <20241025035824.3i62khlg3juccxeb@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241025035824.3i62khlg3juccxeb@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/25 11:58, Zorro Lang wrote: > On Wed, Oct 23, 2024
 at 04:16:02PM +0800, Chao Yu wrote: >> metadata of compressed inode should
 always be consistent after file >> compression, reservation, re [...] 
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
X-Headers-End: 1t5MUX-0000Xy-G2
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs/007: add testcase to check
 consistency of compressed inode metadata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Qi Han <hanqi@vivo.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/25 11:58, Zorro Lang wrote:
> On Wed, Oct 23, 2024 at 04:16:02PM +0800, Chao Yu wrote:
>> metadata of compressed inode should always be consistent after file
>> compression, reservation, releasement and decompression, let's add
>> a testcase to check it.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Qi Han <hanqi@vivo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - add _fixed_by_kernel_commit()
>> - code cleanup
>> - add error handling for _scratch_mkfs()
>>   tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/007.out |   4 ++
>>   2 files changed, 120 insertions(+)
>>   create mode 100755 tests/f2fs/007
>>   create mode 100644 tests/f2fs/007.out
>>
>> diff --git a/tests/f2fs/007 b/tests/f2fs/007
>> new file mode 100755
>> index 00000000..8979c21c
>> --- /dev/null
>> +++ b/tests/f2fs/007
>> @@ -0,0 +1,116 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/007
>> +#
>> +# This is a regression test to check whether compressed metadata
>> +# can become inconsistent after file compression, reservation
>> +# releasement, and decompression.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick rw compress
>> +
>> +_fixed_by_kernel_commit xxxxxxxxxxxx \
>> +        "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"
>> +
>> +testfile_prefix=$SCRATCH_MNT/testfile
>> +fio_config=$tmp.fio
>> +
>> +cat >$fio_config <<EOF
>> +[write_compressed_data_30]
>> +name=mytest
>> +ioengine=psync
>> +rw=write
>> +direct=0
>> +bs=1M
>> +filesize=1M
>> +numjobs=1
>> +filename=${testfile_prefix}30
>> +buffer_compress_percentage=30
>> +
>> +[write_compressed_data_60]
>> +name=mytest
>> +ioengine=psync
>> +rw=write
>> +direct=0
>> +bs=1M
>> +filesize=1M
>> +numjobs=1
>> +filename=${testfile_prefix}60
>> +buffer_compress_percentage=60
>> +
>> +[write_compressed_data_90]
>> +name=mytest
>> +ioengine=psync
>> +rw=write
>> +direct=0
>> +bs=1M
>> +filesize=1M
>> +numjobs=1
>> +filename=${testfile_prefix}90
>> +buffer_compress_percentage=90
>> +EOF
>> +
>> +_require_scratch
> 
> Better to move _require_scratch before "testfile_prefix=$SCRATCH_MNT/testfile".
> Due to we'd better to make sure there's $SCRATCH_MNT, before using it.
> 
>> +_require_fio $fio_config
>> +_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
>> +_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
>> +
>> +echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
>> +cat $fio_config >> $seqres.full
>> +$FIO_PROG $fio_config >> $seqres.full
>> +_scratch_unmount
>> +
>> +# force to repaire if filesystem is corrupted
>> +export FSCK_OPTIONS="-f $FSCK_OPTIONS"
>> +
>> +for i in 30 60 90; do
>> +	testfile=$testfile_prefix$i
>> +
>> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
>> +	$F2FS_IO_PROG compress $testfile >> $seqres.full
>> +	cblocks=`$F2FS_IO_PROG get_cblocks $testfile`
>> +	echo "compression ratio is: "$cblocks" / 256"
>> +
>> +	_scratch_unmount
>> +
>> +	# 1. check after compression
>> +	_check_scratch_fs
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after compress"
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
>> +	$F2FS_IO_PROG release_cblocks $testfile >> $seqres.full
>> +	_scratch_unmount
>> +
>> +	# 2. check after releasement
>> +	_check_scratch_fs
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after release_cblocks"
> 
> The _fail is not necessary, due to _check_scratch_fs will do "exit 1"
> if it find a corruption. If you need some message, maybe echo it before
> calling _check_scratch_fs?
> 
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
>> +	$F2FS_IO_PROG reserve_cblocks $testfile >> $seqres.full
>> +	_scratch_unmount
>> +
>> +	# 3. check after rservation
>> +	_check_scratch_fs
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after reserve_cblocks"
>> +	fi
> 
> Same as above
> 
>> +
>> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
>> +	$F2FS_IO_PROG decompress $testfile >> $seqres.full
>> +	_scratch_unmount
>> +
>> +	# 4. check after decompression
>> +	_check_scratch_fs
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after decompress"
>> +	fi
> 
> Same as above.

Okay, let me update the patch.

Thanks,

> 
> Thanks,
> Zorro
> 
>> +done
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/007.out b/tests/f2fs/007.out
>> new file mode 100644
>> index 00000000..2ea71c18
>> --- /dev/null
>> +++ b/tests/f2fs/007.out
>> @@ -0,0 +1,4 @@
>> +QA output created by 007
>> +compression ratio is: 64 / 256
>> +compression ratio is: 128 / 256
>> +compression ratio is: 192 / 256
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCC9AC002
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 09:18:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3Vda-0004Ou-63;
	Wed, 23 Oct 2024 07:18:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3VdZ-0004Oo-5u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 07:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hsTkMSJl33+Ebfete5SxpmaahOJqYF2PQEGBvY1MbMw=; b=ZgaHZvytfXOgItZWDol/5pb8se
 rSfT1LYnCWKIpU2gXrZFJAwCg0ZhXGaRo8iInTM0U0fu8Ua9KW4+tvPJY4JNA5VPJL/ojX0ezbS6J
 GwzdZUTce9QiOG7ftC9V+2bS070LJ0fUcusl9CFlpgGLP/AFthcOSl00X+4+TbbWnH4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hsTkMSJl33+Ebfete5SxpmaahOJqYF2PQEGBvY1MbMw=; b=hU0eQNGlkKDsWsRwHhGsHCqruC
 Y+y/dVt5kODDpmp7aEGIt1MI+yUtqQMJPhfEYYPY+nhuczbQVd2FBjmjbVmOfjyhbg4mdUY3e5ZcO
 nnSpchhMfIMgPpWlzepVe0DECf/sHTi2d8cVtO6bye+n3/FChmhgIr998KMR1Jo5yzto=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3VdX-0006VW-MS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 07:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1F96A44AE9;
 Wed, 23 Oct 2024 07:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352E1C4CEC6;
 Wed, 23 Oct 2024 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729667905;
 bh=HZEpojZgfXGKFnv44xgyxZ4cy2+RhSZbW2dyEUNmQCA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=b/2hnwdap2fSTu7TG+GXmjG9vu4lCnKz7oqQP59t8ZsU4Zwp2t9oL8IkN+zwMB8XC
 FyIvpJdKXnp0rdb9Eur6pgIz8tnj8F3nRa2/N4RYxb4bwlu8hyZqYCWQjJSpjEnLGy
 NMmFbBH7ZD67w7bEt6MGmCZ/oxZNuNKaUOry1B85+EHbEMZLoh0/T/nv6s4v6zE2HJ
 o8htg3M8CdbOqIo4Zz4dyMpr6jP6a8EGY70uNN8oKUR9eDd0FG3sQJT9n6NfyWxRHK
 13XhxMXLMnsyu4ViuU17ZcbR0wDHurljFUMMv15sQz1XHFZ4MHFDcHSsbD03bGJX43
 7W7bh+Y+t/E/g==
Message-ID: <56b6a57d-c0db-4a6e-a7a9-e5d1a7396b83@kernel.org>
Date: Wed, 23 Oct 2024 15:18:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20241015025106.3203676-1-chao@kernel.org>
 <20241015025106.3203676-2-chao@kernel.org>
 <20241023030746.5e53w26p5qtfbpod@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20241023030746.5e53w26p5qtfbpod@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/23 11:07, Zorro Lang wrote: > On Tue, Oct 15, 2024
 at 10:51:06AM +0800, Chao Yu wrote: >> metadata of compressed inode should
 always be consistent after file >> compression, reservation, re [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3VdX-0006VW-MS
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/007: add testcase to check
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

On 2024/10/23 11:07, Zorro Lang wrote:
> On Tue, Oct 15, 2024 at 10:51:06AM +0800, Chao Yu wrote:
>> metadata of compressed inode should always be consistent after file
>> compression, reservation, releasement and decompression, let's add
>> a testcase to check it.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Qi Han <hanqi@vivo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/007.out |   4 ++
>>   2 files changed, 120 insertions(+)
>>   create mode 100755 tests/f2fs/007
>>   create mode 100644 tests/f2fs/007.out
>>
>> diff --git a/tests/f2fs/007 b/tests/f2fs/007
>> new file mode 100755
>> index 00000000..274be806
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
> 
> Hi Chao,
> 
> Thanks for the new f2fs test cases.
> 
> If there's a known fix for this regression, please mark it by:
> 
> _fixed_by_kernel_commit .....

Zorro,

Yes, but not been merged yet, so let me add as below and replace
commit_id after upstreaming the fix.

_fixed_by_kernel_commit xxxxxxxxxxxx \
         "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"

Thanks for all comments below, will fix all.

Thanks,

> 
>> +# can become inconsistent after file compression, reservation
>> +# releasement, and decompression.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>                              ^^^^
>                              rw compress ?
> 
>> +
>> +_cleanup()
>> +{
>> +	cd /
>> +	rm -r -f tmp.*
>> +}
> 
> This's same with default _cleanup, so it can be removed.
> 
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
>> +filename=/mnt/scratch_f2fs/testfile30
>              ^^^^^^^^^^
> 
> $SCRATCH_MNT or ${testfile_prefix}30 ?
> 
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
>> +filename=/mnt/scratch_f2fs/testfile60
> 
> Same as above.
> 
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
>> +filename=/mnt/scratch_f2fs/testfile90
> 
> Same as above
> 
>> +buffer_compress_percentage=90
>> +EOF
>> +
>> +_require_fio $fio_config
>> +_require_scratch
> 
> I'd like to call _require_scratch at the beginning, especially you use
> SCRATCH_* things in $fio_config. You can refer to generic/095.
> 
>> +_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full
> 
> Can you make sure this mkfs never fail? Maybe:
>      || _fail "...."
> 
>> +_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
>> +
>> +echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
>> +cat $fio_config >> $seqres.full
>> +$FIO_PROG $fio_config >> $seqres.full
>> +_scratch_unmount
>> +
>> +for i in 30 60 90; do
>> +	testfile=$testfile_prefix$i
>> +
>> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
>> +	f2fs_io compress $testfile >> $seqres.full
>          ^^^^^^^
> $F2FS_IO_PROG
> 
>> +	cblocks=`f2fs_io get_cblocks $testfile`
>                   ^^^^^^^
> $F2FS_IO_PROG
> 
>> +	echo "compression ratio is: "$cblocks" / 256"
>> +
>> +	_scratch_unmount
>> +
>> +	# 1. check after compression
>> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
> 
> _check_scratch_fs ?
> 
> If f2fs needs some custom operations, please change the _check_scratch_fs
> or _check_generic_filesystem.
> 
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after compress"
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
>> +	f2fs_io release_cblocks $testfile >> $seqres.full
> 
> $F2FS_IO_PROG
> 
>> +	_scratch_unmount
>> +
>> +	# 2. check after releasement
>> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
> 
> _check_scratch_fs
> 
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after release_cblocks"
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
>> +	f2fs_io reserve_cblocks $testfile >> $seqres.full
> 
> $F2FS_IO_PROG
> 
>> +	_scratch_unmount
>> +
>> +	# 3. check after rservation
>> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
> 
> _check_scratch_fs
> 
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after reserve_cblocks"
>> +	fi
>> +
>> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
>> +	f2fs_io decompress $testfile >> $seqres.full
> 
> $F2FS_IO_PROG
> 
>> +	_scratch_unmount
>> +
>> +	# 4. check after decompression
>> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
> 
> _check_scratch_fs
> 
> Thanks,
> Zorro
> 
>> +	if [ $? -ne 0 ]; then
>> +		_fail "filesystem becomes corrupted after decompress"
>> +	fi
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

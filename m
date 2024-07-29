Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98293EA7D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 03:10:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYEuP-0005Fc-3r;
	Mon, 29 Jul 2024 01:10:41 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sYEuO-0005FW-Bv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 01:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fs7XkfH/yr3Yei/0Ekm8AimjkFEbROuR3rE2UWzQ9Wg=; b=HeT0hjY7q93Kf023QKM7yYg2tu
 b1CXWtBc2uh4iFSbqJUNk+jptcd4XbrI4Y2V6UqzvL1XTyfnKYcafmIC79FCYf6FmZ6j4SXIFFSHc
 wJUg4KcFBq1w6Nh/oJokZ9yeDyg5eihtEVP2K3glWjN6rpglnwZdcqc2awMK2rZjHvms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fs7XkfH/yr3Yei/0Ekm8AimjkFEbROuR3rE2UWzQ9Wg=; b=AT2PZHGurwfaK7oHmbt76vqaAl
 d0tNcBcg+CajGfKBI9YXx9p6HFkC7+uSZequrtyIfHCqD/NvXw0IepvChFU+DvedsQZ4M141SCBLZ
 35my28/KthOLuUHGkS62sepDI84av4jiT2pkV1R1yMIyKjgZenaDw3FiX15+qutbxrbk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYEuN-0000g9-VC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 01:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3C9D1CE0A06;
 Mon, 29 Jul 2024 01:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724E8C116B1;
 Mon, 29 Jul 2024 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722215427;
 bh=rsdtn6n+gSqoqURluDSAQfnmhx9Esq3YqTSrLvnxxS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PcAEzclworL6t1rf2+6Vdh2fxdjvg8rsB039fWwZni8pI9ILiDnIkndobfEcXgvy6
 3teP7kohR+eNr0LWFT3ZXE4+0hDR987Nzp9jH6VJzQueTRDt/bzhr6xj3A6IJHV3fZ
 Ja5+Y3v4yD0cH2LM23njc5T/zNlLfv2SSJjx+kOn9tGFfvf5R331WHKLl0BmxGOF5l
 Al5FhCEo0cu8hFRrZDntdfSNFLE1D7NvKa/jEfAVfgra+MtnPgDbnP+QAHd3HmSkX3
 2XslSuIuqjiqW1EKKYPc2Pb3ZC1JlBom6KMDLsztqxt2c50v5YBj/JOubSYKBr19+G
 poRecwvLaa1XA==
Message-ID: <17f4eedc-f51a-4c1e-8386-71a1af6acec0@kernel.org>
Date: Mon, 29 Jul 2024 09:10:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20240720074316.3302470-1-chao@kernel.org>
 <20240726154941.lzpunsvd53lnieoz@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240726154941.lzpunsvd53lnieoz@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/26 23:49, Zorro Lang wrote: > On Sat, Jul 20, 2024
 at 03:43:16PM +0800, Chao Yu wrote: >> Test that we will simulate sqlite
 atomic write logic w/ below steps: >> 1. create a regular file, an [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYEuN-0000g9-VC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: test for race condition in between
 atomic_write and gc
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/26 23:49, Zorro Lang wrote:
> On Sat, Jul 20, 2024 at 03:43:16PM +0800, Chao Yu wrote:
>> Test that we will simulate sqlite atomic write logic w/ below steps:
>> 1. create a regular file, and initialize it w/ 0xff data
>> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
>> 3. write transaction data
>> 4. trigger foreground GC to migrate data block of the file
>> 5. commit and end the transaction
>> 6. check consistency of transaction
>> This is a regression test to check handling of race condition in
>> between atomic_write and GC.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - add kill&wait in _clean() to avoid umount failure
>> - some cleanups
>> - use exported helpler
>>   tests/f2fs/003     | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/003.out | 11 ++++++++
>>   2 files changed, 76 insertions(+)
>>   create mode 100755 tests/f2fs/003
>>   create mode 100644 tests/f2fs/003.out
>>
>> diff --git a/tests/f2fs/003 b/tests/f2fs/003
>> new file mode 100755
>> index 00000000..c30e874a
>> --- /dev/null
>> +++ b/tests/f2fs/003
>> @@ -0,0 +1,65 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/003
>> +#
>> +# Test that we will simulate sqlite atomic write logic w/ below steps:
>> +# 1. create a regular file, and initialize it w/ 0xff data
>> +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
>> +# 3. write transaction data
>> +# 4. trigger foreground GC to migrate data block of the file
>> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> +# 6. check consistency of transaction w/ in-memory and on-disk data
>> +# This is a regression test to check handling of race condition in
>> +# between atomic_write and GC.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +. ./common/filter
>> +
>> +_cleanup()
>> +{
>> +	kill -9 $atomic_write_pid > /dev/null 2>&1
>> +	wait > /dev/null 2>&1
> 
> This version looks good to me, just this place, we need to keep the default
> _cleanup steps.
> 
>          cd /
>          rm -r -f $tmp.*
> 
> I'll do this change when I merge this patch.
> 
> (And please don't forget to update the _fixed_by_xxxxx information later.)

No problem.

> 
> Reviewed-by: Zorro Lang <zlang@redhat.com>

Thank you for the review. :)

Thanks,

> 
> Thanks,
> Zorro
> 
>> +}
>> +
>> +_require_scratch
>> +_require_xfs_io_command "fpunch"
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount >> $seqres.full
>> +
>> +dbfile=$SCRATCH_MNT/dbfile
>> +foo=$SCRATCH_MNT/foo
>> +bar=$SCRATCH_MNT/bar
>> +
>> +$XFS_IO_PROG -c "pwrite 0 512k -S 0xff" -c "fsync" -f $dbfile >> $seqres.full
>> +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $foo >> $seqres.full
>> +sync
>> +
>> +# start atomic_write on dbfile & write data to dbfile
>> +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
>> +atomic_write_pid=$!
>> +
>> +$XFS_IO_PROG -c "fpunch 0 2m" $foo >> $seqres.full
>> +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $bar >> $seqres.full
>> +
>> +# persist all dirty data
>> +sync
>> +echo 3 > /proc/sys/vm/drop_caches
>> +
>> +# trigger foreground GC to migrate data block of atomic_file
>> +$F2FS_IO_PROG gc 1 $SCRATCH_MNT > /dev/null 2>&1
>> +
>> +# wait for atomic_write commit completion
>> +sleep 5
>> +# print in-memory data
>> +_hexdump $dbfile
>> +echo 3 > /proc/sys/vm/drop_caches
>> +# print on-disk data
>> +_hexdump $dbfile
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/003.out b/tests/f2fs/003.out
>> new file mode 100644
>> index 00000000..64698d84
>> --- /dev/null
>> +++ b/tests/f2fs/003.out
>> @@ -0,0 +1,11 @@
>> +QA output created by 003
>> +000000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
>> +*
>> +020000 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  >................<
>> +*
>> +080000
>> +000000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
>> +*
>> +020000 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  >................<
>> +*
>> +080000
>> -- 
>> 2.40.1
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

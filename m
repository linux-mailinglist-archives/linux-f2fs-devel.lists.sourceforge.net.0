Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45C933551
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2024 04:12:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTu9h-0003Uh-BM;
	Wed, 17 Jul 2024 02:12:33 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sTu9g-0003Ub-IV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 02:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9M3R3smfbTPwIl9IuHSnGfiV3qt751F6xqrZkqZoDc=; b=dappfSfWYfdeK25IGFsZVQ3OZq
 Vk6yDG4J0jLms6wL/llfG85RgGauX90LkEaUpyo0kPIu1HBLLptLRCteBx7ZFvtnNh9sIL//Y+VAX
 W8nvxpoLQAeK/Ribtr045XOim2FBwzndygTB2k5EH0QT0A3VZVO5sOspS9hpwQG3cvhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q9M3R3smfbTPwIl9IuHSnGfiV3qt751F6xqrZkqZoDc=; b=KToXvYHiWvlrh7HlPegzsku8FQ
 83D/NPWo7UcAUX+Q/oK7ZegclH+BYh9Zp2j2a6e6EsVvNKkferWyHp8GKuPAlFElZWR6iLR+f53uB
 D2qacSiI3VT+JFGyIOLDqylpLtgyEyVsSQ6YFohEyeicA3uY7o8GOgc9kVskTugYK9SU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTu9g-00072j-HC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 02:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E64061113;
 Wed, 17 Jul 2024 02:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5826C116B1;
 Wed, 17 Jul 2024 02:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721182341;
 bh=r18DYM9L0j/fdMY2uog1UdcMmZiz6cjxEKC8Pnyj0xI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UbHbIYx2l0scUaNJxuzM21ymvFnJp1ApE7FNyOtDWhdz214AyCv0eBIFroP7SufHQ
 TqmxFNGmoN0Bsc6jDf2QbDoqYXXExmXnYtNWqID+m7y92O01kweFSiqlu2+y2dd3aF
 y70RC29GBhprgKANYu4tm6z0yn8SPw3L871nib57UlYh+C1gcquA5k9is+5gtpVjS5
 yOBQ/HVIpHQIYIv0cUQhIHbKbl1HdIeiBEE7mu41XOMhoYn7oL4AogRWL5J+0BbqwG
 X4FPWhGik9CWxUFCWWwDaUxQ1q7zPopkhRja1VbMmlk70Ge/q2eOhEyydHW8GEdvfg
 SJTls0cluoNiw==
Message-ID: <fba75c06-b0d9-4e92-b673-9c11314744c1@kernel.org>
Date: Wed, 17 Jul 2024 10:12:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20240625030416.3553498-1-chao@kernel.org>
 <20240716105710.v76icnjhqmvjmgsd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240716105710.v76icnjhqmvjmgsd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/16 18:57, Zorro Lang wrote: > On Tue, Jun 25, 2024
 at 11:04:16AM +0800, Chao Yu wrote: >> Test that we will simulate sqlite
 atomic write logic w/ below steps: >> 1. create a regular file, an [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTu9g-00072j-HC
Subject: Re: [f2fs-dev] [PATCH] f2fs: test for race condition in between
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
 fstests@vger.kernel.org, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/16 18:57, Zorro Lang wrote:
> On Tue, Jun 25, 2024 at 11:04:16AM +0800, Chao Yu wrote:
>> Test that we will simulate sqlite atomic write logic w/ below steps:
>> 1. create a regular file, and initialize it w/ 0xff data
>> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
>> 3. write transaction data
>> 4. trigger foreground GC to migrate data block of the file
>> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> 6. check consistency of transaction w/ in-memory and on-disk data
>> This is a regression test to check handling of race condition in
>> between atomic_write and GC.
> 
> Hi Chao,
> 
> Sorry for the late reviewing. As this's a regression test, so which onne
> kernel commit fix this known issue, please specify it by:
> 
> _fixed_by_kernel_commit $commit_id $commit_subject

Hi Zorro,

Since the fixed patch has not been merged yet, so what about adding this line
after merging the fix?

> 
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/003     | 61 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/003.out | 11 +++++++++
>>   2 files changed, 72 insertions(+)
>>   create mode 100755 tests/f2fs/003
>>   create mode 100644 tests/f2fs/003.out
>>
>> diff --git a/tests/f2fs/003 b/tests/f2fs/003
>> new file mode 100755
>> index 00000000..d8311c4c
>> --- /dev/null
>> +++ b/tests/f2fs/003
>> @@ -0,0 +1,61 @@
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
>> +_supported_fs f2fs
>      ^^^^^
> This line is not necessary now.
> 
>> +_require_scratch
>> +_require_xfs_io_command "pwrite"
> 
> pwrite is a basic command of xfs_io, so I think this line is not necessary.
> 
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
> 
> As there's a background process, shouldn't we do kill and wait in _cleanup
> to make sure unmount won't hit EBUSY?
> 
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
>> +od -x $dbfile
>> +echo 3 > /proc/sys/vm/drop_caches
>> +# print on-disk data
>> +od -x $dbfile
> 
> There's a common helper named "_hexdump" in common/rc, can that be used?
> 
>> +
>> +_scratch_unmount
> 
> The SCRATCH_DEV will be unmounted at the end of the test, don't need to
> do this manually if it's not a necessary test step.

Let me update this patch according to your comments, thanks.

Thanks,

> 
> Thanks,
> Zorro
> 
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/003.out b/tests/f2fs/003.out
>> new file mode 100644
>> index 00000000..d6c8a637
>> --- /dev/null
>> +++ b/tests/f2fs/003.out
>> @@ -0,0 +1,11 @@
>> +QA output created by 003
>> +0000000 0000 0000 0000 0000 0000 0000 0000 0000
>> +*
>> +0400000 ffff ffff ffff ffff ffff ffff ffff ffff
>> +*
>> +2000000
>> +0000000 0000 0000 0000 0000 0000 0000 0000 0000
>> +*
>> +0400000 ffff ffff ffff ffff ffff ffff ffff ffff
>> +*
>> +2000000
>> -- 
>> 2.40.1
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

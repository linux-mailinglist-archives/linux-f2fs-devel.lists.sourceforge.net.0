Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C326193355E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2024 04:15:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTuCQ-0003nN-QD;
	Wed, 17 Jul 2024 02:15:22 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sTuCO-0003nG-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 02:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d/dAWT9XM5iwaVChgeTKHUgkbbITDVgzE++3uZIdIk0=; b=JrkZR88gWu9fs5/Dx/WNRkfX/r
 09twWNF5ukihSs+IWDrXPqNXR6rU1wYHyUn9cdpx4TEN9cMx8mPt714YVh+Mj2RdGtSyJhrinajlQ
 Fa914FvbHx2mTtRDlQFduCAroz4AQeW81cML4JQlOvvUZt6Fjh8C1k9wBHe/wPGHmQDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d/dAWT9XM5iwaVChgeTKHUgkbbITDVgzE++3uZIdIk0=; b=e0KEXuYPBl+u6nT8+45bKOVXHL
 Q98ySQteoi3LGeoSFppFQ24bJxyQLzfvo+3mvHsjuYWwYNlyFlgjaDgHYgXa8qJEpJD8LC3QvUGL2
 8KpiGz9YrdX09PDyKEFz4o/wiv7E/LjUb5vJEZma5DfeCkAGJ+d8p0lc+VsmJelA68io=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTuCO-0007DM-4b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 02:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 063B26144F;
 Wed, 17 Jul 2024 02:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E35CC4AF0B;
 Wed, 17 Jul 2024 02:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721182508;
 bh=JDMdTBK533cE5W5mFyM7mGuboxDe9l/eKUVpOdZrZ7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cAPZoRkz5bOLp1XOTUkssEeKzvJ67dbBD77aPtCOWcWKcLR+BWat2BMPjlLZ7bsRd
 etgMGetD7jtxB6RZgCSNi/1xmeKvwOj4JL9OD8Qanw8FwJ1XNQT3kJm6MKD/z4Ujxs
 GoMliS4L+djKjphL5HZ8k+vQjF1mGEhTbYgmOCGnVCFIGBvNXGVa5E1tX++eSqx/HJ
 wBpQb0s6L1GZhus285MKVRWcnxcZwyZVaOiJPShvOJXygyLL9jxQBjfKhZZZZtJ6cM
 gSIzG88hyN045x7uAIaneAYeB9XgDZzLGgAZWitnEaahhcD9P109Fu4Jgf4B4IWUUo
 fibZREA71/U2w==
Message-ID: <9809963e-1cb5-4884-92b7-6855f2556f46@kernel.org>
Date: Wed, 17 Jul 2024 10:15:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20240625140233.3907012-1-chao@kernel.org>
 <20240716110342.2jhwp3wn65pvhoyd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240716110342.2jhwp3wn65pvhoyd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/16 19:03, Zorro Lang wrote: > On Tue, Jun 25, 2024
 at 10:02:33PM +0800, Chao Yu wrote: >> In this patch, we simulate race case
 in between sqlite atomic write >> and direct IO w/ below steps: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTuCO-0007DM-4b
Subject: Re: [f2fs-dev] [PATCH] f2fs: test for race condition in between
 atomic_write and dio
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

On 2024/7/16 19:03, Zorro Lang wrote:
> On Tue, Jun 25, 2024 at 10:02:33PM +0800, Chao Yu wrote:
>> In this patch, we simulate race case in between sqlite atomic write
>> and direct IO w/ below steps:
>> 1. create a regular file, and initialize it w/ 0xff data
>> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
>> 3. write transaction data
>> 4. trigger direct read/write IO on it to check whether it fails or not
>> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> This is a regression test to check handling of race condition in
>> between atomic_write and direct IO.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/004     | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/004.out |  3 +++
>>   2 files changed, 48 insertions(+)
>>   create mode 100755 tests/f2fs/004
>>   create mode 100644 tests/f2fs/004.out
>>
>> diff --git a/tests/f2fs/004 b/tests/f2fs/004
>> new file mode 100755
>> index 00000000..26862cb5
>> --- /dev/null
>> +++ b/tests/f2fs/004
>> @@ -0,0 +1,45 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/004
>> +#
>> +# Test that we will simulate race case in between sqlite atomic write
>> +# and direct IO w/ below steps:
>> +# 1. create a regular file, and initialize it w/ 0xff data
>> +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
>> +# 3. write transaction data
>> +# 4. trigger direct read/write IO to check whether it fails or not
>> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> +# This is a regression test to check handling of race condition in
>> +# between atomic_write and direct IO.
> 
> Same as last patch, please add _fixed_by_kernel_commit.
> 
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +. ./common/filter
>> +
>> +_supported_fs f2fs
>     ^^^^^
> It's not needed
> 
>> +_require_scratch
>> +_require_xfs_io_command "pwrite"
>     ^^^^
> It can be removed too I think.
> 
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount >> $seqres.full
>> +
>> +dbfile=$SCRATCH_MNT/dbfile
>> +
>> +# start atomic_write on dbfile & write data to dbfile
>> +touch $dbfile
>> +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
> 
> There's a backgroup process too. Better to make sure it's done "kill && wait"
> before the end of the test.
> 
>> +
>> +# simulate concurrent direct read/write IO
>> +$XFS_IO_PROG -d -c "pread 0 128k" $dbfile
>> +$XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile
> 
> Do you need _require_odirect (not sure about that:).
> 
>> +
>> +# wait for atomic_write commit completion
>> +sleep 5
>> +
>> +_scratch_unmount
>     ^^^^
> It's not necessary.

Zorro, thanks for the comments, will update.

Thanks,

> 
> Thanks,
> Zorro
> 
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/004.out b/tests/f2fs/004.out
>> new file mode 100644
>> index 00000000..3af79541
>> --- /dev/null
>> +++ b/tests/f2fs/004.out
>> @@ -0,0 +1,3 @@
>> +QA output created by 004
>> +pread: Operation not supported
>> +pwrite: Operation not supported
>> -- 
>> 2.40.1
>>
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

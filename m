Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ECBC29E2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 03:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7+Yov+trpQAA0VkT6DE2zhRcL7sfPUJqRavWozXp6k=; b=bAzi2M4+R2SQhl3SIIIgkLWLM5
	vOx3D46p+7spWXVL79cnWP9+KCB0EhwagPCf6HqHYjlkpEHdtUAgfDumSJLUPh71SmAw1OFXNzlgX
	AUJnyuayMfLDLdcLfZDeF2r9ivxfapZcaRWMb77mj2H3t6BmqS97BQUS55msn1s48vkA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFkfj-0002z8-De;
	Mon, 03 Nov 2025 02:51:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFkfi-0002z0-1i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4etrTzJoHrrAxzbymfQ2gVA4S3GJiIuhOLpNnvqWNRA=; b=B84Bmh67yJctzZD0PoGwD+I7jm
 JqZFtVMaihPX/kkosNtWCRxv5VUqQEc562zIqhAoyApwAiYvkD6EdWBWzKKHdWlRlYY0nd9AwSk5e
 7gqGBbGPUZT/fiqNAVFhHGSmOpa1F4uEDVdX5bA2NIyDQ2BbdllPpCSBhVk8FPLXNqZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4etrTzJoHrrAxzbymfQ2gVA4S3GJiIuhOLpNnvqWNRA=; b=kqGvoVSv/HUV8vrC84xy+QMdlI
 CrVB01yK2AuSAvxPDye5aUnXTyvps7wHeM0Ic5TrFwFTyzZ+jZu73g72iH+Vk6yltRDJYa4YBvB1N
 Wxh/IC8fc7BrEa/b4wCJCboW6GA5bpZHqdIVBUOwxAEzLN/begudNlve46VQyiZnDSlU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFkfh-0001K7-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BED6760267;
 Mon,  3 Nov 2025 02:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4166BC4CEF7;
 Mon,  3 Nov 2025 02:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762138302;
 bh=jDwsmy1ibnQ5xTuMCA0SpaJcHMYnkZi3RK21eJq1Ho0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=JyQCuJTlWI0pRsk5/hEkkDuXBEvZVUcOjT4xRBGJgxF8aPa17aaeupOXIVRsg9nDV
 Y43nHmrcEQYkPYoBJYBHg2E80aP0E4QIe6HgmyYT/0BQiCaLUaAufA0v2KwNvCCx6P
 LKrlUVu9bjM2j+8sXxkhgogcSNJ3PHT7xj2W7ZnyHyewCOxK+OrV97J6D+XQ4skrJ8
 w+vT1wWs9eomnI2JXrNDduNqE3/I3Ze/ekZABMejoPBlrM7wjWiS50JTQJhn3BeExM
 sMcgiFZYHjVPg/7AsEGS0JSVJvvRHcj4pd/A/1Bl2XQkAq8gjG5AzTz9AgLGYBAR5B
 CQGPipbexBQSQ==
Message-ID: <ac031bfd-efcc-4b75-b78e-74f80e7ee509@kernel.org>
Date: Mon, 3 Nov 2025 10:51:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20251029115413.1085987-1-chao@kernel.org>
 <20251101152055.35zyuql6li2zzny7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20251101152055.35zyuql6li2zzny7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Zorro, On 11/1/25 23:23, Zorro Lang wrote: > On Wed, Oct 29, 
 2025 at 07:54:13PM +0800, Chao Yu wrote: >> After commit 5c1768b67250 ("f2fs:
 fix to do sanity check correctly on >> i_inline_xattr_size"), f2fs s [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFkfh-0001K7-E4
Subject: Re: [f2fs-dev] [PATCH] f2fs/023: test sanity check condition w/
 error injection
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

Zorro,

On 11/1/25 23:23, Zorro Lang wrote:
> On Wed, Oct 29, 2025 at 07:54:13PM +0800, Chao Yu wrote:
>> After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on
>> i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
>> correctly, let's add this regression testcase to check that.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
> 
> Hi Chao,
> 
> Thanks for new test case for f2fs. Some review points as below :)
> 
>>  tests/f2fs/023     | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/023.out |  2 ++
>>  2 files changed, 46 insertions(+)
>>  create mode 100755 tests/f2fs/023
>>  create mode 100644 tests/f2fs/023.out
>>
>> diff --git a/tests/f2fs/023 b/tests/f2fs/023
>> new file mode 100755
>> index 00000000..d1b7df32
>> --- /dev/null
>> +++ b/tests/f2fs/023
>> @@ -0,0 +1,44 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu <chao@kernel.org>
>> +#
>> +# FS QA Test No. f2fs/023
>> +#
>> +# This testcase tries to inject fault into inode.i_inline_xattr_size,
>> +# and check whether sanity check of f2fs can handle fault correctly.
>> +#
>> +
>> +. ./common/preamble
>> +_begin_fstest auto quick rw
>> +
>> +_fixed_by_kernel_commit 5c1768b67250 \
>> +        "f2fs: fix to do sanity check correctly on i_inline_xattr_size"
>> +
>> +_require_scratch_nocheck
>> +_require_inject_f2fs_command node i_inline
>> +_require_inject_f2fs_command node i_inline_xattr_size
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +# remove all mkfs options to avoid layout change of on-disk inode
>> +export MKFS_OPTIONS=""
>> +
>> +_scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full
> 
> As you use specific mkfs options, so better to _fail "..." if mkfs fails.
> 
>> +_scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
>> +touch $testfile
>> +_scratch_unmount
>> +
>> +# inject .i_inline field: clear F2FS_EXTRA_ATTR bit
>> +$F2FS_INJECT_PROG --node --mb i_inline --nid 4 --val 0x1 $SCRATCH_DEV \
>> +		>>$seqres.full || _fail "failed to inject i_inline"
>> +
>> +# inject .i_inline_xattr_size field from 512 to 2048
>> +$F2FS_INJECT_PROG --node --mb i_inline_xattr_size --nid 4 --val 2048 $SCRATCH_DEV \
>> +		>>$seqres.full || _fail "failed to inject i_inline_xattr_size"
> 
> I found my system doesn't support i_inline_xattr_size,
> 
>   # inject.f2fs -V
>  inject.f2fs 1.16.0 (2025-08-12)
> 
> I tried to removed above "_require_inject_f2fs_command node i_inline_xattr_size",
> but I found this test didn't exit from above _fail. The .full file got:
> 
>   [inject_inode:833] unknown or unsupported member "i_inline_xattr_size"
> 
> So are you sure the $F2FS_INJECT_PROG return error if "failed to inject i_inline_xattr_size" :)

Oops, I found that inject.f2fs missed to return correct value for error case,
let me fix this.

In order to keep compatibility for old inject.f2fs tool, let me check output
instead of return value from inject.f2fs.

Let me know if you have any other concern.

> 
>> +
>> +_scratch_mount
>> +
>> +getfattr -n user.test "$testfile" 2>&1 | awk -F ': ' '/Structure needs cleaning/ { print $NF }'
> 
> As you need "user" attribute, so you need "_require_attrs" (. ./common/attr), also
> the test group should have "attr".
> 
> If you don't need _getfattr, please use $GETFATTR_PROG at least.
> 
> And how about replace the "awk" with "_filter_scratch" (. ./common/filter)

Thanks for all your comments, will fix them all in v2. :)

Thankss,

> 
> Thanks,
> Zorro
> 
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/023.out b/tests/f2fs/023.out
>> new file mode 100644
>> index 00000000..7f16f33f
>> --- /dev/null
>> +++ b/tests/f2fs/023.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 023
>> +Structure needs cleaning
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

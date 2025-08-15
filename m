Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9FB27A80
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 10:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR5nCvHDWA60JY2ptkPHbA3B/6Fe7qFFMWWxrMI2Mjs=; b=KVLNG7SIU6uQWHTjXK5i38n+lb
	7MG9mFvMy9NAbAZfVguS/V9jgPuRqv89SCePX9uvJcCfssK5SXQ8oxdB4zlh99yJnTwCIQ/t15g7F
	0UW+9rgXwc2rNHQCKDu7ZwbvxNbQg6hJPIb1zXp1a+sMvWAAkcAwRK/MuKS4QCLA2ycI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umpOO-0005FI-1j;
	Fri, 15 Aug 2025 08:02:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umpOM-0005FB-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgVTCOQv5MQBuMoojY7WP2Wvds4jJp95n2Bn5QmuhMg=; b=C8O5hbRvsC4p5LPMnMmZYpLthy
 ADLhHnoGwez0/UNkTpkKfZErMlt64zCjYCADGgMHKHNGUu0PA1f0YVX52jDvOfD18N5BdgQPiHzQT
 JxD67qbIHbN5sidFQcOPRRmX4fyEydTaua7NBpHjTYbbIp1XzYRYzFEmy1+DAerH0G7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZgVTCOQv5MQBuMoojY7WP2Wvds4jJp95n2Bn5QmuhMg=; b=DZghA7fmfX2hbjGwsFXZDAfprb
 dZP0uQjTiRsKGZR3hKjJRG8YSdpe7gp7spWiExasnrcF9rwP+0GLsg9Ov+1mkHHGuEPO0InDzU0a0
 Jxb2DqaYtcCjTjbwHk0vxHfNGj1y467K++v/9IGsnRDQPR/H8mzVqdR4As6aZw+yxSjk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umpOM-0005dZ-BY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB9F85C39D4;
 Fri, 15 Aug 2025 08:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88187C4CEEB;
 Fri, 15 Aug 2025 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755244935;
 bh=UqMlmB6aIlDbiFKHI3lMYWxu0bnYqjVX62W5hnkci3M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Is2lKH6rISoJW5rHQ3qyMjwO+boP8zmQwf5O66nHIuxwy9fHzjoHKm2Gs460xCwaQ
 iBCXvmgXqauAWcx+AqiXMTL2RHULBulqRcdYvWIg6nnHYk3os82XVqmoY9pkO28U5S
 LfTSNe/XlSpz4o81a7aoE1B3jxMTBSHHH/CqPTjZQfDE2dezKb5Ov3tt3DfqFIdzEy
 +r2lUwyqQ4htEj20WBW+l8rPC/EzOXXeMXo5eZAJONDQgTf7KA7UFh9QvI/lOPPm33
 Ig8xZw8raE4e3PT7GEYDT7aOwood21FnGFCvuYLHfQqJpry3cundVc0KTWdw6LUpMK
 LQREPeZO7goRA==
Message-ID: <40587d4a-44a2-4d82-9f9f-2934c52aba87@kernel.org>
Date: Fri, 15 Aug 2025 16:02:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
 <20250814090712.2119455-3-chao@kernel.org>
 <20250814211838.64o3q3jurbxvwp3a@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250814211838.64o3q3jurbxvwp3a@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/15/25 05:18, Zorro Lang wrote: > On Thu, Aug 14, 2025
 at 05:07:12PM +0800, Chao Yu wrote: >> This is a regression test: >> 1. create
 directory >> 2. add a new xattr entry to create xattr node >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: user.abc]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umpOM-0005dZ-BY
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs/020: do sanity check on
 i_xattr_nid
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

On 8/15/25 05:18, Zorro Lang wrote:
> On Thu, Aug 14, 2025 at 05:07:12PM +0800, Chao Yu wrote:
>> This is a regression test:
>> 1. create directory
>> 2. add a new xattr entry to create xattr node
>> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
>> 4. check whether f2fs kernel module will detect and report such
>>    corruption in the file
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v3:
>> - use _require_scratch_nocheck instead of _require_scratch
>> - add missing _require_attrs user
>> - add comments for why exporting MKFS_OPTIONS=""
>>  tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/020.out |  2 ++
>>  2 files changed, 53 insertions(+)
>>  create mode 100755 tests/f2fs/020
>>  create mode 100644 tests/f2fs/020.out
>>
>> diff --git a/tests/f2fs/020 b/tests/f2fs/020
>> new file mode 100755
>> index 00000000..7ce1f92f
>> --- /dev/null
>> +++ b/tests/f2fs/020
>> @@ -0,0 +1,51 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/020
>> +#
>> +# This is a regression test:
>> +# 1. create directory
>> +# 2. add a new xattr entry to create xattr node
>> +# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
>> +# 4. check whether f2fs kernel module will detect and report such
>> +#    corruption in the file
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick rw
>> +
>> +. ./common/attr
>> +
>> +_fixed_by_kernel_commit 061cf3a84bde \
>> +	"f2fs: fix to do sanity check on ino and xnid"
>> +
>> +_require_scratch_nocheck
>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_attrs user
>> +
>> +# remove all mkfs options to avoid layout change of on-disk inode
>> +export MKFS_OPTIONS=""
>> +
>> +testdir=$SCRATCH_MNT/testdir
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount "-o user_xattr,noinline_xattr"
>> +
>> +mkdir $testdir
>> +# add a new xattr entry to create xattr node
>> +$SETFATTR_PROG -n user.abc -v 123 $testdir
>> +
>> +_scratch_unmount
>> +
>> +# inject i_xattr_nid w/ nid of inode node
>> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full

Zorro, I missed one thing, this testcase relies on a f2fs-tools patch, please apply
this before running the testcase.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=2174461cdd0a22edc5e7d172605bff4740582438

Do I need to create a _require_* function for f2fs to verify whether f2fs-tools
support the required feature or not?

>> +
>> +_scratch_mount

Oh, I may missed to add "-o acl,user_xattr" here.

>> +# may potentially trigger a deadlock w/ double inode_lock on parent's inode
>> +mkdir $testdir/dir >> $seqres.full 2>&1
>> +_scratch_unmount
> 
> Can you provide a test result to prove this test case trigger a failure
> on general kernel (not debug kernel). If it can, then this version is good
> to me :)

Well, expectation is it will hang kernel, so that the f2fs/020 will stop here
once we encounter the issue.

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
>> diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
>> new file mode 100644
>> index 00000000..20d7944e
>> --- /dev/null
>> +++ b/tests/f2fs/020.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 020
>> +Silence is golden
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDECBA697B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 08:48:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCZcsE0lf/aDWeE9h/AaI9L3H4ArvWMyCdbafRs6QwE=; b=hzxtYodyDRM1dKH3edID5DplA7
	1ezBeeFTZ81Ode656hRF/re7qlir4LWFAUJu6rYiSAolqMPNOTJahLFsHktNkgxmgi981RSjRYJ57
	9IWmDNdN1yBd5W3VycctTDJpBdbMu9C2GBElGtiN0fajOv75XlfI8dpOMvU9WubMe/Yk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2lD5-0001YS-Eq;
	Sun, 28 Sep 2025 06:48:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v2lD4-0001YM-5b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 06:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ujA/csE9Fhk8r4x92PGSHpmxKqPDGIZdSK7x9v9bauQ=; b=jHoBEZljEy6CKOnJe7t0RBl86S
 DDJ8nzH4BpEJ4rBL5ewCWsxRVR3E1JmbmepB1RZkBqezFHdlwJbqpWaeKeAhUKIfDP+HQ3U+eEKJK
 Mz8JR0R/pUQKk5iaRzAEffbRPat/TS5mxLB7hZ/tcXiI1n4WRB2SuTD5SE4v9GhnyOoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ujA/csE9Fhk8r4x92PGSHpmxKqPDGIZdSK7x9v9bauQ=; b=NTYEGkqMMN+x9WVwKeG0WHPNNP
 KvYJsSg7YIOmsyxcqUrOgrEC9bMN7qJV0XmWoYoai77g6lYL7PM8gmBtZfqc1bvf0nfSInzChmnKR
 ApIyWxhSOo57wYQWwHT6k43HHWXNUv5kadbM3sMNV0lCM1dm7k0YnTCDeeoRjqq8R5BQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2lD3-0005t4-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 06:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CB298601FF;
 Sun, 28 Sep 2025 06:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63054C4CEF0;
 Sun, 28 Sep 2025 06:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759042106;
 bh=ZPHK11UTbeoEs3cjkCK1x1gPX6PKfNqW0+dJBxaM8P0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uxvlmK4Ogk8+LMpzkXhbK34ptqa/XzxjivU1y3xalsUJrz1NMM1qCK52Wal2dBMFa
 3qekicLMrdu+/0EwkPxEdYSku9cUOt5Nw+j6KRXM12hZzZ1Lpo+hD952dbt0YlaRJK
 J76ninDxeEBoa+xxWSF+EXsm2nTKO7/3NVaTLX41pDq6yuBFV4xgG52cUw8lGCzvy3
 dREK58GWCtulmA2u9XOtQow3073Wyh/NnSgL0G7+blFd3YyJ7MFSyHtoGVm+T8Dvsi
 cGzW6OAPhMmgH9ZKflLjhanNr43nDtdAsjRpRHsguQoba7cEz9wt0oG478l1c6iado
 F5d918FLzUpvg==
Message-ID: <802f7ad9-11e8-4b91-81b5-7579b7e8a255@kernel.org>
Date: Sun, 28 Sep 2025 14:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250901020331.2171502-1-chao@kernel.org>
 <20250901020331.2171502-2-chao@kernel.org>
 <20250926192254.djrwx55itz422yft@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250926192254.djrwx55itz422yft@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/27/2025 3:22 AM, Zorro Lang wrote: > On Mon, Sep 01,
 2025 at 10:03:31AM +0800, Chao Yu wrote: >> This is a regression test: >>
 1. create foo & bar >> 2. write 8M data to foo >> 3. use inject.f2fs [...]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2lD3-0005t4-J2
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/022: do sanity check on footer of
 non inode dnode
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

On 9/27/2025 3:22 AM, Zorro Lang wrote:
> On Mon, Sep 01, 2025 at 10:03:31AM +0800, Chao Yu wrote:
>> This is a regression test:
>> 1. create foo & bar
>> 2. write 8M data to foo
>> 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
>> 4. fpunch in foo w/ specified range
>>
>> If we haven't applied kernel patch ("f2fs: fix to do sanity check on
>> node footer for non inode dnode"), f2fs may missed to do sanity check
>> on corrupted dnode, result in panic in step 4).
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/022     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/022.out |  2 ++
>>   2 files changed, 54 insertions(+)
>>   create mode 100755 tests/f2fs/022
>>   create mode 100644 tests/f2fs/022.out
>>
>> diff --git a/tests/f2fs/022 b/tests/f2fs/022
>> new file mode 100755
>> index 00000000..a5e19a71
>> --- /dev/null
>> +++ b/tests/f2fs/022
>> @@ -0,0 +1,52 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/022
>> +#
>> +# This is a regression test:
>> +# 1. create foo & bar
>> +# 2. write 8M data to foo
>> +# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
>> +# 4. fpunch in foo w/ specified range
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick rw
>> +
>> +. ./common/attr
>> +
>> +_fixed_by_kernel_commit xxxxxxxxxxxx \
>> +	"f2fs: fix to do sanity check on node footer for non inode dnode"
>> +
>> +_require_scratch_nocheck
>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_xfs_io_command "fpunch"
>> +_require_kernel_config CONFIG_F2FS_CHECK_FS
> 
> Looks like the CONFIG_F2FS_CHECK_FS is a necessary condition to reproduce
> that bug, right? I'm wondering is there a better way to check if CONFIG_F2FS_CHECK_FS
> is enabled, likes reading someone file in /sys or what ever else? Checking kernel config

No, I don't see any sysfs entry for checing if CONFIG_F2FS_CHECK_FS is
enabled.

I checked the testcase w/ image which has CONFIG_F2FS_CHECK_FS=off, the
testcase falls into a deadloop inside kernel, so it's fine to get rid of
the CONFIG_F2FS_CHECK_FS requirement? Thoughts?

Thanks,

> isn't always a recommended way, except no better idea :)
> 
>> +
>> +# remove all mkfs options to avoid layout change of on-disk inode
>> +export MKFS_OPTIONS=""
>> +
>> +foo_path=$SCRATCH_MNT/foo
>> +bar_path=$SCRATCH_MNT/bar
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount
>> +
>> +touch $foo_path
>> +touch $bar_path
>> +$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
>> +sync
>> +foo_ino=`stat -c '%i' $foo_path`
>> +bar_ino=`stat -c '%i' $bar_path`
>> +_scratch_unmount
>> +
>> +# inject foo inode to replace i_nid[0] w/ to bar ino
>> +$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
>> +
>> +_scratch_mount
>> +# expect to trigger panic
>> +$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
>> +_scratch_unmount
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
>> new file mode 100644
>> index 00000000..5307e3d7
>> --- /dev/null
>> +++ b/tests/f2fs/022.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 022
>> +fallocate: Structure needs cleaning
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

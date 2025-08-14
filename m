Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A7B25E1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 09:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDI0b5jviANcW6KLOjKuU8kx7U2B52BFJybZYToJD74=; b=lQyaEzx3yLPnbKkXt51UwzmYTc
	UDedphdbW+HCl1DTybo1NN63BtpAPI5UhjOVN5xXTzppPoC8W1HDz8giWJwXxVAbFtRhWr7knAlnL
	X0lOT+DZ7OHMLdvUM0Gnpx7aE9S+3M9yFYAk+fAuwCA5dMHaZItAwogD58r1QOVPLQlw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umSnn-0001vM-UK;
	Thu, 14 Aug 2025 07:55:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umSnl-0001vE-RG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 07:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1U6xrmAzlTkYUEFZcY3gQp7doti0g1rjuy/RqRrB0k=; b=bCHwcQBxyL5R5v+ACZq+9CtUXl
 UIDV93JxqmMG5HrQE0oZPg3eTgO2zHZTedlqvcTyroSgN+Ql7h48MmpP6r5mNVuGNdAQuKhXrf/wJ
 S/ppASG2Am4LCeKjj9vwb++o1+Q/yj96TazcnnjBmkbydAhT9Zmwjs/Jkl01YyTIwz+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1U6xrmAzlTkYUEFZcY3gQp7doti0g1rjuy/RqRrB0k=; b=lVjOCijRQokwssP4Au3rL3qjPk
 L7gEXGNRkHFIhbWlrV+3/ZYcsHYVIuULgZT3G+fZ8drIKT2xOxaDFexauNW3HQlIL7H+Ex6uGcStF
 htHRlnhDe2rsw9TbMCSVAP7oG0QuU8cFGhuNNxeFm8B2KEYNm94t1lq6OOsyjjwD+hb0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umSnl-00048f-A0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 07:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1C556020A;
 Thu, 14 Aug 2025 07:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F0AC4CEEF;
 Thu, 14 Aug 2025 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755158103;
 bh=+R5ii5QtDku8/p59rjrXRuQgAiYtx7BSX6EsEoxOyEs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FhKXVrD8HjRcyGyELP+W5eZDAHWFzYF4Jciyo4mZ1FYtoSuLzO7geuFPAXwoHvh9f
 g9TDKMaGjJt7gCk0ESMNNGoAmPwTGZmQMovTldCp5AERzC9sYVGNuprE9k+dVcJEiQ
 mn4KvJqY3OaZLF6IMkaDcKRAOgHW6efIpCm9MfcJ6asD+XODWc2uNxBVJ8ysp6CjXS
 3MO+DNrbWxNzlg90vAChnWgmFWOV/UY4zDQFWTXDflj7qocgBkEkS8lup6TMvl3VUd
 utjpOYa/KANxO3x5o1d2zXOHBjQhdw38jvyHhnHszpP1xQ3oPZ7sfa+4Jf585xUesh
 u7a+8eRVaktHQ==
Message-ID: <580b6314-4c79-404c-b8cc-c3d416bc09e8@kernel.org>
Date: Thu, 14 Aug 2025 15:54:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250811094415.1053545-3-chao@kernel.org>
 <20250813153407.b2ldb3u3zuw4ckbs@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250813153407.b2ldb3u3zuw4ckbs@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/13/25 23:34, Zorro Lang wrote: > On Mon, Aug 11, 2025
 at 05:44:15PM +0800, Chao Yu wrote: >> This is a regression test: >> 1. create
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umSnl-00048f-A0
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs/020: do sanity check on i_xattr_nid
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

On 8/13/25 23:34, Zorro Lang wrote:
> On Mon, Aug 11, 2025 at 05:44:15PM +0800, Chao Yu wrote:
>> This is a regression test:
>> 1. create directory
>> 2. add a new xattr entry to create xattr node
>> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
>> 4. check whether f2fs kernel module will detect and report such
>>    corruption in the file
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  tests/f2fs/020     | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/020.out |  2 ++
>>  2 files changed, 52 insertions(+)
>>  create mode 100755 tests/f2fs/020
>>  create mode 100644 tests/f2fs/020.out
>>
>> diff --git a/tests/f2fs/020 b/tests/f2fs/020
>> new file mode 100755
>> index 00000000..a6a08c8f
>> --- /dev/null
>> +++ b/tests/f2fs/020
>> @@ -0,0 +1,50 @@
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
>> +_cleanup()
>> +{
>> +	_scratch_mkfs >> $seqres.full
>> +}
>> +
>> +_fixed_by_kernel_commit 061cf3a84bde \
>> +	"f2fs: fix to do sanity check on ino and xnid"
>> +
>> +export MKFS_OPTIONS=""
>> +_require_scratch
> 
> Same review points with patch 2/3, 
> 
>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +
>> +testdir=$SCRATCH_MNT/testdir
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount "-o user_xattr,noinline_xattr"
>> +
>> +mkdir $testdir
>> +# add a new xattr entry to create xattr node
>> +setfattr -n user.abc -v 123 $testdir
> 
> You can call `_require_attrs user` at first, then use "$SETFATTR_PROG"

Okay, will update them in v2.

> 
>> +
>> +_scratch_unmount
>> +
>> +# inject i_xattr_nid w/ nid of inode node
>> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
>> +
>> +_scratch_mount
>> +mkdir $testdir/dir >> $seqres.full 2>&1
> 
> May I ask what kind of failure will this case hit, if there's the bug?

Bug like syzbot reported, you can check the details in below commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=061cf3a84bde

Thanks,

> 
> Thanks,
> Zorro
> 
>> +_scratch_unmount
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

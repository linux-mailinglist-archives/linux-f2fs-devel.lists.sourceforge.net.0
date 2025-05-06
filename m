Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F1EAAB03C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 05:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvikKywyeK1tXb/Yuu3qWWyL0KgkQkVs85mVYv/f0F4=; b=J1UD0ymiFLE8SzjnFOFe5zhWeQ
	PgIhR2SxrMj0v9DmXthZH7lUZ/trCneuDMSD8OEm8T7TFNEZTcLJCmyVLoRUumO9xiHCwyUn/w1Co
	ncAs1KxI7sR1NsP0Ap9Bdj7fFqfdkz9A83F7w1PamakprxDClJog6C+fpfsPhjkTLFoc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uC94R-00042m-Qc;
	Tue, 06 May 2025 03:34:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uC94P-00042e-IA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 03:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcLJP4xCSCMQtr4bBsm12oYM+Fm+UOciyv9mvbIRih0=; b=LMNvR7dUeMi/QHTtitvvcTziLJ
 irz8Note2sJugEWA2t0YLQvQmDs6qiHA9Am5fAh18A00NCNgLXoS8YkuOx7W4aox3SmM1lkVANICc
 G3M+Oso1x+DbvECfYAAY1sLzaZnN2rAUeHgx93Ac33pgMDBDDoDfAXQ4Yf7ofGt9cjf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcLJP4xCSCMQtr4bBsm12oYM+Fm+UOciyv9mvbIRih0=; b=egLIaLa4Vtg6wc4YCuVJeRz7FE
 cfTwiOW3rIcP4oLTqP4WSoUIv0wm8FruwQKozdCcqq8S1pFqDLz3G7MJgt1hVnymwUZoelTNa7/13
 wLweMIUp81JST5m7+RwG8sVNyKaeNi9oVcb8l6pTDSl+9rOfQeauZmDZemguoaInB7nE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uC949-0004G7-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 03:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA281629CF;
 Tue,  6 May 2025 03:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAB1C4CEE4;
 Tue,  6 May 2025 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746502426;
 bh=C1iFfoOl+L86fs3Nd1p0CEe6atefIAIDAYQUzU53RmI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NZl/IFp5mCjytVAMhH4LJHfm2h7dAE6CLUYZdj2npYsHKYLyHbuaDXtMZf5+GBtE7
 ZriVzqwtgxu0Cr+vojwK9dUmfNOz5oiKbCcgZ/hgVAO7F9UB4P83cK7CSoO1PYNrs8
 GIru8hWeDsYhueryMcPZp7L6WrseKC1x9nForoj8l/FuaeGuaOr3mifhOVkr1+cJAp
 he7k2GBJ481vE4IR+w9hus1HgGHDDgkMDljyx5Z8YwpCvEga/N5msfuP29AprLXrxS
 I/u/etfW/gYhzP25WRfCkzHogd5aibcIcrPNIAj9jcFU8+LCJ6hXLG5YiZmehxcmYJ
 1/UfuEVctuL/Q==
Message-ID: <98c05eae-7cbb-49a8-8c0e-6f328a87ebf8@kernel.org>
Date: Tue, 6 May 2025 11:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Disseldorp <ddiss@suse.de>
References: <20250430024731.2722027-1-chao@kernel.org>
 <20250502182729.2f6ec951.ddiss@suse.de>
Content-Language: en-US
In-Reply-To: <20250502182729.2f6ec951.ddiss@suse.de>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi David, On 2025/5/2 16:31, David Disseldorp wrote: > Hi
 Chao Yu, > > On Wed, 30 Apr 2025 10:47:31 +0800, Chao Yu wrote: > >> This
 is a regression testcase to check whether we will handle database >> inode
 dir [...] 
 Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uC949-0004G7-Qk
Subject: Re: [f2fs-dev] [PATCH] f2fs/013: test to check potential corruption
 on atomic_write file
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
Cc: Daeho Jeong <daehojeong@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Zorro Lang <zlang@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi David,

On 2025/5/2 16:31, David Disseldorp wrote:
> Hi Chao Yu,
> 
> On Wed, 30 Apr 2025 10:47:31 +0800, Chao Yu wrote:
> 
>> This is a regression testcase to check whether we will handle database
>> inode dirty status correctly:
>> 1. make sure disk quota is enabled
>> 2. create a regular file, and write data into the file
>> 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
>> 4. write transaction data to the file
>> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> 6. meanwhile loop call fsync in parallel
>> Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
>> file"), database file may become corrupted after atomic write while
>> there is concurrent dirty inode flush in background.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   tests/f2fs/013     | 73 ++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/f2fs/013.out |  2 ++
>>   2 files changed, 75 insertions(+)
>>   create mode 100755 tests/f2fs/013
>>   create mode 100644 tests/f2fs/013.out
>>
>> diff --git a/tests/f2fs/013 b/tests/f2fs/013
>> new file mode 100755
>> index 00000000..3db8448c
>> --- /dev/null
>> +++ b/tests/f2fs/013
>> @@ -0,0 +1,73 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/013
>> +#
>> +# This is a regression testcase to check whether we will handle database
>> +# inode dirty status correctly:
>> +# 1. make sure disk quota is enabled
> 
> Where is the check that disk quota is enabled?

Oh, I tested this testcase, it passed no matter disk quota on or off, let
me remove this description.

> 
>> +# 2. create a regular file, and write data into the file
>> +# 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
>> +# 4. write transaction data to the file
>> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> +# 6. meanwhile loop call fsync in parallel
>> +# Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
>> +# file"), database file may become corrupted after atomic write while
>> +# there is concurrent dirty inode flush in background.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +_cleanup()
>> +{
>> +	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
>> +	wait
>> +	cd /
>> +	rm -r -f $tmp.*
>> +}
>> +
>> +_fixed_by_kernel_commit f098aeba04c9 \
>> +	"f2fs: fix to avoid atomicity corruption of atomic file"
>> +
>> +_require_scratch
>> +
>> +_scratch_mkfs >> $seqres.full
>> +# note that it relis on FAULT_TIMEOUT fault injection support in f2fs
>> +_scratch_mount "-o fault_injection=1,fault_type=4194304" >> $seqres.full
> 
> This requires CONFIG_F2FS_FAULT_INJECTION=y, although now I see that
> parse_options() just ignores them and the test still passes fine with
> CONFIG_F2FS_FAULT_INJECTION unset. Does it make sense to run without
> FAULT_TIMEOUT injection? It'd likely make sense to just _notrun if fault
> injection is unavailable.

Yes, the testcase relies on CONFIG_F2FS_FAULT_INJECTION, let me add a
requirement condition for that.

If FAULT_TIMEOUT injection is not supported, mount() will fail.

> 
>> +dbfile=$SCRATCH_MNT/file.db
>> +
>> +# initialize database file
>> +$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $dbfile >> $seqres.full
>> +
>> +# sync filesystem to clear dirty inode
>> +sync
>> +
>> +# start atomic_write on src.db database file and commit transaction
>> +$F2FS_IO_PROG write 1 0 2 zero atomic_commit $dbfile >> $seqres.full &
>> +atomic_write_pid=$!
>> +
>> +# call fsync to flush dirty inode of database file in parallel
>> +for ((j=0;j<1000;j++)) do
>> +	$F2FS_IO_PROG fsync $dbfile >> $seqres.full
>> +done
>> +
>> +wait $atomic_write_pid
>> +unset atomic_write_pid
>> +
>> +# flush dirty data and drop cache
>> +sync
>> +echo 3 > /proc/sys/vm/drop_caches
>> +
>> +newsize=`stat $dbfile -c %s`
>> +if [ "$newsize" != "8192" ]; then
>> +	_fail "filesize is inconsistent:"$newsize
>> +fi
> 
> nit: I think it'd be simpler to do:
>    stat $dbfile -c %s
> ...and just put the 8192 in the golden output.

Looks fine to me.

Thanks for the review, let me revise all in v2.

Thanks,

> 
>> +rm $dbfile
>> +sync
>> +
>> +echo "Silence is golden"
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/013.out b/tests/f2fs/013.out
>> new file mode 100644
>> index 00000000..3e66423b
>> --- /dev/null
>> +++ b/tests/f2fs/013.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 013
>> +Silence is golden
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

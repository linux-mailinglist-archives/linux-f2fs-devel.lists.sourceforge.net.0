Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF4EA59089
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 10:59:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trZvA-0001Mx-6B;
	Mon, 10 Mar 2025 09:59:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trZv8-0001Ml-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 09:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9bqNjTWpmm/+yHx6fu/OJr3SVqDhfs0yYXFnUvqytSY=; b=YBunsNPY9ylAZF+hoFqhFdOAFO
 qZtkcIrbHCLQPpIwFec0v+RUafouFmbckkoWF8jMWPEB4rVUp75Hb9XsUKGZKG+VKLFRYghwzYTL+
 DizB5tFGFPSs7nGhY555tUvqrhb10e4g2cFUukw3YMf6GjmgvGJ8EzaXdfFPyKCe3P+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bqNjTWpmm/+yHx6fu/OJr3SVqDhfs0yYXFnUvqytSY=; b=LXFkClnig5ZI8vAdSh9ZAb7V+p
 WV2tI0rgEwVaHIpDs64XacK3pDHNjFaLelt3HBecTh1IkRQ1WCjmbwkfBhoImVnnJul5+rS0kupEX
 Z7g5Oz/FyRvgd+cbsBVN5G7AuzFWjz4jDKrMsfP65TUYf4jVvPOv9Ns03VMDT4ZTydrw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trZv3-0007sq-Eq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 09:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89D70A44E31;
 Mon, 10 Mar 2025 09:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0C7C4CEE5;
 Mon, 10 Mar 2025 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741600767;
 bh=Z3q0VNDQQJqiKLtoo0JN0jgPsoXgNcXUyw1rKUaKMO4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YmnZSVQA9+m0LIV4kJ4RJlWP199iAdJ29LWn4mMZU80vyrh4dBTs+NwYLRg84IdT9
 J/SFMLp2IQ7/TW7ikW2fS8wK8dMHZQxUvq/gTM4uN6AKo+HOUpF/lDqAvWPdGyuZga
 ypLQibmyQYkJp+WlKQiF7GAMXRae1yM8vV71wBiu4FK9l7Y3QY0wOiVGQMxfCyKmCR
 4uUtnQR1Wnz9fDm69rK3II3FWIsBy/c+m6hdU/yTPMaQCT1Tm2qoKIBGH9N2DOgwTM
 4/9fOU/VOqW0M/Y92hQNlCPDRCABondjuNLxPeZ0OYYffccnqfYCPkN24o8+tg4cdE
 NzZobEs+OaitA==
Message-ID: <c62943db-6169-462a-95a0-15fb2d5bc079@kernel.org>
Date: Mon, 10 Mar 2025 17:59:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
 <20250310080006.rkvoxu55fe3qlxmd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250310080006.rkvoxu55fe3qlxmd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/10/25 16:00, Zorro Lang wrote: > On Thu, Mar 06, 2025
 at 04:18:09PM +0800, Chao Yu wrote: >> This is a regression test to check
 whether fsck can handle corrupted >> nlinks correctly, it uses inje [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trZv3-0007sq-Eq
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs/009: detect and repair nlink
 corruption
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

On 3/10/25 16:00, Zorro Lang wrote:
> On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote:
>> This is a regression test to check whether fsck can handle corrupted
>> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>> and expects fsck.f2fs can detect such corruption and do the repair.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
> 
> Hi Chao,
> 
> I planned to merge patch 1~3 at first. But as you need to change this
> patch more, and might need to change other patches, so how about you
> send v2 with all this patchset. I'll wait your v2 :)
> 
> Some review points as below...
> 
>>  tests/f2fs/009     | 142 +++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/009.out |   2 +
>>  2 files changed, 144 insertions(+)
>>  create mode 100755 tests/f2fs/009
>>  create mode 100644 tests/f2fs/009.out
>>
>> diff --git a/tests/f2fs/009 b/tests/f2fs/009
>> new file mode 100755
>> index 00000000..8f6a3e11
>> --- /dev/null
>> +++ b/tests/f2fs/009
>> @@ -0,0 +1,142 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/009
>> +#
>> +# This is a regression test to check whether fsck can handle corrupted
>> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>> +# and expects fsck.f2fs can detect such corruption and do the repair.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +_require_scratch
>> +
>> +dir=$SCRATCH_MNT
>> +filename=$dir/foo
>> +hardlink=$dir/bar
>> +
>> +for ((i=0;i<14;i++)) do
>> +	echo "round: " $i >> $seqres.full
>> +
>> +	_scratch_mkfs "-f" >> $seqres.full
> 
> Can we give "-f" to _scratch_mkfs "f2fs" part? Likes:

Looks better,

> 
>   diff --git a/common/rc b/common/rc
>   index bf24da4eb..cafe2f3dd 100644
>   --- a/common/rc
>   +++ b/common/rc
>   @@ -993,7 +993,7 @@ _scratch_mkfs()
>                   mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
>                   ;;
>           f2fs)
>   -               mkfs_cmd="$MKFS_F2FS_PROG"
>   +               mkfs_cmd="$MKFS_F2FS_PROG -f"
>                   mkfs_filter="cat"
>                   ;;
> 
> 
> 
>> +	_scratch_mount >> $seqres.full
>> +
>> +	if [ $i == 0 ]; then
>> +		touch $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=0
>> +	elif [ $i == 1 ]; then
>> +		mkdir $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=1
>> +	elif [ $i == 2 ]; then
>> +		mknod $filename c 9 0
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=0
>> +	elif [ $i == 3 ]; then
>> +		mknod $filename b 8 0
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=0
>> +	elif [ $i == 4 ]; then
>> +		mkfifo $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=0
>> +	elif [ $i == 5 ]; then
>> +		socket -s $filename >> $seqres.full 2>&1 &
>> +		pid=$!
>> +		sleep 2
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		kill $pid >> $seqres.full 2>&1
>> +		nlink=0
>> +	elif [ $i == 6 ]; then
>> +		ln -s $dir/empty $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		nlink=0
>> +	elif [ $i == 7 ]; then
>> +		# orphan inode
>> +		touch $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
>> +		stat $filename >> $seqres.full
>> +		rm $filename
>> +		$F2FS_IO_PROG shutdown 1 $dir/ >> $seqres.full
>> +		sleep 6
>> +		nlink=1
>> +	elif [ $i == 8 ]; then
>> +		# hardlink on file
>> +		touch $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	elif [ $i == 9 ]; then
>> +		# hardlink on charactor
>> +		mknod $filename c 9 0
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	elif [ $i == 10 ]; then
>> +		# hardlink on blockdev
>> +		mknod $filename b 8 0
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	elif [ $i == 11 ]; then
>> +		# hardlink on pipe
>> +		mkfifo $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	elif [ $i == 12 ]; then
>> +		# hardlink on socket
>> +		socket -s $filename >> $seqres.full 2>&1 &
>> +		pid=$!
>> +		sleep 2
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		kill $pid >> $seqres.full 2>&1
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	elif [ $i == 13 ]; then
>> +		# hardlink on symlink
>> +		ln -s $dir/empty $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
>> +		ln $filename $hardlink
>> +		nlink=0
>> +	fi
>> +
>> +	if [ $i != 7 ]; then
>> +		stat $dir/* >> $seqres.full
>> +	fi
>> +	echo "ino:"$ino >> $seqres.full
>> +	echo "nlink:"$nlink >> $seqres.full
>> +
>> +	_scratch_unmount
>> +
>> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
>> +	if [ $? != 0 ]; then
>> +		exit
>> +	fi
>> +
>> +	export FSCK_OPTIONS="-f"
> 
> You've set below code in _repair_scratch_fs():
> 
>     f2fs)
>         fsck -t $FSTYP -f $SCRATCH_DEV
>         ;;
> 
> The FSCK_OPTIONS="-f" is useless.
> 
>> +	_repair_scratch_fs >> $seqres.full
>> +	if [ $? != 1 ]; then
> 
> What does $?=1 mean? Does $?=1 mean finding corruption and fixed, $?=0 mean no corruption?

That's correct.

> 
> If you want to detect there's a corruption, then fix it, then check if it's fixed. How about
> calling _check_scratch_fs at first to get the corruption error you expect, then call
> _repair_scratch_fs to fix it. Then call _check_scratch_fs to make sure the corruption is
> fixed?
> 
> Something likes (just a rough example)
> 
> _check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"

You mean this?

export FSCK_OPTIONS="--dry-run"
_check_scratch_fs >>$seqres.full 2>&1 || _fail "can't find corruption"

We need to export FSCK_OPTIONS w/ "--dry-run", otherwise _check_scratch_fs
will be stuck once it detects corruption.

> _repair_scratch_fs >> $seqres.full
> _check_scratch_fs
> 
>> +		_fail "fsck can not detect and repair zero nlink corruption "$i
>> +		exit
>> +	fi
>> +
>> +	export FSCK_OPTIONS=""
>> +	_check_scratch_fs >> $seqres.full
> 
> I think _check_scratch_fs outputs nothing if run passed, right?
> 
> _check_scratch_fs calls _check_generic_filesystem for f2fs, the FSCK_OPTIONS
> is "null" by default, so above FSCK_OPTIONS="" is useless too.
> 
>> +	if [ $? != 0 ]; then
>> +		_fail "fsck hasn't fixed nlink corruption "$i
>> +		exit
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
> 
> ">> $seqres.full" isn't necessary.

Will update according to you comments, thanks a lot.

Thanks,

> 
>> +	_scratch_unmount
>> +done
>> +
>> +echo "Silence is golden"
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
>> new file mode 100644
>> index 00000000..7e977155
>> --- /dev/null
>> +++ b/tests/f2fs/009.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 009
>> +Silence is golden
>> -- 
>> 2.48.1
>>
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

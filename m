Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CAA59019
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 10:46:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trZif-00081h-Ry;
	Mon, 10 Mar 2025 09:46:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trZid-00081b-Rn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 09:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyWzXqgbeXvrEYzKXx5ILvPf5YFSHn9ml4D0q4cC0sU=; b=NkbVMq0V13udNcC2jDGtGKatln
 x0W+ImhyPyRJhcncauIWuO2r13sYmieoL0C3qI4PMtIdaX2gUbrjGKBjdRdNa6tfsieLynlEQVY5E
 raGjybbzG72hUKJbFIixCl1rnCUscYIPodtwZhLmd3jj8TmWe3bXL0dl+nE27y2Xgwig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyWzXqgbeXvrEYzKXx5ILvPf5YFSHn9ml4D0q4cC0sU=; b=ICEJO//kcCz1GVMZ5RI8VOWmXm
 bIhdBWx2t5LkftZSUBb94UgqF62GON0cxoNFyLxojV6qr6LwQXC8Zloxs0r4zCd5e+mHmKsUT8vz0
 pARSlkF2ZheJ0d82xhwzDWzt2DkSTXNo+qH8NfyR9xuW26jf6yX7gnPfolYBAnJAge4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trZic-0005v0-D0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 09:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35CFE5C489D;
 Mon, 10 Mar 2025 09:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F1AC4CEE5;
 Mon, 10 Mar 2025 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741599996;
 bh=dcXEUFug6D8brVanUiIMLLCorna/mNPQSinIVrWWZ3o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=S0AsezGZvFLFVMuXi6YOnxMPdTOqib/FVoMehJOJjiISnZlJXzO/OsM/aatzd+0j3
 qfEXourI+9XeaH6/b+YIDP1J4Rqhtna5BBOB+AW0peSb0oNPOXAnEoA5ObB5LyPtcO
 U4WyKLFCkAew1Sdd8wnhKunrHY7b8EtzS0EgJd1cGBYpz4XxpKRrWfIky39zefZ/5s
 OnI7FqXVEKGrlShMb7jNdzsMJj1UKFYrlZcOm4uAB+y+aFiJhsN6GRqr8N0fwQZK1d
 NzPhtaROeL82P1c1J3wZ1htM6G5RFzIVb+RW5EeZ+2reiitjihAnE9gPeM7f1MU6yf
 Fv3Te8V+uD+Qg==
Message-ID: <16a90282-2245-4765-8d0e-a1bff48853a3@kernel.org>
Date: Mon, 10 Mar 2025 17:46:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Disseldorp <ddiss@suse.de>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
 <20250307150212.7cda01f2.ddiss@suse.de>
Content-Language: en-US
In-Reply-To: <20250307150212.7cda01f2.ddiss@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/7/25 12:02,
 David Disseldorp wrote: > Thanks for submitting
 the new test. It looks good aside from a few minor > things below... > >
 On Thu, 6 Mar 2025 16:18:09 +0800, Chao Yu wrote: > >> This is [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trZic-0005v0-D0
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

On 3/7/25 12:02, David Disseldorp wrote:
> Thanks for submitting the new test. It looks good aside from a few minor
> things below...
> 
> On Thu,  6 Mar 2025 16:18:09 +0800, Chao Yu wrote:
> 
>> This is a regression test to check whether fsck can handle corrupted
>> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>> and expects fsck.f2fs can detect such corruption and do the repair.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
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
> 
> You should probably check for F2FS_INJECT_PROG and skip if not present.
> Is it dependent on CONFIG_F2FS_FAULT_INJECTION? If so it'd be nice if

It isn't dependent on CONFIG_F2FS_FAULT_INJECTION.

> you could check for that too.
> 
> Flag the fix for the regression via e.g.:
> _fixed_by_git_commit f2fs-tools 958cd6e
> 
>> +
>> +dir=$SCRATCH_MNT
> 
> I think it'd be easier to follow if you dropped this alias and just used
> $SCRATCH_MNT directly.
> 
>> +filename=$dir/foo
>> +hardlink=$dir/bar
>> +
>> +for ((i=0;i<14;i++)) do
>> +	echo "round: " $i >> $seqres.full
>> +
>> +	_scratch_mkfs "-f" >> $seqres.full
>> +	_scratch_mount >> $seqres.full
>> +
>> +	if [ $i == 0 ]; then
>> +		touch $filename
>> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> 
> Use "stat -c '%i'" instead of piping into awk. Also, it looks like this
> is called in every round, so just move it after the elifs.
> 
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
> 
> xfstests failures are normally triggered via golden output mismatch
> instead of explicit status checks or _fail calls... Can you filter the
> inject / repair output so that it ends up in the golden output for
> comparison?

I tried to avoid filting inject/repair outputs and compare the output w/
golden output in 009.out, since I'm not sure whether the output will change
or not later in f2fs-tools...

Will fix all others according to your comments, thanks a lot for the comments.

Thanks,

> 
>> +	export FSCK_OPTIONS="-f"
>> +	_repair_scratch_fs >> $seqres.full
>> +	if [ $? != 1 ]; then
>> +		_fail "fsck can not detect and repair zero nlink corruption "$i
>> +		exit
>> +	fi
>> +
>> +	export FSCK_OPTIONS=""
>> +	_check_scratch_fs >> $seqres.full
>> +	if [ $? != 0 ]; then
>> +		_fail "fsck hasn't fixed nlink corruption "$i
>> +		exit
>> +	fi
>> +
>> +	_scratch_mount >> $seqres.full
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
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

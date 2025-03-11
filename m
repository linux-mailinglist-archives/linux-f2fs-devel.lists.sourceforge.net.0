Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E05EAA5BBEB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 10:21:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trvnH-0002Bw-Ih;
	Tue, 11 Mar 2025 09:21:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trvnF-0002Bn-DI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 09:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPTf1ZPD7hrDdhfmtwg7HPqehr02RJhyqfvHTpzxgIA=; b=Be/F0eN568/4N/7BA1/FTa7W9D
 2ATbiQf+etq3WkoQVU/0dRdH2IOs8asPmSGpteftftys8qCKTYIh0JaXKzSMyyQ9D9qfEY1myx9It
 kDylSe4Uww8fxRPvzp/AFb2uKaD9zZYkLSuxKubzVCxwtOS1eszxJ6goVtNs/jDgw0fA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fPTf1ZPD7hrDdhfmtwg7HPqehr02RJhyqfvHTpzxgIA=; b=W2puUCrgjFBUE3jujLbzH3fESE
 kCKu2KnVIbE2HICcdvcbHRnxnCkfSk5z/BCgD+lM2wKj788b/60aPWb4xrVaDrZGM8jBDnnLnGjRo
 LwyC7HbENpL1jkM+ofz2wYJd7xlDE/MQ2clu6hyqM0lBL0oEsxKNf5Y0zJEUrTejtOdA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trvn4-0001GR-0l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 09:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFDF55C54E4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 09:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333D5C4CEEB;
 Tue, 11 Mar 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741684840;
 bh=dmEKhV6jS4N11wpxYhxDJnfc4IQvC8nhhPDY72s6I2w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Tbla77GAjwiv4EBf/tpgtaZCEbOTdD2pycCT0mRHOGuKwN1EOqk2m6mV/U6lsGfdo
 TW4Y6CqpsrhSbInKYkifPxO4HvTYjkV5v83GUsfqJ4Rx/ru+YU4K59z/i4jIKhatQG
 bfqR5YZ10DcUTrz93e4ZRewJOr8e+lfYM+gjhF26ZbDyJ+j4wE0n+NPKfJGOalqvyq
 j36LhAzJJtJJwO0giyE/0WqB1obmJQXbEURWYPREjFTxOJOwWk1oYXYWnQ25RnD+VY
 rHejveH2IufJ9+zujikF5OTtxJ0opnBuMi3hlmeJ0fOSkbnjhK3fSSZmjVcNyjBAi/
 nr9OwmSiNBMjQ==
Message-ID: <6c64922e-523b-484f-98f5-5a795fe65000@kernel.org>
Date: Tue, 11 Mar 2025 17:20:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
References: <20250311080430.3696582-1-chao@kernel.org>
 <20250311080430.3696582-6-chao@kernel.org>
Content-Language: en-US
In-Reply-To: <20250311080430.3696582-6-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/11/25 16:04, Chao Yu wrote: > This is a regression test
 to check whether fsck can handle corrupted > nlinks correctly,
 it uses inject.f2fs
 to inject nlinks w/ wrong value, > and expects fsck.f2fs [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trvn4-0001GR-0l
Subject: Re: [f2fs-dev] [PATCH v3 6/6] f2fs/009: detect and repair nlink
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/11/25 16:04, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - check socket command
> - add _cleanup to kill & wait background thread
> - add commit title in _fixed_by_git_commit line
> - clean up codes
>  tests/f2fs/009     | 145 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  2 files changed, 147 insertions(+)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..4f8b2079
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,145 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/009
> +#
> +# This is a regression test to check whether fsck can handle corrupted
> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> +# and expects fsck.f2fs can detect such corruption and do the repair.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +if [ ! -x "$(type -P socket)" ]; then
> +	_notrun "Couldn't find socket"
> +fi
> +
> +_require_scratch
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_command "$F2FS_FSCK_PROG" fsck.f2fs

Forgot to remove this, let me fix this in v4 later.

Thanks,

> +
> +_fixed_by_git_commit f2fs-tools 958cd6e "fsck.f2fs: support to repair corrupted i_links"
> +
> +filename=$SCRATCH_MNT/foo
> +hardlink=$SCRATCH_MNT/bar
> +
> +_cleanup()
> +{
> +	if [ -n "$pid" ]; then
> +		kill $pid &> /dev/null
> +		wait
> +	fi
> +}
> +
> +for ((i=0;i<14;i++)) do
> +	echo "round: " $i >> $seqres.full
> +
> +	_scratch_mkfs >> $seqres.full
> +	_scratch_mount
> +
> +	if [ $i == 0 ]; then
> +		touch $filename
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 1 ]; then
> +		mkdir $filename
> +		ino=`stat -c '%i' $filename`
> +		nlink=1
> +	elif [ $i == 2 ]; then
> +		mknod $filename c 9 0
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 3 ]; then
> +		mknod $filename b 8 0
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 4 ]; then
> +		mkfifo $filename
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 5 ]; then
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat -c '%i' $filename`
> +		kill $pid >> $seqres.full 2>&1
> +		nlink=0
> +	elif [ $i == 6 ]; then
> +		ln -s $SCRATCH_MNT/empty $filename
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 7 ]; then
> +		# orphan inode
> +		touch $filename
> +		ino=`stat -c '%i' $filename`
> +		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
> +		stat $filename >> $seqres.full
> +		rm $filename
> +		$F2FS_IO_PROG shutdown 1 $SCRATCH_MNT/ >> $seqres.full
> +		sleep 6
> +		nlink=1
> +	elif [ $i == 8 ]; then
> +		# hardlink on file
> +		touch $filename
> +		ino=`stat -c '%i' $filename`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 9 ]; then
> +		# hardlink on charactor
> +		mknod $filename c 9 0
> +		ino=`stat -c '%i' $filename`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 10 ]; then
> +		# hardlink on blockdev
> +		mknod $filename b 8 0
> +		ino=`stat -c '%i' $filename`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 11 ]; then
> +		# hardlink on pipe
> +		mkfifo $filename
> +		ino=`stat -c '%i' $filename`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 12 ]; then
> +		# hardlink on socket
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat -c '%i' $filename`
> +		kill $pid >> $seqres.full 2>&1
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 13 ]; then
> +		# hardlink on symlink
> +		ln -s $SCRATCH_MNT/empty $filename
> +		ino=`stat -c '%i' $filename`
> +		ln $filename $hardlink
> +		nlink=0
> +	fi
> +
> +	if [ $i != 7 ]; then
> +		stat $SCRATCH_MNT/* >> $seqres.full
> +	fi
> +	echo "ino:"$ino >> $seqres.full
> +	echo "nlink:"$nlink >> $seqres.full
> +
> +	_scratch_unmount
> +
> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
> +		>> $seqres.full || _fail "fail to inject"
> +
> +	_check_scratch_fs >> $seqres.full 2>&1 && _fail "can't find corruption"
> +	_repair_scratch_fs >> $seqres.full
> +	_check_scratch_fs >> $seqres.full 2>&1 || _fail "fsck can't fix corruption"
> +
> +	_scratch_mount
> +	_scratch_unmount
> +done
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
> new file mode 100644
> index 00000000..7e977155
> --- /dev/null
> +++ b/tests/f2fs/009.out
> @@ -0,0 +1,2 @@
> +QA output created by 009
> +Silence is golden



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

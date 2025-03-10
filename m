Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDBAA58D77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 09:00:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trY3r-00028W-06;
	Mon, 10 Mar 2025 08:00:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trY3l-00028M-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 08:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ufi/jLKm9O7YJJFQwF7KJlWKXsd5gJyLe1sPin/xo2k=; b=AF5/ixleef7bQw6+lZigbwPTuD
 dGzkIT0UDhJj8IGRWmUoIPm7QQk/vJUso+PHtYc4S9FMLgYfGoyqE2YzF5Z2xt87shKSne7L/HNbm
 iHvl0YLZlkA+AKDLQSUIqT2uuUASCj57G3rixaVXw+vNEotri9XE6BnCPc1tLiCw5cRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ufi/jLKm9O7YJJFQwF7KJlWKXsd5gJyLe1sPin/xo2k=; b=RUWR97bR+26CML+sBFHXKHRQFC
 RtO0G4P/7EexfIYDYa4QsqfdzI+9nDoWKz9P4d2mbea6YUZ2+q9l8i/OxCyKGhQEqm9r8/WfPMEY8
 Io9euJIKZfjKXEp6Gb+bzyOBdbxZX9mXgYu2CmVxPaHUlKq6a8QzUMZzsVz7bXuiQLEY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trY3k-00056A-MW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 08:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741593613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ufi/jLKm9O7YJJFQwF7KJlWKXsd5gJyLe1sPin/xo2k=;
 b=cT56PKifYoA3CVgVTztOjEvtSUHWuDti//yr9866gM0fsty8FGf3tqLvlrH2d1mZ3KAQ3Z
 wQ8MimCCIyuk6qntO/FqhsB5t7JjcUYG5f7ziGI+zlUkeJR6BkUtNOBJwUPHZKyYMfPshy
 1m7T63usj/Qz4AIcF9LZ23jJVUWf6Jc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-7l-Y6BYyNtuZMrctGxn_CA-1; Mon, 10 Mar 2025 04:00:12 -0400
X-MC-Unique: 7l-Y6BYyNtuZMrctGxn_CA-1
X-Mimecast-MFC-AGG-ID: 7l-Y6BYyNtuZMrctGxn_CA_1741593611
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff82dd6de0so4227390a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 01:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741593611; x=1742198411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufi/jLKm9O7YJJFQwF7KJlWKXsd5gJyLe1sPin/xo2k=;
 b=KBxFGwFkVrcs2YMe7Jp06ynvef1wytiERabfADwdGf5XWc5ECBcjEs3fIiSVKsoAbB
 NqxY0xUCUtZnmT9LnnLrHCvkqknaYWfdvNX4i8NwOGvO2WFoHpVjI04zIO8Cw5zP1tTm
 8mhBucqDbyaL04y5XE7oqqnN2mkl7/2pHneb73uwBQPtIU4ND2DvoUiElxR7hYxmHMNy
 PSBlB9r2jcIF35+El3GvAGDxgTQM9F0O6Y/pyPkFl2RSkQrNQnQSFoA99Uq7hSbe6Hug
 5wx+1zKbjoY+5ipu41U1zM04Yorckj0lCFg0I4pcQ6kospy8EAiyDl8rKV/5Yc8rgOIf
 r+6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhfPI6Ojr2rOM7QZvt6szqNdSdLw9pc1ED/wIk5xtd9uIZqAQmLkOvLGWGvaHOHen/tQTgUuIcVMXLcn8OBdhB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwREld1kNuS7swGLvHDwRBf4AaVNz6J0wXM5D+T+w6jewQ2aGVZ
 NvUg4fvVDlKStU49FiRbgXlLaAq/2oKuccszO3Df2qiKtw8ynZklQFhLXfC0uwazIYrLkf2Owya
 T/2uWAfznKA8xfQYDeb9ASlcdh00p1/UuB2z1akON3ComATlZSGFJJlc9+cMY6ZBNBjS10nf08Y
 o=
X-Gm-Gg: ASbGncsS1lz8nBameRXeQOu+YsDo1c+dCxvyUXc83SX9S8jEgUzV+mAZ6RaswvPR4YD
 HW/Hm8DaaMwqCokCX87HNfrwmQ+x3nnMhbUSY1TE8kGz6IuAY5QBDLvKWPC/jK/0PP1i7mMraMU
 rVIr+CuaUdTs7Hsb0tz+WD1/iPtE2BSjzTFbL1/8X6U04NQt5ejnO3XfaOA5FsvsZjTD3fAr3+U
 rtwCM4U5xlLIuG3i8j8ZzUuJnE05k3n7GZfy3K48uF66RFrVehmdhDWGnqYmwJgfafBAJBkA8oV
 i42MnLT8zQ9SrcN+qFUZ+ubb1kKPrlLHmjELpQC+H/vPvD7B/EWAArBv
X-Received: by 2002:a05:6a21:6d97:b0:1f3:3e91:fac6 with SMTP id
 adf61e73a8af0-1f544ad686fmr19167416637.5.1741593611244; 
 Mon, 10 Mar 2025 01:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUCtiC0tj7UEKCoeEAOjF0Kg4ISDcivql1xzEAE5j2nkoAyFKoDlK6jX1PF1Bpzz5jKNdcyg==
X-Received: by 2002:a05:6a21:6d97:b0:1f3:3e91:fac6 with SMTP id
 adf61e73a8af0-1f544ad686fmr19167382637.5.1741593610918; 
 Mon, 10 Mar 2025 01:00:10 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736cc75691csm2570639b3a.106.2025.03.10.01.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 01:00:10 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:00:06 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250310080006.rkvoxu55fe3qlxmd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250306081809.2397527-4-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n5LXxpxDPui9o19Do_WAsqdRRKBFMQiAtMFM1XDslok_1741593611
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote: >
 This is a regression test to check whether fsck can handle corrupted > nlinks
 correctly, it uses inject.f2fs to inject nlinks w/ wrong value, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trY3k-00056A-MW
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Hi Chao,

I planned to merge patch 1~3 at first. But as you need to change this
patch more, and might need to change other patches, so how about you
send v2 with all this patchset. I'll wait your v2 :)

Some review points as below...

>  tests/f2fs/009     | 142 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  2 files changed, 144 insertions(+)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..8f6a3e11
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,142 @@
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
> +_require_scratch
> +
> +dir=$SCRATCH_MNT
> +filename=$dir/foo
> +hardlink=$dir/bar
> +
> +for ((i=0;i<14;i++)) do
> +	echo "round: " $i >> $seqres.full
> +
> +	_scratch_mkfs "-f" >> $seqres.full

Can we give "-f" to _scratch_mkfs "f2fs" part? Likes:

  diff --git a/common/rc b/common/rc
  index bf24da4eb..cafe2f3dd 100644
  --- a/common/rc
  +++ b/common/rc
  @@ -993,7 +993,7 @@ _scratch_mkfs()
                  mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
                  ;;
          f2fs)
  -               mkfs_cmd="$MKFS_F2FS_PROG"
  +               mkfs_cmd="$MKFS_F2FS_PROG -f"
                  mkfs_filter="cat"
                  ;;



> +	_scratch_mount >> $seqres.full
> +
> +	if [ $i == 0 ]; then
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 1 ]; then
> +		mkdir $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=1
> +	elif [ $i == 2 ]; then
> +		mknod $filename c 9 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 3 ]; then
> +		mknod $filename b 8 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 4 ]; then
> +		mkfifo $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 5 ]; then
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		kill $pid >> $seqres.full 2>&1
> +		nlink=0
> +	elif [ $i == 6 ]; then
> +		ln -s $dir/empty $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 7 ]; then
> +		# orphan inode
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
> +		stat $filename >> $seqres.full
> +		rm $filename
> +		$F2FS_IO_PROG shutdown 1 $dir/ >> $seqres.full
> +		sleep 6
> +		nlink=1
> +	elif [ $i == 8 ]; then
> +		# hardlink on file
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 9 ]; then
> +		# hardlink on charactor
> +		mknod $filename c 9 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 10 ]; then
> +		# hardlink on blockdev
> +		mknod $filename b 8 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 11 ]; then
> +		# hardlink on pipe
> +		mkfifo $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 12 ]; then
> +		# hardlink on socket
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		kill $pid >> $seqres.full 2>&1
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 13 ]; then
> +		# hardlink on symlink
> +		ln -s $dir/empty $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	fi
> +
> +	if [ $i != 7 ]; then
> +		stat $dir/* >> $seqres.full
> +	fi
> +	echo "ino:"$ino >> $seqres.full
> +	echo "nlink:"$nlink >> $seqres.full
> +
> +	_scratch_unmount
> +
> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
> +	if [ $? != 0 ]; then
> +		exit
> +	fi
> +
> +	export FSCK_OPTIONS="-f"

You've set below code in _repair_scratch_fs():

    f2fs)
        fsck -t $FSTYP -f $SCRATCH_DEV
        ;;

The FSCK_OPTIONS="-f" is useless.

> +	_repair_scratch_fs >> $seqres.full
> +	if [ $? != 1 ]; then

What does $?=1 mean? Does $?=1 mean finding corruption and fixed, $?=0 mean no corruption?

If you want to detect there's a corruption, then fix it, then check if it's fixed. How about
calling _check_scratch_fs at first to get the corruption error you expect, then call
_repair_scratch_fs to fix it. Then call _check_scratch_fs to make sure the corruption is
fixed?

Something likes (just a rough example)

_check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
_repair_scratch_fs >> $seqres.full
_check_scratch_fs

> +		_fail "fsck can not detect and repair zero nlink corruption "$i
> +		exit
> +	fi
> +
> +	export FSCK_OPTIONS=""
> +	_check_scratch_fs >> $seqres.full

I think _check_scratch_fs outputs nothing if run passed, right?

_check_scratch_fs calls _check_generic_filesystem for f2fs, the FSCK_OPTIONS
is "null" by default, so above FSCK_OPTIONS="" is useless too.

> +	if [ $? != 0 ]; then
> +		_fail "fsck hasn't fixed nlink corruption "$i
> +		exit
> +	fi
> +
> +	_scratch_mount >> $seqres.full

">> $seqres.full" isn't necessary.

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
> -- 
> 2.48.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

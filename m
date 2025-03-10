Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8B3A5A4E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 21:25:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trjh5-0000MR-S2;
	Mon, 10 Mar 2025 20:25:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trjh3-0000M4-57
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 20:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DzXTnrCrylALmiqhMAxlKqzEAqMAoi54ub7ST5/3JnI=; b=V+YeEpG1gf7hb8lnZOguSwWSYP
 +YVEERY9L+tnOpeI5mq4UEikO9xf8FZrQ3wzHpjDrAgHFf0XVNY6WHfcpkNRO+KV3wMeq6l7k98xY
 Q2zY8lZhqNSDxkG8z3QNRx+99zmzML7FYcXQfGYXreN9s4eL38QA5bsB9xuMHkc3mZ2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DzXTnrCrylALmiqhMAxlKqzEAqMAoi54ub7ST5/3JnI=; b=Pr/Tc/iflPt3MPlpa0zQnvUoGs
 gsmN2lgpVAnxSvDprYApRvkPXc7X9Ak5EYcDOBOsV4QA8c6hOYZzURKBZ70Elosgvi1pu780VP7aQ
 5EPAVeBhHgM2WUIW3f6AYQQy7bb6CRyrjPhUA0MSHd0v3fLwGP/pSFAkpBG15QaFwBFE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trjh2-00031j-U8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 20:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741638338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzXTnrCrylALmiqhMAxlKqzEAqMAoi54ub7ST5/3JnI=;
 b=GvbWkGG/9ZErBzv0WqcITqtFXumC/K3k9vm93s6LFwG5jig6SYkwFh71ir8P5dWDPjSHm+
 zC8t6Y42Sk0/sb7RnwGM0DKlJFy2gjIRoSe/emtbipn3dFybI/aOwDYgBIhjSZXkrhdc8Q
 U2CwVf+RGmDZA3QWioVaozDzje4o5vU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-y8Cd41cfN4SXUZqxVL5l5w-1; Mon, 10 Mar 2025 16:25:37 -0400
X-MC-Unique: y8Cd41cfN4SXUZqxVL5l5w-1
X-Mimecast-MFC-AGG-ID: y8Cd41cfN4SXUZqxVL5l5w_1741638336
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2254e500a73so30655385ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 13:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741638336; x=1742243136;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzXTnrCrylALmiqhMAxlKqzEAqMAoi54ub7ST5/3JnI=;
 b=wyaxBBLnTwet/CSyXkH51iE538AUL/MHVIH1T3ZYXlEJPTYPo60yN7JewzKXHUxYcp
 QuuAAgw/cBTDqkNvEHB4BZ6RXPjvg1IQdy43APmVqFz0RLhhPr4z4oJWYDgsJ/Y9K3Y1
 0LNwu09HrnCugJnWoHi46KM94+3WX2Msk+hSSudGJl3RLY1vFXbLyAjb5WfFx7SHQJfP
 iYc1Fs8rMbA2rl4KYudvYqkoB5OaRORgS8nzTb9M4MRKSL3BZaEv/FeIZicE1vR/0FRJ
 4yEdkesHnQ0Ave7rnlYvzBdbj3qi4+ASQn37M+BbiBk+hu43StBQg9nesl7a8phZXboA
 MxHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUeKvmLq00X3VdA4XEAwZTR3m4sgRY41c93ddX8jNxy0VzH34zJK57ffwmPgXzB2YoavWn1lhQeMxpC5ApFkzT@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyzEL3Ol124f/9gLlXiqoHHnsRlEgmAcR8oV5juDU1JxPHJnMqk
 1qOvCzfbu5wpCX7QZJl7rzRxGmzbxrQQdLInl5i+4G7QOYJW6IFG6FnTQ4tG+tTpe6pjs70UVh4
 WIb6pvBw5QhOTzOJmbcynkhK2Y+8TICbg5eHD00zdH6QdtVbD2AQBBdTRJ1OVWWUhz5ki/SLV9t
 M=
X-Gm-Gg: ASbGncvXPTb9CqqilCTyaxOlUOdjcrzy8przTqq3hLx9Oq/yW2Wi86GGxjSsZLk8rE5
 X+yXJa+pvvwdR+RyZC8wu8FQFOggRyYTLsK5NjJNhs+Z/FNno/6tknI65QyMCti6/DICra1kcXO
 OS3v0UtEy0QROwAnEHR8PpenctMjTcm9eXD2w3YihA3dyOTUNvoyABKQN343ZU78XqmofK5P71O
 jMC54gM6nYYlvZM+dY0VJj9K3j8ugSuEJkjN82rTgGzmJG+cRDjnCVQNMsm2DBt3me5KNTew4Kz
 z37J1KDbmtcw+DpXCL89mLpVlWssHXP47AIadiUoMDG59VeWLSgtAd98
X-Received: by 2002:a17:902:f54b:b0:224:c47:cbd with SMTP id
 d9443c01a7336-22592d95bfdmr14756635ad.0.1741638336396; 
 Mon, 10 Mar 2025 13:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdhRPF/9qQyxk/8HridFguvWf2Vlm1zX/sntLmxPfLxK0eP3fSpNj3YgskzB5IGUBoax66Kw==
X-Received: by 2002:a17:902:f54b:b0:224:c47:cbd with SMTP id
 d9443c01a7336-22592d95bfdmr14756455ad.0.1741638336054; 
 Mon, 10 Mar 2025 13:25:36 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a7f7cbsm82898005ad.140.2025.03.10.13.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:25:35 -0700 (PDT)
Date: Tue, 11 Mar 2025 04:25:31 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250310202531.kpbloh4c6lopyvw7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250310115621.3441518-1-chao@kernel.org>
 <20250310115621.3441518-4-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250310115621.3441518-4-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6MVZ44xz8QJo7kiVWkPyI14VKDco8aTCs7CqCeftQHM_1741638336
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 10, 2025 at 07:56:21PM +0800, Chao Yu wrote: >
 This is a regression test to check whether fsck can handle corrupted > nlinks
 correctly, it uses inject.f2fs to inject nlinks w/ wrong value, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trjh2-00031j-U8
Subject: Re: [f2fs-dev] [PATCH v2 4/4] f2fs/009: detect and repair nlink
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

On Mon, Mar 10, 2025 at 07:56:21PM +0800, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - make _scratch_mkfs() to format f2fs image forcely
> - adjust _check_scratch_fs() to allow specified parameter of f2fs
> - add _fixed_by_git_commit
> - add _require_command inject.f2fs
> - simply return value handling
>  common/rc          |   9 ++-
>  tests/f2fs/009     | 133 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  3 files changed, 143 insertions(+), 1 deletion(-)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/common/rc b/common/rc
> index bf24da4e..e156f3af 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -993,7 +993,7 @@ _scratch_mkfs()
>  		mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
>  		;;
>  	f2fs)
> -		mkfs_cmd="$MKFS_F2FS_PROG"
> +		mkfs_cmd="$MKFS_F2FS_PROG -f"
>  		mkfs_filter="cat"
>  		;;
>  	ocfs2)
> @@ -3682,6 +3682,13 @@ _check_scratch_fs()
>      ubifs)
>  	# there is no fsck program for ubifs yet
>  	;;
> +    f2fs)
> +        if [ "$FSCK_OPTIONS" == "--dry-run" ]; then
> +            fsck -t $FSTYP $device -- $FSCK_OPTIONS >> $seqres.full 2>&1
> +        else
> +            _check_generic_filesystem $device
> +        fi
> +        ;;
>      *)
>  	_check_generic_filesystem $device
>  	;;
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..d14df968
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,133 @@
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
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +_fixed_by_git_commit f2fs-tools 958cd6e
                                           ^^^^^^^^
                                           commit subject?

> +
> +filename=$SCRATCH_MNT/foo
> +hardlink=$SCRATCH_MNT/bar
> +
> +for ((i=0;i<14;i++)) do
> +	echo "round: " $i >> $seqres.full
> +
> +	_scratch_mkfs "-f" >> $seqres.full

As you've add "-f" in _scratch_mkfs, so this "-f" can be removed.

> +	_scratch_mount >> $seqres.full
                          ^^^^^^
                          I think it's useless

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
                ^^^^^^

Where's the "socket" command from? I think it's not always installed on any
Linux system. fstests never use this command in any test case. If you
need this command, you might need to check that, and _notrun if it's
not installed.

> +		pid=$!

As you have background processes in this test case, you need to make sure
these processes are killed properly in _cleanup, especially if the test
is killed suddently, refer to generic/019.

Thanks,
Zorro

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
> +	export FSCK_OPTIONS="--dry-run"
> +	_check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
> +	_repair_scratch_fs >> $seqres.full
> +	_check_scratch_fs
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
> -- 
> 2.48.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

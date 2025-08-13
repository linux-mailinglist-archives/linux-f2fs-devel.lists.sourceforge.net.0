Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03433B24D35
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 17:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fZ70YGAfBPkdOvYOihBwN2B1gax4rWrlq0NTLxP8H4=; b=jBjWdyBVcTvGFdrGHYLu5HupNk
	GU7AcrE/3yqV2m7ltOPae5B9YzR9hZAmJ1H7wePLsV64/doxCPkusYQd4yDHXQ9JXKayxCb6TJVkA
	NIj/9Z80mV2z/8orqSwMKmB1wzWyEMZrgBV91dLSTDbGQSkXV2wfM2lvUdUUewLZNdGA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umDIe-0002jn-9K;
	Wed, 13 Aug 2025 15:22:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umDIc-0002jh-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 15:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vppSvXKLvw9+Ui4UoKYJG/JyrX8LaLt0vJFChiD34HM=; b=Eqizf2m+0Q4tXz1VhlBX59abiZ
 Cu7WLwy7uQ2vAz6w63idbhD/wZ8jwahHeOGe1duN2/hU0IASidHymvRWBZu28Bd49BrFeHiu3usIL
 tSV3liSvHsS1HR6G2BjrsoXMRg7ipoAf5bb5fXfuIyjtumatoNF9Sp3rTMvtxikLoSf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vppSvXKLvw9+Ui4UoKYJG/JyrX8LaLt0vJFChiD34HM=; b=WSQOE5GRHIngCkbtnIDTrjyvtV
 DSVx/jk5MYrcTTULUkBP/jJa11aDhLJdAn9jAfasdwwwX5+ZFSwDlQRONJkkvgo3VOuy2+5FLjv7M
 1b/q1/yZRHayrHfvcQFRpvA89QdENfKXgW54tIh1IW/TnQ11LlFGq39y1hUb5JLhesio=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umDIc-0006Bb-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 15:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755098512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vppSvXKLvw9+Ui4UoKYJG/JyrX8LaLt0vJFChiD34HM=;
 b=e69auS+JnfSOV7xG7YU39jOubzUm4tAHCfZymDLVaigB/0YxgSo8b/DrAF6KSVol4zhsky
 X7RMQs1ESz5oArNHLU5FGQM0ANT/eQ3HNnMjfcWMBRf1OwqSh1Fkrpmj/hpGSY/msLPv0Q
 EVj0OB7ijVDOeCszkdonb/N1zIjj2cM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-ld2ydjDANwikOnCGA1QI6A-1; Wed, 13 Aug 2025 11:21:50 -0400
X-MC-Unique: ld2ydjDANwikOnCGA1QI6A-1
X-Mimecast-MFC-AGG-ID: ld2ydjDANwikOnCGA1QI6A_1755098510
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23fed1492f6so96861745ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Aug 2025 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755098510; x=1755703310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vppSvXKLvw9+Ui4UoKYJG/JyrX8LaLt0vJFChiD34HM=;
 b=Ap1y33tGZ7dzRcC04An805oT/JcSpD0PI2Q1Yi/bEHX0PDxjGsX3rK/nByDXohQDSJ
 iEJ3uuj+FKjFQFm9HOqvFj1m72pLnUg/bFdWxHwm1TPI6nooZI3f8UjG/v3xkzBtnSfl
 cL46LBLMv2dpeJ7P1u05f+vazlsXgmSIyaTbhSqzcS8TI98ClYoThUnBZTGpr7FDRr1J
 1jPYBdPm1aKtJQed3O4/AKdyLKp2zR/IpqSEWlNXf9ZLWj+9KFOY+pAgZkubMx5mWbVG
 5wnH1cwTYk4Q2IwyUSwK0+NlinR0yQQLIVn0vWP6QImd2LVDkrY7roZtKHZIRdmZXQ4u
 lpRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVFMVIaaCTNfjeMSSydNeO1R6yM7LFbbZZLJ0MiHc6Ppg7VPC+Gt+yUuBq310uiUW9bchK3yaFXp0Z8PiQ0KxR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzSFPeigI+gLjSzrKFuw63RbDP0JRH5Upbcvpd3pjcpAvnSCPQd
 WmZQ4CKKzrEQPZpyY63N9p5rlY5qlnIxZuQDTMqPoOJgJ3g00kzZl+fc6XmVvXslpXIXWR8PJzh
 SLQldy/vdMfyc2PizcYemj3vxC7GboNXOW8aw8fqG4GoXE2QlqPh1a1+edUpg0QnjG5MmVrPjXy
 aTHhY=
X-Gm-Gg: ASbGnct+SJtf6Ce2jC3TdBaREPB0dfkyG/0rb8oAdM9dcBq598oEzVX5avL14zSFczc
 V6Ws5YMsFJPVScXl6/hIEVhF7HJ7VWvgiu2Qsww7JM8y1U3ZvcLL586slZ0+x/kiyYIWKI2LtFK
 WwEtPSqlhHoFOGc/eQn9CPB/KjH/8YZWPhkI4UE26WFgUfAPsIj6zXPhpf/GVn+FDHvzNBejkvZ
 dBYfEkVzm1PuUV7C5L6xmHBYrW85BOGZjWCAWT6bY5B7QaSi6Rlyw20ooGQh70DowxZGXW+CJ+F
 +Zy5+FyJbOXfHjk8iVM2n/32XerqBMjA+PVgsV6DIN5rwGvVYhQeBQk17gPZD8gBhKMheLjgT8p
 OyCLE
X-Received: by 2002:a17:902:f788:b0:240:8c85:4299 with SMTP id
 d9443c01a7336-2430d0ecd34mr54666485ad.17.1755098509691; 
 Wed, 13 Aug 2025 08:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpiUgwY9i2kjNs5657ydUZHd9xLVsxNt5lmXGywsZPtuMbOEjG4FvW3Bxcvc6ijxBkZqf0AA==
X-Received: by 2002:a17:902:f788:b0:240:8c85:4299 with SMTP id
 d9443c01a7336-2430d0ecd34mr54665775ad.17.1755098509141; 
 Wed, 13 Aug 2025 08:21:49 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8977345sm327474455ad.108.2025.08.13.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:21:48 -0700 (PDT)
Date: Wed, 13 Aug 2025 23:21:44 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250813152144.usxshpwpy2pqlovi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250811094415.1053545-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250811094415.1053545-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sXswJ5OEWdtnnLC3MA9e29IyEOZkKjHSkKkVMs9KXV4_1755098510
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 05:44:14PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create a file > 2. write file to create a
 direct node at special offset > 3. use inject.f2fs to inject nid of [...]
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umDIc-0006Bb-B1
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs/019: do sanity check on mapping
 table
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 11, 2025 at 05:44:14PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create a file
> 2. write file to create a direct node at special offset
> 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
> 4. check whether f2fs kernel module will detect and report such
>    corruption in the fil
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/019     | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/019.out |  2 ++
>  2 files changed, 47 insertions(+)
>  create mode 100755 tests/f2fs/019
>  create mode 100644 tests/f2fs/019.out
> 
> diff --git a/tests/f2fs/019 b/tests/f2fs/019
> new file mode 100755
> index 00000000..0a02eb2f
> --- /dev/null
> +++ b/tests/f2fs/019
> @@ -0,0 +1,45 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/019
> +#
> +# This is a regression test:
> +# 1. create a file
> +# 2. write file to create a direct node at special offset
> +# 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
> +# 4. check whether f2fs kernel module will detect and report such
> +#    corruption in the file
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw compress
> +
> +_cleanup()
> +{
> +	_scratch_mkfs >> $seqres.full

Why mkfs SCRATCH_DEV in _cleanup ?

> +}
> +
> +_fixed_by_kernel_commit 77de19b6867f \
> +	"f2fs: fix to avoid out-of-boundary access in dnode page"
> +
> +export MKFS_OPTIONS=""

Can you give it a comment about why we need to clean mkfs option at here?

> +_require_scratch

Oh, if this case tends to have a corrupted SCRATCH_DEV, you can use
_require_scratch_nocheck at here, don't need to mkfs in _cleanup.

> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount
> +
> +xfs_io -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
   ^^^^^^
$XFS_IO_PROG

> +
> +_scratch_unmount
> +
> +$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
> +
> +_scratch_mount
> +xfs_io -c "pread 3700M 40M" $testfile
   ^^^^^^
$XFS_IO_PROG

> +_scratch_unmount
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/019.out b/tests/f2fs/019.out
> new file mode 100644
> index 00000000..2f7469e2
> --- /dev/null
> +++ b/tests/f2fs/019.out
> @@ -0,0 +1,2 @@
> +QA output created by 019
> +pread: Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

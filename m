Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D91AA93D66A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 17:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXNCm-0005Sz-UA;
	Fri, 26 Jul 2024 15:50:05 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1sXNCl-0005Sp-0S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ONAly56Pin9bv9f9L0IyZ2C5ghF4uan7hL3Edo6ut5o=; b=KybqPE5XEmadDnsGDpcwKP+vv8
 saqexB4oZifyLWu92OgEriL1R89ULlngjuaCpqU9Oc9u/ADE8RQmJqLyLstcnIZv37qCw5Z1NpSG3
 722bbKkfW7V95vcpY7gvHr7LUSwyN6yYBTWXYgoqfPhwWtyciXsgScpg2TE6B1GLokI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ONAly56Pin9bv9f9L0IyZ2C5ghF4uan7hL3Edo6ut5o=; b=LlAzUejPfVMxYJ22zNi1lrxBl2
 wLWYkHbRLKLTyRMYsNdfhFvYZitlIUspzBtVKsA0HfpkbAtyt50VWYK0AE/9wwLiDmRSGv4IlMkPC
 xtkEg+W8wwG7Kb4yfEpu6oKhVEJMZCuQYOE86WBolkkBmnwuBRxZWZK4e8niNl8iQ8vc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXNCk-0006YE-NI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722008990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ONAly56Pin9bv9f9L0IyZ2C5ghF4uan7hL3Edo6ut5o=;
 b=WtZhq03Isy75kL3LrBQdZiseRzp5kMbWW07lcp8DFb4ugEcYfK4vskRaZaUUKhaBzPnYzv
 1mb5fxGew+qBAWhIuWZBZ1qj2TFS+SXsx4A3HyKrzkUQB5or8qyxJb0c14HukqRhBe2tQ0
 a6DdczgYYa3H1CwyupcTxuSWEzjRioQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373--y9F9kLmOHq2RCx9oHd2sA-1; Fri, 26 Jul 2024 11:49:47 -0400
X-MC-Unique: -y9F9kLmOHq2RCx9oHd2sA-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1fc5acc1b96so8381735ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722008986; x=1722613786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONAly56Pin9bv9f9L0IyZ2C5ghF4uan7hL3Edo6ut5o=;
 b=X+yocW4H9vjVDkdnUqQCz2PzOIgxKYKDo4FcOJRY97OZ3FV0eEvJXU24unmFNdkvRT
 SXTwRnzuXrJKECx5VBbJBSMOX+JbPSh/jJTOmwIRJ1/tfsyi7pGKZhZ6FxmGVTlzY4K/
 9xMEi5Eq1nhS6pCR5x3v3xAj1nacomURcH9aENAdvJeBvOCGtA/L2FkkL9bGL+4R4iz5
 uEuVHB0A7sp9VDfswKZdVv+vndWgdJTq6JnI944ENtlsljHa9NuNEfLZcw6sADEGGJyM
 yDdDl/SLKwSoIVBpWla6DQqudewsFiua2jTnu/pW5xa961txvLqnKVCtBsdz6Ed4/+WW
 aASw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCQqNUdYr6urXNu0iEYshuZxFpY9Zh5zZDpnADLx7jO6qdbyNfSEaXZopxpbM049xDJ2fbqvAo7VM8kyh5FiuWkzBSGcC4aJgc/PM74DTcyEyyyxuJ8w==
X-Gm-Message-State: AOJu0Yy3PT+JRzFvl7VR/YFiDfNJpADxK076DhtCzFAg9/LBfUyJMgup
 u4BBRPG37Tg4Djkn9wObk/JE4YdNYdylSs3rYTIMv6/+50v/pYhPwWz5909jgMmvrP4Med2OvqU
 vUM63K1V1xAU9nW1Anr/zfnx0HxttiAQ5chPUkS7ckGsXVywoxGbqpGw20PutneveFKQ+/M8Yk9
 g=
X-Received: by 2002:a17:903:248:b0:1fc:2ee3:d460 with SMTP id
 d9443c01a7336-1ff04858a84mr369305ad.35.1722008985827; 
 Fri, 26 Jul 2024 08:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPPUps4Y/l0dGXPyi0XPbe+JP4pMjXykLBpdxaOUUdPI1aVaCxvKME5pZpY68OLkuhyvgCAA==
X-Received: by 2002:a17:903:248:b0:1fc:2ee3:d460 with SMTP id
 d9443c01a7336-1ff04858a84mr369065ad.35.1722008985375; 
 Fri, 26 Jul 2024 08:49:45 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7ee1241sm34367185ad.172.2024.07.26.08.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:49:45 -0700 (PDT)
Date: Fri, 26 Jul 2024 23:49:41 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240726154941.lzpunsvd53lnieoz@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240720074316.3302470-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240720074316.3302470-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jul 20, 2024 at 03:43:16PM +0800, Chao Yu wrote: >
 Test that we will simulate sqlite atomic write logic w/ below steps: > 1.
 create a regular file, and initialize it w/ 0xff data > 2. start tr [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sXNCk-0006YE-NI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: test for race condition in between
 atomic_write and gc
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 20, 2024 at 03:43:16PM +0800, Chao Yu wrote:
> Test that we will simulate sqlite atomic write logic w/ below steps:
> 1. create a regular file, and initialize it w/ 0xff data
> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> 3. write transaction data
> 4. trigger foreground GC to migrate data block of the file
> 5. commit and end the transaction
> 6. check consistency of transaction
> This is a regression test to check handling of race condition in
> between atomic_write and GC.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add kill&wait in _clean() to avoid umount failure
> - some cleanups
> - use exported helpler
>  tests/f2fs/003     | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/003.out | 11 ++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100755 tests/f2fs/003
>  create mode 100644 tests/f2fs/003.out
> 
> diff --git a/tests/f2fs/003 b/tests/f2fs/003
> new file mode 100755
> index 00000000..c30e874a
> --- /dev/null
> +++ b/tests/f2fs/003
> @@ -0,0 +1,65 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/003
> +#
> +# Test that we will simulate sqlite atomic write logic w/ below steps:
> +# 1. create a regular file, and initialize it w/ 0xff data
> +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> +# 3. write transaction data
> +# 4. trigger foreground GC to migrate data block of the file
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# 6. check consistency of transaction w/ in-memory and on-disk data
> +# This is a regression test to check handling of race condition in
> +# between atomic_write and GC.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +. ./common/filter
> +
> +_cleanup()
> +{
> +	kill -9 $atomic_write_pid > /dev/null 2>&1
> +	wait > /dev/null 2>&1

This version looks good to me, just this place, we need to keep the default
_cleanup steps.

        cd /
        rm -r -f $tmp.*

I'll do this change when I merge this patch.

(And please don't forget to update the _fixed_by_xxxxx information later.)

Reviewed-by: Zorro Lang <zlang@redhat.com>

Thanks,
Zorro

> +}
> +
> +_require_scratch
> +_require_xfs_io_command "fpunch"
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +dbfile=$SCRATCH_MNT/dbfile
> +foo=$SCRATCH_MNT/foo
> +bar=$SCRATCH_MNT/bar
> +
> +$XFS_IO_PROG -c "pwrite 0 512k -S 0xff" -c "fsync" -f $dbfile >> $seqres.full
> +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $foo >> $seqres.full
> +sync
> +
> +# start atomic_write on dbfile & write data to dbfile
> +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
> +atomic_write_pid=$!
> +
> +$XFS_IO_PROG -c "fpunch 0 2m" $foo >> $seqres.full
> +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $bar >> $seqres.full
> +
> +# persist all dirty data
> +sync
> +echo 3 > /proc/sys/vm/drop_caches
> +
> +# trigger foreground GC to migrate data block of atomic_file
> +$F2FS_IO_PROG gc 1 $SCRATCH_MNT > /dev/null 2>&1
> +
> +# wait for atomic_write commit completion
> +sleep 5
> +# print in-memory data
> +_hexdump $dbfile
> +echo 3 > /proc/sys/vm/drop_caches
> +# print on-disk data
> +_hexdump $dbfile
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/003.out b/tests/f2fs/003.out
> new file mode 100644
> index 00000000..64698d84
> --- /dev/null
> +++ b/tests/f2fs/003.out
> @@ -0,0 +1,11 @@
> +QA output created by 003
> +000000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
> +*
> +020000 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  >................<
> +*
> +080000
> +000000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
> +*
> +020000 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  >................<
> +*
> +080000
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

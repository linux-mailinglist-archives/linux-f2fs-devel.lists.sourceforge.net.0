Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 294519B4AE4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 14:27:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5mFs-0005qd-Rf;
	Tue, 29 Oct 2024 13:27:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t5mFr-0005qX-4D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 13:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bw7ZnwN/MMT0OxVyJJnC8LudHJvtO616079N5Etu0cw=; b=iEDGd9pc2FclsUJNgGX5wtk5wp
 O4ZaaXi4kFEnG7m6evVgYesmMRWq2NavQPXsj8ehphZvAzuOyxYjQIchLy2gaB8oehEVykSCq/0PS
 b1Y2laYhdxCNX3wRX0tWAitgFyYWzhXBKEUsoaWpgAz3hKlubPJSGY6VJ8JYYVFrW08M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bw7ZnwN/MMT0OxVyJJnC8LudHJvtO616079N5Etu0cw=; b=W5ZBXgHfQxOtBmqNJSaCbVX2Va
 6F7UyIQ+p4PHyVThV0+JazSI2ZVHww5W1Fq4vf+G3s3EOq8c43F0gT9QkFs2euU1CYEQhLqIsDNFD
 UiVba5zFGx2GMLcMGiuDhOTVv3ckxD70PwB0QiHjZ/qOkChNEFtVDW1a+O2+yKj6afhg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5mFp-0006Yo-8P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 13:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730208439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bw7ZnwN/MMT0OxVyJJnC8LudHJvtO616079N5Etu0cw=;
 b=CFm835g8ybCG5OG5bEHfZukUPpViFzCYPOmQnOpSN6tCY6ZnJfHSBQSM6l070ikrkYdGPi
 ZwJPJBSnFGSNRrY7j2T+QhZ2c/Q4g0I6UWR0pGzcd4j8JjPSvt7I/hknFFgC7fqB8iCZSo
 EUub3rd499dgRZvZrHdTCm3t7Vpljl0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-uMeTDF_1PAum9mV90zZF0g-1; Tue, 29 Oct 2024 09:27:17 -0400
X-MC-Unique: uMeTDF_1PAum9mV90zZF0g-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2e2e8a71e3aso6773073a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2024 06:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730208436; x=1730813236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bw7ZnwN/MMT0OxVyJJnC8LudHJvtO616079N5Etu0cw=;
 b=klX5gJFcQwGYDTS+8k7NarxL4QCVyyYruruRCCkKK80io346r8M5L0bFb8BMg/NZtr
 ysiYDWWf5y1gO+hDoFyuhzgdUwxZ4uV+0TiBSqFIc5D9BuUxcDYryj749QgBJOOSkegy
 1m0op3fInNxFx4iZ1HwqYGe5a0DwAVLYw7W6rmjpFMVlmkVkSbeyBNHREY32uzvWF8rT
 OIMXIMy/M3F85YJquuFV1d10sY+1RZb0PlzaawPq9H4ogTMSd9yTy3mkwhpP9gImWAIU
 cVcpOiR2Y4APOBflnQtLs9l6o3RDnCs6S112bURrXxNH7fpoIUrkNVQHngBxe0Iizqjj
 JBMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUdVqiY6gKZA5ByW8kH7cT79I4WgQeWUYOIaH9dW62kJ5hZ8q5uEnlo3JIl3PKhVNs7csR/wtm5xkwRiDQrvIN@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy2RKppOfTPAmdM7JF30+Nk52/Ox7YdU65cN6L0AQjej/4r03D/
 CPryErJMBREAvdOPFQFKpFDaEPL5ZeYE+qSZ13czP2LFbHyF9M08PTpUoHtE4ktOJWwYxrn6XBH
 pppAD8Eey/dyj3uHyDdu8lbBqnaTQx966sOwxgyhBEH7s/xJLO1b73Y2zbC72Ey2lhFn4h1RF+/
 djSEEV4C1Gyg==
X-Received: by 2002:a17:90b:4388:b0:2e2:b281:536e with SMTP id
 98e67ed59e1d1-2e8f1070ed3mr13210268a91.15.1730208436618; 
 Tue, 29 Oct 2024 06:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg2CJLFqwmOmUMIpzaQ5Tb2n2VjcwffUlLAFBdGFahpFV+qdUdM/WSu+/t38NyF2egntO6Kg==
X-Received: by 2002:a17:90b:4388:b0:2e2:b281:536e with SMTP id
 98e67ed59e1d1-2e8f1070ed3mr13210243a91.15.1730208436018; 
 Tue, 29 Oct 2024 06:27:16 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3555ad3sm9445914a91.1.2024.10.29.06.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 06:27:15 -0700 (PDT)
Date: Tue, 29 Oct 2024 21:27:11 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241029132711.veu5kgqkgmjatneq@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241029102644.4027606-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241029102644.4027606-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 29, 2024 at 06:26:43PM +0800, Chao Yu wrote: >
 This is a regression test to check whether f2fs handles dirty > data correctly
 when checkpoint is disabled, if lfs mode is on, > it will trig [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5mFp-0006Yo-8P
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs/006: add testcase to check
 out-of-space case
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 29, 2024 at 06:26:43PM +0800, Chao Yu wrote:
> This is a regression test to check whether f2fs handles dirty
> data correctly when checkpoint is disabled, if lfs mode is on,
> it will trigger OPU for all overwritten data, this will cost
> free segments, so f2fs must account overwritten data as OPU
> data when calculating free space, otherwise, it may run out
> of free segments in f2fs' allocation function. If kernel config
> CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
> dd may encounter I/O error.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - check dmesg instead of unstable output from dd

This version looks good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/006     | 42 ++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/006.out |  2 ++
>  2 files changed, 44 insertions(+)
>  create mode 100755 tests/f2fs/006
>  create mode 100644 tests/f2fs/006.out
> 
> diff --git a/tests/f2fs/006 b/tests/f2fs/006
> new file mode 100755
> index 00000000..a9c823c1
> --- /dev/null
> +++ b/tests/f2fs/006
> @@ -0,0 +1,42 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/006
> +#
> +# This is a regression test to check whether f2fs handles dirty
> +# data correctly when checkpoint is disabled, if lfs mode is on,
> +# it will trigger OPU for all overwritten data, this will cost
> +# free segments, so f2fs must account overwritten data as OPU
> +# data when calculating free space, otherwise, it may run out
> +# of free segments in f2fs' allocation function. If kernel config
> +# CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
> +# dd may encounter I/O error.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to account dirty data in __get_secs_required()"
> +
> +_require_scratch
> +_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
> +
> +# use mode=lfs to let f2fs always triggers OPU
> +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
> +
> +# The 2nd dd might run out of space, and trigger a kernel warning or
> +# hang on unfixed kernel
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync >>$seqres.full 2>&1
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync >>$seqres.full 2>&1
> +
> +_scratch_remount checkpoint=enable
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> new file mode 100644
> index 00000000..675c1b7c
> --- /dev/null
> +++ b/tests/f2fs/006.out
> @@ -0,0 +1,2 @@
> +QA output created by 006
> +Silence is golden
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

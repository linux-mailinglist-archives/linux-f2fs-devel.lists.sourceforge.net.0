Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A614A7181E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 15:10:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txRSP-0007q7-3i;
	Wed, 26 Mar 2025 14:10:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1txRSN-0007q1-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 14:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=btAjlbfP0qsWwuIvhUJP7zll2gojIYYhQbD3wLOGP0o=; b=Nrs1dTT6Nscb+CdZmX1xhpp2Nd
 MoEEhnhdoYbJF0v3M7/GtZpl5rQFdbaimDzrJpBHCFPWuaUn9iwW6sOjfIVHUJGuXOyXmhxxOsqio
 7CJ1y4LIzKPCf1F1YK2Jn3dRtXImimAUPIOrD3/j4cBYjZRRULEsanWvH3IcNUnbELYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=btAjlbfP0qsWwuIvhUJP7zll2gojIYYhQbD3wLOGP0o=; b=WfTX6WC6DJYTlkk+gHGVGJKs1d
 CbopI+vkTy0gU4Ctw4p+OF4oxvyuXR95TpWwyj3Tqk6xoS0jXOwukqLQxlDWL/gXLA3cm6ZxmQUq9
 IRIGC09hzO8TpYvM87oer+rUbdJqIwIp/ZXcS0UOtvG8+Nv8J1iWa9Yf156y2WFNEYF4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txRS9-00046g-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 14:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742998186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=btAjlbfP0qsWwuIvhUJP7zll2gojIYYhQbD3wLOGP0o=;
 b=HA5kapHxIB96CjkpMCiwob4XgBEV7N6tW++ZPUtznwfMrU8tNE2Za8cyvbOO0Nh7sNxlle
 sP73pFSpJ1GYhtcCDVRjb190ZbgrywIjYsq35/YeKq1R+gSxyeyRGKjjmkNTkidArxUQW5
 K+/21Z/Ci6pFm3YChSfD8CZbn+C6B4s=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-f_l86YD6Mf6WrVuNyHDO5g-1; Wed, 26 Mar 2025 10:09:44 -0400
X-MC-Unique: f_l86YD6Mf6WrVuNyHDO5g-1
X-Mimecast-MFC-AGG-ID: f_l86YD6Mf6WrVuNyHDO5g_1742998183
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff798e8c90so10953663a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 07:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742998183; x=1743602983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=btAjlbfP0qsWwuIvhUJP7zll2gojIYYhQbD3wLOGP0o=;
 b=KixGzkhDcbxZOcYG/mx61PEWxuBgrFrxcjEq+kohB0FfOYs4ZBCxgY2yH+P6xKVai7
 9OP76vLXz4+NE6GxEzYzGPtx3+QgYhYmkxRwiLe0rsVBD+5UHUaeiPyS1UcU49mwXIQN
 V6U2x6jj3410wBtbadcotNAnbipY4PfQl16lwSi65PEebRIunfAJdsK3iKpVxRaUUyfr
 f/MSp9z3GWH3MxHTG42YNbfbtdJ9F5uy3krpB7ut7VG6udgZThW/Wu/GLP/qGiSc43XJ
 7q11WzCNurpY2DGRYfTqqRBF3L8mz44uQ+VwJG1YNlMOGbIv2Yw7ygR1/amnJ1IlxaNs
 0cQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWGKvWiPBjxIDAROkoFfEiyikOG6PVMkND/lq/ny/ieqbGJ0rgToXSxaYyp0TVRDr5hmIoNi1krGrdSYrJx3Ja@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzcLzjTsI4UNFhAsPKp6Tr99i/XmGdzzdRh53ex2rbAvI13zdWA
 OfnkG8IeIAl4wOh16cLcC09/FQdFcxsoXCCWnRxuYtvE4oPOgu0Tjtxm63+3KiKVvgHWuT0VLVY
 cKQTmnidBECX/K8jFmHOV6uILPVtPZpSz6HHZrZ8LjG6BBDA6KPMt6jKYSdAvzfeL9trhbAygLC
 Y=
X-Gm-Gg: ASbGncv4pm7e+p8XrFbkXuWSxAcY6qPezfGpJPfqYBQrLVtDnjkKXUbxqGVMiAnFKI7
 76Sjb9OybLmz+8Hc4l47dCvlm4gXsGyJtfOFEVCtCwpQWcjvHRrXCA20T5FzUoGmsnzE8D97981
 lnm18cRuV5dzuiufLBjDpMlZbtXFHfZcv69/2pl/24ADjf/Ny2/LV4FrePCthP1av3edIOvYwGz
 k0JHqKM1AzhrIPwllVUsn731cgOV+UIBpuRi4/aeTxkc72x8iJRrHOOBUEk6wtVJgOzoraVhGxZ
 Cbk2oVzFr5qGp/S5hfof6tIexpeukxuDgwdlVTMhbUENwkuuU6pMYVrS
X-Received: by 2002:a17:90b:4b10:b0:2ff:796b:4d05 with SMTP id
 98e67ed59e1d1-3030fea7630mr34272176a91.11.1742998183096; 
 Wed, 26 Mar 2025 07:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMzeBEP4vk/5dY02h5nJIzj4llSMDx8Ecfe3gpOVEelgbpIBmabZiPiSqtNOthMzsCpegSHg==
X-Received: by 2002:a17:90b:4b10:b0:2ff:796b:4d05 with SMTP id
 98e67ed59e1d1-3030fea7630mr34272143a91.11.1742998182581; 
 Wed, 26 Mar 2025 07:09:42 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039e20e4dcsm205889a91.27.2025.03.26.07.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 07:09:42 -0700 (PDT)
Date: Wed, 26 Mar 2025 22:09:38 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250326140938.6ll7yeez6iwabvgi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250326120341.3641535-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250326120341.3641535-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qoszhZ42_cXagRuIG_nX5CwM4TzvxVUOyMyqIKC1UzY_1742998183
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 26, 2025 at 08:03:41PM +0800, Chao Yu wrote: >
 This is a regression testcase to check whether we will handle > out-of-space
 case correctly during fallocate() on pinned file > once we disab [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txRS9-00046g-NZ
Subject: Re: [f2fs-dev] [PATCH] f2fs/011: test to check out-of-space issue
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

On Wed, Mar 26, 2025 at 08:03:41PM +0800, Chao Yu wrote:
> This is a regression testcase to check whether we will handle
> out-of-space case correctly during fallocate() on pinned file
> once we disable checkpoint.
> 
> Testcase:
> 1. mount f2fs w/ checkpoint=disable option
> 2. create fragmented file data
> 3. set flag w/ pinned flag
> 4. fallocate space for pinned file, expects panic due to running
> out of space.
> 
> We should apply commit 48ea8b200414 ("f2fs: fix to avoid panic
> once fallocation fails for pinfile") to avoid system panic.
> Note that it only fix the issue for regular block device, problem
> still exist for zoned block device.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/011     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/011.out |  2 ++
>  2 files changed, 60 insertions(+)
>  create mode 100755 tests/f2fs/011
>  create mode 100644 tests/f2fs/011.out
> 
> diff --git a/tests/f2fs/011 b/tests/f2fs/011
> new file mode 100755
> index 00000000..1ece8fd0
> --- /dev/null
> +++ b/tests/f2fs/011
> @@ -0,0 +1,58 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/012
> +#
> +# This is a regression testcase to check whether we will handle
> +# out-of-space case correctly during fallocate() on pinned file
> +# once we disable checkpoint.
> +# 1. mount f2fs w/ checkpoint=disable option
> +# 2. create fragmented file data
> +# 3. set flag w/ pinned flag
> +# 4. fallocate space for pinned file, expects panic due to running
> +# out of space
> +# We should apply commit 48ea8b200414 ("f2fs: fix to avoid panic
> +# once fallocation fails for pinfile") to avoid system panic.
> +# Note that it only fix the issue for regular block device, problem
> +# still exist for zoned block device.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_cleanup()
> +{
> +	cd /
> +	rm -r -f $tmp.*
> +}

Default _cleanup does the same things, so above _cleanup can be removed.

> +
> +_fixed_by_kernel_commit 48ea8b200414 \
> +       "f2fs: fix to avoid panic once fallocation fails for pinfile"
> +
> +_require_scratch
> +_require_command "$F2FS_IO_PROG" f2fs_io
> +
> +_scratch_mkfs_sized $((1*1024*1024*1024)) >> $seqres.full
> +_scratch_mount -o checkpoint=disable:10%
> +
> +pinfile=$SCRATCH_MNT/file
> +
> +# simulate fragment status in f2fs
> +for ((i=0;i<256;i++)) do
> +       dd if=/dev/zero of=$SCRATCH_MNT/$i bs=1M count=1 >>$seqres.full 2>&1

We'd like to use xfs_io when we can:

$XFS_IO_PROG -f -c "pwrite 0 1m" $SCRATCH_MNT/$i >>$seqres.full

> +done
> +sync
> +
> +for ((i=0;i<256;i+=2)) do
> +       rm $SCRATCH_MNT/$i >> $seqres.full 2>&1

How about "rm -f $SCRATCH_MNT/$i" without ">> $seqres.full 2>&1" ?

> +done
> +sync
> +
> +touch $pinfile
> +$F2FS_IO_PROG pinfile set $pinfile >> $seqres.full
> +fallocate -l $((3*256*1024*1024)) $pinfile >> $seqres.full 2>&1

Same, we'd like to use xfs_io at first, due to it's already a necessary
running dependence of fstests.

$XFS_IO_PROG -c "falloc 0 $((3*256*1024*1024))" $pinfile

Thanks,
Zorro

> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/011.out b/tests/f2fs/011.out
> new file mode 100644
> index 00000000..62e02519
> --- /dev/null
> +++ b/tests/f2fs/011.out
> @@ -0,0 +1,2 @@
> +QA output created by 011
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

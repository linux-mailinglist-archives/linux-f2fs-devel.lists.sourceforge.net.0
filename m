Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB739FD8F6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Dec 2024 05:28:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tROQc-0001VS-LO;
	Sat, 28 Dec 2024 04:27:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tROQc-0001VM-4s
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 04:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PxKP1JYtpYze2lidt7JggvzgICQVYYUkZoaw6OgMCWM=; b=izjPqgrkor8PA1ZAMwduxMDpSb
 /EUgqjsdoANEDAiCQtxWgBnD5UshIARHYkYLZv2urG96LgYH2lSqgXcqAUxkUaMnZn+muKUn+8UyD
 Rr79lBWSExnqCvHt0ZcmfAm5oZ3lU0fRmHPlnYnB9qmDTzvuT5HWeXpqfUT2+PBIPFlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PxKP1JYtpYze2lidt7JggvzgICQVYYUkZoaw6OgMCWM=; b=R1kE6zmouzRR9zV5ycyv5UBwFe
 qkJ3GfnpRvVdf8EyDiU2irGtCrGTc3y0nitL+HH1fVDMigeUiG/zFD0RS1Sf9MpAIK7s4m+pky3eG
 GJlP7CdVJoUFsfXMu+YEUYeOVRROhB+sDGHoRBPaPmsmVrQj4Pb+47IeSH4bOSJrS4qc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tROQb-0007Yy-4x for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 04:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735360066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PxKP1JYtpYze2lidt7JggvzgICQVYYUkZoaw6OgMCWM=;
 b=RSAnF43a5J4yo0JKW6oVR+tS5vRbDWcosgNL45DPraPljK4U25Hkbq2MqhlRewtf9apn0Y
 nRrgi93sdn2dJ8hvoUTbJVmhsMn9JHCQLmDdS+8MWZlo1fhzH13khcq/fhkmssbXZcJV82
 KClApkhAX+AwsLl4CKyzQsnFz9UbUwc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-nah2zjd3MZWp-4MKDFQegA-1; Fri, 27 Dec 2024 23:27:45 -0500
X-MC-Unique: nah2zjd3MZWp-4MKDFQegA-1
X-Mimecast-MFC-AGG-ID: nah2zjd3MZWp-4MKDFQegA
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-216750b679eso83225095ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Dec 2024 20:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735360064; x=1735964864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxKP1JYtpYze2lidt7JggvzgICQVYYUkZoaw6OgMCWM=;
 b=BJYGGpVHJlVI51skoXaOSnniR/TNzB5XVseUqoayQfPtfXTXjtTQ1CSKujI55o+FgU
 NI7Chblm4aSRWg4/VhhOFXcDux2EsA+B793B6amsV7pUkQMdc8+tPNsg6r2W1mmALvzA
 k7Uxv9Fjo4APsx1PCDMColobH11saQrlbhsLgllR6hUF7m3ezf2njgCxKdQ20MXRnCso
 UMgBmF2wDk289ViNpIqLE2yzGiz8kF5cKOvrn9DaA4FSjdhISDM64Wy/fFLtprK6GqHJ
 HfuSzMwB1iSpg9mq8OhO10JKlR+yvEHEsbIqCo4qvBNp1uLliawK/g7aqZG/DpfGOFR1
 Kd1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUicQIWnCapCjyAN5ulNvzsxgO0bdlRzku2YRFWSo/hjKI5DyVIjwiZojeYqXmK6C+0sBeAswQz6dHqp3F/8Vd0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxWEz83XK0rkRGPDJ0fkCPU2aL+xS/gyBbE6Hy6BanfhWa9myNq
 OKYF8yMG3bRQDZR6hj/CzAK0JPtbBzO0DfgdZKs98IecYZujf6silAu2ocTeRxNXWDuU81XaoJ2
 aMfvyT024JkMn8tdCr5s9kVdQRTeYmnUT8BUcPEDZXphNAF33k7sQK3l+/bNJIJL5VfKZci/xH/
 Q=
X-Gm-Gg: ASbGncvxyjP7SS9+8JWzoGXD0w7USOiIiznynJ1QpH3aF/jlLeXgntfx6lN2jGyzbof
 tKC52e8DHynu1auHDQp5f4tzgC3X+c5UyvEr69zRWWZSdTB556PBoTUfuoT+mRYUZhHYgQwj6fl
 reCzFtdCziU6cncfZy+3g19A06heHdYgFNAh2KzGHpn4IEQGMOTBe05aReRQOy1BxbB30JB8xfR
 0JW9i1uAEYipFZGBFQtcHUyZ/qpdXGWKuDUg+xeeSXM3tEBvR2kYJLusZkE6dOyz9yEgMyY4lMw
 HUdpUnARgW0GqEHGYJxOvA==
X-Received: by 2002:a17:903:1248:b0:215:a96d:ec17 with SMTP id
 d9443c01a7336-219e6e9f972mr388774555ad.14.1735360064117; 
 Fri, 27 Dec 2024 20:27:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMN3qkkbg7IkE7tokaFOyB9J+Jlk/b/GquRVWEbzCvww8Aslq47g6LUtZs6GhTqkO4yMpgsQ==
X-Received: by 2002:a17:903:1248:b0:215:a96d:ec17 with SMTP id
 d9443c01a7336-219e6e9f972mr388774435ad.14.1735360063819; 
 Fri, 27 Dec 2024 20:27:43 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc96e85csm142860585ad.61.2024.12.27.20.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 20:27:43 -0800 (PST)
Date: Sat, 28 Dec 2024 12:27:38 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241228042738.hk5k4impnvstjmj4@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241226133631.9486-1-chao@kernel.org>
 <20241226133631.9486-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241226133631.9486-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CJeGRoSYjVLu39k6ex1goKOwGa0c3qbriwIhab7XaD0_1735360064
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 26, 2024 at 09:36:31PM +0800, Chao Yu wrote: >
 This patch introduce a regression testcase to check whether > f2fs can handle
 discard correctly once underlying lvm device > changes to not s [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tROQb-0007Yy-4x
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs/008: test snapshot
 creation/deletion on lvm device
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

On Thu, Dec 26, 2024 at 09:36:31PM +0800, Chao Yu wrote:
> This patch introduce a regression testcase to check whether
> f2fs can handle discard correctly once underlying lvm device
> changes to not support discard after user creates snapshot
> on it.
> 
> Related bug was fixed by commit bc8aeb04fd80 ("f2fs: fix to
> drop all discards after creating snapshot on lvm device")
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - use "lvcreate -y" to force wiping stale data in device.
>  tests/f2fs/008     | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/008.out |  2 ++
>  2 files changed, 59 insertions(+)
>  create mode 100755 tests/f2fs/008
>  create mode 100644 tests/f2fs/008.out
> 
> diff --git a/tests/f2fs/008 b/tests/f2fs/008
> new file mode 100755
> index 00000000..47696f2b
> --- /dev/null
> +++ b/tests/f2fs/008
> @@ -0,0 +1,57 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/008
> +#
> +# This is a regression test to check whether f2fs can handle
> +# discard correctly once underlying lvm device changes to not
> +# support discard after user creates snapshot on it.
> +#
> +
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +_fixed_by_kernel_commit bc8aeb04fd80 \
> +        "f2fs: fix to drop all discards after creating snapshot on lvm device"
> +
> +_require_scratch_nolvm
> +_require_block_device $SCRATCH_DEV
> +_require_command "$LVM_PROG" lvm
> +
> +lvname=lv_$seq
> +vgname=vg_$seq
> +testfile=$SCRATCH_MNT/testfile
> +
> +_cleanup()
> +{
> +	_unmount $SCRATCH_MNT >>$seqres.full 2>&1
> +	$LVM_PROG lvremove -ff /dev/mapper/$lvname-snapshot $vgname >>$seqres.full 2>&1
> +	$LVM_PROG lvremove -ff /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> +	$LVM_PROG vgremove -ff $vgname >>$seqres.full 2>&1
> +	$LVM_PROG pvremove -ff $SCRATCH_DEV >>$seqres.full 2>&1
> +	_udev_wait --removed /dev/mapper/$vgname-$lvname
> +	cd /
> +	rm -f $tmp.*
> +}
> +
> +$LVM_PROG pvcreate -f $SCRATCH_DEV >>$seqres.full 2>&1
> +$LVM_PROG vgcreate -f $vgname $SCRATCH_DEV >>$seqres.full 2>&1
> +$LVM_PROG lvcreate -y -L 1024m -n $lvname $vgname >>$seqres.full 2>&1

OK, so you choose "-y" option. I think it's fine, due to this option was
brought in by below commit [1] 11 years ago. It's nearly same old with f2fs :)
So,

Reviewed-by: Zorro Lang <zlang@redhat.com>

[1]
  commit b6dab4e0598df7b6a44a32749fdb846c03aa692d
  Author: Peter Rajnoha <prajnoha@redhat.com>
  Date:   Wed Nov 6 16:16:34 2013 +0100

    lv_manip: rename set_lv -> wipe_lv and include signature wiping capability



> +_udev_wait /dev/mapper/$vgname-$lvname
> +
> +_mkfs_dev /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> +_mount -o discard /dev/mapper/$vgname-$lvname $SCRATCH_MNT >>$seqres.full 2>&1
> +
> +dd if=/dev/zero of=$testfile bs=1M count=20 >>$seqres.full 2>&1
> +sync
> +rm -f $testfile
> +sync
> +
> +# create a snapshot on lvm device
> +$LVM_PROG lvcreate -L 1024m -s -n $lvname-snapshot /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/008.out b/tests/f2fs/008.out
> new file mode 100644
> index 00000000..dd68d5a4
> --- /dev/null
> +++ b/tests/f2fs/008.out
> @@ -0,0 +1,2 @@
> +QA output created by 008
> +Silence is golden
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

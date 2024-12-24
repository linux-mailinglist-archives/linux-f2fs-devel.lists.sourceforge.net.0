Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B089FBBB7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Dec 2024 10:59:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tQ1gh-00076z-Vz;
	Tue, 24 Dec 2024 09:58:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tQ1gS-00076n-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Dec 2024 09:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Inzfeq1sXuNH2Lm+tHdVFULsYJqwlPXXwNULENmuYDA=; b=ielcYEL+/FpJvlplPNpRCveJHh
 Q4yEQLGsuY1XXByVXNj2Uwfjw6fWwZpWMbiOD3R/vSVYZ4EG2cJ0Iyz/Qcn2kbxtvdF1MOS9rCryi
 /7VM1QGNSC+MBi6vi/RFS2hxM5b3i+5+wr7S1Z6fXbKZKWKWdh/944tOxdvpP7kkEFh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Inzfeq1sXuNH2Lm+tHdVFULsYJqwlPXXwNULENmuYDA=; b=QGYXiFxDH404F5oeaByt4+NxUm
 PNjFGUV6ncnt5e0UVNj3Pcw4VoAU/3dmP8ygwt8pEh6qcsN/F4kYGZPjDfxWejWsd6K1dxsEjO6pH
 BbRxdrRS2gZgcFH7XS7gAhBM/6h5EG2NXkVu+CuBw6IkvepEvGaE8+ei/byUZwyeFGr8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tQ1gR-0004Bn-Ch for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Dec 2024 09:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735034309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Inzfeq1sXuNH2Lm+tHdVFULsYJqwlPXXwNULENmuYDA=;
 b=INWnWXW6c0GOx/AzSt28mVNEeYrPhukZfhY1R5UQbLgC0TQ2kOS2mJHnsu6BOF0MMiXWr2
 uGtKEsh9LvcX3bYASkI8pqw/79vWJmUfkmfJcZs5KiMbcahQNCvGzPn4sjo6eZqSXws6d9
 XaOic2cbH0PLYLXkEop7CtAitNYva/s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-IJd_m2aONS6IIiwUikwjtw-1; Tue, 24 Dec 2024 04:58:27 -0500
X-MC-Unique: IJd_m2aONS6IIiwUikwjtw-1
X-Mimecast-MFC-AGG-ID: IJd_m2aONS6IIiwUikwjtw
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2161d185f04so38561145ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Dec 2024 01:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735034306; x=1735639106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Inzfeq1sXuNH2Lm+tHdVFULsYJqwlPXXwNULENmuYDA=;
 b=wSr74AVLWmL3hZcuceTNILbwypyYEVPuWTEmBycp5KAP+L0Khl5dQkou98d39iDiEC
 QLTiEsx9vWqDGy1lKO+yZJenzKA+4k8vEcSe/Be5g8gmzJC+9Rk+B2SHQYw+prZoRVCT
 VMKTJp26A8JXRxStgPMs+wLowPvuNyIKsNtabPnPr4LAsdDnLWGVR34SGuB+uc7h5wZE
 FNaT2oWfok7vgpy5ffCAEbpXdF0T/zO+tEMfcPhgFesqtyCjgBUe8AuSuk0lyE8iO/Tz
 DKmIzf0pC5kCfEGWN4spTS650z/ufzJE/4K7vmbA740Am4KGt8w8Hy2dh0gLMgP6zukT
 BWSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcevl6TPfHNcfCpBJXriGfOiZ1Gks2mgJrPOVJWcLt75qTsThPD2VLA2oztyZdaq/PxU5VtyVGlm9NIboPUqPW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzvN4vGvkZGqVWpzujR9IQg4OkAi82qMd/vS9BihWHXUdVb+ezH
 T1s6MhhPvUsisaFqk1vepJkBDM+u6mMciqlNP4JhwV/ZiPFJP64cvTdkKB2FzMBGfgbX7lX2Ji3
 A1okKMOiTN/y+cApU85JzSI+J94x/9O7hoi9Lh+GyxgenkbnCt45jdi3G2OcC0JSbUSwmcCznbw
 4=
X-Gm-Gg: ASbGnctJ03VE9FhLbdVI6wj7Ge0I5UW8PALxiKqIj46fXpA0LkdFyPuoNr0Ipyb+MD6
 YjnZxNDEcNHy4Kh64FM5jeSf6yZ4ufKD0P1IchkNujgIRadI9CEjQjT1Varo3hjToURxCaHd2Nj
 hNxAkGBpDh4v655UEgO5vZMlAr0W1FLf6SCOb7Ow+5nlD8kq2/l4npIp/rW2Kxh9YBpWOFaChAn
 n5Cqzk7JZOQkt/B9n/rmwQcgVQPtHd/Nq+9r7LhuI8NOO4XlzI2Z3boD9/FXtgok4eIPLd2s+DM
 7NnKvjulLjXVL6shrdJT2w==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id
 adf61e73a8af0-1e5e081c8d0mr29646125637.40.1735034306588; 
 Tue, 24 Dec 2024 01:58:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQhQWgdN8z/ID1/XkVVG1F+Cp2R6jsZaHrijRdPme/htkaQtlVkt6GvWoU/Eq5c1ViULJR4g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id
 adf61e73a8af0-1e5e081c8d0mr29646098637.40.1735034306204; 
 Tue, 24 Dec 2024 01:58:26 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad848020sm9377948b3a.81.2024.12.24.01.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 01:58:25 -0800 (PST)
Date: Tue, 24 Dec 2024 17:58:21 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241224095821.ylfv622fifsk3tsv@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241221082345.196029-1-chao@kernel.org>
 <20241221082345.196029-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241221082345.196029-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lMTbMoJ4t2FSnONPF9Y17l_0yVnbUOKhpbZbrtAv4bY_1735034307
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 21, 2024 at 04:23:45PM +0800, Chao Yu wrote: >
 This patch introduce a regression testcase to check whether > f2fs can handle
 discard correctly once underlying lvm device > changes to not s [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tQ1gR-0004Bn-Ch
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs/008: test snapshot
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

On Sat, Dec 21, 2024 at 04:23:45PM +0800, Chao Yu wrote:
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
> v3:
> - rebase to last for-next branch
> - update according to Zorro's comments.
>  tests/f2fs/008     | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/008.out |  2 ++
>  2 files changed, 59 insertions(+)
>  create mode 100755 tests/f2fs/008
>  create mode 100644 tests/f2fs/008.out
> 
> diff --git a/tests/f2fs/008 b/tests/f2fs/008
> new file mode 100755
> index 00000000..b85e321c
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
> +$LVM_PROG lvcreate -L 1024m -n $lvname $vgname >>$seqres.full 2>&1

The lvcreate might be blocked by:
  "WARNING: f2fs signature detected on /dev/vg_008/lv_008 at offset 1024. Wipe it? [y/n]:"

So better to use "lvcreate -y" or "yes | ...".

Thanks,
Zorro

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

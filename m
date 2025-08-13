Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ABCB24D7D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 17:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHjmGM9jv67lQxm6c3cRryQr9VIDQfJMuDL6ES/5iCo=; b=QA2dwk+75w+dsCNLWAB+EG4XAT
	YefkkuTrqkE3t2x8/7U4vLYaNvsn34yD/pXoDkUbJmxK1P2o0Oi5kOJ+0seCwiOufSw+EKYeDeVj+
	kmVftnduFImPdygU1oG7mLrmEFH4Xl/HSY5J7lTToCSfLSmKmY7wztc5BkOaHwXcafsc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umDUc-0007Ly-Su;
	Wed, 13 Aug 2025 15:34:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umDUb-0007Lk-CB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 15:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pag5QE+HiCvWX75OLxAtakXCKsO90brfj8/L9hsgDYY=; b=Xh8bWTwMvqTZpGk+oEKhryqBEM
 QO0C0xRc6r/c2gqxwQEPHoMgy/AJ8jmxdjiocRkjJeWz+5udCgpdq5u/IwaNzpqxiMuu2vOZ3NQIu
 vRgMb1mn1m72YHjR4faRiEP1BiJ3kdyDX3+MIoVxdzdwkfd+k3v52QXI4Eh3Yi8Qx+Eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pag5QE+HiCvWX75OLxAtakXCKsO90brfj8/L9hsgDYY=; b=JmCGbKKZBiJ4aAS1OY1+RdSAsI
 4wOYu7vf3pSL5LLd+7DaFMDTgGHd8yImFwAEU00omsosyeXRJQZeaMoQ3HX0WMQf+4koATjgZ2NDg
 ZRsvczk5hZzlVApcKQzF5eK8TtQNu7C+fTNa/BYWg29b4CPmqubcA95pCEU7u+SmZj7s=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umDUb-0006ij-MK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 15:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755099255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pag5QE+HiCvWX75OLxAtakXCKsO90brfj8/L9hsgDYY=;
 b=Vp4OJyJMrG5f7JU+45aqTBtqJCuV41sJdawEP6gRlNfW4nJ0/Jj+pnOjKal2xQ8TK6ScLb
 hh5RKq8DtifqjAngV1+DMbf/o4v8NaHmZhWFQAR50uy20KVd9guZL/4lEjAoOi682qcWlz
 dMlBfw6M30B/XjtFgAB3ZadQIeqcExc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-A4g209GqOGWHx4SLfskouQ-1; Wed, 13 Aug 2025 11:34:14 -0400
X-MC-Unique: A4g209GqOGWHx4SLfskouQ-1
X-Mimecast-MFC-AGG-ID: A4g209GqOGWHx4SLfskouQ_1755099253
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4293085605so6408719a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Aug 2025 08:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099253; x=1755704053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pag5QE+HiCvWX75OLxAtakXCKsO90brfj8/L9hsgDYY=;
 b=lk+Ok0P9KtlJ1nNRnrX45NUKMXIOpS4brlMm8rwbM1n82PQkqqaHKiF0HD4tfLGqkA
 L5C4pcWSjQFwvq0onySMCsnhyGqp0W/K20OJTxEpPooKNjdUpyLHfwzWMSzG5UZ1aLEs
 8T5HQpA40pxtUHskp8cSVUR5UNAFFOo5xNcZLXbrJSx8yZ/coO/z18c4eP/XkOxlIMl0
 r9r+jskem1naAoNY3Vl5TzEAy1eKdTX7oIBOJmMkVD5di6xKEVNkMgFb6lnUJZbxFt88
 QQwYk9EIRPg3n9/OcMat1tjtnHwZ3+Caqoac2352tDGb/oHhQchjvvHkY7D6y2XTno5w
 o/2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+9VURg0KGGnPMlfeuUzsPIOTKJxsm5uM+mHFA1D9Wu3P5FmpIkHNAsRTIZT7ehmedlIjhSa21nQbI+4qt41la@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz3uLQRAtRdIfvioi/7uHrKPtvSzuiVo0Wg79BzJVi7ZUpjkrIC
 UFtP8+yOPuYuPGyu1wzTzOUkg8m0bfjzUhx9bRwzBPF98IbE8VrF5f8VIbYMzcINbTOhn0z2tiZ
 c2G3AvgBy3l5BJPbBskwjd79yyu28G/BS7m0W6TVPo0nW05Bcf2rACJswN271YfnLQTZx0otl29
 LbEClSwesNQmw=
X-Gm-Gg: ASbGncufiiNGuoDgcnBQ6JVGgVXb4FBHfYS762HedRyE5Ec9Sgq3H288MIC/E79gRiO
 fGtgqhHsUx6A485cvbONPt0PBsotn0LvEe4jCyeh18BWmml+FJXgEEFh9WwYhC6IkXqvvLJ/j27
 DYGADH6ki9AS9vsoBj6lBW3ZrQWByMPAMzxeQaRFpyQ/ZPejmLoF1G+xQWNogwbSubSiWURxvw3
 mvGW7QFpPPAMR9yJapE6vNPcyeRBP7SV17SOuoX0s4lnmfT1DUegYzoZUh2TX49lRaDyHYRDxmE
 TqiaLvq+87BdetPmXAFFMpMK3DvzR0rKGqiohzEVQBEdS3Zebwv36uC3Nx0QdrwWkbkMwf3lAoL
 GAIpD
X-Received: by 2002:a05:6a20:5491:b0:23d:ac50:3339 with SMTP id
 adf61e73a8af0-240a8b501b9mr6527624637.29.1755099253045; 
 Wed, 13 Aug 2025 08:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWhZ+vun122BU6gTYyKkDtgHjV7RxtoofcOawSJj065vUnyH6vWTSz4pE7zBE/XIQ1Jd1Lkw==
X-Received: by 2002:a05:6a20:5491:b0:23d:ac50:3339 with SMTP id
 adf61e73a8af0-240a8b501b9mr6527568637.29.1755099252612; 
 Wed, 13 Aug 2025 08:34:12 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfcf523sm32268158b3a.90.2025.08.13.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:34:12 -0700 (PDT)
Date: Wed, 13 Aug 2025 23:34:07 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250813153407.b2ldb3u3zuw4ckbs@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250811094415.1053545-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250811094415.1053545-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b7U-PmVhUBJ1OlOntmUPmx_IlcFLKkuBGVFYUY7Qyic_1755099253
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 05:44:15PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create directory > 2. add a new xattr entry
 to create xattr node > 3. use inject.f2fs to inject nid of xattr [...] 
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
X-Headers-End: 1umDUb-0006ij-MK
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs/020: do sanity check on i_xattr_nid
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

On Mon, Aug 11, 2025 at 05:44:15PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create directory
> 2. add a new xattr entry to create xattr node
> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> 4. check whether f2fs kernel module will detect and report such
>    corruption in the file
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/020     | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/020.out |  2 ++
>  2 files changed, 52 insertions(+)
>  create mode 100755 tests/f2fs/020
>  create mode 100644 tests/f2fs/020.out
> 
> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> new file mode 100755
> index 00000000..a6a08c8f
> --- /dev/null
> +++ b/tests/f2fs/020
> @@ -0,0 +1,50 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/020
> +#
> +# This is a regression test:
> +# 1. create directory
> +# 2. add a new xattr entry to create xattr node
> +# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> +# 4. check whether f2fs kernel module will detect and report such
> +#    corruption in the file
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +_cleanup()
> +{
> +	_scratch_mkfs >> $seqres.full
> +}
> +
> +_fixed_by_kernel_commit 061cf3a84bde \
> +	"f2fs: fix to do sanity check on ino and xnid"
> +
> +export MKFS_OPTIONS=""
> +_require_scratch

Same review points with patch 2/3, 

> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +testdir=$SCRATCH_MNT/testdir
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount "-o user_xattr,noinline_xattr"
> +
> +mkdir $testdir
> +# add a new xattr entry to create xattr node
> +setfattr -n user.abc -v 123 $testdir

You can call `_require_attrs user` at first, then use "$SETFATTR_PROG"

> +
> +_scratch_unmount
> +
> +# inject i_xattr_nid w/ nid of inode node
> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
> +
> +_scratch_mount
> +mkdir $testdir/dir >> $seqres.full 2>&1

May I ask what kind of failure will this case hit, if there's the bug?

Thanks,
Zorro

> +_scratch_unmount
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
> new file mode 100644
> index 00000000..20d7944e
> --- /dev/null
> +++ b/tests/f2fs/020.out
> @@ -0,0 +1,2 @@
> +QA output created by 020
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

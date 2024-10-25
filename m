Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C64DD9AF8C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 06:11:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Bfg-0001dK-Si;
	Fri, 25 Oct 2024 04:11:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t4Bff-0001dD-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 04:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3C6auYKzVKIpEFES/i+1K0CJmzvBwKiBfR6b6wIFhXE=; b=Fd/Q1bIuNqX9yyO0oRXnOa1MCk
 m60UN68B4mTcz0cKlZ94ynkEZm8dv6luSHD4HAKpQw7EFry2OyPV8Ulg3VrA6KplNskxBiDRKzOCt
 pTwonKaUIrlSklO2Glqy8spOt7SQ9+nQdN0tIPwBQeqIbVXVCSVdDW3+PifsgtTdEx1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3C6auYKzVKIpEFES/i+1K0CJmzvBwKiBfR6b6wIFhXE=; b=L6jy9e8C7stWlNA8I2odUsOLdi
 io54vG2vV5msevh1OVVEMSAataEpLYznbx1ic7arTNUgkup1P9tfpY+DoCgQVI6EIRZGVipXV1Gks
 81BHdBo7+2skNyz6Lt8vrfiZeTrMA5wAoE85HGx20CNaT8qcLM9dqXkQ0oFdOX2cbF58=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Bfe-000386-50 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 04:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729829484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3C6auYKzVKIpEFES/i+1K0CJmzvBwKiBfR6b6wIFhXE=;
 b=E14iR4XFXqABFrQpogdWfgMTrrBWz5z7bl0TwzoTBlcpaiyZ/9FiEvjHH4Qu9OVo5Rs0Z+
 DA3NSIZpMXyGqASr1encPExU2+vZEUaIvjST68JsmKI2shu/8ZpQtpT44jo4moZeP1KWRa
 DBhpHiQtWY9CCblc3DaIA/wFmv8EtBE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-Y8iC84XVOsWEOT8f_u1cfw-1; Fri, 25 Oct 2024 00:11:21 -0400
X-MC-Unique: Y8iC84XVOsWEOT8f_u1cfw-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2e2bb354e91so1633982a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 21:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729829480; x=1730434280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3C6auYKzVKIpEFES/i+1K0CJmzvBwKiBfR6b6wIFhXE=;
 b=NI7s8BPl6UiP8oUNgqBkK88Lxhye2dKnsqXwsdxZd4s6W0e7vF1MkoXH07LX2hK62D
 p6/6Wwva5iklFKdmKyVu3bN21o7/haUNXSH04WlIgA7p65Xpc1K0QuE5N51YZ66YGTBi
 3osa01q41JWLWUKGMTBtDwbzVKbJ3oG4cG+Xxtqtf0oxDWP5fb6W6ucxFqRW8TJv9g4k
 f+6EkdbVSaz5KItFhSEbb94J2KmHjaTpy5NgISrw/eCJzrq7bT7YkJ+7pdTLPUrrom2y
 eHssc7PoL7oGBTldMChJXc5mV84OY9EQjNCmcePmdhCv+fZQixnOrU7dTIJEoDbVmVRU
 KRFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIS0wDyGzSzgb4VPsy21M9rbdspkBBrO3QBmelMlwFvAxzUaSTaVzufpClvYx2hh6GEXO67nSjXHn1ZYAISsNb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzCxEBsDzTrOL0hLdkFRHzDXRMBVnTP+Le0YBAAQL0sEAa+Lom+
 MJ0iWGh9IIDiB85MkJ/kxzlIoSMc5sUNiaaW7KAkQAFY4HMj85DC6VxS44EWd+EcvEYLs5CFnY5
 hW0JnxVDGN3FdmsEe3tLwevP6826iIE+bMqpux7be0dXfK1n4Z9xiqZ43FuvsXW0TUh760bXN6D
 w=
X-Received: by 2002:a17:90a:d512:b0:2e0:921a:3383 with SMTP id
 98e67ed59e1d1-2e76b5bbd39mr9869281a91.1.1729829480530; 
 Thu, 24 Oct 2024 21:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtLxfla3FbB1McVSJoKWugUU11IDzU9KFpry60sKdXTkr7/Qylp9lAFDxB9cSVApc4jHKOjg==
X-Received: by 2002:a17:90a:d512:b0:2e0:921a:3383 with SMTP id
 98e67ed59e1d1-2e76b5bbd39mr9869267a91.1.1729829480205; 
 Thu, 24 Oct 2024 21:11:20 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3749154sm322326a91.46.2024.10.24.21.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 21:11:19 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:11:15 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241025041115.fmv2wt7qy6s55hip@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241012101501.377899-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241012101501.377899-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Oct 12, 2024 at 06:15:01PM +0800, Chao Yu wrote: >
 This patch introduce a regression test to check whether f2fs handles > dirty
 inode correctly when checkpoint is disabled in a corner case, > [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Bfe-000386-50
Subject: Re: [f2fs-dev] [PATCH] f2fs/005: add testcase to check checkpoint
 disabling functionality
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
Cc: Qi Han <hanqi@vivo.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 12, 2024 at 06:15:01PM +0800, Chao Yu wrote:
> This patch introduce a regression test to check whether f2fs handles
> dirty inode correctly when checkpoint is disabled in a corner case,
> it may hang umount before the bug is fixed.
> 
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/005     | 59 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/005.out |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100755 tests/f2fs/005
>  create mode 100644 tests/f2fs/005.out
> 
> diff --git a/tests/f2fs/005 b/tests/f2fs/005
> new file mode 100755
> index 00000000..4faf1bb9
> --- /dev/null
> +++ b/tests/f2fs/005
> @@ -0,0 +1,59 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/005
> +#
> +# This is a regression test to check whether f2fs handles dirty
> +# inode correctly when checkpoint is disabled, it may hang umount
> +# before the bug is fixed.

Is this a duplicated test of another patch from you?

https://lore.kernel.org/fstests/20241025034413.5s6ecilfgqcoeudt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/T/#t

Or just similar?

If this's a different test ...(see below)

> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_cleanup()
> +{
> +	rm -f $img
> +	rmdir $mnt
> +	_scratch_unmount >> $seqres.full
> +	cd /
> +	rm -r -f $tmp.*
> +}
> +
> +_require_scratch
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +img=$SCRATCH_MNT/f2fs.img
> +mnt=$SCRATCH_MNT/f2fs.mnt
> +testfile=$mnt/testfile
> +tmpfile=$mnt/tmpfile
> +tmpdir=$mnt/tmpdir
> +
> +mkdir $mnt
> +dd if=/dev/zero of=$img bs=1M count=50 2>/dev/null
> +$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
> +sync
> +
> +# use mode=lfs to let f2fs always triggers OPU
> +mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt

You can use _scratch_mkfs_sized, don't need a loop device.
And without the loop device, above _cleanup is not needed either.

> +
> +dd if=/dev/zero of=$testfile bs=1M count=5 2>/dev/null
> +mkdir $tmpdir
> +touch $tmpfile
> +sync
> +
> +# it dirties tmpdir inode by updating ctime,
> +# but it doesn't moving the inode to gdirty_list.
> +mv $tmpfile $tmpdir
> +
> +# it runs out of free segment
> +dd if=/dev/zero of=$testfile bs=1M count=5 conv=notrunc conv=fsync 2>/dev/null
> +
> +mount -o remount,checkpoint=enable $mnt
> +
> +# it may hang umount if tmpdir is still dirty during evict()
> +umount $mnt
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/005.out b/tests/f2fs/005.out
> new file mode 100644
> index 00000000..caa3c880
> --- /dev/null
> +++ b/tests/f2fs/005.out
> @@ -0,0 +1 @@
> +QA output created by 005

If nothing output, please:

echo "Silence is golden"

Thanks,
Zorro

> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

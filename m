Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29EC60187
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Nov 2025 09:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7YI2h+KdBuUt1pnvNW5Ne8Ab/E9nnS+4O7Jvd2Y5sU=; b=TJLeluTaHvdKJrgzwH+CZNtWab
	kwNmWOztMeR5vRgpPSxmuwRQ33mE76JSL+3tlHls+XV3SdkELSszszOtFaccq9ZU0SxqJGi7KZjBy
	/J8FVCWjAtFNxXCiGMh5XzjHHckvhuz4y5s9zSsSZw9cbhYCMov6UrazsA8THUsF0RQE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKBUJ-0001Fd-Fv;
	Sat, 15 Nov 2025 08:18:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vKBUI-0001FX-3l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 08:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n7bf5Bnu1+cJTU3MNQCIInMCMWTaSYkxe5porpErsmA=; b=i3y+PSFDP75HdyDultIW6ZKczY
 CdxwMZX227RyOUABvVI/cbNgzmiXnVlgPEukellheXS1O8bwv9BW6VmslUE5GxWU+rFiSWpVCZTEh
 Rx3arfjBaXKcIrUIgoV9xZwll0L1M0RpRC0FWuAP+KRiTzY30LhQKePBpfL6hWqGBkvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n7bf5Bnu1+cJTU3MNQCIInMCMWTaSYkxe5porpErsmA=; b=Czhj2+PPPDEmHRI+9XUleKaLTj
 s6Fcn0GdlX1+DhCy3i75XSK9q1dU4gD9hYmSLaoTqQxpspc+HFQiyaNFtW2tbN0g7L9op/HwXyxlr
 VTkVH9fF2vxh2aU/Ngk7HMV8c/gkn6mi1gY0+wCOMsNPNqZdVR0n5B56kvgMxNirJ1s0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKBUH-0000US-Km for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 08:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763194699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n7bf5Bnu1+cJTU3MNQCIInMCMWTaSYkxe5porpErsmA=;
 b=G+znXAptfPd5dbAPEUDBI0cop6dH1399Ppj0Fi6sfSj11cxjqEMNPR4D4tLkK9x06Z+G7D
 g5EyGJH+7E18WaLMmSomDWovs+woWGAzl64/I3jWN/pK5wJp3xsl8iYK+yYlzH2sPvN1e9
 6b5Lz/OQe0bIvFyEqLvvMeNOPW2pH/Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-aZ5VFYjxN0GxrZ5N8rpACQ-1; Sat, 15 Nov 2025 03:18:18 -0500
X-MC-Unique: aZ5VFYjxN0GxrZ5N8rpACQ-1
X-Mimecast-MFC-AGG-ID: aZ5VFYjxN0GxrZ5N8rpACQ_1763194697
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-343823be748so3508168a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 15 Nov 2025 00:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763194697; x=1763799497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7bf5Bnu1+cJTU3MNQCIInMCMWTaSYkxe5porpErsmA=;
 b=ldn60KTR5YYQTn4oNfR2IAOap3rPVnnTbDr33T1FILLyqgs1JQEUUjknFhi22DGbeM
 C/X4YlCh/IgqIArywTO4sWGhieWfF4ddtFWru0AwIv7I+Zy7HM3bI3GKO54sutrYIObp
 CrpSMOGt3fTdVyPNXU/wAHxCr9DRFOBYHDXwfs2ge2clEKYKr6gOhB8c5yuifylCOxEP
 V3/R5YNGYRW/dbf4oKj9Y8jXaLuv60XLV5iyB90FVz3o/32wFLaWVaezNz84jPZllHbP
 Cmy+prFOviz15CxvdH11/cF3bRzQG6a8WR9l7z1RaqobfOkeCylQWKVWyCXqvABRAin6
 s7nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJPfLt559zlRJMyXoihJXdxf2mVA0V26dwS8/efJl8XmqULGv1zSOUnUgSvhlrs3OMD4CozU3KClF/url1Qo+H@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy+2VIeXYYTEZHYyvLcGTewsyMExsyjiRQZMuoLpal6BP6Ig3xm
 LFCTl/2K2ktY//rGsdgJA/lgZH8MaEvrO9oimyou5CTF/5EoVyQlIdTRL5ktZksyx9oA7Dz0JTA
 xNriwcmu4MV/ZwUByc6M4cFjb/goIDYkvxg3qaqYJZV1uZCj75JHJBDwFQSp4mmrYSg4/qutSKv
 XRKZdkz1/Jtug=
X-Gm-Gg: ASbGncuGt0xRBLSWdqDxeZCwrss+0BH6L6bGghgqtTr1ioexfloopRrGrgdXEa/N+a3
 kNDwiYn0C2xpe+gD52CIUVnw5CUdphPaILxH6s3GddW7YXS9JZM985GQ4X9YSel1Okr2YjuXewY
 0212D30/Epv4wstN6kzH7PfUMIeebC8b/p4quLXwbvI/DuFUixqa3KQ5Nh09t7O14+YGz+7azW2
 Q4mrrN3gUsG1Ixi8YyKgRmsGBWDNUiyewWLkz7gofx4iw5QHCd3VVx4xOlDvbjhP8zp9y65Vb+2
 y30h6QaomH2SSDS+7JSHmSomSbzk68uxTfOrosNI3TaaX0JxSO/fpjuoyTPtnFTb6W0gmD6m29v
 /KHV69XVwwCOK0+EYcLP8lMBRZtGbcGwdYMAjxELsaMnFNvNhmA==
X-Received: by 2002:a05:6a20:7f87:b0:334:8a8e:6576 with SMTP id
 adf61e73a8af0-35ba228f8e2mr8001341637.29.1763194696860; 
 Sat, 15 Nov 2025 00:18:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm3jNhItrsq5XSCCWPdNgXWrq4w0xGBjTpGBAfgkZ0XRyViROmnMGuL0JOBHbUiGsqCaS+FQ==
X-Received: by 2002:a05:6a20:7f87:b0:334:8a8e:6576 with SMTP id
 adf61e73a8af0-35ba228f8e2mr8001320637.29.1763194696355; 
 Sat, 15 Nov 2025 00:18:16 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b924aeedb3sm7273038b3a.10.2025.11.15.00.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 00:18:15 -0800 (PST)
Date: Sat, 15 Nov 2025 16:18:11 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251115081811.iebaqc2ubh7li3ux@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251103062143.2657116-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251103062143.2657116-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KnnANmGJcrvRk4RJMKvP9WGzbiW8iAXPzjQmKwzfQOk_1763194697
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 03, 2025 at 02:21:43PM +0800, Chao Yu wrote: >
 After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on >
 i_inline_xattr_size"), 
 f2fs should handle corrupted i_inline_xattr_si [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vKBUH-0000US-Km
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/023: test sanity check condition w/
 error injection
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

On Mon, Nov 03, 2025 at 02:21:43PM +0800, Chao Yu wrote:
> After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on
> i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
> correctly, let's add this regression testcase to check that.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - use _filter_scratch to filter scratch mountpoint
> - check output message of inject.f2fs rather than return value
> - add _require_attrs
> - add f2fs/023 to attr group
> - fail testcase if mkfs failed
>  tests/f2fs/023     | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/023.out |  2 ++
>  2 files changed, 51 insertions(+)
>  create mode 100755 tests/f2fs/023
>  create mode 100644 tests/f2fs/023.out
> 
> diff --git a/tests/f2fs/023 b/tests/f2fs/023
> new file mode 100755
> index 00000000..33108421
> --- /dev/null
> +++ b/tests/f2fs/023
> @@ -0,0 +1,49 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu <chao@kernel.org>
> +#
> +# FS QA Test No. f2fs/023
> +#
> +# This testcase tries to inject fault into inode.i_inline_xattr_size,
> +# and check whether sanity check of f2fs can handle fault correctly.
> +#
> +
> +. ./common/preamble
> +. ./common/attr
> +. ./common/filter
> +_begin_fstest auto quick rw attr
> +
> +_fixed_by_kernel_commit 5c1768b67250 \
> +        "f2fs: fix to do sanity check correctly on i_inline_xattr_size"
> +
> +_require_attrs
> +_require_scratch_nocheck
> +_require_inject_f2fs_command node i_inline
> +_require_inject_f2fs_command node i_inline_xattr_size
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +_scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full || _fail "mkfs failed"
> +_scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
> +touch $testfile
> +_scratch_unmount
> +
> +# inject .i_inline field: clear F2FS_EXTRA_ATTR bit
> +output=`$F2FS_INJECT_PROG --node --mb i_inline --nid 4 --val 0x1 $SCRATCH_DEV`
> +echo "$output" >> $seqres.full
> +echo "$output" | grep "unknown or unsupported member" && _fail "i_inline is unsupported"
> +
> +# inject .i_inline_xattr_size field from 512 to 2048
> +output=`$F2FS_INJECT_PROG --node --mb i_inline_xattr_size --nid 4 --val 2048 $SCRATCH_DEV`
> +echo "$output" >> $seqres.full
> +echo "$output" | grep "unknown or unsupported member" && _fail "i_inline_xattr_size is unsupported"

I think we might need a common helper to do f2fs injection and return
error if injection fails, if F2FS_INJECT_PROG always can't return error
properly. Anyway, that's another story. For this patch:

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +
> +_scratch_mount
> +
> +$GETFATTR_PROG -n user.test "$testfile" 2>&1 | _filter_scratch
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/023.out b/tests/f2fs/023.out
> new file mode 100644
> index 00000000..f9635d38
> --- /dev/null
> +++ b/tests/f2fs/023.out
> @@ -0,0 +1,2 @@
> +QA output created by 023
> +getfattr: SCRATCH_MNT/testfile: Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

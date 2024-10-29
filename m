Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3D9B4225
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 07:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5fQ7-0006xf-TU;
	Tue, 29 Oct 2024 06:09:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t5fQ6-0006xM-03
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wayk9Uaz9R4LPhk6DPxYh53zbwDTJRdC1Q80mX7VWuE=; b=P1Os+wXNXfolXy9OtZcXkQCx/n
 9jedkFpaAF9Kb9Tf8BmZGCFrvDiJXfzctRR1+S4hivVC6ld2xBIXPU435pqObuaL5wI1Bmhr/FMTS
 LKzipfVVJzJc+Yt2Wv6J8V2Ff+08KjLWSzJ1i1m0aaheYXJCoAt9+7F+ZRXZ3/iZdoeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wayk9Uaz9R4LPhk6DPxYh53zbwDTJRdC1Q80mX7VWuE=; b=i+LSUNNwJ9+mg4V2y9K8J6hFat
 fGRBdMh6M7vAR7LHy2YpkhNdY4JyZ+YUg25zuzXF0WSPWhCjJMIiqrwicTuCG4iLR9TbRK19SV5ml
 iI+/nTB6Yer9FU6Vln6me8kLbSw4mL++vwzMx3BCdFGKHDGHtvDFpoIHqwRzk3jejFkc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5fQ4-0003ql-7W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730182166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wayk9Uaz9R4LPhk6DPxYh53zbwDTJRdC1Q80mX7VWuE=;
 b=MnmAkESy31cHhUEuK2IsIh2uKyT6NG+u806lgkVU3IV2lX8zR58foBtd9Lmampo8nrKNPU
 plHnjYsTTdUfISqa/+U+Wq4tb8mSNDNC/UZD1GFEvHq80vc8QhYjhuNmsZ1QLGAM7A3VbI
 U3UtdgLGIwbU6ggM/WNM0qRd0E4aopw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-FT0xOk_bPO2fQ87ZKhaS4w-1; Tue, 29 Oct 2024 02:09:24 -0400
X-MC-Unique: FT0xOk_bPO2fQ87ZKhaS4w-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-20c9673e8cdso50575255ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 23:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730182163; x=1730786963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wayk9Uaz9R4LPhk6DPxYh53zbwDTJRdC1Q80mX7VWuE=;
 b=ZXP22A+yeTygNHEUcRk3SOv3mc6SzeGmIEWz4pecusF3CbTRMVx6Q5lX41B/sJElYN
 37zzd4cMqCc4yfadC4+Iz/QdAhynwUMj/N8EZLd5CV3tudRFC76+cLTvtIbcHdPb1Cyc
 kzhOwInkcjZzSaJhlkTuLyZCH/OTcsKFy9Oo23RMZi6lpOTb7zUWHmeTLkBditauhM3e
 qx8sfoFEzNIEr3EjXJAYOElL3L1F6JGfEA2g0ovTkiBpuC1cCs1ad2CiKalb7WPs2CEt
 VWMIhZNZrwzqvMh5ZObWtj/ivCf4F1TNG/3KMj+jfUPtwXvbIYL/ksb2MtL2G5B/FeD3
 DcYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnrDfG08GDKzggHEWaEQll64uZn1hI90DuYDW3yGTayTeDDuKWqrARVKNzPSbfxYVGZ4qAuBx5hCgyH7FyHNNs@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxb4xpoZyMHUGF13cY+EZpergYCDf93mLZGv87LYnp6++WtkBIf
 XMSDxLBeOJBWzUUa65hPgXvSKJbPg40njgbDALFiWU7koff9FmPkBof+u3McwZuEgtnxbhHUm5N
 mCHwvy9co7MD+Cc4evlty5BleZ7UrL9TZDx1ukyl3fJiKgHnwKPu/myrIG/h5Sr90pZZq3ymmty
 5KI8G8a8fBdg==
X-Received: by 2002:a17:903:2287:b0:20d:284c:8d54 with SMTP id
 d9443c01a7336-210c6c1f299mr167698935ad.34.1730182163542; 
 Mon, 28 Oct 2024 23:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3FutxUB3sGN6kqlmFHFBtNNulPOXFb+Y/zWBfzmZD+BgSgN4ehflCGx7ewzqa4rw4Rrrkhg==
X-Received: by 2002:a17:903:2287:b0:20d:284c:8d54 with SMTP id
 d9443c01a7336-210c6c1f299mr167698715ad.34.1730182163200; 
 Mon, 28 Oct 2024 23:09:23 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc0492f8sm59652885ad.256.2024.10.28.23.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 23:09:22 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:09:19 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241029060919.gxyywjp3gykaqnuc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241028141800.1788356-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241028141800.1788356-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 28, 2024 at 10:17:59PM +0800, Chao Yu wrote: >
 This is a regression test to check whether f2fs handles dirty > data correctly
 when checkpoint is disabled, if lfs mode is on, > it will trig [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5fQ4-0003ql-7W
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs/006: add testcase to check
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

On Mon, Oct 28, 2024 at 10:17:59PM +0800, Chao Yu wrote:
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
> v3:
> - explain more about behavior on kernel w/ different config
> - use _filter_scratch to filter $SCRATCH_MNT
>  tests/f2fs/006     | 42 ++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/006.out |  6 ++++++
>  2 files changed, 48 insertions(+)
>  create mode 100755 tests/f2fs/006
>  create mode 100644 tests/f2fs/006.out
> 
> diff --git a/tests/f2fs/006 b/tests/f2fs/006
> new file mode 100755
> index 00000000..f9560b2b
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
> +# Import common functions.
> +. ./common/filter
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
> +# it may run out of free space of f2fs and hang kernel
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync 2>&1 | _filter_scratch
> +
> +_scratch_remount checkpoint=enable
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> new file mode 100644
> index 00000000..2dc9efda
> --- /dev/null
> +++ b/tests/f2fs/006.out
> @@ -0,0 +1,6 @@
> +QA output created by 006
> +50+0 records in
> +50+0 records out
> +dd: error writing 'SCRATCH_MNT/testfile': No space left on device
> +3+0 records in
> +2+0 records out

Hi Chao,

One more question about this patch.

I'm wondering can this output always be matched? If the test doesn't care the dd output,
you can filter out them, to avoid it break golden image. Especially the second one, can
you be sure it always "3 in and 2 out" before returning ENOSPC?

Thanks,
Zorro

> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

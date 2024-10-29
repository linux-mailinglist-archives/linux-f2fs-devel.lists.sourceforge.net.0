Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DE9B4515
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 09:58:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5i32-00039s-A5;
	Tue, 29 Oct 2024 08:57:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t5i2x-000383-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 08:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+VK9FfkQO2fpVwYxdxEEmHb9xMJtqTdpcSiRIzUgN0=; b=CH74DwxfMBrBIptE5Ta+CHsLgA
 wi3xvxHOToGraKE8UrEFfSz8qJxarWr2A1cBy6BMEFtqPC/wrnxKn4uPHQVyNKuR250zlYBZZUNKM
 Gn2p0GCd21E6J0J19XhpAJwxzW5pkIjsqZyD2K844QNkZCD8XKuJi4Pvw6YdA5piQCA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7+VK9FfkQO2fpVwYxdxEEmHb9xMJtqTdpcSiRIzUgN0=; b=BzAqLmEkPLwAQ9c6g7gt53PqJt
 gYlqPLHvR8Wx/NZKn6ys8eSBNw6h7EvJBbch5YLWBlQXDDzyeEgSh2sB95fxryxQGppDiLHqYVT8w
 MQZHPgnQsz/MmFwwYS76OSXI9nCIPYT1rUKOoY54cv8NFSfxq/+moVDFCO3n9RlTXyl8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5i2w-0006wa-MF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 08:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730192264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+VK9FfkQO2fpVwYxdxEEmHb9xMJtqTdpcSiRIzUgN0=;
 b=fG9EFEK8pNI8jWkSNhOZclsJnGezZy75yAL8LkqpU3Fjle0THxCw3T8iJaoIa4YE6U1vqx
 m6MM9+HTm34b6V047WrgaHi2KTyG9HSrpPqySfYWJNj9PGsJVqWeIezEEpQXiNSBk4jiMo
 xFW5KjecZV5Hr5zfJRzERKknbGnPOYo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-nxyVcAHXMN-nHls-5SPXvA-1; Tue, 29 Oct 2024 04:57:43 -0400
X-MC-Unique: nxyVcAHXMN-nHls-5SPXvA-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-20ca0a58524so59513975ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2024 01:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730192262; x=1730797062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+VK9FfkQO2fpVwYxdxEEmHb9xMJtqTdpcSiRIzUgN0=;
 b=AYsuciNJmeGLLQJtco92UnYi4bPIEOJ2yzEzA/pUObwI+KS/kBrxIq+EZHvB/l54zL
 7t6op4tdzyFWHx3nQIj7wvzRMOFZgRZZxtAO8LQCjSIvUGxNTQEtFF4QhqDJ39IiesTr
 5B7cb88OwcDKRVTinRTRdP3BCqa6ecqLLpPix0L8LLMTG0quRHiAkpXzIZe8G7RlQshq
 m5Uwg7WUnpl7fs4GQeK77/5vPhzzC0uDPCJN2EpKg/DY97ZH4xkbFOCgbcPF9dbUVIGc
 ngooIMsIvbQLXUN/kMufnS+SMs1wRkUil7PAXmIKxuxNlaLct07CeulV+gubTy9Njrx3
 8l5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnsA+mg++ddxfaxwTwD98Zmx1bqD0VszPxcURZH9qB/0s/UeyThS5Z6zOk9mAKPrfzuYykfEZiOoxtEJa2zyw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzeA7+Z5xD3ksieWkOvRw2sXnWm7G/H1IcwhbACdpb8OGlDqLWE
 /PaV1/EHOQXnmKARdf31w1K6k/QP9w70WCSlJ07vY7u9G7yvXS0Po55Zr6wJJukh2VHLYnLMzpW
 JZ0apLSPhvSk1ANpxyBYSSF2qnDMJm2YEBjx7DOewaM0oEOxmCd01RRA+T14yLS2ipvlkaaCLWl
 w=
X-Received: by 2002:a17:902:f612:b0:20c:8f78:67be with SMTP id
 d9443c01a7336-210c6c3e341mr176223335ad.40.1730192262148; 
 Tue, 29 Oct 2024 01:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcZsIOTrd+Iy1sZfJI5vYbW2mYAaKN3wSCAZMYb14CDeMLJcPOxxhhj42zywedf0qGGvPQ3w==
X-Received: by 2002:a17:902:f612:b0:20c:8f78:67be with SMTP id
 d9443c01a7336-210c6c3e341mr176223205ad.40.1730192261813; 
 Tue, 29 Oct 2024 01:57:41 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf702f1sm62297555ad.105.2024.10.29.01.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 01:57:41 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:57:35 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241029085735.equs7ce55lcelgff@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241028141800.1788356-1-chao@kernel.org>
 <20241029060919.gxyywjp3gykaqnuc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <324c9b1a-ca86-43a4-8c3a-990199c714bc@kernel.org>
MIME-Version: 1.0
In-Reply-To: <324c9b1a-ca86-43a4-8c3a-990199c714bc@kernel.org>
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
 Content preview:  On Tue, Oct 29, 2024 at 03:46:21PM +0800, Chao Yu wrote: >
 On 2024/10/29 14:09, Zorro Lang wrote: > > On Mon, Oct 28, 2024 at 10:17:59PM
 +0800, Chao Yu wrote: > > > This is a regression test to check [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5i2w-0006wa-MF
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

On Tue, Oct 29, 2024 at 03:46:21PM +0800, Chao Yu wrote:
> On 2024/10/29 14:09, Zorro Lang wrote:
> > On Mon, Oct 28, 2024 at 10:17:59PM +0800, Chao Yu wrote:
> > > This is a regression test to check whether f2fs handles dirty
> > > data correctly when checkpoint is disabled, if lfs mode is on,
> > > it will trigger OPU for all overwritten data, this will cost
> > > free segments, so f2fs must account overwritten data as OPU
> > > data when calculating free space, otherwise, it may run out
> > > of free segments in f2fs' allocation function. If kernel config
> > > CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
> > > dd may encounter I/O error.
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > > v3:
> > > - explain more about behavior on kernel w/ different config
> > > - use _filter_scratch to filter $SCRATCH_MNT
> > >   tests/f2fs/006     | 42 ++++++++++++++++++++++++++++++++++++++++++
> > >   tests/f2fs/006.out |  6 ++++++
> > >   2 files changed, 48 insertions(+)
> > >   create mode 100755 tests/f2fs/006
> > >   create mode 100644 tests/f2fs/006.out
> > > 
> > > diff --git a/tests/f2fs/006 b/tests/f2fs/006
> > > new file mode 100755
> > > index 00000000..f9560b2b
> > > --- /dev/null
> > > +++ b/tests/f2fs/006
> > > @@ -0,0 +1,42 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. f2fs/006
> > > +#
> > > +# This is a regression test to check whether f2fs handles dirty
> > > +# data correctly when checkpoint is disabled, if lfs mode is on,
> > > +# it will trigger OPU for all overwritten data, this will cost
> > > +# free segments, so f2fs must account overwritten data as OPU
> > > +# data when calculating free space, otherwise, it may run out
> > > +# of free segments in f2fs' allocation function. If kernel config
> > > +# CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
> > > +# dd may encounter I/O error.
> > > +#
> > > +. ./common/preamble
> > > +_begin_fstest auto quick
> > > +
> > > +_fixed_by_kernel_commit xxxxxxxxxxxx \
> > > +	"f2fs: fix to account dirty data in __get_secs_required()"
> > > +
> > > +# Import common functions.
> > > +. ./common/filter
> > > +
> > > +_require_scratch
> > > +_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
> > > +
> > > +# use mode=lfs to let f2fs always triggers OPU
> > > +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
> > > +
> > > +testfile=$SCRATCH_MNT/testfile
> > > +
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
> > > +
> > > +# it may run out of free space of f2fs and hang kernel
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync 2>&1 | _filter_scratch
> > > +
> > > +_scratch_remount checkpoint=enable
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> > > new file mode 100644
> > > index 00000000..2dc9efda
> > > --- /dev/null
> > > +++ b/tests/f2fs/006.out
> > > @@ -0,0 +1,6 @@
> > > +QA output created by 006
> > > +50+0 records in
> > > +50+0 records out
> > > +dd: error writing 'SCRATCH_MNT/testfile': No space left on device
> > > +3+0 records in
> > > +2+0 records out
> > 
> > Hi Chao,
> > 
> > One more question about this patch.
> > 
> > I'm wondering can this output always be matched? If the test doesn't care the dd output,
> > you can filter out them, to avoid it break golden image. Especially the second one, can
> > you be sure it always "3 in and 2 out" before returning ENOSPC?
> 
> Zorro,
> 
> I got your concern, how about using _check_dmesg to catch the kernel
> bug instead? since once the bug was triggered, f2fs will call BUG_ON
> or WARN_ON optionally anyway.

Hi Chao,

The _check_dmesg is always called at the end of each test. Except you
need a dmesg filter, or you don't need to call it manually.

My concern is "unstable output cause unexpected failure on fixed kernel".
If you think the last "dd" output is unstable and useless on fixed kernel,
you can filter it out, just let the dmesg/hang break the test.

e.g.

  # The 2nd dd might run out of space, and trigger a kernel warning or hang on
  # unfixed kernel
  dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync >/dev/null
  dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync 2>&1 >/dev/null | _filter_scratch

or if you feel the error output isn't stable either, you can:

  # The 2nd dd might run out of space, and trigger a kernel warning or hang on
  # unfixed kernel
  dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync >>$seqres.full
  dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync >>$seqres.full 2>&1
  ...
  echo "Silence is golden"

Or if you need those output, please make sure it's a stable output on any fixed
system :)

Thanks,
Zorro

> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> > > -- 
> > > 2.40.1
> > > 
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

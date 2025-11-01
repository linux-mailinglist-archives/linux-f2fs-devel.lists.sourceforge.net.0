Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CAC28152
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 16:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLUH8YICNCewWlLPVTXk2SyiOv7nGx9LbUe6EG5YBE0=; b=JjG5raLq1TBGFBLSPzffIKaQNN
	5xZEscYKeKFkxdKQrGeZqu3giEH334JhqgXxS0NgQN6ATVVRf9HdTfjoppQgOlsNGCEGY7tz/tduv
	HeYdmHQMW3WFhKxUguOdJoBl3q+zd+jgptvJl3yuwWOyRnZ4fMfAIwpJnPxxvi5htByE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFDST-0003s8-Qn;
	Sat, 01 Nov 2025 15:24:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vFDST-0003rs-4o
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 15:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qyPXImxXazHny8jsMFSxmes8gpi0WI65WL50eQDN24s=; b=URuVsL8lk/Wg1oZITHB/Xc+WVO
 WhsDILGDL3TCA3I3j2XXPiyN80PI1jhYr/NLMgKhIE1yr0ZRYvzoisE6KAtIx1vklFXhHCeUDfemw
 bo0IuEeKLXhvYjHUgzTY+JqmHQDmLE9KFMrJBwjdSiauTWBWAHr6cffaeuWnjActmCcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qyPXImxXazHny8jsMFSxmes8gpi0WI65WL50eQDN24s=; b=DVmHaop8ENfM5hRUKx2MmW4b/v
 JYyjQnkYx+uhxg6x90YXzUQ5t7ZjWRmoNWCvhHzATarMqStTuzA6Dc/I9OiMWO1gP4eLZrOtx+COm
 X3pMpijsrIaHN2IgY9CtUHcqY+Hk6sS/824w70U2bh0nsMJs2QZBbeAUuhio5XXvAKzg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFDSS-0005lG-JH for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 15:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762010634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qyPXImxXazHny8jsMFSxmes8gpi0WI65WL50eQDN24s=;
 b=Yj7htOAxuh8vY6yckzSBO654CnuBERql1SEcMzLaTEGNW5/CLyjpeg/6YCohKIaf74OiPL
 dArYNcEOgB0Prb5HoFxOoDLyPQkZSGFkYPi5m57bCxdmUVrZhh49sg4zzRHiZ+PyRVM9Bp
 DiDaj+JtdiVrfzNHkXJJnvGc68maJAs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-7Gweal9dPT6Fdz-zhD_xZw-1; Sat, 01 Nov 2025 11:23:53 -0400
X-MC-Unique: 7Gweal9dPT6Fdz-zhD_xZw-1
X-Mimecast-MFC-AGG-ID: 7Gweal9dPT6Fdz-zhD_xZw_1762010632
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-78108268ea3so3651026b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 08:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762010632; x=1762615432;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyPXImxXazHny8jsMFSxmes8gpi0WI65WL50eQDN24s=;
 b=vl0ngF/9DOYYwGA38Al9zA9bu9CDaaflNL5F+i8w+ayxdpuNw0aVRyAZgiVhBchhOi
 Txyif0OyV8Jqn1LeBByz4IYN6NAuBodABJ/jwP1rqPXcM1MKiLofZ9TiyNfR/TDzKxvd
 AiAiprYjpF4KKAzBtbv0267LLv8PW2uYetUXgldlrgoq/GpAI26NfrhEGv1ykbP4Vx1y
 I2l+KAdNZTsBhDOJGDOuF3y+2I/G4SnobZ+7xCvRoUKvm5r17EdPzH4Y2r0a/puiAtR5
 rS3Gh3fjXefHapocWBO26AGiorVcrPrxN9Ve8dQpGT8hnUCH1unhSyWojuQibqIey6Xs
 yXJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw7YfaKUK2FOAoKwhakx8J0R/3TOL47Jo4O1y4AD8hYQNHV8AkIRkcKgpFU6Dou/XkT1HWh2Hi6aEByaov9oD7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxoO6kXf4LKoZRE7zCbO+SgQWWxnbYxNu22gIj7VcqAqaR6xdIb
 BP0nzrzbXBsny3VCQp/ibMUzGQHZlqOMqqJPjiBWA3gRAGv38ULUGF1B4lkwJtk1K1p5s+98IZI
 OtkHpAZYjgcfS4c7aZ0wXodh6JuOTr+WoPUGUXr/Op8VFB2UJUONTYO92115QdycCcMSi6x2o5c
 p1nv8=
X-Gm-Gg: ASbGncs6VvMi+vplQgWwM1WVSZJTSt+r2Vt6pk3nV3fXV6QNJDcB23amBMrVB+Q0KLA
 gI1H591ZJr1ziahZsviJio7T37m3rmFFC6hNSoTM0RzbZT+bc039K90obb8ZmXkpLxpkppaJJ3Z
 Y3rSU3vID8hp6feFrtHctbDhfRNFlsj1kjLdy/qNU0w6KCdi1aocK9OPRQEPB7PYgr1q/6YNRlm
 uSlqW/gjbihBhsfIuqnWEGUTfYF/vz8E1kqzPA+VUXtyVaHN2wWw+mdYA4HpntH+t+GY+rYMHw0
 hRwdaMFsyHxnA4XYgAZmKsgtc1IGiUW0pcdoN0Ytr/fJchNfF7fkNx2RL6ruNqMPWNwJF7V+bNz
 j6i80r3GeO0WS8yz2N8W1loCbcGtKIQAPOI1wfno=
X-Received: by 2002:a05:6a00:18a4:b0:78a:f6be:74f2 with SMTP id
 d2e1a72fcca58-7a756661b37mr8405030b3a.5.1762010631934; 
 Sat, 01 Nov 2025 08:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuIfUpwBy66icUgvx39wGiE1kn8eJTe87Qes/ptbUXK70Hhx4gY1O87feEAvMGGwDRNPrRxg==
X-Received: by 2002:a05:6a00:18a4:b0:78a:f6be:74f2 with SMTP id
 d2e1a72fcca58-7a756661b37mr8405010b3a.5.1762010631392; 
 Sat, 01 Nov 2025 08:23:51 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7d9261c1fsm5517125b3a.30.2025.11.01.08.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 08:23:50 -0700 (PDT)
Date: Sat, 1 Nov 2025 23:23:46 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251101152055.35zyuql6li2zzny7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251029115413.1085987-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251029115413.1085987-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iggsbs8GlV9MwaKzbVkj6Yz_ZBgL-v3AsLcji1b2W6E_1762010632
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 29, 2025 at 07:54:13PM +0800, Chao Yu wrote: >
 After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on >
 i_inline_xattr_size"), 
 f2fs should handle corrupted i_inline_xattr_si [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFDSS-0005lG-JH
Subject: Re: [f2fs-dev] [PATCH] f2fs/023: test sanity check condition w/
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

On Wed, Oct 29, 2025 at 07:54:13PM +0800, Chao Yu wrote:
> After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on
> i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
> correctly, let's add this regression testcase to check that.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Hi Chao,

Thanks for new test case for f2fs. Some review points as below :)

>  tests/f2fs/023     | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/023.out |  2 ++
>  2 files changed, 46 insertions(+)
>  create mode 100755 tests/f2fs/023
>  create mode 100644 tests/f2fs/023.out
> 
> diff --git a/tests/f2fs/023 b/tests/f2fs/023
> new file mode 100755
> index 00000000..d1b7df32
> --- /dev/null
> +++ b/tests/f2fs/023
> @@ -0,0 +1,44 @@
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
> +_begin_fstest auto quick rw
> +
> +_fixed_by_kernel_commit 5c1768b67250 \
> +        "f2fs: fix to do sanity check correctly on i_inline_xattr_size"
> +
> +_require_scratch_nocheck
> +_require_inject_f2fs_command node i_inline
> +_require_inject_f2fs_command node i_inline_xattr_size
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +_scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full

As you use specific mkfs options, so better to _fail "..." if mkfs fails.

> +_scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
> +touch $testfile
> +_scratch_unmount
> +
> +# inject .i_inline field: clear F2FS_EXTRA_ATTR bit
> +$F2FS_INJECT_PROG --node --mb i_inline --nid 4 --val 0x1 $SCRATCH_DEV \
> +		>>$seqres.full || _fail "failed to inject i_inline"
> +
> +# inject .i_inline_xattr_size field from 512 to 2048
> +$F2FS_INJECT_PROG --node --mb i_inline_xattr_size --nid 4 --val 2048 $SCRATCH_DEV \
> +		>>$seqres.full || _fail "failed to inject i_inline_xattr_size"

I found my system doesn't support i_inline_xattr_size,

  # inject.f2fs -V
 inject.f2fs 1.16.0 (2025-08-12)

I tried to removed above "_require_inject_f2fs_command node i_inline_xattr_size",
but I found this test didn't exit from above _fail. The .full file got:

  [inject_inode:833] unknown or unsupported member "i_inline_xattr_size"

So are you sure the $F2FS_INJECT_PROG return error if "failed to inject i_inline_xattr_size" :)

> +
> +_scratch_mount
> +
> +getfattr -n user.test "$testfile" 2>&1 | awk -F ': ' '/Structure needs cleaning/ { print $NF }'

As you need "user" attribute, so you need "_require_attrs" (. ./common/attr), also
the test group should have "attr".

If you don't need _getfattr, please use $GETFATTR_PROG at least.

And how about replace the "awk" with "_filter_scratch" (. ./common/filter)

Thanks,
Zorro

> +
> +status=0
> +exit
> diff --git a/tests/f2fs/023.out b/tests/f2fs/023.out
> new file mode 100644
> index 00000000..7f16f33f
> --- /dev/null
> +++ b/tests/f2fs/023.out
> @@ -0,0 +1,2 @@
> +QA output created by 023
> +Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

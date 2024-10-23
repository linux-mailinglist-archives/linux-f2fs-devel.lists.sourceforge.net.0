Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4A9ABBA2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 04:38:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3RG9-000111-95;
	Wed, 23 Oct 2024 02:38:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t3RG7-00010u-Jz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HMyxQC4PiUMFEM2SCPgl/rqbsfz60eDAxA3ZwDK2x48=; b=AN4Z1SSC24djPFC10RDgqOTe+6
 WOuQXNLrIqOurFyjFxcOJh1C6NqC6ft0hV/7BTWbEKe8UKmG7Z0Rn8igTm9agNaxHc2aclWpsO9U8
 kC+5U5nAI+6n2/SXamurFNXzEpn8j+5LoAnYGMCAwNnFWXnl0hzpIP0+Z1Dej52HsSZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HMyxQC4PiUMFEM2SCPgl/rqbsfz60eDAxA3ZwDK2x48=; b=E9SH+OGuaGmYsHUDTol4+QZ7Yq
 8gX+zcS8QYqRW6mZehXmFJljfLQGJGf4c+FwmJv6pNVhUd684tsm/5FM2cSlIlrj65IoNGLyne+63
 QqiP8qFZ7GRp1/jurN4ihzuqJH3ffmu6HDkkh+REyrhQXuCIR7I/v/76uwX6fQZ0DcJg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3RG7-00044J-AV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729651072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HMyxQC4PiUMFEM2SCPgl/rqbsfz60eDAxA3ZwDK2x48=;
 b=YxOaKJnjwp4TivYalJMxNv0KGbDPTI9/cemsiIn3RyVVB//TjcMX7+hkcbDKZhIcVoJQ9K
 PRqQWScQWShQfV+D5m4a84FIjSAUyrNrCNWeT4PG/BVwoep36LimZA9UNeT4phsejSiFQm
 1doGVXpAuNXsXEL+0vWEoQGITdZDO8w=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-fHByCxaWOY2S1-yA5KDzFA-1; Tue, 22 Oct 2024 22:37:50 -0400
X-MC-Unique: fHByCxaWOY2S1-yA5KDzFA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-71e8641f2a7so6999647b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2024 19:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729651069; x=1730255869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMyxQC4PiUMFEM2SCPgl/rqbsfz60eDAxA3ZwDK2x48=;
 b=XJBW4a4DjOG2Ypu/qlPXpOFXK2mYnKndTtn/gOfqn9KkaDcQ90q5Tt81eLxUVP9yDy
 3UbycqRhyNhvKSYkPAq370cAiZDtAbeUcaMDvbCd7VDESb3VtrFYkTs/tKtC/Iyk28A8
 XM4MjRY726+2PNLTqqd4l2QdKqeL/gXwbjd5MeouRb1F01vGdERloij4UrzeZY7KvYaR
 D/qs7O0sTzBCpG8zInEdBtBOtJbrM3g8rfKS7NyF6FIEucA0FmbCQxzo6UcRsaI4FO5F
 J7rMlODEbaeF5cuQAkQCVBKlohLzNp3bmIgxbNkZb3T/MUNxTywnlL9UfLzvpLOh6TM5
 no2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF7a3oayxYML/2dueFgoFVQ3gxYmsayeeOxvurWITfkf4VVmOcgDEhrB344MDdi99XoMPciMMiOElhqZNguOJS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJsdJa8H7QNSRLWlnOwqN+AKEzrvOQxkLVN/Bs1jUO4GQMXE6p
 a+g84U2ZDJUkgtN4eG7aoTNRqaY2XShvTjlkkpF0KmEHckvWKWvEKn4xvVdClxTfLaHrBoCkF/w
 e+S+leQeEyTHKzKcVTWrMbefBihdAbYvJZ0qV8aOjrblHD70SOB8L5u2SdSrdwzVKR7Ruf+fyau
 I=
X-Received: by 2002:a05:6a21:3414:b0:1d9:11d0:1214 with SMTP id
 adf61e73a8af0-1d978ad59fdmr1454005637.1.1729651068971; 
 Tue, 22 Oct 2024 19:37:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWdRDqvMToqLfw5Irv/0qSGvhfnUU9U2RLhMRTuUG8XqtShRz3ifBOR0NkHjH/wVntXXwLdg==
X-Received: by 2002:a05:6a21:3414:b0:1d9:11d0:1214 with SMTP id
 adf61e73a8af0-1d978ad59fdmr1453988637.1.1729651068537; 
 Tue, 22 Oct 2024 19:37:48 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec1313926sm5370452b3a.4.2024.10.22.19.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 19:37:48 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:37:44 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241023023744.nvnuavzus26gjdj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241015025106.3203676-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241015025106.3203676-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 15, 2024 at 10:51:05AM +0800, Chao Yu wrote: >
 This is a regression test to check whether f2fs handles dirty > data correctly
 when checkpoint is disabled, if lfs mode is on, > it will trig [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3RG7-00044J-AV
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs/006: add testcase to check
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

On Tue, Oct 15, 2024 at 10:51:05AM +0800, Chao Yu wrote:
> This is a regression test to check whether f2fs handles dirty
> data correctly when checkpoint is disabled, if lfs mode is on,
> it will trigger OPU for all overwritten data, this will cost
> free segments, so f2fs must account overwritten data as OPU
> data when calculating free space, otherwise, it may run out
> of free segments in f2fs' allocation function, resulting in
> panic.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/006     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/006.out |  6 ++++++
>  2 files changed, 58 insertions(+)
>  create mode 100755 tests/f2fs/006
>  create mode 100644 tests/f2fs/006.out
> 
> diff --git a/tests/f2fs/006 b/tests/f2fs/006
> new file mode 100755
> index 00000000..b359ef8f
> --- /dev/null
> +++ b/tests/f2fs/006
> @@ -0,0 +1,52 @@
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
> +# of free segments in f2fs' allocation function, resulting in
> +# panic.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_cleanup()
> +{
> +	rm -f $img
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
> +
> +mkdir $mnt
> +dd if=/dev/zero of=$img bs=1M count=100 2>/dev/null
> +$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
> +sync
> +
> +# use mode=lfs to let f2fs always triggers OPU
> +mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt

Hi Chao,

Is the loop device necessary? What if use SCRATCH_DEV and SCRATCH_MNT directly?

Thanks,
Zorro

> +
> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
> +
> +# it may run out of free space of f2fs and hang kernel
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> +
> +mount -o remount,checkpoint=enable $mnt
> +umount $mnt
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> new file mode 100644
> index 00000000..a2c7ba48
> --- /dev/null
> +++ b/tests/f2fs/006.out
> @@ -0,0 +1,6 @@
> +QA output created by 006
> +50+0 records in
> +50+0 records out
> +dd: error writing '/mnt/scratch_f2fs/f2fs.mnt/testfile': No space left on device
> +3+0 records in
> +2+0 records out
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

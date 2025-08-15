Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82BB282F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 17:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxPFXgxFqCjLILFdMP/wEvBop9dwG+xhAbf0i/pMsMQ=; b=lEo7yXGzez5hTD8z1zKWx75xDr
	+tLNVwjY4/cD/Afm7vtD3gudWc+Lt03kO8m1oS8h7AA+8K+Ta4hVQf1yNXt7MaI5prKwSyrJ0zTuw
	CT5HYxJZsstFMWGlB0hH1ZZCKSYVihzTGUPrlXZGAlxw0+vR+Cr5WiY9vzWOjEp249H4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umwPF-0006on-2o;
	Fri, 15 Aug 2025 15:31:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umwPD-0006of-LY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fuR/uQYDE2m+RSdGCCxyIopNOZi97r9mDnaed9upTYQ=; b=SsKwgEn0qAARYkqVYP44ommj5q
 8GmQuFQ6LLIQmGJVWbrd5GDzrwK425GSBgp76rQ3c+LkunM5SxcGew/dUnSvYqeZKCtf7Wa7k8Lee
 v527l0Clxr2lSR4e1izf9KxjUmgIXML6Bob3zb3F9APTEdIpSTq4MBrk/1rBbwcWsMdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fuR/uQYDE2m+RSdGCCxyIopNOZi97r9mDnaed9upTYQ=; b=J283xpXfop8rZsURMgxbkbSL0P
 npnOpvoRPmWMCw/bejTOI43fDEGyNpUTwhhR690OLTvMqriBdbAwz+vLOF9xHS5OjrBf3MChItWQc
 W4SjQq3zTcxBtja6FYt+t9zqCyyNnyn6LnAPyFuxcwr1boCbaJ1LL+K3uZrnk72QimIc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umwPD-0005cv-UE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755271896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fuR/uQYDE2m+RSdGCCxyIopNOZi97r9mDnaed9upTYQ=;
 b=Mh2gReqFy8dgSsfVSs3MwG0OSjSg+1vcEp/kL+/JNiBFDHHr8CGPvyNP5rgsao9uhp9uz5
 OJaGbF7P8DMlEme5FHtU/e6eox6Iy9f1ynB1J9SBrpu9G7n1+ZVsRWUROE6uf14VAHfXMW
 chqDHa193umGfpFcXtbvaL5QNAgzkJI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-zPGD4cBROCaeJgRCTZpY1A-1; Fri, 15 Aug 2025 11:31:33 -0400
X-MC-Unique: zPGD4cBROCaeJgRCTZpY1A-1
X-Mimecast-MFC-AGG-ID: zPGD4cBROCaeJgRCTZpY1A_1755271892
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24457f440f0so20955565ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755271892; x=1755876692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuR/uQYDE2m+RSdGCCxyIopNOZi97r9mDnaed9upTYQ=;
 b=RmLCEPPGtmVOohVRHsxVgAsNXAPa18nJADBHSVBHBOOBURAuh9/EDOTE169gcsm9cy
 xvWxMHKXoEKmrvSc3Ibw9LpEBGDT1IIQGtgiM/6EGjI6GBGWUFuTXWNo12kLbQUXD2uE
 cSfEi0PFY9JjeSjFQfij/SnVVJncrMPrPBYm1upS5LU1tp838YToV4V/GazdC7UFmfKR
 erxQbVdWDmIsrhyO65UnggkR6su8phaAugA8zNV2jzoY9Dnc8eJdJ5CFLZzVsVkmAZBN
 D4tiAbmdi52mTHySsAX8bE/oCnxr0Kvio9DgRZW0LMz0vFlEHx+rG33eg3o7/2JwlaOF
 3EwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhzbRPKsnTRn567a9WXPeN6HkAvTNgfEpj1QzYQfDy8iw+FyAhuY6Eu9hVnmfx7rlMK8Kd7CiiZsNS1ddma+2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwB96PdE9PmAlDEYotS/T1qodjlc9vO4+Kt9cs5gOFEdE99Nteu
 P/ZVcpxjw+w3jz8FNTKGbWZ8e9gdSUlrFmW8gpNWe92PL6rp8SdIcSPtrjI4UWHDlByKq9MlU/C
 JM/6lBfcap75CbMEaPe/TyoopYwVKxPlf+scEBb8b3VWddmAbg8AEhY15h4+Nc1aVZlnAPOzYqy
 ojMAs=
X-Gm-Gg: ASbGncuceoQsCwoFPz9lMh5yhbCRNvPV9UScgNQ1kHNJjZQYQQre7MOhFxZELmr3E4g
 jRen0DXMXFPkLBU2/HZDBrfaI1eAdw9n5GCsr+fNi5sogJbTLdAuQ7+aaoeHDnNBsJUd4pSz2e0
 XNIlMy+a7A/Q2PZCviJrSFuiM/v6Ce4cskiec5MYfAtjZPWGgVBj3PIMgmjg2D+JawlWV0SGNz2
 mduE4WHKLWtkkUKZfmH76mMPqJPbx3TBuZRXmWfhp4ZJc0xDCcsgXcDDAQG5z1Qvj4Vs74Sh3VQ
 iQiGN8+PaEu5/BUlAhTRbKxiWQt3aK4iNLIGCd90cfX5XWsX52O2YNArkaTyKW0TtJvbqzsgbMB
 9IWes
X-Received: by 2002:a17:903:3c70:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-2446d6da5a8mr35820165ad.3.1755271892391; 
 Fri, 15 Aug 2025 08:31:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHaXmbVZ9VgUsiC39cykU3ziTKFL0z957nyuEfKFMiyrOBOXKV5BfUKKhngCEEbSEVyG3GxQ==
X-Received: by 2002:a17:903:3c70:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-2446d6da5a8mr35819725ad.3.1755271891930; 
 Fri, 15 Aug 2025 08:31:31 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d510f07sm16582675ad.96.2025.08.15.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:31:31 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:31:27 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815153127.aqjzltcxsdktar23@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250815081405.2523015-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250815081405.2523015-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fidqdEYnRJeyTLMKFMfIINzd_so-nQxOB7NCI7j-6v8_1755271892
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 15, 2025 at 04:14:03PM +0800, Chao Yu wrote: >
 This is a regression testcase, it is added to check below case > and its
 variants: > - write 16k data into compressed file (data will be comp [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umwPD-0005cv-UE
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs/018: check data eof after
 partial truncation on compressed cluster
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

On Fri, Aug 15, 2025 at 04:14:03PM +0800, Chao Yu wrote:
> This is a regression testcase, it is added to check below case
> and its variants:
> - write 16k data into compressed file (data will be compressed)
> - truncate file to 12k (truncate partial data in compressed cluster)
> - truncate file to 20k
> - verify data in range of [12k, 16k] to see whether data is all zero
> or not
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - introduce build_fio_config() for cleanup
> - use run_check() to check return value of check_data_eof()
> - add _cleanup
> - use $XFS_IO_PROG instead of xfs_io
>  tests/f2fs/018     | 89 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/018.out |  2 ++
>  2 files changed, 91 insertions(+)
>  create mode 100755 tests/f2fs/018
>  create mode 100644 tests/f2fs/018.out
> 
> diff --git a/tests/f2fs/018 b/tests/f2fs/018
> new file mode 100755
> index 00000000..8013042d
> --- /dev/null
> +++ b/tests/f2fs/018
> @@ -0,0 +1,89 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/018
> +#
> +# This is a regression test to check whether page eof will be
> +# zero or not after we truncate partial data in compressed
> +# cluster.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw compress
> +
> +_fixed_by_kernel_commit ba8dac350faf \
> +	"f2fs: fix to zero post-eof page"
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to zero data after EOF for compressed file correctly"
> +
> +_require_xfs_io_command "truncate"
> +_require_scratch
> +
> +testfile=$SCRATCH_MNT/testfile
> +fio_config=$tmp.fio
> +
> +build_fio_config()
> +{
> +	local offset=$1
> +	local size=$2
> +
> +	cat >$fio_config <<EOF
> +[verify-data]
> +filename=$testfile
> +rw=read
> +verify=pattern
> +verify_pattern=0x00
> +do_verify=1
> +verify_only
> +offset=$offset
> +size=$size
> +numjobs=1
> +EOF
> +	cat $fio_config >> $seqres.full
> +}
> +
> +build_fio_config 0 4k
> +_require_fio $fio_config
> +
> +_cleanup()
> +{
> +       rm -f $testfile
> +}

This _cleanup isn't necessary, the $testfile is on SCRATCH_DEV, we don't
need to cleanup SCRATCH_DEV manually.

Others look good to me, I can help to remove above _cleanup function when
I merge this patchset, if other 2 patches are good to merge too :)

Reviewed-by: Zorro Lang <zlang@redhat.com>

Thanks,
Zorro

> +
> +_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
> +_scratch_mount "-o compress_extension=*" >> $seqres.full
> +
> +check_data_eof()
> +{
> +	local eof_start=$1
> +	local eof_size=$2
> +	local filesize=$3
> +	local offset1=$4
> +	local offset2=$5
> +	local offset3=$6
> +
> +	rm -f $testfile
> +
> +	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
> +	$XFS_IO_PROG -c "truncate $offset1" $testfile
> +	$XFS_IO_PROG -c "truncate $offset2" $testfile
> +
> +	if [ "$offset3" ]; then
> +		$XFS_IO_PROG -c "truncate $offset3" $testfile
> +	fi
> +
> +	build_fio_config $eof_start $eof_size
> +	$FIO_PROG $fio_config >> $seqres.full 2>&1
> +
> +	return $?
> +}
> +
> +run_check check_data_eof 12k 4k 16k 12k 20k
> +run_check check_data_eof 10k 6k 16k 10k 20k
> +run_check check_data_eof 12k 4k 16k 8k 12k 20k
> +run_check check_data_eof 10k 6k 16k 8k 10k 20k
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/018.out b/tests/f2fs/018.out
> new file mode 100644
> index 00000000..8849e303
> --- /dev/null
> +++ b/tests/f2fs/018.out
> @@ -0,0 +1,2 @@
> +QA output created by 018
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

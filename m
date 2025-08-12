Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652DB22218
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 10:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK4kF0MA/v8vSq3ZS7u0XY3d2pih+o/JrrT073y3HZo=; b=d0n/C/RLhAUdObtegMN7W6Xl7e
	DY1zdlpj0FcxwZu97pVpQIa/J5ldMS62klmGbEWEM1N4EN82KVm4nMrpPdi3VjpV1LbpQCSzYsrjF
	YhIAA8H4a1rB1HzV8HXiaOK8C2+MywODLSx2tA5161SJGeJbvnsGZpuOuDC5nFgybrHg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulkoh-00035R-Jf;
	Tue, 12 Aug 2025 08:57:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1ulkog-00035I-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 08:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7oo1F55S48yAs2edvlqUHYOCLtEajNqjKqf6sVKiM+M=; b=ggb4MhQnmsSn/rkOp9dohyTEtC
 HnZHs4kEjuA4RjMUIA1hzwGQwKkAbrDntWUwQApWwW5hNNGbfCsgusJlZpawn8c58GPWyKjnQYAJ6
 nHyGI20oTNJludGGOKh0FmD5yVtWBbg6kIXB0BxvEEFHwO81LFUDsEoQEhE5ms7dCaaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7oo1F55S48yAs2edvlqUHYOCLtEajNqjKqf6sVKiM+M=; b=ECITMhUWxPSquJ9Hcb51yRKepG
 xhPkRc0h6fv23l9tPalK8IKb7yDKcsGrs0L7aC8ihPyIkrfn3HoO4Fy0BI4CTtU6HMGJxPZQniD65
 vPMcXGr1Ye1IVpzNJeWSOULT/yUFpVZuUVf0gnymC+fsGOLo3C/dfro8+EdIvHaqbUe4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulkof-0002qK-JI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 08:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754989023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oo1F55S48yAs2edvlqUHYOCLtEajNqjKqf6sVKiM+M=;
 b=RdWp0ByoFfBYXv4PlfopgNmPFmlhPRT59mxC6nYBnu7IWzD6zFj6uhANzBx1Edp0A+JRJT
 q8g0mONh64UbZ6IOaJv/F9GjTQqXMk1YYJ/tkKU0Tu/Xp5ISpbgj/5y6e/V81+sxKnTyyk
 BpaMTc+/qG0uDO4zZh6+yevcepGI1L8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-FM5zsT9RMU-1Va2TOhVYPg-1; Tue, 12 Aug 2025 04:57:02 -0400
X-MC-Unique: FM5zsT9RMU-1Va2TOhVYPg-1
X-Mimecast-MFC-AGG-ID: FM5zsT9RMU-1Va2TOhVYPg_1754989021
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76bf3e05024so4983649b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Aug 2025 01:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754989021; x=1755593821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oo1F55S48yAs2edvlqUHYOCLtEajNqjKqf6sVKiM+M=;
 b=OJdN0yxbx4EvmnPASPQrb7GhuNP2z9E//56c7mO10bQvnr4uOKB71X+BkfRYn+Baff
 GJEfnnnhqA9eLJJ9tzzTSoMsyLvRxOXhAhoy9uC/hHdAbxp/t7PDIbgZ0cRJo7/kox2h
 f78a22fAKsUGsyRgDiGK69ll6NDdz/b5MFazMFPxXOGC9BnrYZvynVylZXuPb5YuSKWl
 SjlYWaInZdg/dKBuiI7hwlhqmJb0Za5M5lAdePcoRD1GjHJVfchtZmjx1I8sPEjNiPPb
 imXToeOzM9I5lMwBr5lqg7ZjFcaGk+a9qOSvFUMGyoMkJfFZLuDl/l4ARtdv4JzGxThu
 wD7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+gxoTObDTDMTHm6/Q1G4D/TmYt+xTecAytWura8uw9l/iOjRLIqVNFLl+JKsz7YDR7t6M1i2j4OIzC1dfsI24@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxTOWo8ef8X80RMJQizYiEEFw282dXf5N6qzHYfd/thmpQXjaHe
 wdCWlcFaXSzm0h9SNa2RQA+NJJx3pWdEcpkmChUIY0CC6mpkzYMJeVL1v60zhn6XFK+nTo2B40D
 Mb5HAaAOv8/FeEt1PAT6HO2S0UnsrER+SeSXCHGzeXIPMZhwfHWNKgQ0uX4uuAWXi9t7OWq2U95
 FA8DKSZQGTihA=
X-Gm-Gg: ASbGncsDra6vuK2NTq6zjARWOUxM1fozDJ7rhH5Fm3kSSUU1WPXUBsvlo5hTrCRSW5J
 7e/1CB2j7GYL+32zIH5ieL7guT2HHDIFykm/aakf2kEfvEs9Kp6e/y0dzZewoswYxlCDQZrg3Ez
 YdZoBg+WbDRXaBFz6h9HjwOVofi5Zc3q7HN4KCzDMlVCjbif40gJrvJF9LpJ41+OiX3z86buwLd
 MQ+0iUgivfOE65pcGJ3srR+ySrG7AjOg3dlt5vHH6oGMx1ajUnrI5/I730+oELSDr2BrENphFrk
 o6Oa7sku2AeA7R/OPeQGZf+8kax+E2wRiW6Yn5ozZv9n707L/wfpNsmR6jTUNVSA5fghDfVw/Ng
 cDw5y
X-Received: by 2002:a05:6a00:b86:b0:76b:c5bd:aec7 with SMTP id
 d2e1a72fcca58-76e0de417fcmr4045874b3a.8.1754989021055; 
 Tue, 12 Aug 2025 01:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3/vvmzMpuLvzP7q8WpnOk7CDyAVs70g+WXZMfMWZJkU0r/I3TXYt7Gp4daqZtntSuTNjAog==
X-Received: by 2002:a05:6a00:b86:b0:76b:c5bd:aec7 with SMTP id
 d2e1a72fcca58-76e0de417fcmr4045844b3a.8.1754989020644; 
 Tue, 12 Aug 2025 01:57:00 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcdd40f63sm28930159b3a.87.2025.08.12.01.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 01:57:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 16:56:56 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250812085656.kg3dsukgbde6skrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250811094415.1053545-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UMSu40jmQDxHhjPK-3K6weWBRDeNFhiqG34Qn6OEdMA_1754989021
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 05:44:13PM +0800, Chao Yu wrote: >
 This is a regression testcase, it is added to check below case > and its
 variants: > - write 16k data into compressed file (data will be comp [...]
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
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulkof-0002qK-JI
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs/018: check data eof after partial
 truncation on compressed cluster
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

On Mon, Aug 11, 2025 at 05:44:13PM +0800, Chao Yu wrote:
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
>  tests/f2fs/018     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/018.out |  2 ++
>  2 files changed, 60 insertions(+)
>  create mode 100755 tests/f2fs/018
>  create mode 100644 tests/f2fs/018.out
> 
> diff --git a/tests/f2fs/018 b/tests/f2fs/018
> new file mode 100755
> index 00000000..ca727d24
> --- /dev/null
> +++ b/tests/f2fs/018
> @@ -0,0 +1,58 @@
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
> +_require_scratch
> +_require_fio
> +
> +testfile=$SCRATCH_MNT/testfile
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
> +	_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
> +	_scratch_mount "-o compress_extension=*" >> $seqres.full
> +
> +	xfs_io -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
> +	xfs_io -c "truncate $offset1" $testfile
> +	xfs_io -c "truncate $offset2" $testfile

replace "xfs_io" with "$XFS_IO_PROG"

> +
> +	if [ "$offset3" ]; then
> +		xfs_io -c "truncate $offset3" $testfile

Same as above.

And generally we need: _require_xfs_io_command "truncate"

> +	fi
> +
> +	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
> +		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
> +		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"

Generally we do `_require_fio $fio_config` to make sure all arguments are supported
by current fio version and FSTYP, refer to generic/366. But as this is a f2fs only
test, and if you make sure you don't use any new/special fio arguments, I can accept
this. Or you can refer to generic/366.

> +	_scratch_unmount

I'm not familar with f2fs much, may I ask why we need to mkfs&mount ... umount
in each test loop?

Thanks,
Zorro

> +}
> +
> +check_data_eof 12k 4k 16k 12k 20k
> +check_data_eof 10k 6k 16k 10k 20k
> +check_data_eof 12k 4k 16k 8k 12k 20k
> +check_data_eof 10k 6k 16k 8k 10k 20k
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

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A5B2706C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 22:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxLOcx8OBzB++uvNUCVMEgKCJjeWIMreJBJn6KZd2io=; b=c/vv6ycvu2vIpDEHKVwuVaGRey
	793sDL5YGwYk9zr/Ioy3q7eaWuYIpyPpf4jkxEWn4qO/tQP+ZdCR8JMGvHbgFi82bLdi803OQuaAv
	SapvIDngdt9N6B3I6wfDnH1QakX+LyWjpjw4QElMZjO9Fp8EpHY09+WQPjUMz1n4ABKI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umexR-0001wz-Qf;
	Thu, 14 Aug 2025 20:53:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umexQ-0001wq-BM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 20:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SVBmjRRbsDiYgdks9UuUao/r/n534PcdVoBrMDuOOFM=; b=e981xcLfhlzlYWTAoaZYztreim
 3Q5mQStz2wa9f9/k976QDCodO+P8/XTEmSgWuRXmWGdUvlqnEr/WLvl2/x0j/rqgFxh4mxGVHu6wO
 cJ/KMAZIOnDVo+QQnXyiZl5UmO6jIzHZ7asSAdgoI4cMDJQO6f+1sbqnQlw+bt4rE5zY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SVBmjRRbsDiYgdks9UuUao/r/n534PcdVoBrMDuOOFM=; b=PiqN73TnyON9NrR7pBdDXkXSSo
 OeQZNAfkig266kDeLsV9kOQiMb7M5iduvGmHTK3FvlipTXXQuEPC2BEVk4XwyXnGKWZ5f+YOV+6yd
 lERH4RJPwP7Sn2KaKnmGI69zr3qj/fDeDef/5TEsNbcjAtZAmwo1xT5R4zLylK9W73NE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umexP-0001et-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 20:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755204824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SVBmjRRbsDiYgdks9UuUao/r/n534PcdVoBrMDuOOFM=;
 b=WORxzjENG0myVL5z0npi0bqXFBWWQet/EcA9Oet6P8O8aGamJQtyBD1ovicTjOhVb4OFEq
 a09X+O43qfTg7JmW0X0Qp7z7nHV2adqTCDHkeKWLx9H6nIjhFFP7xBmqev3pwXYQ1U7qoO
 CgqhJJOYoO5KnEJxQlCv4U3Ec+iw6lc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-2NIujkF6OSmlRaC6dwbMRg-1; Thu, 14 Aug 2025 16:53:41 -0400
X-MC-Unique: 2NIujkF6OSmlRaC6dwbMRg-1
X-Mimecast-MFC-AGG-ID: 2NIujkF6OSmlRaC6dwbMRg_1755204820
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2eaecf8dso1075508b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 13:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755204820; x=1755809620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVBmjRRbsDiYgdks9UuUao/r/n534PcdVoBrMDuOOFM=;
 b=ulyDrUAG1jQobWGuLa5gqQzF9EgfrxeFaRgjzKLE9FnT6IOCOUxVFFxD1CNhLSriBi
 sJ5HTDfa3wZqGh2JdIaj0KByJC5WCuhqmcLUcREE9CpUppmQMLuHRBYi5gcTsqui0eXa
 6lfz8oqqtH2zIXZd6klv4WJSYEtsbu+tsG/7yA4aZU1qi6rl8wXFsGB0IOT/nCv6ylTS
 YXnFPZQlpAsgKTIt5Thiq8PpK1pnI523dPh+sI4+Jd07ygb/edQCsFLOZ0UXua2kbLRq
 kxTEqpcnbvxBv/QIA5DvyDixJmCIg1Kh9O96f/7FSoSMAHfHLLjSbDMBkyV07Doj/CuQ
 l6QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdXFvhO9aR8CF7OyxpBVXOflhMjaU8+2uu/VLaz3MmMu3lGaSDYu6Shv1HX38MK9LSe6WIAzeFzkZbfQObRJy+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyNvu2Wha79H7Wlv3ckSxN5+W/ilLswelnbVyMk04RoWPO415PS
 ZBvZAFkFX7XJNUzqYGoM5LBbBBUfe2O/ACMNQOt8+eB7WXwyMtndhEvgkhTonXxqHbakvWHWGMi
 ClXdnaGgsfKoVTkA7pFb0ZSDysCXFcewzPzZeucDbkeyvyCJgNcwugT4ftb5ZIZwCgVCFq6NTcI
 vIibw=
X-Gm-Gg: ASbGncsoAjz0kx0LM8/r62GbQ9vq2UK1VM+KXj+cYqJ3eCj+hqW2dqoDM8RqKxoYAiL
 hXK8heix/A8BhxBm+Cjq5tqp1U71Qxvp2osKUm305EOA9rXtT9sKPpdSzYqt9Mg7X9c1Q5OZatR
 vr96NCkiGQdC9O1rIvQRh24Ra9HRyoj8tkClpGXk4IDfhrj1yIPu6VuEIXtt9ZUxIiSq+geHkRI
 JnXhB/dTBRegq1grSb53YcVW+ZGLcvvrp02r93s5T/IrVYZRXziYjp6rDeLCeWQq+LfHeAmieO5
 tUx8IF8TH8pGnX/DJSYUgT0HMF0fzpTkei7jIAx5QWzj0IcG+EaHlvsts729scbNi+NqYE6ptRx
 57o5s
X-Received: by 2002:a05:6a20:3c8f:b0:240:252a:158e with SMTP id
 adf61e73a8af0-240bcf5e721mr6902331637.3.1755204819982; 
 Thu, 14 Aug 2025 13:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoGvypaL9JtBGvDGIWVjrTXCp8kSwohwcmyEzcdb8xXtBTwhMvoKZoi9NOdVkw7TC+xRs8Pg==
X-Received: by 2002:a05:6a20:3c8f:b0:240:252a:158e with SMTP id
 adf61e73a8af0-240bcf5e721mr6902297637.3.1755204819502; 
 Thu, 14 Aug 2025 13:53:39 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e13eb0db0sm7485776b3a.3.2025.08.14.13.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:53:39 -0700 (PDT)
Date: Fri, 15 Aug 2025 04:53:34 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250814205334.obe6tmyhphngntdv@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250814090712.2119455-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MhYMnW2jI0xXox78W-OtaodzxEpJdCcdpB2bzMgAMoU_1755204820
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 05:07:10PM +0800, Chao Yu wrote: >
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
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umexP-0001et-Pv
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs/018: check data eof after
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

On Thu, Aug 14, 2025 at 05:07:10PM +0800, Chao Yu wrote:
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
> v2:
> - add missing _require_xfs_io_command "truncate"
> - add missing _require_fio $fio_config
> - use $XFS_IO_PROG instead of xfs_io
> - avoid mkfs&mount .. umount for each round test
>  tests/f2fs/018     | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/018.out |  2 ++
>  2 files changed, 79 insertions(+)
>  create mode 100755 tests/f2fs/018
>  create mode 100644 tests/f2fs/018.out
> 
> diff --git a/tests/f2fs/018 b/tests/f2fs/018
> new file mode 100755
> index 00000000..e1047f78
> --- /dev/null
> +++ b/tests/f2fs/018
> @@ -0,0 +1,77 @@
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
> +cat >$fio_config <<EOF
> +[global]
> +filename=$testfile
> +rw=read
> +verify=pattern
> +verify_pattern=0x00
> +do_verify=1
> +verify_only
> +offset=0
> +size=4k
> +numjobs=1
> +EOF
> +_require_fio $fio_config

Hmm... that looks strange if you create fio config file but don't use it later :-D

How about:

build_fio_config()
{
	local offset=$1
	local size=$2

	cat >$fio_config <<EOF
[global]
filename=$testfile
rw=read
verify=pattern
verify_pattern=0x00
do_verify=1
verify_only
offset=$offset
size=$size
numjobs=1
EOF
}

build_fio_config 0 4k
_require_fio $fio_config

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
> +

rm -f $testfile

> +	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
> +	$XFS_IO_PROG -c "truncate $offset1" $testfile
> +	$XFS_IO_PROG -c "truncate $offset2" $testfile
> +
> +	if [ "$offset3" ]; then
> +		xfs_io -c "truncate $offset3" $testfile
                ^^^^^^
       $XFS_IO_PROG

> +	fi
> +
> +	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
> +		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
> +		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"

build_fio_config $eof_start $eof_size
$FIO_PROG $fio_config >> $seqres.full 2>&1

> +
> +	rm -f $testfile

Move this line to above, then

return $?

> +}
> +
> +check_data_eof 12k 4k 16k 12k 20k
> +check_data_eof 10k 6k 16k 10k 20k
> +check_data_eof 12k 4k 16k 8k 12k 20k
> +check_data_eof 10k 6k 16k 8k 10k 20k

run_check check_data_eof 12k 4k 16k 12k 20k
run_check check_data_eof 10k 6k 16k 10k 20k
run_check check_data_eof 12k 4k 16k 8k 12k 20k
run_check check_data_eof 10k 6k 16k 8k 10k 20k

This can help you to know which line fails if one of them is failed. Or you
always get "eof data is not zero", no matter which line fails :)

> +
> +_scratch_unmount

This unmount looks useless, due to SCRATCH_DEV is always unmounted after a test done.

Thanks,
Zorro

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

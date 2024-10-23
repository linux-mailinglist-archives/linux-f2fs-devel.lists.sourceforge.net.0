Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFA9ABBFB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 05:08:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3RjT-0003Bf-JT;
	Wed, 23 Oct 2024 03:08:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t3RjN-0003B2-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdOL8buhJPizFqiZXTZfTTszBi6CktTqX5xrIm422Jk=; b=fjSz3ozNZxnC6vgg/YWTvGy+vE
 4L9szeycvOVcFsRfQ+pfBLIu02IpISimHj0C2ZGXXD7fG5lm3Y7P+45me1I0MPOP3UahSKCCw7P5D
 lty7+VOFWBT6tVFQXof07zr3Ga1YkOEfq2MeBAQMSfK88ZsTENASwoa9TN0b6vn5Q0LM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jdOL8buhJPizFqiZXTZfTTszBi6CktTqX5xrIm422Jk=; b=nQd925mH1VVrHq6OQtIMEsLP1j
 217fjal/jhemneQnD90E5KT971+7Tk6LOFutfagXXzqTi9MHCi+9JvelGuMzxYSQtMOfYvThY3AjQ
 feeeAy0VyRC4HCTkfV0wb2bc+Nm7pIUKrzZgiy2sDOTYqOLX3DxqvneMRXoiYTkXHdVA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3RjM-0005ir-8q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729652883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdOL8buhJPizFqiZXTZfTTszBi6CktTqX5xrIm422Jk=;
 b=QOK5jnvQssAjJBvoqeTO1Ea7Wl6Zf0pOM1fqmIUyNXltbPLnwPUaUiAGh8RXUTqkiduXYt
 8UicqSQRj2+aXtfmgf9T0V7hlQknbk7Ofw1BjeBX0obHK0T0WGWLOD1JMnX3ZO/cdhTCN2
 PMTwC3fB6BALPWFj/MfU4a5Pdxu1r6w=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-lC7-qN5rNaSGqJNXODIsCw-1; Tue, 22 Oct 2024 23:08:02 -0400
X-MC-Unique: lC7-qN5rNaSGqJNXODIsCw-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-71e5b492465so8002565b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2024 20:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729652871; x=1730257671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jdOL8buhJPizFqiZXTZfTTszBi6CktTqX5xrIm422Jk=;
 b=L4xB0oDVV73PrUh/pNcHnXLVNHPplDWUUUdbYuVJ4POnNNugVpmhL+S0Gf3oCIeabD
 jpB7K3htDYvOOzQWc0knPjIuMoO/wyIEXlNiEUvrLjOpGEqHcKMO5OTP5iR7qaGWRvT4
 YDeLid3T09+1VsRRCcP/SmoFYLETR5rNGvxp396S1kV4yQcGByA+mccP15pNUR017qNI
 O1xwsMGDBeQkgrDNkZa23+dM6t9/69/qmg5XICWFrMvM7ElRc4Z82/sr8fncafhRFb9S
 lCIQmw8cRjzB2ezGtjCeofHW5onwtHtmxIQ8Zz4czKN1e/lE2txi/kufYE5XlbgdrU11
 kK6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzdtZQwOypniszT3A1hGdTAOEqzLyb925BIqJ36y4E7FfZjQhLLrQdOUb+RFv+740m7U0fybVFdh7SsXF9mNxA@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw/3MwIQmm70Dv3mxJntA+QyB8uydaW4CVPMDm2jn3/zHUkcxMu
 rJlYLLZ+VQSSRohmQSUlMhCvkFi9/H6u9slOjwDcAaGQulHsbmeXA+7OlgYELUyXFRO0EiG1iat
 kV5fnJzSH9lfYfuUj2+b2UQtRCBx0pbvHfGb3siaAYnyMDJmmvM/I/+NeLeNU2BcL4nB4JKF5KU
 g=
X-Received: by 2002:a05:6a00:8d2:b0:71e:7a19:7d64 with SMTP id
 d2e1a72fcca58-72030a6e0f2mr1827909b3a.5.1729652871289; 
 Tue, 22 Oct 2024 20:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtr4wKcMT/1LrZvRiyghgTPdAnu41VjU0Ftb2YW3uKVfEElFpQ0/7Z+PtiPT+Np7wXG5UVBQ==
X-Received: by 2002:a05:6a00:8d2:b0:71e:7a19:7d64 with SMTP id
 d2e1a72fcca58-72030a6e0f2mr1827883b3a.5.1729652870842; 
 Tue, 22 Oct 2024 20:07:50 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec13d765csm5407573b3a.115.2024.10.22.20.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 20:07:50 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:07:46 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241023030746.5e53w26p5qtfbpod@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241015025106.3203676-1-chao@kernel.org>
 <20241015025106.3203676-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241015025106.3203676-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 15, 2024 at 10:51:06AM +0800, Chao Yu wrote: >
 metadata of compressed inode should always be consistent after file >
 compression, 
 reservation, releasement and decompression, let's add > a [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3RjM-0005ir-8q
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/007: add testcase to check
 consistency of compressed inode metadata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Qi Han <hanqi@vivo.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 15, 2024 at 10:51:06AM +0800, Chao Yu wrote:
> metadata of compressed inode should always be consistent after file
> compression, reservation, releasement and decompression, let's add
> a testcase to check it.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/007.out |   4 ++
>  2 files changed, 120 insertions(+)
>  create mode 100755 tests/f2fs/007
>  create mode 100644 tests/f2fs/007.out
> 
> diff --git a/tests/f2fs/007 b/tests/f2fs/007
> new file mode 100755
> index 00000000..274be806
> --- /dev/null
> +++ b/tests/f2fs/007
> @@ -0,0 +1,116 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/007
> +#
> +# This is a regression test to check whether compressed metadata

Hi Chao,

Thanks for the new f2fs test cases.

If there's a known fix for this regression, please mark it by:

_fixed_by_kernel_commit .....

> +# can become inconsistent after file compression, reservation
> +# releasement, and decompression.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
                            ^^^^
                            rw compress ?

> +
> +_cleanup()
> +{
> +	cd /
> +	rm -r -f tmp.*
> +}

This's same with default _cleanup, so it can be removed.

> +
> +testfile_prefix=$SCRATCH_MNT/testfile
> +fio_config=$tmp.fio
> +
> +cat >$fio_config <<EOF
> +[write_compressed_data_30]
> +name=mytest
> +ioengine=psync
> +rw=write
> +direct=0
> +bs=1M
> +filesize=1M
> +numjobs=1
> +filename=/mnt/scratch_f2fs/testfile30
            ^^^^^^^^^^

$SCRATCH_MNT or ${testfile_prefix}30 ?

> +buffer_compress_percentage=30
> +
> +[write_compressed_data_60]
> +name=mytest
> +ioengine=psync
> +rw=write
> +direct=0
> +bs=1M
> +filesize=1M
> +numjobs=1
> +filename=/mnt/scratch_f2fs/testfile60

Same as above.

> +buffer_compress_percentage=60
> +
> +[write_compressed_data_90]
> +name=mytest
> +ioengine=psync
> +rw=write
> +direct=0
> +bs=1M
> +filesize=1M
> +numjobs=1
> +filename=/mnt/scratch_f2fs/testfile90

Same as above

> +buffer_compress_percentage=90
> +EOF
> +
> +_require_fio $fio_config
> +_require_scratch

I'd like to call _require_scratch at the beginning, especially you use
SCRATCH_* things in $fio_config. You can refer to generic/095.

> +_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full

Can you make sure this mkfs never fail? Maybe:
    || _fail "...."

> +_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
> +
> +echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
> +cat $fio_config >> $seqres.full
> +$FIO_PROG $fio_config >> $seqres.full
> +_scratch_unmount
> +
> +for i in 30 60 90; do
> +	testfile=$testfile_prefix$i
> +
> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
> +	f2fs_io compress $testfile >> $seqres.full
        ^^^^^^^
$F2FS_IO_PROG

> +	cblocks=`f2fs_io get_cblocks $testfile`
                 ^^^^^^^
$F2FS_IO_PROG

> +	echo "compression ratio is: "$cblocks" / 256"
> +
> +	_scratch_unmount
> +
> +	# 1. check after compression
> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full

_check_scratch_fs ?

If f2fs needs some custom operations, please change the _check_scratch_fs
or _check_generic_filesystem.

> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after compress"
> +	fi
> +
> +	_scratch_mount >> $seqres.full
> +	f2fs_io release_cblocks $testfile >> $seqres.full

$F2FS_IO_PROG

> +	_scratch_unmount
> +
> +	# 2. check after releasement
> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full

_check_scratch_fs

> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after release_cblocks"
> +	fi
> +
> +	_scratch_mount >> $seqres.full
> +	f2fs_io reserve_cblocks $testfile >> $seqres.full

$F2FS_IO_PROG

> +	_scratch_unmount
> +
> +	# 3. check after rservation
> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full

_check_scratch_fs

> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after reserve_cblocks"
> +	fi
> +
> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
> +	f2fs_io decompress $testfile >> $seqres.full

$F2FS_IO_PROG

> +	_scratch_unmount
> +
> +	# 4. check after decompression
> +	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full

_check_scratch_fs

Thanks,
Zorro

> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after decompress"
> +	fi
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/007.out b/tests/f2fs/007.out
> new file mode 100644
> index 00000000..2ea71c18
> --- /dev/null
> +++ b/tests/f2fs/007.out
> @@ -0,0 +1,4 @@
> +QA output created by 007
> +compression ratio is: 64 / 256
> +compression ratio is: 128 / 256
> +compression ratio is: 192 / 256
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

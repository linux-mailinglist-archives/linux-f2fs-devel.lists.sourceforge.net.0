Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50B9B4258
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 07:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5fbT-0004xt-Mv;
	Tue, 29 Oct 2024 06:21:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t5fbS-0004xn-Fc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JC+/Hyis0NruJXfhxP3v+aJI15wvdh+lyb4kuIHhQHc=; b=B7eLkApSOgjk2utcpAYXUreNnO
 P4s/uRlQCwOXuznHcWMHzua5/ICgV3gAJ9LgCEgYWUFfnJLBhzuVKev6SmYLlSa8SQfiPNetz6Koh
 irm+jWmbOKVxOIJhm7qISjEdxR4XA13NKzPNaQCRqo9gmFvqDCC0hxcnNFF/yLohnHO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JC+/Hyis0NruJXfhxP3v+aJI15wvdh+lyb4kuIHhQHc=; b=DN6FBH72ZrZkBbC12rwnIBTPFi
 rdyA3cw+EO7FcFmbf8o+YIXhLSExs7JMxXfaHugarjzGCABbBZaoMAejQNNPMZYXkxQvgMd6ivLyk
 OAdkpLkdsSdGFXRRKA8nWzaGs2uL17SLWQGvyCxKc9MgxOl9DGGfapSvSYTGuXN1TAeI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5fbR-0004Vm-JN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730182871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JC+/Hyis0NruJXfhxP3v+aJI15wvdh+lyb4kuIHhQHc=;
 b=FexoIH+cfNVtwmMJTjaV0fCOh1wv4gXB89U/Jh6KiWV3/pVgqlAaESA+5+PeM9NR9VvMmF
 qKEJueo9Hns0Mm5qAdVhEQb7ctLNsbVeWfgxOskvaTs/VxFG7zbFmqMsNHkD/PyhlfbWF7
 Hbkr5h2iuyniOPsUoXfCO9g42iVP/Gc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-q4dW0_ReM7yiZ5b_WRpJyQ-1; Tue, 29 Oct 2024 02:21:09 -0400
X-MC-Unique: q4dW0_ReM7yiZ5b_WRpJyQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-20c94f450c7so51073845ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 23:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730182869; x=1730787669;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JC+/Hyis0NruJXfhxP3v+aJI15wvdh+lyb4kuIHhQHc=;
 b=XjHYEG8J2Qg31IZMGtBzLQp5lfBC8T0aDew8jJpiKcOPfpiNCRfwsWEn83RpCnv/ws
 3/aaNJK0QTiQOLYGKAwYkTN0LXTtde+2w0ZZ9DPA1zhYFqkiu0jDiGYfis8Fu0qL2SGO
 mNJjxOfzN1r7R+DMMXpXmQYwlJo7kj0zBmO2IR2G/fBaWrdN7k3JgsAWg1aJ5hvuBQXR
 bTrZWiNIQcnFENcceQdIUwBsvq8qLv7hmY9bOtdjTkuh+lYAQ2GpUzs31R6HLypkr2rN
 LoLVM6gxPNgSaGUdsncT2m/5APRCU8A+EblGOhmDeHjSOGK3Ov4uf0zuw4YlonQJk86C
 DLzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FhEYs2NBGHW0xP0nM0UDytxLvzU2mCUoWTYT5KYkmxzHVlRT6IefO/9JUC/CKl2OnISATRu1/kzptUPYJA3J@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywtj9jUVVte4uEFO4sDM6quQe3Ok0JIONv5PRperZNXd7PL/wvO
 UsqFgGhnDkppPx2SSy3drTOeBRICdJr1ZNvUic26I3jJ5UQ27Otgrw1o/F6+yfwg9bjk28se8X5
 9UUju/ONVC16ckQLDDdQdqwhVe4ZMjXIROVFvDkaB8ouPAVxYflwzA476+EHrseq+VkABbaGvzy
 I=
X-Received: by 2002:a17:903:234a:b0:20c:c88b:511b with SMTP id
 d9443c01a7336-210c6c1e203mr127142215ad.33.1730182868731; 
 Mon, 28 Oct 2024 23:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDjTVDysZhBC3z/0cZTbwGxQluA+Z70HP5A1biA2A8SZNiGZDDCRKglVArmxNafj7LW3ZY0Q==
X-Received: by 2002:a17:903:234a:b0:20c:c88b:511b with SMTP id
 d9443c01a7336-210c6c1e203mr127142085ad.33.1730182868410; 
 Mon, 28 Oct 2024 23:21:08 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d3ffsm59787725ad.73.2024.10.28.23.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 23:21:08 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:21:04 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241029062104.pepwqv4w4scvgiy4@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241028141800.1788356-1-chao@kernel.org>
 <20241028141800.1788356-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241028141800.1788356-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 28, 2024 at 10:18:00PM +0800, Chao Yu wrote: >
 metadata of compressed inode should always be consistent after file >
 compression, 
 reservation, releasement and decompression, let's add > a [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5fbR-0004Vm-JN
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs/007: add testcase to check
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

On Mon, Oct 28, 2024 at 10:18:00PM +0800, Chao Yu wrote:
> metadata of compressed inode should always be consistent after file
> compression, reservation, releasement and decompression, let's add
> a testcase to check it.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - move _require_scratch before use of $SCRATCH_MNT
> - output message before _check_scratch_fs
>  tests/f2fs/007     | 108 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/007.out |  16 +++++++
>  2 files changed, 124 insertions(+)
>  create mode 100755 tests/f2fs/007
>  create mode 100644 tests/f2fs/007.out
> 
> diff --git a/tests/f2fs/007 b/tests/f2fs/007
> new file mode 100755
> index 00000000..805d88fa
> --- /dev/null
> +++ b/tests/f2fs/007
> @@ -0,0 +1,108 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/007
> +#
> +# This is a regression test to check whether compressed metadata
> +# can become inconsistent after file compression, reservation
> +# releasement, and decompression.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw compress
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +        "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"
> +
> +_require_scratch
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
> +filename=${testfile_prefix}30
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
> +filename=${testfile_prefix}60
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
> +filename=${testfile_prefix}90
> +buffer_compress_percentage=90
> +EOF
> +
> +_require_fio $fio_config
> +_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
> +_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
> +
> +echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
> +cat $fio_config >> $seqres.full
> +$FIO_PROG $fio_config >> $seqres.full
> +_scratch_unmount
> +
> +# force to repaire if filesystem is corrupted

              repair

> +export FSCK_OPTIONS="-f $FSCK_OPTIONS"

JFYI, if f2f2 always hope to force to repair, you can think about changing the _fsck_opts()
in common/config.

Others look good to me, I'll help to fix above typo when I merge it. Thanks for you patch.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +
> +for i in 30 60 90; do
> +	testfile=$testfile_prefix$i
> +
> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
> +	$F2FS_IO_PROG compress $testfile >> $seqres.full
> +	cblocks=`$F2FS_IO_PROG get_cblocks $testfile`
> +	echo "compression ratio is: "$cblocks" / 256"
> +
> +	_scratch_unmount
> +
> +	# 1. check after compression
> +	echo "check fs after compress"
> +	_check_scratch_fs
> +
> +	_scratch_mount >> $seqres.full
> +	$F2FS_IO_PROG release_cblocks $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 2. check after releasement
> +	echo "check fs after release_cblocks"
> +	_check_scratch_fs
> +
> +	_scratch_mount >> $seqres.full
> +	$F2FS_IO_PROG reserve_cblocks $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 3. check after rservation
> +	echo "check fs after reserve_cblocks"
> +	_check_scratch_fs
> +
> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
> +	$F2FS_IO_PROG decompress $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 4. check after decompression
> +	echo "check fs after decompress"
> +	_check_scratch_fs
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/007.out b/tests/f2fs/007.out
> new file mode 100644
> index 00000000..a4b76300
> --- /dev/null
> +++ b/tests/f2fs/007.out
> @@ -0,0 +1,16 @@
> +QA output created by 007
> +compression ratio is: 64 / 256
> +check fs after compress
> +check fs after release_cblocks
> +check fs after reserve_cblocks
> +check fs after decompress
> +compression ratio is: 128 / 256
> +check fs after compress
> +check fs after release_cblocks
> +check fs after reserve_cblocks
> +check fs after decompress
> +compression ratio is: 192 / 256
> +check fs after compress
> +check fs after release_cblocks
> +check fs after reserve_cblocks
> +check fs after decompress
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

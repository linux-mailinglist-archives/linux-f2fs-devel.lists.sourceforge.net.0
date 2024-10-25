Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA509AF8AE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 05:58:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4BTM-0001Kl-7i;
	Fri, 25 Oct 2024 03:58:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t4BTK-0001Ke-F9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 03:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YiGDlovTmHt4YBMyrJNgxhu/7l9hwDiwqAtY4NqF5F0=; b=booIf1Nuwt4wN+W05pUiNXW8Eo
 n0x1Uy+qtAnFsucVAssAzKmgoO8OJjB4XN62ZG26POAPFawsQM8ig/mQenR7yamc9/BDYJ+3vsIGs
 07K4EKI4rmXYA6G1lU685KEIgzxviYjDjAEoEaGErrB0PUdrgxFZ0BhK/MaQO1+0fkEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YiGDlovTmHt4YBMyrJNgxhu/7l9hwDiwqAtY4NqF5F0=; b=mMvkw1DZjIY6obfGGxlXqxAbsd
 Z2p/5eyG+InaROTnZuJ9I+Pv4Mmo/p8wUaP/pjqTZnJrG7j+STQ+zEiFpcNJfW6bRhXHDrA7c20nw
 7/BsHyqfPUTy6nOrwS9XHsiXIhzwe97GqiBXS7TJJkvtKhYPraHo6y4ziKB98b3yOymM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4BTH-000280-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 03:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729828712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiGDlovTmHt4YBMyrJNgxhu/7l9hwDiwqAtY4NqF5F0=;
 b=bvxKQvc0cTNhPk/lNETfusD27Qof7P5rcYv2m8GNBLRRBPbyAkJbH0/qI/9LWOUALC+QnA
 CTAZDT3CtxgwlAge9pob04hgwwSi0AUo3H6bV0Uc1b0vaBRrT0YIrWznhE/9X9Njd0NEKK
 2To8rO6dciY8oWyi4W4iHwOGvknAQK4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-j1bZuMjPMFmJAoGl0eKCOQ-1; Thu, 24 Oct 2024 23:58:31 -0400
X-MC-Unique: j1bZuMjPMFmJAoGl0eKCOQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2e76eabc7ddso1814594a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 20:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729828710; x=1730433510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiGDlovTmHt4YBMyrJNgxhu/7l9hwDiwqAtY4NqF5F0=;
 b=csvt+9o7aCh7wIDcKtWEOgC4USSe3vzhLo7aMbCTz7ydXYzWLmuG4+vIfhZz7Avj3C
 JcMof5bSEUVkEFCj6unjRRml2ctnbqr7cUoZn4n8VRNAmRATpROdJeAg7ku/+08m2abE
 PdgQuvBqqc0wsnjztp6UYe/pfTMBVIJaE3eamy+nlbfTYvMkebCTEvxW1UAkvVKLtows
 0nYwHuDLzJib9SBZJqTJ3tErLG3n236QAv38OEXt17/Kq5f9yS4iWqUg1J+qPVWrM8n/
 GAWNtH6b/jsr4TpysK7eSASrDVB9VUGEKKKi0HnSwVC0bOad4B/32iFX3Ji4oJ0u1WAV
 WQQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGgBhkW6HyusKoLNQ9goTSi9tqntR3Yav083iMo5FLsERlIjagumaAHzU/YbbNNUYKdu1ONBQJAht6QCyVAqX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzBlW3kZNt/Udr0eXiCZwOIMyQ8jsRRwoBKY3E+0poMDspiD5kv
 HPA+zq0iDF0iz84d9LjyvK8XJuduY1LTjT50WRpiPd4hazlQoinWBnz4ZGe6gpqEEeMupJ7stAg
 Al5E292EgOGIhbdj9FaTdKgeziI1Cyfrxm+J8fLgKE3skvyj+dmPV0f2QEy++ywkW5At/DK8MCk
 Y=
X-Received: by 2002:a17:90b:3890:b0:2e0:894f:198e with SMTP id
 98e67ed59e1d1-2e76b6cdb36mr9367148a91.30.1729828710017; 
 Thu, 24 Oct 2024 20:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8V4APi8wzjunyKjyiJGvnLf3sBZMADffzV1GNJpd5R8ubktTp14cXLhRw3/ZYjR5kKhMcSw==
X-Received: by 2002:a17:90b:3890:b0:2e0:894f:198e with SMTP id
 98e67ed59e1d1-2e76b6cdb36mr9367133a91.30.1729828709630; 
 Thu, 24 Oct 2024 20:58:29 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3771a1fsm303278a91.57.2024.10.24.20.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 20:58:29 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:58:24 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241025035824.3i62khlg3juccxeb@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241023081602.3806579-1-chao@kernel.org>
 <20241023081602.3806579-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241023081602.3806579-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 23, 2024 at 04:16:02PM +0800, Chao Yu wrote: >
 metadata of compressed inode should always be consistent after file >
 compression, 
 reservation, releasement and decompression, let's add > a [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4BTH-000280-Qg
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs/007: add testcase to check
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

On Wed, Oct 23, 2024 at 04:16:02PM +0800, Chao Yu wrote:
> metadata of compressed inode should always be consistent after file
> compression, reservation, releasement and decompression, let's add
> a testcase to check it.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add _fixed_by_kernel_commit()
> - code cleanup
> - add error handling for _scratch_mkfs()
>  tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/007.out |   4 ++
>  2 files changed, 120 insertions(+)
>  create mode 100755 tests/f2fs/007
>  create mode 100644 tests/f2fs/007.out
> 
> diff --git a/tests/f2fs/007 b/tests/f2fs/007
> new file mode 100755
> index 00000000..8979c21c
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
> +# can become inconsistent after file compression, reservation
> +# releasement, and decompression.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw compress
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +        "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"
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
> +_require_scratch

Better to move _require_scratch before "testfile_prefix=$SCRATCH_MNT/testfile".
Due to we'd better to make sure there's $SCRATCH_MNT, before using it.

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
> +export FSCK_OPTIONS="-f $FSCK_OPTIONS"
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
> +	_check_scratch_fs
> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after compress"
> +	fi
> +
> +	_scratch_mount >> $seqres.full
> +	$F2FS_IO_PROG release_cblocks $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 2. check after releasement
> +	_check_scratch_fs
> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after release_cblocks"

The _fail is not necessary, due to _check_scratch_fs will do "exit 1"
if it find a corruption. If you need some message, maybe echo it before
calling _check_scratch_fs?

> +	fi
> +
> +	_scratch_mount >> $seqres.full
> +	$F2FS_IO_PROG reserve_cblocks $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 3. check after rservation
> +	_check_scratch_fs
> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after reserve_cblocks"
> +	fi

Same as above

> +
> +	_scratch_mount "-o compress_mode=user" >> $seqres.full
> +	$F2FS_IO_PROG decompress $testfile >> $seqres.full
> +	_scratch_unmount
> +
> +	# 4. check after decompression
> +	_check_scratch_fs
> +	if [ $? -ne 0 ]; then
> +		_fail "filesystem becomes corrupted after decompress"
> +	fi

Same as above.

Thanks,
Zorro

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

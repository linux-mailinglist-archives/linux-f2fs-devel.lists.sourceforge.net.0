Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BCCA70E52
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 01:56:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txF4R-0004dJ-K8;
	Wed, 26 Mar 2025 00:56:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1txF4Q-0004dB-3u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 00:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/K6SdQgOzXbljSbaFexcMPY4TGlD97ZZ0DCXd5kKlOE=; b=Lq44dvrHY3KuhBKnIzxVn0W6rF
 ldwGd5B9M1GhusFZJu0+nMb3KOVYS4DEZfwAIJH+VYf7s5MKkBYUCAvafIs26eyeKnG+HjPqHnQMD
 nzvBTlCfrkbbq/XXWSfM5kI2A+0qluki2gT+pDhFxxm13444m3zaq6k8l+plG8rrvQvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/K6SdQgOzXbljSbaFexcMPY4TGlD97ZZ0DCXd5kKlOE=; b=DcWtEbPl8f+oZpBQPMisrFBQ9p
 D9L4vMdohhPuuw/cTc3SQP4kmvW/JwVBddrGPw6D6DV8LWboSGY7JNRyqN+f+bsa8rzBg8IHdmvSk
 aHEL6MU17WEMtgvqbAHhEuBHS9K4OCMcvEXAgcV9aTC45XA0kNqywMab+WBxSkjtFTrg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txF4F-0004Cu-6i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 00:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742950576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/K6SdQgOzXbljSbaFexcMPY4TGlD97ZZ0DCXd5kKlOE=;
 b=Cnn/EwbaR7jOIpbOuOnGzgLjhEHcu7vfC4rAXiCJ9EbTnfS0EFTRI0f0QndLx7D90pvOO2
 dIcE0zaG1aQ8ZJ/95qoaOdDkqxqra1Wqn9qEVzq2xmb0GIAoxwYSVihlngw5QXO5eFpHfW
 OMxY26sjcbX1p+nCEdj8YuuNL83RMFw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-8cBou4tcOPmBBrgPHIxV4Q-1; Tue, 25 Mar 2025 20:56:14 -0400
X-MC-Unique: 8cBou4tcOPmBBrgPHIxV4Q-1
X-Mimecast-MFC-AGG-ID: 8cBou4tcOPmBBrgPHIxV4Q_1742950574
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2242f3fd213so97980605ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 17:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742950574; x=1743555374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/K6SdQgOzXbljSbaFexcMPY4TGlD97ZZ0DCXd5kKlOE=;
 b=BHz6ZbU4DbdYy8H3izj6MPlt2Xdioxdm7csDHKMahhvZCb/bMtdsQakza21uogj5bP
 PYDorYxo9Ly03MuMfRzx7+xkgLMNO+2eUaMmVhGU4Yh3l6gWKaxYiAM6beZ83fl7O8Cg
 GL7mSDAdJdqDLJbbJOEHmmyLqjKprMD5dFJC5ZijGgG9HRVBkb12KR/KRGTfpZbVEZPW
 gKarGJQOfFqLPoqh0QzL8S6H/b6q+3g24Dq2VWhjw+sm9/x1smLuONcBbsj4Yl9ScuKL
 Sw4/zEyNaMlY73sglZCfFPq8V099wHEDH81X4bIXiua6lERIpmN5p+KbSOglkSBKjHSA
 Qsog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfiW475TFJ525SUr8C24I2tyHhQuIF3lscmvCgePnHJynfM+98f3RFa9vtUl0StmT4UResXPg7Z392+lOxxxIo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRzz69YVdDc/YeqpsPUdxLRNUEJaUWHhDakILlYV08k7juZbMU
 fW4UJQA7K3i+m1zp4ml5drBVWaldIK3jXvz89s+D+eNFfSDbbHi3FCpGVqAzjpYpZ60qUy3a9jq
 80G3TixO1ms7LuDKhXmK/+NdvDeSXxc//oGVwru+5QHkvHP4IqFQBz9KxLiUfP5O3ns+/9XuvKc
 w=
X-Gm-Gg: ASbGncukJiTjES/6mtS7+OSAKiq2cvTKhdwd6/mqz8JtT0KaZK2wQe0hw3hiGDizzed
 ix/m07M60JlUw3QK8QKPW4yDGeNiE5F75rWK/N0VDdtlbQvu7REMrsLccMhxf9fAnHamoXaGzm4
 KIMhiOx0r9nTXYYiRQWCdNxOgL6JLr96F5gefvm/5CWjxct6UNciwJ4DSiA442HIEUCPSDjWXKV
 yjagD/cb/ereT32aPwsnn27jg/CkGkopLmdAbA2igXnraW6H9IxUSs4eUX8L4Tx1q4SnecJ0LjN
 Af/znqnm6dwl3/xOkPby/4vEX8/sH7V+ll26rf7jextsCnFcbGdsZ3tm
X-Received: by 2002:a17:903:2ecb:b0:224:1221:1ab4 with SMTP id
 d9443c01a7336-22780db101dmr319118165ad.22.1742950573811; 
 Tue, 25 Mar 2025 17:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiom4y0E7ipbRr3hLdXuZPOncTeT9D36443uQvS5xvm68/hNHMJ/9AxSqb7DSpSFB4YNjMVA==
X-Received: by 2002:a17:903:2ecb:b0:224:1221:1ab4 with SMTP id
 d9443c01a7336-22780db101dmr319117935ad.22.1742950573486; 
 Tue, 25 Mar 2025 17:56:13 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811f443asm97012375ad.228.2025.03.25.17.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 17:56:13 -0700 (PDT)
Date: Wed, 26 Mar 2025 08:56:09 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250326005609.zrgpfuycgtihmmym@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250325083428.3301950-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250325083428.3301950-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h7dSkPHDTvDWVEnU96lA7ZsGBfuDJaqLHZGVxBB8S0w_1742950574
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 25, 2025 at 04:34:28PM +0800, Chao Yu wrote: >
 This is a regression testcase to check whether we will handle database >
 inode dirty status correctly: > 1. create a regular file, and write [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txF4F-0004Cu-6i
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/010: test dirty status handling on
 database file
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
Cc: Daeho Jeong <daehojeong@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Zorro Lang <zlang@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 25, 2025 at 04:34:28PM +0800, Chao Yu wrote:
> This is a regression testcase to check whether we will handle database
> inode dirty status correctly:
> 1. create a regular file, and write data into the file
> 2. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> 3. write transaction data to the file
> 4. rename the file
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> 6. drop caches in order to call f2fs_evict_inode()
> It expects kernel panic will gone after we apply commit 03511e936916
> ("f2fs: fix inconsistent dirty state of atomic file").
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Cc: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix to unset atomic_write_pid to avoid killing process w/ dummy pid value

This version is good to me, if no more review points from f2fs list, I'll merge
this version.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/010     | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/010.out |  2 ++
>  2 files changed, 71 insertions(+)
>  create mode 100755 tests/f2fs/010
>  create mode 100644 tests/f2fs/010.out
> 
> diff --git a/tests/f2fs/010 b/tests/f2fs/010
> new file mode 100755
> index 00000000..50e37817
> --- /dev/null
> +++ b/tests/f2fs/010
> @@ -0,0 +1,69 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/010
> +#
> +# This is a regression testcase to check whether we will handle database
> +# inode dirty status correctly:
> +# 1. create a regular file, and write data into the file
> +# 2. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> +# 3. write transaction data to the file
> +# 4. rename the file
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# 6. drop caches in order to call f2fs_evict_inode()
> +# It expects kernel panic will gone after we apply commit 03511e936916
> +# ("f2fs: fix inconsistent dirty state of atomic file").
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_cleanup()
> +{
> +	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
> +	wait
> +	cd /
> +	rm -r -f $tmp.*
> +}
> +
> +_fixed_by_kernel_commit 03511e936916 \
> +	"f2fs: fix inconsistent dirty state of atomic file"
> +
> +_require_scratch
> +_require_command "$F2FS_IO_PROG" f2fs_io
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +src_db=$SCRATCH_MNT/src.db
> +dst_db=$SCRATCH_MNT/dst.db
> +
> +# initialize database file
> +$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $src_db >> $seqres.full
> +
> +# sync filesystem to clear dirty inode
> +sync
> +
> +# start atomic_write on src.db database file and commit transaction after 3000ms
> +$F2FS_IO_PROG write 1 0 0 zero atomic_commit $src_db 3000 >> $seqres.full &
> +atomic_write_pid=$!
> +
> +# wait a moment to let atomic write starts
> +sleep 1
> +
> +# it will dirty inode when updating i_pino
> +mv $src_db $dst_db
> +
> +# wait for atomic_write commit completion
> +sleep 4
> +
> +# drop caches in order to call f2fs_evict_inode()
> +echo 3 > /proc/sys/vm/drop_caches
> +
> +wait $atomic_write_pid
> +unset atomic_write_pid
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/010.out b/tests/f2fs/010.out
> new file mode 100644
> index 00000000..1d83a8d6
> --- /dev/null
> +++ b/tests/f2fs/010.out
> @@ -0,0 +1,2 @@
> +QA output created by 010
> +Silence is golden
> -- 
> 2.48.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

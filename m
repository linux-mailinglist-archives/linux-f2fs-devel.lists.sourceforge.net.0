Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9FA6E7E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 02:19:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twswr-0005X7-11;
	Tue, 25 Mar 2025 01:19:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1twswo-0005Wz-TZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 01:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QeXy7bC9ytkDSw1rq/sYqAEDub4dZTXCLp5YKB3fW6I=; b=e8cdbIdJFxZLMf2JVYid24+eSI
 DX18msJjIP82PAwnU/Vlb+sJPI3hY9uix+ajtbjUQQ/RSksX3tlFAm/jWa7Ufw6JrMhIHUjTseVm5
 zQlz0PQANZkWeZfWiJF2wFcZtGyTDjieFc2ytk63bg4GZTsrPeyQgpQbDNT5Y5CmGm04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QeXy7bC9ytkDSw1rq/sYqAEDub4dZTXCLp5YKB3fW6I=; b=D5uqV3xSeZ6kuHiyxeeBuGEvau
 i3Zk4T41GfzX/bAigWqUpwP8iUPUSwpLRZ4q25s7o6qtAMpehTStTlPwlc//Iq8NayJdqTaf39vr1
 pFHeG1yfzB7OpAjNXiPtoslELg8HMG07nO6ocW4DmijxeEq/+iGbCm6s/lvu7LRrp6l8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twswi-00022X-HA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 01:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742865541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeXy7bC9ytkDSw1rq/sYqAEDub4dZTXCLp5YKB3fW6I=;
 b=cj+6aFVU2/zRpNQVUJvoaVnXHzaFtZY9/5C6kHk92W0SvUHe9Q+1x7e68fIbwRRBPsH33T
 nrH5t7EhDOgc2Q9/FqhX/wq0HKfybuTvNC4tyPKJLx4F8J8wkLD7VCshHQMHNQ31jmbhLA
 deOacnNjGNg64FEg4bwW8ri+OnFhNqE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-qMgnwPOoO0SvCKjTf3pxog-1; Mon, 24 Mar 2025 21:18:59 -0400
X-MC-Unique: qMgnwPOoO0SvCKjTf3pxog-1
X-Mimecast-MFC-AGG-ID: qMgnwPOoO0SvCKjTf3pxog_1742865539
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2240a960f9cso80874315ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 18:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742865539; x=1743470339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeXy7bC9ytkDSw1rq/sYqAEDub4dZTXCLp5YKB3fW6I=;
 b=j8kWrztg6cPmackMCWVoSS5HRcD/KWvBx1NaPt5lZs6GZx2iEZBJHb/pN66qLkwZhK
 LeEIjjPzBqm0WN/W4KBY9bcFxLrNmQ9G/cJcMQ5Q7jwc2wQ3MsBqUsu4xEprc/iGz7ao
 GWZrIwHG054uudeSvfzGGZWLz35VKtQtrC0kcqTXmABj1AEsJ8mFbqm8mNrzKKAN2jsC
 xi6Hb7VN+95LL+6IteKqKDIk30pM+1x5TLqrywVBk4N7wbZ5zrZ4XDoRQPAEz10TMB9w
 hQ82kPwSIqk+CNr922Ec70Y85Cj4C80obGNXrVqg1USwrjeseuqf+7o9fNPjyrdtP53A
 pHpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjY9fGdT8nYHubuql9C4no4UQ8FNMUHpPFJJon83Xqn136031sgORO6w0OeXnWyP0TwcFZ1bEgDeX3EwNXoOEv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwwfGmkrH9DUtVUp3N55b99RaFesjAImh9kJcInGC2yueKkG01H
 fVKTJicg+jwePY+Sx+A1rntyR2FJgQma6LKaSPb8CitbTZxtvBs0W3aPXyzFMeeVUprBA8g3eke
 p510yLoYVbMkYeb7fB9QqoNXFBkhjoYfcHSumfK7ynKld0Ml2dnCmLH6Ie3Rboj4F969UFmJtox
 o=
X-Gm-Gg: ASbGncsirJvjn6ansZ2oehZofZ/wiYQpXRGjZLVNW/PXLyZMBk33x6oIkvDMZGRQwPz
 TqW+S3wMT4/lGFc5DeqcYGhhDweXu7woK9WIfKjWPCxN7ASRVXbZ3PXC0z7WHyCcqR9xFRd+smJ
 K21X6TN0INT796PwoQ9rIW6rjGGEEn1zKK8Q2Wza77d0OvfbUN3NRRIuE+oLWXQypXtXs8Y+zBV
 sXF/YeoNZ2LXByMGj58oVrtipS6FMIIC3Mj4ep2LEu6oEJf4UB/Sczfxt/AGQr82IunjVnfeXai
 lKrSUK0MNMx0bFesCWmjL1w3gRuT8PcVvU8QwOZ+SbxsKqu2qA3oSV0b
X-Received: by 2002:a05:6a00:1826:b0:732:2484:e0ce with SMTP id
 d2e1a72fcca58-73905a139fbmr19006179b3a.17.1742865538626; 
 Mon, 24 Mar 2025 18:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEO9+WpdOEqQ7A5ng1Den/8MVf0K7JGB87AUqqAfvuRXdpcuQlUXrUFU2gmgqgHSlO0EUdvg==
X-Received: by 2002:a05:6a00:1826:b0:732:2484:e0ce with SMTP id
 d2e1a72fcca58-73905a139fbmr19006150b3a.17.1742865538048; 
 Mon, 24 Mar 2025 18:18:58 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390618abc9sm8736336b3a.165.2025.03.24.18.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 18:18:57 -0700 (PDT)
Date: Tue, 25 Mar 2025 09:18:54 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250325011854.svncwerxilkimg5j@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250324123836.3098377-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250324123836.3098377-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jGI3-sdcY1E6YkVFKyihzeCw4mu2P88b7Z-pqk0xPWw_1742865539
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 24, 2025 at 08:38:36PM +0800, Chao Yu wrote: >
 This is a regression testcase to check whether we will handle database >
 inode dirty status correctly: > 1. create a regular file, and write [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twswi-00022X-HA
Subject: Re: [f2fs-dev] [PATCH] f2fs/010: test dirty status handling on
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

On Mon, Mar 24, 2025 at 08:38:36PM +0800, Chao Yu wrote:
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
>  tests/f2fs/010     | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/010.out |  2 ++
>  2 files changed, 70 insertions(+)
>  create mode 100755 tests/f2fs/010
>  create mode 100644 tests/f2fs/010.out
> 
> diff --git a/tests/f2fs/010 b/tests/f2fs/010
> new file mode 100755
> index 00000000..360c09b9
> --- /dev/null
> +++ b/tests/f2fs/010
> @@ -0,0 +1,68 @@
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
> +	kill -9 $atomic_write_pid > /dev/null 2>&1

[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid

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

So after this line, the $atomic_write_pid has been released. If so, how about:

unset atomic_write_pid

And then in _cleanup function .... (see above)

Others look good to me,

Thanks,
Zorro

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



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

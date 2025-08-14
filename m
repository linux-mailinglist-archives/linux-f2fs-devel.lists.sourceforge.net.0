Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E8B270A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 23:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOE7SXo5g5aAX8ZybegcatAieIh/CBSfymV3Dmaa/co=; b=cah8n95mFEBLhjObq4Asb33oDE
	w5uQ2XveesGpggc9+jnlEudICE0UPM0eF1fAGJzL9n32apB1JyT0Y6opUEO6nxW4SB30SJh8bs9Va
	KFtLjLidk1PMEI+nnvADjeEEt0HvVUgZdAq22UlA8I8ii0bngPVXp/UpUXc70lpSNyCs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umfJ1-0002H3-OQ;
	Thu, 14 Aug 2025 21:16:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umfIz-0002Gm-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMdTCwlysy6xreHQRz5jmjj6KgJdkNqFidZkpPK734c=; b=jHlSguL2AiAc52ryiqvjrDSOfw
 nssFBemRnXfgVYj/MzTdPqq9EVrsuQ8wDpNYJ0Etai/HlaOdchSsHy1Wr5goEDHYvDnRANMW38r9o
 I3xckwZ88kIPA/u5iXwK81Op6VHtK5pMZ+cGTWZk+xRk7ALiS+1RaFiH8xboAuYQbXTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMdTCwlysy6xreHQRz5jmjj6KgJdkNqFidZkpPK734c=; b=gzY28OOGKs5dRYTs51O7M039KW
 c87PmpFZA2GPwqaQcsRmzQPGKd0DYTjZ07FXhvG6gveBavrrtuJrlZF1R+OtbxQufiTa1ases6rAL
 0rzuzYVMC+H4PgYNK3dH4q0Xwy1dKOilV6cbOcr8cHYQmYxTLdSIsdXhNwgMUdNTej4g=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umfJ0-0002fK-3c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755206162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMdTCwlysy6xreHQRz5jmjj6KgJdkNqFidZkpPK734c=;
 b=B1C6/NXEJ+bedayCwA9nDv3EPNICE+vpYsp/v6J5fdXDV9xYDUnI4AlXQKAXIZ47VxthEI
 vmV3u5UD/lOFsTze/dA/WDLz4bTgiAgN1YvzPfveeDFNtxohx9jS3b5Ihrq6X4J5fb49NT
 vx91hLfd5YXql0/PLSBq+VQ9De+FOOg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-r7oEa-bXPy-peA0YZxvS9Q-1; Thu, 14 Aug 2025 17:16:01 -0400
X-MC-Unique: r7oEa-bXPy-peA0YZxvS9Q-1
X-Mimecast-MFC-AGG-ID: r7oEa-bXPy-peA0YZxvS9Q_1755206160
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e8afd68so1132423b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 14:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755206160; x=1755810960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMdTCwlysy6xreHQRz5jmjj6KgJdkNqFidZkpPK734c=;
 b=WjNnTvbItEAOQNfJ+q87gwXV6beh3L0ZRATkyRDYYP+/fSP++wlqMMB9sGuVr2BsEv
 bXf/KEB5BGboIs48PlZISfICB1YClS2eKFRdY1DP6mUT1mX0mfiIcYGRVp/PJwodu5fF
 v3KCjq4xKkuVWbyCjnVRw2fC3pGDWgUhdtDXI/ZdzY7hbHnuZ8AfhXfYFF9udSsfJNVz
 X5knHdoFLppo/TI/FTej0o66dHgfQ714e6kKceNAxc7Rxz2nbtowfen8D+ISSCSsaWz7
 63fFkXeRD2CchXDTjSALvZ2fKMPTah74L9O84joRSGK834eWKA0UYZz8UpAW5f1VU1R4
 IpJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIjuLkjKjN640OWaF0SSIi9uOR/BoHfVfD7UX90wpsLbz35vqtvVaB0ykmB+zEJiyJryU7/ktQb80QAilwpqwL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YylB17gtup8LKVDLkzJPO6UGwSsmkK5g3mK7cxwXUoKAULycMj3
 JVG4kwgy/7sNKXsPoNkwU9K8Ni3PIWcv1HJzq5D0tNV/qU5XyNvoxV1hAHawfyyPKcwqjuMi6mu
 xJJRVSPXJ89Tb8R9qarl5ZVhKR2kHgYI8LlqexcvuskKNLVhdsiZEaqz+Hs0/Rtc1IS0UPiP2FX
 EasAI=
X-Gm-Gg: ASbGncsh0Kvu+Et2OSFeklvlqL+blWAP0m8r3A+KL+TMScSAhLgXV0xN5Rr8aCas65d
 wmhtnsb96EnQmuUc5jYUIUk6gUToiwmX4lB4aU0Muuf72UEbIrndeZoEEe4MhdETBDXCl96BB2a
 X1+yqt4CGAStW0fOLXm1/DUVaCEmrBAN7Om20Afj/uClQFdPvp5cRr3RimptJqcYzUp3iC18Ae3
 F8KU7sq4bol++fdTLHjggQfhRvmyzDS5wOrUVcOUx0J/DuHTAYvlLSLtoibrvpLNBkzCKmrJK32
 0ANDolomBhVustW8GtCYxfjGXSnxs+TMJcL4Zn7wKECTt4MTLuFqLxHNYSKdTBeeMtzBNTgvWOk
 NCVMa
X-Received: by 2002:a05:6a00:4f88:b0:749:4fd7:3513 with SMTP id
 d2e1a72fcca58-76e2fd81e4bmr6662714b3a.16.1755206160167; 
 Thu, 14 Aug 2025 14:16:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjDWZdoybujOkmDsFKuadpWF234b1I5kCtJywZV7uVSmUeB1zkU78BvFCdXWYN6bA5ygNYJA==
X-Received: by 2002:a05:6a00:4f88:b0:749:4fd7:3513 with SMTP id
 d2e1a72fcca58-76e2fd81e4bmr6662686b3a.16.1755206159764; 
 Thu, 14 Aug 2025 14:15:59 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bdc8c7661sm32942344b3a.76.2025.08.14.14.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 14:15:59 -0700 (PDT)
Date: Fri, 15 Aug 2025 05:15:55 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250814211555.wytxo2qrq33gkadq@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
 <20250814090712.2119455-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250814090712.2119455-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wFuE3JwW7wsHqB8Fxb21Kbw9O4e5n2kXlvbyv2s2Ld8_1755206160
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 05:07:11PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create a file > 2. write file to create a
 direct node at special offset > 3. use inject.f2fs to inject nid of [...]
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
X-Headers-End: 1umfJ0-0002fK-3c
Subject: Re: [f2fs-dev] [PATCH v2 2/3] f2fs/019: do sanity check on mapping
 table
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

On Thu, Aug 14, 2025 at 05:07:11PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create a file
> 2. write file to create a direct node at special offset
> 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
> 4. check whether f2fs kernel module will detect and report such
>    corruption in the fil
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

This version looks good to me, thanks for this new test coverage :)

Reviewed-by: Zorro Lang <zlang@redhat.com>

> v2:
> - use _require_scratch_nocheck instead of _require_scratch
> - use $XFS_IO_PROG instead of xfs_io
> - add comments for why exporting MKFS_OPTIONS=""
>  tests/f2fs/019     | 42 ++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/019.out |  2 ++
>  2 files changed, 44 insertions(+)
>  create mode 100755 tests/f2fs/019
>  create mode 100644 tests/f2fs/019.out
> 
> diff --git a/tests/f2fs/019 b/tests/f2fs/019
> new file mode 100755
> index 00000000..2307bd96
> --- /dev/null
> +++ b/tests/f2fs/019
> @@ -0,0 +1,42 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/019
> +#
> +# This is a regression test:
> +# 1. create a file
> +# 2. write file to create a direct node at special offset
> +# 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
> +# 4. check whether f2fs kernel module will detect and report such
> +#    corruption in the file
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +_fixed_by_kernel_commit 77de19b6867f \
> +	"f2fs: fix to avoid out-of-boundary access in dnode page"
> +
> +_require_scratch_nocheck
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount
> +
> +$XFS_IO_PROG -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
> +
> +_scratch_unmount
> +
> +$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
> +
> +_scratch_mount
> +$XFS_IO_PROG -c "pread 3700M 40M" $testfile
> +_scratch_unmount
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/019.out b/tests/f2fs/019.out
> new file mode 100644
> index 00000000..2f7469e2
> --- /dev/null
> +++ b/tests/f2fs/019.out
> @@ -0,0 +1,2 @@
> +QA output created by 019
> +pread: Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

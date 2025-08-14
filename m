Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177AB270AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 23:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BPasJbUFHUCa2ZqI63MH+hAcj0BpBVNk+KO24b9O6Q=; b=SzvxvH6a/yKP3Uux1NmpXv+27o
	9PP8SZ4ArpDCrs8HzJr5WL/FaYYx56yQHfmRi2mDo2iKijzzrWjF8GZnYK1m/e1ECtMpw8GKYuZfd
	0ly2xHZ185AsD8jOlmw0ZtRwxPRWLgtdzCQZgAkbbYbsnm1fwONYBy1/zPGozncDnMcg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umfLf-00017N-2V;
	Thu, 14 Aug 2025 21:18:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umfLd-00017G-Fs
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hZuTUdKc/I1Yb/5k2Ky1Puj44H2eYVrFSE0veEL1CdM=; b=ms8wqf6oBTdSG+zn2VVhbYyhjH
 MaOVwuR/3e/MM5Q5EOyEVp8nzV3sV53X4l6NKcVepwdAIIaOo2PP6pfa0gECQzSu06/sFEhC60Gju
 z8mofZX0neMk6AjVk3OSNglkcFRdjB/KW1mGJrfQcPAwbbZ0hWD3mg3bf8NDWsNo5gMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hZuTUdKc/I1Yb/5k2Ky1Puj44H2eYVrFSE0veEL1CdM=; b=UeGXfRs5L28pQc8g4miO5AtjWX
 ii1F9boP/dVT2P4nqencXBRzpyFqc7Ki9fNaj1/IHAclkQcFnMTxDUOeusjRRsmQjAgogMIgO5s7D
 GeDdgoMx347sDQxpr8M+l8qMrgrRwFzusCAVMWlFt60C1y1ghqxxAFZ9A3X2fAxXbbEs=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umfLd-0002ob-0U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755206326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZuTUdKc/I1Yb/5k2Ky1Puj44H2eYVrFSE0veEL1CdM=;
 b=CX4UewNdcQiLYz+BdykXuvaiVwJIwPctiLoEvETV3F9wL1xBfOI1RN/kzeZwL5s4oI9oRa
 eCycgkZ2IGCe3Equ/5YD2PPt8qfF4J8gBOBGIz5vsk69jloPaDHoRtd2DuUQGfed2b0npf
 M2EguXGHTxMIDNS4EVaN1b6RFNAOkzM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-Ku86-z4iPJ-zWjsR1mUqTA-1; Thu, 14 Aug 2025 17:18:45 -0400
X-MC-Unique: Ku86-z4iPJ-zWjsR1mUqTA-1
X-Mimecast-MFC-AGG-ID: Ku86-z4iPJ-zWjsR1mUqTA_1755206324
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24456ebed7bso17479995ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 14:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755206324; x=1755811124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZuTUdKc/I1Yb/5k2Ky1Puj44H2eYVrFSE0veEL1CdM=;
 b=tLH9OVQhpLwPCf2hZ5G4mRYJka/zvWlgTm6mY7uPfzB2bvRoUZ5QJn7WDcuQWyB5dK
 Yyf5vWx78qwKwQyUyqbsYkqgupzWqvyD9BHHtGjcIV0tx6Aqyd7VF4ZTp1YdMq61VOEt
 whA6jlN5olGtYZZSVuNafH66GWkTArgj9fFtn+qCSwiLo6dR6wUKEeSec+pH/apncmi1
 idiae2T/ApNvQwDKkznG5o5S8b65/Ywmr4hAR18TJokHMp9mNlyaMdZzJ7RjLNRDz6KQ
 DTipr82aFF0WMUqCjqi/BDplRqHysmefgP8iKpR8LSS+euH9MNcDkcu0H3+v9NSyBno5
 I70g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg0TMDhtOp5hP/41RshRDBUTgCtOc5IKQlSqBH5zVqgQrWXiVpqPZpV46vGwmjBpSUBjjLYeSRnj0hCyqFcXin@lists.sourceforge.net
X-Gm-Message-State: AOJu0YydohWV4hnAqDrOeI0y/dzPgw6RM9rdYb5Ev2WcJNri4L9jRh47
 b8SK1f5OujNXFWRw9wPot/BCpifWdOebEUVkyHDVGBChKPV0vxJpXHLnhSh6ir+nmoncQfDPs+L
 f4XKOpBNGovP0HS7JeMdDK9vwCFIMtZ/Fbe6Py8IDK/2Cv+SCfEKXSBYaMGovTMYjk+/GUt1ALX
 XybE5bx3BojGE=
X-Gm-Gg: ASbGncsGVMZazuC0mhMDwMd81ogJXDx8GJ7ZuUV8SNTiCKBMwshnhKFy8VU/fa5Ur2V
 F+f5Er9Yp0wxXhcKbJmU7Rtrbnl4EUXMTSipS6SzHO4Jhvk4TNK46kLYMk+0H7GTghQSGrYTktx
 oRwQ63nM5ZnvrbF0XLzOi/A5Lh3O3E8ei+aqkUTPXXyTIC/rbKBT7yWqFbgoVoH6dLoy62f3JTa
 FhaIUKRmdEHu/nRaZt0e2hu2uejx4IFOAYtPdoozkeMBMgGtKYrDrBdPLlkSiCJBZUnS8ZElwmf
 w/TUbFsVm/EU6o4ucWrXs20v6tO/BUQoEHKKF6sUK70ESCFb++6n/FNCabJ7/PtXhFmtTkcGwMD
 Nqrkn
X-Received: by 2002:a17:903:1b23:b0:240:5c75:4d48 with SMTP id
 d9443c01a7336-2445c678809mr52849755ad.25.1755206323803; 
 Thu, 14 Aug 2025 14:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSWyGijicnIQK/ZKF7aBW005jkVYKVn8+7B9/kz03OKnKt9shCIH+cyeaBgS1Lj2jTB+Uy5Q==
X-Received: by 2002:a17:903:1b23:b0:240:5c75:4d48 with SMTP id
 d9443c01a7336-2445c678809mr52849545ad.25.1755206323459; 
 Thu, 14 Aug 2025 14:18:43 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaaf1bsm363513915ad.159.2025.08.14.14.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 14:18:43 -0700 (PDT)
Date: Fri, 15 Aug 2025 05:18:38 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250814211838.64o3q3jurbxvwp3a@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
 <20250814090712.2119455-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250814090712.2119455-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EKyqYOdfkVZCjNRuidjQTS4jXva5nJJMCw-raJSBB4k_1755206324
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 05:07:12PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create directory > 2. add a new xattr entry
 to create xattr node > 3. use inject.f2fs to inject nid of xattr [...] 
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
X-Headers-End: 1umfLd-0002ob-0U
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs/020: do sanity check on
 i_xattr_nid
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

On Thu, Aug 14, 2025 at 05:07:12PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create directory
> 2. add a new xattr entry to create xattr node
> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> 4. check whether f2fs kernel module will detect and report such
>    corruption in the file
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - use _require_scratch_nocheck instead of _require_scratch
> - add missing _require_attrs user
> - add comments for why exporting MKFS_OPTIONS=""
>  tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/020.out |  2 ++
>  2 files changed, 53 insertions(+)
>  create mode 100755 tests/f2fs/020
>  create mode 100644 tests/f2fs/020.out
> 
> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> new file mode 100755
> index 00000000..7ce1f92f
> --- /dev/null
> +++ b/tests/f2fs/020
> @@ -0,0 +1,51 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/020
> +#
> +# This is a regression test:
> +# 1. create directory
> +# 2. add a new xattr entry to create xattr node
> +# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> +# 4. check whether f2fs kernel module will detect and report such
> +#    corruption in the file
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +. ./common/attr
> +
> +_fixed_by_kernel_commit 061cf3a84bde \
> +	"f2fs: fix to do sanity check on ino and xnid"
> +
> +_require_scratch_nocheck
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_attrs user
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +testdir=$SCRATCH_MNT/testdir
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount "-o user_xattr,noinline_xattr"
> +
> +mkdir $testdir
> +# add a new xattr entry to create xattr node
> +$SETFATTR_PROG -n user.abc -v 123 $testdir
> +
> +_scratch_unmount
> +
> +# inject i_xattr_nid w/ nid of inode node
> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
> +
> +_scratch_mount
> +# may potentially trigger a deadlock w/ double inode_lock on parent's inode
> +mkdir $testdir/dir >> $seqres.full 2>&1
> +_scratch_unmount

Can you provide a test result to prove this test case trigger a failure
on general kernel (not debug kernel). If it can, then this version is good
to me :)

Thanks,
Zorro

> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
> new file mode 100644
> index 00000000..20d7944e
> --- /dev/null
> +++ b/tests/f2fs/020.out
> @@ -0,0 +1,2 @@
> +QA output created by 020
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

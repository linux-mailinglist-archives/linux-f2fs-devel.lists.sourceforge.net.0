Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDBB27093
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 23:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dWYYFee45fapts2KTVxUarDWT/UVJIEGdU2QPI9+wA=; b=ldaPZSfEz+4eQpI01oDmJGMlQm
	lEHoLUFC4qsUvth7f1bWbxb88DaSVIHIa4MVKLacpCgxiDFkJW4mFkFPuZhnGrnGbk/ZlpaiOSWsY
	AqUg1+C3z3o6HojG40qNzgQrfdr1uZQ8qfd0GjGa7MNs7Ce9Ve3dvY8f7Dq7wGnj+ZZI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umfDt-0002KZ-DN;
	Thu, 14 Aug 2025 21:10:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umfDs-0002KS-Kf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1p6iASRLcGUGil+NJHdLdUeyP1HO0f2x6yFT+1wUto=; b=Cq4Z6tpvMh6xMGWbZxcmXZ1uuH
 GOxP4h1udFrTMBJXoCRfJ71kcXzT/ryemrSvHoBUAEwpQk1ke/5Op/11Di+BI4vy21LXWuI2lYoqV
 SzmVEV8SmIuZMKsum+XVoDV7tU93spAVc8S6wfBoxnVLHeMWLxC2tpA+pk8ta4KtoSaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1p6iASRLcGUGil+NJHdLdUeyP1HO0f2x6yFT+1wUto=; b=jsgK50BQ1HImckEuGBPfbw3p06
 PA5ti6WdHAjnbdPLJ+uCxahPZeaYd4S5dlIOVGRvprp6I+FF2A5GPoE+zngS09jPWoaTDayKR7J31
 nTjkfFAsJJOAmXP4TGbyO7MIBrXaYV8FnHFhtWEslebccmsr4m6m4NM9947nAREO9K5c=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umfDs-0002RZ-42 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 21:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755205844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1p6iASRLcGUGil+NJHdLdUeyP1HO0f2x6yFT+1wUto=;
 b=WeBs6H5s/kQikgSizRSLJTuKuOlINvrLoeMFM6qyzRRAc4GswibGkUgf+gato2detK+21p
 ews9t8rvJtrnOI5J+o3yyToMC/4zfv60MwXuduzliDPvxJL5SzawdVmmMXqlO9W9Ij28qA
 zb1pq/x1gf9Y+/RLOzc0O/FUx2n/XhI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-vds3YjCwPwCmNAfZ2_qKiw-1; Thu, 14 Aug 2025 17:10:41 -0400
X-MC-Unique: vds3YjCwPwCmNAfZ2_qKiw-1
X-Mimecast-MFC-AGG-ID: vds3YjCwPwCmNAfZ2_qKiw_1755205840
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-323266dca73so1303667a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 14:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755205840; x=1755810640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1p6iASRLcGUGil+NJHdLdUeyP1HO0f2x6yFT+1wUto=;
 b=urGS5ipeZh19yip7svdaZkj+b9jRFqsUC/783WRk4TMs6iik06Wqn5r262KvzmJZNC
 hfCokF7/LAf+wRpKVd0VtcDljFtM1PJ6g2GxQwf1kORcToBfmPFR5FStP6B01kOmY9kQ
 9GaEn//f5GOBmMZF183pljqjRP4VdIRF1F4apprPwYzSb7E8M0afYEtaLD5b7YG7ghcl
 VvKG3xd9wapLgaYT7lJ11cwxWCizBEhdoS+jvEJsAaZFhTH+UtJ2EXRmYioAqAnywAzx
 rcjQ7f7u5pb9dzZiaDNwSPs8Cf0lZXm2ZwXIduetfCDFsAri89r+RyodK3vAaATM/jk3
 y91g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbFTykEenjU/XpYlzr9PGJ7XRx+bt4thUYIxweqGdIFUYq0w6StY9PEDKX+sDcP7wgaybTxVlViXZmx87uL6cA@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8YmRkak69I/Mm0wXjvWFKaDBhQM4/sukM0aBNs+tnlL6cFzHn
 mK7sDRnQAuhyeHwtCddH0tkTsrvwnlASYnYMPcnUVYpbYLxBiGLQoNbdEDhYoKXL9wjqQK56/1Y
 fvcGkADkSN1l28UG2BQmyp/2ajbI56g6IrRlH3QQ6KK+DeCSvo2WYd7JNPRWMRMieFrCl17g2PK
 7rzAE=
X-Gm-Gg: ASbGncuLOz7Kl48uijvqZgMBhc2hcLldnALBVaADp4v87ygW/7L9ncxWzxrpWhgwLRM
 3OprvCElgqR8oen0kieN9jssQXRERte/+xi9LmakRYsGLsLHYTd1geHjrpPZ9eWe/mbtQS6gegA
 5zPwSgrj3VieS4wG0lRgC8ildmN+o5WGA8FYxznNbHTRGQwWXnnSClYM9aNq8+Wj+8xEStTRbUn
 FBmjtku3/1koHPAxquiMCvpSs7Zox+R+S7SMfiE9DfvHb2Do+e1on8j0x4aOCDn7VhrvE2FpjEy
 QESQe8Hh+3NV5JuI1VOvy30yVcZCsDZH2iov6fmyIRAN72WMCeTtUic+wBfM1XvzMYIxWjcjDhu
 ZYJeL
X-Received: by 2002:a17:90b:4cc3:b0:313:f9fc:7213 with SMTP id
 98e67ed59e1d1-32327a52000mr6942048a91.21.1755205840185; 
 Thu, 14 Aug 2025 14:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsCbXWyKdDjP0tP1qpujrL82MSjEjK5m9kMdVMb8Cjh6VfAngt41evmn0Tc9j5eHhMZeB0SA==
X-Received: by 2002:a17:90b:4cc3:b0:313:f9fc:7213 with SMTP id
 98e67ed59e1d1-32327a52000mr6942023a91.21.1755205839765; 
 Thu, 14 Aug 2025 14:10:39 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32330f8329asm2838253a91.3.2025.08.14.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 14:10:39 -0700 (PDT)
Date: Fri, 15 Aug 2025 05:10:35 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250814211035.3eqltmi4wkuxuhq7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250811094415.1053545-3-chao@kernel.org>
 <20250813153407.b2ldb3u3zuw4ckbs@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <580b6314-4c79-404c-b8cc-c3d416bc09e8@kernel.org>
MIME-Version: 1.0
In-Reply-To: <580b6314-4c79-404c-b8cc-c3d416bc09e8@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4pHuiOa1SUp7m3UWqRBtaN8YSlBMHQdk9ihUmpdxE5M_1755205840
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 03:54:59PM +0800, Chao Yu wrote: >
 On 8/13/25 23:34, Zorro Lang wrote: > > On Mon, Aug 11, 2025 at 05:44:15PM
 +0800, Chao Yu wrote: > >> This is a regression test: > >> 1. crea [...] 
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
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umfDs-0002RZ-42
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs/020: do sanity check on i_xattr_nid
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

On Thu, Aug 14, 2025 at 03:54:59PM +0800, Chao Yu wrote:
> On 8/13/25 23:34, Zorro Lang wrote:
> > On Mon, Aug 11, 2025 at 05:44:15PM +0800, Chao Yu wrote:
> >> This is a regression test:
> >> 1. create directory
> >> 2. add a new xattr entry to create xattr node
> >> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> >> 4. check whether f2fs kernel module will detect and report such
> >>    corruption in the file
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  tests/f2fs/020     | 50 ++++++++++++++++++++++++++++++++++++++++++++++
> >>  tests/f2fs/020.out |  2 ++
> >>  2 files changed, 52 insertions(+)
> >>  create mode 100755 tests/f2fs/020
> >>  create mode 100644 tests/f2fs/020.out
> >>
> >> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> >> new file mode 100755
> >> index 00000000..a6a08c8f
> >> --- /dev/null
> >> +++ b/tests/f2fs/020
> >> @@ -0,0 +1,50 @@
> >> +#! /bin/bash
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> >> +#
> >> +# FS QA Test No. f2fs/020
> >> +#
> >> +# This is a regression test:
> >> +# 1. create directory
> >> +# 2. add a new xattr entry to create xattr node
> >> +# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> >> +# 4. check whether f2fs kernel module will detect and report such
> >> +#    corruption in the file
> >> +#
> >> +. ./common/preamble
> >> +_begin_fstest auto quick rw
> >> +
> >> +_cleanup()
> >> +{
> >> +	_scratch_mkfs >> $seqres.full
> >> +}
> >> +
> >> +_fixed_by_kernel_commit 061cf3a84bde \
> >> +	"f2fs: fix to do sanity check on ino and xnid"
> >> +
> >> +export MKFS_OPTIONS=""
> >> +_require_scratch
> > 
> > Same review points with patch 2/3, 
> > 
> >> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> >> +
> >> +testdir=$SCRATCH_MNT/testdir
> >> +
> >> +_scratch_mkfs >> $seqres.full
> >> +_scratch_mount "-o user_xattr,noinline_xattr"
> >> +
> >> +mkdir $testdir
> >> +# add a new xattr entry to create xattr node
> >> +setfattr -n user.abc -v 123 $testdir
> > 
> > You can call `_require_attrs user` at first, then use "$SETFATTR_PROG"
> 
> Okay, will update them in v2.
> 
> > 
> >> +
> >> +_scratch_unmount
> >> +
> >> +# inject i_xattr_nid w/ nid of inode node
> >> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
> >> +
> >> +_scratch_mount
> >> +mkdir $testdir/dir >> $seqres.full 2>&1
> > 
> > May I ask what kind of failure will this case hit, if there's the bug?
> 
> Bug like syzbot reported, you can check the details in below commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=061cf3a84bde

So you hope to trigger a test failure by something likes:

"generic/361       _check_dmesg: something found in dmesg"

?

Did you try that, if it can fail this test on general kernel?

Thanks,
Zorro

> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> >> +_scratch_unmount
> >> +
> >> +echo "Silence is golden"
> >> +
> >> +status=0
> >> +exit
> >> diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
> >> new file mode 100644
> >> index 00000000..20d7944e
> >> --- /dev/null
> >> +++ b/tests/f2fs/020.out
> >> @@ -0,0 +1,2 @@
> >> +QA output created by 020
> >> +Silence is golden
> >> -- 
> >> 2.49.0
> >>
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

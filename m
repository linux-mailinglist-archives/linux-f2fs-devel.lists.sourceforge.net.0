Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 489599B4205
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 07:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5fIg-0004uy-PH;
	Tue, 29 Oct 2024 06:01:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t5fIe-0004uq-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afQOoDJ7N3SKirkDmCB9Dck3TWY2wnsLXd8EeJ4bwDs=; b=hN5RLPRPYMVOiu5mP+2qHzk6mw
 KhxJTfsN0ZUin5pKrisZzlMVjA6s+4t58LWp5USkDYPzGYITPj8sfSXYTrfrvF24R7B1payRaHwzb
 fbe3p7dklrMoChvYGK71iElpZNuWsNNcHC94Riy2sJN/eoY7PVGDhEtpFggNX1tnS8+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=afQOoDJ7N3SKirkDmCB9Dck3TWY2wnsLXd8EeJ4bwDs=; b=BYYYvAXkhlhg2nukMbjQrfNEV8
 mFDIR0px4VnDa6CIKnxNFdOL9unhYjP/KhZb3/f6L4KcRlHr7EpbjK/pCUlkQvBY1A3W3Ik4vBthr
 Z2kblXKo5zpU2umFFaVhogO/L4/yED0V8oLcq0dnwfS6U7u+HFa/wZWWLwgYXXMyoa/I=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5fIe-0003U4-Qo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730181701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=afQOoDJ7N3SKirkDmCB9Dck3TWY2wnsLXd8EeJ4bwDs=;
 b=goJRWkq/3s+6zAATBy7G/n3KFMn68MU/BsQ15Zo03uE/ruHDim3AS/2qAtBZkjYgCgNYXW
 XykkUnAE7WnLHlVE4982HLqtJMWdBdk+6SLoucfawGBy5ljrRTvZG95qeRiM4/f8c8rIKp
 Q/TP/z+PlemaPKNWYSpPCpO+dpo5pWU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-S5BuPTcnNcaDlYafbwn67w-1; Tue, 29 Oct 2024 02:01:40 -0400
X-MC-Unique: S5BuPTcnNcaDlYafbwn67w-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2e33e5fc515so5080284a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 23:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730181699; x=1730786499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afQOoDJ7N3SKirkDmCB9Dck3TWY2wnsLXd8EeJ4bwDs=;
 b=SJcVFotKhxfl/5Mm1iOs/NCrBZ+RK4Dvmo6S5scgPYUr9ekiZRU1fhSzjVvfd6Ai20
 I3MndEPOjsWN1ofevcQEdu9e5mR5usTBb1gvvH7QuF2xLnW7nvHpTAOb1vRljtptP9eu
 8OpZ3N6ZPTU2lpFkTtv0KWg3eEWoVviuiaj18PtzQrmWFJD9Ohvzzgx0PaAxy4ouwYLs
 asrDB1vOOYhULGOAm1q89J9ZVOYt9yvbqxUs2KcaCB432IFL8NxzAT3MXHwO+jib8bl7
 dVUIcH2cYbvQ4QDpoWXIwMa8MtKGSj5Ss6XaKihEeBkZBm77+8jZH0SqIN4hFCwlTyat
 wnow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3YxXZzg3X3zthaWcLyAfTjkhyKEXWh2dn+yZOs38k9tmO+5MijBS5WwVmMwm1E19KCSZiM7t9m4eVp/nX7edK@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxz2Vc7Fa11mMJgkMj+rXuGvvlH9LUtpUapA/mSkNMezs6hTClp
 ZT/AV+zQoAJvgrYVmaRQKCzpo/1g64geeVQ+M2RCa+N+9qRhegtnMcsTJnw7tQiFif/KVSQtIcR
 j/q3xzq1jgam1GUiWvnGiQISBUwG4VNEFtFLkqFJoNpwU0GFIAIZ1Y8Q18LYUi81AUVmztSg+zK
 Q=
X-Received: by 2002:a05:6a20:c707:b0:1cf:2862:beca with SMTP id
 adf61e73a8af0-1d9a842cf55mr15174365637.13.1730181699143; 
 Mon, 28 Oct 2024 23:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT/RaPPWGXzVGTz8uaTr5OcTky+S4jQ0Mm8SEsOTGrLL8EvLwGLnPV2wIcbB/D8qD34c63MA==
X-Received: by 2002:a05:6a20:c707:b0:1cf:2862:beca with SMTP id
 adf61e73a8af0-1d9a842cf55mr15174339637.13.1730181698556; 
 Mon, 28 Oct 2024 23:01:38 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0cb06sm6701897b3a.115.2024.10.28.23.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 23:01:38 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:01:34 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241029060134.wkqprpmnju2k77yl@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241028141700.1786745-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241028141700.1786745-1-chao@kernel.org>
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
 Content preview:  On Mon, Oct 28, 2024 at 10:17:00PM +0800, Chao Yu wrote: >
 This patch introduce a regression test to check whether f2fs handles > dirty
 inode correctly when checkpoint is disabled in a corner case, > [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5fIe-0003U4-Qo
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/005: add testcase to check
 checkpoint disabling functionality
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
Cc: Qi Han <hanqi@vivo.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 28, 2024 at 10:17:00PM +0800, Chao Yu wrote:
> This patch introduce a regression test to check whether f2fs handles
> dirty inode correctly when checkpoint is disabled in a corner case,
> it may hang umount before the bug is fixed.
> 
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add _fixed_by_kernel_commit()
> - use _scratch_mkfs_sized() rather than formating size-specified

This test looks good to me, if no more review points from f2fs list, I'll
merge it.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> loop device
> - code cleanup
>  tests/f2fs/005     | 47 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/005.out |  2 ++
>  2 files changed, 49 insertions(+)
>  create mode 100755 tests/f2fs/005
>  create mode 100644 tests/f2fs/005.out
> 
> diff --git a/tests/f2fs/005 b/tests/f2fs/005
> new file mode 100755
> index 00000000..a817d51a
> --- /dev/null
> +++ b/tests/f2fs/005
> @@ -0,0 +1,47 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/005
> +#
> +# This is a regression test to check whether f2fs handles dirty
> +# inode correctly when checkpoint is disabled, it may hang umount
> +# before the bug is fixed.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode."
> +
> +_require_scratch
> +_scratch_mkfs_sized $((1024*1024*50)) >> $seqres.full
> +
> +# use mode=lfs to let f2fs always triggers OPU
> +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
> +
> +testfile=$SCRATCH_MNT/testfile
> +tmpfile=$SCRATCH_MNT/tmpfile
> +tmpdir=$SCRATCH_MNT/tmpdir
> +
> +dd if=/dev/zero of=$testfile bs=1M count=5 2>/dev/null
> +mkdir $tmpdir
> +touch $tmpfile
> +sync
> +
> +# it dirties tmpdir inode by updating ctime,
> +# but it doesn't moving the inode to gdirty_list.
> +mv $tmpfile $tmpdir
> +
> +# it runs out of free segment
> +dd if=/dev/zero of=$testfile bs=1M count=5 conv=notrunc conv=fsync 2>/dev/null
> +
> +_scratch_mount -o remount,checkpoint=enable
> +
> +# it may hang umount if tmpdir is still dirty during evict()
> +_scratch_unmount
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/005.out b/tests/f2fs/005.out
> new file mode 100644
> index 00000000..a5027f12
> --- /dev/null
> +++ b/tests/f2fs/005.out
> @@ -0,0 +1,2 @@
> +QA output created by 005
> +Silence is golden
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

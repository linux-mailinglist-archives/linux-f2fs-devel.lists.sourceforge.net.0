Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF21BA4F52
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 21:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUtmOExyuj6P3p/Tj3KKOKKErZ9rOwxVrGah/nlBVVc=; b=VpBliITOAI2fwBh82TrvJvs+Tn
	nVCOoURoH5q/2odNsT8/LrHG8g804o6eS5EBcYqOu+1ownCiHFhTbK3cDYAzPbYhLqt6jm8jgJ0L1
	SkCRMGupnMA2+pdVRDfu5UHHUyME06MZrSD7HAt7KC4AO10xwYVqihY0wCYQCKoSTtXc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2E2I-0000m5-8g;
	Fri, 26 Sep 2025 19:23:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v2E2E-0000ly-1N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 19:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQl5M6mAfM0DP6T6mNMjMr+kt77iQkZGSlvQMLNUDwI=; b=TYZxOit+UycjwHPcrrUMeesqrJ
 T7niq+zCZMC010jVB09Lcec1kwZo1aCsHb/H4DyPYzGPXmLGowXjzCqklkRGNAqzF/YX5kLgIMfPQ
 ELubn54Lj9MMB1hAHn98x0byGBVPe00NKSCbLDW9h4pEvnXujM9mDlFOGxIhk7Yh0yks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IQl5M6mAfM0DP6T6mNMjMr+kt77iQkZGSlvQMLNUDwI=; b=R/FLIkyawFP/Oj+2e33PFdFH/D
 18szGcpAAQZtwV/tvUxdzsh+Mm0XTdVXeRIp5nWcdhKkxtxjnu/2PV9Zz2DefvPPwOhvLcln97Lil
 vW6cO/UchArY3lbAmcNF2uMZq2B/boa2u72LKssmteWMwRAkPJbknr3mK2DzY3x6YG4k=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2E2D-0000I6-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 19:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758914582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQl5M6mAfM0DP6T6mNMjMr+kt77iQkZGSlvQMLNUDwI=;
 b=GejJcXRvpdyMUOm4/QnNkQAuPl3ATelbF2XocG94LHyckXPMil8sFHs9Hsx0RdbKTmAvRG
 i7u1pe8GA7kpiDY3uxj793h/iuz10IVIgXqQwT+XgAFWAkN11iIFDRsvb3vNXpdNhGuMvN
 lyHR+/X11FzvPxrNo0MDGxSlZYa7xBs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-mSci8hM9Ok-73Lp4GaXTLw-1; Fri, 26 Sep 2025 15:23:00 -0400
X-MC-Unique: mSci8hM9Ok-73Lp4GaXTLw-1
X-Mimecast-MFC-AGG-ID: mSci8hM9Ok-73Lp4GaXTLw_1758914580
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2699ed6d43dso26989425ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Sep 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758914579; x=1759519379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQl5M6mAfM0DP6T6mNMjMr+kt77iQkZGSlvQMLNUDwI=;
 b=gthKDvF79AYjS89fL8Qr1n6De2hXjuoxytTB8gzRPoHtQL96m48JRcfnTngRMFOcyn
 CnUfI+AdilfLL84q+MYdY7uhZumETKJzdLIxQ46fhLEz8+qVta5zBSpy+OIM+9KdvcPh
 LXfdGM0PjCpx81eA39oo4RCNRL1KgHZVgY6hGpq7TNPExF6yhNPU/NqgWRReeCzjxEja
 8kSSe5kUAmeuZPzfMZAYyXYcnatNKBs7IksOEgIjXk5bUXRQUr/5MsCctn+YIS8zPJLY
 iyQCB+FP/r5G8vREOsjM09FKdXFDj3qcJzKi7I3hXFENbyUUPsfyMED3MIqXCs9DGiYj
 eEyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3RFRI8tGKfO/0I0aPhbkEdpsPiGmNgVKKAk5kuSpZb9pIrDXX06SDpQIlgrI7GwHlFbD38i5Ttyt/ZlI3Z4jb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwZjcYS6IcK1BlO98HTEbPpTyaPklm8BMqfJe0z0bBSCdyy9KwP
 8QENeV5n/A3Y8OQUuSS2UuRaWVh/eLJfba5H0mY9lnIfMPSFv/HoMQFnhurfsl3KMxSdGqskU9Z
 VPw715t5l/dX8I65+9lBAWed7O0+McYO3js4dbWGdKcC1AlF4Yqi1I+p07oH4Jao/z+2iz+w9DO
 wfpMA=
X-Gm-Gg: ASbGncuk5iewE2NoCqZ6xAWmSXaMP9veymg59K0mZLEfMsm+dxKBXX4QMLW4sbyCWam
 XyHoYD0go+BgnMRdfa8uxwfZeilAqqaNT3Wyi3lMK+I6jmh+bcJrBmuA95uC9mMHg6B8lz9NOuy
 ELD1yKueOI/f7JZQD4ZOlDwO80NDUfIZRdkokx4Hz4VdE9EzDPcd+gCNSV+1s/0ll/I+gxdol/I
 ZotbdSh7dJarisEWiUB3oq5c3HsxBuSILlWIQUOYBoT1c7BHG+zdxSs+6V++N5ZIfAwtEnyWdzP
 UyXuVrNyij6ky4M7tIwW9nsWWoJYdw/p9sWtfmJEkTmfljp9RmRXmiWGcm8o1Zd/SPu/oHOs+/3
 qxWVm
X-Received: by 2002:a17:903:46c3:b0:246:7a43:3f84 with SMTP id
 d9443c01a7336-27ed4d882d9mr97777165ad.5.1758914579590; 
 Fri, 26 Sep 2025 12:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkbt1BdFZV77XbMIioAMBObBqcjsfxvcRi9OG3sFQqZUyXS2psw6BsWhbO7Mp/MA7b8DW0sw==
X-Received: by 2002:a17:903:46c3:b0:246:7a43:3f84 with SMTP id
 d9443c01a7336-27ed4d882d9mr97776985ad.5.1758914579227; 
 Fri, 26 Sep 2025 12:22:59 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6997ae3sm62325585ad.106.2025.09.26.12.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 12:22:58 -0700 (PDT)
Date: Sat, 27 Sep 2025 03:22:54 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250926192254.djrwx55itz422yft@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250901020331.2171502-1-chao@kernel.org>
 <20250901020331.2171502-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250901020331.2171502-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -3f3qr2Fun4H6-JRhHv-YoX7GLWeQNn8o_jFp5rk2gE_1758914580
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 01, 2025 at 10:03:31AM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create foo & bar > 2. write 8M data to foo
 > 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar > 4. [...] 
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2E2D-0000I6-G4
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/022: do sanity check on footer of
 non inode dnode
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

On Mon, Sep 01, 2025 at 10:03:31AM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create foo & bar
> 2. write 8M data to foo
> 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> 4. fpunch in foo w/ specified range
> 
> If we haven't applied kernel patch ("f2fs: fix to do sanity check on
> node footer for non inode dnode"), f2fs may missed to do sanity check
> on corrupted dnode, result in panic in step 4).
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/022     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/022.out |  2 ++
>  2 files changed, 54 insertions(+)
>  create mode 100755 tests/f2fs/022
>  create mode 100644 tests/f2fs/022.out
> 
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> new file mode 100755
> index 00000000..a5e19a71
> --- /dev/null
> +++ b/tests/f2fs/022
> @@ -0,0 +1,52 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/022
> +#
> +# This is a regression test:
> +# 1. create foo & bar
> +# 2. write 8M data to foo
> +# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> +# 4. fpunch in foo w/ specified range
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +. ./common/attr
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to do sanity check on node footer for non inode dnode"
> +
> +_require_scratch_nocheck
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_xfs_io_command "fpunch"
> +_require_kernel_config CONFIG_F2FS_CHECK_FS

Looks like the CONFIG_F2FS_CHECK_FS is a necessary condition to reproduce
that bug, right? I'm wondering is there a better way to check if CONFIG_F2FS_CHECK_FS
is enabled, likes reading someone file in /sys or what ever else? Checking kernel config
isn't always a recommended way, except no better idea :)

> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +foo_path=$SCRATCH_MNT/foo
> +bar_path=$SCRATCH_MNT/bar
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount
> +
> +touch $foo_path
> +touch $bar_path
> +$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
> +sync
> +foo_ino=`stat -c '%i' $foo_path`
> +bar_ino=`stat -c '%i' $bar_path`
> +_scratch_unmount
> +
> +# inject foo inode to replace i_nid[0] w/ to bar ino
> +$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
> +
> +_scratch_mount
> +# expect to trigger panic
> +$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
> +_scratch_unmount
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
> new file mode 100644
> index 00000000..5307e3d7
> --- /dev/null
> +++ b/tests/f2fs/022.out
> @@ -0,0 +1,2 @@
> +QA output created by 022
> +fallocate: Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

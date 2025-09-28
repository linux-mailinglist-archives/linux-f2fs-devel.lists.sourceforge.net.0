Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AABA6ACE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 10:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kWTkKWrUMdfd9DNqoI5E8ZXZpEEdrTC87rZ9HZMgIA=; b=CSVNuRlwEBdYKrrUM2zoY0Nppj
	+nLWhccPeWJ1HaRBI+7CZsDuVlTlGyazpC3/4g/I3xMfaPHZUbDL//dS9KeE/yJN5S4O2XCwDtQQi
	fyxPkYjEVYPSa6fB6ghHxImpfdNB1XpYW+sorBZKTgt5o5G7/WxHi3eLN72VHy4po/MM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2mbW-0001Rh-AT;
	Sun, 28 Sep 2025 08:17:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v2mbR-0001PZ-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 08:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKciQSQWCcG+I3KbO2dQ+p5tZZ7NpAvrzeYros3oPeI=; b=nOc8q43LAzZNJcEaYrAVoesBey
 a4BGNkSIKG1tAi30d8ArAu4pyn6doeYaG6vTK4JZHPPM4+QiAHM9hHcEwjeqiCT1b4cz0rURTm5ns
 VESPg6aSDWIeLatNjWeELAl/cYk3AURRguO52XwQ1e+lWK57QIdw5rXkYr1Ha8Vv8gpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKciQSQWCcG+I3KbO2dQ+p5tZZ7NpAvrzeYros3oPeI=; b=lARsVIlAvMfjkKHq3LyqaRLNLa
 Xbyl64VAw+DP0gykQzu3VbpJTFDxgNeiGKyA3hJmn6jQv4ErYqDQkJNRoECmdO7ojD45f9i+9mtYm
 6yXSnGNZNJSq+gWC3EHKxa4oSdkrx4n+IkG6VP4qR0KPMpIXRY4+O9b1Zvs0/XR4+lCc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2mbQ-0001AD-HS for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 08:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759047461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WKciQSQWCcG+I3KbO2dQ+p5tZZ7NpAvrzeYros3oPeI=;
 b=fLc7mEWk5S75CxRjXx6H2oGTT0mW483hOH0pAFaUW4BaB9wfZ8Qyp090Z6PTDwc0Na5SMK
 drAXbVfwOKp+QgGEFRnzq4rCz8j6M4Ynd/hhGiaEgt+Q5ZpG1zgDLOSDUH1BxzNdI5RlrO
 k0BMqXWEupl2h+6q+707SrV6q/dJMD4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-vHsfBSy9NEiqmfoEakogoA-1; Sun, 28 Sep 2025 04:17:39 -0400
X-MC-Unique: vHsfBSy9NEiqmfoEakogoA-1
X-Mimecast-MFC-AGG-ID: vHsfBSy9NEiqmfoEakogoA_1759047459
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78038ed99d9so4867122b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 01:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047458; x=1759652258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKciQSQWCcG+I3KbO2dQ+p5tZZ7NpAvrzeYros3oPeI=;
 b=YMEHJELa6u1/tIciVXDfubH6YA8Nx9v8mCzK0kOj4D4DjTvXeP5f8mgJFYRDNXQt3b
 SFVkpC8tfe5hSXvilgvELHjX0vQCB8lrNFdou3Po3z8PMVcX1salAzwhVvBbSjBDf9/Y
 vlaBfQc0pmRvYPMD0mUIzcEofOEOAFOuwozQ7ODrU+Um9W9n1zc8RqxPp06yd2wP9mva
 /7d44jPryslmFkeT48qgms2tZBvpFcLMo0DHDZolEx2H0Km10d06vwvOSBHES/tFnIax
 da+ZYaOqZWWjxf9/T42CNbzTCS+qFNX5HgVLp5ZguiX6CSOJN/ppuR9uqpAkaySA1Fg8
 pmow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUWbw6GhlgD0dC4VhmOshqtjmXjomw/kqIFAWtxSGSsRdnKZF76uqIRVKFmRjz5yJhIJf6kBJ80zP3hsM2sJXn@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx59fj+lgqZHylDpm3w7VldY+CTejtQJhWX9EpWzvo29VWOq0Qq
 TtTMlBGiHCodyb1Me+cWA7GgDbD32Ee+pqL1GkK4eit9HZ0S6vvK+FND9xnROgpWcmdOISEby4Y
 zj4Fpg4R8xJAFBFFq5qSvW3f05pTP7g1IvX56sjvdvT+nLQ6+l7pDRljDxSRmqMuPbM50MeK95H
 w762vUuviXgCo=
X-Gm-Gg: ASbGnct+/nidWU81MrUOwgJGkWt8Jn4nzr996r9zxe9UT/aH46Yt9kW0idS9qKoFhSS
 d0KeUQc9gRXRbh9jPEx6uHeTdctQxs03jZEroWtJtW93WDXPd7g1sNcc8f2MtIC3thmb/tvFeAn
 BXFnkJMKCqslgmtTl9GxA1FQoXpn70MWRvlMw/S9XwYm3ajYeQVSgdevmRQq+QjKb7A/Bp/t+4I
 BkDuVZqJoWf3DDemLbPAubPxWtv3IwKM2fcy2B4PnArWEd70Gxm3kuQmUep/Uesb6sr/EL+363d
 17p9iS34YnYcsM9hMpv4qGMI1GU2dTlQIxSPetJVAvMD1byXINuWBb0Mj8j2K5Ti6trb11rNuKB
 TT1m7
X-Received: by 2002:a05:6a00:b96:b0:771:ead8:dcdb with SMTP id
 d2e1a72fcca58-780fce18886mr13976048b3a.8.1759047458506; 
 Sun, 28 Sep 2025 01:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAsKE8yi3uLFhUcvRGX/APzqLEpGvxhqj2BPZf85viZDUKXvLRpcMnYHwU1epI0StqWlMCRA==
X-Received: by 2002:a05:6a00:b96:b0:771:ead8:dcdb with SMTP id
 d2e1a72fcca58-780fce18886mr13976029b3a.8.1759047457930; 
 Sun, 28 Sep 2025 01:17:37 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78262c184d5sm2099194b3a.95.2025.09.28.01.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:17:37 -0700 (PDT)
Date: Sun, 28 Sep 2025 16:17:33 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250928081733.5peprevpxqyejvgo@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250901020331.2171502-1-chao@kernel.org>
 <20250901020331.2171502-2-chao@kernel.org>
 <20250926192254.djrwx55itz422yft@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <802f7ad9-11e8-4b91-81b5-7579b7e8a255@kernel.org>
MIME-Version: 1.0
In-Reply-To: <802f7ad9-11e8-4b91-81b5-7579b7e8a255@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A-w_qc1YqD-4u86-SZrijxTMT7-YR7mCcQgx84Qwlzk_1759047459
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Sep 28, 2025 at 02:48:23PM +0800, Chao Yu wrote: >
 On 9/27/2025 3:22 AM, Zorro Lang wrote: > > On Mon, Sep 01, 2025 at 10:03:31AM
 +0800, Chao Yu wrote: > > > This is a regression test: > > > 1 [...] 
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
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2mbQ-0001AD-HS
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

On Sun, Sep 28, 2025 at 02:48:23PM +0800, Chao Yu wrote:
> On 9/27/2025 3:22 AM, Zorro Lang wrote:
> > On Mon, Sep 01, 2025 at 10:03:31AM +0800, Chao Yu wrote:
> > > This is a regression test:
> > > 1. create foo & bar
> > > 2. write 8M data to foo
> > > 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> > > 4. fpunch in foo w/ specified range
> > > 
> > > If we haven't applied kernel patch ("f2fs: fix to do sanity check on
> > > node footer for non inode dnode"), f2fs may missed to do sanity check
> > > on corrupted dnode, result in panic in step 4).
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   tests/f2fs/022     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   tests/f2fs/022.out |  2 ++
> > >   2 files changed, 54 insertions(+)
> > >   create mode 100755 tests/f2fs/022
> > >   create mode 100644 tests/f2fs/022.out
> > > 
> > > diff --git a/tests/f2fs/022 b/tests/f2fs/022
> > > new file mode 100755
> > > index 00000000..a5e19a71
> > > --- /dev/null
> > > +++ b/tests/f2fs/022
> > > @@ -0,0 +1,52 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. f2fs/022
> > > +#
> > > +# This is a regression test:
> > > +# 1. create foo & bar
> > > +# 2. write 8M data to foo
> > > +# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> > > +# 4. fpunch in foo w/ specified range
> > > +#
> > > +. ./common/preamble
> > > +_begin_fstest auto quick rw
> > > +
> > > +. ./common/attr
> > > +
> > > +_fixed_by_kernel_commit xxxxxxxxxxxx \
> > > +	"f2fs: fix to do sanity check on node footer for non inode dnode"
> > > +
> > > +_require_scratch_nocheck
> > > +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> > > +_require_xfs_io_command "fpunch"
> > > +_require_kernel_config CONFIG_F2FS_CHECK_FS
> > 
> > Looks like the CONFIG_F2FS_CHECK_FS is a necessary condition to reproduce
> > that bug, right? I'm wondering is there a better way to check if CONFIG_F2FS_CHECK_FS
> > is enabled, likes reading someone file in /sys or what ever else? Checking kernel config
> 
> No, I don't see any sysfs entry for checing if CONFIG_F2FS_CHECK_FS is
> enabled.
> 
> I checked the testcase w/ image which has CONFIG_F2FS_CHECK_FS=off, the
> testcase falls into a deadloop inside kernel, so it's fine to get rid of
> the CONFIG_F2FS_CHECK_FS requirement? Thoughts?

Sure, let's remove the unnecessary requirement :) And ...

> 
> Thanks,
> 
> > isn't always a recommended way, except no better idea :)
> > 
> > > +
> > > +# remove all mkfs options to avoid layout change of on-disk inode
> > > +export MKFS_OPTIONS=""
> > > +
> > > +foo_path=$SCRATCH_MNT/foo
> > > +bar_path=$SCRATCH_MNT/bar
> > > +
> > > +_scratch_mkfs >> $seqres.full
> > > +_scratch_mount
> > > +
> > > +touch $foo_path
> > > +touch $bar_path
> > > +$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
> > > +sync
> > > +foo_ino=`stat -c '%i' $foo_path`
> > > +bar_ino=`stat -c '%i' $bar_path`
> > > +_scratch_unmount
> > > +
> > > +# inject foo inode to replace i_nid[0] w/ to bar ino
> > > +$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
> > > +
> > > +_scratch_mount
> > > +# expect to trigger panic
> > > +$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"

... if you might be better to change this comment a bit :)

If you'd like to resend this patchset, please change the patch 1/2 by the way.
then I can merge your next version directly :)

Thanks,
Zorro

> > > +_scratch_unmount
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
> > > new file mode 100644
> > > index 00000000..5307e3d7
> > > --- /dev/null
> > > +++ b/tests/f2fs/022.out
> > > @@ -0,0 +1,2 @@
> > > +QA output created by 022
> > > +fallocate: Structure needs cleaning
> > > -- 
> > > 2.49.0
> > > 
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

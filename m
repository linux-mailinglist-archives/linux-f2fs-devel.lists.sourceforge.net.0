Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CCA70E4D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 01:48:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txEwI-0006at-Ns;
	Wed, 26 Mar 2025 00:48:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1txEwH-0006aj-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 00:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4KHyk1+MRQuxC+eJ9QzulpisBcombtQV4ojfnxT6JVo=; b=J/5SeTAz3TORr272yZM83TpAEO
 P3crTyv2cw0Zq6n4XtVrmxW42g+MMHXlva6Gg26DmKnx3KCji3i8uKJCfZZLHoCAJ3TliidZAj3Wu
 YfpLXag6w3ps5pIHq4zxLXbbcqaNvPUMxvJvfilRzAe+zdd+eb2+z/Ap4KgKvipKEn78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4KHyk1+MRQuxC+eJ9QzulpisBcombtQV4ojfnxT6JVo=; b=IzUOAUUS8Isjucst2bquQeudJ4
 EQMcsHvKqzKQBktsvkpN0zsdeAcXD5MVrQmmJjq5yRDoOrSDUEPzysyZvJ6G5XzVlS/7pvRO7eWKP
 g2AWnVfGrZlR8SsqJtZflykw2EGyz7rEn0XwfGciPvhqmspaN1rOsqGoB244g/YW6kXk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txEwA-0003Il-DA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 00:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742950075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KHyk1+MRQuxC+eJ9QzulpisBcombtQV4ojfnxT6JVo=;
 b=WosMxOcviyVG+kegT8DUL9KAM26D8WZdB6ycSwxwIA/+OMsnKEuqTRyLHVpN8C1BiCtVEP
 lNeUUfludX93lB+nxCLyW1QYi/IFxGGDvy4WRUjKQ6+0jDf4ClwSNhocJ3oGi3Tw0WaLwJ
 9anvMgDYvEI56OdWQTT9yt9+CbtMx8o=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-RA7y8A6dN02P5Cka24L4Lg-1; Tue, 25 Mar 2025 20:47:53 -0400
X-MC-Unique: RA7y8A6dN02P5Cka24L4Lg-1
X-Mimecast-MFC-AGG-ID: RA7y8A6dN02P5Cka24L4Lg_1742950073
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2242ade807fso175256835ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 17:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742950072; x=1743554872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KHyk1+MRQuxC+eJ9QzulpisBcombtQV4ojfnxT6JVo=;
 b=bBkCe00KmnAkzCzkf0NG5a6RHt8rFpw0hRqprNZ5bsR7SH8E8gYMx4WcNPIPj19arR
 /8StBH1bb3GiHtoyR6UWpbIHydTpgCclDhaRPV2MrjvjXCRkb4y4fV1/ILy5g4To3tC5
 VuasyFGUcI19/1pozmvg8OF30HoeZeQryHtwnZKFYDxcz4At0Y7CwkgK70/qkXaNN6Eg
 aBA56WuRMCBGY3VcUTOXwwo8ozVcbKwbrQK55jtyuu0DXVmOD41KpJ9e+eZc999RwkL2
 Jt18Ij1doy5Cgdnz1yt9tLiywmVf9ijHEh91ZIkoqygsH06uyaFwpJXBBTW3EbfE4qvv
 v63w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4D5sw3e8nfmd8h26JHG9Q5nP3IZEoOlnXSssnLHbTDzyuV7Qwa2NSpVdTZSXgLrIDg2iFGlp7/uXGTfwqPRQT@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxlImuBfUWpt7ZJPu+cuwQQNde7Cp3PPfSJ2ooATTEdnxXTNt3Y
 Ixrl1FPyhe3LWpJA8VoE5b8hqw7Dt0w82xuoUxBBvvw1ekSsDX5b/nFQO+0uULRkWuTuNLXALzx
 YXkKCxx9xbto03f/ZiEjU7dmI1d1RMVqAaGMiK+LhWp4Ws6oy6adSafIGWdzVy3H0Iv6PqNjZ/q
 8=
X-Gm-Gg: ASbGncswps6uMyY6Of5iYFxk3gYEil7dFo1aZlXeesQmBT8fuDLP1Szidk1xS0IgF2a
 Ul+m3aF6XBn8ZYb4p/KNKrZOt1j+uxpH32W98rYpu/4Oq3KD2pE74oFQn7IrjY6Hwdunj5M6mVD
 6HNcQGx85ETkROkv/QwcLBwknvo77t8anXFt7Xx0ovJn35TVxzu2qDIgVZs0haxXpxzROa5Bf8x
 5oACYcLXfODDZptZ6yZAxoyBlhqVjy4EvsTq25AjvXhpIuqSk3YFq58NH3ZKYFwNXsHSBi8xoiq
 ITtk+6WF7zRJxjoFvJg7xDoofYZ2Z4GHks3pcLDUFDKuHN8WvaFY//H0
X-Received: by 2002:a05:6a00:14d1:b0:736:728b:5f1f with SMTP id
 d2e1a72fcca58-73905a140b0mr25926451b3a.19.1742950072651; 
 Tue, 25 Mar 2025 17:47:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCvdk9I2rUhFXerNCzyrQucBGAY0/7qw28RR08tM8XnBkghbtmD6M8PrQvM6kBEW6czcrE0Q==
X-Received: by 2002:a05:6a00:14d1:b0:736:728b:5f1f with SMTP id
 d2e1a72fcca58-73905a140b0mr25926425b3a.19.1742950072169; 
 Tue, 25 Mar 2025 17:47:52 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73905fd7a3fsm11261915b3a.67.2025.03.25.17.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 17:47:51 -0700 (PDT)
Date: Wed, 26 Mar 2025 08:47:48 +0800
To: Dave Chinner <david@fromorbit.com>, Chao Yu <chao@kernel.org>
Message-ID: <20250326004748.bx2z62lpqpg6rjlj@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250325125824.3367060-1-chao@kernel.org>
 <20250325125824.3367060-6-chao@kernel.org>
 <Z-M6PkLZI2LIOlXY@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <Z-M6PkLZI2LIOlXY@dread.disaster.area>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ArsIqweGfaT_PYAk_SohTpkqVIBrkZmYQ72q2gI7lQ0_1742950073
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 26, 2025 at 10:20:30AM +1100, Dave Chinner wrote:
 > On Tue, Mar 25, 2025 at 08:58:24PM +0800, Chao Yu wrote: > > This is a
 regression test to check whether fsck can handle corrupted > > nl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txEwA-0003Il-DA
Subject: Re: [f2fs-dev] [PATCH v5 6/6] f2fs/009: detect and repair nlink
 corruption
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
Cc: jaegeuk@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 26, 2025 at 10:20:30AM +1100, Dave Chinner wrote:
> On Tue, Mar 25, 2025 at 08:58:24PM +0800, Chao Yu wrote:
> > This is a regression test to check whether fsck can handle corrupted
> > nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> > and expects fsck.f2fs can detect such corruption and do the repair.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> > v5:
> > - clean up codes suggested by Dave.
> >  tests/f2fs/009     | 141 +++++++++++++++++++++++++++++++++++++++++++++
> >  tests/f2fs/009.out |   2 +
> >  2 files changed, 143 insertions(+)
> >  create mode 100755 tests/f2fs/009
> >  create mode 100644 tests/f2fs/009.out
> > 
> > diff --git a/tests/f2fs/009 b/tests/f2fs/009
> > new file mode 100755
> > index 00000000..864fdcfb
> > --- /dev/null
> > +++ b/tests/f2fs/009
> > @@ -0,0 +1,141 @@
> > +#! /bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> > +#
> > +# FS QA Test No. f2fs/009
> > +#
> > +# This is a regression test to check whether fsck can handle corrupted
> > +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> > +# and expects fsck.f2fs can detect such corruption and do the repair.
> > +#
> > +. ./common/preamble
> > +_begin_fstest auto quick
> > +
> > +if [ ! -x "$(type -P socket)" ]; then
> > +	_notrun "Couldn't find socket"
> > +fi
> 
> Perhaps something like:
> 
> _require_command $(type -P socket) socket

Good point! Maybe double quotation marks -- "$(type -P socket)" is
helpful, due to if socket isn't installed, there will be only one
argument.

> 
> would be more consistent with all the other code that checks for
> installed utilities that a test requires?
> 
> > +_require_scratch
> > +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> > +
> > +_fixed_by_git_commit f2fs-tools 958cd6e \
> > +	"fsck.f2fs: support to repair corrupted i_links"
> > +
> > +filename=$SCRATCH_MNT/foo
> > +hardlink=$SCRATCH_MNT/bar
> > +
> > +_cleanup()
> > +{
> > +	if [ -n "$pid" ]; then
> > +		kill $pid &> /dev/null
> > +		wait
> > +	fi
> > +	cd /
> > +	rm -r -f $tmp.*
> > +}
> > +
> > +_inject_and_check()
> 
> Single leading "_" is reserved for fstests functions, not for local
> test functions.
> 
> Just call this one "inject_and_test", because that is what it does,
> and call this one:
> 
> > +inject_and_check()
> > +{
> > +	local nlink=$1
> > +	local create_hardlink=$2
> > +	local ino=$3
> > +
> > +	if [ -z $ino ]; then
> > +		ino=`stat -c '%i' $filename`
> > +	fi
> > +
> > +	if [ $create_hardlink == 1 ]; then
> > +		ln $filename $hardlink
> > +	fi
> > +
> > +	_inject_and_check $nlink $ino
> > +}
> 
> something like check_links()
> 
> Otherwise this is a good improvement.

Hi Chao, if you agree with all these changes, and don't need to change more, I can
help to merge this patchset with above changes. Or you'd like to send a new version?

Thanks,
Zorro

> 
> -Dave.
> -- 
> Dave Chinner
> david@fromorbit.com
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

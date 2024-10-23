Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC19ABC0F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 05:17:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3RsB-0003xi-2e;
	Wed, 23 Oct 2024 03:17:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t3Rs9-0003xa-LB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3syr6L7EVL9DqRlN1xjhF+CIYtl5tQ4nqIVDNZKGBMs=; b=eon4hjZjGHw1CeImVVXG65UJcz
 OdlXHV5dmNWMfdqrQ6bPyRQODHIwWDAQX+toSPxVowIqRZcWtFukVhHpcvQ5tAZ6hQCEy2xMNe5aj
 gJRUAqbCVLCWvaI0x9ulRkN5gSAQ3fkBe3YhCz8xEx9Mu5R0WKEjju5FsvRSAAgM4jWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3syr6L7EVL9DqRlN1xjhF+CIYtl5tQ4nqIVDNZKGBMs=; b=F6RPRiTLF20ab86ccuzYAB7ezj
 9wlZsYSqrAW1VhCSlj9SrwdOLxe2sGA0/cBj/H4Pu5pUo3nO6nLhwDrn3IUg6QvYm1TZjSATLZwtv
 9GPyMfYEPPTzpu/YN96W8QQzVISRS4vblARBOqUza8ueCAUGwYpTdtx2EM2wDb/MpCmk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3Rs8-0006Bs-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 03:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729653434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3syr6L7EVL9DqRlN1xjhF+CIYtl5tQ4nqIVDNZKGBMs=;
 b=P8y3E6CYnzUHhsgY0NkFSTUtoDMza/9wRCJ9f+YOvuG7bAWhFLLoohKKe7PqvhKWbjuW37
 G8FaOw3sHPhkIO1SxpIYQq0Xa14fBusIW5YchFEfteHsEUr+/vG9ye+LNeAX66/4Yy6rXM
 H3qTwnlJAEmILurpPwALeJEgSJgEt/o=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-MT55rCnYMPWwgCSIMnSyfQ-1; Tue, 22 Oct 2024 23:17:13 -0400
X-MC-Unique: MT55rCnYMPWwgCSIMnSyfQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2e2ca403f5dso5983153a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2024 20:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729653432; x=1730258232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3syr6L7EVL9DqRlN1xjhF+CIYtl5tQ4nqIVDNZKGBMs=;
 b=G2UrVqE2YXVBX6NTFbWJv994PabMjbtptXsRWzGCGWvmSiKqOOzsOzp7XX5oNdRkvh
 sLCzauTESXY7D8Fc4ZTitPWQNKURQHbWje3lpxePsjc3vCQ67XalBDh3b/Kok1DzLHgn
 +SjNYWSuCe48soXjs+NimuWuZ2sOH7vYpMx1VS/lmiwthX8nJhZ77djleFN0tN2WBdjX
 5xQgm0xp5X6jYkOTyIW93KoN1EXcFkMJc6C3iaMWg8k2AXN0UM0g7Z/nzlPvzosNtex2
 hDyMDfral3f2bcwN8+ekHPLzif71JN7lOXBddwfIpHb8WF8YTbMJrg4X79czN860+FPI
 hSMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMBGikgug1MxDxlS4Kwypm0zsqsvwVGgxwRnVAegEe4p6y5guzIEPHmrIiTyeVVbqH6kDg6Dar5k1wz001vPxp@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7iTrg12eJBdr6zDbvudEOCnHINqLODhYt6EyMYqy/BjYaY9Nt
 UTSlRaL3uWrQvzGux7zBHB/0tT5VLtM9p+qbS4LOotqI/ZAiIQJOhVEFfLfpdviq2mAI3DxRfXL
 2vyaCiYNNzL1gz7uE1Z6qXbKJRNr7lo04sT1nEfwh2YM2YCUN7s5NLyIYIQ9KaW9135N8mL5u4i
 M=
X-Received: by 2002:a17:90b:4f8b:b0:2e2:b41b:8544 with SMTP id
 98e67ed59e1d1-2e76b618ceamr1174640a91.21.1729653432554; 
 Tue, 22 Oct 2024 20:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIPEYdpLVj7IWPwuK4xsW5PKZPdsC72atURkmmaIcf02Te6kpxz8N+slNsieR7KOGhQInY3g==
X-Received: by 2002:a17:90b:4f8b:b0:2e2:b41b:8544 with SMTP id
 98e67ed59e1d1-2e76b618ceamr1174622a91.21.1729653432199; 
 Tue, 22 Oct 2024 20:17:12 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e76df714f5sm220881a91.33.2024.10.22.20.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 20:17:11 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:17:07 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241023031707.povvhtilr66bv2vi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241015025106.3203676-1-chao@kernel.org>
 <20241023023744.nvnuavzus26gjdj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <6ffdf1df-e4a3-4799-81d4-22f206beb720@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6ffdf1df-e4a3-4799-81d4-22f206beb720@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 23, 2024 at 10:53:09AM +0800, Chao Yu wrote: >
 On 2024/10/23 10:37, Zorro Lang wrote: > > On Tue, Oct 15, 2024 at 10:51:05AM
 +0800, Chao Yu wrote: > > > This is a regression test to check [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3Rs8-0006Bs-Pq
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs/006: add testcase to check
 out-of-space case
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 23, 2024 at 10:53:09AM +0800, Chao Yu wrote:
> On 2024/10/23 10:37, Zorro Lang wrote:
> > On Tue, Oct 15, 2024 at 10:51:05AM +0800, Chao Yu wrote:
> > > This is a regression test to check whether f2fs handles dirty
> > > data correctly when checkpoint is disabled, if lfs mode is on,
> > > it will trigger OPU for all overwritten data, this will cost
> > > free segments, so f2fs must account overwritten data as OPU
> > > data when calculating free space, otherwise, it may run out
> > > of free segments in f2fs' allocation function, resulting in
> > > panic.
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   tests/f2fs/006     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   tests/f2fs/006.out |  6 ++++++
> > >   2 files changed, 58 insertions(+)
> > >   create mode 100755 tests/f2fs/006
> > >   create mode 100644 tests/f2fs/006.out
> > > 
> > > diff --git a/tests/f2fs/006 b/tests/f2fs/006
> > > new file mode 100755
> > > index 00000000..b359ef8f
> > > --- /dev/null
> > > +++ b/tests/f2fs/006
> > > @@ -0,0 +1,52 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. f2fs/006
> > > +#
> > > +# This is a regression test to check whether f2fs handles dirty
> > > +# data correctly when checkpoint is disabled, if lfs mode is on,
> > > +# it will trigger OPU for all overwritten data, this will cost
> > > +# free segments, so f2fs must account overwritten data as OPU
> > > +# data when calculating free space, otherwise, it may run out
> > > +# of free segments in f2fs' allocation function, resulting in
> > > +# panic.
> > > +#
> > > +. ./common/preamble
> > > +_begin_fstest auto quick
> > > +
> > > +_cleanup()
> > > +{
> > > +	rm -f $img
> > > +	_scratch_unmount >> $seqres.full
> > > +	cd /
> > > +	rm -r -f $tmp.*
> > > +}
> > > +
> > > +_require_scratch
> > > +_scratch_mkfs >> $seqres.full
> > > +_scratch_mount >> $seqres.full
> > > +
> > > +img=$SCRATCH_MNT/f2fs.img
> > > +mnt=$SCRATCH_MNT/f2fs.mnt
> > > +testfile=$mnt/testfile
> > > +
> > > +mkdir $mnt
> > > +dd if=/dev/zero of=$img bs=1M count=100 2>/dev/null
> > > +$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
> > > +sync
> > > +
> > > +# use mode=lfs to let f2fs always triggers OPU
> > > +mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt
> > 
> > Hi Chao,
> > 
> > Is the loop device necessary? What if use SCRATCH_DEV and SCRATCH_MNT directly?
> 
> Hi Zorro,
> 
> It uses loop device to limit image size, so that we can speed
> up padding steps of the test since it depends on ENOSPC state.
> 
> Or maybe we can mkfs.f2fs $SCRATCH_DEV w/ specified sector size?
> Any suggestion?

Can scratch_mkfs_sized() help? I saw it supports f2fs.

Thanks,
Zorro

> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> > > +
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
> > > +
> > > +# it may run out of free space of f2fs and hang kernel
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> > > +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> > > +
> > > +mount -o remount,checkpoint=enable $mnt
> > > +umount $mnt
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> > > new file mode 100644
> > > index 00000000..a2c7ba48
> > > --- /dev/null
> > > +++ b/tests/f2fs/006.out
> > > @@ -0,0 +1,6 @@
> > > +QA output created by 006
> > > +50+0 records in
> > > +50+0 records out
> > > +dd: error writing '/mnt/scratch_f2fs/f2fs.mnt/testfile': No space left on device
> > > +3+0 records in
> > > +2+0 records out
> > > -- 
> > > 2.40.1
> > > 
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

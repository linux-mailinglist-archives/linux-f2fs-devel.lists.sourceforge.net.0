Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF9B282BC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 17:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YWoXwas3I2yjC6ZtEP8mfwXpe43G2GNwgubYTqEhtM=; b=lavpKYrA4R1P2SRAVZWdn6Hjsl
	Zq64/epIIyb6WiNeaagGH6qEfXQ1TXOrFMjo7mZgQit75Ma0ymeo3WhXuIPt4epm/Vn0rAUN6Q/JM
	/ERXaQic4PUlQMtadBR9jQHE7dzPzTs06JSTzawZ8dcR4zlR3Y7QBw/v2c4LAsrN36Dc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umw6y-0007b2-Kt;
	Fri, 15 Aug 2025 15:12:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umw6w-0007av-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KeHxPsOig0zq82Ip7ldGqrEnK4Cwkx6P0lsmqFquHlc=; b=eFcKRqhI7+StL9YheYslS6ukLL
 MWvXctsxLA6KdulBs4ZdgAHFwV25cc/wOaW5XUtYaBkkJ72HOZeK3JJaQKxVCWgh7srklGnU2gr5X
 APjYW/ccRiTEA1fXbMjikfFd3+xe02z1tjAK3IsrQs+o+8BKW1g/080eP1S4Dg8WmZM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KeHxPsOig0zq82Ip7ldGqrEnK4Cwkx6P0lsmqFquHlc=; b=MrdgsUY9ryxRPGW4Tz4rgXBEeQ
 QR5LB7YmtICanDqxj/3tBfVX9Cw+IxwU0hoBYkX5aPhGkG5kqH7ZWja6C1se32oaZ47mlyqlxNJzj
 Uo5AJiC91QZ2YJ9uBIfcLaLbDkKRfjEG0NFsu+2hKvP0ui2Ov2Tk2LzHt+2c82/KingQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umw6w-0004my-Am for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755270768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KeHxPsOig0zq82Ip7ldGqrEnK4Cwkx6P0lsmqFquHlc=;
 b=SlTTUKHeMCa/U8ip0Y7A0z48S9TmX6MX0UP1gxuxD7lz8gsS/WqJRkTGDHvsHvvRSBnpYh
 zDnFUVqioHD744p8yvMmMAAJzR4yNTbgRaogTx06pTxiyxsteOMq6cXd6xuVy3SUKfy4Ln
 HGlWkELMhnNnKfZ72SX6xuVK0qwafys=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-cN467MhIMPq9XmbOcZCgjg-1; Fri, 15 Aug 2025 11:12:47 -0400
X-MC-Unique: cN467MhIMPq9XmbOcZCgjg-1
X-Mimecast-MFC-AGG-ID: cN467MhIMPq9XmbOcZCgjg_1755270766
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-323266dca73so1887411a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755270766; x=1755875566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeHxPsOig0zq82Ip7ldGqrEnK4Cwkx6P0lsmqFquHlc=;
 b=xTZbHmkFf76qNBphoXT+fJnGLvPam1GTkdthDC7wHBP0oXxnnXjCdi26p+K6HIqZLh
 M1cTgH57bKhUKpD5iMq8SdZMoVimP/RXBVNlPgdLARqtmhvM9QGwwd6h3mor5E4AGJ2t
 XGKA991Cgv42BuRGsxyc8o7eW6ekBEFCcTuaLv76/ZWzXMAxLT+i9NwoEkuAUp/Csi5d
 YEhDpxUXAzUJWua9Jnxm97aA0NsN6i7ByUxs5UivRzEpJiEoZadiLszJBn3NeMLT5dm4
 DUTo6dd3hBE1fbDeUkUli4cDfccOVq+pIjqTmB7jDWk7v5OyraD1oddR64DVE1+fumAS
 seAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoMyGPTEqvBDUPOBiDsVPxxYhUYXcP6FNuFBKx9CBFIWNbar9hxvZaFjqwmIh0/zWTVhRiDZx7vGvPzc2RVoBb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyORvNRuk4DMe4Vkhjnj2oi8bSTpghDhD/JQdTfj2LxhtxImmMt
 p2y0vZEq6RE97mR/IVnuYqj4e7GseTg6x15ee4ZbZ0uRy+6HG9hxWN4vV/B2UnvmGQqF7jm+fJd
 NA0klLCbsHM3YgQFE+i9v/XqtDnXEj9OBLTvAmWxYTW6+yYsnFtODd+6yh9R+rx68K0+9XTzPDc
 oPzuY=
X-Gm-Gg: ASbGncsdYDF3juCm+N2EwAu/2R4myYWwIJAx56m6sCN19OJaF7ziqcUkNTPLU6K2nO1
 7joxEdR3uwIoz3jcJ9hvpP2PIBwkO13r4PwoUBWJi54gP5naXk0K306Mq7uGdDB83tfWNmkZf+8
 jRAzoSJxGF5vDcQy2RCUKZSodb8iUiibQweQdg927yuDw9QFZIv30EKwJz4TFnrlnMCrCe6W9YH
 ioA7uj1LxKqpmavuM1H2smt5Bs35R2vwsv1kOGj83Xbko7tkEmxUkDTH/OZ2DLBranUmvQB7nX5
 FbMUcphmDz7SI7NedBajF6ydUt68Pac1O0BiBZwg94t1xOQ3Qvzwp7LJL/bAixPjnh9XaOkhfOW
 68DDS
X-Received: by 2002:a17:90b:2548:b0:313:2206:adf1 with SMTP id
 98e67ed59e1d1-32341df94admr3269693a91.4.1755270765744; 
 Fri, 15 Aug 2025 08:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7v6PSFJAR5zXC93og3/f7pOCFGskft2rwSzaDJTPWViTsIYikPsKRuiWduvDK08Vax94rog==
X-Received: by 2002:a17:90b:2548:b0:313:2206:adf1 with SMTP id
 98e67ed59e1d1-32341df94admr3269654a91.4.1755270765220; 
 Fri, 15 Aug 2025 08:12:45 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32331127c96sm4587523a91.19.2025.08.15.08.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:12:44 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:12:40 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815151240.aie4fcudoglxvlh5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250814090712.2119455-1-chao@kernel.org>
 <20250814090712.2119455-3-chao@kernel.org>
 <20250814211838.64o3q3jurbxvwp3a@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <40587d4a-44a2-4d82-9f9f-2934c52aba87@kernel.org>
MIME-Version: 1.0
In-Reply-To: <40587d4a-44a2-4d82-9f9f-2934c52aba87@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B5gBQF67dXkASWjl22cj_dwZm_8yl3__LnPUtwZXg4c_1755270766
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 15, 2025 at 04:02:12PM +0800, Chao Yu wrote: >
 On 8/15/25 05:18, Zorro Lang wrote: > > On Thu, Aug 14, 2025 at 05:07:12PM
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
X-Headers-End: 1umw6w-0004my-Am
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

On Fri, Aug 15, 2025 at 04:02:12PM +0800, Chao Yu wrote:
> On 8/15/25 05:18, Zorro Lang wrote:
> > On Thu, Aug 14, 2025 at 05:07:12PM +0800, Chao Yu wrote:
> >> This is a regression test:
> >> 1. create directory
> >> 2. add a new xattr entry to create xattr node
> >> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> >> 4. check whether f2fs kernel module will detect and report such
> >>    corruption in the file
> >>
> >> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >> v3:
> >> - use _require_scratch_nocheck instead of _require_scratch
> >> - add missing _require_attrs user
> >> - add comments for why exporting MKFS_OPTIONS=""
> >>  tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
> >>  tests/f2fs/020.out |  2 ++
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100755 tests/f2fs/020
> >>  create mode 100644 tests/f2fs/020.out
> >>
> >> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> >> new file mode 100755
> >> index 00000000..7ce1f92f
> >> --- /dev/null
> >> +++ b/tests/f2fs/020
> >> @@ -0,0 +1,51 @@
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
> >> +. ./common/attr
> >> +
> >> +_fixed_by_kernel_commit 061cf3a84bde \
> >> +	"f2fs: fix to do sanity check on ino and xnid"
> >> +
> >> +_require_scratch_nocheck
> >> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> >> +_require_attrs user
> >> +
> >> +# remove all mkfs options to avoid layout change of on-disk inode
> >> +export MKFS_OPTIONS=""
> >> +
> >> +testdir=$SCRATCH_MNT/testdir
> >> +
> >> +_scratch_mkfs >> $seqres.full
> >> +_scratch_mount "-o user_xattr,noinline_xattr"
> >> +
> >> +mkdir $testdir
> >> +# add a new xattr entry to create xattr node
> >> +$SETFATTR_PROG -n user.abc -v 123 $testdir
> >> +
> >> +_scratch_unmount
> >> +
> >> +# inject i_xattr_nid w/ nid of inode node
> >> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
> 
> Zorro, I missed one thing, this testcase relies on a f2fs-tools patch, please apply
> this before running the testcase.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=2174461cdd0a22edc5e7d172605bff4740582438
> 
> Do I need to create a _require_* function for f2fs to verify whether f2fs-tools
> support the required feature or not?

Actually for further f2fs testing (depends on injection), we'd better to have related
functions, you can refer to:

_require_xfs_db_command

Or more xfs_db related functions in common/xfs if you need.

If you don't want to add this _require_ function in this patch (this's not the only
one f2fs case uses inject.f2fs), I think you can send another patchset to do that
later (just let this case fails on old f2fs temporarily :).

Thanks,
Zorro

> 
> >> +
> >> +_scratch_mount
> 
> Oh, I may missed to add "-o acl,user_xattr" here.
> 
> >> +# may potentially trigger a deadlock w/ double inode_lock on parent's inode
> >> +mkdir $testdir/dir >> $seqres.full 2>&1
> >> +_scratch_unmount
> > 
> > Can you provide a test result to prove this test case trigger a failure
> > on general kernel (not debug kernel). If it can, then this version is good
> > to me :)
> 
> Well, expectation is it will hang kernel, so that the f2fs/020 will stop here
> once we encounter the issue.
> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
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

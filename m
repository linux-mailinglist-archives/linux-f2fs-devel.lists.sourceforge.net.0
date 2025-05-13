Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D303CAB4BF1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 08:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFqxECaLa0wCCojJtAdSL4cUjNy+fSJL2AaBVUmF6mU=; b=Bis/bGSRsxgujzkGXDRF6oRgNU
	jITAs0tIys80ZecGs/0E1X7wN/9vSSXPFrFWUVq7JnFbfCtGd42C6YvRdqrXP2gBRNwHOM7fETcP4
	2TIM4KYhI+8eNilk+Su5Gjk+Et0B+ZzmTkuoJqH4otpsVFDQD7hzLclFZyZ+vZBnLzBo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEjA1-0006f4-2O;
	Tue, 13 May 2025 06:30:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uEj9z-0006ex-G6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUV/Ffk7DVBmw0rYl7ApHOAXVBazwYa38LSpmJcHTsw=; b=CUryBtpurFuJ8U7k/l2eTZqrRo
 oPt1HYgDlZ2CRobyxsjQddr83TEulT0vZ+ISM9Dvy1EKnh5L7z0stE6+p6M51YImj6WlLfcLgC86W
 2TVu/7dMiwJh7dpBIpC+Z2cF0zyWKwambpruQvkNN5eSj1XdI4Rng0xuPm4klSUmdPKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUV/Ffk7DVBmw0rYl7ApHOAXVBazwYa38LSpmJcHTsw=; b=gpsez5gGO1siLVmzjaIApNXVkF
 mdij/Qe1Co+NirO1iEED5e+F9iWZG7+ouxUuVN4XVRIn4Ou6U2G/YWLzZ1mQ66BQHZ3qCTxf9ETQT
 DxHaozu+YjuOtetZ85FtJJNvTyPdelxTSN0qMTk3jZAY+JK81I6XU8OjVjIEz67r9Mh0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEj9y-0000NL-UK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747117827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dUV/Ffk7DVBmw0rYl7ApHOAXVBazwYa38LSpmJcHTsw=;
 b=GsSHiJjDwVFwfu75vtYaKfVJsKsYvC+2J7TSKBQhB2Y3xcE8YBEI7CubqtQDkhFA+YIN2P
 QUBS/T4EtGu2rIh7UxHM0hzWP4bCT30jeOloNI7JTsL4ULBaBrF2GQ1+o76D3fD0Vz6tfH
 K869R7cJLhp4jHse2lc/Xe0J5G2LN0I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-AGK_3wfUNTK7xdzgRzAFvQ-1; Tue, 13 May 2025 02:30:26 -0400
X-MC-Unique: AGK_3wfUNTK7xdzgRzAFvQ-1
X-Mimecast-MFC-AGG-ID: AGK_3wfUNTK7xdzgRzAFvQ_1747117825
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7424eb14904so2266011b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 23:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747117825; x=1747722625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUV/Ffk7DVBmw0rYl7ApHOAXVBazwYa38LSpmJcHTsw=;
 b=uUojFn10Iu+6M96pEPTGFdV0OBIFoaSHEHvZ+H61vkYZeU/9ckbSLda3QB00YHv3rR
 QC9z7gio1qOOK36Wn/daRwPrlTxkQgym4dhV/I9zoxuMbOijEOVTIFAp1rxwPnpv9rNu
 mciM6EcmfvqOIyX8O5Kh2vt2KqQzYw2tMxdFdAgVfROJ1AJnndiZVEC+dobNT/h17Ixn
 Ch1r6LKaoXD+wd29F0ls98ZADdmbkMVbfNV6WWKbE2QmpsUZxun0f8/Chd+DVKj8AqHO
 cHL7zTrWbQl4hACFnk2NLckasbDhSnNHviqtlCje8Rq6kQg5N6fDiRQUsXV77AMn+jrE
 htcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYnnYDBeeFWZKOaN3gxw5A70lKA4IyEscabScCaZpnGcsTlgF4IYf52Yks5UMVwpCDTdMpK58qO65BRsm2Pv6E@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwwY0FjWBnOdyaZ+g+L9kRBdAvfGLafOL06ibr4zhPjUjsLJWCt
 hp6ggH9NP8uCy5xr5dLPteASZieiwPXEt30aStPUynTECt9VHlk0t6w+at4en6+PoTi461jeZP1
 hHHtOTFi6sY65VbtTY/8rqTwVMiIFMZLG9nYClSwOOC/NHFeSgk2I3y9rsjKh7u6RalYw453840
 k=
X-Gm-Gg: ASbGncuFfGWxJNAwvXVidRs8HwLQqzdY4m4zxnL66k3bVwL9irUD7LYhiKnCwqSAlw8
 xy0OQ/FowgHWLKqJE2AY/5+JAorucWGhypbLQEJeIVqAiNfrRBPjxYD6QtcbxXgMVq+8VjVPFCB
 tX349epR1tZm3rZ/pl5w67nAagC/Z8bgYPOYLFuhGlbKckJ67oA0WeB8k+gk+VoyAXUQ1lUmy6F
 dtxT7BgOzosYT9QvtWWoD4ITqw2jyNcpk0Py1u21/cArXBLQVnL+20svagzrewW6EtJ8mzxiN8N
 sMRJEOQC4BgwLpXPYXw+khr6J4bLzeoIjNgmoZ8EfWGMJfTWgd/Q
X-Received: by 2002:a05:6a00:450a:b0:740:41e4:e761 with SMTP id
 d2e1a72fcca58-7423c07be27mr20644001b3a.22.1747117825288; 
 Mon, 12 May 2025 23:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFuuZY2PwrySlH/2oK0Yn5HS5Wp2PGUYA4rNBV+IKvQrjNHdTw/yDK8BhopSSQasR4RMhFg==
X-Received: by 2002:a05:6a00:450a:b0:740:41e4:e761 with SMTP id
 d2e1a72fcca58-7423c07be27mr20643961b3a.22.1747117824917; 
 Mon, 12 May 2025 23:30:24 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237704025sm7383795b3a.13.2025.05.12.23.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 23:30:24 -0700 (PDT)
Date: Tue, 13 May 2025 14:30:19 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250513063019.afppmskz4nom54ua@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250509060754.1677062-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250509060754.1677062-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WAABBvcbZemNKG-2b-Xk4pzowqGhRRekJCflmpyo9PM_1747117825
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 09, 2025 at 02:07:54PM +0800, Chao Yu wrote: >
 This is a regression testcase to check whether we will handle database >
 inode dirty status correctly: > 1. mount f2fs image w/ timeout fault [...]
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.133.124 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uEj9y-0000NL-UK
Subject: Re: [f2fs-dev] [PATCH v3] f2fs/013: test to check potential
 corruption on atomic_write file
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 09, 2025 at 02:07:54PM +0800, Chao Yu wrote:
> This is a regression testcase to check whether we will handle database
> inode dirty status correctly:
> 1. mount f2fs image w/ timeout fault injection option
> 2. create a regular file, and write data into the file
> 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> 4. write transaction data to the file
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> 6. meanwhile loop call fsync in parallel
> Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
> file"), database file may become corrupted after atomic write while
> there is concurrent dirty inode flush in background.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - fix typo: s/relis/relies

This version is good to me, thanks!

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/013     | 71 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/013.out |  2 ++
>  2 files changed, 73 insertions(+)
>  create mode 100755 tests/f2fs/013
>  create mode 100644 tests/f2fs/013.out
> 
> diff --git a/tests/f2fs/013 b/tests/f2fs/013
> new file mode 100755
> index 00000000..80ed2702
> --- /dev/null
> +++ b/tests/f2fs/013
> @@ -0,0 +1,71 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/013
> +#
> +# This is a regression testcase to check whether we will handle database
> +# inode dirty status correctly:
> +# 1. mount f2fs image w/ timeout fault injection option
> +# 2. create a regular file, and write data into the file
> +# 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> +# 4. write transaction data to the file
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# 6. meanwhile loop call fsync in parallel
> +# Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
> +# file"), database file may become corrupted after atomic write while
> +# there is concurrent dirty inode flush in background.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
> +_require_command "$F2FS_IO_PROG" f2fs_io
> +
> +_cleanup()
> +{
> +	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
> +	wait
> +	cd /
> +	rm -r -f $tmp.*
> +}
> +
> +_fixed_by_kernel_commit f098aeba04c9 \
> +	"f2fs: fix to avoid atomicity corruption of atomic file"
> +
> +_require_scratch
> +
> +_scratch_mkfs >> $seqres.full
> +# note that it relies on FAULT_TIMEOUT fault injection support in f2fs
> +_scratch_mount "-o fault_injection=1,fault_type=4194304" >> $seqres.full
> +
> +dbfile=$SCRATCH_MNT/file.db
> +
> +# initialize database file
> +$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $dbfile >> $seqres.full
> +
> +# sync filesystem to clear dirty inode
> +sync
> +
> +# start atomic_write on src.db database file and commit transaction
> +$F2FS_IO_PROG write 1 0 2 zero atomic_commit $dbfile >> $seqres.full &
> +atomic_write_pid=$!
> +
> +# call fsync to flush dirty inode of database file in parallel
> +for ((j=0;j<1000;j++)) do
> +	$F2FS_IO_PROG fsync $dbfile >> $seqres.full
> +done
> +
> +wait $atomic_write_pid
> +unset atomic_write_pid
> +
> +# flush dirty data and drop cache
> +sync
> +echo 3 > /proc/sys/vm/drop_caches
> +
> +stat $dbfile -c %s
> +
> +rm $dbfile
> +sync
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/013.out b/tests/f2fs/013.out
> new file mode 100644
> index 00000000..d9271f75
> --- /dev/null
> +++ b/tests/f2fs/013.out
> @@ -0,0 +1,2 @@
> +QA output created by 013
> +8192
> -- 
> 2.49.0
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

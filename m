Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3993D66E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 17:51:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXNDw-0006AS-Pn;
	Fri, 26 Jul 2024 15:51:16 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1sXNDv-0006AL-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vUe8WBzhVNUTbGuEKEiUGRjCXOwWhRVYd1zRCdAMIa4=; b=Gao9WFMqHGHFWYEkm/FgPwWMma
 vDrEnLl04qHR6NJblhq2rH0850ifqJCC8oYlWEBq1gOv66V+Akd7J/1Crj9KtJnHLeacl87wXBg/d
 VkirDAJOj7CuvnKCcG6ke9cRGmm/sEbZyyXBFcHRdhdJIRTBUto3g7jk+lsM8urg4mc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vUe8WBzhVNUTbGuEKEiUGRjCXOwWhRVYd1zRCdAMIa4=; b=Qi8x8iQB6Ql31wOsv5X9RAaCLm
 6D3+TRS4XCf3vbZ4LfbiCqDEWo5OiGJz7M1AJlQCzFIE0oZ6S8z1WFO8Z4/cItpKUSItCLC/muXJY
 cbbMPtGV+P3JOZVsaxwcp0w0BFteT9qp27rScSwcnh0b0GtktkBZM9Ron/XKyVlyKqBk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXNDt-0006dZ-Al for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722009067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUe8WBzhVNUTbGuEKEiUGRjCXOwWhRVYd1zRCdAMIa4=;
 b=TvyR01gkE7HtLrft02cOUYtFEI/w8cV1CpW7wp3F24NUdwKrNqj4EJnWB23L/81PiolpY5
 Z8nthVj4utdkBcXp1CD5gD0UtdZDl5J+SRafWPKwnz6OKXEug3WsmPSz23c3g6OcFCDnqL
 RNmzdkau4VahUikBfrW9/kST9NZtMnM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-UZ2wwbo6Ov2FDwvzf1j-sw-1; Fri, 26 Jul 2024 11:51:06 -0400
X-MC-Unique: UZ2wwbo6Ov2FDwvzf1j-sw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-26108298239so1493698fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 08:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722009065; x=1722613865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUe8WBzhVNUTbGuEKEiUGRjCXOwWhRVYd1zRCdAMIa4=;
 b=bKLFtuVHrh6a7zUfuc60vAqXh96iuUmR3gMZopDz0C4llG++NVsXCeyT+SY1HjpRMg
 oRH2EC+1IA4/nZI8fN/+JjLsMtj1LqA7px2piMbSWBInY19s3xSwCzTwLyQdJ5gcA4W5
 XoirswhPfS1hA3iHicR2zmvvWcpa+2tNqxZpDgCJ9Em8CWpMv3rUGoPRU1Tbye4nTkhP
 TxHkMuVo+HwI69D7iD1MmosTH6O2J6NxMGzUYn028J/f6lplZGGAinyGLkYIU0xv707E
 jShmv0CW6A/lxi1oO4d9JA+146+r8u3qQuz6RUnrzlyLcQEAjG7uqY+xqi2T4I3SQB9K
 nIdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqWrGGA9H6bFK374FKwmR7JnkAn8IEWGBn8L5OvSg3M7Un6gqL1c7UkVKZXnaz0RagK2EtDm+wWmTQPTZcM1mXhC/wL2S1wIXNhq5u4aIkmPdXm1Z7zw==
X-Gm-Message-State: AOJu0YywpWg8rSmS1EMEXSz+u3ZesDeuKsJnXHrUeR1v7C4Y9NUTZpAk
 QQNTfZTtPTru5uxr/xMf1BZqS/drwCb4y3x+7UNNMKQXkr+PdBzrthDTxpea1SGrn7yS9GRbmtd
 7rMcee2OYqFUeVvC3NTxqs9a238TrN1AB1OPaK0ucPtn5yPLj+am5A3p3jg8U3Q44JnoXhOgKYg
 M=
X-Received: by 2002:a05:6870:63a5:b0:260:3fb2:b724 with SMTP id
 586e51a60fabf-267d4f3d56bmr203290fac.46.1722009065018; 
 Fri, 26 Jul 2024 08:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZjTUe5XYn9eBAZR2mG1GkilCRfiYxPW2RbqYKjlh7798lnpx3rWpPDm/AEqikjek6jntYzA==
X-Received: by 2002:a05:6870:63a5:b0:260:3fb2:b724 with SMTP id
 586e51a60fabf-267d4f3d56bmr203268fac.46.1722009064673; 
 Fri, 26 Jul 2024 08:51:04 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead874c32sm2957831b3a.173.2024.07.26.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:51:04 -0700 (PDT)
Date: Fri, 26 Jul 2024 23:51:01 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240726155101.uop5do6hl3vvjnit@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240720074540.3303154-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240720074540.3303154-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jul 20, 2024 at 03:45:40PM +0800, Chao Yu wrote: >
 Test that we will simulate sqlite atomic write logic w/ below steps: > 1.
 create a regular file, and initialize it w/ 0xff data > 2. start tr [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sXNDt-0006dZ-Al
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: test for race condition in between
 atomic_write and dio
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 20, 2024 at 03:45:40PM +0800, Chao Yu wrote:
> Test that we will simulate sqlite atomic write logic w/ below steps:
> 1. create a regular file, and initialize it w/ 0xff data
> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> 3. write transaction data
> 4. trigger direct read/write IO to check whether it fails or not
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> This is a regression test to check handling of race condition in
> between atomic_write and direct IO.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add kill&wait in _clean() to avoid umount failure
> - some cleanups
> - use exported helpler
>  tests/f2fs/004     | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/004.out |  3 +++
>  2 files changed, 51 insertions(+)
>  create mode 100755 tests/f2fs/004
>  create mode 100644 tests/f2fs/004.out
> 
> diff --git a/tests/f2fs/004 b/tests/f2fs/004
> new file mode 100755
> index 00000000..d71e99ea
> --- /dev/null
> +++ b/tests/f2fs/004
> @@ -0,0 +1,48 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/004
> +#
> +# Test that we will simulate race case in between sqlite atomic write
> +# and direct IO w/ below steps:
> +# 1. create a regular file, and initialize it w/ 0xff data
> +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> +# 3. write transaction data
> +# 4. trigger direct read/write IO to check whether it fails or not
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# This is a regression test to check handling of race condition in
> +# between atomic_write and direct IO.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +. ./common/filter
> +
> +_cleanup()
> +{
> +	kill -9 $atomic_write_pid > /dev/null 2>&1
> +	wait > /dev/null 2>&1

This version is good to me, same things as your last patch. I'll change
it when I merge this patch.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +}
> +
> +_require_scratch
> +_require_odirect
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +dbfile=$SCRATCH_MNT/dbfile
> +
> +# start atomic_write on dbfile & write data to dbfile
> +touch $dbfile
> +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
> +atomic_write_pid=$!
> +
> +# simulate concurrent direct read/write IO
> +$XFS_IO_PROG -d -c "pread 0 128k" $dbfile
> +$XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile
> +
> +# wait for atomic_write commit completion
> +sleep 5
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/004.out b/tests/f2fs/004.out
> new file mode 100644
> index 00000000..3af79541
> --- /dev/null
> +++ b/tests/f2fs/004.out
> @@ -0,0 +1,3 @@
> +QA output created by 004
> +pread: Operation not supported
> +pwrite: Operation not supported
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

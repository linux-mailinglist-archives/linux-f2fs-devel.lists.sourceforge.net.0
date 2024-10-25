Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B39AF850
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 05:44:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4BFk-00013h-LL;
	Fri, 25 Oct 2024 03:44:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t4BFa-00013T-MU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 03:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YteKj671hcr8DQ+XdblfAXUrIeB884eD+JKzRyJ4y5s=; b=JJpSxsSyPmzEVjsuSZkktl3WJf
 DpmbpZqYIj/WsVlLH6AKaiU2Ld+Vww2nc0p715CQu0UngUHAeKKMz2lgyULFlgFqNhChpDppuvxyU
 5QJ6j8H9JttnWowd78XImt+1UiQvepSrcxKcpGzJ3J4h4EM+5RbF8BXkYtTUaeSbDx/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YteKj671hcr8DQ+XdblfAXUrIeB884eD+JKzRyJ4y5s=; b=Xy8uobQksLeZ6dsVDWgtrH6pTg
 DovUJ9ZXXI6ank8Z5jGGRSopj+u1UjsNvPx5Hevu73hF6vCFPNrMg1nyLdxMCwBASrobpfYh8cWno
 2EmHIiicL2O1nXTNK2r6qg3hQpR1mu1q+K3DvykUijH1rOeBJDO/yEiROZCay8N5wYf8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4BFY-0000uS-AV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 03:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729827861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YteKj671hcr8DQ+XdblfAXUrIeB884eD+JKzRyJ4y5s=;
 b=EoNC2uhz0ouY6FZNUamaWbWDH63I1nBi5kmXY/hJEEnU1l2Il6Zi5u2PTR+u9KVrMCMOaV
 +ighu4faAF1fnL5l/b4v/TDS2dEfDfJQMFKomWvC6+A4GS56bcfSpReSSsLLqhGtR9Eczu
 cpPycYCiEsy1C9FsykZhN62szNDAzdY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-88BmIr53PZiWCyigl9fSrQ-1; Thu, 24 Oct 2024 23:44:20 -0400
X-MC-Unique: 88BmIr53PZiWCyigl9fSrQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-7ea7b3b056eso1340540a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 20:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729827858; x=1730432658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YteKj671hcr8DQ+XdblfAXUrIeB884eD+JKzRyJ4y5s=;
 b=FZzPyxwP4yoa8JQewVNvLlYvVr81GXQPzQnAl6jmsfbQeEHKgQFoKYO5GG98b6Ozrh
 T2QTWTR5iG78xbhiV+0nVXbu8cnmMSMkRBeK3SN6mt3Kidbq5PsHe0dcyjO01YrCShPE
 dE+ua8LH3jIQDTV9sqRu17LVdOV8dbmGzEXeRVMxUV+32zLV1e37hcx+28mhY1xkXZbj
 z0StTc1ydLrJLkRWWV+efBW0ejqIUBJZGTp1RoiloMwPejNxfU5KQOAT3dTt2wBg47nd
 j0SJTkGSp9BTDdijHyhVEBLsFiw8v4W64UPoItzPNjuI1UKbKyPKGOcpsEXbUmSfaC7D
 f9Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU691zknnN2IQ0Pa9aiox154yv2+/HXXiqcvm6MbqJxiJ2t30vesWbav4awu9EXHFMhU4A66ymaN6ZDw6oEKE6T@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzwz3IqxrYLn6zBXtV2+EGILxTIDgH9RF/b60nPPAj6G0K2+/4j
 w46t9rBJwQ81kJuXh5NCrP5Flfa9D6hyw771vuaVuCxIAEixrVkYd+AM1ApoeJozkQ8ek56qHMd
 JdlyQhyOQSfU6iRDCJh3TKrWwSEbU6UzZg1d2ee0z/Hci7sTNpie/qbpBfggfgWdVFP5oQNLUuC
 dWV56yil6F8g==
X-Received: by 2002:a05:6a21:710a:b0:1d9:f95:9f97 with SMTP id
 adf61e73a8af0-1d978af831amr10840718637.16.1729827858464; 
 Thu, 24 Oct 2024 20:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4QQcO6UMR0AKLdGxEQmICmZ+jzSj53Fer+sedMwzKSexZ13lMbDEZQDiXBdyIk3loj95qsw==
X-Received: by 2002:a05:6a21:710a:b0:1d9:f95:9f97 with SMTP id
 adf61e73a8af0-1d978af831amr10840702637.16.1729827858064; 
 Thu, 24 Oct 2024 20:44:18 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a3bf5fsm177475b3a.183.2024.10.24.20.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 20:44:17 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:44:13 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241025034413.5s6ecilfgqcoeudt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241023081602.3806579-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241023081602.3806579-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 23, 2024 at 04:16:01PM +0800, Chao Yu wrote: >
 This is a regression test to check whether f2fs handles dirty > data correctly
 when checkpoint is disabled, if lfs mode is on, > it will trig [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4BFY-0000uS-AV
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs/006: add testcase to check
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

On Wed, Oct 23, 2024 at 04:16:01PM +0800, Chao Yu wrote:
> This is a regression test to check whether f2fs handles dirty
> data correctly when checkpoint is disabled, if lfs mode is on,
> it will trigger OPU for all overwritten data, this will cost
> free segments, so f2fs must account overwritten data as OPU
> data when calculating free space, otherwise, it may run out
> of free segments in f2fs' allocation function, resulting in
> panic.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add _fixed_by_kernel_commit()
> - use _scratch_mkfs_sized() rather than formating size-specified
> loop device
> - code cleanup
>  tests/f2fs/006     | 38 ++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/006.out |  6 ++++++
>  2 files changed, 44 insertions(+)
>  create mode 100755 tests/f2fs/006
>  create mode 100644 tests/f2fs/006.out
> 
> diff --git a/tests/f2fs/006 b/tests/f2fs/006
> new file mode 100755
> index 00000000..63d00018
> --- /dev/null
> +++ b/tests/f2fs/006
> @@ -0,0 +1,38 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/006
> +#
> +# This is a regression test to check whether f2fs handles dirty
> +# data correctly when checkpoint is disabled, if lfs mode is on,
> +# it will trigger OPU for all overwritten data, this will cost
> +# free segments, so f2fs must account overwritten data as OPU
> +# data when calculating free space, otherwise, it may run out
> +# of free segments in f2fs' allocation function, resulting in
> +# panic.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to account dirty data in __get_secs_required()"
> +
> +testfile=$SCRATCH_MNT/testfile
> +
> +_require_scratch
> +_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
> +
> +# use mode=lfs to let f2fs always triggers OPU
> +_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
> +
> +dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
> +
> +# it may run out of free space of f2fs and hang kernel
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
> +dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync

What kind of failure should be printed at here if test on unfixed kernel?
I got:

# diff -u /root/git/xfstests/tests/f2fs/006.out /root/git/xfstests/results//default/f2fs/006.out.bad|less
--- /root/git/xfstests/tests/f2fs/006.out       2024-10-25 11:33:54.693883281 +0800
+++ /root/git/xfstests/results//default/f2fs/006.out.bad        2024-10-25 11:34:55.907252401 +0800
@@ -1,6 +1,6 @@
 QA output created by 006
 50+0 records in
 50+0 records out
-dd: error writing '/mnt/scratch_f2fs/testfile': No space left on device
-3+0 records in
-2+0 records out
+dd: fsync failed for '/mnt/scratch/testfile': Input/output error
+50+0 records in
+50+0 records out

Does that mean the bug is reproduced?

> +
> +_scratch_remount checkpoint=enable
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
> new file mode 100644
> index 00000000..0d7b3910
> --- /dev/null
> +++ b/tests/f2fs/006.out
> @@ -0,0 +1,6 @@
> +QA output created by 006
> +50+0 records in
> +50+0 records out
> +dd: error writing '/mnt/scratch_f2fs/testfile': No space left on device

The "/mnt/scratch_f2fs" should be SCRATCH_MNT, please use _filter_scratch()
by importing common/filter.

> +3+0 records in
> +2+0 records out
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

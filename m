Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F05ABED83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 10:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejrHn9hE06F3AOAGjxBTe93E+BOjwKCjecUhqCgVBr0=; b=KHNeWCkYqa/FosIq1T0/j9BbQA
	WgXYqZkZgJwEBOFO2rba4Qzr9/bbUBXLHk6y1QGFgs1A9muuaclC6zy4TXlFQclN2zFOb7lEaSZjg
	MIIzTvoBCoEt5PDK9YbRqESkR+KaAiV8OoJVQ/AFVvtLs/CQZxux/fDRG/Xpas0g63Nk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHeRw-0001MQ-Ag;
	Wed, 21 May 2025 08:05:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uHeRu-0001MK-Hk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 08:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/xkZE1Oin/piqgVEqGuoWRwTg+xk4vJnVQafBbadp4=; b=b6O9fwiIj3Oplm4IuA7G8aE1Rj
 3E47FlJXfH0aGt6+1gRcLEcvf/r4+YrwRyfbbRUJaNshSGnAqXMKi09cwmBeMbzabG1K26rBinyuP
 9nonPf7rOIfjGTMsfDjb56v/bV4kUENsxo0LYNDLDJb2dw5w9b7DHtupmg/wtTIsuFwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/xkZE1Oin/piqgVEqGuoWRwTg+xk4vJnVQafBbadp4=; b=iuSi6fZN5dbCgE8YHQRRMSLxJf
 ed/FCQ0sk2NWukEjWUOsxSGkRx53szv9W4rHb1IMZiNov+HA53Njdn7SCfIQwPSzm+/RwakbOeu9S
 9lfmMY9ZlC2AuLmp/cajcfKtf0P9FknRb+wu7ZGa8+PrT1aYw2YisnVu78KmzY9Z4Uqc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHeRt-0001i8-2m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 08:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25B945C5533;
 Wed, 21 May 2025 08:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99346C4CEE4;
 Wed, 21 May 2025 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747814699;
 bh=539roYUUPN3pdqDCTq6rLSRcyDPVA5Foif7GPQH3jOY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PUnTsAAJfxMwrUAStyJNvRwVpinxb0AA/qGVNm3haDEVk7P5ChYx00b7aiuq+FgEq
 sEOPyvAdlxCM4qBRtjcklBplS4uOP1tpyxA58hrKYcNNEX45ML8+PViqd/SEV1G3EO
 0WrEPdZLxOPYXLZAMgdIL7BUFFATVWvyqYrki/b4JAMMISNr88miecQ3QYcMMbDr/F
 JYM5kEzbjx4AHayu70HBkOUCgHzcl/q/XGQk4w3CLC04ksZtRiW93fSRZZQ1x2M+c7
 NZ9a50qjZkFZboGlT+DMLtNuwDg/yRGzNAXfHV2Q0thS1SIy37415GjWMCMKMx34mk
 d+Hd1Lnw1YXGQ==
Message-ID: <f734de12-bc68-4edd-bb8f-f07263878ad9@kernel.org>
Date: Wed, 21 May 2025 16:04:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, zlang@kernel.org,
 fstests@vger.kernel.org
References: <20250521064952.1373690-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250521064952.1373690-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "0e5755722a66", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/21/25 14:49, Chunhai Guo wrote: > This is a regression
 test case to verify whether the CP_TRIMMED_FLAG is > properly set after
 performing
 the following steps: > 1. mount the f2fs filesystem > 2. [...] 
 Content analysis details:   (-5.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uHeRt-0001i8-2m
Subject: Re: [f2fs-dev] [PATCH] f2fs/012: test for missing 'trimmed' flag
 issue
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/21/25 14:49, Chunhai Guo wrote:
> This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> properly set after performing the following steps:
> 1. mount the f2fs filesystem
> 2. create a file, write data to it, then delete the file
> 3. unmount the filesystem
> 4. verify that the 'trimmed' flag is set in the checkpoint state
> 
> We should apply the commit ("f2fs: fix missing discard for active
> segments") to resolve the issue where the 'trimmed' flag is missing.

Chunhai, thanks for working on this testcase!

> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Also, as I tested, it works as expected.

Thanks,

> ---
>  tests/f2fs/012     | 39 +++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/012.out |  2 ++
>  2 files changed, 41 insertions(+)
>  create mode 100755 tests/f2fs/012
>  create mode 100644 tests/f2fs/012.out
> 
> diff --git a/tests/f2fs/012 b/tests/f2fs/012
> new file mode 100755
> index 000000000000..b3486b730fd4
> --- /dev/null
> +++ b/tests/f2fs/012
> @@ -0,0 +1,39 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Guo Chunhai.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/012
> +#
> +# This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> +# properly set after performing the following steps:
> +# 1. mount the f2fs filesystem
> +# 2. create a file, write data to it, then delete the file
> +# 3. unmount the filesystem
> +# 4. verify that the 'trimmed' flag is set in the checkpoint state
> +# We should apply the commit ("f2fs: fix missing discard for active
> +# segments") to resolve the issue where the 'trimmed' flag is missing.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_fixed_by_kernel_commit 21263d035ff2 \
> +	"f2fs: fix missing discard for active segments"
> +
> +_require_scratch
> +_require_xfs_io_command "pwrite"
> +_require_command "$DUMP_F2FS_PROG" dump.f2fs
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +foo=$SCRATCH_MNT/foo
> +$XFS_IO_PROG -c "pwrite 0 1m" -c "fsync" -f $foo >> $seqres.full
> +sync
> +
> +rm $foo
> +_scratch_unmount >> $seqres.full 2>&1
> +
> +$DUMP_F2FS_PROG $SCRATCH_DEV | grep "checkpoint state" | grep -o trimmed
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/012.out b/tests/f2fs/012.out
> new file mode 100644
> index 000000000000..00a061bb0ae4
> --- /dev/null
> +++ b/tests/f2fs/012.out
> @@ -0,0 +1,2 @@
> +QA output created by 012
> +trimmed



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A42B25E06
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 09:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoY3CvjFNz3sMwGGUlPG4um6w3lbK6hFqzIMYF/PntI=; b=SOyd68+HRrPVGUFt7EwZLuDlj5
	iImxxXIHdBXWHSY9B6V+abZ04ZOXWDqE60yIfUNilTkcOXmeKVptc6plpI5dR8usBKIvEho12UgGV
	+DE/un4/Zqvdm3fmQQY6XRpuYWIrvXx4rDWcOTKFE8XODJi+rGZYv8bG962OiSYTlaHQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umSkh-0001p9-BP;
	Thu, 14 Aug 2025 07:51:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umSkf-0001p3-HL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 07:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3FdlngHktvYlOY1k9MQ14KhdfsZpLBdtwyhNbobnHE=; b=UpB3xNgIhlVQUPxrAOa+QrRlng
 Iwnilj+FDzvvERFshgob8llM0OlRJZkjfgG9MvbeIH8nU00dWfHvv2LHeCCzuIt6j5GdI9t2tSwlp
 1moo4IoSEkkb26cEw6ZJFog31+40w3m0qtrhNjMjwwsu7rtTXdY2ErRcskw/eLudQy00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C3FdlngHktvYlOY1k9MQ14KhdfsZpLBdtwyhNbobnHE=; b=G2ythuMO/c5N7lRIg+sGqGETxl
 rnSxla+kL7/jQZN8kvQZh/pid2tFr+FwWu/JDuJmff0A9RFdL9UnWmp5qKsx0HDFFx7+VbzwvhcIu
 tOdWbeVtcCUjKIoxMzIpPrSAMZ/3ih7/YzC0XbYpvERCfja2p/WM2MmMA7z165TLVXSA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umSke-0003va-WF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 07:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59E8E601F7;
 Thu, 14 Aug 2025 07:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70519C4CEEF;
 Thu, 14 Aug 2025 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755157906;
 bh=5Ln9MzxQ3Dg1i3OIeQqZz8tEG6e+pOB2zjXzxmJHeDk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uBAw4MiJomHxJT/BDb5ICnFzpzoBypghNR0CLRdkxmfCBNDe0UY5ZCns0io8XGJK6
 HP0Wlm91rfpo31byumU04O3VpcXVz03fb3DWs654GmcUuAsYtSNnkjBNbKu0Paf6vA
 NkBX38iQGS43Y4DJ1dlVsltgyYirac2FVHeHAPe5KKjoAFkTqzLJab0WWK/CnyVTf6
 hxBQU/eivZJqZ+22MgOm9yfM/Y1nRNWjHX7CT9z+mAE6YGAkXIM4CKhcponE1mTQkE
 m3xxuph9d3XhEm3gUznvNh9awELBWuULVcKk/CslQ5zR6lRzn0LtxeHqM20Xpmcp26
 XGNInnsu22jCQ==
Message-ID: <21c96ae0-44ee-4cc8-88f3-7d51cefb8f94@kernel.org>
Date: Thu, 14 Aug 2025 15:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250811094415.1053545-1-chao@kernel.org>
 <20250811094415.1053545-2-chao@kernel.org>
 <20250813152144.usxshpwpy2pqlovi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250813152144.usxshpwpy2pqlovi@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/13/25 23:21, Zorro Lang wrote: > On Mon, Aug 11, 2025
 at 05:44:14PM +0800, Chao Yu wrote: >> This is a regression test: >> 1. create
 a file >> 2. write file to create a direct node at special off [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umSke-0003va-WF
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs/019: do sanity check on mapping
 table
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/13/25 23:21, Zorro Lang wrote:
> On Mon, Aug 11, 2025 at 05:44:14PM +0800, Chao Yu wrote:
>> This is a regression test:
>> 1. create a file
>> 2. write file to create a direct node at special offset
>> 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
>> 4. check whether f2fs kernel module will detect and report such
>>    corruption in the fil
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  tests/f2fs/019     | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/019.out |  2 ++
>>  2 files changed, 47 insertions(+)
>>  create mode 100755 tests/f2fs/019
>>  create mode 100644 tests/f2fs/019.out
>>
>> diff --git a/tests/f2fs/019 b/tests/f2fs/019
>> new file mode 100755
>> index 00000000..0a02eb2f
>> --- /dev/null
>> +++ b/tests/f2fs/019
>> @@ -0,0 +1,45 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/019
>> +#
>> +# This is a regression test:
>> +# 1. create a file
>> +# 2. write file to create a direct node at special offset
>> +# 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
>> +# 4. check whether f2fs kernel module will detect and report such
>> +#    corruption in the file
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick rw compress
>> +
>> +_cleanup()
>> +{
>> +	_scratch_mkfs >> $seqres.full
> 
> Why mkfs SCRATCH_DEV in _cleanup ?

Because SCRATCH_DEV will be corrupted after injection.

> 
>> +}
>> +
>> +_fixed_by_kernel_commit 77de19b6867f \
>> +	"f2fs: fix to avoid out-of-boundary access in dnode page"
>> +
>> +export MKFS_OPTIONS=""
> 
> Can you give it a comment about why we need to clean mkfs option at here?

Sure.

> 
>> +_require_scratch
> 
> Oh, if this case tends to have a corrupted SCRATCH_DEV, you can use
> _require_scratch_nocheck at here, don't need to mkfs in _cleanup.

Oh, my bad, you've mentioned the function on f2fs/012 once, but I forget to
use it in this testcase.

> 
>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +
>> +testfile=$SCRATCH_MNT/testfile
>> +
>> +_scratch_mkfs >> $seqres.full
>> +_scratch_mount
>> +
>> +xfs_io -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
>    ^^^^^^
> $XFS_IO_PROG
> 
>> +
>> +_scratch_unmount
>> +
>> +$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
>> +
>> +_scratch_mount
>> +xfs_io -c "pread 3700M 40M" $testfile
>    ^^^^^^
> $XFS_IO_PROG

Will update them in v2.

Thanks,

> 
>> +_scratch_unmount
>> +
>> +status=0
>> +exit
>> diff --git a/tests/f2fs/019.out b/tests/f2fs/019.out
>> new file mode 100644
>> index 00000000..2f7469e2
>> --- /dev/null
>> +++ b/tests/f2fs/019.out
>> @@ -0,0 +1,2 @@
>> +QA output created by 019
>> +pread: Structure needs cleaning
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

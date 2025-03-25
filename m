Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27EA6FEA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 13:55:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx3oX-0005DC-7o;
	Tue, 25 Mar 2025 12:55:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tx3oW-0005D6-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vh2hajGyAeuUof7qCt9dz7FcP70pbH5IreAbsGEpFrU=; b=LGcwZB3FXpHZtLMfYTIA1jKNSr
 t/yI1EFYVI5vvYz7zPlH0GziOzeiZkAoJeTkIKcze64Lmwktar6PK6Y42D3LlJ5MEMjywML6fOWG6
 mWnYLvCOnZikjKL1MkjENiFWs288oFUAs9KHLyLOkVuxAm7m+w41VgvcZ7WH2zOPrerk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vh2hajGyAeuUof7qCt9dz7FcP70pbH5IreAbsGEpFrU=; b=Tug+a3mglZNZGL759EFVgSnucV
 u6gQuFSXglngabW00XEzHPE84I53bsbJbG8kEkDVPI8ZnLdpMF9wVPQkf78VVXg3oh6D2UVmNjNE3
 9rvafPDgt+gpj26srXj2Hu/9zSNhG7sV6X2flH5oQoApmhMplC+XHWWCQRChrAl91KQQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tx3oQ-0003zX-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 12:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 058C043C93;
 Tue, 25 Mar 2025 12:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578FAC4AF0B;
 Tue, 25 Mar 2025 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742907311;
 bh=Kfw42C6tDQ+goG19KwTiJ4ohGwXs3Iv/EnsP7pZVEw4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jTGw74w+bYHU354IX+4j3pncVpAd1WQXe36LyM6cd8TToxzmR80jSm9TQfypLTVLs
 IECD9ViwnwmaYEdHMMZuxX0ZW3nDy0LxECVBXkfWPYfrCSS8xX8zj+tR7qW7tfytsv
 fe9Aaa1qp6KmmH7dsExF9xVuLbjC/kZ16U/1Iagcql4/5H0MLbgXfnVWliibjJ3+bV
 usw1rywY9hxcKe6KzXTSIFi1+nLKQSg1t42Km9SODcS/O0T4TtsorvOkDRnLuxJiqQ
 anmBIx5PsrRHndUqBzZQbHshpENfG921tZx3XEC5EAhAhvibocul5Z1A8xdS1nnzZw
 DcHsRa6D3oyhQ==
Message-ID: <68e0cf2c-31f2-47b6-a789-df2df3763856@kernel.org>
Date: Tue, 25 Mar 2025 20:55:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>
References: <20250312072309.3989074-1-chao@kernel.org>
 <20250312072309.3989074-6-chao@kernel.org>
 <Z-J0LnCEWX2bo9LF@dread.disaster.area>
Content-Language: en-US
In-Reply-To: <Z-J0LnCEWX2bo9LF@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/25/25 17:15, Dave Chinner wrote: > On Wed, Mar 12, 2025
 at 03:23:09PM +0800, Chao Yu wrote: >> This is a regression test to check
 whether fsck can handle corrupted >> nlinks correctly, it uses in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tx3oQ-0003zX-Nh
Subject: Re: [f2fs-dev] [PATCH v4 6/6] f2fs/009: detect and repair nlink
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/25/25 17:15, Dave Chinner wrote:
> On Wed, Mar 12, 2025 at 03:23:09PM +0800, Chao Yu wrote:
>> This is a regression test to check whether fsck can handle corrupted
>> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>> and expects fsck.f2fs can detect such corruption and do the repair.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v4:
>> - remove unnecessary "_require_command fsck.f2fs"
>> - clean up _fixed_by_git_commit line
>> - fix to clean all tmp files in _cleanup
>>  tests/f2fs/009     | 147 +++++++++++++++++++++++++++++++++++++++++++++
>>  tests/f2fs/009.out |   2 +
>>  2 files changed, 149 insertions(+)
>>  create mode 100755 tests/f2fs/009
>>  create mode 100644 tests/f2fs/009.out
>>
>> diff --git a/tests/f2fs/009 b/tests/f2fs/009
>> new file mode 100755
>> index 00000000..9120d8a5
>> --- /dev/null
>> +++ b/tests/f2fs/009
>> @@ -0,0 +1,147 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>> +#
>> +# FS QA Test No. f2fs/009
>> +#
>> +# This is a regression test to check whether fsck can handle corrupted
>> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>> +# and expects fsck.f2fs can detect such corruption and do the repair.
>> +#
>> +. ./common/preamble
>> +_begin_fstest auto quick
>> +
>> +if [ ! -x "$(type -P socket)" ]; then
>> +	_notrun "Couldn't find socket"
>> +fi
>> +
>> +_require_scratch
>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +
>> +_fixed_by_git_commit f2fs-tools 958cd6e \
>> +	"fsck.f2fs: support to repair corrupted i_links"
>> +
>> +filename=$SCRATCH_MNT/foo
>> +hardlink=$SCRATCH_MNT/bar
>> +
>> +_cleanup()
>> +{
>> +	if [ -n "$pid" ]; then
>> +		kill $pid &> /dev/null
>> +		wait
>> +	fi
>> +	cd /
>> +	rm -r -f $tmp.*
>> +}
>> +
>> +for ((i=0;i<14;i++)) do
>> +	echo "round: " $i >> $seqres.full
>> +
>> +	_scratch_mkfs >> $seqres.full
>> +	_scratch_mount
>> +
>> +	if [ $i == 0 ]; then
>> +		touch $filename
>> +		ino=`stat -c '%i' $filename`
>> +		nlink=0
>> +	elif [ $i == 1 ]; then
> .....
> 
> Ok, it works, but it's a bit nasty. You want to run the same
> injection and checking on all types of inodes, so factor that out
> like so:
> 
> inject_and_check()
> {
> 	local nlink=$1
> 	local ino=`stat -c '%i' $filename`
> 
> 	echo "ino:"$ino >> $seqres.full
> 	echo "nlink:"$nlink >> $seqres.full
> 
> 	_scratch_unmount
> 
> 	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
> 		>> $seqres.full || _fail "fail to inject"
> 
> 	_check_scratch_fs >> $seqres.full 2>&1 && _fail "can't find corruption"
> 	_repair_scratch_fs >> $seqres.full
> 	_check_scratch_fs >> $seqres.full 2>&1 || _fail "fsck can't fix corruption"
> 
> 	_scratch_mount
> 	_scratch_unmount
> 
> 	_scratch_mkfs >> $seqres.full
> 	_scratch_mount
> }
> 
> And now most of the test cases become this:
> 
> _scratch_mkfs >> $seqres.full
> _scratch_mount
> 
> touch $filename
> inject_and_check 0
> 
> mkdir $filename
> inject_and_check 1
> 
> mknod $filename c 9 0
> inject_and_check 0
> 
> mknod $filename b 8 0
> inject_and_check 0
> 
> .....
> 
> The whacky cases with socket and orphan inodes can be handled
> by factoring inject_and_check so there's a second function that
> takes both ino and nlink as parameters.
> 
> This gets rid of all the unnecessary if/elif logic and looping, 
> leaving only the test code that does the work behind.

Thanks a lot for the suggestion, it will be more clean w/ above
implementation, will update v5.

Thanks,

> 
> -Dave.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

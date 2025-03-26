Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A4A70F5A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 04:25:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txHO5-0002q4-UC;
	Wed, 26 Mar 2025 03:25:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txHO4-0002px-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 03:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYwSI+UfJ8nJ35/ucGFPAfAzbUxMFOnZmKsO2TepCUs=; b=KmU+DM3sYBcOA5tfucgu9x6kxl
 wmS5PG1MJTGT9mH8KV20SFUwjNtU5sKQ/oH+7a/dAJoDvica3HVVRNH0aLSeDHD8TYk07EW49CI0p
 Ei9BRO0G+RfTHPvqyYY1xRsv62FVH1q/y/1PXecl+KGSED+csSFhiUw3kUKkGTV8ISiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYwSI+UfJ8nJ35/ucGFPAfAzbUxMFOnZmKsO2TepCUs=; b=jgQeMffaLEkymD8h6m+0GHHAWK
 JiGDGCOsQJUznkt7i00KwJ2EP7PxJiFugo+KUdDUG38UHdc02DQUodcbG1+mZaGM8LM1+an+0gTY8
 ofAb9HimHpvTUvoWsP1dTcNi8wDxy8f+6S1R6ctstCEsslwBD8L7SR6OuR3P9q5NkzIU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txHNy-0000fN-7r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 03:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20C8761132;
 Wed, 26 Mar 2025 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2890FC4CEE2;
 Wed, 26 Mar 2025 03:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742959487;
 bh=slulgQE+aQy8LnXABstJI1BsbYuK7K2GlkRqWtbSuz8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=F9FPCAbzYPZeT7YoHrHWfj7nRRfLTkWj90rnHLh+VVjsp+DRmVQRme/X4w3npGZx+
 ax5usCDXTPnwLm+b67FHZjFrwEDp8HmzjU70dO7wp9ChsewDV5YDIIn6DZsIo11IrT
 IM10FIOzkiiY2IDQSdWfpgbrLxUCP3VlmG/2Vep32R3p/+4Psq2QFOkykI3C//zx8j
 1rsRH4R1gMKOiWWel35ifQuag9+NrsPM2tjXRIcYJQfSXSfxnmVsn/hKhKfqqmmdUl
 etYNpPDJFYDVXGqRnSriuUQ1pAzlFImYq64qZkPtW2BWsAA57JEXR43aO1LIjbz92C
 6tXHSWF6yyKxg==
Message-ID: <5ae5a7d0-18bb-49f1-abb2-46807e39a7fe@kernel.org>
Date: Wed, 26 Mar 2025 11:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>, Dave Chinner <david@fromorbit.com>
References: <20250325125824.3367060-1-chao@kernel.org>
 <20250325125824.3367060-6-chao@kernel.org>
 <Z-M6PkLZI2LIOlXY@dread.disaster.area>
 <20250326004748.bx2z62lpqpg6rjlj@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250326004748.bx2z62lpqpg6rjlj@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/26/25 08:47, Zorro Lang wrote: > On Wed, Mar 26, 2025
 at 10:20:30AM +1100, Dave Chinner wrote: >> On Tue, Mar 25, 2025 at 08:58:24PM
 +0800, Chao Yu wrote: >>> This is a regression test to check w [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txHNy-0000fN-7r
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/26/25 08:47, Zorro Lang wrote:
> On Wed, Mar 26, 2025 at 10:20:30AM +1100, Dave Chinner wrote:
>> On Tue, Mar 25, 2025 at 08:58:24PM +0800, Chao Yu wrote:
>>> This is a regression test to check whether fsck can handle corrupted
>>> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>>> and expects fsck.f2fs can detect such corruption and do the repair.
>>>
>>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> ---
>>> v5:
>>> - clean up codes suggested by Dave.
>>>  tests/f2fs/009     | 141 +++++++++++++++++++++++++++++++++++++++++++++
>>>  tests/f2fs/009.out |   2 +
>>>  2 files changed, 143 insertions(+)
>>>  create mode 100755 tests/f2fs/009
>>>  create mode 100644 tests/f2fs/009.out
>>>
>>> diff --git a/tests/f2fs/009 b/tests/f2fs/009
>>> new file mode 100755
>>> index 00000000..864fdcfb
>>> --- /dev/null
>>> +++ b/tests/f2fs/009
>>> @@ -0,0 +1,141 @@
>>> +#! /bin/bash
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
>>> +#
>>> +# FS QA Test No. f2fs/009
>>> +#
>>> +# This is a regression test to check whether fsck can handle corrupted
>>> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>>> +# and expects fsck.f2fs can detect such corruption and do the repair.
>>> +#
>>> +. ./common/preamble
>>> +_begin_fstest auto quick
>>> +
>>> +if [ ! -x "$(type -P socket)" ]; then
>>> +	_notrun "Couldn't find socket"
>>> +fi
>>
>> Perhaps something like:
>>
>> _require_command $(type -P socket) socket
> 
> Good point! Maybe double quotation marks -- "$(type -P socket)" is
> helpful, due to if socket isn't installed, there will be only one
> argument.
> 
>>
>> would be more consistent with all the other code that checks for

Agreed.

>> installed utilities that a test requires?
>>
>>> +_require_scratch
>>> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
>>> +
>>> +_fixed_by_git_commit f2fs-tools 958cd6e \
>>> +	"fsck.f2fs: support to repair corrupted i_links"
>>> +
>>> +filename=$SCRATCH_MNT/foo
>>> +hardlink=$SCRATCH_MNT/bar
>>> +
>>> +_cleanup()
>>> +{
>>> +	if [ -n "$pid" ]; then
>>> +		kill $pid &> /dev/null
>>> +		wait
>>> +	fi
>>> +	cd /
>>> +	rm -r -f $tmp.*
>>> +}
>>> +
>>> +_inject_and_check()
>>
>> Single leading "_" is reserved for fstests functions, not for local
>> test functions.

Oh, got it.

>>
>> Just call this one "inject_and_test", because that is what it does,
>> and call this one:
>>
>>> +inject_and_check()
>>> +{
>>> +	local nlink=$1
>>> +	local create_hardlink=$2
>>> +	local ino=$3
>>> +
>>> +	if [ -z $ino ]; then
>>> +		ino=`stat -c '%i' $filename`
>>> +	fi
>>> +
>>> +	if [ $create_hardlink == 1 ]; then
>>> +		ln $filename $hardlink
>>> +	fi
>>> +
>>> +	_inject_and_check $nlink $ino
>>> +}
>>
>> something like check_links()
>>
>> Otherwise this is a good improvement.

Thanks Dave for all your review and suggestion!

> 
> Hi Chao, if you agree with all these changes, and don't need to change more, I can
> help to merge this patchset with above changes. Or you'd like to send a new version?

Zorro, I'm fine w/ all the changes, I'm appreciate for that if you can
help to update the patch!

Thanks,

> 
> Thanks,
> Zorro
> 
>>
>> -Dave.
>> -- 
>> Dave Chinner
>> david@fromorbit.com
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

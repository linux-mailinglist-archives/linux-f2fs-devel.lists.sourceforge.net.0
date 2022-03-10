Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7414D41DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSDJ4-000058-W1; Thu, 10 Mar 2022 07:33:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nSDJ1-0008WO-PW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tm82DVH7h3GGJgZrntvlBwOwJRinf+U5LpriYoQ4fxo=; b=AWGjBRN/LGjpPEcjYfd1qWdmp7
 EK6a5lh0KXCdTOO41enRwze3Cm4ZazNyi0W6DoMnu1U+ElXpa7MMkVtttJ8g9nLSQvbRBqiWrDQe8
 e2DWJ+2APQacEfjBl6YXdkxWxeAjzxGXo8aHmZ5yvipfnfrFxyCTI4J1H9tUAwBNXo0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tm82DVH7h3GGJgZrntvlBwOwJRinf+U5LpriYoQ4fxo=; b=jIIAIl+Q81818LhDVT8dlte9x4
 LNrEAa9lUxH+uQyhuYhmdeRW9iwnobgA5bBLgcptczWfPj7T8uOYpldwVu1PqK6LxW+kdEDTXOyRy
 vlVO1ou5+H6akT8198J01ZSG4a6fNYfNcFlwIQ+fDmDSHEg0Cdx+Qx6fjYnt85Y5Sz3k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSDIu-00Adls-8f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:33:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18668B82191;
 Thu, 10 Mar 2022 07:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358CDC340E8;
 Thu, 10 Mar 2022 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646897611;
 bh=iz9iB9++oDDcxQCiK7inZUtTqGCMtbCwweBQa6nJNWI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V/CYLz4XJuUYgf8d9M+lsU6YNrm5WdBxnNAWshS5sptPXNvtKMd87Js5J+LRMXOjl
 uL3LJW2JabDF54GhaI3JG26wdT8PZMEizeLg6AhQweiILtbKQDw+0ZLQUoArHVCOb1
 wIupXX5JPFBTE+ZVHAnCS/xi476tK6wiN2J9Ey1FQ/j49laDHjSkSJIwn18aJmCZSa
 PXD8Hhlw2mTvvyEZ1zSB4K6RueeHrbzEfheIYStkSgKL7aZHRk6F5gH/Q3dAo6Jy6+
 Ns12wtYZnrzjJe94dzDF0ZmK83qp74Ri7FYn8QAi5/zxuszMKAShK9NSgjhY0KcqLM
 Vfd/jVBJr1smA==
Message-ID: <99e07f53-0d37-7a7d-38af-6077ab5ba00e@kernel.org>
Date: Thu, 10 Mar 2022 15:33:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
References: <20220228035719.4102745-1-sunke32@huawei.com>
 <cd2a245e-b9d2-c09c-0f8c-a7ca9157ca9f@oppo.com>
 <20220309062223.GY3927073@dread.disaster.area>
 <0a5c5efd-597e-7d13-9008-195cf6cf83f1@kernel.org>
 <20220310014139.GZ3927073@dread.disaster.area>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220310014139.GZ3927073@dread.disaster.area>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/10 9:41, Dave Chinner wrote: > On Wed, Mar 09, 2022
 at 03:34:27PM +0800, Chao Yu wrote: >> On 2022/3/9 14:22, Dave Chinner wrote:
 >>> On Wed, Mar 09, 2022 at 12:31:17PM +0800, Chao Yu wrote: [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nSDIu-00Adls-8f
Subject: Re: [f2fs-dev] [PATCH] generic/066: attr1 is still there after log
 replay on f2fs
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
Cc: jaegeuk@kernel.org, Sun Ke <sunke32@huawei.com>, guan@eryu.me,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/10 9:41, Dave Chinner wrote:
> On Wed, Mar 09, 2022 at 03:34:27PM +0800, Chao Yu wrote:
>> On 2022/3/9 14:22, Dave Chinner wrote:
>>> On Wed, Mar 09, 2022 at 12:31:17PM +0800, Chao Yu wrote:
>>>> On 2022/2/28 11:57, Sun Ke via Linux-f2fs-devel wrote:
>>>>> The test fail on f2fs:
>>>>>         xattr names and values after second fsync log replay:
>>>>>         # file: SCRATCH_MNT/foobar
>>>>>        +user.attr1="val1"
>>>>>         user.attr3="val3"
>>>>>
>>>>> attr1 is still there after log replay.
>>>>> I guess it is f2fs's special feature to improve the performance.
>>>>>
>>>>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>>>>> ---
>>>>>
>>>>> Is it a BUG on f2fs?
>>>>
>>>> I don't think so, it fails due to f2fs doesn't follow recovery rule which
>>>> btrfs/ext4/xfs does, but it doesn't mean f2fs has break posix semantics of
>>>> fsync().
>>>
>>> I disagree.  A failure in this test is indicative of non-conformance
>>> with the Linux definition of fsync() behaviour.
>>>
>>> You are right in that it does not break POSIX fsync semantics, but
>>> POSIX allows "do nothing" as a valid implementation. However,
>>> because of this loophole, the POSIX definition is complete garbage
>>> and we do not use it.
>>>
>>> That behaviour that Linux filesytsems are supposed to implement is
>>> defined in the Linux fsync() man page, and it goes way beyond what
>>> POSIX requires:
>>>
>>> $ man fsync
>>> ....
>>> DESCRIPTION
>>>       fsync() transfers ("flushes") all modified in-core data of
>>>       (i.e., modified buffer cache pages for) the file referred to by
>>>       the file descriptor fd to the disk device (or other permanent
>>>       storage device) so that all changed information can be retrieved
>>>       even if the  system  crashes  or  is rebooted.  This includes
>>>       writing through or flushing a disk cache if present.  The call
>>>       blocks until the device reports that the transfer has
>>>       completed.
>>>
>>>       As well as flushing the file data, fsync() also flushes the
>>>       metadata information associated with the file (see inode(7)).
>>> ....
>>>
>>> IOWs, fsync() on Linux is supposed to persist all data and
>>> metadata associated with the inode to stable storage such that it
>>> can be retreived after a crash or reboot. "metadata information"
>>> includes xattrs attached to the inode that is being fsync()d.
>>
>> Quoted from g/066:
>>
>> echo "hello world!" >> $SCRATCH_MNT/foobar
>> $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/foobar
>> $SETFATTR_PROG -x user.attr1 $SCRATCH_MNT/foobar
>> ln $SCRATCH_MNT/foobar $SCRATCH_MNT/foobar_link
>> touch $SCRATCH_MNT/qwerty
>> $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/qwerty
>>
>> IIUC, to match what Linux fsync() manual restricts, if we want to persist the
>> xattr removal, we should call fsync() on $SCRATCH_MNT/foobar after
>> "$SETFATTR_PROG -x user.attr1 $SCRATCH_MNT/foobar"? rather than calling fsync()
>> on unrelated $SCRATCH_MNT/qwerty.
> 
> It might look that way, but it's not that straight forward: there's
> a carefully constructed object dependency chain in this test that
> defines what the correct behaviour should be here.
> 
> What's the link count of $SCRATCH_MNT/foobar when
> $SCRATCH_MNT/qwerty is present after recovery? Is it 1 or 2?  Does
> $SCRATCH_MNT/foobar_link exist?  And if $SCRATCH_MNT/foobar_link
> exists, and the link count is 2. The test doesn't even look at these
> things, but if user.attr1 is not present, it means that foobar_link
> and qwerty are present, $SCRATCH_MNT has a link count of 5 and
> foobar has a link count of 2 because that's the dependency chain
> that leads to the user.attr1 removal being recovered correctly.
> 
> So what does SCRATCH_MNT actually contain when f2fs fails this test?

After f2fs recovery,

SCRATCH_MNT contains two files: foobar and qwerty, link count of both
files is 1, and foobar has two xattr entries: user.attr1 and user.attr3.

So it means, f2fs only recover file/directory which has been fsync()ed before
SPO... since f2fs doesn't support fs-op level transaction functionality, so it
have no way to persist all metadata updates in one transaction.

There is one alternative method to pass this case, as I suggested, we can
use "fastboot" mountoption for this case, so during last fsync on qwerty,
f2fs can trigger a checkpoint which will persist all metadata updates before
fsync()...

Thanks,

> 
> These depedencies exist because we can't just randomly re-order
> recovery of modifications to individual inodes and certain
> operations create atomic change dependencies between inodes. It's
> those atomic change dependencies that this test is actually
> exercising.  i.e. the link count changes tie directory modifications
> to inode modifications and this creates cross-object ordering
> dependencies down the line that fsync then exposes. That's what the
> second part of this test is actually exercising....
> 
> Cheers,
> 
> Dave.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

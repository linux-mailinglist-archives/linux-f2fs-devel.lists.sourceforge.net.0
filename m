Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D13F363B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Aug 2021 00:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mHCa7-0002M5-21; Fri, 20 Aug 2021 22:01:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mHCa3-0002Lj-O9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 22:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cio/BC3khLYu+2MnPCDomrbcsKOtKQTFncZR69BImCc=; b=hEGDc8+SKLqefCvCBvySEa+/Is
 t2iEW29kX7up4KkWFKYU5SkyA1P3p75DCjjH1YlYptWODrypXkFtP/qKU/amQ5dGhzX8cgCchz7VV
 hT/Z4eFXCLi3/kCE/fNcD59wRR92EyV6kFBe3FOfUzRW/VHPMGsdzsROKVOae/CS1hKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cio/BC3khLYu+2MnPCDomrbcsKOtKQTFncZR69BImCc=; b=C7MRtDPi7t7WlfUdGya3W2bo6z
 0IrXWHAA+BiFHdD+tmphh//ELEe+JOy8dgG+7Jk4yTAYX1u9SxkkXTpq+QQPtqt/T59HdAhXq05Dm
 lXKRu5jAW8pAyvyN7qkn51ID/o9uY3Oz/AzLzJPgyEYsPNxtTihsckVSr9NAdQPz7rGQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mHCa2-0000pm-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 22:01:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05D6260F39;
 Fri, 20 Aug 2021 22:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629496887;
 bh=6Tvf7F8XzySJVAbATDnQkPDRqPuOZ8gtDkb+RLf8JtE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=a+qXY05sok1kXn0ucTlvGUaXS0cVuG6RW8Rg8+OrzmUosd0h64U4VrkHM1eFmTUpy
 dOAL54ZWwyNRPd/6Jca3QOL7sFlUk/bYFhCR/LTpU1MF8QOSC121q8pnqQ4kT4IM8N
 bkXww1I/CT+6LSuFIpsT8/gCJC6nVGSeBxBB/dzUPUY8w35fWNu7XUfRwTbqyhA0ss
 heOKNv873m4IDcP43HGDZ3GK9vNJA/gEGKExVTlklWmeU4d4cf0klrZQ4r86tv7JW0
 AI5PT99NwcZYuuDGtyUDpZyG61xx1a/Wrtl51zW1LgA7GiXFbR0poVZK1WeCjfgOoG
 ckREQ7e93K7Ow==
To: Eric Biggers <ebiggers@kernel.org>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
 <c4e5c71d-1652-7174-fa36-674fab4e61df@kernel.org>
 <YR/wbenc0d3eMAjz@sol.localdomain>
From: Chao Yu <chao@kernel.org>
Message-ID: <c2d3a733-6caa-2bd8-ebe0-d26fe5132d16@kernel.org>
Date: Sat, 21 Aug 2021 06:01:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YR/wbenc0d3eMAjz@sol.localdomain>
Content-Language: en-US
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mHCa2-0000pm-Fb
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/21 2:11, Eric Biggers wrote:
> On Fri, Aug 20, 2021 at 05:35:21PM +0800, Chao Yu wrote:
>>>>>>
>>>>>> Hmm, I'm still trying to deal with this as a corner case where the writes
>>>>>> haven't completed due to an error. How about keeping the preallocated block
>>>>>> offsets and releasing them if we get an error? Do we need to handle EIO right?
>>>>>
>>>>> What about the case that CP + SPO following DIO preallocation? User will
>>>>> encounter uninitialized block after recovery.
>>>>
>>>> I think buffered writes as a workaround can expose the last unwritten block as
>>>> well, if SPO happens right after block allocation. We may need to compromise
>>>> at certain level?
>>>>
>>>
>>> Freeing preallocated blocks on error would be better than nothing, although note
>>> that the preallocated blocks may have filled an arbitrary sequence of holes --
>>> so simply truncating past EOF would *not* be sufficient.
>>>
>>> But really filesystems need to be designed to never expose uninitialized data,
>>> even if I/O errors or a sudden power failure occurs.  It is unfortunate that
>>> f2fs apparently wasn't designed with that goal in mind.
>>>
>>> In any case, I don't think we can proceed with any other f2fs direct I/O
>>> improvements until this data leakage bug can be solved one way or another.  If
>>> my patch to remove support for allocating writes isn't acceptable and the
>>> desired solution is going to require some more invasive f2fs surgery, are you or
>>> Chao going to work on it?  I'm not sure there's much I can do here.
>>
>> I may have time to take look into the implementation as I proposed above, maybe
>> just enabling this in FSYNC_MODE_STRICT mode if user concerns unwritten data?
>> thoughts?
>>
> 
> What does this have to do with fsync?

Oops, maybe a separate option is more appropriate.

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

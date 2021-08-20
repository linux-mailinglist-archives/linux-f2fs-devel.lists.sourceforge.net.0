Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49F3F2946
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 11:35:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH0wJ-0003CK-8T; Fri, 20 Aug 2021 09:35:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mH0wG-0003CE-Kq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J/saZTcNscEfGGuxhy3iUsXxTdcUoaIDt/M6YVcvDH8=; b=KnlHLx5wtOg7KNQl+5DpXbdX3P
 jyLvkNH9vylg9xYCE7ztA7A/KIzWVTsjtgmlg7N20SKCXxVJiiGJop/aQCsusH2FVf00G2AOTlmLj
 C5ppe4XaP9UsfNgcfjz6a1WiYySADXmpzzC1wPtHXcE8zY1g9lxMBs4XoGuVlqdHkO54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J/saZTcNscEfGGuxhy3iUsXxTdcUoaIDt/M6YVcvDH8=; b=l4A4qKJF4yTRVM4RO1O6ymalWd
 o7d4DotsyKlP3YswKopH5J1I+gIWNcnFQjzhLHY2ZR7lBKNHRgCuO2LNpJMSxs0A+cFkHpm5oROmv
 bIFeJTdv2SkXxVTWyADJrC/jFl5ajTldyqZc1LIM4EZpwditDvg7/jK/uYw+Li6vu2Zk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH0w2-00CXUA-B6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:35:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04AD860ED5;
 Fri, 20 Aug 2021 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629452123;
 bh=wBrcxx/2SIRw6Sko2YlVtKQdiFRwlnbLVzaL4jAOvTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IhN5QQiy3x0pZAEnBpZC7W889BoW5A3lAnCz9DjjoES0mtXygKSAAsIjy5d/i6hJ+
 2D3vbN4KMfvngGNN21EewUgz4SPbQdb5fOftk0mnXQtUEhNpNUVsqwAvEaiBjpKmSo
 +Dqc3t7ws3uDegim5tfkTetoDnzgDCn4ac+HFQpQvvGDP9jO3FfRdvnhCIJNQyw63S
 4keI8FM8vdDmnRoRlfqxfUziZzqrCfDToYA457Ny9rGSvlB5YJyjB6K6Kpl6xJ9EUW
 HGdiovOUne2hdKM0ds8qKbABc01w1CDKgJavmb8Fxz5dloxkhKZs4T9jtEjdkXmwpk
 jg27wj2ZFa/Mw==
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <c4e5c71d-1652-7174-fa36-674fab4e61df@kernel.org>
Date: Fri, 20 Aug 2021 17:35:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRsY6dyHyaChkQ6n@gmail.com>
Content-Language: en-US
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/17 10:03, Eric Biggers wrote: > On Mon, Aug 02,
 2021 at 06:34:48PM -0700, Jaegeuk Kim wrote: >> On 08/03, Chao Yu wrote: >>>
 On 2021/8/3 2:23, Jaegeuk Kim wrote: >>>> On 08/02, Chao Yu wrote [...] 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mH0w2-00CXUA-B6
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
Cc: linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/17 10:03, Eric Biggers wrote:
> On Mon, Aug 02, 2021 at 06:34:48PM -0700, Jaegeuk Kim wrote:
>> On 08/03, Chao Yu wrote:
>>> On 2021/8/3 2:23, Jaegeuk Kim wrote:
>>>> On 08/02, Chao Yu wrote:
>>>>> On 2021/8/2 12:39, Eric Biggers wrote:
>>>>>> On Fri, Jul 30, 2021 at 10:46:16PM -0400, Theodore Ts'o wrote:
>>>>>>> On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
>>>>>>>>> Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
>>>>>>>>> they require preallocating blocks, but f2fs doesn't support unwritten
>>>>>>>>> blocks and therefore has to preallocate the blocks as regular blocks.
>>>>>>>>> f2fs has no way to reliably roll back such preallocations, so as a
>>>>>>>>> result, f2fs will leak uninitialized blocks to users if a DIO write
>>>>>>>>> doesn't fully complete.
>>>>>>>
>>>>>>> There's another way of solving this problem which doesn't require
>>>>>>> supporting unwritten blocks.  What a file system *could* do is to
>>>>>>> allocate the blocks, but *not* update the on-disk data structures ---
>>>>>>> so the allocation happens in memory only, so you know that the
>>>>>>> physical blocks won't get used for another files, and then issue the
>>>>>>> data block writes.  On the block I/O completion, trigger a workqueue
>>>>>>> function which updates the on-disk metadata to assign physical blocks
>>>>>>> to the inode.
>>>>>>>
>>>>>>> That way if you crash before the data I/O has a chance to complete,
>>>>>>> the on-disk logical block -> physical block map hasn't been updated
>>>>>>> yet, and so you don't need to worry about leaking uninitialized blocks.
>>>>>
>>>>> Thanks for your suggestion, I think it makes sense.
>>>>>
>>>>>>>
>>>>>>> Cheers,
>>>>>>>
>>>>>>> 					- Ted
>>>>>>
>>>>>> Jaegeuk and Chao, any idea how feasible it would be for f2fs to do this?
>>>>>
>>>>> Firstly, let's notice that below metadata will be touched during DIO
>>>>> preallocation flow:
>>>>> - log header
>>>>> - sit bitmap/count
>>>>> - free seg/sec bitmap/count
>>>>> - dirty seg/sec bitmap/count
>>>>>
>>>>> And there is one case we need to concern about is: checkpoint() can be
>>>>> triggered randomly in between dio_preallocate() and dio_end_io(), we should
>>>>> not persist any DIO preallocation related metadata during checkpoint(),
>>>>> otherwise, sudden power-cut after the checkpoint will corrupt filesytem.
>>>>>
>>>>> So it needs to well separate two kinds of metadata update:
>>>>> a) belong to dio preallocation
>>>>> b) the left one
>>>>>
>>>>> After that, it will simply checkpoint() flow to just flush metadata b), for
>>>>> other flow, like GC, data/node allocation, it needs to query/update metadata
>>>>> after we combine metadata a) and b).
>>>>>
>>>>> In addition, there is an existing in-memory log header framework in f2fs,
>>>>> based on this fwk, it's very easy for us to add a new in-memory log header
>>>>> for DIO preallocation.
>>>>>
>>>>> So it seems feasible for me until now...
>>>>>
>>>>> Jaegeuk, any other concerns about the implementation details?
>>>>
>>>> Hmm, I'm still trying to deal with this as a corner case where the writes
>>>> haven't completed due to an error. How about keeping the preallocated block
>>>> offsets and releasing them if we get an error? Do we need to handle EIO right?
>>>
>>> What about the case that CP + SPO following DIO preallocation? User will
>>> encounter uninitialized block after recovery.
>>
>> I think buffered writes as a workaround can expose the last unwritten block as
>> well, if SPO happens right after block allocation. We may need to compromise
>> at certain level?
>>
> 
> Freeing preallocated blocks on error would be better than nothing, although note
> that the preallocated blocks may have filled an arbitrary sequence of holes --
> so simply truncating past EOF would *not* be sufficient.
> 
> But really filesystems need to be designed to never expose uninitialized data,
> even if I/O errors or a sudden power failure occurs.  It is unfortunate that
> f2fs apparently wasn't designed with that goal in mind.
> 
> In any case, I don't think we can proceed with any other f2fs direct I/O
> improvements until this data leakage bug can be solved one way or another.  If
> my patch to remove support for allocating writes isn't acceptable and the
> desired solution is going to require some more invasive f2fs surgery, are you or
> Chao going to work on it?  I'm not sure there's much I can do here.

I may have time to take look into the implementation as I proposed above, maybe
just enabling this in FSYNC_MODE_STRICT mode if user concerns unwritten data?
thoughts?

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

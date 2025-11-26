Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE526C87FFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 04:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3rSq255/tHNat1P8EOLcGmLtDKwpzr7o6sMUjVZFTc=; b=TfHVp3Tcv5ojXI8oy8r6M7IQDE
	jk3syU6hlaeRO0BHEnMXw51qB3WoVXqKl4h4qP+9qUMiTyCTpJwq/yl63TqnzoeiWfUxA7B3jPqYd
	D8EpWAzhwhAwhh2DK6EL7RZ6qERpP0JGTr4akhXtWGkvO6PyMkyB5jSS5ps7nTEOZ1s4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO6fz-00010C-I2;
	Wed, 26 Nov 2025 03:58:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vO6fx-000104-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 03:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9e365EuQIdGF1Cb/P5/9j5ZadllQzJDOup6lONlHq0=; b=Q4V7M8kgJwObpblhg1vRJb2eXl
 lY/LUEK3b/Hh0kjeu9DipnVbX805P0hfpYIlsmKKu6AtCe5GUMEIWcCyrRh7qH20RPUfA9JpNpo6D
 V9+gyxYgDXdsn3B/bkgTY+jLyGEIu9DwbC4rAIj6WNPgoB9J32m4id2DiHc0ZCxBRkOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J9e365EuQIdGF1Cb/P5/9j5ZadllQzJDOup6lONlHq0=; b=KQjAuCiPQOdznfO42/pwJtsf3t
 oII0/XaywhjUZbA/9O2bN0ErqWeBNN38rGFnrSfsEl6/er27CkiZUTA0pRenkrRam3zQ6Ony1HkTN
 P2JdSZG323aLacXDnEzckhzAsPAweLZPiiDfUCAnpvWdizwUu0UwEV7jDGGZgozezKyc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vO6fx-0000Di-4p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 03:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB9CF41966;
 Wed, 26 Nov 2025 03:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09B0C113D0;
 Wed, 26 Nov 2025 03:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764129515;
 bh=KdLpd3BCuvaHXYnuSJAbmb1GBZZRwfUT2tS8l4PNC9s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EI/8poQlKmZbCCoEeSJA01JZSZicswrBMCQ89iVxK+isXC/HcIMwn6Q1zvZv/jngg
 Q9Usm8mf3V6RejWap0iav0EnrhYkC1NXND2m5cMEdSxUMndC5Ka78RidgwO5Mt2P4L
 DTVLhROyox1pkRb5RDF/z6dQkoEq341p2F8d0zJxWlJYkBkMMknFQrce2Zy76Ptn9E
 688f3CQxKN47semLWexiSKvInNtg9CQ4HA/vvwumRco7RjXp9lt5p8AlNCKswctOYq
 t6g/Nbg5iYAJrVN29ePmnyKMCBQpV2L7mzZp5WREnyFEj/E4RGtxkac3Tqbqy9gpEA
 BYOQQntNmr40A==
Message-ID: <9079ffb8-3b66-415f-bb2a-4d3f79dc9cb4@kernel.org>
Date: Wed, 26 Nov 2025 11:58:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
 <09e48eba-6f00-455a-8299-8b8bb4122c7e@kernel.org>
 <820ffbc8-56cb-4f47-9112-2f4a79524025@nvidia.com>
Content-Language: en-US
In-Reply-To: <820ffbc8-56cb-4f47-9112-2f4a79524025@nvidia.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/26/25 11:37, Chaitanya Kulkarni wrote: > On 11/25/25
 18:47, Chao Yu wrote: >> On 11/25/25 07:48, Chaitanya Kulkarni wrote: >>>
 __blkdev_issue_discard() always returns 0, making the error assignm [...]
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vO6fx-0000Di-4p
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
Cc: "cem@kernel.org" <cem@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "agk@redhat.com" <agk@redhat.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "yukuai@fnnas.com" <yukuai@fnnas.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/26/25 11:37, Chaitanya Kulkarni wrote:
> On 11/25/25 18:47, Chao Yu wrote:
>> On 11/25/25 07:48, Chaitanya Kulkarni wrote:
>>> __blkdev_issue_discard() always returns 0, making the error assignment
>>> in __submit_discard_cmd() dead code.
>>>
>>> Initialize err to 0 and remove the error assignment from the
>>> __blkdev_issue_discard() call to err. Move fault injection code into
>>> already present if branch where err is set to -EIO.
>>>
>>> This preserves the fault injection behavior while removing dead error
>>> handling.
>>>
>>> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
>>> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
>>> ---
>>>   fs/f2fs/segment.c | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index b45eace879d7..22b736ec9c51 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>>   
>>>   		dc->di.len += len;
>>>   
>>> +		err = 0;
>>>   		if (time_to_inject(sbi, FAULT_DISCARD)) {
>>>   			err = -EIO;
>>> -		} else {
>>> -			err = __blkdev_issue_discard(bdev,
>>> -					SECTOR_FROM_BLOCK(start),
>>> -					SECTOR_FROM_BLOCK(len),
>>> -					GFP_NOFS, &bio);
>>> -		}
>>> -		if (err) {
>>>   			spin_lock_irqsave(&dc->lock, flags);
>>>   			if (dc->state == D_PARTIAL)
>>>   				dc->state = D_SUBMIT;
>>> @@ -1360,6 +1354,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>>   			break;
>>>   		}
>>>   
>>> +		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
>>> +				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);
>> Oh, wait, bio can be NULL? Then below f2fs_bug_on() will trigger panic or warning.
>>
>> Thanks,
> 
> That will happen without this patch also or not ?
> 
> Since __blkdev_issue_discard() is always returning 0 irrespective of bio
> is null or not.
> 
> The following condition in original code will only execute when err is set to
> -EIO and that will only happen when time_to_inject() -> true.
> Original call to __blkdev_issue_discard() without this patch will always
> return 0 even for bio == NULL after __blkdev_issue_discard().
> 
> This is what we are trying to fix so caller should not rely on
> __blkdev_issue_discard() return value  :-
> 
> 354                 if (err) {
> 1355                         spin_lock_irqsave(&dc->lock, flags);
> 1356                         if (dc->state == D_PARTIAL)
> 1357                                 dc->state = D_SUBMIT;
> 1358                         spin_unlock_irqrestore(&dc->lock, flags);
> 1359
> 1360                         break;
> 1361                 }
> 
> which will lead f2fs_bug_on() for bio == NULL even without this patch.
> 
> This patch is not changing exiting behavior, correct me if I'm wrong.

Yes, I think you're right, thanks for the explanation.

So it's fine to leave this cleanup patch as it is, and let's fix this bug in
a separated patch.

Thanks,

> 
> 
>>
>>>   		f2fs_bug_on(sbi, !bio);
>>>   
>>>   		/*
> 
> -ck
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

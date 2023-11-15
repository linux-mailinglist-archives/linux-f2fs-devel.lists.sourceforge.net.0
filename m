Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FA7EBD13
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 07:29:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r39Om-0004Ve-4h;
	Wed, 15 Nov 2023 06:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r39Ok-0004VY-Kh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 06:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jf/B5Oc/WzvvUdFmnUBFud6eMGY4eARI7RldZTjwxOg=; b=FWpM+7TPskhuNZ0f0tJvM2rAMI
 UCatBDJGHYer2vAwtYkWscW6Ca1RvJroIZ3DJjHC9QiiTKQkYRuvvq9afvS9Q5uah80OyyKO6S8Qm
 CMRB3CzTLZQHiNB9jadVCuoaLaovMVSmvkn3LhoS1wiKXDcPcvkJAqG6PWx4X/daXYaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jf/B5Oc/WzvvUdFmnUBFud6eMGY4eARI7RldZTjwxOg=; b=j0EYizCbn/1GjODzjt6EpuA9eT
 jUXm5Tfm4tYXi+CNQ0wUtaE/Fv+eO7MIx0fl8DtASxbm52fLv9CzPAvNpVKQHL9n+L+VdED39MDGH
 3IqO5CbrhTBTZ4wHt+beM7uGt5XNnENkQR0ogNNFttRefWrU3vb3Nn2OFy9j6P5PdbY4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r39Og-006AcF-6A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 06:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92D74614BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Nov 2023 06:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0F8C433C7;
 Wed, 15 Nov 2023 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700029741;
 bh=L8aS70wCeZHXd9bSYTpdvYQwgG0Gn4rLS8gBbZvlwHY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BrdbpUmo27fDVhHtmSsHprxs9HvkdzIYcfuhcpJ0Ab63OtZ+7RLbCS/zTCqwT8phM
 ijNqjG7lzVSgmePPnk6eoerp5tCWJRNoCIk/q9gXPeFAoV04nxFkc61lmQLYcTXsse
 qKr3tB8bSIEEL49kQC/xHLIAjOUMc2dxD+yOnNBI5JyJUlFa1SC25mgXQgv8Ndd08X
 yxSkolJujqdwQEOfMx5ZV5bamvDrE0gR8y4EZbZ8z0ZC59e9iRZEew3rNlVPCYSgBP
 xFN5MpMoQK4v4I0q+XRnPH4VOqf0YFP54FfVZONyuQ3/h83zmZmdpej4N31vDBNL0n
 fT99yXCMww4eA==
Message-ID: <236866a2-41b0-2ad0-db77-4c377367c80e@kernel.org>
Date: Wed, 15 Nov 2023 14:28:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231114212414.3498074-1-jaegeuk@kernel.org>
 <4a0e1c6f-12c4-f3dd-bb26-4bf0aee6be4b@kernel.org>
 <ZVQwz5ubx9LojzEf@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZVQwz5ubx9LojzEf@google.com>
X-Spam-Score: -8.9 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/15 10:45, Jaegeuk Kim wrote: > On 11/15, Chao Yu
 wrote: >> On 2023/11/15 5:24, Jaegeuk Kim wrote: >>> When recovering zoned
 UFS, sometimes we add the same zone to discard multiple >>> times [...] 
 Content analysis details:   (-8.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r39Og-006AcF-6A
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip adding a discard command if exists
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/15 10:45, Jaegeuk Kim wrote:
> On 11/15, Chao Yu wrote:
>> On 2023/11/15 5:24, Jaegeuk Kim wrote:
>>> When recovering zoned UFS, sometimes we add the same zone to discard multiple
>>> times. Simple workaround is to bypass adding it.
>>
>> What about skipping f2fs_bug_on() just for zoned UFS case? so that the check
>> condition can still be used for non-zoned UFS case.
> 
> Hmm, I've never seen this bug_on before, but even this really happens, it does

I've never seen it was been triggered as well.

> not make sense to move forward to create duplicate commands resulting in a loop.

Agreed.

It looks those codes were copied from extent_cache code base, do we need to fix
all cases to avoid loop?

> 
> So, the question is, do we really need to check this? Have we hit this before?
Not sure, just be worry about that flaw of newly developed feature can make
code run into that branch.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/segment.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 727d016318f9..f4ffd64b44b2 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -1380,7 +1380,8 @@ static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
>>>    			p = &(*p)->rb_right;
>>>    			leftmost = false;
>>>    		} else {
>>> -			f2fs_bug_on(sbi, 1);
>>> +			/* Let's skip to add, if exists */
>>> +			return;
>>>    		}
>>>    	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

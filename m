Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 738616EB91D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Apr 2023 14:16:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqCA5-0003V4-DH;
	Sat, 22 Apr 2023 12:16:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pqC9g-0003Uk-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 12:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1xV7K0JcqGsEJRfJHhRSeCCRiw+/GRAKE/VetfC6lvw=; b=mpAXnXj/4/y+PZ3PRv0bu67c7s
 52FV0lGJeaDkEpsdWDsC74m/sajQ2RBDz7Fj9pU/tgrP1Wx36mqs8n7++duST0KTopDxtQKUWwcWO
 Kgq9cIEvWy+yi9auaZG4WEO7W8iNN+O6/5L4PIt14fgVkhr4oq42QFLRTqn2M/CPFSDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1xV7K0JcqGsEJRfJHhRSeCCRiw+/GRAKE/VetfC6lvw=; b=ZBnNNu96oIszQQSu3hv+yyHPE4
 wts7piXM8ie1o50ol++pgJjf57n/sMRYVWl0AMgBH+DOa7S1jLvtjZddiMki5gHahlbAOaSvg6D09
 dBhbh9p4plu90XvJiQz82ugBK2IlOC36UJBq2f8Tl9lN/kWJuyDrUsTj0xMxD5Q0psEc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqC9O-0005D2-Sj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 12:15:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB05060A55;
 Sat, 22 Apr 2023 12:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB8AC433EF;
 Sat, 22 Apr 2023 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682165724;
 bh=dLzgToQ+97zNNFKyQ4T4DaBcoPkeYRwGP3sxxYoPM9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eldrpYS8vH7GeFYeEKT4IhBo9fFMy7vhetIHJvkjuyjRUb365ddyzEQsRkdD7HYWM
 Rko3d3jdLDvUNvOm8zTGkAlRwiw1QsmBVMD0DJaJcPo8XD8iYvUUhkjiX+7ewPkKMY
 y1Sm1eznUkLbw42qZOSsLyke9JjMbuGA2wb8dU8dziT/cnU5znOTp5qE2hiKLOGq6K
 hvIofEQGg00LGGvOA46Odk+jy+LG0Q3NfwH4O2nXj520h9HCC9KBNcmdohYY5LvVDL
 VZqNhey9RMG1yiOoGcYHfR5BAml+cHwHpNRmHszlbATz2dPZyRmrZb9FJUJAcUKYAf
 mGKATj5TgiRww==
Message-ID: <84f8a1d4-a0c6-c618-b3e0-4d0f4d4d5a8d@kernel.org>
Date: Sat, 22 Apr 2023 20:15:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230418060954.67585-1-hanqi@vivo.com>
 <b031f528-f3dd-44ed-5370-2133a74f9332@kernel.org>
 <ZELiCve2x31uJFhM@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZELiCve2x31uJFhM@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/22 3:20, Jaegeuk Kim wrote: > On 04/21, Chao Yu
 wrote: >> On 2023/4/18 14:09, Qi Han wrote: >>> This comment make no sense
 and is in the wrong place, so let's >>> remove it. >>> >>> Signed-o [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqC9O-0005D2-Sj
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnessary comment in
 __may_age_extent_tree
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/22 3:20, Jaegeuk Kim wrote:
> On 04/21, Chao Yu wrote:
>> On 2023/4/18 14:09, Qi Han wrote:
>>> This comment make no sense and is in the wrong place, so let's
>>> remove it.
>>>
>>> Signed-off-by: Qi Han <hanqi@vivo.com>
>>> ---
>>>    fs/f2fs/extent_cache.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index 28b12553f2b3..1f6d7de35794 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -86,7 +86,6 @@ static bool __may_age_extent_tree(struct inode *inode)
>>>    	if (!test_opt(sbi, AGE_EXTENT_CACHE))
>>>    		return false;
>>> -	/* don't cache block age info for cold file */
>>>    	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
>>>    		return false;
>>
>> Should move it here instead of removal?
>>
>> /* don't cache block age info for cold file */
> 
> Not worth to comment this, as the code is exactly saying that.

Correct.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>>>    	if (file_is_cold(inode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

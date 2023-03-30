Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79376D0678
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 15:23:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phsFl-0004PA-Ij;
	Thu, 30 Mar 2023 13:23:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1phsFj-0004P4-Ed
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 13:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fpowGIyOr06G7lShAXV+DdDEKFb0YrTgamyl50PUN6E=; b=CONR/vZKxZfgBowAF1jMLeo8Yb
 +t164cTie5CFKw/lNYQSzq3HCFLsbVcYbD7Kru1OwKac7zLQkR+tozKG2V2lkkua9wxcPLEA2iNqP
 kGUcY9ZGm3nMmIQPpwYn/A/tLvi0k2zn9cPjPlJgszbY3vOYfjK57mAmoaxDe/UMj8XY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fpowGIyOr06G7lShAXV+DdDEKFb0YrTgamyl50PUN6E=; b=eXMmsWJURkgUNWD0zs7q1SBim8
 EdpekRCmwFdEfpwpahkP63MnnWLzbfTkJEo1xszDw9Qx3xGUrR9RD4r3afap1EVIIiDquJF8GmjFr
 bmuVIe8pwPiIQ/awV1asSnwtzMQiZZQ4kQ4j+cfcxzNgbVL+mXjQS/X71XEjK5+rw26E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phsFf-009jHf-H8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 13:23:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 256A86207B;
 Thu, 30 Mar 2023 13:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2B7C433EF;
 Thu, 30 Mar 2023 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680182613;
 bh=TGIs6JDAlrKBTqIgEGbRkwj7I9yX6LExss8MV4sE0Dg=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=IhqSs3U9BRjzWl3cNjUqNg+tMH+PCRo4kJPCn0mYm9obGiqp9QNaMGPxZPhu8EK+E
 ErL1Q3dpywuho9ewjW56W2vraeeWKdpVnjoO5MNXmeUQKiLMPDPpe/bJNJlGv7iHBC
 5IbgN0DvPBoRAZ1YVBPW4gnwx0XFVqhGr/JVVijT7CkcU8pdmAVpOI5GtvXBdB8ghH
 QsH3E5R6YI/At+Bf5xh7WLsASsULlGpvbDtfXweCPLPoHTkaSCZSgR2mDVRx8Oh9vZ
 CUh9grxANKApX5wybxAhTq0Ht4iFTNpQP9x+qLn7ZKkaIAolwOgEqCgyPb8Hg93sgx
 o4FUTelOSKQsA==
Message-ID: <44470d45-32c2-d07f-108e-5cb709ffcdfc@kernel.org>
Date: Thu, 30 Mar 2023 21:23:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230323213919.1876157-1-jaegeuk@kernel.org>
 <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
 <ZCG2mfviZfY1dqb4@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCG2mfviZfY1dqb4@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/27 23:30, Jaegeuk Kim wrote: > On 03/26, Chao Yu
 wrote: >> On 2023/3/24 5:39,
 Jaegeuk Kim wrote: >>> https://bugzilla.kernel.org/show_bug.cgi?id=216050
 >>> >>> Somehow we're getting a page w [...] 
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
X-Headers-End: 1phsFf-009jHf-H8
Subject: Re: [f2fs-dev] [PATCH] f2fs: get out of a repeat loop when getting
 a locked data page
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
Cc: willy@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/3/27 23:30, Jaegeuk Kim wrote:
> On 03/26, Chao Yu wrote:
>> On 2023/3/24 5:39, Jaegeuk Kim wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216050
>>>
>>> Somehow we're getting a page which has a different mapping.
>>> Let's avoid the infinite loop.
>>>
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/data.c | 8 ++------
>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index bf51e6e4eb64..80702c93e885 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>>>    {
>>>    	struct address_space *mapping = inode->i_mapping;
>>>    	struct page *page;
>>> -repeat:
>>> +
>>>    	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
>>>    	if (IS_ERR(page))
>>>    		return page;
>>>    	/* wait for read completion */
>>>    	lock_page(page);
>>> -	if (unlikely(page->mapping != mapping)) {
>>
>> How about using such logic only for move_data_page() to limit affect for
>> other paths?
> 
> Why move_data_page() only? If this happens, we'll fall into a loop in anywhere?

Actually, we only suffer dead loop from foreground GC path, right? I suspect the
bug was triggered in this path only.

It looks there are a lot of cases in where we repeat triggering read once
two mappings are mismatched, e.g.
- __get_meta_page
- __get_node_page
- f2fs_write_begin
- f2fs_quota_read

Thanks,

> 
>>
>> Jaegeuk, any thoughts about why mapping is mismatch in between page's one and
>> inode->i_mapping?
> 
>>
>> After several times code review, I didn't get any clue about why f2fs always
>> get the different mapping in a loop.
> 
> I couldn't find the path to happen this. So weird. Please check the history in the
> bug.
> 
>>
>> Maybe we can loop MM guys to check whether below folio_file_page() may return
>> page which has different mapping?
> 
> Matthew may have some idea on this?
> 
>>
>> struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
>> 		int fgp_flags, gfp_t gfp)
>> {
>> 	struct folio *folio;
>>
>> 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
>> 	if (IS_ERR(folio))
>> 		return NULL;
>> 	return folio_file_page(folio, index);
>> }
>>
>> Thanks,
>>
>>> -		f2fs_put_page(page, 1);
>>> -		goto repeat;
>>> -	}
>>> -	if (unlikely(!PageUptodate(page))) {
>>> +	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
>>>    		f2fs_put_page(page, 1);
>>>    		return ERR_PTR(-EIO);
>>>    	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

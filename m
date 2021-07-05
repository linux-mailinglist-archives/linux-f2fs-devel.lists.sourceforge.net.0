Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434E3BBC3E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 13:34:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0MrM-0006F4-DX; Mon, 05 Jul 2021 11:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m0MrL-0006EW-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 11:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hk4F9rD9liSIix3sF7kQK9xmL4hfNgiHkvimMQZxOHo=; b=YRkLdQ57g8aKRnnB56bwKAStqO
 BL+iZzMsWYjnruKvrQ69CsvX6Y5EcawdElgfkNI5VrKCQzOryBa+RRFT2tGLdb9jaYRUl2/mPVfcY
 EkDGC3PbZmEJCPt1Ely06DwnfUV9f15kiA8E6xOtYU6q94JR1YdApmJY7pHf8+yhe4Xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hk4F9rD9liSIix3sF7kQK9xmL4hfNgiHkvimMQZxOHo=; b=FsbDFfZ6ePwULmH88N5QHdvWe0
 pSnbuBN86NJaY20j8DskyUpxaqOHJcWahFOoEpO1nQ1MJXF/CCwV9w12Fqx5Qr93NFDsZHV6drdn9
 E9jbcDco3KY1li55d/uden67BqfS3Iff5vsB4nC94LnkFInPQDNYw0MG076HeBYBLobs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0MrD-0001pc-PS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 11:33:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5033961279;
 Mon,  5 Jul 2021 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625484818;
 bh=JCzbfrOBLEoTbgD6Ln3Es2DOUH5lhf543Bz5pCxk8ng=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jLGcleRG3bHdycKc+f5w7I/cPQkXKECKrOn7KDf8dDQ1lXJuG9XxiGqEHg8XBuMXg
 XvjlTmPRS0d5XLk0/f2+kJMvK/ouPg7pqdfEmi5UNknyoTYX+lvHt/99vhRR2BaYfw
 1GlmthWgxTVg62ebKiNrGiWh1MyO2sgMlZK50A8SbJEZPCVwPpFBWULOL+pVBd1QkE
 oKpGaCeL5OslaTC/rG3tRjGeCkMUyW8bExim71Pn6AXzahNuxesqY2CuwYx17Dqgwa
 Mpa4ryg3MYK6wABc99I2wu2ZYiL8oSjds8azi7O/pKnIdpyH+rY+XnTUEvkCgrEAY9
 Prsqfvqf4PRIg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
Date: Mon, 5 Jul 2021 19:33:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOLJW0IgCagMk2tF@google.com>
Content-Language: en-US
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0MrD-0001pc-PS
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize page->private when using
 for our internal use
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/5 16:56, Jaegeuk Kim wrote:
> On 07/05, Chao Yu wrote:
>> On 2021/7/5 13:22, Jaegeuk Kim wrote:
>>> We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
>>> operations.
>>
>> Oops, I didn't get the point, shouldn't .private be zero after page was
>> just allocated by filesystem? What's the case we will encounter stall
>> private data left in page?
> 
> I'm seeing f2fs_migrate_page() has the newpage with some value without Private
> flag. That causes a kernel panic later due to wrong private flag used in f2fs.

I'm not familiar with that part of codes, so Cc mm mailing list for help.

My question is newpage in .migrate_page() may contain non-zero value in .private
field but w/o setting PagePrivate flag, is it a normal case?

Thanks,

> 
>>
>> Cc Matthew Wilcox.
>>
>> Thanks,
>>
>>>
>>> Fixes: b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/data.c | 2 ++
>>>    fs/f2fs/f2fs.h | 5 ++++-
>>>    2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 3a01a1b50104..d2cf48c5a2e4 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3819,6 +3819,8 @@ int f2fs_migrate_page(struct address_space *mapping,
>>>    		get_page(newpage);
>>>    	}
>>> +	/* guarantee to start from no stale private field */
>>> +	set_page_private(newpage, 0);
>>>    	if (PagePrivate(page)) {
>>>    		set_page_private(newpage, page_private(page));
>>>    		SetPagePrivate(newpage);
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 65befc68d88e..ee8eb33e2c25 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -1331,7 +1331,8 @@ enum {
>>>    #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
>>>    static inline bool page_private_##name(struct page *page) \
>>>    { \
>>> -	return test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
>>> +	return PagePrivate(page) && \
>>> +		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
>>>    		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>>    }
>>> @@ -1341,6 +1342,7 @@ static inline void set_page_private_##name(struct page *page) \
>>>    	if (!PagePrivate(page)) { \
>>>    		get_page(page); \
>>>    		SetPagePrivate(page); \
>>> +		set_page_private(page, 0); \
>>>    	} \
>>>    	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>>>    	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>> @@ -1392,6 +1394,7 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
>>>    	if (!PagePrivate(page)) {
>>>    		get_page(page);
>>>    		SetPagePrivate(page);
>>> +		set_page_private(page, 0);
>>>    	}
>>>    	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
>>>    	page_private(page) |= data << PAGE_PRIVATE_MAX;
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

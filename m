Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7F6DD5B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 10:37:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm9V7-0000tQ-9q;
	Tue, 11 Apr 2023 08:37:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pm9V6-0000tK-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55GHC0W6WwYl1hL4fXaluEU5ovMdkhFgXOcwCrD1FTg=; b=l5C6KPc0I5zVHYtg5lHBn7irAu
 POZ6I62mTIxnWf6iRLEhNhbsyrcp5xp0O4pNdHHaLdjl5DFhN54trpr1E2kusQdCQJoVz40dB72Ey
 apR8RD9o+nT/pY8bmcjUnEA8ShC+2xkPVswcQtzeXJqStJByysevqp2b2mxZRHZvJ/8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55GHC0W6WwYl1hL4fXaluEU5ovMdkhFgXOcwCrD1FTg=; b=ZSdPn0aUOeicCAhK3FWuW8HvMX
 Bg3FwjExaZJv87Wp1iHuJZJbttTmtMuS4br4rKPzB+Kf3JtLGr8yPN5t+7bEviMYxdd8Kj6QR+P8d
 QryzaeSrCY46XATJzKf3HulFgNlqMRceX/kn/E++KKVYW4Q1Eu84XCvjqjvSl5moS0M8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm9V5-003saX-9g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:37:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4B2261E67
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 08:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8896DC433EF;
 Tue, 11 Apr 2023 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681202229;
 bh=wOKAV9W48PUCbJhAWm/aGptDEIS+77Kp1nJ77iUN0h8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BC5Z3xpJs3+8JSw+1JjCMvvigAq7cu/9pYu38TRi5o5+4I8Wv75Rt8GnQc/cA5bRh
 jTQWRE+iVhf9cG2mE6EnTkUD9iYw4TfeP0g/dl5jixsMs5uLC3/g0Lo0UAxdF4dYed
 S2gzhN23qrT2DTSR5dozsFzOsfFuGPFatR8H/WTydSHS9LE+sM32+v39r9STL8u09u
 CzkcqKQuUuuZU43kARD4mkEwzao1hiq8IeowyjxLmAAeoOOZqPp0BUIg2y/3U47UIG
 4rBOaNEbdI0lHcD28RBj173hNI/KEz0/YlJKON4FvR+XND7FAacLWvSotdx0ARXuA6
 yfiVIusZbOyng==
Message-ID: <05690b56-e7e2-14d5-7a56-00bcddc61c78@kernel.org>
Date: Tue, 11 Apr 2023 16:37:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230410022418.1843178-1-chao@kernel.org>
 <20230410022418.1843178-2-chao@kernel.org> <ZDRZrzROjW5z935R@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDRZrzROjW5z935R@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/11 2:47, Jaegeuk Kim wrote: > On 04/10, Chao Yu
 wrote: >> No logic changes. >> >> Signed-off-by: Chao Yu <chao@kernel.org>
 >> --- >> fs/f2fs/f2fs.h | 32 ++++++++ >> 1 [...] 
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
X-Headers-End: 1pm9V5-003saX-9g
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: clean up with {attach,
 detach}_page_private()
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

On 2023/4/11 2:47, Jaegeuk Kim wrote:
> On 04/10, Chao Yu wrote:
>> No logic changes.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h | 32 ++++++++------------------------
>>   1 file changed, 8 insertions(+), 24 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index ec8387da7f74..c378aedcadea 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1416,11 +1416,8 @@ static inline bool page_private_##name(struct page *page) \
>>   #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
>>   static inline void set_page_private_##name(struct page *page) \
>>   { \
>> -	if (!PagePrivate(page)) { \
>> -		get_page(page); \
>> -		SetPagePrivate(page); \
>> -		set_page_private(page, 0); \
>> -	} \
>> +	if (!PagePrivate(page)) \
>> +		attach_page_private(page, (void *)page->private); \
> 
> 		attach_page_private(page, (void *)0);

Correct, thanks for fixing this.

Thanks,

> 
>>   	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>>   	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>   }
>> @@ -1429,13 +1426,8 @@ static inline void set_page_private_##name(struct page *page) \
>>   static inline void clear_page_private_##name(struct page *page) \
>>   { \
>>   	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
>> -		set_page_private(page, 0); \
>> -		if (PagePrivate(page)) { \
>> -			ClearPagePrivate(page); \
>> -			put_page(page); \
>> -		}\
>> -	} \
>> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
>> +		detach_page_private(page); \
>>   }
>>   
>>   PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
>> @@ -1464,11 +1456,8 @@ static inline unsigned long get_page_private_data(struct page *page)
>>   
>>   static inline void set_page_private_data(struct page *page, unsigned long data)
>>   {
>> -	if (!PagePrivate(page)) {
>> -		get_page(page);
>> -		SetPagePrivate(page);
>> -		set_page_private(page, 0);
>> -	}
>> +	if (!PagePrivate(page))
>> +		attach_page_private(page, 0);
>>   	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
>>   	page_private(page) |= data << PAGE_PRIVATE_MAX;
>>   }
>> @@ -1476,13 +1465,8 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
>>   static inline void clear_page_private_data(struct page *page)
>>   {
>>   	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
>> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
>> -		set_page_private(page, 0);
>> -		if (PagePrivate(page)) {
>> -			ClearPagePrivate(page);
>> -			put_page(page);
>> -		}
>> -	}
>> +	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
>> +		detach_page_private(page);
>>   }
>>   
>>   /* For compression */
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

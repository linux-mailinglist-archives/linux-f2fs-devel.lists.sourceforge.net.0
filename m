Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBC27F52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:16:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToWC-0004Ai-Tz; Thu, 23 May 2019 14:16:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hToWB-0004Aa-7G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xwc+3lpDNDDBPeTz85VhiEOtKf5bA7Mbo/YYYkFA6sk=; b=fWWt/U1n9b/IPxQDDctXJhpkZ2
 71zYc3z55Y//D+LnmCe/LXGob/ep+laLYLT7BmMNxHj0tr+fBRb78EhWNcHYJcce2+FiXko2zt9qf
 vYLWtWVZaa0PooXRf499glxTaZO0ztDHZFQ40lY5OV+u5K0PApdXPhG/zo3M79EO54Ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xwc+3lpDNDDBPeTz85VhiEOtKf5bA7Mbo/YYYkFA6sk=; b=f0nx67OQ5SSY+iZw78sw4rdL0B
 lbFyBaW8l2m6lfqJ/5g4sveaDnKCVsUA6TFNIQuMXw32X7xESsJzNow1C/kBA8JUfI9iAEJGVTfx3
 SmrA1xW23uDwnBgLEDt+xQ6GZugjnFmlEERxbcodmW5jMlPHSgX3wGxAa8V+Z+eU6Tcs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToW9-002o9u-7k
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:16:27 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D191B20863;
 Thu, 23 May 2019 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558620979;
 bh=FMQd9rq+nJFSOo9NqMWDstN8Nyk6zhJJM2Fjd1HnTWY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iILCWyR1DCiP+XGgRShnvugwWvBMFITXePcsfULdQbULoHTacPN3bV+qYrDn1zlub
 ObYrXPCbv4qO1cAHxSwoeRlDHwnJbWigvD+b6+NrPGo5gdLWUosdZSA0d4e5oAWOXm
 Gl6EncHAjkaVlwNj95l/8JalYVwU4LY1JBBwW0/Q=
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190522194141.91216-1-jaegeuk@kernel.org>
 <86b041c4-301b-40b3-d293-ca5365c87600@kernel.org>
 <20190523140811.GB10954@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <98c0e013-1609-a0f1-03e3-fc7d77863c8e@kernel.org>
Date: Thu, 23 May 2019 22:16:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190523140811.GB10954@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hToW9-002o9u-7k
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: show elapsed time of full scan
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-23 22:08, Jaegeuk Kim wrote:
> On 05/23, Chao Yu wrote:
>> On 2019-5-23 3:41, Jaegeuk Kim wrote:
>>> This patch introduces the elapsed time of fsck.
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fsck/main.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fsck/main.c b/fsck/main.c
>>> index d844820..9aca024 100644
>>> --- a/fsck/main.c
>>> +++ b/fsck/main.c
>>> @@ -18,6 +18,7 @@
>>>  #include "fsck.h"
>>>  #include <libgen.h>
>>>  #include <ctype.h>
>>> +#include <time.h>
>>>  #include <getopt.h>
>>>  #include "quotaio.h"
>>>  
>>> @@ -745,6 +746,7 @@ int main(int argc, char **argv)
>>>  {
>>>  	struct f2fs_sb_info *sbi;
>>>  	int ret = 0;
>>> +	clock_t start = clock();
>>>  
>>>  	f2fs_init_configuration();
>>>  
>>> @@ -853,7 +855,7 @@ retry:
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>> -	printf("\nDone.\n");
>>> +	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
>>
>> Minor, as comment log says it's only for fsck.
> 
> I think it doesn't matter for other use cases, even though main reason was for
> fsck.

Okay, it's not a big deal. :)

Thanks,

> 
>>
>> if (c.func == FSCK)
>> 	printf();
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>> Thanks,
>>
>>>  	return 0;
>>>  
>>>  out_err:
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

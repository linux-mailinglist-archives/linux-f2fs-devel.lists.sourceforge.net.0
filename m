Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0F4C535
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 04:08:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdmUv-0002rY-K4; Thu, 20 Jun 2019 02:08:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdmUu-0002rS-US
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 02:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=efLTzqc2PGuTgErJPXaaAqAXaXw41wjfEXA/veIRmUE=; b=TYsTOyJvXCWZGwAxDTaTccftUn
 CEOPenPKaa6nAUO+5v0D9/nGJnWRa0Yzx1XoLNBtfOh8Qy4hLoACT9oUvGfLAXhMGsLwYfp8y0GhE
 LsoTFdm0OKh75Qhfpt/trrdUWNPCbdfbfA1xkc17rPHM3CqTbuOgzOF6mNu6hSu9f5DM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=efLTzqc2PGuTgErJPXaaAqAXaXw41wjfEXA/veIRmUE=; b=M51WnJqYTmZaLc1+mNuxZNAW3v
 3U9YF62slvcu6/dNQZ6MP4Rh0v//fOSM8bPrf5mLXPQ+f3oIhBHnBlZk6fsnbmH/k4H3kBWKqF+tu
 U0QD4QpONoFs3NBVYyU626qKOM72D+Hx7hxVedbrb4lOXIi8FWfy89h02PKVfpPgAlYM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdmUu-005tYE-CQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 02:08:21 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8826D9BAA7904E687A20;
 Thu, 20 Jun 2019 10:08:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 20 Jun
 2019 10:08:11 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Joe Perches <joe@perches.com>
References: <20190618094842.19332-1-yuchao0@huawei.com>
 <20190619180150.GC57884@jaegeuk-macbookpro.roam.corp.google.com>
 <bf8ad99f0f5d1cb5adde3eb6046a226c78930730.camel@perches.com>
 <20190619205232.GD57884@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <96d46153-8bf8-b152-2ae3-3ddeac0ba914@huawei.com>
Date: Thu, 20 Jun 2019 10:08:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190619205232.GD57884@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdmUu-005tYE-CQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce f2fs_<level> macros to wrap
 f2fs_printk()
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

On 2019/6/20 4:52, Jaegeuk Kim wrote:
> On 06/19, Joe Perches wrote:
>> On Wed, 2019-06-19 at 11:01 -0700, Jaegeuk Kim wrote:
>>> On 06/18, Chao Yu wrote:
>>>> From: Joe Perches <joe@perches.com>
>>>>
>>>> - Add and use f2fs_<level> macros
>>>> - Convert f2fs_msg to f2fs_printk
>>>> - Remove level from f2fs_printk and embed the level in the format
>>>> - Coalesce formats and align multi-line arguments
>>>> - Remove unnecessary duplicate extern f2fs_msg f2fs.h
>>>
>>> Can we just use sbi for f2fs_<level>?
>>
>> Not really.  see below:
> 
> Since sbi = F2FS_SB(sb), I don't see any problem.
> 
>>
>>> And, could you please change missing
>>> f2fs_msg() in the latest dev?
>>
>> Anyone is welcome to refresh the patch as necessary
>> or appropriate.
> 
> Could you please take a look at this?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=697743b1c1025483c97c740cd8834711be4294eb

Looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

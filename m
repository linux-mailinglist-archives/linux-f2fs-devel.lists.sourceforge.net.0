Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D211A9474
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOcfT-0000Pu-Ey; Wed, 15 Apr 2020 07:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOcfR-0000PT-63
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 07:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DseiJMvzr8BmRtZ280O4khRQ8+CmpZSjUdaXR8TO8Ak=; b=Pza3GEDCWsEGHydRh3AzGj0YHl
 jD+dDukb5OkH/8JeTz9Ie2q+09ZWcbPwdIv74EQ5hI5t8DpolMpcitfXNqCcjXqxxkfLN6n8/2EPZ
 daDp78yzEeaMC2VlOZDoSBy+MmZCvesPWQtlLIkmwAavE+y+AFdcVa174Gxh9rr6twYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DseiJMvzr8BmRtZ280O4khRQ8+CmpZSjUdaXR8TO8Ak=; b=ebwtJF8vffBRJ7GkY5aIEr+P7/
 liGLZQ87mKquVq4IU0TDi9IMKNc5+iuV4m0cPsLNNr1q3azzUQgRS8dFMjm2T+jcP6ckjdWWmAQ3b
 C5SumMWy3F00JyZZWTwGSXXhqeO3E8+JhFBv6Go7uZ3puHy6OqYozd/d2lget40kjR6s=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOcfL-00Fqqo-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 07:41:05 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EF9D0294396DEF9D0493
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Apr 2020 15:15:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 15:15:10 +0800
To: Tim Walker <timtwalker@outlook.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>
 <c81b3ef8-1266-829e-5276-a11e167810c7@huawei.com>
 <BN6PR02MB3379ACB0F0777D5D932EF641DEDB0@BN6PR02MB3379.namprd02.prod.outlook.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cf8dd5fb-17a8-f6a0-ad54-e70c50a8eff5@huawei.com>
Date: Wed, 15 Apr 2020 15:15:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <BN6PR02MB3379ACB0F0777D5D932EF641DEDB0@BN6PR02MB3379.namprd02.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jOcfL-00Fqqo-Ro
Subject: Re: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Tim,

On 2020/4/15 10:54, Tim Walker wrote:
>> Hi Chao Yu-
> 
> Yes the zones can have different status, according to the spec. I don't know how many drive manufactures use those zone states - if any. I was only asking to see if I had missed Offline or Read_Only zone support when I examined the f2fs source code. I was interested in the implementation details if support had been included. Thanks!

Unfortunately, that support on f2fs has not been done yet.

Thanks,

> 
> Best regards,
> -Tim Walker
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

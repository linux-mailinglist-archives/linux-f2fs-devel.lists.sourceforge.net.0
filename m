Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6131909E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 10:47:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGg9g-0005pG-WD; Tue, 24 Mar 2020 09:47:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGg9e-0005p8-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 09:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f32AZlamjk+67+t+gueAccd/35cJzVj3cWmujJ5LKWw=; b=CApDQYOeH3LrwS7EYBN2wBmSK9
 9MltC+Ob6HMT9lalR0kVb3xxLsKhSnSiwrysXbV1X0MxWV9EshWi727cuhHyBRXlML3jpRsgUjNJM
 XK4O6cn/r266xiGHqQHhGNjmXQ7iXT//YoK/jGkO5k/nhbTr43M3KW7MtagyJnVc7qkM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f32AZlamjk+67+t+gueAccd/35cJzVj3cWmujJ5LKWw=; b=X/1B6azypNaTF/I6Xy6x+hH3OY
 WqL404sKugdAXX2x/RUOnwLUx/5J4Qh2yM9wDr+5fGhaZUuIp3S3W2afIKntPwGpQ4dQATxsvnHbL
 UiWNj2cGCoZkwmbPgdKtQGxZU4wekj+ngs3lru9cOVIOqeXe2HlfoLLA7Y+zLdYX1hdo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGg9b-001om7-0H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 09:47:26 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 534E12E87DCB9A5B1249;
 Tue, 24 Mar 2020 17:47:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Mar
 2020 17:47:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1584506689-5041-1-git-send-email-stummala@codeaurora.org>
 <54ae330b-ac9b-7968-fa0a-95db6737e3ea@huawei.com>
Message-ID: <7804a289-ee55-930c-8b6a-52697d3db679@huawei.com>
Date: Tue, 24 Mar 2020 17:47:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <54ae330b-ac9b-7968-fa0a-95db6737e3ea@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGg9b-001om7-0H
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix long latency due to discard during
 umount
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/24 17:08, Chao Yu wrote:
> On 2020/3/18 12:44, Sahitya Tummala wrote:
>> F2FS already has a default timeout of 5 secs for discards that
>> can be issued during umount, but it can take more than the 5 sec
>> timeout if the underlying UFS device queue is already full and there
>> are no more available free tags to be used. In that case, submit_bio()
>> will wait for the already queued discard requests to complete to get
>> a free tag, which can potentially take way more than 5 sec.
>>
>> Fix this by submitting the discard requests with REQ_NOWAIT
>> flags during umount. This will return -EAGAIN for UFS queue/tag full
>> scenario without waiting in the context of submit_bio(). The FS can
>> then handle these requests by retrying again within the stipulated
>> discard timeout period to avoid long latencies.

BTW, I guess later we can add nowait logic as a sub policy of
discard_policy, then DPOLICY_BG would be more configurable with
this nowait policy support.

Thanks,

>>
>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

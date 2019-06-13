Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7983432FE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 08:52:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbJbU-0001bG-HC; Thu, 13 Jun 2019 06:52:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbJbT-0001b0-0o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqrWM95SVEX8WfFZG8lb0vRP0asLJ1yGTXzxQk5kXq0=; b=fTx2Os3WFObK4oJGuMTMjQ6UOZ
 q+afMrJMWXchRaXp1CgP7HO+VL73DvAZAYfxCW8F5X5LG2RXPu9lkv8P850XNOQYj60XqXp0lgMhq
 fvGg256FwrZwPOKYT5Ho2CGYbt2D6zQNF3iecRpvW1cDkflYGn8Mn09vLHlHiz6msfJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bqrWM95SVEX8WfFZG8lb0vRP0asLJ1yGTXzxQk5kXq0=; b=k9HcA52j1jH8+CXoAdfRMgWJ5l
 bnTR4tDRD92kwTega6j9O1wc2moI0HSzOXh4Z+U4t7GrcwnvKg0zQQK4IdFWU23UJ99MKlvUEiKnX
 vgvebJDL0jy+XB61z9YWtVMAvZrs5m7hbQ5Ah0/NeETYejkq+5djTDr8fIU15LP5H4HU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbJbR-00BBf7-71
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:52:55 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 752E458E9C515F587F46;
 Thu, 13 Jun 2019 14:52:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 13 Jun
 2019 14:52:44 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1559813893-23452-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d3b4b733-78ab-29bb-9441-c6e4e7efaea9@huawei.com>
Date: Thu, 13 Jun 2019 14:52:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1559813893-23452-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbJbR-00BBf7-71
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix is_idle() check for discard type
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

On 2019/6/6 17:38, Sahitya Tummala wrote:
> The discard thread should issue upto dpolicy->max_requests at once
> and wait for all those discard requests at once it reaches
> dpolicy->max_requests. It should then sleep for dpolicy->min_interval
> timeout before issuing the next batch of discard requests. But in the
> current code of is_idle(), it checks for dcc_info->queued_discard and
> aborts issuing the discard batch of max_requests. This
> dcc_info->queued_discard will be true always once one discard command
> is issued.
> 
> It is thus resulting into this type of discard request pattern -
> 
> - Issue discard request#1
> - is_idle() returns false, discard thread waits for request#1 and then
>   sleeps for min_interval 50ms.
> - Issue discard request#2
> - is_idle() returns false, discard thread waits for request#2 and then
>   sleeps for min_interval 50ms.
> - and so on for all other discard requests, assuming f2fs is idle w.r.t
>   other conditions.
> 
> With this fix, the pattern will look like this -
> 
> - Issue discard request#1
> - Issue discard request#2
>   and so on upto max_requests of 8
> - Issue discard request#8
> - wait for min_interval 50ms.
> 

Fixes: fef4129ec2e6 ("f2fs: fix to be aware discard/preflush/dio command in
is_idle()")

> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Ah, thanks for fixing this bug.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

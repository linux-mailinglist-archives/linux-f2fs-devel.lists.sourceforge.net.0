Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A14118043
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2019 07:18:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieYqe-0001NG-Tr; Tue, 10 Dec 2019 06:18:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ieYqc-0001Mv-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 06:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewCmx48tfNZ4w1QUg4r8ZttE8aD9JF5bydYfQaytbHc=; b=CU9ul4SmnArgmCjdK0HkEI/+Iw
 qxoY7egYHdY0mQ+Z6ySrN5rK/q6196yfX7R+CPQUHKSfHA4Pa1GUVP+mY80cayfxnwCQDQIFMgPAk
 WvA2Glb9bMNSdLP64VHTW1dXpA4MXSuWUHcDRZB7566OMwh2c3466dGYK4MGW3mP2paE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ewCmx48tfNZ4w1QUg4r8ZttE8aD9JF5bydYfQaytbHc=; b=Ls2psN57cvKHwxvuoAUv76Nu+v
 zYMTRgKREddoY7uoUaAcX1RQeExhbeHcndEmY27uXPVS0mYLSv3GQcIQwiIYeOKJsB3YC0LVnUzzr
 JncNDbggdBodwhQN8AO2WYvcOTDDG/pu07DtZDgfbeECGoANJ6uNyKjcOtUCzrlQ3xYU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieYqa-00G8bo-Br
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 06:18:14 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 19D4DBA2B8D8F9A920B2;
 Tue, 10 Dec 2019 14:18:05 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 10 Dec
 2019 14:18:00 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <0101016ed414fbce-f78f838a-bc2b-4ee7-88b1-88bc07e1e0f4-000000@us-west-2.amazonses.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <60cd9ef9-1323-da0d-a0db-5fdba52a0e1e@huawei.com>
Date: Tue, 10 Dec 2019 14:18:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0101016ed414fbce-f78f838a-bc2b-4ee7-88b1-88bc07e1e0f4-000000@us-west-2.amazonses.com>
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
X-Headers-End: 1ieYqa-00G8bo-Br
Subject: Re: [f2fs-dev] [PATCH] f2fs: cleanup duplicate stats for atomic
 files
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

On 2019/12/5 11:22, Sahitya Tummala wrote:
> Remove duplicate sbi->aw_cnt stats counter that tracks
> the number of atomic files currently opened (it also shows
> incorrect value sometimes). Use more reliable sbi->atomic_files
> to show in the stats.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

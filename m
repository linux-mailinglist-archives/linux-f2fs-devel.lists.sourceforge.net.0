Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 609353202B8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Feb 2021 02:56:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDHV9-000165-3J; Sat, 20 Feb 2021 01:56:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lDHV7-00015l-0r
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 01:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lcg+edKagijJH1ZFyQi9e1pxHbFZxBg71hxcscscSGE=; b=MWRwxf3KUdGu0tTzDDxWqvBdMO
 b9GDAnZuBs4iIFhmMUROcv9PMR9Y1hoSh8rOXNjh/JB9dxqiBjUI31aGrzhTjOv8kfKt3N5vxDrEt
 q9Pb1kJPgPDtIn6dZKFzDQsfzmpVLJZ635Thf7ORYpvvOQQR/eXlFNMliughNw3uUeNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lcg+edKagijJH1ZFyQi9e1pxHbFZxBg71hxcscscSGE=; b=g0gu+Qfvt/eOUn998jFTGW/6DQ
 0DkPZAgvV5DTmq381BpZZT8kBNWfrkev3zn6ez7gsoaZY5zy1pQECYnzabwKqYwQxg9DA9eXyldVG
 O28HmQoYAeq0TMSpNd+vWE6wu9kR5y2bMEpGVl0f/9ldIFVN9DZ/kUB36xRUPJP6MrMA=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDHUv-00Fzov-U0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 01:56:04 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DjBM75WFhz168v1;
 Sat, 20 Feb 2021 09:54:11 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 20 Feb
 2021 09:55:38 +0800
To: jiahao <jiahao243@gmail.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <jiahao@xiaomi.com>
References: <1613738792-14778-1-git-send-email-jiahao@xiaomi.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <371326f4-80dd-48c1-39f9-316774ab6950@huawei.com>
Date: Sat, 20 Feb 2021 09:55:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1613738792-14778-1-git-send-email-jiahao@xiaomi.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lDHUv-00Fzov-U0
Subject: Re: [f2fs-dev] [PATCH] f2fs/checkpoint: fix a spacing coding style
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

On 2021/2/19 20:46, jiahao wrote:
> Add a space before the plus.
> 
> Signed-off-by: jiahao <jiahao@xiaomi.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

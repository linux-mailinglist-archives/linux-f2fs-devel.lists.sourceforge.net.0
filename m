Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 915CD2D5591
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 09:41:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knHWO-0006oi-5m; Thu, 10 Dec 2020 08:41:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knHWL-0006o4-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RKl89joqE2fROaQmzJp2WAcQzdHKI/vgJ8cpm2mXd6s=; b=NjroIkA2fA7SdnUkcxZvkwQH9X
 Nn8ar+O2sznEm3mrXtxmJ7wwkpPnO5q3UEdB2/u3bvERfQkMh1C7ls7UD+MCTXGeYPk9M5oRuC5MR
 rCzTQ92zJriz4HxP3o0XEuxcP1ur/Zor9ba/q7rqoiGktf0JHe6Kosaln8xrVZYAF8jg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RKl89joqE2fROaQmzJp2WAcQzdHKI/vgJ8cpm2mXd6s=; b=VG13ue4TlYICq/7l+06NvR1oLL
 GqXLvJRb5NlwCwXN96BeBq+cuCMPZu09Dwvidj4fwzeLpSErSxLi6pesd7zhcKtEjSgUzmv2Av6yD
 zUU1OxSEILPaw4IyEFn6bg5zTmy8AE8yFO9IWg8rl6pUpFSdHPmQpGkqb3BGbRV9ibzE=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knHWD-008iDO-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:41:53 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cs6ng53qLzhpW3;
 Thu, 10 Dec 2020 16:40:55 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Dec
 2020 16:41:26 +0800
To: Robin Hsu <robinh3123@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20201208081555.652932-1-robinh3123@gmail.com>
 <20201208081555.652932-2-robinh3123@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <142ae8c7-bed7-2aec-35bb-afaf2a8ab59d@huawei.com>
Date: Thu, 10 Dec 2020 16:41:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201208081555.652932-2-robinh3123@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knHWD-008iDO-Hn
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs-tools: Added #ifdef WITH_func
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 16:15, Robin Hsu wrote:
> From: Robin Hsu <robinhsu@google.com>
> 
> Add proprocessor defines (options) 'WITH_func',
> where func = DUMP, DEFRAG, RESIZE, or SLOAD
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A923B1F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 02:57:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2lH6-0003XJ-BT; Tue, 04 Aug 2020 00:57:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2lH5-0003XB-6j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 00:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79/tnc5+DE/fSmIpQuMmXyyAVoNI9rLeSF+Ee728GOg=; b=djZYfM4a/Nhjs291sBGUqe8VhM
 zyNe2WpOw4Ew/Sx2DgBsEK0dU/kEO5x+HLLci+9DUPHhBK429R96HPfEhPNJBDVkxumXjAVvb2AbS
 1UowW6qFBiu5wqY2N0B7DdzfTsD80gdNMBEXnpuSD9Q8gdb97evj2rAcu4lua2Pr99x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79/tnc5+DE/fSmIpQuMmXyyAVoNI9rLeSF+Ee728GOg=; b=HUM8x3ndDN+ohstfdHAh/FYRM7
 yyI6FNzMxSxEFIxbBUNb0C1zv7s2PJ/gIs1RtdCSC+jsieFOYIgB9WM/jKRO4uIxAem2ifvclmYfd
 PzrBHmXWzDJsEdYjFFgUlMVHBuXCdE1vvNpsq66FRaBV7/4E4HSMVF9CS7uqgp8xoeYo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2lH4-008GfM-16
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 00:57:51 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 82BDEFE8FF83CD2F15D5;
 Tue,  4 Aug 2020 08:57:34 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 4 Aug 2020
 08:57:27 +0800
To: Zhihao Cheng <chengzhihao1@huawei.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <yi.zhang@huawei.com>
References: <20200801032450.3028986-1-chengzhihao1@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <213c79b1-39cc-1b22-f2d9-d6b5ee3dbdab@huawei.com>
Date: Tue, 4 Aug 2020 08:57:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200801032450.3028986-1-chengzhihao1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2lH4-008GfM-16
Subject: Re: [f2fs-dev] [PATCH] f2fs: update_sit_entry: Make the judgment
 condition of f2fs_bug_on more intuitive
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

On 2020/8/1 11:24, Zhihao Cheng wrote:
> Current judgment condition of f2fs_bug_on in function update_sit_entry():
>    new_vblocks >> (sizeof(unsigned short) << 3) ||
> 	new_vblocks > sbi->blocks_per_seg
> 
> which equivalents to:
>    new_vblocks < 0 || new_vblocks > sbi->blocks_per_seg
> 
> The latter is more intuitive.
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Reported-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

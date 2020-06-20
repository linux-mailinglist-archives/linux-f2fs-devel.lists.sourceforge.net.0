Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDF2022E6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2020 11:36:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmZv1-0003vQ-Ou; Sat, 20 Jun 2020 09:36:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jmZv0-0003v8-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 09:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eng+uBk+/FyGebzSx3rQo1ZBRZCqu0475kZf3TXIxmQ=; b=mmF6oKigFfSp+gg77GzJmzANHd
 rYfKouO8kgAsK2Aw2zLkx7o877ANJv/fncY1o41yrCtY3PJIqRy7x6W6F6AbBBaujqOiWArI+EKrn
 bbOz5X6phWnb5C718znjgOlTHBngTZwgCoEN6crDy+eetHXfMW2ZvPdWCC/o6mJnfc2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eng+uBk+/FyGebzSx3rQo1ZBRZCqu0475kZf3TXIxmQ=; b=lSRTdt9uPNcACgybh9ASTLLTBK
 hpkyQmg7Osc75tj0K5gmlUcmLjcK46xNBdAqpkYnjvsVGhTxwPLB3Jb7K/Xky/ThctDbJINTrzN0A
 xDtfaTXfYwSETr6ax0SUleo8SeRMg11whOtn8z1T9DEWkUc38W4tTpXA6mruy9sKXNG0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmZuy-00Ctyi-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 09:36:10 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6D11134E3202BDA386FB;
 Sat, 20 Jun 2020 17:35:59 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 20 Jun
 2020 17:35:53 +0800
To: fengyubo <fengyubo3@huawei.com>, <jaegeuk@kernel.org>
References: <1592642383-140667-1-git-send-email-fengyubo3@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <db36eb3c-9c27-f5dd-e390-5f5a6f5da2f4@huawei.com>
Date: Sat, 20 Jun 2020 17:35:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1592642383-140667-1-git-send-email-fengyubo3@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmZuy-00Ctyi-Sz
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: lost matching-pair of trace in
 f2fs_truncate_inode_blocks
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

On 2020/6/20 16:39, fengyubo wrote:
> From: Yubo Feng <fengyubo3@huawei.com>
> 
> if get_node_path() return -E2BIG and trace of
> f2fs_truncate_inode_blocks_enter/exit enabled
> then the matching-pair of trace_exit will lost
> in log.
> 
> Signed-off-by: Yubo Feng <fengyubo3@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

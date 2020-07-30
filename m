Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B077232C40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jul 2020 09:09:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k12h6-0000bR-N7; Thu, 30 Jul 2020 07:09:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k12h5-0000bI-Ip
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jul 2020 07:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6tySseC8MeRVewi2tFyT7xgHK3ULrJawk6wwEC3CS0=; b=ZmALxH2M7vXifxAFG9rpb13egI
 NN5ra7C5fA2eYhzvg46PovvcMAwmMuXSFGzqhmRynnaBXj9EK/yQkkej9zj7e+Sk7BhIbXeqlMH51
 LbB4joORgL6wWNKLHyEnraC/p69i7VyViYrcd3pfxTAPUZJIUxkDJtaphD9zFAGMkK6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6tySseC8MeRVewi2tFyT7xgHK3ULrJawk6wwEC3CS0=; b=UiZcamR/kK6WpSJS16vxRpNlq+
 DPeNtHhfeJoG4tMjziE04cKsaa9AHGk759h9qA283FLJddElO0rTesDDz0Bnzma7x4m9CoZbPHuSZ
 FQou/evYbegghQkXJFj668LUzY4RklLTmX4Z58ZLlKheekPwzQGSBihXL3pWvUPSj4lM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k12gx-00439a-Jh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jul 2020 07:09:35 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C317FC19DF8D1A4F8355
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jul 2020 15:09:16 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 30 Jul
 2020 15:09:08 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200725100527.8297-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <55ef5bf1-bb12-3c3e-60d5-89f92792cf03@huawei.com>
Date: Thu, 30 Jul 2020 15:09:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200725100527.8297-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k12gx-00439a-Jh
Subject: Re: [f2fs-dev] [PATCH] f2fs: correct comment of
 f2fs_exist_written_data
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/25 18:05, Jack Qiu wrote:
> Function parameter mode could be TRANS_DIR_INO.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

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

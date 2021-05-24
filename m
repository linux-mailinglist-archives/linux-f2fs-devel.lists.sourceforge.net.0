Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B438E590
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 May 2021 13:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ll8v2-0007ZE-MB; Mon, 24 May 2021 11:38:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ll8v0-0007Yk-TL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 May 2021 11:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccCVINMdZ87xx/ThsWfN3Vi3IqJG+aNAuxRQK8LESak=; b=TW8Hvd5/Vmq6lijYFo5HeBIPBz
 4Mmy92zr4Xjvc8zG2xjutHXjVlWsvqRn6/DO4GV70maA3ZBnsPAXhxx5cA/re8Luie3DWc7Z7vnaZ
 2NNwAfl9Q+UMKAwQVcGE+h9An/PNaJoI972nF/otcqhQr97X7j9XUWOfbbnb4HUaE1oI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccCVINMdZ87xx/ThsWfN3Vi3IqJG+aNAuxRQK8LESak=; b=nS8H8/xP9TDbsd/qUt+BH7bCl0
 WgKA0aBFqbyJyDBmvU0+EZJmO85EU9Z4fXbasHG0jYAq8Ke3tMw1MkuyJlMVpyaffjsGJpQ819PSl
 4i30ato+lfAZQDaxP7KXBm0XAvCCkw6ccg/eC11ZdZ+LOCuAiRP6fmD/S+cgufzKykJU=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ll8uw-0048Fz-9J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 May 2021 11:38:47 +0000
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpZs972tWzkYlL;
 Mon, 24 May 2021 19:35:41 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:38:32 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 19:38:31 +0800
To: Fengnan Chang <changfengnan@vivo.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210518125113.1712-1-changfengnan@vivo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7ad8bae8-6e38-5ff7-add8-fe1023569f43@huawei.com>
Date: Mon, 24 May 2021 19:38:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210518125113.1712-1-changfengnan@vivo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ll8uw-0048Fz-9J
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: remove unneeded read
 when rewrite whole cluster
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

On 2021/5/18 20:51, Fengnan Chang wrote:
> For now,when overwrite compressed file, we need read old data to page
> cache first and update pages.
> But when we need overwrite whole cluster, we don't need old data
> anymore.

I only see you just check the whole page was dirty as below rather than
the whole cluster is dirty during write().

Thanks,

> +	if (len == PAGE_SIZE)
> +		return 0;
>   	/* compressed case */
>   	prealloc = (ret < cc->cluster_size);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

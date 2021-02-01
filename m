Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B730A457
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 10:27:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6VUj-0002a3-Gc; Mon, 01 Feb 2021 09:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l6VUi-0002ZP-AV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 09:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kc83Ucbc/GThGJKCCDoQuu+tdZbtj/5Ia9YguU6kQsw=; b=BYd1TBTFZFMpKlXLnmVADYq6N7
 5J2ZEG6lqEO2mXov3XesXLzfQVSNRtuTQEGz2zJ5+s3ykDDHysEIilsXyPHxU1PMeeL+pOAG5ABXn
 Oi3rSC2tDj47rNtVcwaQf51NTAr4SSxgthmU5pXIzX1o7R3oSRN1nqv2o5TFcBf8ih/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kc83Ucbc/GThGJKCCDoQuu+tdZbtj/5Ia9YguU6kQsw=; b=GVOdcaoh53Ae9sNDacN5zC4Qp+
 dvpurIwtaLspMno24/vYIZ+oJgALsZeaPrqlYehvqQLq0EJIsIpF5khi4/BjYa+29HyJqP+A86s9V
 j/5C6C+GySxJr2EXOJMF/DgW3orjS0sWyMWkNAW3nXbUsyoF3hlHT2uycGZWT2dTQgpw=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6VUc-000351-UI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 09:27:39 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTY1n0tQ6z162GY;
 Mon,  1 Feb 2021 11:13:49 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 1 Feb 2021
 11:15:01 +0800
To: Liu Song <fishland@aliyun.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20210131122605.3296-1-fishland@aliyun.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5cbe4b42-9aaa-c05c-b46a-46dc3c6c14f3@huawei.com>
Date: Mon, 1 Feb 2021 11:15:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210131122605.3296-1-fishland@aliyun.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l6VUc-000351-UI
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary initialization in
 xattr.c
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
Cc: linux-f2fs-devel@lists.sourceforge.net, liu.song11@zte.com.cn,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/31 20:26, Liu Song via Linux-f2fs-devel wrote:
> From: Liu Song <liu.song11@zte.com.cn>
> 
> These variables will be explicitly assigned before use,
> so there is no need to initialize.
> 
> Signed-off-by: Liu Song <liu.song11@zte.com.cn>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

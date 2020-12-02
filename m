Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A78372CB280
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 02:51:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkHIb-0007K3-9m; Wed, 02 Dec 2020 01:51:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkHIZ-0007Jm-MX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p6Slouxa6VhIJgicKINaCB33LDIOdYe7ZadmrqfKCbc=; b=FSqtWTagyyx3ZF4GrFOHROr0zD
 g1Rn3idVQQG6aRyixetNQ6idiwjlJ4kUQin0cjm8syJYED7jKVDA9gj6Y9TXJ7QwmogDi5THljnMt
 s17KIxhLcM31ewRZo5wmMydaOAoDwnHGpQ0jyeBc8cIa1iQWTQmQaT4S7KLKVUsIwp8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p6Slouxa6VhIJgicKINaCB33LDIOdYe7ZadmrqfKCbc=; b=Xk4/zZ+YKtW7VzS99u4k3srloI
 nliSXt3uSDH4eujDCQxDIQahFcM7BxE/Qa1B/UzANPdu9FcH3KB7hMKYmygmwlFmZdKAiWvXGJeBh
 6z6BKhCwCVWnET9judzAlIE2Ckpn9IuOVWlgqbFQu3rZEpOisWDWysbqtZcVzttyxKt4=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkHIS-00Ezir-F4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:51:15 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cm23v4Ql1z73g6;
 Wed,  2 Dec 2020 09:50:35 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Dec 2020
 09:50:56 +0800
To: Shuosheng Huang <huangshuosheng@allwinnertech.com>, <jaegeuk@kernel.org>, 
 <chao@kernel.org>
References: <20201201071739.13301-1-huangshuosheng@allwinnertech.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a79534af-b1c2-4b1d-bc09-b0727147623d@huawei.com>
Date: Wed, 2 Dec 2020 09:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201071739.13301-1-huangshuosheng@allwinnertech.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkHIS-00Ezir-F4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Remove unnecessary unlikely()
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
Cc: tiny.windzz@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 15:17, Shuosheng Huang wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> WARN_ON() already contains an unlikely(), so it's not necessary
> to use unlikely.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A381FA906
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2020 08:44:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jl5Kc-00025z-CE; Tue, 16 Jun 2020 06:44:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jl5KY-00021U-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 06:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w22hB/lub2ZJbU24uC+ykmaL30y8YqcbTgFyUvoTvug=; b=VpVp1sG8mgAHU4ScWIlkA1u42Y
 fwWloyfUIc8eaHW8Rt1yP1w3Jx7cdatU0WU2ZQ/H0d4uFiTQxm3qxCqFPz2T7ocEveOvGGyN3PqDr
 QngqslX4PXXbaALaQfe0H2VUmkhV/K65uDNZ9wa+7AkeHcJGb2Voj0yKwbigUB0scTEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w22hB/lub2ZJbU24uC+ykmaL30y8YqcbTgFyUvoTvug=; b=HGeg19kXLCklqIUad/c+agiVSK
 VLdBq8tMClw68cFDqNYREAu8uMWof08m7ZTXFCAg2CPx8/4HpittJ4N+dSAIglr7wOBQ62J+vrvXI
 bsNwlIa3YS2JVczmSL2USSrxm6Jz0/1eh38AzVz2ah1qUAyITZMzX4q2U4Mp8D/NIHFA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jl4x7-004lJP-0f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 06:20:31 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 892BDCD39FB15B6B5984
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2020 14:19:59 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 16 Jun
 2020 14:19:51 +0800
To: Wang Xiaojun <wangxiaojun11@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200616023924.17351-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <757fc6f7-b191-259b-07ba-39c928e316d8@huawei.com>
Date: Tue, 16 Jun 2020 14:19:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200616023924.17351-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1jl4x7-004lJP-0f
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove the unused compr parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/16 10:39, Wang Xiaojun wrote:
> The parameter compr is unused in the f2fs_cluster_blocks function
> so we no longer need to pass it as a parameter.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

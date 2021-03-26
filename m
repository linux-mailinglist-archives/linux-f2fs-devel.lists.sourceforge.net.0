Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D50349ED7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 02:41:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPbTZ-0006h0-DZ; Fri, 26 Mar 2021 01:41:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lPbTY-0006go-86
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HrAnbhNcc+a1N8ZBejWXWVBO28Vyd4LeZF+FMKX7u80=; b=cBhP2yT+sY1PcQL6aeEL7504qm
 8Xui7b5wQHQLLDOYezGXAgoQXtmMNEPyxGzRHMz/d2xtGs7fHcwmONWC6u8FkvSR3BnfkUNpjZcxn
 aVRakASJjX5FQTy+KxNA4cwQvrlbacEXStsCua34le/XQqNdErP+q0cJz2XoV6dzaSWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrAnbhNcc+a1N8ZBejWXWVBO28Vyd4LeZF+FMKX7u80=; b=YAi8rzVcBwuRFMdHwOgG2A1V2B
 OgPoD9Umjz2yyg/iErN1git3/yfHeMUXpfv8M7jFFafGlmiNjHrdjOfJNbaY7m/S/RVH9c0b9JRjx
 ZUqRAUcPlgtIQhp6WTNQj57Vc+QEWiCG/GAER6on6uWYvSPgYQSG+NvfxCW23PiqYg/k=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPbTJ-0001Ss-VP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:41:24 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F64PG2rK2zPm8k;
 Fri, 26 Mar 2021 09:38:26 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 26 Mar
 2021 09:40:52 +0800
To: Wang Xiaojun <wangxiaojun11@huawei.com>, <jaegeuk@kernel.org>
References: <20210325141920.858019-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <97dd01ee-5a7b-cb77-1359-fdb3499cc53b@huawei.com>
Date: Fri, 26 Mar 2021 09:40:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210325141920.858019-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lPbTJ-0001Ss-VP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong alloc_type in
 f2fs_do_replace_block
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/25 22:19, Wang Xiaojun wrote:
> If the alloc_type of the original curseg is LFS,
> when we change_curseg and then do recover curseg,
> the alloc_type becomes SSR.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

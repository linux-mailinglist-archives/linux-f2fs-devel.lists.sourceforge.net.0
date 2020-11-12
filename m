Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C22B0236
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 10:46:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd9B8-0001FH-5U; Thu, 12 Nov 2020 09:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kd9B6-0001FA-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 09:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9UJftrv1fAzinfWoHyAaMdOWZ5AA+hw0UIUHJzBoyp8=; b=iWPuXBp8OichL0pqGxcIoyftPN
 rDfUBGhO1vPmwPPDBPc88ha+CXQntfJN3g4iz3xtxncgJBqjfHLGnSF8Xn+r34AUU8sQz7QiizCZv
 xO/Q8AmqTGa1HUrFX0ijHLM9EkFWHHHx8E7cxOWFDbEV+pTvUKnhQjq5yV7JHjDX7Uyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9UJftrv1fAzinfWoHyAaMdOWZ5AA+hw0UIUHJzBoyp8=; b=A5MlxkPTybPW/U3gcxBC39Y/Pd
 QLTyq5oKYZX31UnV/dUwJ85s4g3JavENnio2rQ3g5BnuQvT+9Jhmwo3BCzycyyuwIwqAbuFqrX7e6
 5j0wYohbkTODHeWl4gOMRZeQU+J5yJgLy+xjtjvS4sue56XPLIZn9mNBAzlOqql2A9rg=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kd9Az-000Lt1-Bf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 09:46:04 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWx5z41zSzkg2y;
 Thu, 12 Nov 2020 17:25:27 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 12 Nov
 2020 17:25:34 +0800
To: Hyeongseok Kim <hyeongseok@gmail.com>, <jaegeuk@kernel.org>
References: <20201112091454.15311-1-hyeongseok@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6a442a9c-d8ab-3e5f-fda8-fabbbca2ed32@huawei.com>
Date: Thu, 12 Nov 2020 17:25:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201112091454.15311-1-hyeongseok@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kd9Az-000Lt1-Bf
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix double free of unicode map
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
Cc: linux-fsdevel@vger.kernel.org, hyeongseok.kim@lge.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/12 17:14, Hyeongseok Kim wrote:
> In case of retrying fill_super with skip_recovery,
> s_encoding for casefold would not be loaded again even though it's
> already been freed because it's not NULL.
> Set NULL after free to prevent double freeing when unmount.
> 
> Fixes: eca4873ee1b6 ("f2fs: Use generic casefolding support")
> Signed-off-by: Hyeongseok Kim <hyeongseok@gmail.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

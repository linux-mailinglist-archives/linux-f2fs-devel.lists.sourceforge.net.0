Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED701CCF0C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 03:12:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jXwzf-0008JK-Hr; Mon, 11 May 2020 01:12:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jXwzd-0008J6-6t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 01:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SnoYAoXQpmTp/YwQYeJTCMaqT7WCf35mpL/huUUAJDw=; b=ECcOfiz/xsHRc/rAObzm+RYZVn
 FtW7AdjFNxC415u/IjGVT56aeoQ0Tj8UgrtGfAJNSVSfXyFe20xFlALiwocAF4R0Gzp9Z0NnqsgW0
 vYLBEDE3HqdwujaMakYiL2JoB4UzmvycUtMLKmZE174P/jPHTqaMvHQnOYiRemAZNl9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SnoYAoXQpmTp/YwQYeJTCMaqT7WCf35mpL/huUUAJDw=; b=UZzG8/b7c85JCR3QnOO/qu+4wA
 OSNad1XfgeRTJnHE1rKHd0tWFy3y4ZJEJhUmtRFHdlXK/jwjPH3OWdq8QGs6HmlxvHS6OClWZ/kXe
 KIjw6A4papNnRovRnAXF4x8mvbF/CBnGPUgRbFM+5HA2Q4A0vOrXEoTWruRBqY454yVc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jXwzb-000ENt-8h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 01:12:29 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A16BD23D88B576970A90;
 Mon, 11 May 2020 09:12:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 11 May
 2020 09:12:05 +0800
To: YueHaibing <yuehaibing@huawei.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <hridya@google.com>
References: <20200509112135.51960-1-yuehaibing@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <684636ce-5bcc-328f-b7dc-dfdee06f41cf@huawei.com>
Date: Mon, 11 May 2020 09:12:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200509112135.51960-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jXwzb-000ENt-8h
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Fix wrong stub helper
 update_sit_info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/9 19:21, YueHaibing wrote:
> update_sit_info should be f2fs_update_sit_info,
> otherwise build fails while no CONFIG_F2FS_STAT_FS.
> 
> Fixes: fc7100ea2a52 ("f2fs: Add f2fs stats to sysfs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

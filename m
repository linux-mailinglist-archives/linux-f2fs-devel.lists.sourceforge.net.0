Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B4626D65A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 10:23:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIpC6-0005C8-Gz; Thu, 17 Sep 2020 08:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kIpC5-0005C0-4t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 08:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+WBEdirGN+bw0X1kfmlg2A2U/cLFx1M8njNxgfm2ok0=; b=StdJwoXQxHxTJay11H1Mqdtxb5
 MPKYfQx9RuE+0dYFbjcis0eYyLdYvwBXL8wyEDJKnCeBEVQjf0s5C4qaJ24bfkKf3IN3H7Xic5311
 1k1DM6FM71pB0mNDdB/vyH2+VZYmG1CfDDL79eGfG6JbW6Of3jmYn8C4Ye2b9H/7CZgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+WBEdirGN+bw0X1kfmlg2A2U/cLFx1M8njNxgfm2ok0=; b=QE5wv0+N7izvsXxwDXCFQeBWmg
 jf9gCdT0GSRd/WkYAmeI3KmXHbHJatfjPy3eDYz5vskOQyxpC60FdPirazCWIfxQmZw1QwU4oUspU
 Cb6ge6QSO7WVC52hpOPKB1rN+AsZ0JdZkmmtLZJLBEx8dc5Jf5Cwr6dDu5We+YtH2elU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIpBy-00Chhu-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 08:23:05 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D2C844B556A76C3AEEA4;
 Thu, 17 Sep 2020 16:22:38 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 17 Sep
 2020 16:22:32 +0800
To: Xiaojun Wang <wangxiaojun11@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200916080046.2417806-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <94493f8b-8c51-5231-5999-c887ce9188e2@huawei.com>
Date: Thu, 17 Sep 2020 16:22:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200916080046.2417806-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kIpBy-00Chhu-IZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: change return value of
 reserved_segments to unsigned int
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

On 2020/9/16 16:00, Xiaojun Wang wrote:
> The type of SM_I(sbi)->reserved_segments is unsigned int,
> so change the return value to unsigned int.
> The type cast can be removed in reserved_sections as a result.
> 
> Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

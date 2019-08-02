Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 679067EAC6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 05:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htOSn-0002HY-B2; Fri, 02 Aug 2019 03:42:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1htOSl-0002HI-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YzYS1Pgu9zrrP6GjVoTSYByzbvbaz2OX1sertCr2ooU=; b=Vxv8PG9T+cm5GsCSendpFLak+u
 Pgs5HOeVLrVpUqp34N2/KlrlEfw7gGvTPYzZD2UIPyDOdJYmy/o3Aty4/YLfHn9+dznXbb3zdjd93
 crmhFAI8SJtCpAisaJ5bThTrcaRydwiuqAQHqIl/PrpDSeUIl6XMxKj8VNJVaTVM++zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YzYS1Pgu9zrrP6GjVoTSYByzbvbaz2OX1sertCr2ooU=; b=h7OqFpj68czKTBVh0GBPYJJJY8
 jwAUcj0vp00eZXhQhtANuMqX60u0G01m4Om+McWN1KJjziLjp4Wl8xguzxwakM51oVY/ZC6GOZpIz
 zDx2DYLC3hxvVGvv6tzGzt0ywYYVPxQf4Lb4z8wBgRNq3MEwayeXyWiGa7bqzQnP9JN4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htOSj-007IJK-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:42:39 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CB056DD9CEEC2526F6BF;
 Fri,  2 Aug 2019 11:42:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 11:42:27 +0800
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20190802024748.17987-1-f2fsnewbie@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0832e6dd-1b38-2b50-4e8a-3db6a1af41c9@huawei.com>
Date: Fri, 2 Aug 2019 11:42:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190802024748.17987-1-f2fsnewbie@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1htOSj-007IJK-Rc
Subject: Re: [f2fs-dev] [f2fs-tools][PATCH] libf2fs: Throw an error when
 zone dev info not found
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/2 10:47, Surbhi Palande wrote:
> From: Surbhi Palande <csurbhi@gmail.com>
> 
> When the -m option is specified to format a Zoned device,
> do not fall back to the non-zoned mode in case information
> about the device is not found.
> 
> Explicitly specify this error to the user.
> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

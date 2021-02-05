Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E03103C9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Feb 2021 04:41:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7rzk-0000nx-MF; Fri, 05 Feb 2021 03:41:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l7rzj-0000nq-Bh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Feb 2021 03:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j2kgyYjiwOAvH+K5z7g8Ejzu8PUIurEEESpiBRxO6YQ=; b=L4CXstLjuVLxQbxw7GIBFwI/M9
 PAiqOR8/F95m9NHtwCzDerBcTTaZkMDZ9RJfYy28L7EgFMO7RpueC/WH9b9yxh0uS9B8Yelz1nVc1
 dJY6uVWLZ7Y/vx+wJlP9H6mSHIccP8HH/9fUhLOclfxajI6AU/5JOmVhxwE7psNYxlH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j2kgyYjiwOAvH+K5z7g8Ejzu8PUIurEEESpiBRxO6YQ=; b=jiWvqEgreCy+ZkriigezxOckJR
 D5friua3CcpTA0TQYKzWXYb/R67cpwAW5YRTfXpuF53OiCxSGm7WG6fSv55NxXIHwpx8KDfliwGsm
 owGUCgIe8Wdn02Y1NSVLvCQpIbTHeL9pyA39MAliC9LUelQHGaL2AWqlyEAcSk1phQ9I=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l7rzb-0077U3-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Feb 2021 03:41:19 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DX1PL2fFxzlG6M;
 Fri,  5 Feb 2021 11:39:18 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Feb 2021
 11:40:55 +0800
To: Ed Tsai <ed.tsai@mediatek.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210204132556.14934-1-ed.tsai@mediatek.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <860ac670-f832-c41d-f903-d24e24200292@huawei.com>
Date: Fri, 5 Feb 2021 11:40:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210204132556.14934-1-ed.tsai@mediatek.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
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
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l7rzb-0077U3-5Y
Subject: Re: [f2fs-dev] [PATCH] Documentation: f2fs: fix typo
 s/automaic/automatic
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/4 21:25, Ed Tsai wrote:
> Fix typo in f2fs documentation.
> 
> Signed-off-by: Ed Tsai<ed.tsai@mediatek.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

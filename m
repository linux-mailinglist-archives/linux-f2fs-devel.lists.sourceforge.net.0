Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BB363B4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Apr 2021 08:13:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYN9o-00039i-5Z; Mon, 19 Apr 2021 06:13:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lYN9m-00039N-R1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 06:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CIW88LwZv+KwMdpqHrhMby3pp29j/j6jKX+iInXlyAw=; b=SfCnJcKwDA1qvMxVZBT7KIt9sL
 Or4l4ip5m0cbNL/rZKtZT4i7yih57uz7f+IT4PwGlKFIP4oFmZfWTMxuwlM96H9CdB/jVf9yLFEdN
 9Nh6El6b8E25+FxAL9JwhAh5/ch+R+ZLYNqcYdIAkFOtXkl4R33Ps34Ij2VyRm22Mi4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CIW88LwZv+KwMdpqHrhMby3pp29j/j6jKX+iInXlyAw=; b=f1kTNsrVnfumMfcuKY/H0AI1iU
 oRtbKY7jOehhkv5zWdC4IVcigRQq6T7312IC4XQJJddD1QgjCEHgxCEtw2qhseBC+O685obIN34HZ
 sMwuHadTKZKxhnTdrQ7dDYay6dygzuOppEH5yE57ujMgItc8t8OmbbrAgzxRdMuns8s0=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYN9j-00Czgv-OW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Apr 2021 06:13:14 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FNxJJ1JFTzBrSJ;
 Mon, 19 Apr 2021 14:10:40 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 19 Apr
 2021 14:12:55 +0800
To: Jaehoon Chung <jh80.chung@samsung.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20210415233209epcas1p1e0a4c41f11000e373227bf847219db14@epcas1p1.samsung.com>
 <20210415233256.29122-1-jh80.chung@samsung.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <72d773ce-fb40-48fb-eefe-8332a8867568@huawei.com>
Date: Mon, 19 Apr 2021 14:12:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210415233256.29122-1-jh80.chung@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lYN9j-00Czgv-OW
Subject: Re: [f2fs-dev] [PATCH] f2fs-tool: increase debug level from 0 to 1
 in migrate_block
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/16 7:32, Jaehoon Chung wrote:
> Increase debug level from 0 to 1 in migrate_block.
> It seems that doesn't need to display debug message by default.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2BD38E5BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 May 2021 13:45:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ll91f-0005K1-1E; Mon, 24 May 2021 11:45:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ll91d-0005Jp-EP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 May 2021 11:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBBjRpAZYFlKyAtHZP0TeHP495OBwjVeFFWoAjHW2uw=; b=Rld3UWrwM6RigylkhyWxqB+lnx
 Q4PLvqlU53QSHjHnS4w90wGI94/W84AztkMvGjTj52ABW6958erynZcMtGqlVh7t8rc4o+yD2CZC1
 ugdWQoSDTXPkH/K32Jiyp/gU6s8d9Bnsu4Otlpaicr5pD2ZRMluv34DXDWzm4FijkX3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fBBjRpAZYFlKyAtHZP0TeHP495OBwjVeFFWoAjHW2uw=; b=fZZzV+v7/wyugar7BkgL1v3Uv4
 Dedcyo35Meq5k1RXOQiDXqe2QU+uhTEjQmxq07YNiSvmv5Kw0gFAxWORzlorN7JoWtqJgg61Hi7uF
 Q+ax3mtLZjvyTYdffa/AZj/cFUKcCOPzKzM233BV/DjXexWcSyndkGIRP8RPXpPeyVrU=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ll91W-0048XD-5L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 May 2021 11:45:39 +0000
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fpb130fJZz1BQyb;
 Mon, 24 May 2021 19:42:31 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:45:21 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 19:45:20 +0800
To: Dongwoo Lee <dwoo08.lee@samsung.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20210521103244epcas1p3ca430731d1ea20559aef4e3e68e49870@epcas1p3.samsung.com>
 <20210521103238.261204-1-dwoo08.lee@samsung.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a1af192e-41ca-de6d-e3d8-c69d7bdb60a6@huawei.com>
Date: Mon, 24 May 2021 19:45:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210521103238.261204-1-dwoo08.lee@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ll91W-0048XD-5L
Subject: Re: [f2fs-dev] [PATCH v3] tools: Introduce f2fslabel
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

On 2021/5/21 18:32, Dongwoo Lee wrote:
> Although many other filesystems provide a tool for changing volume
> label, e.g. e2label for ext filesystem, but f2fs has no way to change
> volume label except set it while formatting with mkfs.f2fs.
> 
> This introduces f2fslabel, simple tool for changing label of f2fs
> volume.
> 
> Signed-off-by: Dongwoo Lee<dwoo08.lee@samsung.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

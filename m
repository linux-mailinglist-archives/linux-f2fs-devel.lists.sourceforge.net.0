Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296732DBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 12:34:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXkId-0003be-9H; Mon, 03 Jun 2019 10:34:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hXkIc-0003bK-9W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 10:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fmM+PlDXC+Sd1khZBB3OxsseXAF9mqbUMw9qBu2rjM=; b=R73Kg8IkScuhDf7ADivnyG7V2F
 wjWthoG2RBnGsutsGSiCmyeHZDS2vPH6zB7GuakDRADvo8hPXSUA3QXo1zK0MH5nt80wfoRkQdqjb
 ZckuRL7oARmoKx9dD6eyeCeN9B6PAVi7ZnjWsLA3udexH9wwutpwuiAH+5t/VyGooNwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+fmM+PlDXC+Sd1khZBB3OxsseXAF9mqbUMw9qBu2rjM=; b=F0WwGn1zctwdN/BE+hNVdgJZYL
 vGclFUV05eSVDstgd/yequt+7YrsdCy339GEWDpOfK3C1leJ9aPwFkfE0vss1CgalDIXIh1NDAWM0
 AIQjv+J9LgAbIsORhrkvYxOWag4ti3yJtx2K3ROxkJEFE7LXq+DX/fvCpGnw1qrqCeSA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXkIa-003ZSB-3g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 10:34:42 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B8A478589F240428C33B;
 Mon,  3 Jun 2019 18:34:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 18:34:29 +0800
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190530004906.261170-1-drosen@google.com>
 <20190530004906.261170-3-drosen@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d7ec7432-a66f-395a-0779-17f6d05b45d1@huawei.com>
Date: Mon, 3 Jun 2019 18:34:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190530004906.261170-3-drosen@google.com>
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
X-Headers-End: 1hXkIa-003ZSB-3g
Subject: Re: [f2fs-dev] [PATCH v3 2/4] f2fs: Fix root reserved on remount
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/30 8:49, Daniel Rosenberg wrote:
> On a remount, you can currently set root reserved if it was not
> previously set. This can cause an underflow if reserved has been set to
> a very high value, since then root reserved + current reserved could be
> greater than user_block_count. inc_valid_block_count later subtracts out
> these values from user_block_count, causing an underflow.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

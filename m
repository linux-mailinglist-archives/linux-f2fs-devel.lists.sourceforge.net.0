Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB827DF7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 15:23:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTngS-000668-BV; Thu, 23 May 2019 13:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hTngQ-000661-Rf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 13:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olFQgDf/SaP+sdAG4QqRiNb5P1sixRyW5t3Rk16tnBs=; b=CPIRT0u2VH2kaBlXBUdeWZGWnf
 E/8r7UI/F/M3xnZ3mCaBQaGj/611q1mUo+4F+NQLAMBAQp9QbvMG6wTAosCDH4sazsbH409+DsXRX
 YLnGt6ZWsEu0LK5H6o8l1Mn0VNUP0h+E1t+j5DYyWMWGORgOXyukocDbOOogtIjlD92c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olFQgDf/SaP+sdAG4QqRiNb5P1sixRyW5t3Rk16tnBs=; b=T+ad8+UZTj49JT4O71XGJH/myL
 MRWK5Xa4BFFwnyNTOyqSl2pOeEn5bxk3/Lb0OfIMerZhNSTwBVTzzBxfbdfzYxXA80Tfp4s7RsDaM
 MmVprrkt9TbHIFQ60CCTNmrpBvX8kyDbfEpYr4N/yyn1LN8ft+TkcudgIQahDRKIGdao=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTng3-002KtZ-QY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 13:22:58 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83B5820862;
 Thu, 23 May 2019 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558617749;
 bh=fafG5urEIcaBd2TyvSTWRmea9cT2jasXKlmsCh3VSws=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=SMVTE6A4oqESJX9PxuakmNe2snGrj3s+XpCTQWn5c4j/5ndOSXvTvjclhmnXiMdRg
 i7P8i4DcErB+Ep49l+Zy0XBcDodiMg48o1HXSRPGQYeWxbLrYgHyHSuAYnDzPbT89d
 QiQr2ud0LT7Zp5Y/NRon8ijRwPYlySFjK64Rp5VU=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190521180606.10461-1-jaegeuk@kernel.org>
 <20190522175035.GB81051@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <14672901-54a2-120f-a2ce-52f7d6fb3008@kernel.org>
Date: Thu, 23 May 2019 21:22:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190522175035.GB81051@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hTng3-002KtZ-QY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add missing sysfs entries in
 documentation
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

On 2019-5-23 1:50, Jaegeuk Kim wrote:
> This patch cleans up documentation to cover missing sysfs entries.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

> + reserved_blocks	      This parameter indicates the number of blocks that
> +			      f2fs reserves internally for root.
> +

I mean we can move below entry here.

current_reserved_blocks	      This shows # of blocks currently reserved.

> + reserved_blocks	      This shows # of blocks currently reserved.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

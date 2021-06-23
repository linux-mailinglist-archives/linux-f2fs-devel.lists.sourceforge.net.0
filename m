Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 620723B1B94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jun 2021 15:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lw3I0-0000sz-LL; Wed, 23 Jun 2021 13:51:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1lw3Hy-0000sm-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 13:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/XVlT6FB7Kb9Zaso6INJeYLI2ZDTlxMqqSQurHx6Tmc=; b=bP29ztFZoFxvODKgywALxVbZX3
 CD0d33bQLc6WtK4bkPKOW17k6D9EVc6L+E1d+1MOQE5GS6CIIxRPiOlTSbrxMSwlwPjtgkwLhHKq+
 aPLHwoX1GV78F3JD9qhb4TFD+j5wLea+lx84F0CJgm8N/LyJL2jfo4xARO+VysWMQ120=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/XVlT6FB7Kb9Zaso6INJeYLI2ZDTlxMqqSQurHx6Tmc=; b=jPKuchSwZx5hRhNYmAf1Bbrik/
 iMwjV74tXq4oMmvWDS+ffUAf6YKyc5cnglPnWdNn0nq1GJGzSZlt9UpiSi4ifIz/xAzho9p5Y27Kj
 yMCD7pl8rNGYt7YhoGnhhD9alvwtqoHHczGLt7k2uNgPN/NTiiY7gYvhN2PSzXoMmYG8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lw3Hu-009FrO-3s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 13:51:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E4356101D;
 Wed, 23 Jun 2021 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624456279;
 bh=epwrvVFSVJxcU0C1e33GqxsK/X2qEpFhl8REcdHKAwQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eqSsVrG1cfdrZY0DZgZrxpWnxbAmRsADx6vGLXxQQSOsobHwWftvB4q3FvtOodOPQ
 L2wqY0pEuEaNH6OrQGu1HpHhe7uAVeriJgE5Ki5XafjgXpv2UJgUfivaTgprJNPhWT
 CDXRgC5TkKrf2npuYA1ilgo5bzR+dPgvEUu5yekzSwD8Sw6n1W47altCwQP663udyF
 TxO/HwDhf5Jj+oZEwLZisb/vkZ1OYk/xTl18Jrc/axnkhzN5rZKki2dKjg8ZejvYc+
 S+hr4UDGazXUhJMxaGbuPMh5z8lwelveZdM7jeFvNGG5gUwaEC+zv4mVvQqFoAg0ah
 Mb9KF0xMU5fgQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <b255f6eb-51e6-fd44-d62b-7b105993fb54@kernel.org>
Date: Wed, 23 Jun 2021 21:51:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621023939.1510591-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lw3Hu-009FrO-3s
Subject: Re: [f2fs-dev] [PATCH 1/4] mkfs.f2fs: remove android features for RO
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

On 2021/6/21 10:39, Jaegeuk Kim wrote:
> We don't need to enable all android features for RO.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

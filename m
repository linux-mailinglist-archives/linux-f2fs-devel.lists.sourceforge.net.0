Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99E688F82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 07:11:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNpIF-0003wJ-RL;
	Fri, 03 Feb 2023 06:11:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNpID-0003wD-MM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 06:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sv72vUuQUz+Ai4dTFNMcCQ5PyXX4JknpkUeO/XWyY5A=; b=nGU3kgi9TYCaioRAfx0SabZ85c
 IFPZaVBBtwJ/Z/WczK7pqf6+zvV7NIvjohlKtzK/EIDQvJkDOOPaTt159frp58L4mPoEoV1KcxXj7
 Lic/XkvE6L0IXsuK1VJPzg7gJHnJKF9RbvLKV5xo0t+NkYustNKyUeg+0s/PIma8t114=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sv72vUuQUz+Ai4dTFNMcCQ5PyXX4JknpkUeO/XWyY5A=; b=YWpc+1svl3zQnMVLqgXFmVdKRH
 HWKHfkRhqomtyIBjVUvvLtPdJNJMuYz7n3xfPcVXgvlZjd+PF/IidteD/y/51sUUQia68WhC2tk+d
 iCfUTUXz05YauxCnqsLmYbpw9QsepBXirx8hR9+raEKljF9fT2uMWoTsZ9w5KBg6tQFY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNpIA-0001vB-7t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 06:11:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C910161D99;
 Fri,  3 Feb 2023 06:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CBCC433D2;
 Fri,  3 Feb 2023 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675404676;
 bh=MAggVnzFKDMQ6sFkdhtLT/WSLZ0MVSVv/6OXYW3ftB4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QJlRH8umlV+0TMBPBrCGs0UJ1hukXG5vVraOL+qqlSLAxvO3P9jW4ehrIwXKF8dT5
 JPB62P/JXtyB4Xh+bx0ixF/EJwYYOecTbNkJ7/pkJ97AGuskaKAYX4HZ15UUHEhTmH
 vAbdw2cUvUuBkq1GUsTi62QSNQPypOKRQkfoMs46BCzoeqYWwyfGItoEsvqBhtGzrX
 XnHoijtn72lUlJ0NcirHRR40uRkaGr+jsGH170McSW4ZqFQX854XdTtAaPKM2HFe8I
 ylUlXal6ItW+H2gY7OKYco/r8/VikioBB3mARdWrsykGkSKqmfu9F41IRp9VvcbV7e
 zLnNlu16i3Wfg==
Message-ID: <f7fba117-ff4a-2c5d-2206-fd039de19ddc@kernel.org>
Date: Fri, 3 Feb 2023 14:11:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: qixiaoyu1 <qxy65535@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
 <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/2 16:20, qixiaoyu1 wrote: > Currently we wrongly
 calculate the new block age to > old * LAST_AGE_WEIGHT / 100. > > Fix it
 to new * (100 - LAST_AGE_WEIGHT) / 100 > + old * LAST_AGE_WEIGHT / 1 [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNpIA-0001vB-7t
Subject: Re: [f2fs-dev] [PATCH 1/2 v3] f2fs: fix wrong calculation of block
 age
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
Cc: Ping Xiong <xiongping1@xiaomi.com>, Xiaoyu Qi <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/2 16:20, qixiaoyu1 wrote:
> Currently we wrongly calculate the new block age to
> old * LAST_AGE_WEIGHT / 100.
> 
> Fix it to new * (100 - LAST_AGE_WEIGHT) / 100
>                  + old * LAST_AGE_WEIGHT / 100.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> Signed-off-by: xiongping1 <xiongping1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

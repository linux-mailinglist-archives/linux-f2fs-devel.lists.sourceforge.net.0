Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A381C1B2530
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2020 13:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQrCB-0004Dp-RJ; Tue, 21 Apr 2020 11:36:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jQrCA-0004Dh-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 11:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uc/fd6Q13fXtWZCdIalKH0g0a6LuNk7TMUIgJRs5RZ8=; b=SkJAW1ISiezZWjwmojqcaWEz69
 5oLrg69ufXvARAJ+1rewJUTlPJd+++oeIOLaT/H7JuYiPvkAWy7sa3sl+zfCFr7Bvs7ZSMKzry7gT
 q94zEA0KrO6/F5+HWJ2jkNRrnw+MRGGw8hqhnj/h5GSHvsekkHWWiTBI+Ox1atxoZDYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uc/fd6Q13fXtWZCdIalKH0g0a6LuNk7TMUIgJRs5RZ8=; b=GDo8zFWeBuyaWbRX3wzMo2GfLW
 al2DYQ4viR6QcYoYe3a+GgO29PiaUMegUJNQtFdixw+AUwK4npXZ7wnvWpo30K7YyPl5pZcq+VauV
 1MaPNPBe9WSIitlQI1FgE3g2mLQgDNLILVYPXXT/Sv+Fcqv/TPzhnUCE1EWq+bZg0mjo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jQrC6-008Ner-Lt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 11:36:06 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5100D55BC0460382B078;
 Tue, 21 Apr 2020 19:35:53 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 21 Apr
 2020 19:35:49 +0800
To: Colin King <colin.king@canonical.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200420220057.98796-1-colin.king@canonical.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <881187e9-68c0-6766-d462-881371973974@huawei.com>
Date: Tue, 21 Apr 2020 19:35:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200420220057.98796-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jQrC6-008Ner-Lt
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant assignment to
 variable err
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/21 6:00, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

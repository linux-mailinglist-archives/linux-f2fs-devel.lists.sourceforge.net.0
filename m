Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667D1F92A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 11:05:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkl34-0000uG-1x; Mon, 15 Jun 2020 09:04:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jkl32-0000u8-Cs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 09:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ubPJu2UlFGcf6FT9MVj/M6MW4zYD8sSxwDqjSSoWUCs=; b=ijksYGnK4c5qLP3s7bpsgl8Vpp
 JKXjpTODx7lJy97TTASD+sNE0A5SoV4FH03lkm/Np9g44WihVnBaY8xnvsZXrbvSq4YIpM04mobd0
 lcGwTAnKMhc7MiOMCwrQTpceout3up+n5kpCVEO55PgVNSSRiHyn/VSYXs7fDfORps8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ubPJu2UlFGcf6FT9MVj/M6MW4zYD8sSxwDqjSSoWUCs=; b=OUPaB32rnFtPBMQZ+Q6WCRWJqi
 Oq4mtjWypdR3sPZtmIKSob3Kekc0RVH8zFFce6NpKcFP2WrToXY2CggqkyBH/2iwSm4E//K4x1ziF
 X0shTnx476asMxc1avFHgKAJFKbFRh/WYxpwOIzYNpRl5cDtH+DyPafiCswCfbi6u+o8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkl30-003Kmf-DD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 09:04:56 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 18869B458B78D84EE427;
 Mon, 15 Jun 2020 17:04:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 17:04:37 +0800
To: Jason Yan <yanaijie@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>, 
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20200615085132.166470-1-yanaijie@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <daff3367-a486-0514-99a7-567b9b549e47@huawei.com>
Date: Mon, 15 Jun 2020 17:04:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200615085132.166470-1-yanaijie@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkl30-003Kmf-DD
Subject: Re: [f2fs-dev] [PATCH] f2fs: Eliminate usage of uninitialized_var()
 macro
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
Cc: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/15 16:51, Jason Yan wrote:
> This is an effort to eliminate the uninitialized_var() macro[1].
> 
> The use of this macro is the wrong solution because it forces off ANY
> analysis by the compiler for a given variable. It even masks "unused
> variable" warnings.
> 
> Quoted from Linus[2]:
> 
> "It's a horrible thing to use, in that it adds extra cruft to the
> source code, and then shuts up a compiler warning (even the _reliable_
> warnings from gcc)."
> 
> Fix it by remove this variable since it is not needed at all.
> 
> [1] https://github.com/KSPP/linux/issues/81
> [2] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Cc: Kees Cook <keescook@chromium.org>
> Suggested-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B11AB8CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2020 08:56:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOyRX-0004wA-6W; Thu, 16 Apr 2020 06:56:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOyRV-0004w1-99
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 06:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9ZM4BJqh/6pfYvOAOqeJ82MbJCePLVCtGtwUXW+CXs=; b=dJXsE3gPD/LrBoYixMa1SU6MnK
 48MynAEgX9Eki6Rmpg+sUjHJybMOkmOPfveK6BQ2IKBtkE449rSB7GsuYcqwaBtId80GLrgwFagcq
 lrTc0wJEKGAHwxeWWBl7I0QCGgpYiqbbqbpnGeroXaMyc8hCMks12tKAvjCZvm9yn9Eg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y9ZM4BJqh/6pfYvOAOqeJ82MbJCePLVCtGtwUXW+CXs=; b=cKYZ+ItZt/t8+6Tb9eZaOU3CCQ
 SpWiO6o2r0lCGxpY5JvV1y5OI83OScp/ZGoUrinymy3W+BqvRF64CVdS7J0rVhC8b6GnqiLvZ1WyT
 LA/qH/twjIbPLoM3+EmPmTZYWOmlYPlmBT0mPvVqOhdZouOajysiYsToxPB9HA8fzHs4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOyRT-001WAA-1o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 06:56:09 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B277D564BEBE7EB6F5C3;
 Thu, 16 Apr 2020 14:55:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 16 Apr
 2020 14:55:55 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200413161649.38177-1-jaegeuk@kernel.org>
 <20200416034217.GA254838@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0a821dfb-f2fc-649b-617d-27c1d5ca599b@huawei.com>
Date: Thu, 16 Apr 2020 14:55:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200416034217.GA254838@google.com>
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
X-Headers-End: 1jOyRT-001WAA-1o
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add tracepoint for f2fs iostat
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

On 2020/4/16 11:42, Jaegeuk Kim wrote:
> v2:
>  - add sysfs entry to give the time period
>  - keep stat records in sbi
> 
>>From 805015f3f2cec3acf43321359129c5382a1d5db4 Mon Sep 17 00:00:00 2001
> From: Daeho Jeong <daehojeong@google.com>
> Date: Mon, 30 Mar 2020 03:30:59 +0000
> Subject: [PATCH] f2fs: add tracepoint for f2fs iostat
> 
> Added a tracepoint to see iostat of f2fs. Default period of that
> is 3 second. This tracepoint can be used to be monitoring
> I/O statistics periodically.
> 
> Bug: 152162885
> Change-Id: I6fbe010b9cf1a90caa0f4793a6dab77c4cba7da6

Should be removed...

> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

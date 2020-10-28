Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B191B29CE6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Oct 2020 07:58:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXfPd-0003Hk-Ki; Wed, 28 Oct 2020 06:58:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kXfPb-0003HT-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Oct 2020 06:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w951fwgn35XWQrlUJC6YzZUT/WtvBa3kfTEOfWgRzOc=; b=PhihvGG4XunzYp/NNSyc8X5Dk2
 8NqScAfKSUrp6HsQ1ys/tVOy1WPW/p88JneheUjRNlKHoKu1Nyo4+9mmlt+MpHjoEn7FcsX/BDt1z
 a/WV8FfPPHn3FG2d2H28ZmxMa511UPcvpUlSa71f/wiUJ7D4hOSifb91a9ZMTBQPnnkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w951fwgn35XWQrlUJC6YzZUT/WtvBa3kfTEOfWgRzOc=; b=G5rVZQ8WsV2UF1o7CAouXiznTw
 K/umWrRSwMvhnT2sNt/QScC9MaHbjw7vL7OqkvjExaZiQ5NkCNNHMdQkFEGzTxC7+iTFBhZvcM3jA
 Kq4KayPavC+L2/uOeKUc2Ld6TZ+g832yRyRz6SszsGGbMspelovxAs0m34te328yNfo0=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXfPU-00Gcxo-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Oct 2020 06:58:23 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLfXp16fvzhcmf;
 Wed, 28 Oct 2020 14:58:02 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 28 Oct
 2020 14:57:56 +0800
To: Robin Hsu <robinhsu@google.com>, <linux-f2fs-devel@lists.sourceforge.net>, 
 <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20201026094000.1500425-1-robinhsu@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <299c9027-e137-83ff-b2ba-8af07144a488@huawei.com>
Date: Wed, 28 Oct 2020 14:57:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201026094000.1500425-1-robinhsu@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kXfPU-00Gcxo-Oi
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-toos:fsck.f2fs Fix bad return value
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/26 17:40, Robin Hsu via Linux-f2fs-devel wrote:
> 'ret' should not have been used here: otherwise, it would be wrongly used
> as the error code and then be returned from main().
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>

BTW, how about changing 'ret = EXIT_ERR_CODE' to
'ret = FSCK_ERRORS_LEFT_UNCORRECTED', it's not critical though.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

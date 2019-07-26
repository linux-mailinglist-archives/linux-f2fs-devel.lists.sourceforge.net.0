Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D3375D8C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 05:55:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqrKX-00055j-P8; Fri, 26 Jul 2019 03:55:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqrKW-00055V-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EICrneh/VO6p1kq0HUo8iuif11N4YX/X7w+z9U1GIfs=; b=Z43N5KATq8yU/lvN5rm3dAZMjp
 9JFBJteD1ZABNSS2LqEcUNZhJQ6QuldMBtXBfu0pgUl65hulxtjB/+yx8sSW0GvXhpW7tuwJ0G0fH
 /CHuHpjs5l0u/LdaMxLoKRNnuhYeZZZYSvY9A3xdpGyoixbiw/1hBFAK44stjcPLUCMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EICrneh/VO6p1kq0HUo8iuif11N4YX/X7w+z9U1GIfs=; b=HMiYuSx/ZM+PvL8tmOseY4X2xl
 fKYl8P9aH0eKGIX7Dh8zCE7zBwlmDT6umiP3Qrv/Do8KM9CWONjGLz2JOxULmpao5bgU7WA0eyANu
 3Nb8hKeM6XgHk5FX597LtptjQPDzhrAeZtQVkJ5Ir2YQbwPHEj0S1NRaTGZjgcd9yW4s=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqrKU-002aGr-4S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:55:40 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9BD8BF112BB1844FE3BE;
 Fri, 26 Jul 2019 11:55:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 26 Jul
 2019 11:55:26 +0800
To: Jia-Ju Bai <baijiaju1990@gmail.com>, <jaegeuk@kernel.org>
References: <20190726034512.32478-1-baijiaju1990@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <039c2c03-51eb-0666-bfac-696fb678a733@huawei.com>
Date: Fri, 26 Jul 2019 11:55:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190726034512.32478-1-baijiaju1990@gmail.com>
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
X-Headers-End: 1hqrKU-002aGr-4S
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: Remove unnecessary checks of
 SM_I(sbi) in update_general_status()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/26 11:45, Jia-Ju Bai wrote:
> In fill_super() and put_super(), f2fs_destroy_stats() is called 
> in prior to f2fs_destroy_segment_manager(), so if current
> sbi can still be visited in global stat list, SM_I(sbi) should be
> released yet.
> For this reason, SM_I(sbi) does not need to be checked in
> update_general_status().
> Thank Chao Yu for advice.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

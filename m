Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D611EC9DE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 08:59:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgNNJ-0008Kt-Hd; Wed, 03 Jun 2020 06:59:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jgNNG-0008KS-BY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 06:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvHM54r/0dziqaV1hSLLDsO19f2WmwAK8vEn/13BShs=; b=PLWqCgiL0SDKNIF71p+gcrTCtI
 VA+kRQjMzVmBjwmr1vwPIA2Y8zTRXssEEN2NS8zSox9V2mldLkPaZ+UCt78rYDtiI6i5366yGHswi
 wOMSi6Rf95IY4i1BmQJbzcTPbXs5o9pTjI0kEAXx2fv5zFixDAfow3WUA8dMvJ1LxUOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvHM54r/0dziqaV1hSLLDsO19f2WmwAK8vEn/13BShs=; b=iGWPpdyqteRfRctKfmkYHzYIyJ
 gJzlf9aqtDkiZE8y5pVMaZdZTHr+V3Ko23Q2tE7VeMxxOfKMiOy0fWRxEEwvK4nLQ9a+fQJzjHlsS
 F49YrFxqs0+h4PB4MMrW8+K+MmTahcG6kIUH2AnF1TOHHgwcCjq6ULaHsRqZDCwub8hc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgNNE-007AoT-B7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 06:59:42 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EF3F929B01C3B7124A8C;
 Wed,  3 Jun 2020 14:59:31 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 3 Jun 2020
 14:59:28 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1591101707-18802-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d233cbc9-99e6-ea06-b138-8c8adcdc02b6@huawei.com>
Date: Wed, 3 Jun 2020 14:59:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1591101707-18802-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNNE-007AoT-B7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix retry logic in
 f2fs_write_cache_pages()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/2 20:41, Sahitya Tummala wrote:
> In case a compressed file is getting overwritten, the current retry
> logic doesn't include the current page to be retried now as it sets
> the new start index as 0 and new end index as writeback_index - 1.
> This causes the corresponding cluster to be uncompressed and written
> as normal pages without compression. Fix this by allowing writeback to
> be retried for the current page as well (in case of compressed page
> getting retried due to index mismatch with cluster index). So that
> this cluster can be written compressed in case of overwrite.
> 
> Also, align f2fs_write_cache_pages() according to the change -
> <64081362e8ff>("mm/page-writeback.c: fix range_cyclic writeback vs
> writepages deadlock").
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

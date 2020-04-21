Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DF1B1BC7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2020 04:20:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQiVy-0003GD-PV; Tue, 21 Apr 2020 02:19:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jQiVx-0003G6-5y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 02:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bf0qUv7sX/hAr5iVO/kB1EyGK9DUukbg+qSifBDNx20=; b=DadSyr/6bv5xKLnsw+NFoLD2U6
 RtgL7ZYBHn/YfBIL9biWHOEemrPCahuwh42N7ZNwWVjShg+l2W4TuKvFAlCGEfceYbVOTN2MBaHUe
 KEOIZsJlfMOKtHBLEOPSfYrV2nUDanTJQlBV5y/PxtlobtDhZ76fMqF5bOqJbR5QYv+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bf0qUv7sX/hAr5iVO/kB1EyGK9DUukbg+qSifBDNx20=; b=B2N1hgaUiTd/Gp6dwmmC9AT3lk
 XGZjAipXXsuxnGiKorXhHn6+XEkZrug8GQbGMtVRn9Jj3sD/LpOZKaOBMUzX8YSZJKGTKW6Ith6rD
 TSLcFZTiolcjRtUAV+qxp/KwzxL81CelQCdikfosKz7jKTsJkUh00iTGh3GNhYxnXA5U=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jQiVs-007vHr-KR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Apr 2020 02:19:57 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B16F7405F9438133B0B2;
 Tue, 21 Apr 2020 10:19:40 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 21 Apr
 2020 10:19:38 +0800
To: <jaegeuk@kernel.org>
References: <20200415021313.95538-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <634e3958-ee48-90b1-f32f-60e2bc4ca88e@huawei.com>
Date: Tue, 21 Apr 2020 10:19:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200415021313.95538-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jQiVs-007vHr-KR
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid page count leak
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

Hi Jaegeuk,

Let's drop this patch, I encounter bad page state (nonzero refcount) reported
by vm w/ this patch.

On 2020/4/15 10:13, Chao Yu wrote:
> In f2fs_read_data_pages(), once we add page into radix tree, we need to
> release reference count of that page, however when f2fs_read_multi_pages()
> fails, we didn't handle that case correctly, fix it.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9833581327
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 09:29:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huXQf-0000uH-3w; Mon, 05 Aug 2019 07:29:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huXQe-0000u4-1n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UwzET2sxtPvuQO0KVGy6nUpoDlNNlwPQebXPo2Yeii0=; b=G5d05uiVtOSwNxuTPyH5JlPLf/
 Mpx512LGARfP5SWLOJxj1kO4SGlDo1O2xbcUIUJGwws/pbM5ljzpWxksZK4tMDCOzzsL5jlyskUI6
 6dH9GoyqfLrvYQBd7ENSBfNpbsNn5HxTevcDTb5TSB3/0wZ/KFi11Xm9p32fd9WQvJNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UwzET2sxtPvuQO0KVGy6nUpoDlNNlwPQebXPo2Yeii0=; b=nKp9O0MEEmxpjEmU8ygA2QZoMN
 mYujPfS56dQWyOoqgtiEgq0e6Sws2a6LuZXq2BdMX0rxDwn7oFLyqeuRxknLp/vGpLRv5JuVzn3d2
 d3LNLB7lAhUE5isqm00kGztvPzPpS7ACfYM0B+DbJrvcdzD7i8xW16Z3jdxakz9z6QFg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huXQc-00Au2y-1K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:29:12 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F122C95E763F130677A6;
 Mon,  5 Aug 2019 15:29:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019
 15:28:56 +0800
To: Lihong Kou <koulihong@huawei.com>, <jaegeuk@kernel.org>
References: <1564989981-104324-1-git-send-email-koulihong@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <084ee838-3e09-70b1-904e-9b2e78794b49@huawei.com>
Date: Mon, 5 Aug 2019 15:29:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1564989981-104324-1-git-send-email-koulihong@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huXQc-00Au2y-1K
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix the bug in reserve_new_block
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 fangwei1@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/5 15:26, Lihong Kou wrote:
> if we new node block in fsck flow, we need to update
> the valid_node_cnt at the same time.
> 
> Signed-off-by: Lihong Kou <koulihong@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

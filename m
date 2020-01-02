Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8C12E3B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2020 09:13:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imvc7-0008K4-Hs; Thu, 02 Jan 2020 08:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1imvc5-0008JF-34
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jan 2020 08:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gENIvXR9C7dNGVmwzfXimZ/7LAYM2dHb7H3JGSgNfBA=; b=ggNWYvKGzjuAtHQYefrxY9PEZt
 FV2wsirUzSy0u44Oq7iGvVYsnchpSxpLuoukylOgnvQxX8xxAI9yTubBKMIqcRmWROiqI1xVNjjU0
 f++qiG2gIa3U+zwYLzQ0N50VyPvz0XjLIIalj5h/odX2GNK40yNPQWwtJDTpvbXNxbsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gENIvXR9C7dNGVmwzfXimZ/7LAYM2dHb7H3JGSgNfBA=; b=mth/YWWCT29o2rd4asMdY6Y+Ey
 aSy91ohs/XYBAC6ztBqb2WU4END2LN/MvIUMQHjcJamStg1ENIXZaqy2M1Ru22xIQFdG+Wny+q21F
 8uB/k2yvh9gspytzLZN6ZxQ9wxx6EYkeq3z4aws0PwAgcXA/0zF0AXZQYcf68YIO6h90=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imvc3-006nal-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jan 2020 08:13:49 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0EB227A12EFA22B63D6C;
 Thu,  2 Jan 2020 16:13:38 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020
 16:13:36 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191231181456.47957-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d34f386f-437d-3564-745f-e8dd995bd2e6@huawei.com>
Date: Thu, 2 Jan 2020 16:13:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191231181456.47957-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1imvc3-006nal-Nd
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unneeded check for error
 allocating bio_post_read_ctx
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/1/1 2:14, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since allocating an object from a mempool never fails when
> __GFP_DIRECT_RECLAIM (which is included in GFP_NOFS) is set, the check
> for failure to allocate a bio_post_read_ctx is unnecessary.  Remove it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

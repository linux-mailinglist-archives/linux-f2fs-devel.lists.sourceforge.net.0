Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652192AFFF3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 07:57:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd6YM-00023Q-1a; Thu, 12 Nov 2020 06:57:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kd6YK-00023J-9x
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 06:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yL6Q11T32rKbSLFINtSC0Jx47hKoGRRO4rMIhccA//I=; b=WBcoYHkjmzGGCOMXMQNNGnhg/A
 VhAPMlcBjP9zh30aCL8GSETUmK41W2FyKc80ixmi5FMKw47a9U7nKoLd+qkSX3Y2nBnDVR11dvXPe
 hORvq6l/hfooPkOb9afp4rjpFgi/aLCtsj/Z2z/a4LlmvOZiPck5DV/0ljAKiqKAg71Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yL6Q11T32rKbSLFINtSC0Jx47hKoGRRO4rMIhccA//I=; b=Ig2CbL5Zy4DZDpx85ykYnhwEiX
 RBAA2e2CN4aa4yNlUCaQAkCRM5ucXVVlDOX8/iKnCknyOYlFd8ee7tm49sdvqlsSzFf2LS80eJdL/
 aDGopC7+PWMw2MsjFeuZZkHCXGOvz0kk9erYlrtsXNXtfFP9uuTf5/nxuVyOL3zhJqJo=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kd6Y4-008mYs-NX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 06:57:52 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWspy39nHzLxcb;
 Thu, 12 Nov 2020 14:57:14 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 12 Nov
 2020 14:57:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com> <20201112054051.GA4092972@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4aae85c2-1829-06c0-8fd1-4148100dc0b9@huawei.com>
Date: Thu, 12 Nov 2020 14:57:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201112054051.GA4092972@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kd6Y4-008mYs-NX
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/12 13:40, Jaegeuk Kim wrote:
> Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.
> 
> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v3:
>   - fix to use NM_I(sbi)
> 
>   fs/f2fs/shrinker.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index d66de5999a26..555712ba06d8 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
>   
>   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
>   {
> -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> +	long count;
> +
> +	down_read(&NM_I(sbi)->nat_tree_lock);
> +	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> +	up_read(&NM_I(sbi)->nat_tree_lock);
>   
>   	return count > 0 ? count : 0;

Minor thing,

Just return count is enough? since count should never be smaller than 0.

Anyway,

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

Thanks,

>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

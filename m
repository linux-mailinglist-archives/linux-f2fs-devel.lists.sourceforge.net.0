Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248F5ADDCC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 05:10:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVOyi-0002G7-DC;
	Tue, 06 Sep 2022 03:10:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVOyc-0002Fx-Dj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 03:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WXLlGUzDaadil2v42Ao6FwKQHjKhm7AMkdofWvWOEBQ=; b=ecc6h91pu/k6WpG1CJJZyot26u
 akwqX2V3gkZ4ILCt9RCxgNbhHLm+ZqDjTzT8YjSZzD3CvAbaW3LS+9PhNwKfnCFH8IP0kR/Ce9Bsk
 539nLF5FB7Bmv0aSRhmCt/0n/Veyp8hrPoLw3RpTJsTnROe5Sx67y6vbClnaU9NiwNA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WXLlGUzDaadil2v42Ao6FwKQHjKhm7AMkdofWvWOEBQ=; b=IrFiileIa9Z2nchJ5QqSOVO1nJ
 0nGyIUnbP5nX7ezL6xuNXN9no6SzMP8iCo3zeHBVljLmpmk76ZoVvLiEd0Fdg7u9J2nTQWopPqkap
 jc3I3o/Rqr7kRLG0rRTB+70fJinLZo/M0rB1Z81Wn/39+A7Bmt4cjB3x1xbkWbPASPXk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVOyb-00GsKY-L1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 03:10:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6402AB81603;
 Tue,  6 Sep 2022 03:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653E4C433C1;
 Tue,  6 Sep 2022 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662433806;
 bh=ARusBGZFU3E/QMas/4NlWaL/WDNIEgrvqoGlXde6Eb8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IqA3DE3IdKxh+hI4fsDBamxcbXnNLA3T63Ce7DC5IAeQEYvcjJ+tWR9umVK6HdFEI
 E6tdgFyG44fGEEnZaUSnKabQXZ18HFBm//oenxvxarAu3eDtNx7qjR1NWEvKCLxeYi
 jjkxJBxZJFv22F7QE9LmpJX5WBZ6ltCD2Jq/9UswdRzAv+zH9dXl/umwiVIexv85Q2
 XUqWBVRDVabWWnZJ6q/Zy5c5++GuRtTHBkDJq7KFLyShfO4a8mz8lfhB2ciR1Nm/ER
 P5wdzr7V/GeXQ1gmu5ngYyYNu50uYBCKr919Y+N7Jr/uG9S5mX9OR25rLrop9rXS2S
 jC1PdVIz8ZC/Q==
Message-ID: <6813adb8-73c4-0fd7-5ee4-a1d4a97e6552@kernel.org>
Date: Tue, 6 Sep 2022 11:10:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220905141225.26456-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220905141225.26456-1-zhangqilong3@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/5 22:12,
 Zhang Qilong wrote: > We should not increase
 total hit count when not > found the entry in cache extent tree. Remove the
 > stat_inc_total_hit when f2fs_lookup_rb_tree returns > null [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVOyb-00GsKY-L1
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: total hit count should only be
 increased when entry found
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/5 22:12, Zhang Qilong wrote:
> We should not increase total hit count when not
> found the entry in cache extent tree. Remove the
> stat_inc_total_hit when f2fs_lookup_rb_tree returns
> nullptr.

Actually, f2fs will account total lookup count into sbi->total_hit_ext.

Thanks,

> 
> Fixes:54c2258cd63a8 ("f2fs: extract rb-tree operation infrastructure")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   fs/f2fs/extent_cache.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 866e72b29bd5..264682eebcd1 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -426,6 +426,7 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>   		*ei = et->largest;
>   		ret = true;
>   		stat_inc_largest_node_hit(sbi);
> +		stat_inc_total_hit(sbi);
>   		goto out;
>   	}
>   
> @@ -447,8 +448,8 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>   	}
>   	spin_unlock(&sbi->extent_lock);
>   	ret = true;
> -out:
>   	stat_inc_total_hit(sbi);
> +out:
>   	read_unlock(&et->lock);
>   
>   	trace_f2fs_lookup_extent_tree_end(inode, pgofs, ei);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

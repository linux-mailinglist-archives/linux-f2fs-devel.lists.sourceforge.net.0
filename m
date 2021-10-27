Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9743C181
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 06:32:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfabr-0002Vj-EV; Wed, 27 Oct 2021 04:32:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mfabj-0002VK-S3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 04:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fV6JEg0SUU8x8gBw+RT8Xw1XKhVHLePwQz3/ZStNMCY=; b=jTxR+i/9TO4UqmgB8Mt/S9urCz
 PCr+E/6E6K6mor/ga9SG/bGo7xh7PoEZEEsAYClwRL9/GtycHaho0gXuwuv+qHPe9rMmQDxZe75JE
 YwiVncmDThFJiJLKmPJ5apm5SLmUbTS0hjYdgT2UQm/I1o4uBwyxkhCw6gztfy1zBZec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fV6JEg0SUU8x8gBw+RT8Xw1XKhVHLePwQz3/ZStNMCY=; b=aunTk6NFH9DWq3oRaknGAz15jj
 KLb8HEVlY0TmLsrVtYR7hLwJIQeDlx53Zy8NqbW3wLKArVCee6JDPVd+LO9CtLyoWvQJ5yWD4bhEI
 9WFwrAR5b+y634mTP8jNf4/nWT0l1pKkfb1BtA1FOEijgLVzM6pl6IAhi9lbhxrWAfgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfaVu-000gCN-1z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 04:32:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D4636109E;
 Wed, 27 Oct 2021 04:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635308764;
 bh=W6FMTI2VwUiwDEPf2lg4qjV7hDXEBWma0uo+TjtD/TA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ju+eaB8MDCIW6dFF1lewvAl3MLkwdYqpsQToGXqAoce7iU4OJlTxXse8Cw7CvLS0O
 s1eByC/ap9dH5t2H4brMhk+GqaSwB/tnVzRHV3hPnBiHHrJ4MYx7naQpvWzG2qCSOv
 vvCzHPCGySXaNMXqWitPZ5bTsI9Au/PeiSJhSN6Guzb9UGSoRaAUU9UcSdHFQR+5gj
 9TP2dp9s5K+6OcxdSsFtp1ks9sZlFDnvUaE5cBQQfEUqjLPwcAhUA8uHCKFq56mm6B
 /Pouo/edi8ZIVnXL936pQi6ZRPscD+65DS2MrsPzWHHZaBI6Sc53uDQrqx+YlXhLbq
 aZk+fgQVRLtpQ==
Message-ID: <3be80c98-f637-c5a5-929f-1ddc1994c7bc@kernel.org>
Date: Wed, 27 Oct 2021 12:26:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Hyeong-Jun Kim <hj514.kim@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20211027041606epcas1p237acb5e258066f2298f3fee162baffe4@epcas1p2.samsung.com>
 <20211027041600.115847-1-hj514.kim@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211027041600.115847-1-hj514.kim@samsung.com>
X-Headers-End: 1mfaVu-000gCN-1z
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: disallow disabling
 compress on non-empty compressed file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/27 12:16, Hyeong-Jun Kim wrote:
> Compresse file and normal file has differ in i_addr addressing,
> specifically addrs per inode/block. So, we will face data loss, if we
> disable the compression flag on non-empty files. Therefore we should
> disallow not only enabling but disabling the compression flag on
> non-empty files.
> 
> ---
> v2:
>   - check F2FS_HAS_BLOCKS() instead of i_size
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
> Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

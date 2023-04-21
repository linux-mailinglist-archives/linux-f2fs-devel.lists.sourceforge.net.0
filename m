Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA76EA1A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Apr 2023 04:27:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppgV5-0001tA-JU;
	Fri, 21 Apr 2023 02:27:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ppgV3-0001t3-QN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t22ScnYpBokj9ojDW/WikY0ZsFUaqg4/R7CBjHvxTv8=; b=aNMZ9e0zF08QExnSbWN/gmsDqL
 bAPY9NpWlcQL4zBPOE6Zxy445u7rXjTHaCDQzyCybqVFP5N4NssrV4mr8A2AicRGIx0i0ISIhV7sW
 lcT4lqt4ChZ0j9CX4ufS/yYY4bG0/aCpnTcygXVFm2I2JtYMQuuh2tjqSWinwqkRiuB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t22ScnYpBokj9ojDW/WikY0ZsFUaqg4/R7CBjHvxTv8=; b=RYYOrbiHpfD0urfCj78L/FTGfQ
 JfF1vGRme5nKkai/qDzPbExT1ThTz2iGOx/QAWWiVcmYSqo8WOjYNJ4ITaqJVrAMau/xAsCR4W1Bp
 CqM0OyvbavYt9JSqMn71y31227O7fw/uSHe98bFlPXXk0f6jG7NH6LozfIg4Vdvc1OUk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppgV3-0005fn-SE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:27:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47B2B626D3;
 Fri, 21 Apr 2023 02:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8479AC433D2;
 Fri, 21 Apr 2023 02:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682044063;
 bh=4JEobs9Do9ZCkbJdX/Ov15UlPaXoUmhwg2v+lomPIJo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gXW8xqMdV47iMCXEZz+YfCuUmAFLSbLmryBulhPqWwkmSauttA/Ih38W/tkOOBEHF
 AVyJeHl0/fPywnEa5i52bmm6L0XYm6zFtrTmq23pFZ2B189fzXr33YZfVVCElga4lO
 TPnFIyRhfa+LTsQ+3pZ7yx4ySmdHV+OQgQKyQagm1jLCTGwURxijfih18dFbo8MS8t
 OFcmGj8nFJ/+3ko4YUadov8QK/rpSVd1eeQxMvXDJEgsgzeAom8oWYRFR7xhOK5yNm
 E/gJzTegvZIGmJKvuf6jKciPuhmhl83QGJ8XexGTxC+YgGgzIlxY4p+NQZfMdiH59z
 qBreWDc5otN/g==
Message-ID: <b031f528-f3dd-44ed-5370-2133a74f9332@kernel.org>
Date: Fri, 21 Apr 2023 10:27:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20230418060954.67585-1-hanqi@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230418060954.67585-1-hanqi@vivo.com>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/18 14:09,
 Qi Han wrote: > This comment make no sense
 and is in the wrong place, so let's > remove it. > > Signed-off-by: Qi Han
 <hanqi@vivo.com> > --- > fs/f2fs/extent_cache.c | 1 - > 1 file [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppgV3-0005fn-SE
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnessary comment in
 __may_age_extent_tree
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/18 14:09, Qi Han wrote:
> This comment make no sense and is in the wrong place, so let's
> remove it.
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>   fs/f2fs/extent_cache.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 28b12553f2b3..1f6d7de35794 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -86,7 +86,6 @@ static bool __may_age_extent_tree(struct inode *inode)
>   
>   	if (!test_opt(sbi, AGE_EXTENT_CACHE))
>   		return false;
> -	/* don't cache block age info for cold file */
>   	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
>   		return false;

Should move it here instead of removal?

/* don't cache block age info for cold file */

>   	if (file_is_cold(inode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

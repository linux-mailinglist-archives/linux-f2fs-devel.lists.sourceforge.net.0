Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAC688917
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 22:37:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNhHC-00055X-RI;
	Thu, 02 Feb 2023 21:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pNhHB-00055R-O2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 21:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vvsPpDexEbjdzkA7udTDuou+1RuNAMFghEoZFLdEIGw=; b=NY9WhdoeHt/3qTEBMZjgOCE0zU
 T7LCy8Irr//RIFGHIhww6cVmuDbaJkZi1jqNubH6SzNdVpXRaElAs8Z2d+8IPGOea3MKAHF+F36Yp
 fERNyV2kmbrVxEayKeMzupzAcPgTLTJ2CEbCHPVTGAftyO2DINJ8o1Ce4y7d9aSiuvB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vvsPpDexEbjdzkA7udTDuou+1RuNAMFghEoZFLdEIGw=; b=VxY0B7pPb+dbOlxJxm7CZKY6Lm
 +quw9xqt6y0+6RxyGcPxo23bZsFZOcdJXRpA1qNy1tQbtKh1rqOgHz+77DU1CvXhvrUOQWSp0Wc/C
 zMD+zHfb4YYuTXMxZTfLUx+buwiRx/PyD79aPSD+sMgqwDczM/je3AQKYnNeA7RtydQI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNhH9-0004VO-JW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 21:37:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2BBA61AE1;
 Thu,  2 Feb 2023 21:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F681C433EF;
 Thu,  2 Feb 2023 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675373862;
 bh=4cVW0pF3Gfk6OF+q0A6GKMQlL2THp6YtVURHn69CPBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SRsvuq55hfL03VYVA9S9YE+VfRBHLpk2CfF9wKACPRpKF3tQ+frwMMXoEaIK5hnVu
 kew2anHFrK4Xgze4s2QqKHXwWJmrCQ1bs8RTUrkY6t9uzAXabw/ckrBJDll7UILIQY
 JEBZ3tyeAf3gpduFriQoepjZ8mJ4f25+hMKG409AI04byx77gXCmBLDqRRzxrykhfM
 gTTgSyqTQjAVcdwRYqNfIkAo9ozHsyKJi5DwpSDAzVqVG2+bHzCFAjdYQYti4k1GzZ
 qPQedKQgS7z8mn9SXtiMN+xMPkUNKRfgYm+p5GrBlCQ9n/HreLcn1jTufmfu0YKFr6
 ccDmZM93qXC9Q==
Date: Thu, 2 Feb 2023 13:37:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Message-ID: <Y9wtJLVjx9jmBxzZ@google.com>
References: <20230202010111.69078-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202010111.69078-1-yang.lee@linux.alibaba.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, but applied the fix in the original patch. On 02/02, 
 Yang Li wrote: > ./fs/f2fs/checkpoint.c:1485:55-56: Unneeded semicolon >
 > Reported-by: Abaci Robot <abaci@linux.alibaba.com> > Link:
 https://bugzilla.openanolis.cn/show_bug.cgi?id=3925 > Si [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNhH9-0004VO-JW
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Remove unneeded semicolon
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, but applied the fix in the original patch.

On 02/02, Yang Li wrote:
> ./fs/f2fs/checkpoint.c:1485:55-56: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3925
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/f2fs/checkpoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index b1b39c17f2d8..b7ef8cd10b10 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1482,7 +1482,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
>  		struct curseg_info *curseg = CURSEG_I(sbi, i + CURSEG_HOT_DATA);
>  
> -		ckpt->cur_data_segno[i] = cpu_to_le32(curseg->segno);;
> +		ckpt->cur_data_segno[i] = cpu_to_le32(curseg->segno);
>  		ckpt->cur_data_blkoff[i] = cpu_to_le16(curseg->next_blkoff);
>  		ckpt->alloc_type[i + CURSEG_HOT_DATA] = curseg->alloc_type;
>  	}
> -- 
> 2.20.1.7.g153144c


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

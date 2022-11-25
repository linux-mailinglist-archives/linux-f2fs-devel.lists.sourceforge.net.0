Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 696316382C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Nov 2022 04:36:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyPVx-0002Jj-Rh;
	Fri, 25 Nov 2022 03:36:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oyPVv-0002Jc-Nj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f0LjV9FzsxIjl8BBgAmsWZF5+ijsH7PMUknKWmygCc8=; b=WLWdyjKg9LX5mRNyCJDXG1wwPr
 lui37u0DUzg5OaGOcQLe4zjkGFS35ElouoZBDeg2xq139hCmgDuaS266rKS4VRNJi3HuPDwu9/3p5
 ad12QK4RuUipB//PEDKvxM5hl0KythUuPHqJ9+RErpPgaHpJ7Esc49m6GS28rOdl+tog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f0LjV9FzsxIjl8BBgAmsWZF5+ijsH7PMUknKWmygCc8=; b=FqAfN6l2w2IH5ic0OSivtGn9BR
 RfBpDwvFOPge+ZqIEOJg7y3tmySI/Zpebpmvp04hHVMeG5GQc0JKDNgqK1fRqVlYyZxUnL84p/sH+
 Uwr/w0zeP1KC91AMROi5vQOLx2/n7JWmFOJCn+WWac7v6aZDyeYGWrTdxizYY8CAJsAQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyPVv-007D9X-2p for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:36:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2DC5B82422;
 Fri, 25 Nov 2022 03:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1292CC433C1;
 Fri, 25 Nov 2022 03:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669347378;
 bh=wKWPk4v8fe90jffTIHyQjUbwPtVaGLxqGFEpI0P7wnE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YTqZbNiRd4JIWn0K8jzRIqEDGOkfDpOe3H7Mh1qixAiAm+8XzeAOmWoqz4YaQxk+L
 bN0908UoIcr3RNueemlQyVj6OYnR2g0a++qQzBUNzvlypbC/CQDTwawvHAsZmbZy7o
 eGz8b8YIftg2Jn7zN0Ia872itxFTG+7H4mx1HT6aCaTaLEemm30HaTGMmUnFhdT5OG
 iBFvoiplRvGL2GTEe1MJAnzmn5X6IKVEcqgnNy3ionyb8mgAN5ov/Ao3YTHpOU3wyn
 qY7P6trgGmIJofxRtN0esLJNrvLfLE61VfiycElQf94+/xSeFvFjSObSDwQqk9cQ1A
 Yy1unQXoyXl5g==
Message-ID: <6bce9afb-2561-7937-caea-8aadaa5a21cd@kernel.org>
Date: Fri, 25 Nov 2022 11:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
References: <20221028175807.55495-1-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221028175807.55495-1-ebiggers@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/29 1:58, Eric Biggers wrote: > @@ -116, 43 +116,
 51
 @@ struct bio_post_read_ctx { > struct f2fs_sb_info *sbi; > struct work_struct
 work; > unsigned int enabled_steps; > + bool decompression_a [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyPVv-007D9X-2p
Subject: Re: [f2fs-dev] [PATCH v3] fsverity: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/29 1:58, Eric Biggers wrote:
> @@ -116,43 +116,51 @@ struct bio_post_read_ctx {
>   	struct f2fs_sb_info *sbi;
>   	struct work_struct work;
>   	unsigned int enabled_steps;
> +	bool decompression_attempted;

How about adding some comments for decompression_attempted? Otherwise it
looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5229F5EC9C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Sep 2022 18:41:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odDeB-0007y3-Ki;
	Tue, 27 Sep 2022 16:41:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1odDe3-0007xr-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Sep 2022 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhRPwVkbgGGVtEU5AVm39A+jRSlvTPu3jA4zpNbXZ9M=; b=ftrU8FB1bG00XrTxIM2mgEk8cc
 xQkUoJuwVOCeZphZjvKRwYxqJTWElpI19MWYIZ9DOx15Cxw0cIorppGPLnlUrENXWUzsC0e+DcpAg
 UM/JPjDNM5cZdOpHbcwEQ1tzi2pzny1OnVd7UI4lB69CT8y28b+fk3txOmxKv+B1bqgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhRPwVkbgGGVtEU5AVm39A+jRSlvTPu3jA4zpNbXZ9M=; b=Sww5WNOjYVf/nyflb7YBnQQlcz
 UM2QJXioJgK/dzlYuXAhl3Q7Jjwpe/rhK2ROUGBmwYE/atJFhy72aFmhA5UVTscIC03/42jG4Fw54
 0nPB9r8yR3qEiT5pdhn+cVw+XjBIToIsbUfYW6cdA06rcafKCUmN2gaqq64dciIeSmLw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odDdw-004gxv-5a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Sep 2022 16:41:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF59A61715
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Sep 2022 16:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539FDC433D6;
 Tue, 27 Sep 2022 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664296861;
 bh=ldplT7mVCN8GP6EcdKDWKnTwfSkGaFmCBBFAOWybP+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L4aEPzXurg67B6V+fOcqGV7gDlZRubJ4tJ3Mxy9zhS7VrD7l5pvNiESbp/QCcXLGB
 0TvkQvn0Vm7CN/B8ylXS7OTPoR7S8LT8pNCwIRsuIf5wKBubmJhj/T1T/jTka3P2x4
 pGEfiSUrG1rSdDA1tUJmxWTcOCmY1xYW6p3ZRL/icWoDHtzn5hQy/ZRuE267crx7vc
 MED81JX03JYGHXihkW41tUUya6wTBJj0AwHudARND+LR37zb29aiT81bBdqVj7Xtci
 KnRhpa8+7bz1Wet8n2l2GimEqir5ni0w5Y4Id8gWW2zVF8bjTX1I45Gug7cX2bjUC0
 5kkWGxBG1tITg==
Date: Tue, 27 Sep 2022 09:40:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YzMnm4vx7dxb+vAA@google.com>
References: <20220925055802.11955-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925055802.11955-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/25, Chao Yu wrote: > Update allocation policy for ro
 feature: > - hot_data: allocating blocks by LBA ascending order > - hot_node:
 allocating blocks by LBA descending order This will increase the RO image
 size. Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odDdw-004gxv-5a
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/25, Chao Yu wrote:
> Update allocation policy for ro feature:
> - hot_data: allocating blocks by LBA ascending order
> - hot_node: allocating blocks by LBA descending order

This will increase the RO image size.

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  mkfs/f2fs_format.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 40ac589..8d0f410 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
>  	}
>  
>  	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
> +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
>  		c.cur_seg[CURSEG_WARM_NODE] = 0;
>  		c.cur_seg[CURSEG_COLD_NODE] = 0;
> -		c.cur_seg[CURSEG_HOT_DATA] = 1;
> +		c.cur_seg[CURSEG_HOT_DATA] = 0;
>  		c.cur_seg[CURSEG_COLD_DATA] = 0;
>  		c.cur_seg[CURSEG_WARM_DATA] = 0;
>  	} else if (c.heap) {
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

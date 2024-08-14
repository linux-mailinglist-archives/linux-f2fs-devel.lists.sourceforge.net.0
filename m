Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E9951F88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 18:11:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seGat-0005v8-5G;
	Wed, 14 Aug 2024 16:11:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1seGar-0005uv-Jd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 16:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttHVR81s8V5FJXhjBCaFKOlG2dYtSJNrEYskkluvMno=; b=MNtexMeIrAzP07wIqels1eTM/9
 veNEHv+FVZuGO1zuU1ahDGx/K2mob0KDaHSsQcFJD6SbRQgwCvZaymV2FRM2FmzyVGugXakLKxl/m
 RffzDQ+a9CwNPDNMl9IQa1V5aTHUVaaen+saiYpmXgb8k35Cs/hC18Enerfr9syNFayw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ttHVR81s8V5FJXhjBCaFKOlG2dYtSJNrEYskkluvMno=; b=Fxk4hyvp2XgEdk3c6lD+HgRc+u
 0YWvmx6ufjNHXN5y2rWLH/n8rRs7P/ngRsv5wHgJo+63J/IRWxjEubgtsL6oDbWe4W7K7qSUYIm2c
 BO9Gd5G6Fdsh//T5TVYsgIdoL16kJckDuP2wYKFpRrmeXa0pwLFAgMLrqwXUnH12kP5o=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seGaq-0004ts-Qq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 16:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 103E4CE1A1F;
 Wed, 14 Aug 2024 16:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E49C4AF0A;
 Wed, 14 Aug 2024 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723651876;
 bh=xQGMhe8UU3rB9hjtZ+6qhiVkVFT1Lntea1bjy2W26PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWJ8FVhjuOhdC/3vSOh/Df4f7fSyTrX56EDo/GnQ5aG3I5GTX9apy2OKS5qW0xWuq
 7Ft5efvuhWnVyt2ZpOPfBiIJDj1na5td3h4ju9lAwEC67dBuewXM3F3T4VmaAy4Glj
 s+moWgzvN56CPZ96HJXrISNMbTTFxTJFY0SjbShwpOLJ2HgNRZSsMzsTR/NDI7n8D+
 d7NQAms64qgsHv1OZsEysfTg2BAGcqZs1eYse1L6thFndfmftn6RzwfXosHXUwxhZT
 gwy/yvzz8tIcKwlVhc9ZdRHeQG5gMAzZ544/c3tPhnka4W5WcZiPXQmuWakTEsSXmV
 fCmCBb5fTg/Hg==
Date: Wed, 14 Aug 2024 16:11:14 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZrzXIlJvWsOu2IIP@google.com>
References: <0afb817e75a84859e1a86e1a7ba2041a9b852b6e.1723117820.git.christophe.jaillet@wanadoo.fr>
 <99199c2a-1dbf-439c-ad24-68ed8844e096@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99199c2a-1dbf-439c-ad24-68ed8844e096@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Sorry, could you please post the patch to the mailing list
 again? I don't see the first patch. Thanks, On 08/14, Chao Yu wrote: > On
 2024/8/8 19:50,
 Christophe JAILLET wrote: > > This file already uses sysfs_emit().
 So be consistent and also use > > sysfs_emit_at(). > > > > This slightly
 simplifies the [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seGaq-0004ts-Qq
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use sysfs_emit_at() to simplify code
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry, could you please post the patch to the mailing list again?
I don't see the first patch.

Thanks,

On 08/14, Chao Yu wrote:
> On 2024/8/8 19:50, Christophe JAILLET wrote:
> > This file already uses sysfs_emit(). So be consistent and also use
> > sysfs_emit_at().
> > 
> > This slightly simplifies the code and makes it more readable.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

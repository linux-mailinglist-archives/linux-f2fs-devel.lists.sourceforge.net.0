Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2FA2E8A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 11:06:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thQgA-0002sA-4C;
	Mon, 10 Feb 2025 10:06:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thQg8-0002ry-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zh0hPKaFioJKBXfvS2O0P+W39XoCgedqOEET5BeByHo=; b=G5qk0WwgS17s6URYF1eoIo3ott
 EyoqyqYQ2NyC7cIwq3cGy4lPyBeRY1eWyRY2IZaQmtxZsebpRnJPyKpf0D8c0S1xnEhniWtIehAd1
 eYXGQtk/AEcW+T7FVTBfxQP+/e4tPWA0vLXvvGq5QgXNff4ipHTr07QVWqhHO/gT51uU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zh0hPKaFioJKBXfvS2O0P+W39XoCgedqOEET5BeByHo=; b=PYjt32ElAyTmBsb8aXAOIavC6v
 KmJh+YggT4/kXjSpH7fONl6SaRNrjMj+2m2oRpktpBJCyu07OuundXGqpV2fHDgHUaBrq47zbtdNq
 rtsTAyWrQNC2Lzbi99/vhWUBfpGdAjgDkwZ8pI75dvr2TPrigzETATeSsdeHjbKCldbQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thQg8-0002bu-PF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C77D25C4954;
 Mon, 10 Feb 2025 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CCAC4CEE4;
 Mon, 10 Feb 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739181962;
 bh=lF71qqCebU1OJC3HnOGdjiCKxuuDaM0gULKXsGw1eDw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dJ97+4SvIxmFfust64zmMcq2g3/KFZNFJQ1f7zV1y30VlqgOiSjcfUNox+6+06tMw
 y1+Lr/zTB32GR2K89Vjzf8I+Gkeaw8bE9/7qnUrDaJXXnUhlFiEoTTUt+sUuvMoJb4
 40uT/+pY/cQXPneOMBDpiUgjFm16tRXoQZAUqF0CqJ4KKextTufrXAIVlQq/gdKidf
 M21ON/6KGY87sx+s9SafR4T9In7LuSYN7jigIMsTkPEF9a+IPRVI8YIGP0nM0oquR5
 ZFRj8tv0YS2Ll0A8NTfrJZY7b7OUq3+M2oXK4f4xeZSwGEbE/FzZZD3N3xh2xHQYH3
 7wm+wNUkKWq4g==
Message-ID: <5a1b2716-bcc4-4a5e-95ce-ba45f508738d@kernel.org>
Date: Mon, 10 Feb 2025 18:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/10/25 09:24,
 Zhiguo Niu wrote: > Quoted from include/linux/shrinker.h
 > "count_objects should return the number of freeable items in the cache.
 If > there are no objects to free, it should return [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thQg8-0002bu-PF
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return SHRINK_EMPTY if no
 objects to free
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/10/25 09:24, Zhiguo Niu wrote:
> Quoted from include/linux/shrinker.h
> "count_objects should return the number of freeable items in the cache. If
>  there are no objects to free, it should return SHRINK_EMPTY, while 0 is
>  returned in cases of the number of freeable items cannot be determined
>  or shrinker should skip this cache for this time (e.g., their number
>  is below shrinkable limit)."

Seems in 9b996468cfdb ("mm: add SHRINK_EMPTY shrinker methods return
value"), it didn't convert most of filesystems, left most filesystems
to return 0 which indicate there may have objects to free. :(

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

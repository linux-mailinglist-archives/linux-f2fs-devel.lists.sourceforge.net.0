Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6091A3355E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 03:14:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tiOkE-0004jH-59;
	Thu, 13 Feb 2025 02:14:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tiOkA-0004j7-Sh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 02:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jq17jbaGvSMcTppYtuvysWPC6jhLnw+/2ECNz+Mz1Ds=; b=RFrXtCZsnO1uKqukCKm/39494O
 pO68IOmZ6Rk+DyuYJJVTRnoER4F79M15nyEFsgyL+kIqhqFEUIrn7GvVQXkEQ/5KTDnCtdnjd65uL
 FDYJkhlRB0vmUW/Mh7zWp5cEjYDj/FZE+55qB2ANffQSuxBW8jrr0yfNE/iBPWm2xxVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jq17jbaGvSMcTppYtuvysWPC6jhLnw+/2ECNz+Mz1Ds=; b=gwEeFejl5pXbW5Utx3fqoNuULZ
 yK3jJ3Vgv/W9iZAUjHLfLvamVEDhz4qkjighMnpF4nLuProE+NeuZK/ZyO35pTiqBgt035Xc4TbJQ
 jzuAvdJVM49Yul5ICHOBXNgnZkQbL7mjKJbllPsmTmBLeY0GmcYUhmC6b0mQzEHkbCag=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tiOkA-0000ru-8R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 02:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3987BA41D43
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Feb 2025 02:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D1FC4CEDF;
 Thu, 13 Feb 2025 02:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739412851;
 bh=ohLSi/xTAB57E3Fe+Ym33qoPhEUA1qI0MT8j52SHnIM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=O6f4BGoRxNTIhto9J2pYBNgD5ggA8E76VUga00kIRJF+em9Gdf6UPM/0clrlXyNna
 7iyunY8Wjd+aVzn1FEIWokaGWkaS4Id8JHCWh5lXHx/1RmPkp/ldvXjLgjs/HyrrNZ
 J+jiyuTLdwEtwxcJ3f0juc/0AcKBlj+AQdhVm8h/yidjPBBYJYZZ9lZdBRRG174Z0f
 SM1Nl+u6/f//7IdNPQY9CCtcf2TgZZxiqnchWzUB20iNH1U9mGT5zXyQmdF6OGxEPI
 Br/L1bXbE70qY0agcP97In5XuetUpn8AfH+yACGfXqoWUnSvPoFmPuQtFnHSlKSSAk
 yc9kKgM9RF1VQ==
Message-ID: <38967011-91d2-44f6-92e8-350dcdbc59c0@kernel.org>
Date: Thu, 13 Feb 2025 10:14:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250212023518.897942-1-jaegeuk@kernel.org>
 <20250212023518.897942-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250212023518.897942-2-jaegeuk@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/12/25 10:31, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch records POSIX_FADV_NOREUSE ranges for users to reclaim the caches
 > instantly off from LRU. > > Signed-off-by: Jaegeuk Kim <jaege [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tiOkA-0000ru-8R
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: keep POSIX_FADV_NOREUSE ranges
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/12/25 10:31, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch records POSIX_FADV_NOREUSE ranges for users to reclaim the caches
> instantly off from LRU.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

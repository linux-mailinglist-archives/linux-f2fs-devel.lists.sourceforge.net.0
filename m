Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79514A4F3AC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 02:28:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpdYl-0006yw-R1;
	Wed, 05 Mar 2025 01:28:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpdYk-0006yq-Ms
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 01:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B8vQx7t5SSA15mdlywGOVzt35ay+HhI0VvqStWkzfFY=; b=UbwfjmARm+5i/ttW3vDMjLLG1r
 2CaUoX1HwPbi8YRpJVqnvBhNlhoimnJShKJA52xcYC1aJ3wnHQcgfc/BHvDhAHMGpJ36gHzQiVLdi
 8nVZZOMhAyMwcVoul4x1lOLJqedJZvsic3nJa7Kh/AqHpc7+0oEafdny76D+0kZLvK50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B8vQx7t5SSA15mdlywGOVzt35ay+HhI0VvqStWkzfFY=; b=KIGD3DIFvkZe11ZuBAtuthUni+
 peliSNufh0tVAST1Dg8+7T4Pu5yFLt6OH+dZxTU3XFbo98ZhJ9TiJCC60kPGklSC+MHn/CZXNTS2O
 /HNp9baiXyJgiybQSMGo3JEHsgCHhGorRJjrU679dtueAWi78fKMcRF78pfOVHYEtEaI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpdYa-00053O-JF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 01:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FA9D5C6542
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 01:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FAAC4CEE5;
 Wed,  5 Mar 2025 01:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741138089;
 bh=mcZze2u74MXu/QKPWzlCV749STbpGtWemD1JsiX7HZc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gzR2eGLnohYIbPa5fIjXgemiz/mLR54rOkagkqljQsJc6ezXs6ZRqXFiHO+VpnMrw
 83LRq13BksbfT2tisnQJBolenDhgSlf/ij5yaP9UnAJkojmgQV7CjCdxL+BEzUBZQh
 1z/2Le1jaUL9eDeb86omEh3Tiw9LOnnJk+CutVh/i8siDwhqK4dccDc9vUVXnp+6cz
 GEIAp+8rpevZd8OegOzvR4wW1L2EsOkxuK+9mncdbS4+Qt+gn9d8//T2bBbCAUkhk+
 Dfqxs7lNNO58LMlsYgOYV2+vY1PhXM1ps4Ez2v9OeVm64sm1Ijf2u2nRzRiem/lyAB
 ji+okoSYtD6ig==
Message-ID: <ae938b41-f417-4152-b2d4-e66936767dd5@kernel.org>
Date: Wed, 5 Mar 2025 09:28:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250303221730.1284822-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250303221730.1284822-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 06:17, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 The checkpoint is the top priority thread which can stop all the filesystem
 > operations. Let's make it RT priority. > > Signed-off-by: Jaege [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpdYa-00053O-JF
Subject: Re: [f2fs-dev] [PATCH] f2fs: set highest IO priority for checkpoint
 thread
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

On 3/4/25 06:17, Jaegeuk Kim via Linux-f2fs-devel wrote:
> The checkpoint is the top priority thread which can stop all the filesystem
> operations. Let's make it RT priority.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

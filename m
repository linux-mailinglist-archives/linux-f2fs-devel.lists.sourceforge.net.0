Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9393BAC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 04:27:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWoCj-0003Nl-DR;
	Thu, 25 Jul 2024 02:27:40 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWoCh-0003Mz-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3fI6TqQxycGIeoQAjJLLfLDqtmtA7Yu8KN8MQbphCU=; b=hSnEwLu8XFCW3Sesb+uO6Q2xaE
 MLPecEv4/XnMNggmw36KSIQ7D12bAjkDbizBfyKz3CVo5eAuuB9+1SB+QtE4vZ8GyHowna6r9kSO9
 2XYClM0Wp4saRdB2wOsPGq8NVi6+6Osi7u2JmvcsgvJN9vM8Hhx47Qy7pT3rbpmlgheo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T3fI6TqQxycGIeoQAjJLLfLDqtmtA7Yu8KN8MQbphCU=; b=HbfM8cZs/US0DN4tgE7V3yxPMp
 ADNBu8ECbChE+vZ3NuMiZr9pnTWLtB20XftrvSoz12x2wAtpMul75oluOYmnUMP7tuuLk+fnS2S/p
 jW1mZmeD8GBa+rxZSagw0xQLVzg7htFAt0rBmvvJVhy5sRR1TNl9oXY6mR6TVs766fqQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWoCg-0001qe-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 02:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F0E8CE12D3;
 Thu, 25 Jul 2024 02:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4FDC32781;
 Thu, 25 Jul 2024 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721874445;
 bh=kNZZUjiISVXnsHLB4RLDf56DWiyV21sWDSBo4H3DL/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VZ7XxloHqxUTCNrxdmqUdZVWY/jL3gCf0PJsvxxv5SLm6fO3yFBeLe+dWaBuOZ8X7
 7GOCXkWl4AXXu0ufD4SvjySLNPBS0MYpF19qn5xSjhHnm4Ca6vmP4nbMTVtzL3g2Cd
 wtnjV05N2bdnIqfGWw6agMXmMZFW2C4if+c23VOLxTSAlskSDJziUvY5cC25zrXV79
 KneGYTjMJlUt9cDAwLIoiDZ8B3tPeR2bE1g2bf4xyV1cDQ48W1Pi6W17eyaVKRsbYM
 S0FmnH9X7DL2Phul9M3jI3auTwsmDFuZOzTRx7iKnJaqy7smuor5v+ZABx4xRUU4G/
 fbzVPNtKOZBwg==
Message-ID: <3b48c240-6a04-44bd-8672-ae2d3acd032e@kernel.org>
Date: Thu, 25 Jul 2024 10:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240723211157.27618-1-drosen@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240723211157.27618-1-drosen@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/24 5:11, Daniel Rosenberg wrote: > Previously,
 dumped
 symlinks would always create regular files instead. > This allows symlinks
 to be dumped as symlinks with the -L option. > > The i_name f [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWoCg-0001qe-4Z
Subject: Re: [f2fs-dev] [PATCH v3] dump.f2fs: Dump symlinks as symlinks
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/24 5:11, Daniel Rosenberg wrote:
> Previously, dumped symlinks would always create regular files instead.
> This allows symlinks to be dumped as symlinks with the -L option.
> 
> The i_name field's name may not be the same as the actual name from the
> dirent, so we use the dirent name when available.
> 
> Currently hardlinks aren't detected, so print a warning if we notice a
> nondirectory with a link count over 1.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

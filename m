Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E937377FAA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 17:21:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWeoD-0007vW-Mg;
	Thu, 17 Aug 2023 15:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qWeoC-0007vQ-MD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 15:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XrZy2UuHK3JCqcQ9n/d2EZvLQ5lIPND3+ceG8Hbp8Vc=; b=br8SHY66sDDTD6TrXJLj/+AE0R
 61hFG63eFOL8nXBaAs/Qmm+T024MSLNkH1I0ZTuGOmNKBbE3Q9/JyhrEt6uZWlTLmu9ihxuB7YjTs
 uJe0wGbYZoCEpuFcBgyGSCu7A9gc5aJ9qrubeIuiiadhDzFypzW8z3XmgT1zvoOrgtug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XrZy2UuHK3JCqcQ9n/d2EZvLQ5lIPND3+ceG8Hbp8Vc=; b=KRCFO5tH+QBL3NWW+r16dY6rc5
 8c4stcwZ8tEgxEmzDv2tmBBF9x80iSdKfmE7mS8F0JHn7Ltls6oF6VwgyWKuj1cXJ+gmKgZ323lj0
 HrvuMc7ERsB9yeRF02ED85ma2NJ1oRSi1uSfbbrTdRSQMnCAGq35UjZjCfFpswCD9CdM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qWeoC-0081Ww-3n for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 15:21:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C99162035
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Aug 2023 15:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CB0C433C7;
 Thu, 17 Aug 2023 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692285665;
 bh=3rq0+j4/8fuL5mrl3zVQ3TjWRax2AO1eFRL2f46GGng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bBrjCRqMRSg4kiKciMHscs6niYTM6AKz28x7rYyNv3ftzZjT/4nT03c8vrX2bnyI5
 Rj2zSnzFW/CeYw2mxjo58zZuJJEWuWY57/Vm4u7z+O0IZoiZenKHisE3ycgHdtVn4n
 54CzPyHULebWwPsZtCd0ewgGwqYGGQxsF/F/RyF7H5gNstJLjd70O1gacoMRGr94nD
 yBUrhnTaCNEVwSF2C7/AT1zn5EiragT4n5ZyB2D10AItLyq6Jc632HlYFVknZ18y71
 deHWNfd4HJ2AdB45lz1T/XEtKFeH3YWNYVs3xLHhLdBi5gh0ZxejogNrtKu01iPUe/
 nwwHn5tXnm+oA==
Message-ID: <90ccff97-5c2e-3dd0-8f96-05c6f3402334@kernel.org>
Date: Thu, 17 Aug 2023 23:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20230730142552.3918623-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230730142552.3918623-1-chao@kernel.org>
X-Spam-Score: -9.2 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2023/7/30 22:25, Chao Yu wrote: > The description
 of max_small_discards is out-of-update in below two > aspects, fix it. >
 - it is disabled by default > - small discards will be issued during check
 [...] Content analysis details:   (-9.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qWeoC-0081Ww-3n
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: doc: fix description of
 max_small_discards
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

Ping,

On 2023/7/30 22:25, Chao Yu wrote:
> The description of max_small_discards is out-of-update in below two
> aspects, fix it.
> - it is disabled by default
> - small discards will be issued during checkpoint
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index ad3d76d37c8b..36c3cb547901 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -102,9 +102,9 @@ What:		/sys/fs/f2fs/<disk>/max_small_discards
>   Date:		November 2013
>   Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
>   Description:	Controls the issue rate of discard commands that consist of small
> -		blocks less than 2MB. The candidates to be discarded are cached until
> -		checkpoint is triggered, and issued during the checkpoint.
> -		By default, it is disabled with 0.
> +		blocks less than 2MB. The candidates to be discarded are cached during
> +		checkpoint, and issued by issue_discard thread after checkpoint.
> +		It is enabled by default.
>   
>   What:		/sys/fs/f2fs/<disk>/max_ordered_discard
>   Date:		October 2022


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

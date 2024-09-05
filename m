Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA596CF98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 08:43:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm6Dd-0002DY-G7;
	Thu, 05 Sep 2024 06:43:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sm6Dc-0002DS-Au
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 06:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+2dr7wqPvua2aUg6LrXxvYMtX6lztzTsMKm88scRKY=; b=Fbpoj7ZMH8RSVGaFdzuh7UF/R1
 v3sNT4Eyib4VHtxCahS1r/L5J8P/RCiSpwc/YDhoCLGYZx8pKFWaGEBsfP8P0LdjDfL7rn7KdvXSW
 iz91D5qEV94YDPywgEtZctKLc7MXejTQnGjtH7TEOY0FlAbvMfbzoLN0CxQN5YTc/2WE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g+2dr7wqPvua2aUg6LrXxvYMtX6lztzTsMKm88scRKY=; b=A4ywWyGPIw5nEfylY/pGFsCDu7
 UNqjBL8PPaQWRcs8HU9IrV/5kadG7HLQpAQ6KBlh14eqLC+z2ght4ABLk81v53//MkC0/iSyJe0kR
 5bRlRm/bUc8NDp6+1IMPAAaxhvPdFU6feUGfkAO1i1YykZtHiQ1/ySD6mz0t5m4SIuIE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm6Dc-0003yX-De for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 06:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64ADEA440C0;
 Thu,  5 Sep 2024 06:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07EFC4CEC4;
 Thu,  5 Sep 2024 06:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725518617;
 bh=qHz/VIWavBZ9/VrT8Dz11HQ70MwXkOtE2Y+4hjEG/+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZVzkC0yWhSk8rCvxLC/hmGKnQNqTyWMAh4UFiGeCnGhykKYU9ft4ydmBGNcDYjZtA
 ugsJfXeRR5iodXYIMzVo0jJuAdDyh4mfByD3k9dI/9sRDC9jd5qZBjUekuwf4oZV8u
 aFPAXoGjtWG6vPhuDoNjL5WYPwsY+Obiyj5zd+DJJ1O139dQFLhviPG9n6wMxTiHvN
 UGo4XmcaOrj44yU5+o5vfhppsFrLTc4bYpKLSoGG0M8GGylngfc3Us4a/2YdP+oQfK
 bpVy3rVJvQiwlbj99QnETQWVCUgtPWKgsFat/rmFyGSxvs1RfFMCbrLZESF2h5gG9t
 fj75io0N5JJOQ==
Message-ID: <f26f25bf-145b-4e76-b7c1-1ad00cbfb4ab@kernel.org>
Date: Thu, 5 Sep 2024 14:43:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160@epcms2p1>
 <20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160@epcms2p1>
Content-Language: en-US
In-Reply-To: <20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160@epcms2p1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/5 13:24, Daejun Park wrote: > This patch addresses
 the problem that when using LFS mode,
 unused blocks > may occur in f2fs_map_blocks()
 during block allocation for dio writes. > > If a new s [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm6Dc-0003yX-De
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid unused block when dio write
 in LFS mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/5 13:24, Daejun Park wrote:
> This patch addresses the problem that when using LFS mode, unused blocks
> may occur in f2fs_map_blocks() during block allocation for dio writes.
> 
> If a new section is allocated during block allocation, it will not be
> included in the map struct by map_is_mergeable() if the LBA of the
> allocated block is not contiguous. However, the block already allocated
> in this process will remain unused due to the LFS mode.
> 
> This patch avoids the possibility of unused blocks by escaping
> f2fs_map_blocks() when allocating the last block in a section.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

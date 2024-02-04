Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED4848A36
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 02:31:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWRLs-0004IK-2S;
	Sun, 04 Feb 2024 01:31:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rWRLq-0004IE-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nySIYJe7gdbUwt4SV3HSP1KT8hi6lcnEn1HIFVbpwhc=; b=ROwBQrr83c2jJ9c/31mBTPpGKL
 QtMiPg79OlOpf3IGaTjO57x5ZsKjaXFrk1udpXMPITjQHR2gLUtdz6vJ7tUz3pC4jdRhA82xE1MLs
 2TKsw1jqQg6EYU9HPPj6GPGYbkau4GgzcSdOMXP/PhXC5cvVyXxS56OhaP9qUs8OVOgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nySIYJe7gdbUwt4SV3HSP1KT8hi6lcnEn1HIFVbpwhc=; b=DFKfObqlgXBs5iDxK1boyysxxt
 6dJjbX4qnE8cWxg5mg2GP56KWWfP8a4beLBeN1E0FUdyPVf+G+RWg/luIUAn5ywxq8+YMsnrPzWe7
 QDOhzj+bHhUxE5BmjSA3J25eorAwO5iBzjwniSZm3NwXbP0HnmO36mbi/K7OEocORXPk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWRLp-0001cL-C0 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A281960BDE;
 Sun,  4 Feb 2024 01:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71873C433F1;
 Sun,  4 Feb 2024 01:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707010267;
 bh=XRW28h1fQMp8IU8VcQUi378iF8sFOP6ADhPjPhUJycw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mvm2Cjrff6kLlvw7YJRIqZS0RSQn7QOA1WlIafq0CmiDZtte763VES5GGPWVngY6V
 z5INN/2cFCnts+chu+KSypqYyvveIvhFcWGGj+SpA3ok7ysY7+whHiDjNXsoZJTb48
 YAn38Zb/8ix4jLScTiH1k127m8yAS3/3D7rxglPARzEJo5AMHThEEqGoSvT5Oma4cn
 kKSmBtf3Q0w951HRPZZ5cXjSdLxoS4+vjO+5C+N5Y4JGlQ1d3C1I+0Dv4DB5hWMBKh
 pA81bcIgBATQLmEg6/9XOjJoT6pOYOQXX3aj5go7OQXGiWXYmj2Eg3amCOhlpIsRAM
 rFYwJCP/scRqw==
Message-ID: <3ecb999c-8933-4181-a9ea-45116583bd9c@kernel.org>
Date: Sun, 4 Feb 2024 09:31:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, jaegeuk@kernel.org,
 quic_stummala@quicinc.com, quic_bjorande@quicinc.com
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/3 0:52, Jeffrey Hugo wrote: > The servers for the
 @codeaurora domain are long retired and any messages > addressed there will
 bounce. Sahitya Tummala has a .mailmap entry to an > updated add [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rWRLp-0001cL-C0
Subject: Re: [f2fs-dev] [PATCH] f2fs: doc: Fix bouncing email address for
 Sahitya Tummala
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/3 0:52, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain are long retired and any messages
> addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> updated address, but the documentation files still list @codeaurora
> which might be a problem for anyone reading the documentation directly.
> Update the documentation files to match the .mailmap update.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

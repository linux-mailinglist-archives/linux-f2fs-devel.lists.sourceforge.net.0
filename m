Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D22647264
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 16:03:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3IQc-0004K6-2V;
	Thu, 08 Dec 2022 15:03:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p3IQM-0004Jm-2T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 15:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SCl78vzmEfXOZofAjbnF48DZ9PavY/AXNGTswG2jMX0=; b=HGr77XRkvPm6JH5ECeVDHcA0Jq
 uFj8/y2p4qyxz2zjZvWPGLLQYa/BIMEV1dJIQFMjMnMc2RbNHZ3ZmYvLmZyNGTZsTZ2hlBsbyMu87
 SFxNXQcJ6rmzspDlM+k7uYVu+3lHC2RcSF3MuIm8Baklon+E64L80/8IOIOudI1ZirmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SCl78vzmEfXOZofAjbnF48DZ9PavY/AXNGTswG2jMX0=; b=Xr3LBRCGzHP3AbA+J6wxE+wp2B
 simvk1HDzTeMHkPBUNz+hgwJqUICD1E0KE+PAyhiTSOkSvrZ8uH3VffIzY1fIBy+Z6StiGuvFjQ3J
 iR7T/iFvosvlpGJEXGR4jQctTsGW9TkiiyjrCE7xYS0uvIru8GmvmmJuDz58fsNul/q4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3IQL-0000VN-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 15:02:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 255B0B82409
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Dec 2022 15:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BE0C433D6;
 Thu,  8 Dec 2022 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670511769;
 bh=QIp3dYP3MbL2i6Why3T1zkhj7QeR0vGowO05CjyufKo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OdvAgczR1tGqCrXNG4gWvpoZmo+yUYYoPdDceA1PB/nGJ0FMnTvOdtRXsd3+lEedC
 Gh0gviHTX/izxuc8OAjC0RZmRoNJXkGWt1Hcpq7UBhTPl2ewfn0eoM0Ycs8ejJgsRu
 wF3ZtF0U0zMkBIAvvyCQopTK4V3WcA+zVD8zOZXoJkhL3hcpuPyZr//Vojh8yZUu5v
 KYyBwbIXkxyf6b7n6XfqB0VQOwB8wZK1b1MVKj1iJeO+9z5kaxl4tYzd3ZlPA2JGzM
 ETpHp8rgSPylzvd0TdCoGCY9lNVKcd4VvSfy/p9VJbuC0uHjoluXaKajgEM0HxJ6KX
 LSJewnjyU1kHQ==
Message-ID: <b96845da-0fc8-a9a9-42e4-76940dd7e713@kernel.org>
Date: Thu, 8 Dec 2022 23:02:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
 <20221205185433.3479699-4-jaegeuk@kernel.org> <Y4+SiufEJLNqrmSi@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y4+SiufEJLNqrmSi@google.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/7 3:05, Jaegeuk Kim wrote: > This patch prepares
 extent_cache to get more use-cases. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3IQL-0000VN-D8
Subject: Re: [f2fs-dev] [PATCH 4/6 v2] f2fs: refactor extent_cache to
 support for read and more
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/7 3:05, Jaegeuk Kim wrote:
> This patch prepares extent_cache to get more use-cases.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

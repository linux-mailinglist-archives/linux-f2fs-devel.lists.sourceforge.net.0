Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308672D730
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 03:53:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8tDx-0007ds-85;
	Tue, 13 Jun 2023 01:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8tDw-0007dm-JG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3CAidy8NF6E7NzGL88WpNVT7OSy6tOF8kZXLPk7UQ0=; b=jukqrXiF2zyqTbrWyzCnlaooGx
 5NtA+t4mC3PAtELBcrBcF8QHzpPMGlj8N46Kyx0nc2IMdCV/ZdASTkJ1eWCksuY3DGJgzjJLBWrTp
 mE4P2A1FKBizPYra+YT4ShfXZ9s5Gq2yYSrOZ0VVGRoBJfLAZ6kr2na3aqBgOha6IpEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A3CAidy8NF6E7NzGL88WpNVT7OSy6tOF8kZXLPk7UQ0=; b=DSMaE76r5uMQS2rPC1k5+3wblk
 /FOVzxUc5RRhuyDJRALks3KNzv1n6XvvlTZVsZv9izYOIh/Wp+1lMM1ug8868rRxD7+/GfvZ+bsST
 IHEYuI9PVYnuuHvZTfZsUZZS4ZHlCmotiVMA8ufV+yqUdb2xoCSzuwyxYI02ZQIBMxEk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8tDv-0008Mp-FW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:53:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18D946305C;
 Tue, 13 Jun 2023 01:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B671C433EF;
 Tue, 13 Jun 2023 01:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686621205;
 bh=jQzl78vkH5imr/uqQKm1VRitSbjPqMq6WBF+qTjykec=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jn1pnVU/PvqrfI1AGEbtHw8WRiIFsSEssYI1F1NOOMDt/CbVaPHRLYjLN2mE2IhLU
 E8eQushd3ZIrdexw2g9+7fHhnzCZbWcq/2xuAr3rznStrivmKzyE3wfWPFUvlvsFE7
 ufnRdQdZuTff9j0gt/mhqyAPaL53qIjAr3vbSzW4tUZFjRyxpbPyIyFRdSe+zQpOGJ
 /fmw7IR2jMawg1h86mcD0QM7iL0BA2yUE7Y6PuS4CNfNRyxnE1rn9s+x+NCtZ41dcJ
 GzkDOMaXs0GIIGGauzOLrHQrh+uRDP7de/jM0vvsShpFWxqvVz67rOnmzZNVBqeCS9
 6hG72jfkIrTqw==
Message-ID: <ebac8472-2119-d1bc-73af-642caf129e3c@kernel.org>
Date: Tue, 13 Jun 2023 09:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20230612030121.2393541-1-shengyong@oppo.com>
 <20230612030121.2393541-5-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230612030121.2393541-5-shengyong@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/12 11:01,
 Sheng Yong wrote: > This patch adds f2fs_ioc_get_compress_blocks()
 to provide a common > f2fs_get_compress_blocks(). > > Signed-off-by: Sheng
 Yong <shengyong@oppo.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8tDv-0008Mp-FW
Subject: Re: [f2fs-dev] [PATCH v4 4/6] f2fs: add f2fs_ioc_get_compress_blocks
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/12 11:01, Sheng Yong wrote:
> This patch adds f2fs_ioc_get_compress_blocks() to provide a common
> f2fs_get_compress_blocks().
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38F56FCB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jul 2022 11:47:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oAq0O-0006uc-5U; Mon, 11 Jul 2022 09:47:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oAq0N-0006uW-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jul 2022 09:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NtadvyjgkceA+n+3kvFLXUZ4+GdTp/RiW2iI7a95a3Q=; b=lPHaUI1GzAEwfyUZowk1TRRTAy
 j0GVXyXfZqjvvB0phoZTG2pVTmWy97wta7y+2zqWq/Ph2N9c+ACHKWt8YW7qvyTlMySiBPE39sWDs
 xptFX8deOCZnVTOyoF5twim9g0K+bGZtePcjqc8wn74RExyNkANddZ5EM3jWxNHEQmFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NtadvyjgkceA+n+3kvFLXUZ4+GdTp/RiW2iI7a95a3Q=; b=Sc7TE5sS9ZTLlBOiepbx69vBv5
 cIbcuLIJMHRQOuzsaK4HknMrewx229r+4p1RUIcA0MElzzwKcSEVJjp8TAClKncVeA9Icx69chszM
 cifGjLJ6CC5VzhskVNOdsnDZunx23shD6PriwvFuuujronNifJ+T49UN6+7OuAyEfZzE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oAq0H-00DhKT-0i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jul 2022 09:47:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D342161016;
 Mon, 11 Jul 2022 09:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98259C34115;
 Mon, 11 Jul 2022 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657532806;
 bh=TTDmJxwGv8hxmQZTf+pbgqGB6az6jEQewoRmIwODznc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZ351MhevOCSjX7p4i483D6fWu0zxHJfRaKVsbDvgpNaubmFR+S09YCe7Sg76dRC3
 cxtj8qrkpMNhb7CSI00X+oKn9UcW2P1eHEPQP2GfTdGvv5r2iFBo/RWsHdQjMDT0dX
 qIbsw4+u4NUuPc6VetB0d+dXaNEaiHfIOHBbepkYSl8CE3KclI2gwZyeCV1NzIFUqP
 hGbpETGxGnM3spCcJz8j5bPzawENLKuhzdy0z6rjQKw4s+MBffFeRrTtPFpyflvROR
 iPdqPX1U9v3udAKK5rYCXznkGF8jZbVgs4lnONJ4rZAVJ67r8bH5wtP1GIuQa2ZAlB
 rfwQRCfncxjtA==
Message-ID: <04cc6525-0449-a052-f55c-6fc8e8b36a83@kernel.org>
Date: Mon, 11 Jul 2022 17:46:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220507081710.117162-1-changfengnan@vivo.com>
 <20220507081710.117162-3-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220507081710.117162-3-changfengnan@vivo.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 16:17, Fengnan Chang wrote: > Since pvec have
 15 pages, it not a multiple of 4, when write compressed > pages, write in
 64K as a unit, it will call pagevec_lookup_range_tag > agagin, somet [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oAq0H-00DhKT-0i
Subject: Re: [f2fs-dev] [PATCH v2 2/3] f2fs: use onstack pages instead of
 pvec
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 16:17, Fengnan Chang wrote:
> Since pvec have 15 pages, it not a multiple of 4, when write compressed
> pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
> agagin, sometimes this will take a lot of time.
> Use onstack pages instead of pvec to mitigate this problem.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

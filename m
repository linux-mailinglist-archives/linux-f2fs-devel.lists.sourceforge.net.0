Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CB60C912
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 11:58:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onGh7-0000X1-D4;
	Tue, 25 Oct 2022 09:58:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onGh5-0000Wl-Vg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xX5qQl/6shiIS5yKRUDZSQRUcmn6C647zvoD3e5rFrE=; b=c1B+40lUNtjUVOx4gn9wJLXJG5
 /fk7rdmsxmDgLmY2Qj79l1x+hrbd7UHgDL24M/aL9tt3uoEhY+YGFVmDwi3zaXSx6q87xMDIPiHXD
 dkzZimELjeFknUAVAYuAqzWu63WFCgTKTnwdygN4yGVhHJw2AGo0D+oaFAR6P7v9tF9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xX5qQl/6shiIS5yKRUDZSQRUcmn6C647zvoD3e5rFrE=; b=I1/2gcqpxz1CJzO/BK4wjbN2VD
 DNt/LRHnZThpqbPxIvRDoULKuoOZCH8Uh4//duyNrhxqYZI/cZlYN8XgGSBpi4wK3mg63FRRKiprz
 Z0H6YabZXRBfd/YnuaPjb1n7atOxbmQoWMs6UyUJsCcflwjWhGgLJVyFHkYxdl3YT+Z0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onGh3-0005mO-NY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:57:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A58CB81AE2;
 Tue, 25 Oct 2022 09:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A675C433D6;
 Tue, 25 Oct 2022 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666691865;
 bh=VjDlq0AaoBymNcBx1nVzZmGo9amGo5mxHdD1e4npnZM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kRTqgiTcCvphUEJlaXiGnv8IYg/g46ExcavLmLfuOO82trBAyeUtLL8n9tHMy8gkH
 Bd2/HxYecRMmTK6yptl7UguxMgaMi1pXMGU5P7SIIuD5iTsmIc6IFS1E88/yMuCrCa
 9GBfKqukCn+nmyBksfQeR8FnBAQRVhmDXtVXsco3dDqeARAPjjx+bEY51MwNDWc7Go
 tjFMxjtAHNca6pXkf2i9roQDj0kJz6hcgtoQjH99P1GsoPIJdHgIhriyNJGF7Nr+nn
 Fg4DRL8s35i7Ew6Z1NJdTP6VEXO1ZnRmsqS8zcFHAxsx95mwQo4puKdKl8EA7BcJu7
 vRS9NcLl9J6Ew==
Message-ID: <9f654a98-8833-8546-5c03-9814aea86995@kernel.org>
Date: Tue, 25 Oct 2022 17:57:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025080526.9331-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025080526.9331-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 16:05, Yangtao Li wrote: > Just cleanup for
 readable, no functional changes. > > Suggested-by: Chao Yu <chao@kernel.org>
 > Signed-off-by: Yangtao Li <frank.li@vivo.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onGh3-0005mO-NY
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: cleanup in
 f2fs_create_flush_cmd_control()
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

On 2022/10/25 16:05, Yangtao Li wrote:
> Just cleanup for readable, no functional changes.
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

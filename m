Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B7589CFC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 15:43:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJb7z-0003YB-Qo; Thu, 04 Aug 2022 13:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJb7S-0003Xb-VL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tg5Eqz20TkF2BryKveXO0kvsckn7+wa3W0rFC2WWfyY=; b=bbYUNVQNUWEjRSa/gjp+4Xld40
 ptn5GH9vR9Ij03Zdg/F2Y8LiKsMl/1d9UQIoOkBTtRP/7fjncIBh+N+Q5CY+knp3Uc3JYTIrQbn3L
 HbnQH0I2PkmpkZpcrkoGMjQg57gqzRAEfvgv+0CUnXRHqbSISzQVeDRIpfwKhCy3Wc0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tg5Eqz20TkF2BryKveXO0kvsckn7+wa3W0rFC2WWfyY=; b=Z+6KlQbzPLD41HIqlL4GGRB+S8
 x8RoqlQzCbgYU3ae6cdt0TCPInEXx0N63m3/XMCz3osTHQ/gRc+6+J7/kHCRMwX8jG4w3qrfcrgdY
 nK4Nw+2xlEoMrSf6N0kxIBV2vFpfg5Fl6gdfB8P/1/GsCtYLe/yzt/YdV/jh0ixgD2EI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJb7G-003DwP-IO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:42:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 555D7B824B3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 Aug 2022 13:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77679C433C1;
 Thu,  4 Aug 2022 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659620535;
 bh=/XC5S4YiMuClwldjj+UXqlc4TOiJVqClkgdfFwzoNSo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=me97mjwwtm8931nbsJzE5o4eIJ/uGRgfJEEh72ynWwhWgzLUHhEVSZjqrQcIM4BFC
 rKGV6yDH1JgIWmE3ogCBThjOSbZsGD3MVMQVnauR2IKajnk9huT/gQPTUmkKeDTpwR
 O78L7WlAyEprpkIyaZ7o0PFbS1AYB0GE2plcbRn9+ACx+fSRc0DF7BwwLwToR0l+7F
 BEOItp4getVa226gkMY0V+zqEoU6bbIEzbBXIzoTZ18wxW3+ZafVUCMT7AB/h8Xt7h
 XXnbU6mGdw/UhlZIDMhhA12WahtnUWP8iGiSxzqjdTswcYo5K6KOiLhIsSljq1rt6m
 FHk/rifJkiDew==
Message-ID: <0b07d2ae-b3c0-1b13-37d0-068a342c7b8f@kernel.org>
Date: Thu, 4 Aug 2022 21:42:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220804034146.3357114-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220804034146.3357114-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/4 11:41, Jaegeuk Kim wrote: > If kernel doesn't
 have CONFIG_F2FS_FS_COMPRESSION,
 a file having FS_COMPR_FL via > ioctl(FS_IOC_SETFLAGS)
 is unaccessible due to f2fs_is_compress_backend_ready( [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJb7G-003DwP-IO
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not set compression bit if kernel
 doesn't support
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

On 2022/8/4 11:41, Jaegeuk Kim wrote:
> If kernel doesn't have CONFIG_F2FS_FS_COMPRESSION, a file having FS_COMPR_FL via
> ioctl(FS_IOC_SETFLAGS) is unaccessible due to f2fs_is_compress_backend_ready().
> Let's avoid it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

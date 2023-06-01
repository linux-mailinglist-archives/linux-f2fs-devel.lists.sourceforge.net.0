Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 185927190EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 05:06:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Ydl-0006mn-6f;
	Thu, 01 Jun 2023 03:06:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q4Ydj-0006mg-Dv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRAvVGaGeZ1uTdOi2Y7L7LqyL217vz2MAPuJxeMAILc=; b=hHIdG+0x37AytDq/drS/QUFIB7
 T2Rgnsgw0qs0q30LOIWczlol0plJTdMAqGErVAyF65Y5kczo95EktICZiHsZ9NqD+FlvySsrdYNIC
 GFZ7CbWxphcnstZJf9neKFr+eQ5DSCIXnCaxw6vNUPIiuSjMAeUxdb31c0Sl8pAQNeWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRAvVGaGeZ1uTdOi2Y7L7LqyL217vz2MAPuJxeMAILc=; b=TovTgw6Zrp68iS/h8Zxz0Kf4tj
 NerDCX4zGHA2WjlRqo7EGcWD/+Al1jlnMnPyCv92/sJLIqMXXWFpvXkYNzGSRfNn72LjszB8ngjGH
 +iRSvLeIKmvU+1EKEgOcgRSE32cBGk5SEVVYo0/qXsrNTN3q+QIyUwzrclUA0yDyHO4k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4Ydh-0008Q7-15 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:06:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 628ED6408F;
 Thu,  1 Jun 2023 03:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0015C433EF;
 Thu,  1 Jun 2023 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685588766;
 bh=3+CY4AzK9WaVFBZweand5Oq2g+ea9okBFlyFMJDiaLU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GaIsRauGLXF6sYxTtt8HGSBvc2U3BSWUbi+gs/lM7Nfaynb2ruvI8UwoWft9Rc5TQ
 G6Y8wUK4fiCqdJCndRjju5eCJtZMZipYBxDMUjblyFNsZVpXp9wjMNJM6P38QRjaE9
 9vV7ih3N8C0/OkAf6tPMuBQfl4ZmXqB/vYU6pRLgHo+vh5GEqU8VEgkWydagM/eFBa
 hLBy7lzk7TvHS9lzPl0on0fm6Ic6LxLzL5zFgdnU8G84EXrMInuTIWtS6zP6h2dqCy
 Z14oGo6xYK469aOm/t7ck9FM8+ZyTs9dkmm3GvFs3ga46mHnqlH5RDIqd7cGw3ZA6y
 ZEZZ/HkhQ1crg==
Message-ID: <bfcb9d94-15a7-3dd7-7e1c-c041e3ee2769@kernel.org>
Date: Thu, 1 Jun 2023 11:06:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20230529013502.2230810-1-shengyong@oppo.com>
 <20230530063407.3305344-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230530063407.3305344-1-shengyong@oppo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/30 14:34, Sheng Yong wrote: > This patch introduces
 two ioctls: > * f2fs_ioc_get_extra_attr > * f2fs_ioc_set_extra_attr > to
 get or modify values in extra attribute area. > > The argument of [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4Ydh-0008Q7-15
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add f2fs_ioc_[get|set]_extra_attr
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

On 2023/5/30 14:34, Sheng Yong wrote:
> This patch introduces two ioctls:
>    * f2fs_ioc_get_extra_attr
>    * f2fs_ioc_set_extra_attr
> to get or modify values in extra attribute area.
> 
> The argument of these two ioctls is `struct f2fs_extra_attr', which has
> three members:
>    * field: indicates which field in extra attribute area is handled
>    * attr: value or userspace pointer
>    * attr_size: size of `attr'
> 
> The `field' member could help extend functionality of these two ioctls
> without modify or add new interfaces, if more fields are added into
> extra attributes ares in the feture.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

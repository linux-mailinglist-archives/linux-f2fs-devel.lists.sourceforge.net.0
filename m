Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A19719138
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 05:17:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4YoH-0000rf-24;
	Thu, 01 Jun 2023 03:17:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1q4YoF-0000rZ-Ds
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fb1+L/KOtNhe5ONTPDenDlasvpYlul8w4Y9ps0WJHoI=; b=QZlQiwkXB5mAT8NGHZFMx9wZMb
 hfRQb7jtjzZzLpoOnEdLVsJ7Ovc3tdAvrvEyvyugAsUa8fb2CAXXXpNql+PESeBXEuoUDPD4EdLEO
 Lh48Nkp3Q5P3pehrjI++9NUI1UcVDFBecfKMvmuEg1LIPi6hu/vh2djFEi1huegTZ9eY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fb1+L/KOtNhe5ONTPDenDlasvpYlul8w4Y9ps0WJHoI=; b=J2LvhM+ng0d4RMZXIblEJqM+ED
 Z5MZUkKjakhPWtBnk2CZzr4NRNhBlAv1lVSGpJNZGtzCHPaGPVAvyFQRKWlMuRTmqxxPyn0YCFO+g
 fE6NjktuMYO7OIZdqaIZx7Q2yruiG2X7SfQrDRcZdt6V9v1PeJTGr8EvVo7sFk5OmoL4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4YoF-007yHQ-1b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:17:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A49E3640C9;
 Thu,  1 Jun 2023 03:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C63C433D2;
 Thu,  1 Jun 2023 03:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685589421;
 bh=XvJPQ0XHSvZ7dSl5mVdAuoo5pLb3aJ1TYEwAlwW3WKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzmOiuM4sreAVnlRxGo5JdeBu5cNJ0fH4DwQquEL3P5EwrPyuc4sKspHzWZsVlMNz
 20HDBLLr8iGVVxAwICCmrS0FpgIfq2mgLzAWErForkcDEFf7cW1udSlHDglRAoOKBS
 BeRlpU3bL+gYwgRMBZex9aPrkdWzvJkbAy3DPXTOYITesDlyXaGtiZX9ap5ZqsI+OZ
 XJQR0ptuiOH50QaobLo096PO5FHvQCMgnSbQcHk1ALytx5hucKUSPCwTTEcTGt7jKe
 QvWz5uom4ozXauycokNXLP2rq+8T5K0ABNH1QbjRbMzT9CSvn4Fp/lOyK6oafSjCg0
 b6Zy78SwHVQgA==
Date: Wed, 31 May 2023 20:16:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <20230601031658.GA728@quark.localdomain>
References: <20230529013502.2230810-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 29, 2023 at 09:35:00AM +0800,
 Sheng Yong via Linux-f2fs-devel
 wrote: > This patch introduces two ioctls: > * f2fs_ioc_get_extra_attr >
 * f2fs_ioc_set_extra_attr > to get or modify values i [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4YoF-007yHQ-1b
Subject: Re: [f2fs-dev] [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 29, 2023 at 09:35:00AM +0800, Sheng Yong via Linux-f2fs-devel wrote:
> This patch introduces two ioctls:
>   * f2fs_ioc_get_extra_attr
>   * f2fs_ioc_set_extra_attr
> to get or modify values in extra attribute area.
> 
> The argument of these two ioctls is `struct f2fs_extra_attr', which has
> three members:
>   * field: indicates which field in extra attribute area is handled
>   * attr: value or userspace pointer
>   * attr_size: size of `attr'
> 
> The `field' member could help extend functionality of these two ioctls
> without modify or add new interfaces, if more fields are added into
> extra attributes ares in the feture.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Aren't there enough things called extra or extended attributes already?  Besides
the standard "extended attributes" retrievable with the getxattr() system call,
there is already the FS_IOC_FSGETXATTR ioctl too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

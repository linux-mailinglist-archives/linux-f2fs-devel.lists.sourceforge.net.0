Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE1349E97
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 02:21:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPbAh-00051h-GP; Fri, 26 Mar 2021 01:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lPbAf-00050x-M7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOPO+gWWylzXQnBmvvGLUKLgVKu695/EPgzVM/2ulyY=; b=P2Pdp1IwPAEKZxAppwOuzOH5Yf
 mKIYaXgn6uJ15dZW1iAJoXUjT7QgCIdR7/Zi2B0aKvZyIs1dpcqzRc+rd/7DK1uO6Loeh3b5hOtut
 x3d7RMhRXQ8yzO+bQ7k6f5gmodpcj/UOBiKPkx1KYaDDbDz6v8zQrXZkXBGIQsbVQE1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pOPO+gWWylzXQnBmvvGLUKLgVKu695/EPgzVM/2ulyY=; b=bhrloI+vX4tq9dyaqJuLuTUImK
 mAXyM8gEIsBXQweolFB+wWh4UTZU1vm/UwzjeniiYN8WKjK3OhFhYmwJf5mQxiW3wqJZZRirBKBF7
 bxjDwZ+xChN2lGpZI9xuvk5RvdJvRmHG5xdXSw1sVJ0h6mIuzkYxTzg93asbSeCWAg0U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPbAb-00BzpX-5n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:21:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3E2761A2D;
 Fri, 26 Mar 2021 01:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616721703;
 bh=as9lfFgV4XuY3YAN83h5LS2PkkRJHNNBOryPGMahbwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3d6uiA4lOaJ3SjD2+BHhJnfl/ISiKpY88UwFM0Q2GVjLumusLC9TlN7iiTuoVZmA
 ums5J+cRcsFKuQk1jFcNcc8eAIxURe6A3Tvyee5jxrhYybIiHYBJGo/MFgHpaVBAup
 lSTyK/Gmtp7zHF15Kra2BmOz7Gc6VCtg1SCLA9p2FjKynlnt1O6WLk5K9Je5LChD0u
 aCRl24UcevvXalfNL/s/FRk/6HVUFgoq0GlVAMrD9d6KeuqvE0tHT6e4e/Zqjr+MIJ
 HAIIomqQPzpEX68j2PwoDv6f8OrJ5WkmPhJ4eoZ4GR2cvdqULMO2Cf6GYnIc/wN3HP
 hQw+hcfh0O0dA==
Date: Thu, 25 Mar 2021 18:21:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <YF03JuWi9bYL11e6@google.com>
References: <1615886958-717-1-git-send-email-stummala@codeaurora.org>
 <3c453b72-892f-7044-2edd-224b82202608@huawei.com>
 <20210326011756.GE8562@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326011756.GE8562@codeaurora.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lPbAb-00BzpX-5n
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: allow to change discard policy
 based on cached discard cmds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/26, Sahitya Tummala wrote:
> Hi Jaegeuk,
> 
> This latest v3 patch needs to be updated in f2fs tree.
> The f2fs tree currently points to older version of patch.
> 
> Please make a note of it.

Ha, need more coffee. Thanks for pointing it out. :)

> 
> Thanks,
> Sahitya.
> 
> On Tue, Mar 16, 2021 at 07:08:58PM +0800, Chao Yu wrote:
> > On 2021/3/16 17:29, Sahitya Tummala wrote:
> > >With the default DPOLICY_BG discard thread is ioaware, which prevents
> > >the discard thread from issuing the discard commands. On low RAM setups,
> > >it is observed that these discard commands in the cache are consuming
> > >high memory. This patch aims to relax the memory pressure on the system
> > >due to f2fs pending discard cmds by changing the policy to DPOLICY_FORCE
> > >based on the nm_i->ram_thresh configured.
> > >
> > >Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > 
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Thanks,
> 
> -- 
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

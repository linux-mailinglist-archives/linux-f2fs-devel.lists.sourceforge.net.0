Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD36C6838
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 13:26:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfK1K-0004v8-CN;
	Thu, 23 Mar 2023 12:26:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1pfK1J-0004v1-7Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 12:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3zqr2ujDGXPyzvoqMXpb+X1fxpUGMP0v9VVGQXbd3H0=; b=kXVXUCCUXB7ruQdO8b36vJ41tG
 eyssvshi1gM71yfT+4iUcZx6UJfwu7Lh3T/OL9uQiH+SrGrGfyKsx0pmYUYaZRsLiXqeX9GdoMm3N
 TZOGPIqKzh0oFZ0zK4J3mRtN5r5NqdF4jrAxFc/rMsDmfhq2kN1bPYxFyUNE+h2FnS00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3zqr2ujDGXPyzvoqMXpb+X1fxpUGMP0v9VVGQXbd3H0=; b=Nw+uznn94MD9f7n+wZUqo9E4h7
 j5c2ycwBoFe7cPKhJyVjQ24KycB1wKZ+Nz3ly7DaAUWqHDygsQ+YyxvZ5mzJlXXEJ9n67uFe9QLdf
 0xLYv5Gq5+y05jRAGnm50mk7V+3mpl4URZScYPm5GagPeyLAq6QgIHe1Desmfa41ZXdY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfK1F-000BcB-4A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 12:26:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E389B62656;
 Thu, 23 Mar 2023 12:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8231C433D2;
 Thu, 23 Mar 2023 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1679574366;
 bh=hSIUlO1HxyEpsf7qIxo9KBJ0VL8excdKGJYYFukRPL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6MeQSnsMeVy2O0Vk8RTY0vHNrmj2AIgXtab/TGNOFfzWTZud+JQGikV8JyH/6bL2
 HXj5AQv7PGMyWu5gO4aQNckaFR7jMxyPlxC/GN/SkGd9UjEckISINsL0GjCLdhE22C
 5zuGNqdawoE4Z0VJ+MBNSEjFCrSN9mJPfzKZRDpc=
Date: Thu, 23 Mar 2023 13:26:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZBxFW5Yi0rwLvTsx@kroah.com>
References: <20230322165830.55071-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322165830.55071-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 23, 2023 at 12:58:30AM +0800, Yangtao Li wrote:
 > There are plenty of using kobject_del() and kobject_put() together > in
 the kernel tree. This patch wraps these two calls in a single help [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfK1F-000BcB-4A
Subject: Re: [f2fs-dev] [PATCH v3 01/10] kobject: introduce
 kobject_del_and_put()
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
Cc: rafael@kernel.org, djwong@kernel.org, joseph.qi@linux.alibaba.com,
 linux-mtd@lists.infradead.org, naohiro.aota@wdc.com,
 linux-nilfs@vger.kernel.org, richard@nod.at, mark@fasheh.com,
 trond.myklebust@hammerspace.com, xiang@kernel.org, josef@toxicpanda.com,
 huyue2@coolpad.com, dsterba@suse.com, jlbec@evilplan.org,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
 linux-nfs@vger.kernel.org, clm@fb.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org, damien.lemoal@opensource.wdc.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 23, 2023 at 12:58:30AM +0800, Yangtao Li wrote:
> There are plenty of using kobject_del() and kobject_put() together
> in the kernel tree. This patch wraps these two calls in a single helper.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -convert to inline helper
> v2:
> -add kobject_del_and_put() users
>  include/linux/kobject.h | 13 +++++++++++++
>  lib/kobject.c           |  3 +--
>  2 files changed, 14 insertions(+), 2 deletions(-)

Meta-comment, something is wrong with this email as it is not linked to
the rest of the series.

You can see that by looking at this message in lore.kernel.org:
	https://lore.kernel.org/r/20230322165830.55071-1-frank.li@vivo.com

No 2-10 patches linked there (they show up as a separate series.)

So even if I wanted to take this series now, we can't as our tools can't
find them...

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

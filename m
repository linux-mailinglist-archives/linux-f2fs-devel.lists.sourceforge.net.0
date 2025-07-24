Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F253B0FEF0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 04:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHmwfpEU6HAOfH5fJVw/2PJG2F8ZOxeK+xMRcAmIBL8=; b=IaPwaOG4tl1pZLJSICVBNJ0SGi
	0E0cP2P7iszacZ+C/7wNXvRr48vFj+0lHQKgnIjUSlBOTMxKXtuN+xQ5+WaI/Pfdiu6+8Br4EqRX3
	1QnAVebJUtzyL3ukxw8yLm+F64Pr4Kcdw7O7VDIaPdlDqSwfNFUEjMGwgd6R34O/08ro=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uem3f-0003u5-0L;
	Thu, 24 Jul 2025 02:51:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uem3d-0003tz-H7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 02:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttm2krCjZaQOJVRFdRQvMmpdyFVN4RuoFTN98Z9j9Uk=; b=mP+rNyJIqN0GbD8zuMhHRJdJY9
 NgHjZHThpfEEmO67pAo/C/kK3yzxMNiMMOLlHAccBCp3dWxVyVtdMahUeqTQVORr1HylyLygdov8A
 JdVAW7HXlH/QeITyo5upMrNlz1AjaaENRj8KVuGCJM/ud61RZcb81ZnjSLvfBfQfCuXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ttm2krCjZaQOJVRFdRQvMmpdyFVN4RuoFTN98Z9j9Uk=; b=FhEIzWhUYv+kIl/r3UinA/SLwq
 8rutl0j6WI6eZQHQ/XBIyenQcpEpmOnA3oLVYE/Z07CImnca3PldXO7u/ogmJpiDBiaVy7VKZuHKm
 Jj0WsM+u/wMDN5RAerCPu9hOAXBtC7kaRMmAXku/vG1bV4PXdg37l7uvK/FtEP3b40J8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uem3d-0004zx-63 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 02:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C2A3C442C9;
 Thu, 24 Jul 2025 02:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D602BC4CEE7;
 Thu, 24 Jul 2025 02:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753325494;
 bh=zQMwssB5DRI+JwmLY5fcSE/9Ybp+39Nh/8mCHog03zk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rwdRwmNyao1OJ/aF0Ds9ac7JQcLHW7iGMKc9sgHl8/0pE7aJGqfFKQxgHd3gwnVsI
 Dzbvg4RR9V+3NktvYyny1yrAn3njkJpr4+mF/fjeyPCxVWUnp/5nV5uG7uIAPqjdWe
 ih7Z4yszK+iQwjNmK+x8ewqbs58S+quegcZOXDVPNUUJk2tn6fSV5byUbVuieNYuji
 9d0FMBc1NAMoWDX4hbU0vKUClL6BvnUQsSqcMi53qD3Lbup6WLEcAf4Pzn417B1OaN
 6RnoF6Q7TXnv0u514ww4YRx8pT7if7xg9KJ5VDfCnt4sux3TPA0/SaNKF6JOxCDxpG
 yHiLDQJEqct2w==
Message-ID: <561990bb-136b-49d3-b5d0-465e99a6bc90@kernel.org>
Date: Thu, 24 Jul 2025 10:51:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "mason.zhang" <masonzhang.linuxer@gmail.com>
References: <20250723145837.187089-1-masonzhang.linuxer@gmail.com>
Content-Language: en-US
In-Reply-To: <20250723145837.187089-1-masonzhang.linuxer@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/23/25 22:58, mason.zhang wrote: > No functional changes.
 > > Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com> Reviewed-by:
 Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uem3d-0004zx-63
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge the two conditions to avoid code
 duplication
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/23/25 22:58, mason.zhang wrote:
> No functional changes.
> 
> Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

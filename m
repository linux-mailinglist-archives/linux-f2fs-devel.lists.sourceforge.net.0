Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3EAAEDA8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 13:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m50Gi4feU5e5LRVFVEpapjfox6CktX4YNf8AD6v4x6k=; b=AguF48PaNqIQux1v+Kja2JXy/G
	LEF6VVeYCLaQgsBTP7Wy5OzdKW2PHXFin83uIyqKsPq0QNBlwDU2CZeylCgxlQIU8b2ibcxJ49RK1
	0DmRhbh3yc17eb9whe636IgQbDk4SGafnvI9t6dOtgFXuD/dxJTmH/dHMNue+woA7e3A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWCQv-00009H-Jw;
	Mon, 30 Jun 2025 11:12:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWCQu-00009A-EN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 11:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZKIvpOVXKrF++xg+cg0DKcQVyIAwTBt3+gkXNxlWQ5U=; b=N9QdoBxY2d8JBuMJkTrPX13EPt
 RhnLXUxYWzKrVtD/p35XEeFX0f7Ccup2aCE2M4LKYIogsNRBKd6L4AmMf3NoAzFZXeqH8t+PYX2GF
 QNkDOTOIQDLLeyCzGrFYLBlH5Z4RjTXK6XkAne3RNBPe49vVSeU6MxG66ngfP3ZchYq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZKIvpOVXKrF++xg+cg0DKcQVyIAwTBt3+gkXNxlWQ5U=; b=k4+dFDMZCU9By8jbfNLHVP9tlG
 tefzy1yUqvDd9MyUIHXTNHfServvsU95PlIU+EsG/aWZaP8HUgRt6MWaPLVTNc+0Kw3UBtkJGnoYP
 KkWVCgayMieq64bjEDwvIkfwF/YGXFwZFM+yVkxY0KNgTqwYohLGzaSgdpp0Ytc+9nHc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWCQu-0000Kf-19 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 11:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B707C43A4D;
 Mon, 30 Jun 2025 11:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39584C4CEE3;
 Mon, 30 Jun 2025 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751281929;
 bh=gTebueH2KKMABhXIC27LxlzSf+n2XmIQekNL0BcbL3g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=T77UmB9DZMdVuZhr26oMiVKR6IbI3oya5EymHSFJIUiX8OdHpSAwz+b5xFKlItH1k
 HltiwJ+cwsNCTdEhHsQHc/vWG5qPLA+VQiGipoR0SNjGWG5f8DUmRBVWkgVXaK3xhH
 3o4RppVrenpKwCP7NHsDZBTzbWTwvt2wXeKIM/hVZGb3gGBNsnmIgQ+YL4BZM6Ywex
 vrTAWHGrl6X8gyqbjso9mVWVrRxMDdJYkPSd/4Y6a/mp8E/p9VHGMpFK5qZM3yxHyA
 w8Mc88a5cFEnuxOrNA2ZjSAgYziNh9en14xiSOpDDI6X+Mx9Uo3UyAlgVTfN5bMewL
 VxxyHDrlYgTlQ==
Message-ID: <f90da85f-4498-4646-be26-652a3e2681fd@kernel.org>
Date: Mon, 30 Jun 2025 19:12:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250630095454.3912441-1-wangzijie1@honor.com>
 <20250630095454.3912441-2-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250630095454.3912441-2-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/30/25 17:54, wangzijie wrote: > To prevent scattered
 pin block generation, don't allow non-section aligned truncation > to smaller
 or equal size on pinned file. But for truncation to larger size, [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWCQu-0000Kf-19
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/30/25 17:54, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
> setattr_prepare().
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

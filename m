Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777E365F31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Apr 2021 20:28:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYv6Q-0002fV-JD; Tue, 20 Apr 2021 18:28:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lYv6P-0002fD-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 18:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1ZfqGwym81lZUWj9aQq9y9N0Q6QCE1lOQzugPdiXVk=; b=TiFRffYrCrPXYOlyCNTbXSdBFy
 wQx9EmtjYSwEZDVx+Q2cgVehN3/ROtwgPzTnAYpin8tKwDtLiwQIH7ukSdcdfR36IX3F7mjhf0aSs
 PDHxQct/poAfldf9pRCDjRzxh7lCWq3d9RtlUZleUn28CqGAXHjRVtWA6Fltrx4EqjiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f1ZfqGwym81lZUWj9aQq9y9N0Q6QCE1lOQzugPdiXVk=; b=YPi5/SpAi9PCST+oXXBL0vje/6
 WlUFVrgHr7QzYU3qH8gbGGX/3TsJ4k6sSkef1R4fAIG9dwoJVTp6vN7ZcfFp4Bm059WS1JN1hucz/
 UzlA0iJCbhtB2RkhpHLp43B8ydhjqiuG4oB+2F0kJqzpRDvySYZ2UaEVtcbAjRnbpxD4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYv6K-0046Yi-U2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 18:28:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CE106052B;
 Tue, 20 Apr 2021 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618943271;
 bh=KKqI0CtdBHnooIUsDeB/ucsXCbS8kOelphJ+U2dDNfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tMeUBUM/+jZCj2JdxtT/7Fdp9QL90Wfk11n0DYy8kF9zUtstSlzZN75u9JANQoyCf
 s2eYbxuLp8hFXHKeEoM9SMAAnGuNGH9IGy6e8ZQMGVfM0Efc5qkoAMRe7GbWk0CwiJ
 8fCgLcHp90AtT5MsUZU5H8POYsc9S/wk1n/xtaAbubyT3EOtVCmgRVaClPCRLP81pa
 IHbMn+pBSQ6ORV5tVGXFHbVlVtXUqXfWrWuayR1YfIXBO+af2Pg/2dgIIuqvX7ptY5
 to6xfFGwQSclnbqdu7mXMM+edDGlcydVnovqox9ILTBOjqX/IaaOadJbBCvu1jj0xX
 4ekaxTRy6V+og==
Date: Tue, 20 Apr 2021 11:27:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <YH8dJQCJm7iqsC+a@google.com>
References: <20210322114730.71103-1-yuchao0@huawei.com>
 <CAFcO6XMak8GSRqQbZ3nPdGvV_eM6DL0+P0z1X2y0G9hkrccaCg@mail.gmail.com>
 <beff8953-d91a-c677-f50a-3aba27c15dde@huawei.com>
 <YH8SvK+OLSKAEYpJ@eldamar.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH8SvK+OLSKAEYpJ@eldamar.lan>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lYv6K-0046Yi-U2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-bounds memory
 access
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
Cc: butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 04/20, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Tue, Mar 23, 2021 at 02:43:29PM +0800, Chao Yu wrote:
> > Hi butt3rflyh4ck,
> > 
> > On 2021/3/23 13:48, butt3rflyh4ck wrote:
> > > Hi, I have tested the patch on 5.12.0-rc4+, it seems to fix the problem.
> > 
> > Thanks for helping to test this patch.
> 
> Was this patch applied? I do not see it in mainline (unless
> miss-checked).

Not yet. Queue for next merge window.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=b862676e371715456c9dade7990c8004996d0d9e

> 
> Regards,
> Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

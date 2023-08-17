Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0777FB32
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 17:53:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWfJZ-0003Bi-30;
	Thu, 17 Aug 2023 15:53:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qWfJT-0003BV-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4mtaGRGLMway6lo7kLAksgEx2B0rUdaoLMskJOY5ZJU=; b=SZR5/8XchSPaQ9gm21OZgMg76g
 J0+gz2UTALs6aUvNPxwuaXZazqHjCRmLmCFSaE1Q4/8E0wJNQLsKiS15h6k3ZwxGatW0mXIABfr4o
 bM1pcBlhlcONeZcDVODqds2m4NBwotRR9UVuMRDcxGWJ/WbGZ/avVf+CmYGrQTl6atFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4mtaGRGLMway6lo7kLAksgEx2B0rUdaoLMskJOY5ZJU=; b=mq6H38EbcC1fI2cY12Gjui0dZF
 OlcvEWbthdrQ/0eE0cEJrujbtGwqLTdiwSKnQQXdxdL5WUy6Gy0Ii0JCGPNODwz0qftQZzo7hegsG
 ZpCpi5zTh5UPEUQlMnNqYuc6me+DFN1Lhb2zmKC9j4VAyO48BdE0UdwbSC5NSzRezsrM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qWfJP-0007sH-6J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 15:53:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80E63636EB;
 Thu, 17 Aug 2023 15:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EE4C433C8;
 Thu, 17 Aug 2023 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692287600;
 bh=7gQEnR1PHaoa5dCgokjLmzMmpBZ3vQWbYRpweW/tydg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZL6JJhwcuOx8EJOaQXhpBe0PsWPS+Ol0UsYWHRSd5yX/ghLy8feTPy+Q9/r0fJX8j
 v6SWSCHl7UMn7C3prJf9/1FV4Y4tHnEb0UhXd3k43vnOhiwsfG1uzINt/LCzNzexNG
 FgsKvG4TxcpOWVtdzpsOs1ZURQa3U6IahQlLuzB8kz85ctplOhNc5GIij44/caY8GX
 SgXr0zQNlLrmnDEKjrO8OkUGY2YC37HO9iGgU8nagMxbXqAkDubnc3fIcGZlHVmm20
 gwG3lxQhxAWAi+uad7qbMJxSwaLYb/3L/OSyjx1lmk1UKR2mlo14361WCMDsYPwICD
 Ztji7QleDrnUg==
Date: Thu, 17 Aug 2023 08:53:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20230817155319.GA1483@sol.localdomain>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 17, 2023 at 10:26:12PM +0800, Chao Yu wrote: >
 > > > lock(new_inode#2->i_sem) > > > > lock(dir->i_xattr_sem) > > > >
 lock(new_inode#1->i_sem)
 > > > > > > > > This looks fine to me. > > > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qWfJP-0007sH-6J
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 17, 2023 at 10:26:12PM +0800, Chao Yu wrote:
> > > >                                                     lock(new_inode#2->i_sem)
> > > >                                                     lock(dir->i_xattr_sem)
> > > > lock(new_inode#1->i_sem)
> > > > 
> > > > This looks fine to me.
> > > > 
> > > 
> > > Based on your feedback, am I correct assuming that you don't plan
> > > to fix this ?
> > 
> > I'm quite open to something that I may miss. Chao, what do you think?
> 
> Jaegeuk, I agree with you, it looks like a false alarm.
> 

False positive lockdep reports still need to be eliminated, for example by
fixing the lockdep annotations.  Otherwise it's impossible to distinguish them
from true positives.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F36086ED1AE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 17:47:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqyPN-0001F3-7H;
	Mon, 24 Apr 2023 15:47:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pqyPM-0001Ew-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kN8IDUqW0EmeFZzzB0jKCfL06jXe7XO0VewqhkyjHqg=; b=Iy1OJOOS2yit+yOWVvxk1odAje
 dPwk3EHRLyTYazA1e3YwdHp51aeewRqKZNXogY0WqeqXMX9/R5NtZ5xMdsmgqQY/oZq/xbJFE2AYH
 fsUicPdMexdIlw4k0rOU+dtB1pbl9B7IlowULQ7oaN0/pG9KpuQnTy5GoNQthghfT9sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kN8IDUqW0EmeFZzzB0jKCfL06jXe7XO0VewqhkyjHqg=; b=U83VyYeM6tT8zCs1gDa2pkhf/p
 mn3tNf38nId1qQdn+H3yl31cvbMgQkUxWdAYUR0FMrAw/YA/kj8awmGOG7Dlka1IQh0w+sMMSiLCX
 KR3gzKDtXJnXq6Bjyms52nJqHZCWqtSxvFVVNPy4HrPyhPpWKGr3yfwl+oimsfElyprE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqyPI-0008DZ-WA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:47:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 958F862268;
 Mon, 24 Apr 2023 15:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63B9C433EF;
 Mon, 24 Apr 2023 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682351227;
 bh=LC4skObKqPI+7BhFR03IM0NOmyFyRnFGlYN8RXopcKI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e6uGRl4nBYkGrXa7TEWDsXPoE4r/LgOUzIJvAhyvBH1uHJAGQy2XZ71irQiCmvfW0
 uzrABUnvNEgTkD/PwQvog7FqSIYwvlnXRHgNzPOeiZ6tT68fhu9S0z36KkS11WHPAk
 f4MgcLJ2ku0nmoCyEVFKwmuaYbSOZRVNiwZLMVABWKxx+xgIHq2oZB2n0lTMRXIXlf
 LFZLccItwTst56B6IiKEmmWWoYVWDt7Cmf+/xltk6J+qxmHFjLTH8z32PHBFLDx93M
 Vry33lynzuzLT2SVe/4urTQt2g2QeK2bBkSsTQdw1CNEMAeRub2pHsA6NwWMYYN0ve
 2MBZeaLaQw9/Q==
Message-ID: <4f72f8f4-7f00-aaad-7d5c-c2ce0b80c500@kernel.org>
Date: Mon, 24 Apr 2023 23:47:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230424154348.22885-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230424154348.22885-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/24 23:43, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Need to use cow inode data content instead of
 the one in the original > inode, when we try to write the already u [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqyPI-0008DZ-WA
Subject: Re: [f2fs-dev] [PATCH] f2fs: use cow inode data when updating
 atomic write
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/24 23:43, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need to use cow inode data content instead of the one in the original
> inode, when we try to write the already updated atomic write files.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

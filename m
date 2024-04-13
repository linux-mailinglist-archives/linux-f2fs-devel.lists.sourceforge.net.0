Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D628A3C0D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Apr 2024 11:53:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rva4P-0004Ot-L1;
	Sat, 13 Apr 2024 09:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rva4O-0004On-EA
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Apr 2024 09:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WXU8pwWNKq8yK6gqXgzgzhokYJosroKMvGTUdzwhp74=; b=XhV5BXxyFKFtmZuZhqWS9VmyRc
 rEfENaPYqyfVaIKT/Bs8udpNTF/Dsboy7VMMCyNRjqjwQNA68Fsh64BI6nunF1zgFj/ZDqcZStDeS
 gqRe110c5/5FDbJvat9/fiBZ3krsth4kPlSbgsJXknXI6XhN0029rOX68h+TEot/SsDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WXU8pwWNKq8yK6gqXgzgzhokYJosroKMvGTUdzwhp74=; b=SPIUzoM0RTS3TRUXHS81W4V4iV
 1TNET0LNnDU6P9BqvFppAFqv46AJLSqqz/d0A4aTaZsY7QlfmvsPzvmqgV90rdkJ5VQWhpFzsrjsg
 +mQwKfDmBeCnA2XLMV7IBFfxZUff/SJEcDQvO4H2HKPmFzxMCDhJLPuHUzi3xPnJIAb4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rva4N-0005cL-UW for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Apr 2024 09:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AD316164B;
 Sat, 13 Apr 2024 09:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE67EC4AF1D;
 Sat, 13 Apr 2024 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713001982;
 bh=rEBv6Uch7IwTGGDlnmOB5YgZdyMlc3kQYiKLZ3AnE34=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Kt5RjD8m0LTt/yzo97q6XHXIozi28GbrYLcc8VAvTKI05Hy+Mqci3x+0HbBR+2oOm
 k79n1ip/XV7sRHdsONhueMgPaDJoIdXPkgQz8BVCxLcltf9BMldbmbTSYEiRPkc9Ek
 6Pzp/Yge9Za5mkEb/mYNE+Q6kK+bxgSf/Rulve/1DRkCO4NFnKM5uq3F7/x1CsHwwL
 2WhPKGk4cJbLgY1MMlV0/sq9TPmiJq+2KL6ie8iImI14iCrFUuALfuFtwxpEXG2nP7
 jeZQINGzazCVQEdh2NkN4QiR1apqUNeHcNwoCeeQ7YYUtEdh/f/xZMRZc+LdhW9Tx/
 lmYuk7NnENa9Q==
Message-ID: <5528dc53-20a7-49fa-81f8-4068ff85987a@kernel.org>
Date: Sat, 13 Apr 2024 17:52:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240411183753.2417792-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240411183753.2417792-1-daeho43@gmail.com>
X-Spam-Score: -7.5 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/12 2:37, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Since the allocation happens in conventional LU
 for zoned storage, we > can allow direct io for that. > > Signed-o [...] 
 Content analysis details:   (-7.5 points, 6.0 required)
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
 -2.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rva4N-0005cL-UW
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: allow direct io of pinned files
 for zoned storage
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

On 2024/4/12 2:37, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Since the allocation happens in conventional LU for zoned storage, we
> can allow direct io for that.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

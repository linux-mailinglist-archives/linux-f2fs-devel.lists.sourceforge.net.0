Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C8705C60
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 03:24:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz5uD-0007kN-Pv;
	Wed, 17 May 2023 01:24:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz5uB-0007kH-Ut
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q7oaQd+JUKMmFTL2mTeE5PEkbelSrN2kK/TmhFcL4nw=; b=jNpeeQUukQXzNRccMp/R1tfY3q
 TqEDZSXcj4b0wdUXkJNA9yRZtYPtbG5tCZt+3ThWUDvkMTxFonswrlsyfjVWmMbeXbiWqtqPN6+xZ
 2IzRcqMp8RyZj4jABBInJvDyhJMgNFJp6+UxORE6QXjXqGvAgJ6tlV8Rz55Vij48lHEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q7oaQd+JUKMmFTL2mTeE5PEkbelSrN2kK/TmhFcL4nw=; b=kTJyY9oW1Q6hbY8eO71xu7+u4i
 573FUDZGcQvLYj2D6mzoEct7B2w898CSvYMm5DzwIInysvH+FZOUVMu6qcoTNB43HBGSzOdkId3oo
 CflGw4MmtNqoCkLekVHDOfOQvBef+5abRoPi9ZAA5l7zEEew8gPM2eDn2W5JYpEUxphM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz5uB-00ALAb-Dk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:24:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 042E36135A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 01:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B02C433EF;
 Wed, 17 May 2023 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684286673;
 bh=nzBmOy/T5xFYP5lfhPdlsWphh5KwaFNPQTtFtCvl5Rc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=I5nbQZ/S8ayf0kqflmlilTKQiYCWs3F3UPncXGQL4P9VsWqQFQaWY4UocR7zLLMbp
 uAlB9Jm8izW2wl91bPKAFcXuQOPJwLm8VYdVPwkXk4ITy+tk3QOaWsXok/SucxgpzE
 F6vSNaE88U2jyp2QquV+0nH3761jq9fNzfXtK6WlVzDjbCl4FBRwOgUZmpfr4N5kwS
 8pCpXijAanMF1OlYcp4P0nqmFkKrFPZrSwBc40Ea3hKePnP2Xxldaoae5FQORcn5Ml
 8/gBABMs2vSomfh4+9i0yDMZNXC8ZHo8fw5eHZtFMnrD+np7k/U51TD7shqDNB+blK
 DvPXElhBoEA8Q==
Message-ID: <d56dc5ef-ec30-9429-cc15-fce0f96050c6@kernel.org>
Date: Wed, 17 May 2023 09:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20230505162633.243596-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230505162633.243596-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/6 0:26, Jaegeuk Kim wrote: > Let's avoid memory
 alignment of sb->volume_name. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz5uB-00ALAb-Dk
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate memory to handle label
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/6 0:26, Jaegeuk Kim wrote:
> Let's avoid memory alignment of sb->volume_name.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

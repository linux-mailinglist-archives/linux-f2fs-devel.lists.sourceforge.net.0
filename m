Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F039464AB0D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 00:01:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4rnh-0005lu-Ob;
	Mon, 12 Dec 2022 23:01:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4rnd-0005ln-2H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 23:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2EZPtfefn5rUz36w5lI1l5X59LjdAskcCFXB5M3gty0=; b=JJVBD0GM+1ws5yCC2fnuBqFhpa
 GUZUPUno6vRcvF7GZXoowBDP2xaGl6HUDBBWWPD8QLTxiSBgYW9HzPDi71QI1Mm/0xD2fF2OPfmTX
 F0NGRsx0WARkejvW3iPXaluHYoU1cobl1V/DkxLtC+X4g2Mr+HnA3W2uQEXn/E30bQVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2EZPtfefn5rUz36w5lI1l5X59LjdAskcCFXB5M3gty0=; b=h6fs0zylsWmY71oy8if1ubDBu5
 MiDAapDOYftHRjit/6IgetYBfaxoC530M1VHWMdyO4hqxhSiPksS4T7gkN6yE9t999yeOXgF5PVek
 Vp71NgjV4XEJYWAIqUhJnfj8KigjaDjroWAoPeAUyA4S0De0BJbN/DCHjvqQ7FoHC7CI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4rnc-0005oW-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 23:01:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 154A76125D;
 Mon, 12 Dec 2022 23:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592C7C433EF;
 Mon, 12 Dec 2022 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670886082;
 bh=9oAgjcdDOYAHUDkoGMnxE/ESGaH+GAmrrh+m5qqxu00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YmBZCjpYmZak8jMVAv7HENvrL+ypajMzY+nHvmi1I3fGWSkjFL3EQ1Pin5euLoH7O
 9MHcga12zkzVQymQw5Sn+0KiVady2ch3jeKGRI/61f9LYWKYQc+m5XSAPF+9QEZHhG
 /u40MRTpOTODV8Ay1+qXErV5BUQPJ3daK3dw3hbnaW0dIg0F9HUvoWheKDVwZ/QERg
 5ZA38QvasZ9it/7RuoNAiKxj4QSy15/Pa/szer2s1MVM/1bD1nwrS1pjI8uEZTX5hU
 LG1tgWdxOtUvLEUog/McIOaYGvoCvbvIyNoNsNMTuMcrkkityIx0lxkzDDgGpqOF2R
 OG7lbWGCdzgKA==
Date: Mon, 12 Dec 2022 15:01:20 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5eywH6M+2si0fRE@google.com>
References: <20221212054706.65579-1-frank.li@vivo.com>
 <5cc534fc-1192-887a-91e1-2f1c2283b212@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cc534fc-1192-887a-91e1-2f1c2283b212@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Please check the previous comment. On 12/12, Chao Yu wrote:
 > On 2022/12/12 13:47, Yangtao Li wrote: > > Just like other data we count
 uses the number of bytes as the basic > > unit, but discard uses the number
 of cmds as the statistic [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4rnc-0005oW-Eo
Subject: Re: [f2fs-dev] [PATCH] f2fs: add iostat support for FS_DISCARD_IO
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Please check the previous comment.

On 12/12, Chao Yu wrote:
> On 2022/12/12 13:47, Yangtao Li wrote:
> > Just like other data we count uses the number of bytes as the basic
> > unit, but discard uses the number of cmds as the statistical unit. In
> > fact, the discard command contains the number of blocks. In order to
> > avoid breaking its usage of application, let's keeping FS_DISCARD
> > as it is, and add FS_DISCARD_IO to account discard bytes.
> > 
> > Suggested-by: Chao Yu <chao@kernel.org>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB25507AA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:21:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2igm-00079e-KR; Sun, 19 Jun 2022 00:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2igl-00079Y-Lw
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7BbjoMMGvIqkHcYsuwF8s0lnu5U/ZdWplHMYrTmhtY=; b=X/6UMyBWna8o0oe6IYMf5Zo57n
 4SoEUnMjoISvnntO96vgyMr/OD53dNwp15HKVaeNYywqhlZkqjeR4K+rXTJZKLXfj1vuVG/y8arIk
 a1Np991Mc73mUN7+a6mR3XINJsbsN5gBM2YHlcG47gf0hrnhM7qh10ZnPaYvbg1rDhsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7BbjoMMGvIqkHcYsuwF8s0lnu5U/ZdWplHMYrTmhtY=; b=NXG6QftNuIDxzB0HJFD27YFoqC
 V6gQ1zFwTZ+m3IXCCIoZngjUq2uaLPY/Gjuvh7IUMIlVSuoaiky+FO93MP+E0xTEavPmduZfftTYD
 6oU6xHyUxaJIQ5a6YAwpx/aKLq04N5xFsn03xubAmt61wS8WBebMMcT6FiCT+aQaOhRw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2igf-0003kl-5g
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52EFB60DEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 00:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E92C3411A;
 Sun, 19 Jun 2022 00:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655598059;
 bh=09d9MnSyiwLCv++b2rqR06abAhRiHJhBnmH9L7iGKpA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=u/R5pG6SSNEqLBRU796YUyI7IizLhntu5RIUIfzhsxWyAX6LTy44ex23Vg17crKaz
 YZwzxKzUhaQOs4AMc587w+tGEG228OVt7tR97XhiyrpoFlb78P2dcvkaSv5czEo31s
 g+exwN5SjXrSCcuLwUJMZfAASmw0k4RLtpp9feF28dPapd+hZ1AQm2v9twlC73bjWn
 88MXfW7kCAojHDJBqlcFAcacqvDb23JkDraWuxRWl4twOzOgozc+nOrzrvgRzIPnvA
 62w4O5FGrkmUq4EySOy0EkwwGGDwkGXtmBh2qifumDpo2Gyu/RSKul6MQ3C0wtGff3
 3vU2QtiFiiOuQ==
Message-ID: <ac716cd2-03f0-f9e3-4ff5-95cc8e5333da@kernel.org>
Date: Sun, 19 Jun 2022 08:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20220615165610.1074259-1-jaegeuk@kernel.org>
 <20220615165610.1074259-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220615165610.1074259-2-jaegeuk@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/16 0:56,
 Jaegeuk Kim wrote: > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> > --- > tools/f2fs_io/f2fs_io.c | 5 ++++- > 1 file
 changed, 4 insertions(+), 1 deletion(-) > > diff --git a/tool [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2igf-0003kl-5g
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: add dsync option for write
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

On 2022/6/16 0:56, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   tools/f2fs_io/f2fs_io.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 2f0fc7b25d41..e7359836b126 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -508,7 +508,8 @@ static void do_erase(int argc, char **argv, const struct cmd_desc *cmd)
>   "  rand          : random numbers\n"			\
>   "IO can be\n"						\
>   "  buffered      : buffered IO\n"			\
> -"  dio           : direct IO\n"				\
> +"  dio           : O_DIRECT\n"				\
> +"  dsync         : O_DIRECT | O_DSYNC\n"		\

Should update manual as well.

Thanks,

>   "  osync         : O_SYNC\n"				\
>   "  atomic_commit : atomic write & commit\n"		\
>   "  atomic_abort  : atomic write & abort\n"		\
> @@ -552,6 +553,8 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
>   
>   	if (!strcmp(argv[5], "dio"))
>   		flags |= O_DIRECT;
> +	else if (!strcmp(argv[5], "dsync"))
> +		flags |= O_DIRECT | O_DSYNC;
>   	else if (!strcmp(argv[5], "osync"))
>   		flags |= O_SYNC;
>   	else if (!strcmp(argv[5], "atomic_commit"))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF3705CAC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 03:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz6MM-00082O-K1;
	Wed, 17 May 2023 01:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz6MK-00082G-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QjofgqjwawySEsvD1iHQqGMqNCLabSPfpaDmVWGUYNw=; b=WRrTGSEZ7QEjuYAdfePdamQ5EV
 Ixt+QuGKIEbY6UZ4hE+3or1dVok3+8sIYIgodr9pZDqq2U0eqdK5Sog2IpVeZpYF6yFM3AzAUA1YX
 0KrUTvbjAGhfbtX0h/VI8zVgcKLE/TzUHu9/JH7oGahb/A2jEZW6FKO1QnmPeK5d6w5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QjofgqjwawySEsvD1iHQqGMqNCLabSPfpaDmVWGUYNw=; b=YOMVH/Ty0tSL73SPNOdZstCJI9
 NOsTTBgf2iPGM4hdLLu6izst3xlYmRMUrSpseoxZypPRtaOV+jHNc+0uGni77cLbDPlXRjHe3gkgP
 LwnAlKCRDhgJgYXF4CQux1KJDIIHhE4qmpGaor0S/BklEVVfvuE7jbcxs4zrY0PbGGlM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz6MK-00AMoG-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:53:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE7CD6135A;
 Wed, 17 May 2023 01:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB4DC433EF;
 Wed, 17 May 2023 01:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684288418;
 bh=FC6FaE21JR+xvGoYrnHBpKuYVivoBf+/2IreDX0dUiY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o3B+5NCSyX/HGGxU8c231ZtP2xbDPb02DJhfTCk8PLv9FQB1xcIj4UhX4uQmDo1XT
 fiOEuAbZXGTVwzvnxc4PEtvs9f84jS4gHq2cu5CF4bcJ7W9oQSm56oz8aj0iVoLK9u
 D3Mlktt9BL3WXE+0rryn9Pe25S6gusG5DI1TJbzQTjrGLaNkyFqN5XSqAB4OmqLRid
 7dxnldvGOgBY2s5Hkw48gwiCj2mLy9bAYmeX0JRXDRLcW/KoE6ECbMSnxPz/vHJUbV
 mR9eLgA0NhaZ/jLpDVOY0lg5541U+AXBKbACIUtWAc6A8jLvYRt3yhNlresPrvX7+e
 oyOhdmFk1d2kA==
Message-ID: <f5cd52e3-802a-f36c-ebe5-647875c355c3@kernel.org>
Date: Wed, 17 May 2023 09:53:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230506114537.49470-1-frank.li@vivo.com>
 <20230506114537.49470-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230506114537.49470-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/6 19:45,
 Yangtao Li wrote: > Expend fallocate command
 to support more flags. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 > --- > tools/f2fs_io/f2fs_io.c | 37 ++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz6MK-00AMoG-B7
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: expend fallocate command
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/6 19:45, Yangtao Li wrote:
> Expend fallocate command to support more flags.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 126e1f9..1be8c9e 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -416,6 +416,10 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
>   "f2fs_io fallocate [keep_size] [offset] [length] [file]\n\n"	\

It needs to update above description, and manual as well?

f2fs_io fallocate [-cipz] [keep_size] [offset] [length] [file]

Thanks,

>   "fallocate given the file\n"					\
>   " [keep_size] : 1 or 0\n"					\
> +" -p : punch hole\n"						\
> +" -c : collapse range\n"					\
> +" -z : zero range\n"						\
> +" -i : insert range\n"						\
>   
>   static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
>   {
> @@ -423,20 +427,43 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
>   	off_t offset, length;
>   	struct stat sb;
>   	int mode = 0;
> +	int c;
>   
> -	if (argc != 5) {
> +	while ((c = getopt(argc, argv, "cipz")) != -1) {
> +		switch (c) {
> +		case 'c':
> +			mode |= FALLOC_FL_COLLAPSE_RANGE;
> +			break;
> +		case 'i':
> +			mode |= FALLOC_FL_INSERT_RANGE;
> +			break;
> +		case 'p':
> +			mode |= FALLOC_FL_PUNCH_HOLE;
> +			break;
> +		case 'z':
> +			mode |= FALLOC_FL_ZERO_RANGE;
> +			break;
> +		default:
> +			fputs(cmd->cmd_help, stderr);
> +			exit(2);
> +		}
> +	}
> +	argc -= optind;
> +	argv += optind;
> +
> +	if (argc != 4) {
>   		fputs("Excess arguments\n\n", stderr);
>   		fputs(cmd->cmd_help, stderr);
>   		exit(1);
>   	}
>   
> -	if (!strcmp(argv[1], "1"))
> +	if (!strcmp(argv[0], "1"))
>   		mode |= FALLOC_FL_KEEP_SIZE;
>   
> -	offset = atoi(argv[2]);
> -	length = atoll(argv[3]);
> +	offset = atoi(argv[1]);
> +	length = atoll(argv[2]);
>   
> -	fd = xopen(argv[4], O_RDWR, 0);
> +	fd = xopen(argv[3], O_RDWR, 0);
>   
>   	if (fallocate(fd, mode, offset, length) != 0)
>   		die_errno("fallocate failed");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC219892DE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2024 05:12:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sukLq-0000Ts-Lq;
	Sun, 29 Sep 2024 03:12:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sukLp-0000Th-WB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 03:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlTXdaQnACqH+WWHzPpqUyivr8Tlfb7mm2TuHYzl8Ds=; b=e3W41l4F9H1RbpgROsj9FmBxHS
 2sK9x82/+8nds/s1EY+bwEThWWJYhRVspa7ImeFSxDT7+fwdtwKhFDsXnrUSv8agsXdDgPUdTZVYw
 DHbHBNGfgwBRRFUPIYPOKv7DZi0b+jI/gNbfh3ZrU7/djSe4mlqputMAlUXTYyqJzd38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlTXdaQnACqH+WWHzPpqUyivr8Tlfb7mm2TuHYzl8Ds=; b=gxTPuNKaUnfF2LqirpMQ4CDQnq
 McJAExewbZGruWCLDDTDpHeD3E/LmaqRIP1wTDjj8SW+SF8Zs8sHYQ3P4mAYAVQAdVdu9u/pxoYAK
 sDDGl4ZsE/PEJcagJVNDVAYGboDj631UbcRZDReuaSrIq+2Khh2PO41VF4br1FLKta6k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sukLp-0005xD-8q for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 03:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D795E5C056B;
 Sun, 29 Sep 2024 03:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2CCC4CEC9;
 Sun, 29 Sep 2024 03:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727579515;
 bh=76+YM5RNY8hFlLvb9Gs+AudEc4+2Wuz4vt2UtYgUDj4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=A138h1MD5Z4fzE9VEJe7pTU4wQbaM9Bl0BTAJV/OgpuAm0Zz/Ugd3BUP6V0bhMdi7
 bnyRBuu2fPkKSCTRdz6XNqheMu9+ZEiqLY5QSg+5f03iQZFqUQjgANXHqyiBxCFjxT
 HJkDsZx8Oo1sIwXGrRqjfMQn6LLUVDpeeLnvOXeke8qT4huu6ERnOezlb2ekT13l5t
 nwg1hns6g+Qo6Wnz5ZARp8gw/jSVOebwX6/pxID0OocDy4SlgVD1jQy6SmmJsxXSyW
 Bsce6nFsT53K+Z9bNiliVXIxsga+PtIgDCuuL6zms/GRjtRVZVygobNCz80yJn+JTS
 uTQLkU55aYMPg==
Message-ID: <85588954-f628-48ee-b860-9454b2c4fd1f@kernel.org>
Date: Sun, 29 Sep 2024 11:11:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org
References: <20240927025218.191544-1-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20240927025218.191544-1-weilongping@oppo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Longping,
 Missed to update manual of f2fs_io? On 2024/9/27
 10:52, LongPing Wei wrote: > Signed-off-by: LongPing Wei <weilongping@oppo.com>
 > --- > tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++ > 1 file
 changed, 25 insertions(+) > > diff [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sukLp-0005xD-8q
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add fdatasync
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, Longping,

Missed to update manual of f2fs_io?

On 2024/9/27 10:52, LongPing Wei wrote:
> Signed-off-by: LongPing Wei <weilongping@oppo.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 94f0adf..8fbad3c 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -174,6 +174,30 @@ static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
>   	exit(0);
>   }
>   
> +#define fdatasync_desc "fdatasync"
> +#define fdatasync_help						\
> +"f2fs_io fdatasync [file]\n\n"					\
> +"fdatasync given the file\n"					\
> +
> +static void do_fdatasync(int argc, char **argv, const struct cmd_desc *cmd)
> +{
> +	int fd;
> +
> +	if (argc != 2) {
> +		fputs("Excess arguments\n\n", stderr);
> +		fputs(cmd->cmd_help, stderr);
> +		exit(1);
> +	}
> +
> +	fd = xopen(argv[1], O_WRONLY, 0);
> +
> +	if (fdatasync(fd) != 0)
> +		die_errno("fdatasync failed");
> +
> +	printf("fdatasync a file\n");
> +	exit(0);
> +}
> +
>   #define set_verity_desc "Set fs-verity"
>   #define set_verity_help					\
>   "f2fs_io set_verity [file]\n\n"				\
> @@ -1808,6 +1832,7 @@ static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
>   const struct cmd_desc cmd_list[] = {
>   	_CMD(help),
>   	CMD(fsync),
> +	CMD(fdatasync),
>   	CMD(set_verity),
>   	CMD(getflags),
>   	CMD(setflags),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

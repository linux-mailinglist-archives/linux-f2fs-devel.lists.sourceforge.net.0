Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD789E86C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 05:25:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruOaY-0001g6-S9;
	Wed, 10 Apr 2024 03:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruOaX-0001fu-MD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 03:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8NqiUGI/owx4bMxzJnbRahoWFSgmA41Rba1UMqLtZtM=; b=MhgdvRhXbx6bqTyaBpRFFfUvMb
 kyiTKnpkEj5z1LO0REtx2Dx8s7eNw9+pwT1h+A6Ds7Z+odMhy7Yu8DEq+fcz1GbB0Dyd0S4WZ6KBB
 3bYpYX8+SgR8Q8m3gM73p58bADm3ZbZ/zpJPz+cMNUWX1KgX22hvRtr2SE6B72l4BS5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8NqiUGI/owx4bMxzJnbRahoWFSgmA41Rba1UMqLtZtM=; b=LZZ9USMy9rr3JSXBNQIJZ4U3d7
 rxIEm8tWd1jYQUvI1Hsa+mL6in8+PCVeZAxkjrcwT2JHBAd7KWGyI2eVzZSQusNGIUFeWcV5Kbzo8
 NPZ0hDtpQ/Hy/i7RtQzE3/W4/ov50RAFOhOw1xnPA7kHmB2vPlrBv/is6YyMC5ccdR1M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruOaJ-0006Fp-7f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 03:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C053B61987
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Apr 2024 03:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3722C433C7;
 Wed, 10 Apr 2024 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712719503;
 bh=GzGhNvYGdLIi+kMgO8kPNpP8tml7TdrIQMuncLk8WJg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d95eEhWkuMPeRqZwG/Z12essSaLeqdG72WCPeH+mijcI+oiZFR+8PLs9vxvIxqVv/
 RLiaj5dfGLovzFPyix/UlqpyrrqKGWX0zdgQlhAM8zHFbwHCcxA2w0RT6QqBAANpmb
 uuVouWl8/irs2LdGnge7uoxKWtwu18TP1xQ5Hd7nmVJJZCOsy5ar/mtyrQbpa5iJPE
 q3yS5bLXU+EFFhC+udGcgz8QyDITv6vj0hO3Hmh0V/KeoVF4ms1VZGOSb2YUtKZ9Qo
 CjztplOuro5fvNfP9pKRhjV7k0qCMHKK2NOT74qJ0MgF8SsKtQg0ZiQsSl4udvY1RV
 gfXQeKemambdQ==
Message-ID: <9280018c-c023-4254-9936-d79d3dfe84ff@kernel.org>
Date: Wed, 10 Apr 2024 11:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20240329102542.3577458-1-chao@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240329102542.3577458-1-chao@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, Missed to check this patch? On 2024/3/29 18:25, Chao
 Yu wrote: > This patch adds unset subcommand for pinfile command. > > Usage:
 f2fs_io pinfile unset [target_file] > > Signed-off-by: Chao Yu
 <chao@kernel.org> > --- > man/f2fs_ [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruOaJ-0006Fp-7f
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: support unset subcommand for pinfile
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

Ping,

Missed to check this patch?

On 2024/3/29 18:25, Chao Yu wrote:
> This patch adds unset subcommand for pinfile command.
> 
> Usage: f2fs_io pinfile unset [target_file]
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   man/f2fs_io.8           |  2 +-
>   tools/f2fs_io/f2fs_io.c | 11 +++++++++--
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
> index f097bde..b9c9dc8 100644
> --- a/man/f2fs_io.8
> +++ b/man/f2fs_io.8
> @@ -44,7 +44,7 @@ going down with metadata flush
>   going down with fsck mark
>   .RE
>   .TP
> -\fBpinfile\fR \fI[get|set] [file]\fR
> +\fBpinfile\fR \fI[get|set|unset] [file]\fR
>   Get or set the pinning status on a file.
>   .TP
>   \fBfadvise\fR \fI[advice] [offset] [length] [file]\fR
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index b8e4f02..a7b593a 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -442,7 +442,7 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
>   
>   #define pinfile_desc "pin file control"
>   #define pinfile_help						\
> -"f2fs_io pinfile [get|set] [file]\n\n"			\
> +"f2fs_io pinfile [get|set|unset] [file]\n\n"			\
>   "get/set pinning given the file\n"				\
>   
>   static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
> @@ -464,7 +464,14 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
>   		ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE, &pin);
>   		if (ret != 0)
>   			die_errno("F2FS_IOC_SET_PIN_FILE failed");
> -		printf("set_pin_file: %u blocks moved in %s\n", ret, argv[2]);
> +		printf("%s pinfile: %u blocks moved in %s\n",
> +					argv[1], ret, argv[2]);
> +	} else if (!strcmp(argv[1], "unset")) {
> +		pin = 0;
> +		ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE, &pin);
> +		if (ret != 0)
> +			die_errno("F2FS_IOC_SET_PIN_FILE failed");
> +		printf("%s pinfile in %s\n", argv[1], argv[2]);
>   	} else if (!strcmp(argv[1], "get")) {
>   		unsigned int flags;
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

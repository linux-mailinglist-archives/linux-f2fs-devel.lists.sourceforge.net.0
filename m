Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ai3Gh7+p2mlnAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:40:46 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEE1FDC19
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DpGrqax6YyYZPyfuIBWNWLI/+/d5Yz1gDvNkai0leo=; b=hFrVPAnRXwGMlQG1qnJrkSD2sE
	fCP+9M5IAWzFLx1d+O2c2x2awr4Se7TYrpJ3QKZnoVWrNc9aNokbthsQpbJJHn2CkAJiB7u5msaso
	0p/9Ps3uvhzCkeXoyEDHFq2RtdkNUVnsy9S02RcvIWR1/RuVa/lLcKA1EX9s7aVBqD6c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxiig-0000zi-1G;
	Wed, 04 Mar 2026 09:40:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxiia-0000zU-34
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nFBC7y1dz6HRnbqNqOAYhdXbCAYxMMMsUwbQ8zWMrk4=; b=RlxZPPJCqmENffK+kpwHQ/HLyP
 O9kIeeu5A1QeBJFXSRhQ3Ea8bILfuVMp2Mr6u4UkIQg/gPKe7y/ad8+jEs0ruIRxy8zAkLX3XkyV0
 yWTZU9SdIRR7im8Dw0djf8naqEji3pLQI4shDbihT7y+udOFD0ZA5Kvdj2yPc5hQlm+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nFBC7y1dz6HRnbqNqOAYhdXbCAYxMMMsUwbQ8zWMrk4=; b=jW6HFz9NCgOHSL57Ry3lgpOfGJ
 3T5ueeVpzKN5vUE/zVaiKObVEbos8sxXTd6aSgNva8/nrc79qv70nThyhxZwE5FvCqxObwCTBqp3f
 ehMRQRR7qF6G21U8n7yrmwLqFAwNrNKXqGZnrZbxGRhV/Jr+9y9zbyRIK8tQVNHMktnQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxiiZ-00083M-3q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B713140D6E;
 Wed,  4 Mar 2026 09:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B77DC19423;
 Wed,  4 Mar 2026 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772617224;
 bh=vpm5HhOoV43QsHFyBrRPTbyeX9qkhavO7eQnxiUJu9A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GiYXYvMktTDPsYFSmTdEmFdu7bYUfyxG9xIP/TOQxgg/qDfQZUgjSjgLBfbgUhM70
 KMSCHo4olUPOHLVox10NJuml2WvpWGT2rWpXJuUqDziNSHuTWk6ZEKY8tlanno652/
 n2BLYwZmNR56zA7JxsA47slymdGdachQfaGZCFslU5taWv//NvZjVOXxYYN7yi5HLG
 l1ds5QBpNYu3dtInGdAANVBrcdQv0bo8H0NEUyk6CSR4cDc+avzmVWhlqSDuYYTi4N
 loGEv8ui1ZhpALZLQx/FK8QoGDcufG2Lcw46r/XOy8mUOOHPBCoqLktBOYp5WtD50D
 9KnnQ33E2fZ7Q==
Message-ID: <a649de9a-619b-47a6-81bf-5b0feafb7325@kernel.org>
Date: Wed, 4 Mar 2026 17:40:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203134027.3942948-3-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260203134027.3942948-3-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/3 21:40, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Add a flags parameter to the fiemap subcommand, 
 allowing the > specification of whether to retrieve file map [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxiiZ-00083M-3q
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add flags parameter to fiemap
 subcommand
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 92BEE1FDC19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026/2/3 21:40, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Add a flags parameter to the fiemap subcommand, allowing the
> specification of whether to retrieve file mappings after writing to the
> file.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 4429e0b..3b19724 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -1341,8 +1341,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>   }
>   
>   #define fiemap_desc "get block address in file"
> -#define fiemap_help					\
> -"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
> +#define fiemap_help							\
> +"f2fs_io fiemap [offset in 4kb] [count in 4kb] [flags] [file_path]\n\n"	\
> +"flags can be the following values:\n"					\
> +"0: No extra actions\n"							\
> +"1: Sync file data before map\n"					\
>   
>   #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>   static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
> @@ -1350,10 +1353,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   	unsigned int i;
>   	int fd, extents_mem_size;
>   	u64 start, length;
> -	u32 mapped_extents;
> +	u32 mapped_extents, flags;
>   	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
>   
> -	if (argc != 4) {
> +	if (argc != 5) {

Can we accept new flags as optional? otherwise, it will break userspace usage on
this f2fs_io fiemap.

Thanks,

>   		fputs("Excess arguments\n\n", stderr);
>   		fputs(cmd->cmd_help, stderr);
>   		exit(1);
> @@ -1362,10 +1365,12 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   	memset(fm, 0, sizeof(struct fiemap));
>   	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
>   	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
> +	flags = (u32)atoi(argv[3]);
>   	fm->fm_start = start;
>   	fm->fm_length = length;
> +	fm->fm_flags = flags;
>   
> -	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
> +	fd = xopen(argv[4], O_RDONLY | O_LARGEFILE, 0);
>   
>   	printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
>   				start / F2FS_DEFAULT_BLKSIZE,
> @@ -1381,6 +1386,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   	memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);
>   	fm->fm_start = start;
>   	fm->fm_length = length;
> +	fm->fm_flags = flags;
>   	fm->fm_extent_count = mapped_extents;
>   
>   	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

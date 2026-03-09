Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD+lD/A3rmlyAgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:01:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD52336B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwIScSf/FLMPxeBN1Ne5l4zUhMoR2xEPgtPWnP9FOgk=; b=F0AS1F7kkp54vWgHhaqdfyX8kW
	/yrM5e/d0lmyUWHGGYkgqRaYC64tSJ1yZ3CtpFv1iSyy+ro5/NtyX3uzGEoNoPKihQx5JXGMyaBka
	Pk4QahpZkPBbOkVp0sI+2AVEo57QxEngo1o9x5Tg2pnQ3NgJsNSxdgu0Eioe12rhLDyY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzQrY-0006wn-Rz;
	Mon, 09 Mar 2026 03:00:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzQrE-0006wS-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vmETg8TaEx3KDR0d5XulFIgGhvXX4XrvA45HZfaVB3Q=; b=Jy5rGqBaCsv2iOVnnyvC2T56A5
 0iBwAFsbW4Qr+sz34BxnjXm18GRptg+TFVRmIUhpxbfbMfK40ZNLgKy2NPNCs4VuFReHtGQVE0wsG
 A+hj375e3CrGVs+w7kcP8ZWFEbAeuGFp5dQPVce9loYmban8+xI2rwsFG/3juEo7VpoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vmETg8TaEx3KDR0d5XulFIgGhvXX4XrvA45HZfaVB3Q=; b=fAo/s1sgrAnCvB+ziTse3+4PSO
 t3szAesy6hbKxuAh2zJP/MOTWDUao/WkZ2BcAHmkVpl9+zCOwYtAv15lqsX5wby+cfnWqm3EjAxRV
 qUzD2MEGWnnEidrOeOca+9zovARpFDz5oYXsusMjSY47zeP54rSEx9eNvd94b44Cin4w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzQrC-0004nf-Dc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DCDFD600AD;
 Mon,  9 Mar 2026 03:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BF5C116C6;
 Mon,  9 Mar 2026 03:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773025226;
 bh=3Z7q6Em/3WGKz8bEXx6MSRiPKv/Hys/VXwlREbFDbDI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fcVbfNEWLkjq/Gfa8e4sy8gj8yT6ZgIy6/BB4I+7e3S4qTM/T7rPcyTfis9ng0Kjn
 OCrqRVkD1xIJkhFkAZ6zfnt0ByUYQ9emKbpxFT9k5uUJcAHf+Lp5FHkB2ozRY3KEmZ
 sdbIUZl0M0a/Q1CvoU/gAZvrlwqPVq9tSryqRytQFQ52PC+yoS8B64ruI+WVkxLBFv
 MGnq8QtBlxLxP7YR17/RJWI4B1bz42p7exizI+hXObkgGioDDS/EeaQ/TC3R2Alxo7
 946vx7Ux2oOr5WVx6Q/vM7KI7gix6ioV1QMJTNMA1lcrLofjNC0cHz3jcfRDWD/+AN
 /4Uz8DHNcVVyw==
Message-ID: <8accb7ba-4e97-4484-8e7d-98ce126c0369@kernel.org>
Date: Mon, 9 Mar 2026 11:00:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260305125015.1717396-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260305125015.1717396-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/5/26 20:50, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Add a flags parameter to the fiemap subcommand, 
 allowing the > specification of whether to retrieve file mappi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzQrC-0004nf-Dc
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: add flags parameter to fiemap
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6CCD52336B5
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 3/5/26 20:50, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Add a flags parameter to the fiemap subcommand, allowing the
> specification of whether to retrieve file mappings after writing to the
> file.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  man/f2fs_io.8           |  2 +-
>  tools/f2fs_io/f2fs_io.c | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
> index 5c3d204..51ccfaf 100644
> --- a/man/f2fs_io.8
> +++ b/man/f2fs_io.8
> @@ -138,7 +138,7 @@ mmap(MAP_POPULATE)
>  mmap() + mlock()
>  .RE
>  .TP
> -\fBfiemap\fR \fI[offset in 4kb] [count] [file_path]\fR
> +\fBfiemap\fR \fI[offset in 4kb] [count] [file_path] {flags}\fR
>  get block address in file
>  .TP
>  \fBgc_urgent\fR \fIdev [start|end|run] [time in sec]\fR
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index c977f4d..9bca498 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -1357,8 +1357,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>  }
>  
>  #define fiemap_desc "get block address in file"
> -#define fiemap_help					\
> -"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
> +#define fiemap_help							\
> +"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path] {flags}\n\n"	\
> +"flags can be the following values:\n"					\
> +"0: No extra actions, by default\n"					\
> +"1: Sync file data before map\n"					\

What about supporting all flags below? although we didn't limit supporting
all bits in code part.

/* flags used in fm_flags: */
#define FIEMAP_FLAG_SYNC	0x00000001 /* sync file data before map */
#define FIEMAP_FLAG_XATTR	0x00000002 /* map extended attribute tree */
#define FIEMAP_FLAG_CACHE	0x00000004 /* request caching of the extents */

Thanks,

>  
>  #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>  static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
> @@ -1366,10 +1369,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>  	unsigned int i;
>  	int fd, extents_mem_size;
>  	u64 start, length;
> -	u32 mapped_extents;
> +	u32 mapped_extents, flags = 0;
>  	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
>  
> -	if (argc != 4) {
> +	if (argc < 4 || argc > 5) {
>  		fputs("Excess arguments\n\n", stderr);
>  		fputs(cmd->cmd_help, stderr);
>  		exit(1);
> @@ -1378,8 +1381,11 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>  	memset(fm, 0, sizeof(struct fiemap));
>  	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
>  	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
> +	if (argc == 5)
> +		flags = (u32)atoi(argv[4]);
>  	fm->fm_start = start;
>  	fm->fm_length = length;
> +	fm->fm_flags = flags;
>  
>  	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>  
> @@ -1397,6 +1403,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>  	memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);
>  	fm->fm_start = start;
>  	fm->fm_length = length;
> +	fm->fm_flags = flags;
>  	fm->fm_extent_count = mapped_extents;
>  
>  	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

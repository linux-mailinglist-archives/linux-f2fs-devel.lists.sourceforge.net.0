Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F863F29FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 12:16:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH1ZM-0003KS-4o; Fri, 20 Aug 2021 10:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mH1ZK-0003Jg-Gs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ShM4WyRR70tWi8jac6eT6t94LCnni6XEjxA1RJX+0eA=; b=hfscSs6NNWbE6XroMLtOrfuFTl
 fNYgUSkel9+rVVsVFP2yL47/NE/obJIqb7AebiQYpmSXVeKF2KLQ4EvibQcqTwzT1QJ0EQbhhZ0Cy
 BbKAJn/EjNoog58HpCWXd9XRUnZP/opCm2HCUuiHpUiIIzvjkIzM+xZYruex83U+jdfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ShM4WyRR70tWi8jac6eT6t94LCnni6XEjxA1RJX+0eA=; b=KmeYSL8R2kb4+3MtdgigxZL8Pi
 D1Xvn7LnjAtMRfBgJpaOV7iQ/mNdzTH0H5C+mja3e95Qebl5C7Fe2Wym12ZVVkx7osLJ4bXNWIKbD
 DXwZp1QwvV8Vo0ElNeimjfpealQePY6K8LYSj5WTuHmL9rRG49uvFnFLtIF2Le2L+xnM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH1Z4-00CaAP-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:16:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAB9961106;
 Fri, 20 Aug 2021 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629454548;
 bh=CBrORSLHaWU8FbMU4GyCeZ7OKQ4Gi+xXP5M2F5cMJBA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oGq6jA8ZvTR/6qHrzuvBW/jjqy/T85Jh0XyrcY8Z2DVRkuixp/c1UCv6DyejIOw9j
 gdoxZAf4491gutFClmZhlStKun0T04dHyfSWEvWfNEbLje5T9PYyLa4yVSmzvvuv+/
 OaLyz9z/QJeP39Q1J/2+Y4JLEQsZdakpx83pZxWfmu14HvwpSP7l4kc/pFJ9XMt/5w
 avIp5Gf5eMJj7YIYP4oS/ikVoq4/8MvYpr3L2mqLDEORAlwXBc477yzAESnTN+ON6R
 8SlwbevPGkNXC6tL8WqTJ331bznwgIVjKWFrqfkCvZWyO5zYKVOvMXyxYoILPU8Ufq
 uSv5og8HQS6Fg==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210808215234.1939266-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <5cce41d6-d59a-0596-6d14-e313aa91c78b@kernel.org>
Date: Fri, 20 Aug 2021 18:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210808215234.1939266-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/9 5:52,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Given fiemap way to print out extents in the kernel, we can correctly
 > print the layout of each file in a unit of [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mH1Z4-00CaAP-Tm
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: change fiemap print out format
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

On 2021/8/9 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Given fiemap way to print out extents in the kernel, we can correctly
> print the layout of each file in a unit of extent, not block. So, I
> changed fiemap print out way like below.
> 
> Fiemap: offset = 0 len = 60
> 	logical addr.    physical addr.   length           flags
> 0	0000000000000000 00000020032df000 0000000000004000 00001008
> 1	0000000000004000 00000020032e0000 0000000000004000 00001008
> 2	0000000000008000 00000020032e1000 0000000000004000 00001008
> 3	000000000000c000 00000020032e2000 0000000000004000 00001008
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   tools/f2fs_io/f2fs_io.c | 53 ++++++++++++++++++++++++++---------------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 42dbd60..0d2948e 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -731,11 +731,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>   #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>   static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   {
> -	unsigned count, i;
> -	int fd;
> -	__u64 phy_addr;
> -	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
> -			sizeof(struct fiemap_extent));
> +	unsigned int i;
> +	int fd, extents_mem_size;
> +	u64 start, length;
> +	u32 mapped_extents;
> +	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
>   
>   	if (argc != 4) {
>   		fputs("Excess arguments\n\n", stderr);
> @@ -743,26 +743,41 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>   		exit(1);
>   	}
>   
> -	fm->fm_start = atoi(argv[1]) * F2FS_BLKSIZE;
> -	fm->fm_length = F2FS_BLKSIZE;
> -	fm->fm_extent_count = 1;
> -	count = atoi(argv[2]);
> +	memset(fm, 0, sizeof(struct fiemap));
> +	start = atoi(argv[1]) * F2FS_BLKSIZE;
> +	length = atoi(argv[2]) * F2FS_BLKSIZE;
> +	fm->fm_start = start;
> +	fm->fm_length = length;
>   
>   	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>   
> -	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
> -				(u64)fm->fm_start / F2FS_BLKSIZE, count);
> -	for (i = 0; i < count; i++) {
> -		if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> -			die_errno("FIEMAP failed");
> +	printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
> +				start / F2FS_BLKSIZE, length / F2FS_BLKSIZE);
> +	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> +		die_errno("FIEMAP failed");
> +
> +	mapped_extents = fm->fm_mapped_extents;
> +	extents_mem_size = sizeof(struct fiemap_extent) * mapped_extents;
> +	free(fm);
> +	fm = xmalloc(sizeof(struct fiemap) + extents_mem_size);
>   
> -		phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
> -		printf("%llu: %llu\n", fm->fm_start / F2FS_BLKSIZE, phy_addr);
> +	memset(fm, 0, sizeof(struct fiemap));
> +	memset(fm->fm_extents, 0, extents_mem_size);

Is that equals to memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);?

> +	fm->fm_start = start;
> +	fm->fm_length = length;
> +	fm->fm_extent_count = mapped_extents;
>   
> -		if (fm->fm_extents[0].fe_flags & FIEMAP_EXTENT_LAST)
> -			break;
> +	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> +		die_errno("FIEMAP failed");
>   
> -		fm->fm_start += F2FS_BLKSIZE;
> +	printf("\t%-17s%-17s%-17s%s\n", "logical addr.", "physical addr.", "length", "flags");
> +	for (i = 0; i < fm->fm_mapped_extents; i++) {
> +		printf("%d\t%.16llx %.16llx %.16llx %.8x\n", i,
> +		    fm->fm_extents[i].fe_logical, fm->fm_extents[i].fe_physical,
> +		    fm->fm_extents[i].fe_length, fm->fm_extents[i].fe_flags);
> +
> +		if (fm->fm_extents[i].fe_flags & FIEMAP_EXTENT_LAST)
> +			break;
>   	}
>   	printf("\n");
>   	free(fm);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

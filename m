Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9DCBC358
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 02:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQwYWZMkbDkGnxaqgtWdus/ag463nJ+rTLJGsBOvoRI=; b=HnYS9OQzp/hO54Cpz5XKDP5XM0
	rnBVNmnp6f0+YoYrN7RIfKrWtooe3q4F4HGmI303x2pQuGQUjy1Fo2Fkl6l43ObH7ST9wzjzjO4hh
	lF/z36ZyMgaoz3x/CEiMhqM0IChPKl3VdmSdtXvWCU9mxQtlcP0ZiKcE8rOz5eXvCaNI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vUxhx-0007qy-G8;
	Mon, 15 Dec 2025 01:49:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vUxhw-0007qq-6f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5K50Xo8RLcvocwZzgMAYQXBs6MU7DYOVmd/iedT2zk=; b=dkel8xbyZHiu1udTYss//jxr0S
 Wp51dYnswkJ1p4tpefqw+0MU8BOjj9rMFMUaeWWIkiPiHrTHWAwGek30+BxA+gmScgyEQderFnKXE
 UpawD2ybdsGNqk347hVw8RFhG3d+I/XhPYAEcpwHFuUJmLlm8OgHxA2gaknjz33zJxks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V5K50Xo8RLcvocwZzgMAYQXBs6MU7DYOVmd/iedT2zk=; b=Il2D+WVfNaj9tCvDTQ6Nrm+ac4
 0MGTFgJVKFtNmB6OrhUi7La2b6aFoWDjE1Qu+6fa8OO2SJ+IUmQyCGeDp59HbBPpXK2EKTBFbhlXw
 64veTY2R4UDSB3McjiEWfnLI5pvG60yVHwY9B78u+UsZlyu9WMhS48atGl3vQ+qcexXk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vUxhv-0006Ry-IX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E608660127
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 01:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C96DC4CEF1;
 Mon, 15 Dec 2025 01:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765763332;
 bh=si9NJ5dtBzkbGnlC/4glJgD/UfjNDkcc0wwfO9qPPNY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UbafGgYO/c4OOt3vaZr+UnRJSHMdg1b6JvaaoPUV7bxgxQ9oon0nV2/0+fOmRhXJ3
 hiaGG7WNzkhw0zicnDrSq6mLnGvNB9acW9Fy1aGby9Ls2KWPuah73wleQe96DhzkjB
 nQ2H6aOdBzzsqsB8AyuQJhzEL9eofC6GYJQ3vL47u7/PdhRBsb+PVJYYDiaD1cY7La
 1x01hbe7mEJkYe517wS/1f74G7HEPYbXgk7mvW8ScYSd7voXFjWNkd0a0pIvWqRTbg
 X/4S2z1vy0eE3Q7kDORlmEsiVW10i3o+YX8pkrlgNPh8MkvR5SAFEFfGp7YaJCOzLM
 GS2t9lz+id6QQ==
Message-ID: <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
Date: Mon, 15 Dec 2025 09:48:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251212005545.3912333-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 tools/f2fs_io/f2fs_io.c
 | 16 ++++++++++++++++ > 1 file changed, 16 insertions(+) > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vUxhv-0006Ry-IX
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: add mlock() option in the read
 test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 4429e0b0459c..08f3c9b79cdf 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
>  "  dontcache: buffered IO + dontcache\n"		\
>  "  dio      : direct IO\n"				\
>  "  mmap     : mmap IO\n"				\
> +"  mlock    : mmap + mlock\n"				\
>  "  madvise  : mmap + mlock2 + madvise\n"		\
>  "  fadvise  : mmap + fadvise + mlock\n"			\
>  "advice can be\n"					\
> @@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  	u64 mlock_time_start = 0, mlock_time_end = 0;
>  	int flags = 0;
>  	int do_mmap = 0;
> +	int do_mlock = 0;
>  	int do_fadvise = 0;
>  	int do_madvise = 0;
>  	int do_dontcache = 0;
> @@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		flags |= O_DIRECT;
>  	else if (!strcmp(argv[4], "mmap"))
>  		do_mmap = 1;
> +	else if (!strcmp(argv[4], "mlock"))
> +		do_mlock = 1;
>  	else if (!strcmp(argv[4], "madvise"))
>  		do_madvise = 1;
>  	else if (!strcmp(argv[4], "fadvise"))
> @@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		mlock_time_end = get_current_us();
>  		read_cnt = count * buf_size;
>  		memcpy(print_buf, data, print_bytes);
> +	} else if (do_mlock) {
> +		data = mmap(NULL, count * buf_size, PROT_READ,
> +				MAP_SHARED, fd, offset);
> +		if (data == MAP_FAILED)
> +			die("Mmap failed");
> +
> +		io_time_start = get_current_us();

mlock_time_start = get_current_us();

> +		if (mlock(data, count * buf_size))
> +			die_errno("mlock failed");
> +		io_time_end = get_current_us();

mlock_time_end = get_current_us();

Thanks,

> +		read_cnt = count * buf_size;
> +		memcpy(print_buf, data, print_bytes);
>  	} else if (do_madvise) {
>  		data = mmap(NULL, count * buf_size, PROT_READ,
>  				MAP_SHARED, fd, offset);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CEB9548A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Sep 2025 11:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQnmdp/Df5j3kShLCZq86DVgNY1tqbqbzCuCh47b+HE=; b=Hp6lSxdcZoPAl92GpwUl/6ptVg
	Sho8ykQdkE3b/YdkvBZQl7ryp0meRZeTgKIpydhQl0lZd91PXHvv7U4hVAvswl4amxnnvDWG0gyId
	JNAuLk+BPOBYeDe9zDt1P8Jz2LK3+pjup8Betoyyx95sckLPSfHzMoLdICbn4XgsSwrk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v0zUD-0002Bx-NC;
	Tue, 23 Sep 2025 09:39:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v0zUC-0002Bp-F2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrg/5BGgQoMEYXM2I2keBTHl0wSnl8aWPQbKHfKmhn0=; b=jFMAAJwYnadAd1t+bbI4efyacl
 rKG5aT2JNmkydk0NUZIP61f2FpF0nAVjUjqvFMh8egFPgoG5/RAIO9T5QF429Xp0zI8n9V0hxBNUk
 4zhLVrhHUvUIYaZG/3/pjpE916zQjXlcZF/NjVHz/sfX2+Q34p8NYuL6vpUA3TGr8IBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wrg/5BGgQoMEYXM2I2keBTHl0wSnl8aWPQbKHfKmhn0=; b=kMzIpI5PRYK7pBtpeTwg0BgD19
 dXlto3OhP2axwmpPmKYYbQTSpcFm+QLUeAy2NkoFkdSQ7YYtnlGIaOUrc0BciwOhQFRpy1MERd158
 Daw0kizp+VbkXC9IITxpRNT/QWwoBKCpHocELl0GVDwfMZRwjwffc16l4kAdeG7kmlhk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v0zUB-0005xq-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Sep 2025 09:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AE3660279
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Sep 2025 09:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32910C4CEF5;
 Tue, 23 Sep 2025 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758620329;
 bh=3FeqftSrQMUxqcu/NNd7GoM30PywgKTik2tMOWT+5r4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pHxexnTV65CS9AgcJ1WdGWT/myp4xsAt/HQMGh4FbqZr5aJDIS9ePGQmDmcgEVPMC
 MYpszmuH7pUEj2ZhFKoqE9LvGowabXWIzW/1O3KxVx27ZScVbOfvzgwZ+wtO4nsp3U
 qLDxf1N3He5vWoE9fHEPG5z4op+QRSmALCsR5dolF0ce3SwAeDhQ9iDN/SJKMoKLcO
 H6i/y3glj4gUHxyZvvSUsPHIx4b60zAlaGvemk6Bo0I+bEPfRYb8/8YO+BU5fkFjok
 UQ6prYWrPmz+EoOms2ejbabuXZm8S8qi/GM1/yqOPEal0jZGkkK0zS6Oxs+06SEhV4
 yivU26bI8P99w==
Message-ID: <590ad519-d6a4-4eff-9bca-3d6b96eb89bb@kernel.org>
Date: Tue, 23 Sep 2025 17:38:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250918045316.714102-1-jaegeuk@kernel.org>
 <20250918045316.714102-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250918045316.714102-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ditto, need to manual entry. On 9/18/25 12:53, Jaegeuk Kim
 via Linux-f2fs-devel wrote: > It only measures the read performance. > >
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 tools/f2fs_io/f2fs_io.c | 13 ++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v0zUB-0005xq-VZ
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs_io: add dontcache to measure
 RWF_DONTCACHE speed
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

Ditto, need to manual entry.

On 9/18/25 12:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
> It only measures the read performance.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  tools/f2fs_io/f2fs_io.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 2d64eda81706..2ed9cb4184b8 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -24,6 +24,8 @@
>  #include <linux/fs.h>
>  #include <signal.h>
>  #include <stdarg.h>
> +#include <sys/uio.h>
> +#include <stdarg.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -929,6 +931,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
>  "Read data in file_path and print nbytes\n"		\
>  "IO can be\n"						\
>  "  buffered : buffered IO\n"				\
> +"  dontcache: buffered IO + dontcache\n"		\
>  "  dio      : direct IO\n"				\
>  "  mmap     : mmap IO\n"				\
>  "  mlock    : mmap + mlock\n"				\
> @@ -948,6 +951,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  	int flags = 0;
>  	int do_mmap = 0;
>  	int do_mlock = 0;
> +	int do_dontcache = 0;
>  	int fd, advice;
>  
>  	if (argc != 8) {
> @@ -972,6 +976,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		do_mmap = 1;
>  	else if (!strcmp(argv[4], "mlock"))
>  		do_mlock = 1;
> +	else if (!strcmp(argv[4], "dontcache"))
> +		do_dontcache = 1;
>  	else if (strcmp(argv[4], "buffered"))
>  		die("Wrong IO type");
>  
> @@ -1016,7 +1022,12 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>  		read_cnt = count * buf_size;
>  	} else {
>  		for (i = 0; i < count; i++) {
> -			ret = pread(fd, buf, buf_size, offset + buf_size * i);
> +			if (!do_dontcache) {
> +				ret = pread(fd, buf, buf_size, offset + buf_size * i);
> +			} else {
> +				struct iovec iov = { .iov_base = buf, .iov_len = buf_size };
> +				ret = preadv2(fd, &iov, 1, offset + buf_size * i, RWF_DONTCACHE);
> +			}
>  			if (ret != buf_size) {
>  				printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
>  						buf_size, ret);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF711A19C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 03:49:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ies3u-0005Pj-Hm; Wed, 11 Dec 2019 02:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ies3t-0005PE-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 02:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E6dBASQdLzUHXiZkGqiZcVIUWjiQd0xadsvz+yJF54o=; b=g83GUF0dRu0j3ed8SWKydMPtlV
 +yBPjVZwwNwzdYZgXD7/Dmp8vz2SaoSin/7jWmMseenjbivWEq6AhHD+iZhmEq+J66U/rb2R1X3Xl
 SCyDMs3kChdoq52dLUsXrAbEO7WzT1hJCndxeCAujVTZxduLImQHhzzmFXna5Ou98nDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E6dBASQdLzUHXiZkGqiZcVIUWjiQd0xadsvz+yJF54o=; b=GwH56Ml76dlHShpyj3ux+T8uaH
 +zt+GO+rNypsXGD1T5CDSzg596rRNevZPbOWNcgU1Bxn3eNCFJ4JrLH/4ncdBWH05TK8+vwIAGRc+
 UPr9BGy9sYxh2Ot9gQ6/yggvRtaeiLuqHehmERO6iLadzc8rripH5onEegn1RWAvjcRE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ies3r-000gbB-97
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 02:49:13 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0DF7205ED;
 Wed, 11 Dec 2019 02:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576032540;
 bh=yqkl8TN0O59NwfZP2OD2c0ghY0r4F9Diq35NeQInRfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6Mbhyj+zaSmcMmFEcvuAbn1RXZr+9mfbi1gq5t+KWhaDMkXHPd4QmJPAy6aAUcrj
 2rSpBj0soqrTUIN01JzV7gVd2iu0r43RuzzHf62jss0Iw3umpotijYsugx3sPQ+ltC
 4KFA6yIXyUlcDslwsYyBzYXbhBt4f/wF3+Zd9F6U=
Date: Tue, 10 Dec 2019 18:48:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191211024858.GB732@sol.localdomain>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ies3r-000gbB-97
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 11, 2019 at 10:20:01AM +0800, Tiezhu Yang wrote:
> diff --git a/include/linux/namei.h b/include/linux/namei.h
> index 7fe7b87..0fd9315 100644
> --- a/include/linux/namei.h
> +++ b/include/linux/namei.h
> @@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
>  	return error == -ESTALE && !(flags & LOOKUP_REVAL);
>  }
>  
> +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> +{
> +	if (unlikely(name[0] == '.')) {
> +		if (len == 1 || (len == 2 && name[1] == '.'))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  #endif /* _LINUX_NAMEI_H */

I had suggested adding a len >= 1 check to handle the empty name case correctly.
What I had in mind was

static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
{
	if (len >= 1 && unlikely(name[0] == '.')) {
		if (len < 2 || (len == 2 && name[1] == '.'))
			return true;
	}

	return false;
}

As is, you're proposing that it always dereference the first byte even when
len=0, which seems like a bad idea for a shared helper function.  Did you check
whether it's okay for all the existing callers?  fscrypt_fname_disk_to_usr() is
called from 6 places, did you check all of them?

How about keeping the existing optimized code for the hot path in fs/namei.c
(i.e. not using the helper function), while having the helper function do the
extra check to handle len=0 correctly?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

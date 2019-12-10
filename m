Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F711907B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2019 20:19:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iel2l-0005Gf-3g; Tue, 10 Dec 2019 19:19:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iel2b-0005Fh-UC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 19:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=umKfqkAVpVIivp4Y0t00iolZMPd05xQ2BeXL950PSWg=; b=aJr5eikBi5yp1GAOFImJmVqFLD
 FRKHVJFuv1RqskO16UmpmRNu9KPfsTjcpTbMGNf/NU08c6jB2ivnywyhLzriIq3PAkK02hgNdeGjP
 3dz/3E7OGhuMLQ/PoqNqDGcmKoBswLiDwx89fAIhyavSDjQGmp3vJe1kNhRd/1LKgymQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=umKfqkAVpVIivp4Y0t00iolZMPd05xQ2BeXL950PSWg=; b=Pq2d3L+7gSOEOuXIHDdDrix9u7
 BCboYyBoRkD427iZD+J40gv4ZKD/bFsVObo/DsHiC9LDvA7iIDicN15NoJHRKljsURECRykspNRRa
 hi5PEVgPFRp2MIQhHYEQRK0a+1H5bwf5TyIoUpvL1NYB8Mq1QWyGwo351ttZWqVr2CwM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iel2a-0004T8-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 19:19:25 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D42E02077B;
 Tue, 10 Dec 2019 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576005555;
 bh=v/zlr/k417wcCWHHCL31Rqwau5okPBjp1POLwjKxDYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FzLzsGotMfuCA9yyO2/HDt1XmRzGg33023JGprHtkq/N9sJZBqyk9HAiW9R+lNtbo
 1PiVZLTd3dVYranyQaIjPmw22oV4+WshIGF1KQEkAGGNhxiA3fMh/CcB3TF3aBpFQF
 8HlA6I9QpUq/ALD7kyWxTil4u7/f5YRZKDjgzUro=
Date: Tue, 10 Dec 2019 11:19:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191210191912.GA99557@gmail.com>
References: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iel2a-0004T8-RQ
Subject: Re: [f2fs-dev] [PATCH v4] fs: introduce is_dot_or_dotdot helper for
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

On Tue, Dec 10, 2019 at 08:10:01PM +0800, Tiezhu Yang wrote:
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 3da3707..ef7eba8 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -11,21 +11,11 @@
>   * This has not yet undergone a rigorous security audit.
>   */
>  
> +#include <linux/namei.h>
>  #include <linux/scatterlist.h>
>  #include <crypto/skcipher.h>
>  #include "fscrypt_private.h"
>  
> -static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
> -{
> -	if (str->len == 1 && str->name[0] == '.')
> -		return true;
> -
> -	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
> -		return true;
> -
> -	return false;
> -}
> -
>  /**
>   * fname_encrypt() - encrypt a filename
>   *
> @@ -255,7 +245,7 @@ int fscrypt_fname_disk_to_usr(struct inode *inode,
>  	const struct qstr qname = FSTR_TO_QSTR(iname);
>  	struct fscrypt_digested_name digested_name;
>  
> -	if (fscrypt_is_dot_dotdot(&qname)) {
> +	if (is_dot_or_dotdot(qname.name, qname.len)) {

There's no need for the 'qname' variable anymore.  Can you please remove it and
do:

	if (is_dot_or_dotdot(iname->name, iname->len)) {

> diff --git a/include/linux/namei.h b/include/linux/namei.h
> index 7fe7b87..aba114a 100644
> --- a/include/linux/namei.h
> +++ b/include/linux/namei.h
> @@ -92,4 +92,14 @@ retry_estale(const long error, const unsigned int flags)
>  	return error == -ESTALE && !(flags & LOOKUP_REVAL);
>  }
>  
> +static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> +{
> +	if (unlikely(name[0] == '.')) {
> +		if (len < 2 || (len == 2 && name[1] == '.'))
> +			return true;
> +	}
> +
> +	return false;
> +}

This doesn't handle the len=0 case.  Did you check that none of the users pass
in zero-length names?  It looks like fscrypt_fname_disk_to_usr() can, if the
directory entry on-disk has a zero-length name.  Currently it will return
-EUCLEAN in that case, but with this patch it may think it's the name ".".

So I think there needs to either be a len >= 1 check added, *or* you need to
make an argument for why it's okay to not care about the empty name case.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96C2AFD83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 03:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LPzAWeKQV6dBkuDmw4hZlIrh2hKPpJOKhELuv37A9Ss=; b=guSQesIcpBmMzpsaYVtrJRnap
	TTM3FyT0kuuqmZ7n6yAhMcyv/GmeK4XxSgjA/w0wks42/OXAnp+Cgz4OwICVp+joTslvy4IQVu5fo
	7of9B6MZGs8NEBlsXsNgR8wcy3/+UaJUeZjL62G+j2Lp3ifzkb5gCBq4F4Ii+K6F5D6xI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd2Y1-0005ku-CP; Thu, 12 Nov 2020 02:41:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kd2Y0-0005kl-Vc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 02:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPVBYTjJe0hHmPnczFzGKQ6IA34dXAh8mCwAyisyNuc=; b=kL9S5KWTD8ybtiWS8NleqguEcP
 /LVdHvpc6XIgS/Ls0K8/Nq+BbVNFuwrM80lDSFIu1BRJugxa22r8wrI6dppgkU4gUhCdpOiH6IqqU
 2BVTLLr7Jc/0l94Egb++Vj65RAk+U2CjyDLnGosbn1e92rhnOAUtbbd7+rfbWr8wSgio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TPVBYTjJe0hHmPnczFzGKQ6IA34dXAh8mCwAyisyNuc=; b=lpRlvXYoMAUQZ9HSn0xzeGBrN2
 +hZ4/NebvtiD2tbXFezcR/9JC/Sr+1k5Q6bRpjE/a5SZ+vjmrUJN4FQOsYL7wIATgZRZDzYkfDOWd
 b0AolVEIhfuqmlghWfUWW+ly4ue+6YeBJVZSdAAPuuCi3dL9f7scUJPOFSP5Cpq3taPE=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kd2Xq-00HayK-2O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 02:41:16 +0000
Received: by mail-pf1-f193.google.com with SMTP id c66so3136359pfa.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Nov 2020 18:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TPVBYTjJe0hHmPnczFzGKQ6IA34dXAh8mCwAyisyNuc=;
 b=HsIKmy2mHTXPwQWLxT4t4wMTLWDqRF5L0W6i0qLwHTLP0BTicyOwRlVS/u3RGVkS3C
 RJu4DtUK8Lh1VeQ0Fs8R5cbJEOb/KIkknyTWSIlbVMHhwEeu7GDekDQ/SV18yfChQ43u
 f5vBpgZwYvIZXfftSHO6UNWQ2nO1I3Cblgwuwic4geXh3UcAEcVGpwC88AbQgivqgoih
 5Qk4grVFGf2rvo2ZlDamtz3W2G2rSwLcQNC+AHJ4Ef7IfjYB5tNvaoZKN+2kjzfT9PFn
 e5JMHTGUxFXQH+qS5+PJ/EIdj0wMijhOFFGs6yDsANBc0YNo66B2zmJuqpMIiwdoAcWL
 a3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPVBYTjJe0hHmPnczFzGKQ6IA34dXAh8mCwAyisyNuc=;
 b=onI4NS0+9CSOQtOXeVMLiFuL0y1xc5giJFriFtKPQRdUOBis6U2+DIqTI/GPu33S4U
 mBxGAt1Bbz7eRoEqe/VyMWhjJWVu3NrI+c1lDoQHL/dlDlw22me148NupHwLYzACks/+
 FlKa7yhZ81PS0/pyj70JHg/mi43n3xT8KoS2Yv5IHFYLrMxpK1boSZVkhkEMeeBFftjm
 PYfKS0x8veyBLLnj8VFXhnJBJ/yAq5zGpS0T+bCcrY8mGfhjzhndAmsNJpqngYLJRLvC
 6EarWyA5ftDxi46USDOd1k04Swy1brX0G/cVIXDa6ik2lnsdJcWvekL9uScHHXS10Lqn
 2dzA==
X-Gm-Message-State: AOAM530qK74jTcNzlm+99lWLnObX5LUzlQ5U2wjeDdfW3tId++qyTO0h
 tpxgp5XBxT7rUwjbglbOM1aERA==
X-Google-Smtp-Source: ABdhPJxyWqEnhtC2yWsqGmtNX7PfX0PEmHE0bU42jkynWKfam4h3j/TgIeVQcJC3A4TtJNl389fptg==
X-Received: by 2002:a62:2cc1:0:b029:18c:85f5:864b with SMTP id
 s184-20020a622cc10000b029018c85f5864bmr502272pfs.29.1605148859471; 
 Wed, 11 Nov 2020 18:40:59 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id p4sm3814925pjo.6.2020.11.11.18.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 18:40:58 -0800 (PST)
Date: Thu, 12 Nov 2020 02:40:54 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201112024054.GA4042272@google.com>
References: <20201111015224.303073-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111015224.303073-1-ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
X-Headers-End: 1kd2Xq-00HayK-2O
Subject: Re: [f2fs-dev] [PATCH] fscrypt: fix inline encryption not used on
 new files
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 10, 2020 at 05:52:24PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The new helper function fscrypt_prepare_new_inode() runs before
> S_ENCRYPTED has been set on the new inode.  This accidentally made
> fscrypt_select_encryption_impl() never enable inline encryption on newly
> created files, due to its use of fscrypt_needs_contents_encryption()
> which only returns true when S_ENCRYPTED is set.
> 
> Fix this by using S_ISREG() directly instead of
> fscrypt_needs_contents_encryption(), analogous to what
> select_encryption_mode() does.
> 
> I didn't notice this earlier because by design, the user-visible
> behavior is the same (other than performance, potentially) regardless of
> whether inline encryption is used or not.
> 
> Fixes: a992b20cd4ee ("fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()")
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/inline_crypt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index 89bffa82ed74a..c57bebfa48fea 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -74,7 +74,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
>  	int i;
>  
>  	/* The file must need contents encryption, not filenames encryption */
> -	if (!fscrypt_needs_contents_encryption(inode))
> +	if (!S_ISREG(inode->i_mode))
>  		return 0;
>  
>  	/* The crypto mode must have a blk-crypto counterpart */
> 
> base-commit: 92cfcd030e4b1de11a6b1edb0840e55c26332d31
> -- 
> 2.29.2
> 
Looks good to me. Please feel free to add
Reviewed-by: Satya Tangirala <satyat@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

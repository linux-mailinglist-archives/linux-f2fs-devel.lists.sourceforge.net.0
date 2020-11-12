Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B4E2B0F10
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 21:29:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdJDv-00041m-Ae; Thu, 12 Nov 2020 20:29:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdJDu-00041g-9U
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 20:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MRFSHBtmkNQLGUqSte1BXV/cqbGb7llm9IuVSAqZniU=; b=h9qTu4UWtCV7IYpQHExXGdczk0
 0CSpAqsHFwQVXtEMBdbLPIjVrleJLZKtlSbtE6dFL17IF6I9fG+Eea9KKmoH5oPPbi0vPgHAVELLB
 /vKxj4aqTlGSy3vj+keQuUpD69uk78y42B8TYTnCHOM5mRPWUBXewOYPUi8IO6zDxNFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MRFSHBtmkNQLGUqSte1BXV/cqbGb7llm9IuVSAqZniU=; b=EWSuPBvvUhlkoIc66koNr4VFvg
 AxbT8i58eRlWo6brroQrEw+3+8wJQr6/iuyosHDRGZVaCobhzJ8ZZYj7/zqsHfIGzB8FudVU3lo3b
 CyGmAvn8cdXWh68XpcixOOyBi3pbSI/gIK9XaETISLdHlbDie6es3TmNmvgmokmGFU+0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdJDk-0018a0-HH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 20:29:38 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEB0E20872;
 Thu, 12 Nov 2020 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605212958;
 bh=bWaPaaa4cnOfI6CXSQAbGQrxlcQ6NMZjfJQHOkXLyqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zxj+dbdVku4GY7DGrqZAdldWBRvuNzq5tefJyTKzQip2wLf5yhadc4Qaiz9yQ9a1y
 bFNhknLq0kdZj3IIaUTZL7FaUOa3rPPt6Tr32IFlLZPsMYwWxvDrCL8Iuyg0VgwBNl
 8uaBPgYbP4elIjL/01UquoCCoBiAL1WGDloW6tTA=
Date: Thu, 12 Nov 2020 12:29:16 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <X62bHAMA38Iun/cp@sol.localdomain>
References: <20201111015224.303073-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111015224.303073-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdJDk-0018a0-HH
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
Cc: Satya Tangirala <satyat@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
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

Applied to fscrypt.git#for-stable for 5.10.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

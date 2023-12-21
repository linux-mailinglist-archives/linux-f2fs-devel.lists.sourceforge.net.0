Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDB81AF3A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Dec 2023 08:14:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGDGH-0004L4-QH;
	Thu, 21 Dec 2023 07:14:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1rGDGG-0004Ky-0y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7URlUR6GG2Ifw9APY3b1ld2EAWLXn6C+XpO3zuDJHbQ=; b=DJ164DVi0o8ZDiicoLRmfrNKDL
 1K5EwJKAFfscHpIGYdCXTQKXmSD7DSURF9EWyYFY4OO+o2wpvGG7z6W7xcSqthnDcRJV3N9U1bmQs
 uguLgy/wvXV4wnATXoNE4inp1i4Kla2Zr1bADof9/9vkHavUOZDLPfoExNJtJeLPG3E8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7URlUR6GG2Ifw9APY3b1ld2EAWLXn6C+XpO3zuDJHbQ=; b=c9Mc5oHWFLCibLCaih6Xt2jTzA
 87Fa3JjjDkz4hn35MozX/85PGmu2yZu/aHxqNzxkYRZY5+sHcqjFrz4OZyharP3J9LgcXMKIXxfiP
 jthkRZijUcoDdx7n1RDT9XPjHF09UqJLw3E2v/w9KqfCvBWKQEfe5rnVbXKArTfWHaNk=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGDGB-0004Se-7T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7URlUR6GG2Ifw9APY3b1ld2EAWLXn6C+XpO3zuDJHbQ=; b=cZbHkl6a5nwYZNq+11W7X2snrz
 sVfC1MYbX1OiaEYz7aZahEGRBNxmRHskk2EkUWvW6SdYW0aRFIRfhe0scCb4U7aMLvFuoj/r7ocJC
 f++WD+1m+nz0Fdxd94MpTQT4XGCKX1i1aERfZtHno5azYCHbXXyTiSu/FIsx2Dod4rZGsIl30IzU0
 UK8fsYCdOm4M4uyMLhqr7OgFNfrHfnGDh//3Onez24q/yzQfgACiLMHDQ14yBylNmfQGPjJW5f86a
 QH9oj+bIrViH/DBKnoR1pAejUEdA/BbxD/FLBDrMebFUgjZQraUvHqMSWxKyOsvmDNBRlfyWiyPL0
 3zKo2PJw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rGDFq-001ILj-2n; Thu, 21 Dec 2023 07:14:02 +0000
Date: Thu, 21 Dec 2023 07:14:02 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231221071402.GA1674809@ZenIV>
References: <20231215211608.6449-1-krisman@suse.de>
 <20231215211608.6449-3-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215211608.6449-3-krisman@suse.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 15, 2023 at 04:16:02PM -0500, Gabriel Krisman
 Bertazi wrote: > fscrypt dentries are always valid once the key is available.
 Since the > key cannot be removed without evicting the dentry, w [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGDGB-0004Se-7T
Subject: Re: [f2fs-dev] [PATCH v2 2/8] fscrypt: Drop d_revalidate if key is
 available
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 15, 2023 at 04:16:02PM -0500, Gabriel Krisman Bertazi wrote:
> fscrypt dentries are always valid once the key is available.  Since the
> key cannot be removed without evicting the dentry, we don't need to keep
> retrying to revalidate it.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
> ---
>  fs/crypto/fname.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 7b3fc189593a..0457ba2d7d76 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -591,8 +591,15 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  	 * reverting to no-key names without evicting the directory's inode
>  	 * -- which implies eviction of the dentries in the directory.
>  	 */
> -	if (!(dentry->d_flags & DCACHE_NOKEY_NAME))
> +	if (!(dentry->d_flags & DCACHE_NOKEY_NAME)) {
> +		/*
> +		 * If fscrypt is the only feature requiring
> +		 * revalidation for this dentry, we can just disable it.
> +		 */
> +		if (dentry->d_op->d_revalidate == &fscrypt_d_revalidate)

Umm...  What about ceph?  IOW, why do we care how had we gotten to that
function - directly via ->d_revalidate() or from ->d_revalidate() instance?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

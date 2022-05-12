Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC47B524520
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 07:46:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np1eY-0000yp-Oi; Thu, 12 May 2022 05:46:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np1eX-0000yi-IX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0QBKw7ALVE4B/JnJyLoMKRKH0QmanGOLEQn3CWGFtyI=; b=S3iJJ520ZU1EYQJ2RI7aAX6eqf
 8EJix6rjqtQj+9n5eEoLu4d9wSbjqN+qSYIumxKrwfG929EtspOUM1nHOGja9YaShNWgIgIbB6Xcb
 j2MMSOxhJ4GYK1f2QJahTDgzRvm4bT7pTW3RDz33sqamvYk4Zw9DUpKUjB3BTTMYobuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0QBKw7ALVE4B/JnJyLoMKRKH0QmanGOLEQn3CWGFtyI=; b=OhszdpKuvOPcqC+7JQYWrFtCoM
 G9A6ahzdzU6XzvU/gHC6P2p3/rO3R9slEMxgkqRuhM1ripVRey+Qq7BiTJSfJwQpYqxle+lcs6KqU
 I79BuOGqvfKy5dptTDAAiTUXSK6wekeKOmTReTVff27oKsNWS9yMZd3BCyGgxOsUb/ps=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np1eU-009PZu-TY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:46:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A23361CE4;
 Thu, 12 May 2022 05:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A87C34100;
 Thu, 12 May 2022 05:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652334372;
 bh=gyKsjkRqtv54mB/Owm8oe3NUBcn2Nz/5hAT4vfxUkVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRtoXiKoAN1oMcyoLY2h7ueQZgNgjPGJy9gRREAc+JzARJHx/TJ/PqfgXnij1rxa5
 Ta87yhrdgayrGKHRCUVdtPsY6Kg0qlz4VU71DWQn6NLXffSb1K/RBPt6Lnx310ieOW
 Kz+iX6xAPxj05pltbBvA88Te65W84866xGq76MmdNyDimD6dctLaSCNpQoZhIN0MID
 xC+LGsQhNJv+DKlwa3kdqX4u+wUXvTRYoK9YQ/VjBaS4FLdPHey20xlBRHqvliFs3T
 uPPyvKv5KY6ouglYS3EdxstiKs3HNJ7/qqpaIvxM4QCcIqWUk1mQ9EnkDoGK9z4EH6
 59QDyzvhoaBsQ==
Date: Wed, 11 May 2022 22:46:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyfIn6AuDw/ImUi@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-6-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-6-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:41PM -0400, Gabriel Krisman
 Bertazi wrote: > The existence of fname->cf_name.name requires s_encoding
 & IS_CASEFOLDED, > therefore this can be simplified. > > Signed-off- [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np1eU-009PZu-TY
Subject: Re: [f2fs-dev] [PATCH v4 05/10] ext4: Simplify hash check on
 ext4_match
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:31:41PM -0400, Gabriel Krisman Bertazi wrote:
> The existence of fname->cf_name.name requires s_encoding & IS_CASEFOLDED,
> therefore this can be simplified.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/ext4/namei.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 5296ced2e43e..cebbcabf0ff0 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1438,25 +1438,19 @@ static bool ext4_match(struct inode *parent,
>  #endif
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
> -	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
> +	if (IS_ENCRYPTED(parent) && fname->cf_name.name) {
> +		if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> +		    fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de))
> +			return false;
> +	}
> +
> +	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
>  		struct unicode_name u = {
>  			.folded_name = &fname->cf_name,
>  			.usr_name = fname->usr_fname
>  		};
>  		int ret;
>  
> -		if (fname->cf_name.name) {
> -			if (IS_ENCRYPTED(parent)) {
> -				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> -					fname->hinfo.minor_hash !=
> -						EXT4_DIRENT_MINOR_HASH(de)) {
> -
> -					return false;
> -				}
> -			}
> -		}
> -

I don't think it's correct to delete the check for the encryption key here.  If
lookup is by no-key name, then fscrypt_match_name() must be used, not
generic_ci_match().  And unlike f2fs, ext4 doesn't keep track of whether the
whole lookup is by no-key name; ext4 relies on this fscrypt_has_encryption_key()
check at the last minute when doing each individual comparison.  (Which is not
great, but that's how it works now.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

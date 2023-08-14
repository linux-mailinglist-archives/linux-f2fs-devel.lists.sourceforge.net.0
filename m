Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DD77C064
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:10:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVcws-0004EB-2x;
	Mon, 14 Aug 2023 19:09:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVcwq-0004E4-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=onjKw2D7T28KbiV2fqNVPG/lTv3CeMZukA/2FuhuI3k=; b=APtMHfTeOUsUoD/qvLxXNsa5is
 T7bI7MMWS6gX3c3YmkuAmldteT1PNTHWKdOePTPBHi23yKVlFpEn6D14W8QW9NHflBeMfpUWhLDRQ
 LHZhZKpVNZ/2BIzJlAIxK37kfXw4jJhGcA4fsLA23JT7yDKvwp4YTTiiSf91LvC6J/KA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=onjKw2D7T28KbiV2fqNVPG/lTv3CeMZukA/2FuhuI3k=; b=cK7s3brwWZvWue7gc9blw9cZq0
 /+NGdKwKRRYwfaAvAXxjdNLbAimr3xV7g7UatEUr2IBBuLtJrlStc/modC7DXBjcENlir1Nwq8fZ9
 OnDkFnbFYslo1lO+pny9J3TC8eRN4c+brjOOZqqgZmDSXH5ZFy1nDlgEi5eWX+WOfLP8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVcwk-00046z-Ki for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:09:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68B8E21921;
 Mon, 14 Aug 2023 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692040180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=onjKw2D7T28KbiV2fqNVPG/lTv3CeMZukA/2FuhuI3k=;
 b=OaoCL+1HGmRHBb/F9NAWbs1Yqpa6tVc9MIOMVhrIMHAqEdUNMLyHbG0FGdhY90iwfKuI5k
 j9TCcXQEfk026eQ3FqiDSRR1GGqdp8VHedICVMqlRHvR+fGIDPOr+TjttqKQVHBiShlhgY
 P3wILlVnPYGNSNAK425Epk4m9m4zUG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692040180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=onjKw2D7T28KbiV2fqNVPG/lTv3CeMZukA/2FuhuI3k=;
 b=kRIzSOepmu2YkLWh1KFqx2AkwdR4+jq7yPp/s/r6AK4a2fNs8aCyiw1PyGOKEFF9ftMRoe
 5rjqLvHyahidoDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A2F8138EE;
 Mon, 14 Aug 2023 19:09:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zankOfN72mQLdwAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 19:09:39 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230814182903.37267-2-ebiggers@kernel.org> (Eric Biggers's
 message of "Mon, 14 Aug 2023 11:29:01 -0700")
Organization: SUSE
References: <20230814182903.37267-1-ebiggers@kernel.org>
 <20230814182903.37267-2-ebiggers@kernel.org>
Date: Mon, 14 Aug 2023 15:09:33 -0400
Message-ID: <87jztx5tle.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: > From: Eric
 Biggers
 <ebiggers@google.com> > > It is invalid for the casefold inode flag to be
 set without the casefold > superblock feature flag also being set. e2fsck
 already considers this > case t [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qVcwk-00046z-Ki
Subject: Re: [f2fs-dev] [PATCH 1/3] ext4: reject casefold inode flag without
 casefold feature
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> It is invalid for the casefold inode flag to be set without the casefold
> superblock feature flag also being set.  e2fsck already considers this
> case to be invalid and handles it by offering to clear the casefold flag
> on the inode.  __ext4_iget() also already considered this to be invalid,
> sort of, but it only got so far as logging an error message; it didn't
> actually reject the inode.  Make it reject the inode so that other code
> doesn't have to handle this case.  This matches what f2fs does.
>
> Note: we could check 's_encoding != NULL' instead of
> ext4_has_feature_casefold().  This would make the check robust against
> the casefold feature being enabled by userspace writing to the page
> cache of the mounted block device.  However, it's unsolvable in general
> for filesystems to be robust against concurrent writes to the page cache
> of the mounted block device.  Though this very particular scenario
> involving the casefold feature is solvable, we should not pretend that
> we can support this model, so let's just check the casefold feature.
> tune2fs already forbids enabling casefold on a mounted filesystem.

just because we can't fix the general issue for the entire filesystem
doesn't mean this case *must not* ever be addressed. What is the
advantage of making the code less robust against the syzbot code?  Just
check sb->s_encoding and be safe later knowing the unicode map is
available.

>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/inode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 43775a6ca505..390dedbb7e8a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -4940,9 +4940,12 @@ struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
>  				 "iget: bogus i_mode (%o)", inode->i_mode);
>  		goto bad_inode;
>  	}
> -	if (IS_CASEFOLDED(inode) && !ext4_has_feature_casefold(inode->i_sb))
> +	if (IS_CASEFOLDED(inode) && !ext4_has_feature_casefold(inode->i_sb)) {
>  		ext4_error_inode(inode, function, line, 0,
>  				 "casefold flag without casefold feature");
> +		ret = -EFSCORRUPTED;
> +		goto bad_inode;
> +	}
>  	if ((err_str = check_igot_inode(inode, flags)) != NULL) {
>  		ext4_error_inode(inode, function, line, 0, err_str);
>  		ret = -EFSCORRUPTED;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

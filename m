Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39F792152
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 11:11:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdS5y-0004xI-1Q;
	Tue, 05 Sep 2023 09:11:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qdS5w-0004xA-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 09:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v79WjEoDs9F3Vjum42PGJ2z1rLJctnjtDsFsxwG5ncw=; b=ceqcejhwc/q1jHZ1UkROLKdtHu
 zPLi1eJg5eZs5C4udrXGilORlIYclI/N+McMLM+9If2ePWG2ql2+dsOsCGAggkBzFxme+kFM2u8tO
 UrSZ6somBZniSDjHnwmOv/8Yd4fOeW4b3PnECC3sGe5bgwhoxQpXDMfTfEYUjwGRhl2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v79WjEoDs9F3Vjum42PGJ2z1rLJctnjtDsFsxwG5ncw=; b=ciPAueL8/MXsjVd6EYKS7qsGQ7
 Hs4zDj4Z+N3E5V2wKPREarnhEI6lNQPQSCTgYtURIpkslYYTxnLBNESYSLRmnDwUdfKmH+GFMC8Xm
 V4QAxmM6pkr9AJ7J+EWC2ULYCd6VELSt+Xen6ii7HdHZyV6WKw4cprfFsGzagDR3dFWk=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdS5r-00A6VT-HT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 09:11:36 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 264EC1F74D;
 Tue,  5 Sep 2023 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693905085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v79WjEoDs9F3Vjum42PGJ2z1rLJctnjtDsFsxwG5ncw=;
 b=YwCV9ly9uMbP4j/3wlPUUVRkCgsnK1naBjvvJPu4QBUMKwCOEgjaPZlqrvgy603pTk8hlk
 coK14ruzlL73hUQUgNmR88ZDkdIXjiAjCM/edY46kkdfypsGJxiuvkBtZdL3eOQkf8SC3X
 f4wfQ5CTl9QdaSASXxJ0rYZo7QGOAQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693905085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v79WjEoDs9F3Vjum42PGJ2z1rLJctnjtDsFsxwG5ncw=;
 b=BoCEOx9hi3vLZ2Hors/zNhmhQX/Iy59H63pmpDIj9rxrwzvt9S6IElLpLmEQ/zEDcOiCow
 XDcu+G2NGV120lAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18D8013499;
 Tue,  5 Sep 2023 09:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hQf6Bb3w9mR7JgAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 05 Sep 2023 09:11:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A6B15A0776; Tue,  5 Sep 2023 11:11:24 +0200 (CEST)
Date: Tue, 5 Sep 2023 11:11:24 +0200
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230905091124.giawwm3tu6fm2buq@quack3>
References: <20230905003227.326998-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230905003227.326998-1-ebiggers@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 04-09-23 17:32:27, Eric Biggers wrote: > From: Eric
 Biggers <ebiggers@google.com> > > Since commit d7e7b9af104c ("fscrypt: stop
 using keyrings subsystem for > fscrypt_master_key"), xfstest gene [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qdS5r-00A6VT-HT
Subject: Re: [f2fs-dev] [PATCH] quota: explicitly forbid quota files from
 being encrypted
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 04-09-23 17:32:27, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since commit d7e7b9af104c ("fscrypt: stop using keyrings subsystem for
> fscrypt_master_key"), xfstest generic/270 causes a WARNING when run on
> f2fs with test_dummy_encryption in the mount options:
> 
> $ kvm-xfstests -c f2fs/encrypt generic/270
> [...]
> WARNING: CPU: 1 PID: 2453 at fs/crypto/keyring.c:240 fscrypt_destroy_keyring+0x1f5/0x260
> 
> The cause of the WARNING is that not all encrypted inodes have been
> evicted before fscrypt_destroy_keyring() is called, which violates an
> assumption.  This happens because the test uses an external quota file,
> which gets automatically encrypted due to test_dummy_encryption.
> 
> Encryption of quota files has never really been supported.  On ext4,
> ext4_quota_read() does not decrypt the data, so encrypted quota files
> are always considered invalid on ext4.  On f2fs, f2fs_quota_read() uses
> the pagecache, so trying to use an encrypted quota file gets farther,
> resulting in the issue described above being possible.  But this was
> never intended to be possible, and there is no use case for it.
> 
> Therefore, make the quota support layer explicitly reject using
> IS_ENCRYPTED inodes when quotaon is attempted.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good. I'll queue this patch into my tree and send it to Linus for
RC2.

								Honza

> ---
>  fs/quota/dquot.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 9e72bfe8bbad9..7e268cd2727cc 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -2339,6 +2339,20 @@ static int vfs_setup_quota_inode(struct inode *inode, int type)
>  	if (sb_has_quota_loaded(sb, type))
>  		return -EBUSY;
>  
> +	/*
> +	 * Quota files should never be encrypted.  They should be thought of as
> +	 * filesystem metadata, not user data.  New-style internal quota files
> +	 * cannot be encrypted by users anyway, but old-style external quota
> +	 * files could potentially be incorrectly created in an encrypted
> +	 * directory, hence this explicit check.  Some reasons why encrypted
> +	 * quota files don't work include: (1) some filesystems that support
> +	 * encryption don't handle it in their quota_read and quota_write, and
> +	 * (2) cleaning up encrypted quota files at unmount would need special
> +	 * consideration, as quota files are cleaned up later than user files.
> +	 */
> +	if (IS_ENCRYPTED(inode))
> +		return -EINVAL;
> +
>  	dqopt->files[type] = igrab(inode);
>  	if (!dqopt->files[type])
>  		return -EIO;
> 
> base-commit: 708283abf896dd4853e673cc8cba70acaf9bf4ea
> -- 
> 2.42.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

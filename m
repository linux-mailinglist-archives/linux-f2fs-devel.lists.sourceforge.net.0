Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FA77BC48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 17:02:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVZ5m-0001XA-CK;
	Mon, 14 Aug 2023 15:02:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qVZ5k-0001X2-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 15:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z/H/2o4RppNFPDmpoYKz4dITYrINffqG3kACebc9ICo=; b=mZMYPJbBDkgVArhGtlG7Nq/K1B
 jjiAydBhouSqbdFkyLHRaPvwkpxUQU18Z8CHgh8T2AgjoKIeyakSmJH33CQvTnH1qET6QVvpZRfJa
 0ETGU2CGbFfmqqs5R0cqMkoCIEY7gcPn3eqlw+jQtV5x4EU3EABhQzqV/Q6zknrlOCic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z/H/2o4RppNFPDmpoYKz4dITYrINffqG3kACebc9ICo=; b=QAY/ucqsoeTpREcWdMzNBivEvE
 GHhHcokfjqNWejKasYYKwlvHFzAOoazbRoqinRSl573p6rdj7QLqxUaEVFQO8b07qmvV5TNXQYNu5
 dmTNM5l+3y9FE2cGxHTOul+r0uDAJQZoT9qiYaJITQeIRYgYFhJ5wN0D3z8GTP2kFvc4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qVZ5i-0003sI-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 15:02:47 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A6A51F383;
 Mon, 14 Aug 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692025360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/H/2o4RppNFPDmpoYKz4dITYrINffqG3kACebc9ICo=;
 b=GGuWgyQSxAyOOlwxy/D1+Yrum/6XYqs1RbqS2+NLpkhUsDDCtAyhLON5RO9aXzP8mpXz6F
 Dt8QZ6VU8vceInhhPQ3z0Z0UXUxV0r7VREIgVLrHFY81Ip8PLujayQNMqT9nSDeuakGqmU
 Vn++EQQ5yxXEhKYCtfLXrtwSeKvzyek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692025360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/H/2o4RppNFPDmpoYKz4dITYrINffqG3kACebc9ICo=;
 b=fzR8OmiTLhjrRN1BK3+uS4DwisfVMIqY/1qy/BKrdt4yKU12hsuilcQOh6CRhmd6Ss+L0t
 zJPncdUMEZ8p3ADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17AE5138EE;
 Mon, 14 Aug 2023 15:02:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7FV4OQ9C2mT2CwAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 14 Aug 2023 15:02:39 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230812015915.GA971@sol.localdomain> (Eric Biggers's message of
 "Fri, 11 Aug 2023 18:59:15 -0700")
Organization: SUSE
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
Date: Mon, 14 Aug 2023 11:02:38 -0400
Message-ID: <875y5h7jld.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Aug 11, 
 2023 at 08:41:37PM -0400, Gabriel Krisman Bertazi wrote: >> In preparation
 to use it in ecryptfs, move needs_casefolding into a >> public header and
 give it a namespaced name. >> >> [...] 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qVZ5i-0003sI-Ph
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Fri, Aug 11, 2023 at 08:41:37PM -0400, Gabriel Krisman Bertazi wrote:
>> In preparation to use it in ecryptfs, move needs_casefolding into a
>> public header and give it a namespaced name.
>> 
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
>> ---
>>  fs/libfs.c         | 14 ++------------
>>  include/linux/fs.h | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+), 12 deletions(-)
>> 
>> diff --git a/fs/libfs.c b/fs/libfs.c
>> index 5b851315eeed..8d0b64cfd5da 100644
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -1381,16 +1381,6 @@ bool is_empty_dir_inode(struct inode *inode)
>>  }
>>  
>>  #if IS_ENABLED(CONFIG_UNICODE)
>> -/*
>> - * Determine if the name of a dentry should be casefolded.
>> - *
>> - * Return: if names will need casefolding
>> - */
>> -static bool needs_casefold(const struct inode *dir)
>> -{
>> -	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
>> -}
>> -
>>  /**
>>   * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
>>   * @dentry:	dentry whose name we are checking against
>> @@ -1411,7 +1401,7 @@ static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>>  	char strbuf[DNAME_INLINE_LEN];
>>  	int ret;
>>  
>> -	if (!dir || !needs_casefold(dir))
>> +	if (!dir || !dir_is_casefolded(dir))
>>  		goto fallback;
>>  	/*
>>  	 * If the dentry name is stored in-line, then it may be concurrently
>> @@ -1453,7 +1443,7 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>>  	const struct unicode_map *um = sb->s_encoding;
>>  	int ret = 0;
>>  
>> -	if (!dir || !needs_casefold(dir))
>> +	if (!dir || !dir_is_casefolded(dir))
>>  		return 0;
>>  
>>  	ret = utf8_casefold_hash(um, dentry, str);
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 6867512907d6..e3b631c6d24a 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -3213,6 +3213,27 @@ static inline bool dir_relax_shared(struct inode *inode)
>>  	return !IS_DEADDIR(inode);
>>  }
>>  
>> +/**
>> + * dir_is_casefolded - Safely determine if filenames inside of a
>> + * directory should be casefolded.
>> + * @dir: The directory inode to be checked
>> + *
>> + * Filesystems should usually rely on this instead of checking the
>> + * S_CASEFOLD flag directly when handling inodes, to avoid surprises
>> + * with corrupted volumes.  Checking i_sb->s_encoding ensures the
>> + * filesystem knows how to deal with case-insensitiveness.
>> + *
>> + * Return: if names will need casefolding
>> + */
>> +static inline bool dir_is_casefolded(const struct inode *dir)
>> +{
>> +#if IS_ENABLED(CONFIG_UNICODE)
>> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
>> +#else
>> +	return false;
>> +#endif
>> +}
>
> To be honest I've always been confused about why the ->s_encoding check is
> there.  It looks like Ted added it in 6456ca6520ab ("ext4: fix kernel oops
> caused by spurious casefold flag") to address a fuzzing report for a filesystem
> that had a casefolded directory but didn't have the casefold feature flag set.
> It seems like an unnecessarily complex fix, though.  The filesystem should just
> reject the inode earlier, in __ext4_iget().  And likewise for f2fs.  Then no
> other code has to worry about this problem.
>
> Actually, f2fs already does it, as I added it in commit f6322f3f1212:
>
>         if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
>                 set_sbi_flag(sbi, SBI_NEED_FSCK);
>                 f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
>                           __func__, inode->i_ino);
>                 return false;
>         }
>
> So just __ext4_iget() needs to be fixed.  I think we should consider doing that
> before further entrenching all the extra ->s_encoding checks.
>
> Also I don't understand why this needs to be part of your patch series anyway.
> Shouldn't eCryptfs check IS_CASEFOLDED() anyway?

While I agree with Ted's point about how this change is tiny compared to
the benefit of preventing casefold-related superblock corruptions on
runtime (and we want to keep it being done in ext4),  I also agree with
you that we don't need to check it also in ecryptfs.  But, I'll preserve
it in d_revalidate, since it is what we are currently doing in
d_compare/d_hash.

Also, this patchset has been sitting for years before the latest
discussions, and I'm tired of it, so I'm happy to keep this
discussion for another time.  Will drop this patch and just check
IS_CASEFOLDED in ecryptfs for the next iteration.

I'll follow up with another case-insensitive cleanup patchset I've been
siting on forever, which includes this patch and will restart this
discussion, among others.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

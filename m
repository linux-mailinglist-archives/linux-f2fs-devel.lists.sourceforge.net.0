Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792E8FBC69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jun 2024 21:18:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEZfW-00084f-MT;
	Tue, 04 Jun 2024 19:18:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1sEZfV-00084O-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 19:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=; b=DNMf/G3i+NK62F6HM++xenrUpn
 r0OSW8n2pRHGnIXPa6HXWtkxqCIo15Gjm2QrL9LD3NwUM9Zag7OQTUZTQkNT6Th6lpdCvQsv6u2xC
 I+opVn5IPRrUdpvW2u1KqhfXgaf6uSdFqbAH8Ox2nvdlhP1b7XNTBdjfEVtXHBkKY+bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=; b=BTTz+nf0GqiB6jFGQZd492+Py8
 LVB9M3xwUtz3L+Vaudu9i+5EEleVrrkNDErymsSbaWbZk+hwQcUwVnwJyp6OhI+xo2APULB56c1Fy
 4x88ujprddeV6Pfu5vc8OOzKBHJlQkIf+qdYDkUKK99OJQXur6IMQ+hcVaj5lkkDP/4Q=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sEZfT-0008P8-PX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 19:18:00 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44A8F21A49;
 Tue,  4 Jun 2024 19:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717528667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=;
 b=lEfy7KFvbYAu5Gy+ndRbat4fzOU68RDR7fbdoOvM8TNr+eLnWDKN3NLWHNk5nTEB+RBK/J
 VVk1aglcyJbAa95ekP89831ZhX+bpi36WVN+SgUs1vlh9OZrCfhOshwyHnQrQUseKv5/yt
 4429yG93oPOP/VXrBtWeE3tCOPD+aho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717528667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=;
 b=ApTIBBZgztLzgx2iXdTJhOWHbFiIpXmzJZXspoqfRyp+gK25RM6uuwfp5piowKx1ScboFA
 x7Mzq2DSvBYLAsCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717528667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=;
 b=lEfy7KFvbYAu5Gy+ndRbat4fzOU68RDR7fbdoOvM8TNr+eLnWDKN3NLWHNk5nTEB+RBK/J
 VVk1aglcyJbAa95ekP89831ZhX+bpi36WVN+SgUs1vlh9OZrCfhOshwyHnQrQUseKv5/yt
 4429yG93oPOP/VXrBtWeE3tCOPD+aho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717528667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rO2JAWmDJtlVxTQDorgmfpM/zzgopthZzmv/CylN0UA=;
 b=ApTIBBZgztLzgx2iXdTJhOWHbFiIpXmzJZXspoqfRyp+gK25RM6uuwfp5piowKx1ScboFA
 x7Mzq2DSvBYLAsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E55BD13A93;
 Tue,  4 Jun 2024 19:17:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mLlRMVpoX2bXYwAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 04 Jun 2024 19:17:46 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240529082634.141286-5-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Wed, 29 May 2024 11:26:31 +0300")
Organization: SUSE
References: <20240529082634.141286-1-eugen.hristev@collabora.com>
 <20240529082634.141286-5-eugen.hristev@collabora.com>
Date: Tue, 04 Jun 2024 15:17:41 -0400
Message-ID: <87cyowldpm.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; HAS_ORG_HEADER(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > From:
 Gabriel Krisman Bertazi <krisman@collabora.com> > > Instead of reimplementing
 ext4_match_ci, use the new libfs helper. > > It also adds a comment explaining
 why fname->cf_name.name must be > c [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [195.135.223.130 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEZfT-0008P8-PX
Subject: Re: [f2fs-dev] [PATCH v17 4/7] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 ebiggers@google.com, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> Instead of reimplementing ext4_match_ci, use the new libfs helper.
>
> It also adds a comment explaining why fname->cf_name.name must be
> checked prior to the encryption hash optimization, because that tripped
> me before.
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/namei.c | 91 +++++++++++++++----------------------------------
>  1 file changed, 27 insertions(+), 64 deletions(-)
>
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index ec4c9bfc1057..20668741a23c 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1390,58 +1390,6 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
>  }
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
> -/*
> - * Test whether a case-insensitive directory entry matches the filename
> - * being searched for.  If quick is set, assume the name being looked up
> - * is already in the casefolded form.
> - *
> - * Returns: 0 if the directory entry matches, more than 0 if it
> - * doesn't match or less than zero on error.
> - */
> -static int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
> -			   u8 *de_name, size_t de_name_len, bool quick)
> -{
> -	const struct super_block *sb = parent->i_sb;
> -	const struct unicode_map *um = sb->s_encoding;
> -	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
> -	struct qstr entry = QSTR_INIT(de_name, de_name_len);
> -	int ret;
> -
> -	if (IS_ENCRYPTED(parent)) {
> -		const struct fscrypt_str encrypted_name =
> -				FSTR_INIT(de_name, de_name_len);
> -
> -		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> -		if (!decrypted_name.name)
> -			return -ENOMEM;
> -		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
> -						&decrypted_name);
> -		if (ret < 0)
> -			goto out;
> -		entry.name = decrypted_name.name;
> -		entry.len = decrypted_name.len;
> -	}
> -
> -	if (quick)
> -		ret = utf8_strncasecmp_folded(um, name, &entry);
> -	else
> -		ret = utf8_strncasecmp(um, name, &entry);
> -	if (ret < 0) {
> -		/* Handle invalid character sequence as either an error
> -		 * or as an opaque byte sequence.
> -		 */
> -		if (sb_has_strict_encoding(sb))
> -			ret = -EINVAL;
> -		else if (name->len != entry.len)
> -			ret = 1;
> -		else
> -			ret = !!memcmp(name->name, entry.name, entry.len);
> -	}
> -out:
> -	kfree(decrypted_name.name);
> -	return ret;
> -}
> -
>  int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
>  				  struct ext4_filename *name)
>  {
> @@ -1503,20 +1451,35 @@ static bool ext4_match(struct inode *parent,
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (IS_CASEFOLDED(parent) &&
>  	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
> -		if (fname->cf_name.name) {
> -			if (IS_ENCRYPTED(parent)) {
> -				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> -					fname->hinfo.minor_hash !=
> -						EXT4_DIRENT_MINOR_HASH(de)) {
> +		int ret;
>  
> -					return false;
> -				}
> -			}
> -			return !ext4_ci_compare(parent, &fname->cf_name,
> -						de->name, de->name_len, true);
> +		/*
> +		 * Just checking IS_ENCRYPTED(parent) below is not
> +		 * sufficient to decide whether one can use the hash for
> +		 * skipping the string comparison, because the key might
> +		 * have been added right after
> +		 * ext4_fname_setup_ci_filename().  In this case, a hash
> +		 * mismatch will be a false negative.  Therefore, make
> +		 * sure cf_name was properly initialized before
> +		 * considering the calculated hash.
> +		 */
> +		if (IS_ENCRYPTED(parent) && fname->cf_name.name &&
> +		    (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> +		     fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de)))
> +			return false;
> +
> +		ret = generic_ci_match(parent, fname->usr_fname,
> +				       &fname->cf_name, de->name,
> +				       de->name_len);
> +		if (ret < 0) {
> +			/*
> +			 * Treat comparison errors as not a match.  The
> +			 * only case where it happens is on a disk
> +			 * corruption or ENOMEM.
> +			 */
> +			return false;
>  		}
> -		return !ext4_ci_compare(parent, fname->usr_fname, de->name,
> -						de->name_len, false);

With the changes to patch 3 in this iteration, This could become:

/*
 * Treat comparison errors as not a match.  The
 * only case where it happens is disk corruption
 * or ENOMEM.
 */
return ext4_ci_compare(parent, fname->usr_fname, de->name,
		       de->name_len, false) > 0;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

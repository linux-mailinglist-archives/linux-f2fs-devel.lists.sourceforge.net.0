Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738284E7D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 19:43:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rY9Mb-0000Ik-DE;
	Thu, 08 Feb 2024 18:43:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rY9MZ-0000Ie-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 18:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=; b=mqbaTD3MPbScYi6gjp18TMwpMM
 ls3l0ZA9jMOQ8wErLsxDoqa6pvwIbAZphSpIS8AkmcOu9oz6gFDQjBXqOPO/tQUgUnKIfNs979L2g
 eMBJnmhNvh3Yr/oAaIpJ5y0vHVJyKL/3AccmGfOjlSc93u3UfJykHmgBb+Y8yGOQEsJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=; b=E0xHJb1cdzQx0Ur5bf5+Efi6XT
 jebjASAa7cfpAXs1pmxMY2H2inoaxmnDxdkRmjQwfuIbJBqy4/BF6ENHbWIhJI1J7UBss1zIr/xvR
 xsq6XI3Cud4AaFwTaKm5EEJWB91F7o47GIqMGAbDeJim/A5VBGq/1gLsb+OukBFhGMDc=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rY9MZ-0002Ja-9g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 18:43:08 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67B781FCFF;
 Thu,  8 Feb 2024 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707417776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=;
 b=D8wF4yq8THXA1vsqQdCTE6uUX6rW7cNjgIgR8xhM/GZ16nCCoc+4e+x2fnssC1xsFlLgfF
 HHjFlL6QrUvFFXoYyDjoNcM3lhUUNhAVH3UHdm+OEdXovXxeP2KG1U4JLfbsQtmxZwgNPp
 6YvhSlyhufFeVADqNyyVpDRCme3XFkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707417776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=;
 b=kIfh3JVw0WDKSkwrxfijyXcmYm9rzJN0/q6AaQ+aGGaWL1ZonJma/1e/o4VEswAS70MnAa
 9rIYaC0cxoo0rZAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707417776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=;
 b=D8wF4yq8THXA1vsqQdCTE6uUX6rW7cNjgIgR8xhM/GZ16nCCoc+4e+x2fnssC1xsFlLgfF
 HHjFlL6QrUvFFXoYyDjoNcM3lhUUNhAVH3UHdm+OEdXovXxeP2KG1U4JLfbsQtmxZwgNPp
 6YvhSlyhufFeVADqNyyVpDRCme3XFkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707417776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rGFuTx22nZyt1Ef3qC80mJYAGVh7KhD1thhPxbHOGK4=;
 b=kIfh3JVw0WDKSkwrxfijyXcmYm9rzJN0/q6AaQ+aGGaWL1ZonJma/1e/o4VEswAS70MnAa
 9rIYaC0cxoo0rZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24A1D1326D;
 Thu,  8 Feb 2024 18:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bIXQArAgxWWqMgAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 08 Feb 2024 18:42:56 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240208064334.268216-3-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Thu, 8 Feb 2024 08:43:33 +0200")
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-3-eugen.hristev@collabora.com>
Date: Thu, 08 Feb 2024 13:42:54 -0500
Message-ID: <87plx6vlu9.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.31
X-Spamd-Result: default: False [-1.31 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.01)[46.77%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eugen Hristev <eugen.hristev@collabora.com> writes: > int
 ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 > struct ext4_filename *name) > { > @@ -1503, 20 +1451,
 35 @@ static bool ext4_match(struct
 inode *parent, > #if IS_ENABLE [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rY9MZ-0002Ja-9g
Subject: Re: [f2fs-dev] [RESEND PATCH v9 2/3] ext4: Reuse generic_ci_match
 for ci comparisons
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

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

A minor problem with splitting the series as you did is that "ext4: Log
error when lookup of encoded dentry fails" conflicts with this change
and you get a merge conflict if it is applied in the wrong order.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

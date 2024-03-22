Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC58874C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 23:12:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnn7C-0007fp-Mt;
	Fri, 22 Mar 2024 22:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rnn79-0007fV-VR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=; b=afdxc2MdD/w8UWRY7sI7KEgFWz
 2Z2dMza+2ohl87KthCRbfhz2iKsZ8CwtP8GrPq/zmXleMCv9VoEglD9C/9Hy/1iGZ5EwJZdo4vluH
 R+AxhXFzSN+voAe+UQzGIO4IzZKC+GUNP3YwPptOGpGvaXQuXhG1KWMSxbM59gPXkd7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=; b=a104qQZT2gEyPgW9D7MdnwVIB8
 Nm6BHE1xCdB6FcbgXZMY7chXfvm1OCgpP6Uk1o9zgqC6On5RoZJShVaVorXnwmGfi3Taa+cJsDFCF
 OHIroQKEysMCn0R3PNupZ9DUVBZe6kpLylpjZmOxvt1Kc3gtpcEEkodIpKkizPQzraE4=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rnn76-0006eY-8D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:11:52 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF29C38A8F;
 Fri, 22 Mar 2024 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711145496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=;
 b=i+DCSaHCastt8j3z9SusKvybZUMm+JTSJQd4EcxLc2dhlAZj06dj7Js9m1BwY/qgfj73wV
 CKeniWdM4e0/nu6HyO5IHta94rFjYi0htoAsWPXea4Lp/RdvdpLIXtaQSy7WLavxztp46p
 vJUFt6NzRnckQxP2fXoOrbW+ghNMYPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711145496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=;
 b=iMJ5N/8yUDUsqNpMRpxpGOdi4bp5VNayAK61HozHKt8IRaaoQwNuSxZbf9UMLzsu+h8pF0
 vTgiKlp/xqEyVtDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711145496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=;
 b=i+DCSaHCastt8j3z9SusKvybZUMm+JTSJQd4EcxLc2dhlAZj06dj7Js9m1BwY/qgfj73wV
 CKeniWdM4e0/nu6HyO5IHta94rFjYi0htoAsWPXea4Lp/RdvdpLIXtaQSy7WLavxztp46p
 vJUFt6NzRnckQxP2fXoOrbW+ghNMYPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711145496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aTZ09ncmKCd8WkUQEbzrII1H6hejyxJNsILQlSmmkc0=;
 b=iMJ5N/8yUDUsqNpMRpxpGOdi4bp5VNayAK61HozHKt8IRaaoQwNuSxZbf9UMLzsu+h8pF0
 vTgiKlp/xqEyVtDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7C3C132FF;
 Fri, 22 Mar 2024 22:11:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8ov9IhgC/mUEHgAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 22 Mar 2024 22:11:36 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
In-Reply-To: <20240215042654.359210-8-eugen.hristev@collabora.com> (Eugen
 Hristev via Linux-f2fs-devel's message of "Thu, 15 Feb 2024 06:26:53
 +0200")
References: <20240215042654.359210-1-eugen.hristev@collabora.com>
 <20240215042654.359210-8-eugen.hristev@collabora.com>
Date: Fri, 22 Mar 2024 18:11:35 -0400
Message-ID: <87ttkx9aso.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i+DCSaHC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="iMJ5N/8y"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.04 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.53)[80.55%]
X-Spam-Score: -4.04
X-Rspamd-Queue-Id: DF29C38A8F
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
 writes: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > > Instead
 of a bunch of ifdefs, make the unicode built checks part of the > code flow
 where possible, as requested by Torvalds. > > Reviewed-b [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rnn76-0006eY-8D
Subject: Re: [f2fs-dev] [PATCH v10 7/8] ext4: Move CONFIG_UNICODE defguards
 into the code flow
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
 Eric Biggers <ebiggers@google.com>, jack@suse.cz, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> writes:

> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> Instead of a bunch of ifdefs, make the unicode built checks part of the
> code flow where possible, as requested by Torvalds.
>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> [eugen.hristev@collabora.com: port to 6.8-rc3]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/ext4/crypto.c | 19 +++----------------
>  fs/ext4/ext4.h   | 33 +++++++++++++++++++++------------
>  fs/ext4/namei.c  | 14 +++++---------
>  fs/ext4/super.c  |  4 +---
>  4 files changed, 30 insertions(+), 40 deletions(-)
>
> diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
> index 7ae0b61258a7..1d2f8b79529c 100644
> --- a/fs/ext4/crypto.c
> +++ b/fs/ext4/crypto.c
> @@ -31,12 +31,7 @@ int ext4_fname_setup_filename(struct inode *dir, const struct qstr *iname,
>  
>  	ext4_fname_from_fscrypt_name(fname, &name);
>  
> -#if IS_ENABLED(CONFIG_UNICODE)
> -	err = ext4_fname_setup_ci_filename(dir, iname, fname);
> -	if (err)
> -		ext4_fname_free_filename(fname);
> -#endif
> -	return err;
> +	return ext4_fname_setup_ci_filename(dir, iname, fname);

This shouldn't remove the error path.  It effectively reintroduces the
memory leak fixed by commit 7ca4b085f430 ("ext4: fix memory leaks in
ext4_fname_{setup_filename,prepare_lookup}").

This patch was only about inlining the codeguards, so it shouldn't be
changing the logic.

>  }
>  
>  int ext4_fname_prepare_lookup(struct inode *dir, struct dentry *dentry,
> @@ -51,12 +46,7 @@ int ext4_fname_prepare_lookup(struct inode *dir, struct dentry *dentry,
>  
>  	ext4_fname_from_fscrypt_name(fname, &name);
>  
> -#if IS_ENABLED(CONFIG_UNICODE)
> -	err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
> -	if (err)
> -		ext4_fname_free_filename(fname);
> -#endif
> -	return err;
> +	return ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
>  }

likewise


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

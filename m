Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C448844739
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 19:35:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVFRC-00024d-GT;
	Wed, 31 Jan 2024 18:35:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rVFRB-00024X-15
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 18:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=; b=E00Kg51IJXwEAJmuRh75TTuh4W
 yQrm/+8voD8by6BZvg/RweiEC3DwC/7D/h3R1M7o3bvrSHbed919UFJTWELk2I+yNz1CEuPXVl6B2
 wJZFO3NlHEsFLJaG9NXAqeAjt5i3/jzIuFwfQ3wCQrBTvFuZk1VlpADkA/HuwHhwwJpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=; b=mdbIIUybMhVOPmL3DCnxA8YLrs
 2BAlCwBM85rky9F9RZSNVjh8LguvY1rUDuz2FxdHAU1EtvMqDubj7rSmbFTg112CDSxbn4ep7x0PC
 CHSpXOBoFSZIneeyDuYb9Tu7r8yzRLK9VzM6KvVbBM6pl/ib08OJNJP5nk7U7qfxTkqk=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rVFR7-00039s-Cd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 18:35:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85CDD1FB95;
 Wed, 31 Jan 2024 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706726143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=;
 b=zIC50bxiaXCsrC0a8NycfxSrLtttxTPUKEqhfr/fkjmRCCLKykep8hZ5fNkchvfwtXBxS+
 wCHfZHe7cDhw0pku9rU7iebpI+rqpKrGa0XWl9NE+2ZzThCLJ59CxF48FusXICVQbCDxsP
 wn5ybbRHmqFUhurn4B9kLyxEBQaMLnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706726143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=;
 b=j+jqCvSzcjrsvk/Y5XdBS+yuxLHBqVFJclQblqqLKQ7effDnO0wZvBlwfAChV8MHMrWn4d
 MkdS9gULamqN+BAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706726143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=;
 b=zIC50bxiaXCsrC0a8NycfxSrLtttxTPUKEqhfr/fkjmRCCLKykep8hZ5fNkchvfwtXBxS+
 wCHfZHe7cDhw0pku9rU7iebpI+rqpKrGa0XWl9NE+2ZzThCLJ59CxF48FusXICVQbCDxsP
 wn5ybbRHmqFUhurn4B9kLyxEBQaMLnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706726143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nZh9bI2nucB4Tu4k5g98e4aelswvFCokcNSj9QwRR1o=;
 b=j+jqCvSzcjrsvk/Y5XdBS+yuxLHBqVFJclQblqqLKQ7effDnO0wZvBlwfAChV8MHMrWn4d
 MkdS9gULamqN+BAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11BE5139B1;
 Wed, 31 Jan 2024 18:35:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id faPhLv6SumVySwAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 31 Jan 2024 18:35:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240131004724.GC2020@sol.localdomain> (Eric Biggers's message
 of "Tue, 30 Jan 2024 16:47:24 -0800")
Organization: SUSE
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-5-krisman@suse.de>
 <20240131004724.GC2020@sol.localdomain>
Date: Wed, 31 Jan 2024 15:35:40 -0300
Message-ID: <871q9x2vwj.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[8]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Mon, Jan 29, 
 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote: >> Unencrypted and
 encrypted-dentries where the key is available don't need >> to be revalidated
 with regards to fscrypt, sin [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVFR7-00039s-Cd
Subject: Re: [f2fs-dev] [PATCH v5 04/12] fscrypt: Drop d_revalidate for
 valid dentries during lookup
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Mon, Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote:
>> Unencrypted and encrypted-dentries where the key is available don't need
>> to be revalidated with regards to fscrypt, since they don't go stale
>> from under VFS and the key cannot be removed for the encrypted case
>> without evicting the dentry.  Mark them with d_set_always_valid, to
>
> "d_set_always_valid" doesn't appear in the diff itself.
>
>> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
>> index 4aaf847955c0..a22997b9f35c 100644
>> --- a/include/linux/fscrypt.h
>> +++ b/include/linux/fscrypt.h
>> @@ -942,11 +942,22 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>>  static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
>>  						 bool is_nokey_name)
>>  {
>> -	if (is_nokey_name) {
>> -		spin_lock(&dentry->d_lock);
>> +	spin_lock(&dentry->d_lock);
>> +
>> +	if (is_nokey_name)
>>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
>> -		spin_unlock(&dentry->d_lock);
>> +	else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
>> +		 dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
>> +		/*
>> +		 * Unencrypted dentries and encrypted dentries where the
>> +		 * key is available are always valid from fscrypt
>> +		 * perspective. Avoid the cost of calling
>> +		 * fscrypt_d_revalidate unnecessarily.
>> +		 */
>> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
>>  	}
>> +
>> +	spin_unlock(&dentry->d_lock);
>
> This makes lookups in unencrypted directories start doing the
> spin_lock/spin_unlock pair.  Is that really necessary?
>
> These changes also make the inline function fscrypt_prepare_lookup() very long
> (when including the fscrypt_prepare_lookup_dentry() that's inlined into it).
> The rule that I'm trying to follow is that to the extent that the fscrypt helper
> functions are inlined, the inline part should be a fast path for unencrypted
> directories.  Encrypted directories should be handled out-of-line.
>
> So looking at the original fscrypt_prepare_lookup():
>
> 	static inline int fscrypt_prepare_lookup(struct inode *dir,
> 						 struct dentry *dentry,
> 						 struct fscrypt_name *fname)
> 	{
> 		if (IS_ENCRYPTED(dir))
> 			return __fscrypt_prepare_lookup(dir, dentry, fname);
>
> 		memset(fname, 0, sizeof(*fname));
> 		fname->usr_fname = &dentry->d_name;
> 		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
> 		fname->disk_name.len = dentry->d_name.len;
> 		return 0;
> 	}
>
> If you could just add the DCACHE_OP_REVALIDATE clearing for dentries in
> unencrypted directories just before the "return 0;", hopefully without the
> spinlock, that would be good.  Yes, that does mean that
> __fscrypt_prepare_lookup() will have to handle it too, for the case of dentries
> in encrypted directories, but that seems okay.

ok, will do.  IIUC, we might be able to do without the d_lock
provided there is no store tearing.

But what was the reason you need the d_lock to set DCACHE_NOKEY_NAME
during lookup?  Is there a race with parallel lookup setting d_flag that
I couldn't find? Or is it another reason?


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

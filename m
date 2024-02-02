Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C954F847232
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Feb 2024 15:50:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVus6-0004qy-Bs;
	Fri, 02 Feb 2024 14:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rVus3-0004qr-NF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 14:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=; b=OLk/AiXcEETZZknf4K6xevgAnk
 tpONdpRhLpvDhVPtfPXtv+8ndUrn4+fs9MpsyAhVijS5otqjUS4PjgJd31g5bDJYFVCY11Kz9oqUp
 4zMNACcA85Q49FYWY2KgYvob2HOy2hSIgywTlYXeBfN+EEk38vW0/8Mov6lz26fE2o64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=; b=Tl9A+eaRaAVJx//ZfqT4jM8p4o
 0CiymtkazdRVxAqMmfJzSmksVVEBcjMeT6plBXDg7JRaTKwkQYQ3sX4SVCqljHTDcaZbMBtec4ImX
 VLhOipqBDA6cRog2V0uOKI+ATQnmxvLZmhvgwdRpkKmtoi3s79EGuTVRDbMUvoKymmqo=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rVus1-0003tF-PO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 14:50:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DEF39221DE;
 Fri,  2 Feb 2024 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706885411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=;
 b=bGr7+y1BSUxED48XSOHudVg8YMKPcHZyd7MQELl+Vi77liXl9JQMvlOKt+zkNUeqTnX6TA
 c/jqWKq/wkBC2KjkOUnvhkika7/RhK87Tz9KboIYyk/DruchabIa+Ggp+J9JgHxvgcYYPi
 19qGZetyhTKZSQzs3GUUA54D78Jl3iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706885411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=;
 b=7kn5qUrm7OM+VyJatmGdpZaAc5UtUmU42BBpCnrTjqtBiH47O0nOzq5BNopQv8PqZZso4T
 k72nMvnDnGnFiADA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706885410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=;
 b=HMD9QmEp0Qsc5pL+YMFSkodu7eGebFvqI17xsrAWn2uIXO3TJ8PDsBuTIkf+fdRJ9Sp9zo
 QhmwyZHTqz/fAGysjhH4G+CBQWLS3rBqJA5WsnWg2JiMxjXItzsNwZZUct1v+9Z9RXn819
 mz2x059Q2w8fx3eaO9uBiJn94pP6Pto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706885410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5AGzqGQFFXmMwVA4kAP4RP63hmICs6T3j3mdDSSjX0=;
 b=BMFy8QsLyL6nQlKMWpxkvkUyOdNhPFR1/+2gv4MqLqFn+PpTQx8ZdyUL3cPofrLPIXr0xp
 aonjsYoluSeXqxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4390E13A58;
 Fri,  2 Feb 2024 14:50:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YDwpOiEBvWXjJgAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 02 Feb 2024 14:50:09 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>, brauner@kernel.org,
 viro@zeniv.linux.org.uk
In-Reply-To: <20240201032433.GB1526@sol.localdomain> (Eric Biggers's message
 of "Wed, 31 Jan 2024 19:24:33 -0800")
Organization: SUSE
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-5-krisman@suse.de>
 <20240131004724.GC2020@sol.localdomain>
 <871q9x2vwj.fsf@mailhost.krisman.be>
 <20240201032433.GB1526@sol.localdomain>
Date: Fri, 02 Feb 2024 11:50:07 -0300
Message-ID: <87le82yl7k.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HMD9QmEp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BMFy8QsL
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_CC(0.00)[kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -6.51
X-Rspamd-Queue-Id: DEF39221DE
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Wed, Jan 31, 
 2024 at 03:35:40PM -0300, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > On Mon, Jan 29, 2024 at 05:43:22PM -0300,
 Gabriel Krisman Bertazi wrote [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVus1-0003tF-PO
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
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Wed, Jan 31, 2024 at 03:35:40PM -0300, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > On Mon, Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote:
>> >> Unencrypted and encrypted-dentries where the key is available don't need
>> >> to be revalidated with regards to fscrypt, since they don't go stale
>> >> from under VFS and the key cannot be removed for the encrypted case
>> >> without evicting the dentry.  Mark them with d_set_always_valid, to
>> >
>> > "d_set_always_valid" doesn't appear in the diff itself.
>> >
>> >> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
>> >> index 4aaf847955c0..a22997b9f35c 100644
>> >> --- a/include/linux/fscrypt.h
>> >> +++ b/include/linux/fscrypt.h
>> >> @@ -942,11 +942,22 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>> >>  static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
>> >>  						 bool is_nokey_name)
>> >>  {
>> >> -	if (is_nokey_name) {
>> >> -		spin_lock(&dentry->d_lock);
>> >> +	spin_lock(&dentry->d_lock);
>> >> +
>> >> +	if (is_nokey_name)
>> >>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
>> >> -		spin_unlock(&dentry->d_lock);
>> >> +	else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
>> >> +		 dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
>> >> +		/*
>> >> +		 * Unencrypted dentries and encrypted dentries where the
>> >> +		 * key is available are always valid from fscrypt
>> >> +		 * perspective. Avoid the cost of calling
>> >> +		 * fscrypt_d_revalidate unnecessarily.
>> >> +		 */
>> >> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
>> >>  	}
>> >> +
>> >> +	spin_unlock(&dentry->d_lock);
>> >
>> > This makes lookups in unencrypted directories start doing the
>> > spin_lock/spin_unlock pair.  Is that really necessary?
>> >
>> > These changes also make the inline function fscrypt_prepare_lookup() very long
>> > (when including the fscrypt_prepare_lookup_dentry() that's inlined into it).
>> > The rule that I'm trying to follow is that to the extent that the fscrypt helper
>> > functions are inlined, the inline part should be a fast path for unencrypted
>> > directories.  Encrypted directories should be handled out-of-line.
>> >
>> > So looking at the original fscrypt_prepare_lookup():
>> >
>> > 	static inline int fscrypt_prepare_lookup(struct inode *dir,
>> > 						 struct dentry *dentry,
>> > 						 struct fscrypt_name *fname)
>> > 	{
>> > 		if (IS_ENCRYPTED(dir))
>> > 			return __fscrypt_prepare_lookup(dir, dentry, fname);
>> >
>> > 		memset(fname, 0, sizeof(*fname));
>> > 		fname->usr_fname = &dentry->d_name;
>> > 		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
>> > 		fname->disk_name.len = dentry->d_name.len;
>> > 		return 0;
>> > 	}
>> >
>> > If you could just add the DCACHE_OP_REVALIDATE clearing for dentries in
>> > unencrypted directories just before the "return 0;", hopefully without the
>> > spinlock, that would be good.  Yes, that does mean that
>> > __fscrypt_prepare_lookup() will have to handle it too, for the case of dentries
>> > in encrypted directories, but that seems okay.
>> 
>> ok, will do.  IIUC, we might be able to do without the d_lock
>> provided there is no store tearing.
>> 
>> But what was the reason you need the d_lock to set DCACHE_NOKEY_NAME
>> during lookup?  Is there a race with parallel lookup setting d_flag that
>> I couldn't find? Or is it another reason?
>
> d_flags is documented to be protected by d_lock.  So for setting
> DCACHE_NOKEY_NAME, fs/crypto/ just does the safe thing of taking d_lock.  I
> never really looked into whether the lock can be skipped there (i.e., whether
> anything else can change d_flags while ->lookup is running), since this code
> only ran for no-key names, for which performance isn't really important.

Yes, I was looking for the actual race that could happen here, and
couldn't find one. As far as I understand it, the only thing that could
see the dentry during a lookup would be a parallel lookup, but those
will be held waiting for completion in d_alloc_parallel, and won't touch
d_flags.  Currently, right after this code, we call d_set_d_op() in
generic_set_encrypted_ci_d_ops(), which will happily write d_flags without
the d_lock. If this is a problem here, we have a problem there.

What I really don't want to do is keep the lock for DCACHE_NOKEY_NAME,
but drop it for unsetting DCACHE_OP_REVALIDATE right in the same field,
without a good reason.  I get the argument that unencrypted
dentries are a much hotter path and we care more.  But the locking rules
of ->d_lookup don't change for both cases.

So, I'd rather drop the d_lock entirely in this path, not only for the
hunk I'm proposing.  It would be good to get an actual confirmation from
Al or Christian, though.

CC'ing Christian.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

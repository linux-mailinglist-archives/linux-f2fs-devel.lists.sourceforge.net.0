Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891A83CD44
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 21:18:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT6Az-0004Ym-P2;
	Thu, 25 Jan 2024 20:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rT6Ay-0004Yg-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 20:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=; b=mazCZCzhH68g36CSGDCi4UiJba
 qXOVocL73HJJHqCjPuF/xxSlTf0D3S0EaJJppG73YMnCk+d0sKK6dqT8RIkrJbopBDxPZQJykepmP
 HfgTmCXIUug/NoCyHEgEFkmqefNaGx3pQMXq0M9FG61QONauQy9rwJJvTZdcbpkJ7HMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=; b=O6KnZ50NJDveMhX7OejGSJ4dib
 GN58HS+8vn0UkOZxghPS4xb8pjjiByfkI884kR2svxxcDvTMrY1ioz52Aga8/jDs18Z65O2K/7hmR
 5l5+Aun0/xLMGDAJV2oG/U0WSIxvOPfBu5bbfBpa6TxjIoBwjtiwgJVi19pZgaDnrs/Q=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rT6Ax-0002Bo-K7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 20:18:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A99D91FE6B;
 Thu, 25 Jan 2024 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706213884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=;
 b=HVt/bVeeOovvvvh7pnp/g7SfUmHMWUvSjIXnJBdPLLRUXjWiaT5Pa9dEl5aELHCAGjZKdT
 3OzndkI1FHMlj2DLt7x6sTcP9TR2AuHRHj2EQdh83tHf85fMEsj7vxvj8eKyMngV4IAc4S
 QKxGOIT8vdOpw4WbddTG/zlUzs7eWBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706213884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=;
 b=twLGafixShOuaMbCl36toLifBb6JP1CXrgrCJw1rMMmK8V5Hd7Rtb9eqfRh5SwNTkqqMuU
 hVPcOaajDB6JpxAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706213883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=;
 b=I7VhO6R3I7ul/zXahlEOZzJ5bEFab/IWJTSBsUJFic7kDSCW7VwhppO6rqKCJfk9MMnsMp
 BCyOLwvhSVvLxDDS+PCIvLaDKboj9ju05RhApqAldUX0dajDIZhi6IwmfL5gveJWfmTqCJ
 lc2KzCQgyQT4vXYSkZXLNcpRu8x6CjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706213883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3ya30AYW8N/E78PgSlPUr0eoJq9IfloPJjz3fkDUrA=;
 b=bAQXolaQ447YaxrGzDEUJ9g2EdXFfozjizMDsPADS4pEsEBUdsdEBTgLG0tedtHwiVum2+
 w0o/iDmDjp949kBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E1ED13649;
 Thu, 25 Jan 2024 20:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hIeCMPrBsmXfPAAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 25 Jan 2024 20:18:02 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240125030530.GB52073@sol.localdomain> (Eric Biggers's message
 of "Wed, 24 Jan 2024 19:05:30 -0800")
Organization: SUSE
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-3-krisman@suse.de>
 <20240125030530.GB52073@sol.localdomain>
Date: Thu, 25 Jan 2024 17:18:00 -0300
Message-ID: <87a5otxj47.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I7VhO6R3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bAQXolaQ
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.05 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.04)[57.42%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; FROM_HAS_DN(0.00)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,vger.kernel.org,lists.sourceforge.net,gmail.com];
 RCVD_TLS_ALL(0.00)[];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -5.05
X-Rspamd-Queue-Id: A99D91FE6B
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Jan 19, 
 2024 at 03:47:34PM -0300, Gabriel Krisman Bertazi wrote: >> To make the patch
 simpler,
 we now call fscrypt_get_encryption_info twice >> for fscrypt_prepare_lookup, 
 once inside fscryp [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT6Ax-0002Bo-K7
Subject: Re: [f2fs-dev] [PATCH v3 02/10] fscrypt: Share code between
 functions that prepare lookup
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

> On Fri, Jan 19, 2024 at 03:47:34PM -0300, Gabriel Krisman Bertazi wrote:
>> To make the patch simpler, we now call fscrypt_get_encryption_info twice
>> for fscrypt_prepare_lookup, once inside fscrypt_setup_filename and once
>> inside fscrypt_prepare_lookup_dentry.  It seems safe to do, and
>> considering it will bail early in the second lookup and most lookups
>> should go to the dcache anyway, it doesn't seem problematic for
>> performance.  In addition, we add a function call for the unencrypted
>> case, also during lookup.
>
> Unfortunately I don't think it's correct.  This is basically undoing my fix
> b01531db6cec ("fscrypt: fix race where ->lookup() marks plaintext dentry as
> ciphertext") from several years ago.
>
> When a lookup is done, the filesystem needs to either treat the name being
> looked up as a no-key name *or* as a regular name, depending on whether the
> directory's key is present.  We shouldn't enable race conditions where, due to
> the key being concurrently added, the name is treated as a no-key name for
> filename matching purposes but a regular name for dentry validation purposes.
> That can result in an anomaly where a file that exists ends up with a negative
> dentry that doesn't get invalidated.
>
> Basically, the boolean fscrypt_name::is_nokey_name that's produced by
> fscrypt_setup_filename() should continue to be propagated to DCACHE_NOKEY_NAME.

I see your point.  I'll drop this patch and replace it with a patch that
just merges the DCACHE_NOKEY_NAME configuration.  Sadly, we gotta keep
the two variants I think.

thanks for the review

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

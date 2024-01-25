Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A483CD53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 21:21:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT6Dp-0004c9-AV;
	Thu, 25 Jan 2024 20:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rT6Dn-0004c3-Qw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 20:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=; b=mHk5kmeZUVtco9VkCvCl4CP9Vv
 8FLrnNmwvFw6rvn9pY+b7d5gjZqYgo+D73KSn1BUb3OJvDVlrMixl5VoNpTfFmPl1JkjI7lUbdKW4
 tzBwXQghEGcuZHsSBKzW7myd0hmkZPOdQ7vcw6hlCaiUMK9hLTQW7d1IcZmzvpjfeU1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=; b=MrwFLEyJntEWlA7EK7QdtgsoY6
 EUjhI21CSVnjCAXZZ7zcU8T+qTNbFGwmwHM4BPnGz/p2a24pLy4uIjsZNCkzV18TKQYrcJ0D3VhXi
 uvU6PZO9yAR18O5TZUgMPyxEB7SCnRPaOQqCExa9SXf/Q9kn8GaWkX21TlmIa/2GC/Xo=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rT6Dm-0002OD-TT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 20:21:12 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5A281F8C0;
 Thu, 25 Jan 2024 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706214060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=;
 b=DyQyYBbtPHSAT6EYfoylG0h4g3LW7fy2UMngStybNtploSj1qFdKOaKk1dTBtcVy9ZYZL4
 QEizUNfia+r4OlZRhRgd7N+Z2/jMQX6MVe5riaapjzy6eKm8DtUXX6C+sNjoZHz5L2qC/P
 1JaytiF53PdApXimLVY3XgDrynIzfjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706214060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=;
 b=zE+tHEoSuY9QGq1Y+mG8ChBZFLE/zNUn2E3RJhVgs5c7fowwBaxmrVpZzGqttVAoNja3AO
 gMKfgSmd6Y6V/uCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706214059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=;
 b=M2SBXYyMQOu98RHsKRH0L/fsmPdh3rjWLh/3fpu9yKwFEwab16deD3s3optPyNalukdJUP
 QHtDjm0hPB5cv0rQE85BxDnNXkdqgFaf+NZp+uLnGDrdXovQvXtiSrCzorlO80r9e0/Uos
 eLbgfmgQ3tIo2X43LONDpXlPpXfgIGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706214059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bFRvUiQ4Ykyi+6Nv/iNNF89mabY21hkYIXwk/h2jKk=;
 b=dkupbRlfT2sT3mO1Yw10H5b2WZbnk84rVxKbt8/1jpe8fFuM3vJlwWbumuXxojiiXbEx07
 6XcNf8y99svsQTDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 486FE13649;
 Thu, 25 Jan 2024 20:20:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HGBVAKvCsmWcPQAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 25 Jan 2024 20:20:58 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240125031251.GC52073@sol.localdomain> (Eric Biggers's message
 of "Wed, 24 Jan 2024 19:12:51 -0800")
Organization: SUSE
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-5-krisman@suse.de>
 <20240125031251.GC52073@sol.localdomain>
Date: Thu, 25 Jan 2024 17:20:56 -0300
Message-ID: <875xzhxizb.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.12 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,vger.kernel.org,lists.sourceforge.net,gmail.com];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.02)[53.38%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.12
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Jan 19, 
 2024 at 03:47:36PM -0300, Gabriel Krisman Bertazi wrote: >> /* >> * When
 d_splice_alias() moves a directory's no-key alias to its plaintext alias >>
 * as a result of the encryption k [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT6Dm-0002OD-TT
Subject: Re: [f2fs-dev] [PATCH v3 04/10] fscrypt: Drop d_revalidate once the
 key is added
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

> On Fri, Jan 19, 2024 at 03:47:36PM -0300, Gabriel Krisman Bertazi wrote:
>> /*
>>  * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
>>  * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
>>  * cleared.  Note that we don't have to support arbitrary moves of this flag
>>  * because fscrypt doesn't allow no-key names to be the source or target of a
>>  * rename().
>>  */
>>  static inline void fscrypt_handle_d_move(struct dentry *dentry)
>>  {
>>  	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
>> +
>> +	/*
>> +	 * Save the d_revalidate call cost during VFS operations.  We
>> +	 * can do it because, when the key is available, the dentry
>> +	 * can't go stale and the key won't go away without eviction.
>> +	 */
>> +	if (dentry->d_op && dentry->d_op->d_revalidate == fscrypt_d_revalidate)
>> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
>>  }
>
> Is there any way to optimize this further for the case where fscrypt is not
> being used?  This is called unconditionally from d_move().  I've generally been
> trying to avoid things like this where the fscrypt support slows things down for
> everyone even when they're not using the feature.

The problem would be figuring out whether the filesystem has fscrypt
enabled.  I think we can rely on sb->s_cop always being set:

if (sb->s_cop)
   fscrypt_handle_d_move(dentry);

What do you think?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

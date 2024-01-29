Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBD84138F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 20:34:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUXOh-0001P1-4x;
	Mon, 29 Jan 2024 19:34:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rUXOc-0001Ou-RY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 19:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=; b=eloBMDlLZFfzlnLaMiU8Eg5CSV
 JmNy4ynDmUfCJNKIdsRY+B66oQFI1WQtZxV7tsa/0wGP4fntM7ptY/+VFG1az9XwQWMB92LJHxc8L
 Oms6nL9pURw+966diFHPb4tWP7VBkp2mKN/xNDAT6SArkrI7OHnZrL2kk4Gam7CBk20Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=; b=gdZF9JVtyFdFCG/zZksgTyrW7O
 xculFwlUQ4jnFkWMjqEXGXzsTCwKjxvaUw+ZAAmBXj6CO1UblgYVvR/L2Vc5elX56K8pMSlk7hlr0
 mWGEi43Btk8pVe+i2hnv9W4olr+xl8y+CV8e23yqB9RROKkGz4NXUrDvFJWh//jQc9eM=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUXOa-0005mw-OP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 19:34:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB74A1F804;
 Mon, 29 Jan 2024 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706556851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=;
 b=Akdljbtn+F93q9XccTDO0Lr/Xh7tqJkwWJDtW0bqAGII9RD9cQA0gKip5uOQ9NG9p9VgXa
 6EzIRQ9nUwsAWKs0K/CYZQRU6Mye6EY5ZERlaegAYcm3noPDsDRIlUfX+uYwzjspMJhtL4
 UAtLQz/pROzwSPbEbQkSlVKq5evXzUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706556851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=;
 b=SRLQhXt36qU0Qn/7dGzH033vFIufR8Dc08GWj2lS8xYmSkhF2//42gBAFjOKMLSl09HovF
 Wy7SE0jAQEEJo+DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706556850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=;
 b=WkNFisM6pCijBZtZpRAOSWgcOdAoa3Awt9MJVTg4BTCcNZAMy7fhuBBM9GBKseoeXH50Yn
 FixiX75q/F10zpdnkx/YvAjLr/T8IoND0S3PiAUFwillO81LQDNffKr9HZ7Y5juIA70AL4
 VkItiClDIPcynZKxhRbmNuzLQZNRw2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706556850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKQR5gl8Z8oP7RS5Lte3WVwl5Sgn5t9EAu+p+g9JCHs=;
 b=t5FAcg/7BbqBPNoSmmVOUL1IJTyZv6Nb1gDjGcM7hds4ZFAjRIBroTsdu5VPHY3QOXDFl9
 YizM3mCMpbFicmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DC6B13647;
 Mon, 29 Jan 2024 19:34:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FcSFOLH9t2W4fQAAD6G6ig
 (envelope-from <krisman@suse.de>); Mon, 29 Jan 2024 19:34:09 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240127071742.GE11935@sol.localdomain> (Eric Biggers's message
 of "Fri, 26 Jan 2024 23:17:42 -0800")
Organization: SUSE
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-5-krisman@suse.de>
 <20240125031251.GC52073@sol.localdomain>
 <875xzhxizb.fsf@mailhost.krisman.be>
 <20240127071742.GE11935@sol.localdomain>
Date: Mon, 29 Jan 2024 16:34:07 -0300
Message-ID: <87zfwo2ats.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,vger.kernel.org,lists.sourceforge.net,gmail.com];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[34.53%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Thu, Jan 25, 
 2024 at 05:20:56PM -0300, Gabriel Krisman Bertazi wrote: >> Eric Biggers
 <ebiggers@kernel.org> writes: >> >> > On Fri, Jan 19, 2024 at 03:47:36PM -0300,
 Gabriel Krisman Bertazi wrote [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUXOa-0005mw-OP
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

> On Thu, Jan 25, 2024 at 05:20:56PM -0300, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>> > On Fri, Jan 19, 2024 at 03:47:36PM -0300, Gabriel Krisman Bertazi wrote:
>> >> /*
>> >>  * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
>> >>  * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
>> >>  * cleared.  Note that we don't have to support arbitrary moves of this flag
>> >>  * because fscrypt doesn't allow no-key names to be the source or target of a
>> >>  * rename().
>> >>  */
>> >>  static inline void fscrypt_handle_d_move(struct dentry *dentry)
>> >>  {
>> >>  	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
>> >> +
>> >> +	/*
>> >> +	 * Save the d_revalidate call cost during VFS operations.  We
>> >> +	 * can do it because, when the key is available, the dentry
>> >> +	 * can't go stale and the key won't go away without eviction.
>> >> +	 */
>> >> +	if (dentry->d_op && dentry->d_op->d_revalidate == fscrypt_d_revalidate)
>> >> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
>> >>  }
>> >
>> > Is there any way to optimize this further for the case where fscrypt is not
>> > being used?  This is called unconditionally from d_move().  I've generally been
>> > trying to avoid things like this where the fscrypt support slows things down for
>> > everyone even when they're not using the feature.
>> 
>> The problem would be figuring out whether the filesystem has fscrypt
>> enabled.  I think we can rely on sb->s_cop always being set:
>> 
>> if (sb->s_cop)
>>    fscrypt_handle_d_move(dentry);
>> 
>> What do you think?
>
> That's better, I just wonder if there's an even better way.  Do you need to do
> this for dentries that don't have DCACHE_NOKEY_NAME set?  If not, it would be
> more efficient to test for DCACHE_NOKEY_NAME before clearing the flags.

I like that.  We don't need it for dentries without DCACHE_NOKEY_NAME,
because those dentries have the d_revalidate disabled at lookup-time.

I raced my v4 with your comment, but I'll spin a v5 folding in this
suggestion shortly.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

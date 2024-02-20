Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C735485B024
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 01:48:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcEJS-0004zK-8i;
	Tue, 20 Feb 2024 00:48:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcEJQ-0004zE-W1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 00:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=; b=cUEWuieXvfwT2xu42tTN4w9ZMG
 0LXwRIWBjfvN3kYnmBkDvB8IO6VU17jpoXZfT/R8CxUQn4ED4M09i2SvYvtRdJtLqzHGwzoPSK7RE
 ADp//QS5JPnHLVFxozHzg0We2sbzv8kCsQmkI/c0qB/0EKLc6fkStIH3i7PLmMumi3WY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=; b=IsaVt28uu+5H+fTvfz3PUpvV3m
 dDKzwT0ByhYmrqU7Cirl8LOhtQ0rfzidSeRlOQiIQPuLqQia8mZpKlLz5vfpW8Ubo96ZvJpvvtUbi
 WhmCI6hxzCry44Fmzn9Q7Sam4O5qcQbj6irDX0KWUhlWLxLZ5G2qNcFZQLir3y8VyEPI=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcEJL-000087-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 00:48:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2EB202202B;
 Tue, 20 Feb 2024 00:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708390113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=;
 b=XUO2PzsnpxrtzQAcjiKAcYfns23lBtjvFRuxq7/8WfCbqamevQAhwVK325bBA4m0f8Okmq
 YF5y4k8Xb2+L1cyxgPKlGuspAl6/H9hNqxDR/N9jQbfVajiCoS7BsmOtwJEHzjCICbPUnx
 k3uc2+uVfRP1LiyIEWC4aV+yNUJbM/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708390113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=;
 b=Z5Jal858y9Bllawtyexcx+fB1cZ6YqQEkoIdcV0a5RiG059dmkjKuvDi5IlIblvTTaCq6m
 FaBo2ZRFrt962aBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708390112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=;
 b=q1oHSXBWXZX86VZPXZew6IHWtc017Pe+W0H38TZVA90eO9I80wB+zZYgzvrQ5gNCJSuMsv
 mzTbowJ/PLoog4JDlM4suRS0K3C1oQnTckFs77llXVz932h+7NrCSitenR4Sk51Pi36tDi
 oeyTEbrMvxT6LCcfIXp3UWMm3+vsUmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708390112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGEecwVaYaJpSbMfZXIT26jnfC5dHGGtAOwZ6dBUMhw=;
 b=z9aDjGaz3EhGU0YUKTERwzdmglwyXYyACGM+uIQ/17k2YInQaftYOs1QmoM/V3Dlvw1+Si
 uHLg5EiLFb7XV5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA7DC139D0;
 Tue, 20 Feb 2024 00:48:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SNs9M9/202WucAAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 20 Feb 2024 00:48:31 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240215003145.GK1638@sol.localdomain> (Eric Biggers's message
 of "Wed, 14 Feb 2024 16:31:45 -0800")
Organization: SUSE
References: <20240213021321.1804-1-krisman@suse.de>
 <20240213021321.1804-5-krisman@suse.de>
 <20240215001631.GI1638@sol.localdomain>
 <20240215003145.GK1638@sol.localdomain>
Date: Mon, 19 Feb 2024 19:48:30 -0500
Message-ID: <875xykarkx.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Wed, Feb 14, 
 2024 at 04:16:31PM -0800, Eric Biggers wrote: >> On Mon, Feb 12, 2024 at
 09:13:15PM -0500, Gabriel Krisman Bertazi wrote: >> > From fscrypt perspective,
 once the key is available, th [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcEJL-000087-Kv
Subject: Re: [f2fs-dev] [PATCH v6 04/10] fscrypt: Drop d_revalidate once the
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
Cc: brauner@kernel.org, tytso@mit.edu, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Wed, Feb 14, 2024 at 04:16:31PM -0800, Eric Biggers wrote:
>> On Mon, Feb 12, 2024 at 09:13:15PM -0500, Gabriel Krisman Bertazi wrote:
>> > From fscrypt perspective, once the key is available, the dentry will
>> > remain valid until evicted for other reasons, since keyed dentries don't
>> > require revalidation and, if the key is removed, the dentry is
>> > forcefully evicted.  Therefore, we don't need to keep revalidating them
>> > repeatedly.
>> > 
>> > Obviously, we can only do this if fscrypt is the only thing requiring
>> > revalidation for a dentry.  For this reason, we only disable
>> > d_revalidate if the .d_revalidate hook is fscrypt_d_revalidate itself.
>> > 
>> > It is safe to do it here because when moving the dentry to the
>> > plain-text version, we are holding the d_lock.  We might race with a
>> > concurrent RCU lookup but this is harmless because, at worst, we will
>> > get an extra d_revalidate on the keyed dentry, which is will find the
>> > dentry is valid.
>> > 
>> > Finally, now that we do more than just clear the DCACHE_NOKEY_NAME in
>> > fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
>> > extra costs.
>> > 
>> > Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
>> 
>> I think this explanation misses an important point, which is that it's only
>> *directories* where a no-key dentry can become the regular dentry.  The VFS does
>> the move because it only allows one dentry to exist per directory.
>> 
>> For nondirectories, the dentries don't get reused and this patch is irrelevant.
>> 
>> (Of course, there's no point in making fscrypt_handle_d_move() check whether the
>> dentry is a directory, since checking DCACHE_NOKEY_NAME is sufficient.)
>> 
>> The diff itself looks good -- thanks.
>> 
>
> Also, do I understand correctly that this patch is a performance optimization,
> not preventing a performance regression?  The similar patch that precedes this
> one, "fscrypt: Drop d_revalidate for valid dentries during lookup", is about
> preventing a performance regression on dentries that aren't no-key.  This patch
> looks deceptively similar, but it only affects no-key directory dentries, which
> we were already doing the fscrypt_d_revalidate for, even after the move to the
> plaintext name.  It's probably still a worthwhile optimization to stop doing the
> fscrypt_d_revalidate when a directory dentry gets moved like that.  But I want
> to make sure I'm correctly understanding each patch.

Hi Eric,

Yes, your understanding is correct. The previous patch prevents the
regression, given that we will install d_revalidate "by default" on all
dentries when fscrypt is enabled. Once that was done, it seemed obvious
to add the optimization to also drop it when the key is added later,
which is what this patch is about.

I'll follow up with a v7 shortly. Just need to find some cycles to work
on it.

thanks,


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

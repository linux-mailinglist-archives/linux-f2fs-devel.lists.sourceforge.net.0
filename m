Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3258CC965
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 01:06:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9v29-0001YM-E5;
	Wed, 22 May 2024 23:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1s9v27-0001YE-S9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 May 2024 23:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=; b=THWK87ZlXAEwfdeGDoaT0rZECb
 t2+E5MBvbEUx/ite1FS7j/dSDe6KfUv/h+7Lt6m2VZLSlE/0iOoYkEJTxgesChdksa4TK2fHske1w
 +3En8sNE/PpweBPv0p5eHRSpBAHCDcS4nhYcsVjnUWrWKzdwhbJydpmzmwQdrdaGmUYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=; b=drt2MnDxH3Ol2TG4DrXyfPClmO
 jP6WdjkyBxUb1dEHyc3QZbKi1sdFlLajyVye1DhTA6AeTeT0zO0p/yPQxq3dpLyGwWzb2KPGy030D
 9NG14g5GnoSl9/10TabOyjPrwl3x7XEqhFe+cyPOx73T+moMlW/LbbQfJ5gtwmyYU6q4=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s9v28-0007ax-2D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 May 2024 23:06:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4EDFE21C90;
 Wed, 22 May 2024 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716419155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=;
 b=NlJx4mwR3v/+64ZICJXtuF36Dupuk5G3omX9aABu8HjIwXsxGa1gTxreU114AX7FSBAWI5
 TMwfhTkUZTu1iDP2c/uwVe20hKDTK6CD6t00KGcBUxfwv5PS3IF+ev6h7NifXQ+uI/cvtN
 T1lTUm2GTQRxGDQHHng6oBseJgWffrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716419155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=;
 b=7MQP87kKUGrd9GkznCF0BQTR3zQasxlgg407MdhO6svLyWZOfqc6N/g3kMQvJZNdFhbI1b
 OlM3APRdoOBd/aAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1716419155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=;
 b=NlJx4mwR3v/+64ZICJXtuF36Dupuk5G3omX9aABu8HjIwXsxGa1gTxreU114AX7FSBAWI5
 TMwfhTkUZTu1iDP2c/uwVe20hKDTK6CD6t00KGcBUxfwv5PS3IF+ev6h7NifXQ+uI/cvtN
 T1lTUm2GTQRxGDQHHng6oBseJgWffrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1716419155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPfXVp/tEVsWFQJc+z+Z0QErdbW1K9EWBB3fgBG/hmQ=;
 b=7MQP87kKUGrd9GkznCF0BQTR3zQasxlgg407MdhO6svLyWZOfqc6N/g3kMQvJZNdFhbI1b
 OlM3APRdoOBd/aAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1477E13A6B;
 Wed, 22 May 2024 23:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uYagOlJ6TmYKVQAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 22 May 2024 23:05:54 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <9afebadd-765f-42f3-a80b-366dd749bf48@collabora.com> (Eugen
 Hristev's message of "Wed, 22 May 2024 17:02:53 +0300")
Organization: SUSE
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-4-eugen.hristev@collabora.com>
 <20240510013330.GI1110919@google.com>
 <875xviyb3f.fsf@mailhost.krisman.be>
 <9afebadd-765f-42f3-a80b-366dd749bf48@collabora.com>
Date: Wed, 22 May 2024 19:05:48 -0400
Message-ID: <87ttipqwfn.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; HAS_ORG_HEADER(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > On
 5/13/24
 00:27, Gabriel Krisman Bertazi wrote: >> Eric Biggers <ebiggers@kernel.org>
 writes: >> >>> On Fri, Apr 05, 2024 at 03:13:26PM +0300, Eugen Hristev wrote:
 >> >>>> + if (WARN_ON_ONCE(!fscry [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1s9v28-0007ax-2D
Subject: Re: [f2fs-dev] [PATCH v16 3/9] libfs: Introduce case-insensitive
 string comparison helper
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
 Eric Biggers <ebiggers@kernel.org>, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> On 5/13/24 00:27, Gabriel Krisman Bertazi wrote:
>> Eric Biggers <ebiggers@kernel.org> writes:
>> 
>>> On Fri, Apr 05, 2024 at 03:13:26PM +0300, Eugen Hristev wrote:
>> 
>>>> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
>>>> +			return -EINVAL;
>>>> +
>>>> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
>>>> +		if (!decrypted_name.name)
>>>> +			return -ENOMEM;
>>>> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
>>>> +						&decrypted_name);
>>>> +		if (res < 0)
>>>> +			goto out;
>>>
>>> If fscrypt_fname_disk_to_usr() returns an error and !sb_has_strict_encoding(sb),
>>> then this function returns 0 (indicating no match) instead of the error code
>>> (indicating an error).  Is that the correct behavior?  I would think that
>>> strict_encoding should only have an effect on the actual name
>>> comparison.
>> 
>> No. we *want* this return code to be propagated back to f2fs.  In ext4 it
>> wouldn't matter since the error is not visible outside of ext4_match,
>> but f2fs does the right thing and stops the lookup.
>
> In the previous version which I sent, you told me that the error should be
> propagated only in strict_mode, and if !strict_mode, it should just return no match.
> Originally I did not understand that this should be done only for utf8_strncasecmp
> errors, and not for all the errors. I will change it here to fix that.

Yes, it depends on which error we are talking about. For ENOMEM and
whatever error fscrypt_fname_disk_to_usr returns, we surely want to send
that back, such that f2fs can handle it (i.e abort the lookup).  Unicode
casefolding errors don't need to stop the lookup.


>> Thinking about it, there is a second problem with this series.
>> Currently, if we are on strict_mode, f2fs_match_ci_name does not
>> propagate unicode errors back to f2fs. So, once a utf8 invalid sequence
>> is found during lookup, it will be considered not-a-match but the lookup
>> will continue.  This allows some lookups to succeed even in a corrupted
>> directory.  With this patch, we will abort the lookup on the first
>> error, breaking existing semantics.  Note that these are different from
>> memory allocation failure and fscrypt_fname_disk_to_usr. For those, it
>> makes sense to abort.
>
> So , in the case of f2fs , we must not propagate utf8 errors ? It should just
> return no match even in strict mode ?
> If this helper is common for both f2fs and ext4, we have to do the same for ext4 ?
> Or we are no longer able to commonize the code altogether ?

We can have a common handler.  It doesn't matter for Ext4 because it
ignores all errors. Perhaps ext4 can be improved too in a different
patchset.

>> My suggestion would be to keep the current behavior.  Make
>> generic_ci_match only propagate non-unicode related errors back to the
>> filesystem.  This means that we need to move the error messages in patch
>> 6 and 7 into this function, so they only trigger when utf8_strncasecmp*
>> itself fails.
>> 
>
> So basically unicode errors stop here, and print the error message here in that case.
> Am I understanding it correctly ?

Yes, that is it.  print the error message - only in strict mode - and
return not-a-match.

Is there any problem with this approach that I'm missing?

>>>> +	/*
>>>> +	 * Attempt a case-sensitive match first. It is cheaper and
>>>> +	 * should cover most lookups, including all the sane
>>>> +	 * applications that expect a case-sensitive filesystem.
>>>> +	 */
>>>> +	if (folded_name->name) {
>>>> +		if (dirent.len == folded_name->len &&
>>>> +		    !memcmp(folded_name->name, dirent.name, dirent.len))
>>>> +			goto out;
>>>> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
>>>
>>> Shouldn't the memcmp be done with the original user-specified name, not the
>>> casefolded name?  I would think that the user-specified name is the one that's
>>> more likely to match the on-disk name, because of case preservation.  In most
>>> cases users will specify the same case on both file creation and later access.
>> 
>> Yes.
>> 
> so the utf8_strncasecmp_folded call here must use name->name instead of folded_name ?

No, utf8_strncasecmp_folded requires a casefolded name.  Eric's point is
that the *memcmp* should always compare against name->name since it's more
likely to match the name on disk than the folded version because the user
is probably doing a case-exact lookup.

This also means the memcmp can be moved outside the "if (folded_name->name)",
simplifying the patch!

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

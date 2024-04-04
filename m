Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DB8991C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Apr 2024 01:05:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsW9B-0008TR-Ju;
	Thu, 04 Apr 2024 23:05:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rsW99-0008TG-SU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 23:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=; b=gTKVbzBVrdQ0LQ/RNALL8coZTO
 Xb/kYdqjHwCe/LqRM+m10r7OsE8r3dCdlOOK+zVZrchdCG5Sl4UHNvW+rZxUtqeq4qB5734sZh7E3
 CCWs7ohjB5AAFLWtcqjv/N0cDZS/DymKkosY30Lt+YsVP1WZXEar4z8MA6AMbpK80iOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=; b=Vaz58m01iDL/lj5/cSUZ8Af6wc
 O1BCXJU/qsI8y1LDbABEeWGBnHbm4JuZ1FCUxsK4Agn9JXA0Ou+jxn9rbzZvOE38VX5E5UiRXe304
 ZW7gISU8DJtr4deeS2AZMZI2VDCV/8ug1LdVj+h7rRL55nKk8IstrnIi02/gbZzNmG5o=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rsW96-0006O5-DQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 23:05:28 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D2011F456;
 Thu,  4 Apr 2024 23:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712271913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=;
 b=Bcky6LVOBlzfTS5gWcWJtwJoeaVRF90KYZbI6vpJ8CCT6ir5JPTKTwDJyWdiHbZz/AJWfe
 7lfOEV+kOTlohOmZP9kox8debfyLNarmyf6IjLrEYaohaJxXViW/5kmKz4X25+3fY5xzP2
 Gajbvsr4Sp/EM9pRbA3XUSKL0Snpll0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712271913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=;
 b=0e/jlncXZbZB5g91s3iKziBK5JWfQTxctQIKX14WlY1m7nd4/hgKhFOUyeN3yVJ6C5K/dN
 bSP1nK3RbXXE/iBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712271912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=;
 b=CcbL799tKj3KExxNjYWMJZnMhI7aNJaApzcwMuzj6pe5Lfc3RrWTSYvrgOaU9jYw2hvGMB
 Ec/U5HZ9zU4KmsF8HTXAT6J3aI+xLBkfsih5ZFg0/8A8DG6w2pk4HvwC/rWPagu3RO3o7y
 RFSwlYH3rXU32IcPH05Lg7fJ55k78R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712271912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VE3ztJCG2vuXZkOYNMILtCyLk93dzgPNmKlKaF1EYA=;
 b=TN73Rs8EamcWeu9yssAmGKbtBok/WbaXA9BgRNDFMilXw3WQ+E6MN86mAkGQXPQ7Cbr6cl
 3KFzZaJo/fEknkCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B0A5B139E8;
 Thu,  4 Apr 2024 23:05:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mA7jHicyD2YpIgAAn2gu4w
 (envelope-from <krisman@suse.de>); Thu, 04 Apr 2024 23:05:11 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <e6d1ad0b-719a-4693-bd34-bea3cf6e4fa2@collabora.com> (Eugen
 Hristev's message of "Thu, 4 Apr 2024 17:50:29 +0300")
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-8-eugen.hristev@collabora.com>
 <20240403042503.GI2576@sol.localdomain>
 <e6d1ad0b-719a-4693-bd34-bea3cf6e4fa2@collabora.com>
Date: Thu, 04 Apr 2024 19:05:10 -0400
Message-ID: <87v84w3f15.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns, suse.de:email, collabora.com:email]
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > On
 4/3/24
 07:25, Eric Biggers wrote: >> On Tue, Apr 02, 2024 at 06:48:40PM +0300, Eugen
 Hristev via Linux-f2fs-devel wrote: >>> If the volume is in strict mode,
 generi c_ci_compare can report a brok [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rsW96-0006O5-DQ
Subject: Re: [f2fs-dev] [PATCH v15 7/9] f2fs: Log error when lookup of
 encoded dentry fails
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> On 4/3/24 07:25, Eric Biggers wrote:
>> On Tue, Apr 02, 2024 at 06:48:40PM +0300, Eugen Hristev via Linux-f2fs-devel wrote:
>>> If the volume is in strict mode, generi c_ci_compare can report a broken
>>> encoding name.  This will not trigger on a bad lookup, which is caught
>>> earlier, only if the actual disk name is bad.
>>>
>>> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
>>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>>> ---
>>>  fs/f2fs/dir.c | 15 ++++++++++-----
>>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>>> index 88b0045d0c4f..64286d80dd30 100644
>>> --- a/fs/f2fs/dir.c
>>> +++ b/fs/f2fs/dir.c
>>> @@ -192,11 +192,16 @@ static inline int f2fs_match_name(const struct inode *dir,
>>>  	struct fscrypt_name f;
>>>  
>>>  #if IS_ENABLED(CONFIG_UNICODE)
>>> -	if (fname->cf_name.name)
>>> -		return generic_ci_match(dir, fname->usr_fname,
>>> -					&fname->cf_name,
>>> -					de_name, de_name_len);
>>> -
>>> +	if (fname->cf_name.name) {
>>> +		int ret = generic_ci_match(dir, fname->usr_fname,
>>> +					   &fname->cf_name,
>>> +					   de_name, de_name_len);
>>> +		if (ret == -EINVAL)
>>> +			f2fs_warn(F2FS_SB(dir->i_sb),
>>> +				"Directory contains filename that is invalid UTF-8");
>>> +
>> 
>> Shouldn't this use f2fs_warn_ratelimited?
>
> f2fs_warn_ratelimited appears to be very new in the kernel,
>
> Krisman do you think you can rebase your for-next on top of latest such that this
> function is available ? I am basing the series on your for-next
> branch.

I try to make unicode/for-next a non-rebase branch, and I don't want to
pollute the tree with an unecessary backmerge.  Instead, why not base
your work on a more recent branch, since it has no dependencies on
anything from unicode/for-next?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E54986D2408
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 17:31:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piGiw-000880-Om;
	Fri, 31 Mar 2023 15:31:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1piGiv-00087u-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 15:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mjlb0/eHfvgS2ZXDdMn4kdD62mILFu+OjmdPhxiyTJU=; b=m7Kz1BR7W55FvOOxo/HIhhgFQo
 H6gcqc1kAlPx2AYC97xpWGWyNeHrh+pLaVlUtV395CxTUT1lpP5s6+YXbXtjq6WsX35hQ2Guf4yrZ
 3B5rDKyRj34nd69ywZ7xJUrcftHJPJY1+nAW0CZdMg8zAz/29q5QYOo8U/2jBpcqcUGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mjlb0/eHfvgS2ZXDdMn4kdD62mILFu+OjmdPhxiyTJU=; b=BPwAnLtuZpH+NSyzUJ8g5DS9r6
 LZVfdyomQCpcSjbcJAgE8x1B5eHUH8eXxDpEPs6Nv1hPsO5gHzlnLxFcNkeWMY9UAKmP9te+tlAdA
 DQIMyM1HePHQjcvinK4dfDIzrVd5OljVT00EKkphhVpeHkkcOMesDxoTQeoi1ZFal8Zs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1piGis-00040X-45 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 15:31:30 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D86C219C6;
 Fri, 31 Mar 2023 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680276676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mjlb0/eHfvgS2ZXDdMn4kdD62mILFu+OjmdPhxiyTJU=;
 b=RRIGNMGk6XvNTiArrMsl+QcESXBJGs9NjtsuoiZC2LuAzOVV+RQqa5rh5aA2pqiT9wuhHO
 /eKtlv46Iov/okzaFBNkqjlowo5qfqoDb9FZno0NVJvTNrYSSSLZ1loy7H463xuedzRcya
 7/VqOltMaqAYn2YSeO3ic/w2iYOmYhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680276676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mjlb0/eHfvgS2ZXDdMn4kdD62mILFu+OjmdPhxiyTJU=;
 b=AYJWCk4OYFBa7u8prX6m7h4FVCbcEypLc/iV6GW7AjiptLQSdX4is1shSP8Hshubtx8riE
 0Sfpm5wwLn8grHCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBC8B133B6;
 Fri, 31 Mar 2023 15:31:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4LwCJMP8JmQMDAAAMHmgww
 (envelope-from <krisman@suse.de>); Fri, 31 Mar 2023 15:31:15 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-4-krisman@collabora.com>
 <20230326044627.GD3390869@ZenIV>
Date: Fri, 31 Mar 2023 12:31:13 -0300
In-Reply-To: <20230326044627.GD3390869@ZenIV> (Al Viro's message of "Sun, 26
 Mar 2023 05:46:27 +0100")
Message-ID: <874jq10wfy.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Al Viro <viro@zeniv.linux.org.uk> writes: > On Wed, Jun 22, 
 2022 at 03:45:59PM -0400, Gabriel Krisman Bertazi wrote: > >> +static inline
 int generic_ci_d_revalidate(struct dentry *dentry, >> + const struct qstr
 *name, >> + unsigned int flags) [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1piGis-00040X-45
Subject: Re: [f2fs-dev] [PATCH 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Wed, Jun 22, 2022 at 03:45:59PM -0400, Gabriel Krisman Bertazi wrote:
>
>> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
>> +					  const struct qstr *name,
>> +					  unsigned int flags)
>> +{
>> +	int is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET);
>> +
>> +	if (d_is_negative(dentry)) {
>> +		const struct dentry *parent = READ_ONCE(dentry->d_parent);
>> +		const struct inode *dir = READ_ONCE(parent->d_inode);
>> +
>> +		if (dir && needs_casefold(dir)) {
>> +			if (!d_is_casefold_lookup(dentry))
>> +				return 0;
>
> 	In which conditions does that happen?

Hi Al,

This can happen right after a case-sensitive directory is converted to
case-insensitive. A previous case-sensitive lookup could have left a
negative dentry in the dcache that we need to reject, because it doesn't
have the same assurance of absence of all-variation of names as a
negative dentry created during a case-insensitive lookup.

>> +			if (is_creation &&
>> +			    (dentry->d_name.len != name->len ||
>> +			     memcmp(dentry->d_name.name, name->name, name->len)))
>> +				return 0;
>> +		}
>> +	}
>> +	return 1;
>> +}
>
> 	Analysis of stability of ->d_name, please.  It's *probably* safe, but
> the details are subtle and IMO should be accompanied by several asserts.
> E.g. "we never get LOOKUP_CREATE in op->intent without O_CREAT in op->open_flag
> for such and such reasons, and we verify that in such and such place"...
>
> 	A part of that would be "the call in lookup_dcache() can only get there
> with non-zero flags when coming from __lookup_hash(), and that has parent locked,
> stabilizing the name; the same goes for the call in __lookup_slow(), with the
> only call chain with possibly non-zero flags is through lookup_slow(), where we
> have the parent locked".  However, lookup_fast() and lookup_open() have the
> flags come from nd->flags, and LOOKUP_CREATE can be found there in several areas.
> I _think_ we are guaranteed the parent locked in all such call chains, but that
> is definitely worth at least a comment.

Thanks for the example of the analysis what you are looking for here.
That will help me quite a bit.  I wrote this code a while ago and I
don't recall the exact details.  I will go through the code again and
send a new version with the detailed analysis.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

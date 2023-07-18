Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC675859A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 21:34:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLqSk-00083C-DY;
	Tue, 18 Jul 2023 19:34:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qLqSj-000836-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 19:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfRfgiokLRl5nqf7y5XFPbUJv0GuTL/H7C55bO7v3R4=; b=WHu7urxmFSirDTFUcAz424T3tY
 ZpgfwmPsAcV8R49ZZoyeJXyAykGA4z6/YjbLN7INU164DQAp4Khujb4X0m/sKVqBOUZBhVWZlurLV
 tmgdvy+uE1fpbiOzK6Lj2jwJ/E13BFqSj4wDV7sveTOoVjADHDMWkv4nxX1nhCiBRSwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nfRfgiokLRl5nqf7y5XFPbUJv0GuTL/H7C55bO7v3R4=; b=E02NrAbqyrbTEZPMkc1XRvMPA0
 Cy82Ta3GmU3b91J0irSiPvItplMauADeuucGiBZqTOw34FpbcJt3ebD/MM5EDgAk7W2hL88rS+eSK
 1ysaYtl/uDRAR2Eg6tmdLoidPuoKyayE5c8AbKJSQfXk+f7WorSGM7xWJIZfIzSiMapo=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qLqSi-00CBX8-R2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 19:34:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 912B521228;
 Tue, 18 Jul 2023 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689708854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfRfgiokLRl5nqf7y5XFPbUJv0GuTL/H7C55bO7v3R4=;
 b=cDrfz3Bxd3Nd94VFgL2JVO8njdKs183T68KwWa+HKUDHdGI4+lryOaPHUxSmejrApiOfr0
 D/uaaLm82JxebaF1tnpXJdSInbh1FTMQsm7swQhggH66EAFEjvbzcBfkZ2xbh2zmJNftVM
 4GEhE7V8Pw/YWR6lp0cAzGw+1yJPuSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689708854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfRfgiokLRl5nqf7y5XFPbUJv0GuTL/H7C55bO7v3R4=;
 b=NQiOerI24agrAV49xPs4KDHdoE/FPKXqLjVaD+XVZCNr66B3f73Bp098UjLLk5Z9RLAmVl
 RBcw3XRxPIsiOCAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57904134B0;
 Tue, 18 Jul 2023 19:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fVW6DzbptmQaIgAAMHmgww
 (envelope-from <krisman@suse.de>); Tue, 18 Jul 2023 19:34:14 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-5-krisman@suse.de>
 <20230714053135.GD913@sol.localdomain>
Date: Tue, 18 Jul 2023 15:34:13 -0400
In-Reply-To: <20230714053135.GD913@sol.localdomain> (Eric Biggers's message of
 "Thu, 13 Jul 2023 22:31:35 -0700")
Message-ID: <87h6q1580a.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Apr 21, 
 2023 at 08:03:07PM -0400, Gabriel Krisman Bertazi wrote: >> From: Gabriel
 Krisman Bertazi <krisman@collabora.com> >> >> Preserve the existing behavior
 for encrypted directories, by r [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qLqSi-00CBX8-R2
Subject: Re: [f2fs-dev] [PATCH v2 4/7] libfs: Support revalidation of
 encrypted case-insensitive dentries
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Fri, Apr 21, 2023 at 08:03:07PM -0400, Gabriel Krisman Bertazi wrote:
>> From: Gabriel Krisman Bertazi <krisman@collabora.com>
>> 
>> Preserve the existing behavior for encrypted directories, by rejecting
>> negative dentries of encrypted+casefolded directories.  This allows
>> generic_ci_d_revalidate to be used by filesystems with both features
>> enabled, as long as the directory is either casefolded or encrypted, but
>> not both at the same time.
>> 
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> ---
>>  fs/libfs.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/fs/libfs.c b/fs/libfs.c
>> index f8881e29c5d5..0886044db593 100644
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -1478,6 +1478,9 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
>>  		const struct inode *dir = READ_ONCE(parent->d_inode);
>>  
>>  		if (dir && needs_casefold(dir)) {
>> +			if (IS_ENCRYPTED(dir))
>> +				return 0;
>> +
>
> Why not allow negative dentries in case-insensitive encrypted directories?
> I can't think any reason why it wouldn't just work.

TBH, I'm not familiar with the details of combined encrypted+casefold
support to be confident it works.  This patch preserves the current
behavior of disabling them for encrypted+casefold directories.

I suspect it might require extra work that I'm not focusing on this
patchset.  For instance, what should be the order of
fscrypt_d_revalidate and the checks I'm adding here? Note we will start
creating negative dentries in casefold directories after patch 6/7, so
unless we disable it here, we will start calling fscrypt_d_revalidate
for negative+casefold.

Should I just drop this hunk?  Unless you are confident it works as is, I
prefer to add this support in stages and keep negative dentries of
encrypted+casefold directories disabled for now.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

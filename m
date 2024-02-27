Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D614086A1AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 22:28:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf50H-000275-FG;
	Tue, 27 Feb 2024 21:28:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rf50C-00026v-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 21:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=; b=bDgOns3rxAW1E2s25h7I9uYSMQ
 iq4rpZ81QozIf1MIAPR3N25ME+aDjZzIV7+X/kzDfJlDO8eb28tBdXCAOQwWHwRsZ6BwTnaDir495
 owtYa4WGKGW18KA7HSJHsPwXKyBCLGRkOlGecDwyS4fPOpL8PuigKk7amb5e/lnvShfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=; b=KeWnmOpoSuB1zIKBpjM28Aa5HZ
 wTZlC7QBAnsFjU58YtKZR0qrDlUApvfTZl+zLnrNhghSjjTzj85vmFyGTH4jrkzHb3tbc+9S0HZT3
 0/TxbQb2gvo1k+ZsHwK33WL+jb2PiZyuFQsiOlehZzvSMhf4CuLrZSElR+VPQ1tuOmgQ=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rf508-0003nJ-Cd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 21:28:40 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBE171FD92;
 Tue, 27 Feb 2024 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709069304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=;
 b=l4vBZT7i8u70lV2TrPudoBzr/q0TNxKxaaG3sHE2uANRrCToECWXrI/7+OEbjJXTODGMy8
 fy414AJcAON8u+pE30eQOcUCd4RDl0t43bURTOrtCM3qw7gzXs+WOIjg8vj7nsZiZ3Rygz
 p3BonInGGKqE/iE8pwTZ9LCxSiNCZ6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709069304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=;
 b=zmtl8qHB06Ce+bk6C6JIQwJ2knV4oay5i8p7wz6/mzwXnD4Oa9mJWsRSGQhYnMfgFnbmaq
 +GwNLTAaUOmvLOCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709069304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=;
 b=l4vBZT7i8u70lV2TrPudoBzr/q0TNxKxaaG3sHE2uANRrCToECWXrI/7+OEbjJXTODGMy8
 fy414AJcAON8u+pE30eQOcUCd4RDl0t43bURTOrtCM3qw7gzXs+WOIjg8vj7nsZiZ3Rygz
 p3BonInGGKqE/iE8pwTZ9LCxSiNCZ6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709069304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idN97xqKgdpGpjCD/ggWuEREFt+8JtJCxbC+SceKShg=;
 b=zmtl8qHB06Ce+bk6C6JIQwJ2knV4oay5i8p7wz6/mzwXnD4Oa9mJWsRSGQhYnMfgFnbmaq
 +GwNLTAaUOmvLOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80C0713ABA;
 Tue, 27 Feb 2024 21:28:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MfkhGfhT3mXQHAAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 27 Feb 2024 21:28:24 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20240227063614.GB1126@sol.localdomain> (Eric Biggers's message
 of "Mon, 26 Feb 2024 22:36:14 -0800")
Organization: SUSE
References: <20240221171412.10710-1-krisman@suse.de>
 <20240227063614.GB1126@sol.localdomain>
Date: Tue, 27 Feb 2024 16:28:23 -0500
Message-ID: <87o7c161hk.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l4vBZT7i;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zmtl8qHB
X-Spamd-Result: default: False [-4.81 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,mit.edu,gmail.com,vger.kernel.org,lists.sourceforge.net];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BBE171FD92
X-Spam-Level: 
X-Spam-Score: -4.81
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Wed, Feb 21, 
 2024 at 12:14:02PM -0500,
 Gabriel Krisman Bertazi wrote: >> >> When case-insensitive
 and fscrypt were adapted to work together, we moved the >> code that sets
 the dentry operations f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf508-0003nJ-Cd
Subject: Re: [f2fs-dev] [PATCH v7 00/10] Set casefold/fscrypt dentry
 operations through sb->s_d_op
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

> On Wed, Feb 21, 2024 at 12:14:02PM -0500, Gabriel Krisman Bertazi wrote:
>> 
>> When case-insensitive and fscrypt were adapted to work together, we moved the
>> code that sets the dentry operations for case-insensitive dentries(d_hash and
>> d_compare) to happen from a helper inside ->lookup.  This is because fscrypt
>> wants to set d_revalidate only on some dentries, so it does it only for them in
>> d_revalidate.
>> 
>> But, case-insensitive hooks are actually set on all dentries in the filesystem,
>> so the natural place to do it is through s_d_op and let d_alloc handle it [1].
>> In addition, doing it inside the ->lookup is a problem for case-insensitive
>> dentries that are not created through ->lookup, like those coming
>> open-by-fhandle[2], which will not see the required d_ops.
>> 
>> This patchset therefore reverts to using sb->s_d_op to set the dentry operations
>> for case-insensitive filesystems.  In order to set case-insensitive hooks early
>> and not require every dentry to have d_revalidate in case-insensitive
>> filesystems, it introduces a patch suggested by Al Viro to disable d_revalidate
>> on some dentries on the fly.
>> 
>> It survives fstests encrypt and quick groups without regressions.  Based on
>> v6.7-rc1.
>> 
>> [1] https://lore.kernel.org/linux-fsdevel/20231123195327.GP38156@ZenIV/
>> [2] https://lore.kernel.org/linux-fsdevel/20231123171255.GN38156@ZenIV/
>> 
>> Gabriel Krisman Bertazi (10):
>>   ovl: Always reject mounting over case-insensitive directories
>>   fscrypt: Factor out a helper to configure the lookup dentry
>>   fscrypt: Drop d_revalidate for valid dentries during lookup
>>   fscrypt: Drop d_revalidate once the key is added
>>   libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>>   libfs: Add helper to choose dentry operations at mount-time
>>   ext4: Configure dentry operations at dentry-creation time
>>   f2fs: Configure dentry operations at dentry-creation time
>>   ubifs: Configure dentry operations at dentry-creation time
>>   libfs: Drop generic_set_encrypted_ci_d_ops
>> 
>>  fs/crypto/hooks.c       | 15 ++++------
>>  fs/ext4/namei.c         |  1 -
>>  fs/ext4/super.c         |  1 +
>>  fs/f2fs/namei.c         |  1 -
>>  fs/f2fs/super.c         |  1 +
>>  fs/libfs.c              | 62 +++++++++++---------------------------
>>  fs/overlayfs/params.c   | 14 +++++++--
>>  fs/ubifs/dir.c          |  1 -
>>  fs/ubifs/super.c        |  1 +
>>  include/linux/fs.h      | 11 ++++++-
>>  include/linux/fscrypt.h | 66 ++++++++++++++++++++++++++++++++++++-----
>>  11 files changed, 105 insertions(+), 69 deletions(-)
>> 
>
> Looks good,
>
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Thank you for you reviews, Eric. I really appreciate them.

Since this been on the list for a while, I pushed it to get some
linux-next testing and, should nothing arise or no one else comments,
will get to Linus soon.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

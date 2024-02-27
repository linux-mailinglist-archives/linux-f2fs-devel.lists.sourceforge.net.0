Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7DE86A3F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 00:49:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf7CC-0003QZ-AH;
	Tue, 27 Feb 2024 23:49:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rf7CA-0003QQ-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 23:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=; b=Zjkam2aKjCvyo720i6DZeO9/uZ
 9SBvivcXTPgPmAOEUU+wxYP6ADTZv1RITjFYOYfnhzryRMvDzNxx92GoeQLyP7adsxm3prGJEFwBF
 RKOBWt88BgbSx7teTNBBeXF71W+n/ZHVN37CzeZ4PUyKJm9aDGCKhkFRbgfOp0RHWywo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=; b=ZFJU1n/JeexW5eyh/F6m+SFgOM
 Ob8ndo4l21QyJ01bFftAz729gpT9C8StqYnm41h/6rMemLmoXx99i8dzI/bQAuAOSxH0nOG9cMFY5
 wBnZjsYDRX4ZbHffIY0lExKhrkmwaBhSCd/2JYrLiUvAF27JW+mv9uCKPRXIapdpMCyA=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rf7C9-00020b-Jl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 23:49:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10AB72280F;
 Tue, 27 Feb 2024 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709077738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=;
 b=KK8acMoUR0AjvMtcekxBOz3P1kONZ68wdHPOpT25umpGKSP/8GQU+w7zr45xgr5Aa2Jrqs
 ZibILliWKdwCWqzrtN8Wjgd4BFFCi4qE6i3sQdXY5O2qmHFfAEJ2AWatTKNY+4sjkP4YYI
 tvBE63uXD2AOc+kAksuf1/s8f16bvlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709077738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=;
 b=2cN0mEgyIxHnuVoRqLmvobEJxkpbPFxvJ5MoFqUajy4zDFLuRS94mXa4yKKdoYr6a34nNn
 KgckqqnWIC1WBKAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709077738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=;
 b=KK8acMoUR0AjvMtcekxBOz3P1kONZ68wdHPOpT25umpGKSP/8GQU+w7zr45xgr5Aa2Jrqs
 ZibILliWKdwCWqzrtN8Wjgd4BFFCi4qE6i3sQdXY5O2qmHFfAEJ2AWatTKNY+4sjkP4YYI
 tvBE63uXD2AOc+kAksuf1/s8f16bvlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709077738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M15oWz8K/quZkZ3iAaKhipWnksYJwmCDDGkA7L4LZ0E=;
 b=2cN0mEgyIxHnuVoRqLmvobEJxkpbPFxvJ5MoFqUajy4zDFLuRS94mXa4yKKdoYr6a34nNn
 KgckqqnWIC1WBKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE61113ABA;
 Tue, 27 Feb 2024 23:48:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xBoaKOl03mVJOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Tue, 27 Feb 2024 23:48:57 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240220085235.71132-1-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Tue, 20 Feb 2024 10:52:27 +0200")
Organization: SUSE
References: <20240220085235.71132-1-eugen.hristev@collabora.com>
Date: Tue, 27 Feb 2024 18:48:56 -0500
Message-ID: <87r0gx4gev.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[14];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eugen Hristev <eugen.hristev@collabora.com> writes: > Hello, 
 > > I am trying to respin the series here : >
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 This has a reviewed-by tag from Eric, but since its been years and we've
 been going through more changes now, I'd ask you to drop the r-b until Eric
 has had a chance to review it and give a new tag. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf7C9-00020b-Jl
Subject: Re: [f2fs-dev] [PATCH v12 0/8] Cache insensitive cleanup for
 ext4/f2fs
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

> Hello,
>
> I am trying to respin the series here :
> https://www.spinics.net/lists/linux-ext4/msg85081.html

This has a reviewed-by tag from Eric, but since its been years and we've
been going through more changes now, I'd ask you to drop the r-b until
Eric has had a chance to review it and give a new tag.

Thanks,

> I resent some of the v9 patches and got some reviews from Gabriel,
> I did changes as requested and here is v12.
>
> Changes in v12:
> - revert to v10 comparison with propagating the error code from utf comparison
>
> Changes in v11:
> - revert to the original v9 implementation for the comparison helper.
>
> Changes in v10:
> - reworked a bit the comparison helper to improve performance by
> first performing the exact lookup.
>
>
> * Original commit letter
>
> The case-insensitive implementations in f2fs and ext4 have quite a bit
> of duplicated code.  This series simplifies the ext4 version, with the
> goal of extracting ext4_ci_compare into a helper library that can be
> used by both filesystems.  It also reduces the clutter from many
> codeguards for CONFIG_UNICODE; as requested by Linus, they are part of
> the codeflow now.
>
> While there, I noticed we can leverage the utf8 functions to detect
> encoded names that are corrupted in the filesystem. Therefore, it also
> adds an ext4 error on that scenario, to mark the filesystem as
> corrupted.
>
> This series survived passes of xfstests -g quick.
>
>
> Gabriel Krisman Bertazi (8):
>   ext4: Simplify the handling of cached insensitive names
>   f2fs: Simplify the handling of cached insensitive names
>   libfs: Introduce case-insensitive string comparison helper
>   ext4: Reuse generic_ci_match for ci comparisons
>   f2fs: Reuse generic_ci_match for ci comparisons
>   ext4: Log error when lookup of encoded dentry fails
>   ext4: Move CONFIG_UNICODE defguards into the code flow
>   f2fs: Move CONFIG_UNICODE defguards into the code flow
>
>  fs/ext4/crypto.c   |  19 ++-----
>  fs/ext4/ext4.h     |  35 +++++++-----
>  fs/ext4/namei.c    | 129 ++++++++++++++++-----------------------------
>  fs/ext4/super.c    |   4 +-
>  fs/f2fs/dir.c      | 105 +++++++++++-------------------------
>  fs/f2fs/f2fs.h     |  17 +++++-
>  fs/f2fs/namei.c    |  10 ++--
>  fs/f2fs/recovery.c |   5 +-
>  fs/f2fs/super.c    |   8 +--
>  fs/libfs.c         |  85 +++++++++++++++++++++++++++++
>  include/linux/fs.h |   4 ++
>  11 files changed, 216 insertions(+), 205 deletions(-)

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

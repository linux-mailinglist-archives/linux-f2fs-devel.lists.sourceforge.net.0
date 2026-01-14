Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E8ED20BBF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 19:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFI+NV6jQvNr15KSjmveRJlFcI112iAIy8WZmc2kQ7A=; b=L/fkegtXcsUR/UAluCywlGvPAH
	3OnWOXjsCYTbEgcK7htvPVauQ0EopOWBQGgNLL82zWr8UlS/pXkouUp/ufR+waXG+g9zgKJyQjDcR
	7Ijz12fuxAtV5V9HV8JuIsjvDYi4TB+goNwIqnFFN1g31WyxAeWppXj4NL8zlAQMwWkM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg5Lj-0004OW-E4;
	Wed, 14 Jan 2026 18:12:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vg5Ld-0004OM-Ay
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 18:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=; b=FRtQL9xv7rWNPaugg1zUPwpkF4
 ZlO2GNGFG9YNhst1Y5YVBAF3QDW0A2SQMZBgyaQfSEvpg60iumTTXSR9nA0fYppkQd9ztALm0YrS/
 uCJ80W2NNCIBEJSsIJuFbPiQ5eLe2AvOSRnCAI+6aEPOLWbnMN/MUqsRYn8+idMXnLZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=; b=iciQ0+p3W+RrD73T74swfp5ynL
 xFqiBgJqymn0dOYaaQBlERN5v4S9N/M3fC73DCMHG2ExIwd527TulkodjB+RtQjLEhVNHGB7IW6Rv
 s5f9mu7bd1vNR8Q6qFhhmbXoWZDbc2Lpg2wW97K6tRtuf6r2JV7XFL/faThTY+R15VtM=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vg5Lc-0002z8-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 18:12:01 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEBCD34A19;
 Wed, 14 Jan 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768414314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=;
 b=iS7tUH/YOVxSh4z+OZrakGrtN6XHw3nBLnAxQyGHRRcDkM9IJTXs0s5ERNzTD6pyF+L0bH
 uSwLh8J0cyq2Y3TKi3vc81qxNL+XqtOL8oOo9PESeiRBI5D2uoB2rm2OYnKgIMquzPTPku
 viZbKCQe/6B8VMRSLiKTNd7yHPf761I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768414314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=;
 b=MR0/rtm67S7zK5Gaw2gaKMuuUuFkv6QZraFcDAoZA5Iyg3WJ+BCDish25xa0np61mTVPhT
 gt/CmQlc/UXyiXCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768414313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=;
 b=OZSxcWIVOJ/2w7sK+y/z5zIQ4PTncZsxIyA7Z1YcAx5jHdw5b0w73Z9rstYZxjhVWtpkZx
 VXES6xbnfRccGtJbARuNNvoDgBEVKRgwZfHU/f3cndhwktoKlpInCRciG6TCeECY1YavoG
 2QPdcHpY+IXIAb7NOF4NqZYhpJWFkbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768414313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xo9ryw1mNS44QarmajvRPRZ+yW3faNEvj358UoC9dhs=;
 b=Y7oOVPk11qf+qOKc4Tcuncg8zBkZeMC3EpyXNrm5aqSn07P/vM7bNZOq0IlEYcRShrW60k
 GHs2RrDmzRIu7tCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBFCA3EA63;
 Wed, 14 Jan 2026 18:11:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LB0CNWncZ2nsLwAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 14 Jan 2026 18:11:53 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 982DAA0BFB; Wed, 14 Jan 2026 19:11:49 +0100 (CET)
Date: Wed, 14 Jan 2026 19:11:49 +0100
From: Jan Kara <jack@suse.cz>
To: Chuck Lever <cel@kernel.org>
Message-ID: <3kq2tbdcoxxw3y2gseg7vtnhnze5ee536fu4rnsn22yjrpsmb4@fpfueqqiji5q>
References: <20260114142900.3945054-1-cel@kernel.org>
 <20260114142900.3945054-2-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114142900.3945054-2-cel@kernel.org>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[32];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RLmzfjx67n53eyz9asjm8u3pcw)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[imap.suse.de,kernel.org,suse.cz,vger.kernel.org,lists.sourceforge.net,mail.parknet.co.jp,samsung.com,sony.com,paragon-software.com,dubeyko.com,physik.fu-berlin.de,vivo.com,mit.edu,dilger.ca,samba.org,manguebit.org,gmail.com,microsoft.com,chromium.org,oracle.com];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 14-01-26 09:28:44, Chuck Lever wrote: > From: Chuck
 Lever <chuck.lever@oracle.com> > > Enable upper layers such as NFSD to
 retrieve
 case sensitivity > information from file systems by adding ca [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vg5Lc-0002z8-I4
Subject: Re: [f2fs-dev] [PATCH v4 01/16] fs: Add case sensitivity info to
 file_kattr
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
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, vira@imap.suse.de, linux-cifs@vger.kernel.org,
 sfrench@samba.org, slava@dubeyko.com, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 14-01-26 09:28:44, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Enable upper layers such as NFSD to retrieve case sensitivity
> information from file systems by adding case_insensitive and
> case_nonpreserving boolean fields to struct file_kattr.
> 
> These fields default to false (POSIX semantics: case-sensitive and
> case-preserving), allowing filesystems to set them only when
> behavior differs from the default.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
...
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 66ca526cf786..07286d34b48b 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -229,10 +229,20 @@ struct file_attr {
>  	__u32 fa_nextents;	/* nextents field value (get)   */
>  	__u32 fa_projid;	/* project identifier (get/set) */
>  	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
> +	/* VER1 additions: */
> +	__u32 fa_case_behavior;	/* case sensitivity (get) */
> +	__u32 fa_reserved;
>  };
>  
>  #define FILE_ATTR_SIZE_VER0 24
> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> +#define FILE_ATTR_SIZE_VER1 32
> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
> +
> +/*
> + * Case sensitivity flags for fa_case_behavior
> + */
> +#define FS_CASE_INSENSITIVE	0x00000001	/* case-insensitive lookups */
> +#define FS_CASE_NONPRESERVING	0x00000002	/* case not preserved */

This is a matter of taste so not sure what others think about it but
file_attr already have fa_xflags field and there is already one flag which
doesn't directly correspond to on-disk representation (FS_XFLAG_HASATTR) so
we could also put the two new flags in there... I have hard time imagining
fa_case_behavior would grow past the two flags you've introduced so u32
seems a bit wasteful.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

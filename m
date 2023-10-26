Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCF7D8694
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 18:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qw32g-0004jC-Ea;
	Thu, 26 Oct 2023 16:17:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qw32e-0004j0-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 16:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nYTH4yMZVdBwlSKfLNE9uAE6AYye0KxaGq9YcrI3ijE=; b=Tx53FqBj1qsvWLf3IjKdwJoIhm
 QVHajpCvFpSPIxnlKeHbFvSP8l7Fbly4x01e9a4niLNjY8zQ/APoJza63FG+nuHwJo3V5mrxWxyEP
 D8Q3q32b/8ZCy78DOtHQ3DWfhYbsY7vjsI/1R40kAmtJOnROYj6VoF0SUXk1hkSKoSC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nYTH4yMZVdBwlSKfLNE9uAE6AYye0KxaGq9YcrI3ijE=; b=JVWQ2zHBR06Q0/JjR6Q4+GLEds
 wTmKGwBNKMBaEsmsWFsvxElrGHMGWx6vB9eSj6cVJgld320Wgstcghg8owsG4pE/+Oaf4fqIIuLm0
 gu7cHAvJrsLqlc5aMh2vcYXe28mMba76sSX6VtanMrDmIOOjzOvmIMmxbJQKq+wm3fxI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qw32b-00AC38-VY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 16:17:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 078BB1FE7C;
 Thu, 26 Oct 2023 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698337014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYTH4yMZVdBwlSKfLNE9uAE6AYye0KxaGq9YcrI3ijE=;
 b=mjGpmaPE8Pne25tpBgqvZoZhai8dsOtiaqr7gXU06UGu0EPDj/FWu9LWFitzK/GLTSgRev
 akjvvKa7DvMSFvEQip+ojV+Agb55QgP5ZGGKcbKSS8TX7sq5yGEckYpWQjlvlu1sCu5s/W
 cFpUC36GkjikNzBIQR8mjU1ZP5Vc9k4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698337014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYTH4yMZVdBwlSKfLNE9uAE6AYye0KxaGq9YcrI3ijE=;
 b=HNlmgScqjnr3H3SAqT3Kwed6C7Nci43fz24iL7EimY0nvJMIaQrLvDZj+UJabfbcYmoyyd
 /cZiu4CIBXAiXzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECC28133F5;
 Thu, 26 Oct 2023 16:16:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mgy5OfWQOmWcEwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 26 Oct 2023 16:16:53 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 59630A05BC; Thu, 26 Oct 2023 18:16:53 +0200 (CEST)
Date: Thu, 26 Oct 2023 18:16:53 +0200
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20231026161653.cunh4ojohq6mw2ye@quack3>
References: <20231011203412.GA85476@ZenIV>
 <CAHk-=wjSbompMCgMwR2-MB59QDB+OZ7Ohp878QoDc9o7z4pbNg@mail.gmail.com>
 <20231011215138.GX800259@ZenIV> <20231011230105.GA92231@ZenIV>
 <CAHfrynNbfPtAjY4Y7N0cyWyH35dyF_BcpfR58ASCCC7=-TfSFw@mail.gmail.com>
 <20231012050209.GY800259@ZenIV>
 <20231012103157.mmn6sv4e6hfrqkai@quack3>
 <20231012145758.yopnkhijksae5akp@quack3>
 <20231012191551.GZ800259@ZenIV> <20231017055040.GN800259@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017055040.GN800259@ZenIV>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Chao, any comment on this? It really looks like a
 filesystem corruption issue in f2fs when whiteouts are used... Honza On Tue
 17-10-23 06:50:40, Al Viro wrote: > [f2fs folks Cc'd] > > There's something
 very odd in f2fs_rename(); > this: > f2fs_down_write(&F2FS_I(old_inode)->i_sem);
 > if (!old_dir_entry || whiteout) > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qw32b-00AC38-VY
Subject: Re: [f2fs-dev] [RFC] weirdness in f2fs_rename() with RENAME_WHITEOUT
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, Chao, any comment on this? It really looks like a filesystem
corruption issue in f2fs when whiteouts are used...

								Honza

On Tue 17-10-23 06:50:40, Al Viro wrote:
> [f2fs folks Cc'd]
> 
> 	There's something very odd in f2fs_rename();
> this:
>         f2fs_down_write(&F2FS_I(old_inode)->i_sem);
>         if (!old_dir_entry || whiteout)
>                 file_lost_pino(old_inode);
>         else   
>                 /* adjust dir's i_pino to pass fsck check */
>                 f2fs_i_pino_write(old_inode, new_dir->i_ino);
>         f2fs_up_write(&F2FS_I(old_inode)->i_sem);
> and this:
>                 if (old_dir != new_dir && !whiteout)
>                         f2fs_set_link(old_inode, old_dir_entry,
>                                                 old_dir_page, new_dir);
>                 else
>                         f2fs_put_page(old_dir_page, 0);
> The latter really stinks, especially considering
> struct dentry *f2fs_get_parent(struct dentry *child)
> {
>         struct page *page;
>         unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &page);
> 
>         if (!ino) {
>                 if (IS_ERR(page))
>                         return ERR_CAST(page);
>                 return ERR_PTR(-ENOENT);
>         }
>         return d_obtain_alias(f2fs_iget(child->d_sb, ino));
> }
> 
> You want correct inumber in the ".." link.  And cross-directory
> rename does move the source to new parent, even if you'd been asked
> to leave a whiteout in the old place.
> 
> Why is that stuff conditional on whiteout?  AFAICS, that went into the
> tree in the same commit that added RENAME_WHITEOUT support on f2fs,
> mentioning "For now, we just try to follow the way that xfs/ext4 use"
> in commit message.  But ext4 does *NOT* do anything of that sort -
> at the time of that commit the relevant piece had been
>         if (old.dir_bh) {
> 		retval = ext4_rename_dir_finish(handle, &old, new.dir->i_ino);
> and old.dir_bh is set by
>                 retval = ext4_rename_dir_prepare(handle, &old);
> a few lines prior, which is not conditional upon the whiteout.
> 
> What am I missing there?
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

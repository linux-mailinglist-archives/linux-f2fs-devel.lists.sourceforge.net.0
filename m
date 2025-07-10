Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B191B002ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 15:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZZEjkml/eEldGm6jb47XUlvbSyvnGxY7urWFfkN2qk=; b=OMZeE4QBAVqSzgMM0bTiSUXSmy
	xUvfXDGX+ib16Yl6AU38igUMxlpscd+Xq5ih0MJD94UerlX6palVADYe+o/3ZaMNFjtKbUE7l9AHK
	3PAoNuCukGnK66UEvw3JJC5eTtknqlXQYwYzCQ3AKD7SLCPcivGiiLGwx1LxQ8Dk4oI4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZr2Y-0006Rc-U0;
	Thu, 10 Jul 2025 13:10:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uZr2X-0006RT-2D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 13:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=; b=hkqw0xLocaLucF9qzIuskWgmSr
 sWNV0SbNHT8g503DIlT6utOz1MTg7iLLINmKRTNnscf7iQMv/Iqm0gjp2u31XgHfPRpq6WV8z4hLc
 FRngfsem2spO7OWQoMw7E6SiP+yGsJceV4c/FJjFOgM92tr3p+wL6VaS0K6l3BnjODYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=; b=c2Cyl8y9awyjfJx9XCPexGRqnz
 EPZHaTwYmlCwQY/dMHT4m0Dm9vHUPtCvQs9DcKcYJQ4cVz4M6bf8BFa8wJi+Cjlyao/k0jh/vK9Fx
 Q/vXM0meruQgzJTGlHtjaV8OcBVSFcQQ6CHaEV4K2UmRa54IhYX8MVTJ4SbJFOkp/kf0=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uZr2W-0004rp-FZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 13:10:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C424121175;
 Thu, 10 Jul 2025 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752153009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=;
 b=eD+Hvn7ZLTFWMgSHZCTGec0Q2nrnVMxsDS60BVl3tkuQTfzJX6NKCouIsq0gvJDK5qTDZm
 hzfec7UPwkOq03Rut0QrPDclglmvIM1JlhtM+PxiclYYwxAnSAPEvXEWYUJdRbQtjYpCYQ
 8VUrnp1QnIyaTXxt0OXdlTD8PNxA2uk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752153009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=;
 b=mJOuKh4P+rH23nX5Slq2qnqcl4aZaxTkud0cBp7E7uk23R/O5aN339AWOIzgj4zkFjKs2B
 4txzG5FZizrEKTAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AE8gmRXK;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2iNx+RTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752153008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=;
 b=AE8gmRXK97XQg+ako5dNJ/Am6nwNeQMZiPTHlyWjH6cESCeSKiwH9t1kre4nAFCpWAP8S4
 X23Nw3M+4bpMfjDKqHk1AczAhxCwLZuqoN5T3BnMmOR7hvNlofMWFvsVTkFNTlJxST/7BT
 vCIRTWq9DcbaVWNDvbLNERrcO2tWf9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752153008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zyJYnzTWJud5qEGhrZj76b5jt76YQEEA8Xla8XnWYCI=;
 b=2iNx+RTILnuNSLzwrBa6OKoCkNZ1ZxkYVIT/m5OgKQDqKVYd6EnQ0dRySRNKTdE2+gYWyd
 /d5t9pC4FFZl+wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6119136CB;
 Thu, 10 Jul 2025 13:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id esQeLLC7b2jGGQAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 10 Jul 2025 13:10:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5A12EA098F; Thu, 10 Jul 2025 15:10:04 +0200 (CEST)
Date: Thu, 10 Jul 2025 15:10:04 +0200
From: Jan Kara <jack@suse.cz>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <kgolzhhd47x3iqkdrwyzh65ng4mm6cauxdjgiao2otztncyc3f@rskadwaph2l5>
References: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
 <y2rpp6u6pksjrzgxsn5rtcsl2vspffkcbtu6tfzgo7thn7g23p@7quhaixfx5yh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <y2rpp6u6pksjrzgxsn5rtcsl2vspffkcbtu6tfzgo7thn7g23p@7quhaixfx5yh>
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmx.com]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_THREE(0.00)[3]; RCVD_TLS_LAST(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[suse.cz,fromorbit.com,kernel.org,gmx.com,suse.com,vger.kernel.org,zeniv.linux.org.uk,lists.sourceforge.net,lists.linux.dev];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C424121175
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 09-07-25 13:49:12, Kent Overstreet wrote: > On Wed,
 Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote: > > > It also avoids the
 problem of ->mark_dead events being generated > > > from a context [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZr2W-0004rp-FZ
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 09-07-25 13:49:12, Kent Overstreet wrote:
> On Wed, Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote:
> > > It also avoids the problem of ->mark_dead events being generated
> > > from a context that holds filesystem/vfs locks and then deadlocking
> > > waiting for those locks to be released.
> > > 
> > > IOWs, a multi-device filesystem should really be implementing
> > > ->mark_dead itself, and should not be depending on being able to
> > > lock the superblock to take an active reference to it.
> > > 
> > > It should be pretty clear that these are not issues that the generic
> > > filesystem ->mark_dead implementation should be trying to
> > > handle.....
> > 
> > Well, IMO every fs implementation needs to do the bdev -> sb transition and
> > make sb somehow stable. It may be that grabbing s_umount and active sb
> > reference is not what everybody wants but AFAIU btrfs as the second
> > multi-device filesystem would be fine with that and for bcachefs this
> > doesn't work only because they have special superblock instantiation
> > behavior on mount for independent reasons (i.e., not because active ref
> > + s_umount would be problematic for them) if I understand Kent right.
> > So I'm still not fully convinced each multi-device filesystem should be
> > shipping their special method to get from device to stable sb reference.
> 
> Honestly, the sync_filesystem() call seems bogus.
> 
> If the block device is truly dead, what's it going to accomplish?

Notice that fs_bdev_mark_dead() calls sync_filesystem() only in case
'surprise' argument is false - meaning this is actually a notification
*before* the device is going away. I.e., graceful device hot unplug when
you can access the device to clean up as much as possible.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

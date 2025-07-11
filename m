Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 491BDB02051
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 17:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQC3W9LfstaNnDZnd2TkzA+QtqiC3Ymny+3wegDo2Bk=; b=bDjbEI0+RzWZOYKf9TBUr7yG3T
	w+UFc9G/D3WLzoch9IbygwKJP5maJOx9zW4f+th7dwPNxUbXPjW4VMR71j9cADa3teffkSET+yZ/z
	pBwXuEq3PE/v7VqkyjEytfnKTVuaSq+Fq8gHUhgDgvhOhzMCAdIS8Urf9NFiGQZvKrqE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaFam-00036U-Md;
	Fri, 11 Jul 2025 15:23:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uaFak-00036J-SV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 15:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=; b=E/0KUisfCDSLMvFA+xtCDJS2hJ
 vZjla80Ek6CL58idsgg1p6hO2kFYA+ajiqYeZFQz+xWrM/Tutv2mtF+mfHUmLs0eNKu3z189K8Oj3
 AdVi32xC9wdjqcV1H/BaJ0agjF3CEeiTiJNIoVms+J9OiuRdUVzzrQAsINo8nTDk/bQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=; b=loyaai4DlmUnNWtiRIgm6ctGKB
 woQjDDiQRV+k5vSENQk6vndRW0xJBkypEYgP2ylbB8hWm3Ihu5cKrtjHpiZolQXE/PivRw6LcWd93
 aD36z2B1Pr+HXlh5BW0s9ouQ7XshomaY91AQXnRlFy0CWPiihh8sfUF8uJ8ATq6pRQqA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uaFak-0002HJ-3V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 15:23:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED3021F451;
 Fri, 11 Jul 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752243630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=;
 b=iX1o9G0tQdGrIsFeduAag1UKYp0cCjcMneL5vkrGGsPO92IZ2wxRp3jlmkahOOPG6WWUdv
 kphrQqTmuCs0hFXOYtVS/MTvH2l2OLesUm41gQ9wmp2cCzNfPFtwMVQvJjSqo+rsQgFnL2
 AMVwa6gD0pvN07DATLyiZYLUdKljBsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752243630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=;
 b=ZczmLcnkQK5dNLlNTg8btwaNoh3cOk1Vp66mW8PYqJOkMEfNWn+8CqQJvQTp6bEmbseXU7
 uZsBkQaJmbIzZ5CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1752243629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=;
 b=0Q0gC33a1LGOhCbS2e7YuGBLzHB9x14F4WpfW+gopjwadYEbCJBLsXBX1lrlouwrAzrte8
 Ja2l7L3cX4rIo5fBm9TI3OIj2eDgYJhQcbpHguaCI/kUbudLCh5yRivfoo+5PhBxoWhjQZ
 cz2QUREuEnRdT0PPcT2EjFDPWJ86WlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1752243629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/iUuBciPB10/GBE/cvyXk+fAHjQFIQzuLxCgcwiNTw=;
 b=zb1CZyGS3J1toAy5quPu7DqexLZJc5vm8joEbFL90hWTmpTZCle3U5zFrK6F+5uIBXY376
 tOkCVn3qxUstlVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9000138A5;
 Fri, 11 Jul 2025 14:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qT+vNK0dcWjEUQAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 11 Jul 2025 14:20:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 57DE8A099A; Fri, 11 Jul 2025 16:20:24 +0200 (CEST)
Date: Fri, 11 Jul 2025 16:20:24 +0200
From: Jan Kara <jack@suse.cz>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <icnwgogkmgui2kzshst23dujkqdghiwpd62giipxyrbdkyf6bo@lf52wyqpnxn2>
References: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
 <y2rpp6u6pksjrzgxsn5rtcsl2vspffkcbtu6tfzgo7thn7g23p@7quhaixfx5yh>
 <kgolzhhd47x3iqkdrwyzh65ng4mm6cauxdjgiao2otztncyc3f@rskadwaph2l5>
 <5xno4s25lsd2sqq6judn7moorgy2h3konejgassnzlccfa6jsf@ez6ciofy3bwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5xno4s25lsd2sqq6judn7moorgy2h3konejgassnzlccfa6jsf@ez6ciofy3bwp>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[15]; RCVD_COUNT_THREE(0.00)[3];
 FREEMAIL_ENVRCPT(0.00)[gmx.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.cz,fromorbit.com,kernel.org,gmx.com,suse.com,vger.kernel.org,zeniv.linux.org.uk,lists.sourceforge.net,lists.linux.dev];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 10-07-25 14:41:18, Kent Overstreet wrote: > On Thu,
 Jul 10, 2025 at 03:10:04PM +0200, Jan Kara wrote: > > On Wed 09-07-25 13:49:12,
 Kent Overstreet wrote: > > > On Wed, Jul 09, 2025 at 07:23:07 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uaFak-0002HJ-3V
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

On Thu 10-07-25 14:41:18, Kent Overstreet wrote:
> On Thu, Jul 10, 2025 at 03:10:04PM +0200, Jan Kara wrote:
> > On Wed 09-07-25 13:49:12, Kent Overstreet wrote:
> > > On Wed, Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote:
> > > > > It also avoids the problem of ->mark_dead events being generated
> > > > > from a context that holds filesystem/vfs locks and then deadlocking
> > > > > waiting for those locks to be released.
> > > > > 
> > > > > IOWs, a multi-device filesystem should really be implementing
> > > > > ->mark_dead itself, and should not be depending on being able to
> > > > > lock the superblock to take an active reference to it.
> > > > > 
> > > > > It should be pretty clear that these are not issues that the generic
> > > > > filesystem ->mark_dead implementation should be trying to
> > > > > handle.....
> > > > 
> > > > Well, IMO every fs implementation needs to do the bdev -> sb transition and
> > > > make sb somehow stable. It may be that grabbing s_umount and active sb
> > > > reference is not what everybody wants but AFAIU btrfs as the second
> > > > multi-device filesystem would be fine with that and for bcachefs this
> > > > doesn't work only because they have special superblock instantiation
> > > > behavior on mount for independent reasons (i.e., not because active ref
> > > > + s_umount would be problematic for them) if I understand Kent right.
> > > > So I'm still not fully convinced each multi-device filesystem should be
> > > > shipping their special method to get from device to stable sb reference.
> > > 
> > > Honestly, the sync_filesystem() call seems bogus.
> > > 
> > > If the block device is truly dead, what's it going to accomplish?
> > 
> > Notice that fs_bdev_mark_dead() calls sync_filesystem() only in case
> > 'surprise' argument is false - meaning this is actually a notification
> > *before* the device is going away. I.e., graceful device hot unplug when
> > you can access the device to clean up as much as possible.
> 
> That doesn't seem to be hooked up to anything?

__del_gendisk()
  if (!test_bit(GD_DEAD, &disk->state))
    blk_report_disk_dead(disk, false);

Is the path which results in "surprise" to be false. I have to admit I
didn't check deeper into drivers whether this is hooked up properly but
del_gendisk() is a standard call to tear down a disk so it would seem so
from the first glance.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

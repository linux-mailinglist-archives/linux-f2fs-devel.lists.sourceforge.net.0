Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24B93F6A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 15:27:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYQPY-0008Pb-HH;
	Mon, 29 Jul 2024 13:27:36 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1sYQPW-0008PS-Ps
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 13:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=; b=WPnxIHIjlJSRNekP1STdpU5tce
 c+FAeskWLssFXOWSJ43OwaHN/31QcfvSwsh2ruFR6hPivbxGFCKk6WxlgvIEXYR/3TLdN+gsBZ9PG
 Q/In7pi69i1iKx5YeJgjF14Que8JrSzys5cL/TRe9N1T4LMhQNWIzlOXlOEhnwOPK5Mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=; b=XrHmhXFJirYFYtvIgwbw8LjlWg
 X6/PB5gnZIp0GPycmOe+lc/zIDOllS+QATECAOWAiO5PvrZdSdq1Hhm4WAPay675sjOSu1C3ansqv
 UgeGi8jKJuESRr+l3YQHkVNMwArtcoKiiAQKDlb6w5lnGbpXPxZujMDfzzyYaadIpxVA=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sYQPV-0007cz-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 13:27:34 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E067F21ABC;
 Mon, 29 Jul 2024 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722259642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=;
 b=GOg+KqteQTiABuMLkONHkkQqDi9CWNISiA42PWBd6tBN1LrzZHYSnJIOgfjuI/F4BrAnu4
 PmOZ6aoddmjs4bM27zUbbRtFpHUHn5cMq9uhCSm65Dwsk0ZvsFi+Eev1dq/rmYXlIg9Dvo
 dKrcoDP66XZMp72xHlxRJ5a2eCGTIyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722259642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=;
 b=mssZc+dWsaDWX6G1Z81Z9mVnCMeQIKDBeeN8GeMNSfkrtAVFPI+0ZsaokUtTgcYSe+PPlR
 VfWK/UPBgxDAnyAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722259641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=;
 b=WuU2gCVpi0VpfhEjlPLAEf8P1ZNDFqSTQUD2Msx0Rz9cU/3rWE6Sm086IHeXzTyLdOi6Oi
 ZxJkmkvR/KeysUT+IF5bJa7yRxNOWjnYwnoCxHI1mqdB8iSMRG5Pg6px732y/ihU0sv1Zl
 kWBur90hgwyvMSgEdnPZ9j8AOa2iAUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722259641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cA0sKnmcbKHN+5poM2Gwzel0FDApKbV56UYCatcL7bE=;
 b=7ekSSZDjkiW5NnN+2hwFDBVRJDLREXGvb8S7MhyadF1e1L/sESkskvzc/MxkGKv5ZEQoir
 iJv7SHaOYS0o5mBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D453D1368A;
 Mon, 29 Jul 2024 13:27:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QJPTM7mYp2aIVQAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 29 Jul 2024 13:27:21 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 79BC1A099C; Mon, 29 Jul 2024 15:27:21 +0200 (CEST)
Date: Mon, 29 Jul 2024 15:27:21 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20240729132721.hxih6ehigadqf7wx@quack3>
References: <0000000000004ff2dc061e281637@google.com>
 <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
X-Spam-Level: *
X-Spamd-Result: default: False [1.90 / 50.00]; SUSPICIOUS_RECIPS(1.50)[];
 URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; REDIRECTOR_URL(0.00)[goo.gl];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; TAGGED_RCPT(0.00)[20d7e439f76bbbd863a7];
 RCPT_COUNT_TWELVE(0.00)[18]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_THREE(0.00)[3];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.com,kernel.org,lists.sourceforge.net,syzkaller.appspotmail.com,redhat.com,gmail.com,sina.com,vger.kernel.org,vivo.com,suse.cz,googlegroups.com,zeniv.linux.org.uk,mit.edu];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,imap1.dmz-prg2.suse.org:helo,syzkaller.appspot.com:url,suse.com:email];
 RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 1.90
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 29-07-24 11:10:09, Christian Brauner wrote: > On Fri, 
 Jul 26, 2024 at 08:23:02AM GMT, syzbot wrote: > > syzbot has bisected this
 issue to: > > > > commit b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYQPV-0007cz-Hq
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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
Cc: Ted Tso <tytso@mit.edu>, Hillf Danton <hdanton@sina.com>,
 Mateusz Guzik <mjguzik@gmail.com>, jack@suse.cz, paulmck@kernel.org,
 frank.li@vivo.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Oleg Nesterov <oleg@redhat.com>,
 syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>,
 rcu@vger.kernel.org, viro@zeniv.linux.org.uk, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 29-07-24 11:10:09, Christian Brauner wrote:
> On Fri, Jul 26, 2024 at 08:23:02AM GMT, syzbot wrote:
> > syzbot has bisected this issue to:
> > 
> > commit b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a5
> > Author: Chao Yu <chao@kernel.org>
> > Date:   Sun Apr 23 15:49:15 2023 +0000
> > 
> >     f2fs: support errors=remount-ro|continue|panic mountoption
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=119745f1980000
> > start commit:   1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=139745f1980000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=159745f1980000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=20d7e439f76bbbd863a7
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1237a1f1980000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115edac9980000
> > 
> > Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
> > Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> Thanks to Paul and Oleg for point me in the right direction and
> explaining that rcu sync warning.
> 
> That patch here is remounting a superblock read-only directly by raising
> SB_RDONLY without the involvement of the VFS at all. That's pretty
> broken and is likely to cause trouble if done wrong. The rough order of
> operations to transition rw->ro usualy include checking that the
> filsystem is unfrozen, and marking all mounts read-only, then calling
> into the filesystem so it can do whatever it wants to do.

Yeah, this way of handling filesystem errors dates back to days when the
world was much simpler :) It has been always a bit of a hack (but when you
try to limit damage from corrupted on-disk data structures, a bit of
hackiness is acceptable) but it is doubly so these days.

> In any case, all of this requires holding sb->s_umount. Not holding
> sb->s_umount will end up confusing freeze_super() (Thanks to Oleg for
> noticing!). When freeze_super() is called on a non-ro filesystem it will
> acquire
> percpu_down_write(SB_FREEZE_WRITE+SB_FREEZE_PAGEFAULT+SB_FREEZE_FS) and
> thaw_super() needs to call
> sb_freeze_unlock(SB_FREEZE_FS+SB_FREEZE_PAGEFAULT+SB_FREEZE_WRITE) but
> because you just raise SB_RDONLY you end up causing thaw_super() to skip
> that step causing the bug in rcu_sync_dtor() to be noticed.

Yeah, good spotting.

> Btw, ext4 has similar logic where it raises SB_RDONLY without checking
> whether the filesystem is frozen.
> 
> So I guess, this is technically ok as long as that emergency SB_RDONLY raising
> in sb->s_flags is not done while the fs is already frozen. I think ext4 can
> probably never do that. Jan?

You'd wish (or maybe I'd wish ;) No, ext4 can hit it in the same way f2fs
can. All it takes is for ext4 to hit some metadata corruption on read from
disk while the filesystem is frozen.

> My guess is that something in f2fs can end up raising SB_RDONLY after
> the filesystem is frozen and so it causes this bug. I suspect this is coming
> from the gc_thread() which might issue a f2fs_stop_checkpoint() while the fs is
> already about to be frozen but before the gc thread is stopped as part of the
> freeze.

So in ext4 we have EXT4_FLAGS_SHUTDOWN flag which we now use internally
instead of SB_RDONLY flag for checking whether the filesystem was shutdown
(because otherwise races between remount and hitting fs error were really
messy). However we still *also* set SB_RDONLY so that VFS bails early from
some paths which generally results in less error noise in kernel logs and
also out of caution of not breaking something in this path. That being said
we also support EXT4_IOC_SHUTDOWN ioctl for several years and in that path
we set EXT4_FLAGS_SHUTDOWN without setting SB_RDONLY and nothing seems to
have blown up. So I'm inclined to belive we could remove setting of
SB_RDONLY from ext4 error handling. Ted, what do you think?

Also as the "filesystem shutdown" is spreading across multiple filesystems,
I'm playing with the idea that maybe we could lift a flag like this to VFS
so that we can check it in VFS paths and abort some operations early.  But
so far I'm not convinced the gain is worth the need to iron out various
subtle semantical differences of "shutdown" among filesystems.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

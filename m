Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F073941206
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 14:38:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYm7J-0003zn-16;
	Tue, 30 Jul 2024 12:38:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1sYm7H-0003zg-Ew
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=; b=NdOlqyraDv8ZrVcjFnHiaP0Si3
 aCNCLjEqa5cPyTewwrcdmVBqIZPhvzP0yyKElEzkxmdWKIk+BpZLBXPON+c/AzwTtNQ6eJFvs7WXy
 eYrS1evob1GkS9Hh2UXNieMUCKo55Jp+gdmwxdSKNcFnICLX3z7weeOtHZL3jwD30Uns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=; b=Yb1GpmOCc5fWXvWI9d+dJyrhrF
 vtreXXN3QvKYHZvEyfo+7635J5oONu5C+L/veNnXlD96/cmvBMUCEIVDz5h/3Z32KraH5TzqXsWLd
 hKtDZ0XLGyi0s0TFR3SV9lkPkJ8VWcXmS2ASIxQaTHDRmzcyZ8CzRYsvFlYx1ClI71KA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sYm7H-0006dM-4b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:38:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B3FB41F7F6;
 Tue, 30 Jul 2024 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722343084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=;
 b=KMakEjIHSWBwf/G/jkXHX9EFt2J1JL3nFyQqppFfVEK/TXXSxKKjuNW6P+HmZeGRYGR4Gx
 FDeh9ldJ2UyGlZSmS+SVVAf8m+b2RookDGKGC9/YNO3CSz5nyRVa5h6/JKucVz1O9Ygr7g
 jQCPwVmnV8mzftb3Hl9FJsirl7D05Ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722343084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=;
 b=2rwhffjd6fhdyhz3LwkrJDDxYoquTfDC8RHEVf/bkiexPpnDsjlYYo9v3yvJjvs1efr2Na
 CoZrGwC5bkff6pDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722343084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=;
 b=KMakEjIHSWBwf/G/jkXHX9EFt2J1JL3nFyQqppFfVEK/TXXSxKKjuNW6P+HmZeGRYGR4Gx
 FDeh9ldJ2UyGlZSmS+SVVAf8m+b2RookDGKGC9/YNO3CSz5nyRVa5h6/JKucVz1O9Ygr7g
 jQCPwVmnV8mzftb3Hl9FJsirl7D05Ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722343084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJbwupOCQw82vkSxHqrB0yPLKfq0DkbrhS/e5z9cxHo=;
 b=2rwhffjd6fhdyhz3LwkrJDDxYoquTfDC8RHEVf/bkiexPpnDsjlYYo9v3yvJjvs1efr2Na
 CoZrGwC5bkff6pDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E04D13297;
 Tue, 30 Jul 2024 12:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cm6/HqzeqGZvSwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 30 Jul 2024 12:38:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 17E1CA099C; Tue, 30 Jul 2024 14:38:00 +0200 (CEST)
Date: Tue, 30 Jul 2024 14:38:00 +0200
From: Jan Kara <jack@suse.cz>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20240730123800.sgtlpu3l2p7fif3f@quack3>
References: <0000000000004ff2dc061e281637@google.com>
 <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
 <20240729132721.hxih6ehigadqf7wx@quack3>
 <20240729135847.GB557749@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729135847.GB557749@mit.edu>
X-Spamd-Result: default: False [-2.10 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[20d7e439f76bbbd863a7];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[18]; RCVD_COUNT_THREE(0.00)[3];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[suse.cz,kernel.org,suse.com,lists.sourceforge.net,syzkaller.appspotmail.com,redhat.com,gmail.com,sina.com,vger.kernel.org,vivo.com,googlegroups.com,zeniv.linux.org.uk];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_LAST(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.10
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 29-07-24 09:58:47, Theodore Ts'o wrote: > On Mon, Jul
 29, 2024 at 03:27:21PM +0200,
 Jan Kara wrote: > > So in ext4 we have EXT4_FLAGS_SHUTDOWN
 flag which we now use > > internally instead of SB [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.131 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.131 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYm7H-0006dM-4b
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
Cc: Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Jan Kara <jack@suse.cz>, paulmck@kernel.org, frank.li@vivo.com,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Oleg Nesterov <oleg@redhat.com>, Hillf Danton <hdanton@sina.com>,
 linux-f2fs-devel@lists.sourceforge.net, rcu@vger.kernel.org,
 viro@zeniv.linux.org.uk, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 29-07-24 09:58:47, Theodore Ts'o wrote:
> On Mon, Jul 29, 2024 at 03:27:21PM +0200, Jan Kara wrote:
> > So in ext4 we have EXT4_FLAGS_SHUTDOWN flag which we now use
> > internally instead of SB_RDONLY flag for checking whether the
> > filesystem was shutdown (because otherwise races between remount and
> > hitting fs error were really messy). However we still *also* set
> > SB_RDONLY so that VFS bails early from some paths which generally
> > results in less error noise in kernel logs and also out of caution
> > of not breaking something in this path. That being said we also
> > support EXT4_IOC_SHUTDOWN ioctl for several years and in that path
> > we set EXT4_FLAGS_SHUTDOWN without setting SB_RDONLY and nothing
> > seems to have blown up. So I'm inclined to belive we could remove
> > setting of SB_RDONLY from ext4 error handling. Ted, what do you
> > think?
> 
> Well, there are some failures of generic/388 (which involves calling
> the shutdown ioctl while running fsstress).  I believe that most of
> those failures are file system corruption errors, as opposed to other
> sorts of failures, but we don't run KASAN kernels all that often,
> especially since generic/388 is now on the exclude list.

As far as I remember the reason for those failures were mostly because the
fs shutdown happened in the middle of some operation on another CPU and 
this tickled unusual error handling paths that eventually resulted in
WARN_ONs and similar.

> The failure rate of generic/388 varies depending on the storage device
> involved, but it varies from less than 10% to 50% of the time, if
> memory serves correctly.  Since EXT4_IOC_SHUTDOWN is used most of the
> time as a debugging/test (although there are some users use it in
> production, but the failure rate when you're not doing something
> really aggressive like fsstress is very small), this has been on the
> "one of these days, when we have tons of free time, we should really
> look into this.  The challenge is fixing this in a way that doesn't
> involve adding new locking in various file system hotpaths.
> 
> So "nothing seems to have blown up" might be a bit strong.  But it's
> something we can try doing, and see whether it results in more rather
> than less syzbot complaints.

OK. I don't expect real troubles within the filesystem itself here because
the read-only check currently brings us only the benefit that the
filesystem isn't even entered in a lot of cases. But at latest by the time
we try to start a transaction handle, we get back error and bail out anyway
after the fs was shutdown and this is reasonably well tested path. What might
have larger impact is that userspace will be getting back EIO / EUCLEAN
instead of EROFS. But I hope it won't be a big deal either.

> > Also as the "filesystem shutdown" is spreading across multiple
> > filesystems, I'm playing with the idea that maybe we could lift a
> > flag like this to VFS so that we can check it in VFS paths and abort
> > some operations early.  But so far I'm not convinced the gain is
> > worth the need to iron out various subtle semantical differences of
> > "shutdown" among filesystems.
> 
> I think that might be a good idea.  Hopefully subtle semantic
> differences are ones that won't matter in terms of the VFS aborting
> operations early.

OK, I guess I'll try and see.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

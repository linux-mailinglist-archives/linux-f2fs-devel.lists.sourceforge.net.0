Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2022821B81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jan 2024 13:15:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rKdfx-0001K0-2H;
	Tue, 02 Jan 2024 12:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1rKdfv-0001Js-G2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 12:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=; b=Hz25kTF2DQMr1QmzDHyA8OLBel
 7SRw/x9ENH+8IOmmzhD1aBHImdwafgM+Kj1RQ5k/XOekBOiG71pUEYXObUPD7JjQoeRkja6P6cxGA
 V5v+3gZkSK79+tMWIddtr9Qg5DBmjxoD4dtN9BRbfB0JT1VSYSOVAL9hQiph9hMjSVI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=; b=HbE2R6VoLchyEJv+ELRHStck3P
 lMbuNrdJF8UxHxQxebult39jMTRQfa+1bl1ydsAKERYGgNZqZIGp3xH50YivLZMEpZmFsSEagWSV2
 g4V7H6qZgCENBwPB3lGTiGufzNwPdFyS2CCzbspryW/0EFAzfCUcuHwYmHC2VzEd80Hk=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rKdfs-0006bR-1M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jan 2024 12:15:15 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49FD01FD5E;
 Tue,  2 Jan 2024 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704197701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=;
 b=rVfdmq1rDvgD7b4d1mF2ZCEBTZ+3ArKL958WQrnXGtgwaqj7DYXVivSIouvlQWFmEODG++
 8LOL1fg5CZ/04IpI6xQNy9MKa3/rZb7FOz0uZIASHNFFSp0VwW3+JIxJTxFsQ9eXP5TfbQ
 c2LS0a8wITbyz6A7J4aaQ3g+ntg5sIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704197701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=;
 b=SV6DFXVzlTFJxIWbgtrSlwhih/Zxvim1Tj7HPNfde+D0780UzoNLx9CmfZAMHgNivmAI0c
 m8jlTTyd8AVpOYDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1704197699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=;
 b=JSvxxO/qXOCtnLRV+LIUGhAvLal1X95hYtx4VBVun3A4jsLFswEEfEIQOEuzPSW3e/NKIU
 5co3Dn9NR2YS3UxNHYPx5U1Cot9c5vdbgnVnmHuupC1J1qsfDEpJ11Mf2YYdWyJ/BtdZP8
 jMzocNegQ2W5++gY62vbJXg2d+juORI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1704197699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzteoYRrFuNlezpMdhomW2MOjO8HHbS2clXQHZdwoPI=;
 b=HnAFj7MGtLTikRyJ7PpC/vBIkYW0P/An0eCjfGKLQ5fmEsF3ZMrXgSSBeYPUNLsGXEFplO
 1WZQB5FJhjN+PaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 358961340C;
 Tue,  2 Jan 2024 12:14:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gn4FDUP+k2VVPAAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 02 Jan 2024 12:14:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C74D8A07EF; Tue,  2 Jan 2024 13:14:58 +0100 (CET)
Date: Tue, 2 Jan 2024 13:14:58 +0100
From: Jan Kara <jack@suse.cz>
To: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
Message-ID: <20240102121458.bcnwj3g4hr6xhimt@quack3>
References: <0000000000001825ce06047bf2a6@google.com>
 <00000000000007d6a9060d441adc@google.com>
 <20231228-arterien-nachmachen-d74aec52820e@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228-arterien-nachmachen-d74aec52820e@brauner>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.53
X-Spamd-Bar: ++
X-Spam-Flag: NO
X-Spamd-Result: default: False [2.53 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqzkqenty6h5wkt76cn81i3yg)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.cz:+];
 MX_GOOD(-0.01)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.16)[69.10%];
 SUBJECT_HAS_QUESTION(0.00)[]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[sina.com];
 URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=710dc49bece494df];
 TAGGED_RCPT(0.00)[062317ea1d0a6d5e29e7];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[21];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,goo.gl:url,suse.com:email,syzkaller.appspot.com:url];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_NOT_FQDN(0.50)[];
 FREEMAIL_CC(0.00)[kernel.org,kernel.dk,brauner.io,ffwll.ch,lst.de,sina.com,suse.cz,ionos.com,lists.sourceforge.net,vger.kernel.org,riseup.net,igalia.com,googlegroups.com,fb.com,infradead.org,huawei.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="JSvxxO/q";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=HnAFj7MG
X-Spam-Level: **
X-Rspamd-Queue-Id: 49FD01FD5E
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 28-12-23 11:50:32, Christian Brauner wrote: > On Sun, 
 Dec 24, 2023 at 08:40:05AM -0800, syzbot wrote: > > syzbot suspects this
 issue was fixed by commit: > > > > commit fd1464105cb37a3b50a72c1d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rKdfs-0006bR-1M
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] possible deadlock in super_lock
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
Cc: axboe@kernel.dk, Christian Brauner <brauner@kernel.org>, mcanal@igalia.com,
 jack@suse.cz, reiserfs-devel@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, hdanton@sina.com, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com,
 mairacanal@riseup.net, terrelln@fb.com, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, jinpu.wang@ionos.com,
 hch@lst.de, christian@brauner.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 28-12-23 11:50:32, Christian Brauner wrote:
> On Sun, Dec 24, 2023 at 08:40:05AM -0800, syzbot wrote:
> > syzbot suspects this issue was fixed by commit:
> > 
> > commit fd1464105cb37a3b50a72c1d2902e97a71950af8
> > Author: Jan Kara <jack@suse.cz>
> > Date:   Wed Oct 18 15:29:24 2023 +0000
> > 
> >     fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14639595e80000
> > start commit:   2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
> > dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000
> > 
> > If the result looks correct, please mark the issue as fixed by replying with:
> > 
> > #syz fix: fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> Fwiw, this was always a false-positive. But we also reworked the locking
> that even the false-positive cannot be triggered anymore. So yay!

Yup, nice. I think you need to start the line with syz command so:

#syz fix: fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E13AFB7DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 17:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmQSBNZHqr8onfMiUfNHrqojN2jLXrfPSca9R9wP6q0=; b=F5B+0bIlO7U0yuVYzXN+h5m3Rd
	aQbKKf94r7w3FyUlmKd9ZfW7yoV20bzbVg//T1o6euMJBRLPRa4KhsG4ZTEuEo4nIPx6nB1Xj/Jnn
	w87PGVJYw661kEbHLyNP5mREckPr8bcycGBOszNVQ6dkaH7mbbb8zd3MVfdA5Hz6zRNI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYo3u-0008KG-1e;
	Mon, 07 Jul 2025 15:47:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uYo3s-0008K9-Ea
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 15:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=; b=QKXHzS84hWpmwrR1i127xaLmoR
 mcaEh0a0YGo66veHgTdMaFPrwjf9/XKxnJKShTnbO6yhmiMq45KUrXUvBU50RWVPo572knPBspU/K
 ds/2oWLDea6PzNvjX4Bl+yhMhx+Qnj6e2fYlRREwSoetB/09jew8iPYFLFZ8EJkKRW4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=; b=Vt69DDSyKcTtefOIBszcaMNzkV
 EIs4kZr6PyXkfjl/fl7MZPRDV0knZLX4+ZuLE8JvQQHvSl7cERGhiz7/dmjOp/yDDx5OGDKQgRy7i
 KWLoFWqrzpKvCPfKPSZ23eGqsGqiUH54Wj/1+EYWkXVkz2dnLbaFHLjwjUluB9vDNbFU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uYo3r-0005Kc-OJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 15:47:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B320C210ED;
 Mon,  7 Jul 2025 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751903232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=;
 b=AuKRCJ50I5YGo3CF6bKoWnI8xfVLLSEFDTOa2wcmGEz3gGkUAYCA6QKmVnMQJPMkmuqMYA
 GkvbxkNeN3rTX5LKtZ3lOYE7qeCtb9GhoIlxqPReTJPZJNMDtvWeQhpD0QiTn10iQqBtXS
 ZL/sRomz/ur+E7611UUOibV4KWMKdTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751903232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=;
 b=bl9Jb3rMuMHLDaHY4T56CexJ/SfS04eXPV7nQwoip8NbuRgVfOSomJ32DHtrI6VYOc+uyc
 sRzwdXzdoOWT3yDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AuKRCJ50;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bl9Jb3rM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751903232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=;
 b=AuKRCJ50I5YGo3CF6bKoWnI8xfVLLSEFDTOa2wcmGEz3gGkUAYCA6QKmVnMQJPMkmuqMYA
 GkvbxkNeN3rTX5LKtZ3lOYE7qeCtb9GhoIlxqPReTJPZJNMDtvWeQhpD0QiTn10iQqBtXS
 ZL/sRomz/ur+E7611UUOibV4KWMKdTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751903232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX29DBgo8xdocmIqtM7JRV4LqGxqs58F+qWxznSEpTI=;
 b=bl9Jb3rMuMHLDaHY4T56CexJ/SfS04eXPV7nQwoip8NbuRgVfOSomJ32DHtrI6VYOc+uyc
 sRzwdXzdoOWT3yDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 637A013A5E;
 Mon,  7 Jul 2025 15:47:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qxg/GADsa2hzSQAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 07 Jul 2025 15:47:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 91FEEA098E; Mon,  7 Jul 2025 17:47:11 +0200 (CEST)
Date: Mon, 7 Jul 2025 17:47:11 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <os6aqmbjphkeybbpceftdbfkmgquu6ywp34tx7uvmpqac4c42m@r76tgxypd5jg>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
 <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
 <20250702184312.GC9991@frogsfrogsfrogs>
 <20250703130500.GA23864@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703130500.GA23864@lst.de>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B320C210ED
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[30];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLhzk8m8dynxu9bgo74bfqqdh9)];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux-foundation.org,samsung.com,zeniv.linux.org.uk,suse.cz,szeredi.hu,redhat.com,infradead.org,meta.com,fromorbit.com,kernel.dk,stgolabs.net,lists.sourceforge.net,vger.kernel.org,lists.linux.dev,kvack.org];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email]
X-Spam-Score: -2.51
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 03-07-25 15:05:00, Christoph Hellwig wrote: > On Wed, 
 Jul 02, 2025 at 11:43:12AM -0700, Darrick J. Wong wrote: > > > On a spinning
 disk, random IO bandwidth remains unchanged, while sequential [...] 
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
X-Headers-End: 1uYo3r-0005Kc-OJ
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, Kundan Kumar <kundan.kumar@samsung.com>,
 willy@infradead.org, p.raghav@samsung.com, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 Kundan Kumar <kundanthebest@gmail.com>, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, gost.dev@samsung.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 03-07-25 15:05:00, Christoph Hellwig wrote:
> On Wed, Jul 02, 2025 at 11:43:12AM -0700, Darrick J. Wong wrote:
> > > On a spinning disk, random IO bandwidth remains unchanged, while sequential
> > > IO performance declines. However, setting nr_wb_ctx = 1 via configurable
> > > writeback(planned in next version) eliminates the decline.
> > > 
> > > echo 1 > /sys/class/bdi/8:16/nwritebacks
> > > 
> > > We can fetch the device queue's rotational property and allocate BDI with
> > > nr_wb_ctx = 1 for rotational disks. Hope this is a viable solution for
> > > spinning disks?
> > 
> > Sounds good to me, spinning rust isn't known for iops.
> > 
> > Though: What about a raid0 of spinning rust?  Do you see the same
> > declines for sequential IO?
> 
> Well, even for a raid0 multiple I/O streams will degrade performance
> on a disk.  Of course many real life workloads will have multiple
> I/O streams anyway.
> 
> I think the important part is to have:
> 
>  a) sane defaults
>  b) an easy way for the file system and/or user to override the default
> 
> For a) a single thread for rotational is a good default.  For file system
> that driver multiple spindles independently or do compression multiple
> threads might still make sense.
> 
> For b) one big issue is that right now the whole writeback handling is
> per-bdi and not per superblock.  So maybe the first step needs to be
> to move the writeback to the superblock instead of bdi?  If someone
> uses partitions and multiple file systems on spinning rusts these
> days reducing the number of writeback threads isn't really going to
> save their day either.

We have had requests to move writeback infrastructure to be per sb in the
past, mostly so that the filesystem has a better control of the writeback
process (e.g. selection of inodes etc.). After some thought I tend to agree
that today setups where we have multiple filesystems over the same bdi and
end up doing writeback from several of them in parallel should be mostly
limited to desktops / laptops / small servers. And there you usually have
only one main data filesystem - e.g. /home/ - and you don't tend to write
that much to your / filesystem. Although there could be exceptions like
large occasional writes to /tmp, news server updates or similar. Anyway in
these cases I'd expect IO scheduler (BFQ for rotational disks where this
really matters) to still achieve a decent IO locality but it would be good
to verify what the impact is.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

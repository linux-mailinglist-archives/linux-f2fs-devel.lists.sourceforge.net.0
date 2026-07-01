Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id byqpKzfmRGow2woAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 12:04:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 573316EBDD7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 12:04:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=k9Su3ELX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XF8oycah;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Hwo5i7uM;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=awuWoOS7;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_ed25519 header.b=6TzNrdE6;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=Sa9kQZKV;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9KqFY0Rc4hzjxJ/IaD9+LMKaCF3qdoouGR4bItcOKE=; b=k9Su3ELXATVm1V1JGdaa7XmymH
	OqXNx+1WnE5jkP4s6852/QGW2GEVV5TyND9FDeJcG8OMA42QO1NjrD8BM33XCviznvIpwnZE/RBbf
	EAyGL2bdPEICSRUz39JnJntbzsT9S7vIAzQa8sDLjS7Lk2b6mD7QS1FOuB6Ni2PFf/kI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wernx-0000Xh-Sp;
	Wed, 01 Jul 2026 10:04:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1wernw-0000XU-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 10:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=; b=XF8oycahAPzz1gaterxblqZjR6
 L1yJO2+Ii24il4AnHIG881LKQjsXbbviKY5Kv/d5rvTxMhg9AhkeOwFAhQN3MXv5PwZUVp+fsbhOc
 e1N4KOcMzB9mdVHalsnAYQbXZwYzN4HexsRSb/Bs6JjhH1rOJHaJ5pemNz14j0o2sEVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=; b=Hwo5i7uMKQQMIwF982UtXYlBka
 yn53wMuaJZVq0YakSnBMkNFntvqFJU7etqK1lID1RMir1Yo0+X96kr81q5Y8/agj1xh2w0QCsi50Q
 VlhPM+onAv6uZ66+dcKvZ01+6tK86RhZ8F/94erTeWQUuPzMhI+Wy9uteUjsIbLbWotY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1werns-00080f-CT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 10:04:28 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE74572008;
 Wed,  1 Jul 2026 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1782900258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=;
 b=awuWoOS7OexpL2kS5FAMpYdVg+rXUWr1/KSx6uSioTnzdvvLQnrmLYH3HPFzhn8Xc1ft88
 SfIOIhKwzg0ZM0PTvjU94szHICf+Tki5axU6hObRvcIfkPFx3ZC6tuui7k5qMxlSnFgM5d
 tipZu2rfGyLJIpmBfhRt9m8L7loshd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1782900258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=;
 b=6TzNrdE636Qf2gI35l1rA98FLFJLtSH4MfkQ3XSRT1aR3cWBV01ejZxDcn6ItI3p6NmaFO
 gO9I91GhQDI2ZrAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1782900257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=;
 b=Sa9kQZKVAfkjwNKqnfea0UosiPStdBMv6nQPRJrHos9SrAU6+iS5A3+5kLTZODiG4Ijtxr
 FejN3Nb3EDmrJkM5yE1K5VVsWi/uDBPvmjF3P/J2dGDfpFfcwkYn9cV2p/tg297xgwwM/T
 tPL/NfzJvi2iX8SaKXOYakfkc9bvs6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1782900257;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82G87gHvAGxUAOq8deCfUpsX9BQ6SxQWFI/KjIP8mn0=;
 b=mdqfPzEZQ1GRbrX5MSZtwyKqdUFZxTOO9hrAcyTDam6H18HNeJZdcNGFGKFDoxRhQmVc8T
 CMBcJe4fjDpH0yDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C33B0779AA;
 Wed,  1 Jul 2026 10:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TRibLyDmRGrONwAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 01 Jul 2026 10:04:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5E2DFA10B7; Wed, 01 Jul 2026 12:04:16 +0200 (CEST)
Date: Wed, 1 Jul 2026 12:04:16 +0200
From: Jan Kara <jack@suse.cz>
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <nqrqll34kqqvug5r3fzvvtooqbn6yl3uyp5lg5rkk56huoulwc@jqi7ywki5vea>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701000949.1666714-18-joannelkoong@gmail.com>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.30
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 30-06-26 17:09:32, Joanne Koong wrote: > Now that all
 filesystems implement ->iomap_next() and the legacy >
 ->iomap_begin()/->iomap_end()
 fallback is gone, struct iomap_ops only > wraps a singl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1werns-00080f-CT
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, djwong@kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, hch@lst.de, Yuezhang Mo <yuezhang.mo@sony.com>,
 hsiangkao@linux.alibaba.com, Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:yuezhang.mo@sony.com,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:
 gfs2@lists.linux.dev,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[48];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,jqi7ywki5vea:mid,suse.cz:from_mime,suse.cz:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,sony.com,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 573316EBDD7

On Tue 30-06-26 17:09:32, Joanne Koong wrote:
> Now that all filesystems implement ->iomap_next() and the legacy
> ->iomap_begin()/->iomap_end() fallback is gone, struct iomap_ops only
> wraps a single iomap_next function pointer. Drop the struct entirely and
> pass the iomap_next_fn directly to iomap_iter() and all the iomap/dax
> entry points; filesystems pass their ->iomap_next function instead of an
> ops struct.
> 
> No functional change intended.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Feel free to add:

Acked-by: Jan Kara <jack@suse.cz>

for ext2 & ext4 changes.

								Honza

> ---
>  block/fops.c           | 10 +++-----
>  fs/btrfs/direct-io.c   |  8 ++----
>  fs/dax.c               | 47 ++++++++++++++++++------------------
>  fs/erofs/data.c        | 24 ++++++++----------
>  fs/erofs/internal.h    |  3 ++-
>  fs/erofs/zmap.c        |  8 ++----
>  fs/exfat/file.c        | 18 +++++++-------
>  fs/exfat/inode.c       |  6 ++---
>  fs/exfat/iomap.c       | 16 +++---------
>  fs/exfat/iomap.h       |  6 +++--
>  fs/ext2/ext2.h         |  3 ++-
>  fs/ext2/file.c         |  4 +--
>  fs/ext2/inode.c        |  8 ++----
>  fs/ext4/ext4.h         |  6 +++--
>  fs/ext4/extents.c      |  8 ++----
>  fs/ext4/file.c         | 14 +++++------
>  fs/ext4/inode.c        | 20 +++++----------
>  fs/f2fs/data.c         |  9 +++----
>  fs/f2fs/f2fs.h         |  3 ++-
>  fs/f2fs/file.c         |  4 +--
>  fs/fuse/dax.c          | 10 +++-----
>  fs/fuse/file.c         | 10 +++-----
>  fs/gfs2/aops.c         |  6 ++---
>  fs/gfs2/bmap.c         | 10 +++-----
>  fs/gfs2/bmap.h         |  3 ++-
>  fs/gfs2/file.c         |  6 ++---
>  fs/gfs2/inode.c        |  6 ++---
>  fs/hpfs/file.c         |  6 +----
>  fs/internal.h          |  1 -
>  fs/iomap/buffered-io.c | 38 ++++++++++++++---------------
>  fs/iomap/direct-io.c   |  8 +++---
>  fs/iomap/fiemap.c      |  8 +++---
>  fs/iomap/iter.c        |  8 +++---
>  fs/iomap/seek.c        |  8 +++---
>  fs/iomap/swapfile.c    |  4 +--
>  fs/ntfs/aops.c         |  6 ++---
>  fs/ntfs/file.c         | 24 +++++++++---------
>  fs/ntfs/inode.c        |  2 +-
>  fs/ntfs/iomap.c        | 42 +++++++-------------------------
>  fs/ntfs/iomap.h        | 15 ++++++++----
>  fs/ntfs3/file.c        | 16 ++++++------
>  fs/ntfs3/inode.c       | 12 +++------
>  fs/ntfs3/ntfs_fs.h     |  3 ++-
>  fs/remap_range.c       |  6 ++---
>  fs/xfs/xfs_aops.c      |  8 +++---
>  fs/xfs/xfs_file.c      | 40 +++++++++++++++---------------
>  fs/xfs/xfs_iomap.c     | 55 +++++++++---------------------------------
>  fs/xfs/xfs_iomap.h     | 24 ++++++++++++------
>  fs/xfs/xfs_iops.c      |  4 +--
>  fs/xfs/xfs_reflink.c   |  6 ++---
>  fs/zonefs/file.c       | 22 ++++++-----------
>  include/linux/dax.h    | 18 ++++++--------
>  include/linux/fs.h     |  7 ++++--
>  include/linux/iomap.h  | 46 +++++++++++++++--------------------
>  54 files changed, 302 insertions(+), 411 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index c2721e2c659b..9ccec477f90d 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -459,10 +459,6 @@ static int blkdev_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  	return iomap_process(iter, iomap, srcmap, blkdev_iomap_begin, NULL);
>  }
>  
> -static const struct iomap_ops blkdev_iomap_ops = {
> -	.iomap_next		= blkdev_iomap_next,
> -};
> -
>  #ifdef CONFIG_BUFFER_HEAD
>  static int blkdev_get_block(struct inode *inode, sector_t iblock,
>  		struct buffer_head *bh, int create)
> @@ -516,13 +512,13 @@ const struct address_space_operations def_blk_aops = {
>  #else /* CONFIG_BUFFER_HEAD */
>  static int blkdev_read_folio(struct file *file, struct folio *folio)
>  {
> -	iomap_bio_read_folio(folio, &blkdev_iomap_ops);
> +	iomap_bio_read_folio(folio, blkdev_iomap_next);
>  	return 0;
>  }
>  
>  static void blkdev_readahead(struct readahead_control *rac)
>  {
> -	iomap_bio_readahead(rac, &blkdev_iomap_ops);
> +	iomap_bio_readahead(rac, blkdev_iomap_next);
>  }
>  
>  static ssize_t blkdev_writeback_range(struct iomap_writepage_ctx *wpc,
> @@ -713,7 +709,7 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
>  {
> -	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops, NULL,
> +	return iomap_file_buffered_write(iocb, from, blkdev_iomap_next, NULL,
>  			NULL);
>  }
>  
> diff --git a/fs/btrfs/direct-io.c b/fs/btrfs/direct-io.c
> index 46dd72982fba..f1feeb68642d 100644
> --- a/fs/btrfs/direct-io.c
> +++ b/fs/btrfs/direct-io.c
> @@ -805,10 +805,6 @@ static int btrfs_dio_iomap_next(const struct iomap_iter *iter,
>  			     btrfs_dio_iomap_end);
>  }
>  
> -static const struct iomap_ops btrfs_dio_iomap_ops = {
> -	.iomap_next             = btrfs_dio_iomap_next,
> -};
> -
>  static const struct iomap_dio_ops btrfs_dio_ops = {
>  	.submit_io		= btrfs_dio_submit_io,
>  	.bio_set		= &btrfs_dio_bioset,
> @@ -819,7 +815,7 @@ static ssize_t btrfs_dio_read(struct kiocb *iocb, struct iov_iter *iter,
>  {
>  	struct btrfs_dio_data data = { 0 };
>  
> -	return iomap_dio_rw(iocb, iter, &btrfs_dio_iomap_ops, &btrfs_dio_ops,
> +	return iomap_dio_rw(iocb, iter, btrfs_dio_iomap_next, &btrfs_dio_ops,
>  			    IOMAP_DIO_PARTIAL | IOMAP_DIO_FSBLOCK_ALIGNED, &data, done_before);
>  }
>  
> @@ -828,7 +824,7 @@ static struct iomap_dio *btrfs_dio_write(struct kiocb *iocb, struct iov_iter *it
>  {
>  	struct btrfs_dio_data data = { 0 };
>  
> -	return __iomap_dio_rw(iocb, iter, &btrfs_dio_iomap_ops, &btrfs_dio_ops,
> +	return __iomap_dio_rw(iocb, iter, btrfs_dio_iomap_next, &btrfs_dio_ops,
>  			    IOMAP_DIO_PARTIAL | IOMAP_DIO_FSBLOCK_ALIGNED, &data, done_before);
>  }
>  
> diff --git a/fs/dax.c b/fs/dax.c
> index 6d175cd47a99..c0a6b87dc052 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1492,7 +1492,7 @@ static int dax_unshare_iter(struct iomap_iter *iter)
>  }
>  
>  int dax_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode		= inode,
> @@ -1506,7 +1506,7 @@ int dax_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		return 0;
>  
>  	iter.len = min(len, size - pos);
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = dax_unshare_iter(&iter);
>  	return ret;
>  }
> @@ -1584,7 +1584,7 @@ static int dax_zero_iter(struct iomap_iter *iter, bool *did_zero)
>  }
>  
>  int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode		= inode,
> @@ -1594,14 +1594,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
>  	};
>  	int ret;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = dax_zero_iter(&iter, did_zero);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dax_zero_range);
>  
>  int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	unsigned int blocksize = i_blocksize(inode);
>  	unsigned int off = pos & (blocksize - 1);
> @@ -1609,7 +1609,7 @@ int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  	/* Block boundary? Nothing to do */
>  	if (!off)
>  		return 0;
> -	return dax_zero_range(inode, pos, blocksize - off, did_zero, ops);
> +	return dax_zero_range(inode, pos, blocksize - off, did_zero, iomap_next);
>  }
>  EXPORT_SYMBOL_GPL(dax_truncate_page);
>  
> @@ -1734,7 +1734,7 @@ static int dax_iomap_iter(struct iomap_iter *iomi, struct iov_iter *iter)
>   * dax_iomap_rw - Perform I/O to a DAX file
>   * @iocb:	The control block for this I/O
>   * @iter:	The addresses to do I/O from or to
> - * @ops:	iomap ops passed from the file system
> + * @iomap_next: iomap_next callback passed from the file system
>   *
>   * This function performs read and write operations to directly mapped
>   * persistent memory.  The callers needs to take care of read/write exclusion
> @@ -1742,7 +1742,7 @@ static int dax_iomap_iter(struct iomap_iter *iomi, struct iov_iter *iter)
>   */
>  ssize_t
>  dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iomi = {
>  		.inode		= iocb->ki_filp->f_mapping->host,
> @@ -1769,7 +1769,7 @@ dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		iomi.flags |= IOMAP_NOWAIT;
>  
> -	while ((ret = iomap_iter(&iomi, ops)) > 0)
> +	while ((ret = iomap_iter(&iomi, iomap_next)) > 0)
>  		iomi.status = dax_iomap_iter(&iomi, iter);
>  
>  	done = iomi.pos - iocb->ki_pos;
> @@ -1897,7 +1897,7 @@ static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
>  }
>  
>  static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, unsigned long *pfnp,
> -			       int *iomap_errp, const struct iomap_ops *ops)
> +			       int *iomap_errp, iomap_next_fn iomap_next)
>  {
>  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
>  	XA_STATE(xas, &mapping->i_pages, vmf->pgoff);
> @@ -1942,7 +1942,7 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, unsigned long *pfnp,
>  		goto unlock_entry;
>  	}
>  
> -	while ((error = iomap_iter(&iter, ops)) > 0) {
> +	while ((error = iomap_iter(&iter, iomap_next)) > 0) {
>  		if (WARN_ON_ONCE(iomap_length(&iter) < PAGE_SIZE)) {
>  			iter.status = -EIO;	/* fs corruption? */
>  			continue;
> @@ -2007,7 +2007,7 @@ static bool dax_fault_check_fallback(struct vm_fault *vmf, struct xa_state *xas,
>  }
>  
>  static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
> -			       const struct iomap_ops *ops)
> +			       iomap_next_fn iomap_next)
>  {
>  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
>  	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
> @@ -2064,7 +2064,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
>  	}
>  
>  	iter.pos = (loff_t)xas.xa_index << PAGE_SHIFT;
> -	while (iomap_iter(&iter, ops) > 0) {
> +	while (iomap_iter(&iter, iomap_next) > 0) {
>  		if (iomap_length(&iter) < PMD_SIZE)
>  			continue; /* actually breaks out of the loop */
>  
> @@ -2086,7 +2086,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
>  }
>  #else
>  static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
> -			       const struct iomap_ops *ops)
> +			       iomap_next_fn iomap_next)
>  {
>  	return VM_FAULT_FALLBACK;
>  }
> @@ -2098,7 +2098,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
>   * @order: Order of the page to fault in
>   * @pfnp: PFN to insert for synchronous faults if fsync is required
>   * @iomap_errp: Storage for detailed error code in case of error
> - * @ops: Iomap ops passed from the file system
> + * @iomap_next: iomap_next callback passed from the file system
>   *
>   * When a page fault occurs, filesystems may call this helper in
>   * their fault handler for DAX files. dax_iomap_fault() assumes the caller
> @@ -2107,12 +2107,12 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, unsigned long *pfnp,
>   */
>  vm_fault_t dax_iomap_fault(struct vm_fault *vmf, unsigned int order,
>  			unsigned long *pfnp, int *iomap_errp,
> -			const struct iomap_ops *ops)
> +			iomap_next_fn iomap_next)
>  {
>  	if (order == 0)
> -		return dax_iomap_pte_fault(vmf, pfnp, iomap_errp, ops);
> +		return dax_iomap_pte_fault(vmf, pfnp, iomap_errp, iomap_next);
>  	else if (order == PMD_ORDER)
> -		return dax_iomap_pmd_fault(vmf, pfnp, ops);
> +		return dax_iomap_pmd_fault(vmf, pfnp, iomap_next);
>  	else
>  		return VM_FAULT_FALLBACK;
>  }
> @@ -2240,7 +2240,7 @@ static int dax_range_compare_iter(struct iomap_iter *it_src,
>  
>  int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  		struct inode *dst, loff_t dstoff, loff_t len, bool *same,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter src_iter = {
>  		.inode		= src,
> @@ -2256,8 +2256,8 @@ int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  	};
>  	int ret, status;
>  
> -	while ((ret = iomap_iter(&src_iter, ops)) > 0 &&
> -	       (ret = iomap_iter(&dst_iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&src_iter, iomap_next)) > 0 &&
> +	       (ret = iomap_iter(&dst_iter, iomap_next)) > 0) {
>  		status = dax_range_compare_iter(&src_iter, &dst_iter,
>  				min(src_iter.len, dst_iter.len), same);
>  		if (status < 0)
> @@ -2270,9 +2270,10 @@ int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  int dax_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  			      struct file *file_out, loff_t pos_out,
>  			      loff_t *len, unsigned int remap_flags,
> -			      const struct iomap_ops *ops)
> +			      iomap_next_fn iomap_next)
>  {
>  	return __generic_remap_file_range_prep(file_in, pos_in, file_out,
> -					       pos_out, len, remap_flags, ops);
> +					       pos_out, len, remap_flags,
> +					       iomap_next);
>  }
>  EXPORT_SYMBOL_GPL(dax_remap_file_range_prep);
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 47dba61ec576..f6fe8c7eaf6d 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -387,10 +387,6 @@ static int erofs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  			     erofs_iomap_end);
>  }
>  
> -static const struct iomap_ops erofs_iomap_ops = {
> -	.iomap_next = erofs_iomap_next,
> -};
> -
>  int erofs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		 u64 start, u64 len)
>  {
> @@ -398,9 +394,9 @@ int erofs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		if (!IS_ENABLED(CONFIG_EROFS_FS_ZIP))
>  			return -EOPNOTSUPP;
>  		return iomap_fiemap(inode, fieinfo, start, len,
> -				    &z_erofs_iomap_report_ops);
> +				    z_erofs_iomap_next_report);
>  	}
> -	return iomap_fiemap(inode, fieinfo, start, len, &erofs_iomap_ops);
> +	return iomap_fiemap(inode, fieinfo, start, len, erofs_iomap_next);
>  }
>  
>  /*
> @@ -419,7 +415,7 @@ static int erofs_read_folio(struct file *file, struct folio *folio)
>  	};
>  
>  	trace_erofs_read_folio(iter_ctx.realinode, folio, true);
> -	iomap_read_folio(&erofs_iomap_ops, &read_ctx, &iter_ctx);
> +	iomap_read_folio(erofs_iomap_next, &read_ctx, &iter_ctx);
>  	if (need_iput)
>  		iput(iter_ctx.realinode);
>  	return 0;
> @@ -438,14 +434,14 @@ static void erofs_readahead(struct readahead_control *rac)
>  
>  	trace_erofs_readahead(iter_ctx.realinode, readahead_index(rac),
>  			      readahead_count(rac), true);
> -	iomap_readahead(&erofs_iomap_ops, &read_ctx, &iter_ctx);
> +	iomap_readahead(erofs_iomap_next, &read_ctx, &iter_ctx);
>  	if (need_iput)
>  		iput(iter_ctx.realinode);
>  }
>  
>  static sector_t erofs_bmap(struct address_space *mapping, sector_t block)
>  {
> -	return iomap_bmap(mapping, block, &erofs_iomap_ops);
> +	return iomap_bmap(mapping, block, erofs_iomap_next);
>  }
>  
>  static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> @@ -457,14 +453,14 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		return 0;
>  
>  	if (IS_ENABLED(CONFIG_FS_DAX) && IS_DAX(inode))
> -		return dax_iomap_rw(iocb, to, &erofs_iomap_ops);
> +		return dax_iomap_rw(iocb, to, erofs_iomap_next);
>  
>  	if ((iocb->ki_flags & IOCB_DIRECT) && inode->i_sb->s_bdev) {
>  		struct erofs_iomap_iter_ctx iter_ctx = {
>  			.realinode = inode,
>  		};
>  
> -		return iomap_dio_rw(iocb, to, &erofs_iomap_ops,
> +		return iomap_dio_rw(iocb, to, erofs_iomap_next,
>  				    NULL, 0, &iter_ctx, 0);
>  	}
>  	return filemap_read(iocb, to, 0);
> @@ -484,7 +480,7 @@ const struct address_space_operations erofs_aops = {
>  static vm_fault_t erofs_dax_huge_fault(struct vm_fault *vmf,
>  		unsigned int order)
>  {
> -	return dax_iomap_fault(vmf, order, NULL, NULL, &erofs_iomap_ops);
> +	return dax_iomap_fault(vmf, order, NULL, NULL, erofs_iomap_next);
>  }
>  
>  static vm_fault_t erofs_dax_fault(struct vm_fault *vmf)
> @@ -516,12 +512,12 @@ static int erofs_file_mmap_prepare(struct vm_area_desc *desc)
>  static loff_t erofs_file_llseek(struct file *file, loff_t offset, int whence)
>  {
>  	struct inode *inode = file->f_mapping->host;
> -	const struct iomap_ops *ops = &erofs_iomap_ops;
> +	iomap_next_fn ops = erofs_iomap_next;
>  
>  	if (erofs_inode_is_data_compressed(EROFS_I(inode)->datalayout)) {
>  		if (!IS_ENABLED(CONFIG_EROFS_FS_ZIP))
>  			return generic_file_llseek(file, offset, whence);
> -		ops = &z_erofs_iomap_report_ops;
> +		ops = z_erofs_iomap_next_report;
>  	}
>  
>  	if (whence == SEEK_HOLE)
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 580f8d9f14e7..72ccd6f335b8 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -397,7 +397,8 @@ extern const struct file_operations erofs_file_fops;
>  extern const struct file_operations erofs_dir_fops;
>  extern const struct file_operations erofs_ishare_fops;
>  
> -extern const struct iomap_ops z_erofs_iomap_report_ops;
> +int z_erofs_iomap_next_report(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
>  
>  void *erofs_read_metadata(struct super_block *sb, struct erofs_buf *buf,
>  			  erofs_off_t *offset, int *lengthp);
> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
> index dd058413a0b6..59054eecd69e 100644
> --- a/fs/erofs/zmap.c
> +++ b/fs/erofs/zmap.c
> @@ -821,13 +821,9 @@ static int z_erofs_iomap_begin_report(struct inode *inode, loff_t offset,
>  	return 0;
>  }
>  
> -static int z_erofs_iomap_next_report(const struct iomap_iter *iter,
> -				     struct iomap *iomap, struct iomap *srcmap)
> +int z_erofs_iomap_next_report(const struct iomap_iter *iter,
> +			      struct iomap *iomap, struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, z_erofs_iomap_begin_report,
>  			     NULL);
>  }
> -
> -const struct iomap_ops z_erofs_iomap_report_ops = {
> -	.iomap_next = z_erofs_iomap_next_report,
> -};
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 5fc13378d35f..c05849d305ae 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -668,7 +668,7 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
>  
>  		ret = iomap_zero_range(inode, old_valid_size,
>  				new_valid_size - old_valid_size, NULL,
> -				&exfat_write_iomap_ops, NULL, NULL);
> +				exfat_write_iomap_next, NULL, NULL);
>  		if (ret) {
>  			truncate_setsize(inode, old_valid_size);
>  			exfat_truncate(inode);
> @@ -687,7 +687,7 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
>  
>  	iocb->ki_flags &= ~IOCB_DIRECT;
>  
> -	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
> +	written = iomap_file_buffered_write(iocb, from, exfat_write_iomap_next,
>  			NULL, NULL);
>  	if (written < 0)
>  		return written;
> @@ -709,7 +709,7 @@ static ssize_t exfat_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	ssize_t ret;
>  
> -	ret = iomap_dio_rw(iocb, from, &exfat_write_iomap_ops,
> +	ret = iomap_dio_rw(iocb, from, exfat_write_iomap_next,
>  			&exfat_write_dio_ops, 0, NULL, 0);
>  	if (ret == -ENOTBLK)
>  		ret = 0;
> @@ -773,7 +773,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
>  		ret = exfat_dio_write_iter(iocb, iter);
>  	else
>  		ret = iomap_file_buffered_write(iocb, iter,
> -				&exfat_write_iomap_ops, NULL, NULL);
> +				exfat_write_iomap_next, NULL, NULL);
>  	if (ret < 0)
>  		goto unlock;
>  
> @@ -809,7 +809,7 @@ static ssize_t exfat_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>  
>  	if (iocb->ki_flags & IOCB_DIRECT) {
>  		file_accessed(iocb->ki_filp);
> -		ret = iomap_dio_rw(iocb, iter, &exfat_iomap_ops, NULL, 0,
> +		ret = iomap_dio_rw(iocb, iter, exfat_iomap_next, NULL, 0,
>  				NULL, 0);
>  	} else {
>  		ret = generic_file_read_iter(iocb, iter);
> @@ -850,7 +850,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>  			 */
>  			err = iomap_zero_range(inode, ei->zeroed_size,
>  					mmap_valid_size - ei->zeroed_size, NULL,
> -					&exfat_iomap_ops, NULL, NULL);
> +					exfat_iomap_next, NULL, NULL);
>  			if (err < 0) {
>  				inode_unlock(inode);
>  				return vmf_fs_error(err);
> @@ -866,7 +866,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>  	file_update_time(vmf->vma->vm_file);
>  
>  	filemap_invalidate_lock_shared(inode->i_mapping);
> -	ret = iomap_page_mkwrite(vmf, &exfat_write_iomap_ops, NULL);
> +	ret = iomap_page_mkwrite(vmf, exfat_write_iomap_next, NULL);
>  	filemap_invalidate_unlock_shared(inode->i_mapping);
>  	sb_end_pagefault(inode->i_sb);
>  	inode_unlock(inode);
> @@ -939,12 +939,12 @@ static loff_t exfat_file_llseek(struct file *file, loff_t offset, int whence)
>  	switch (whence) {
>  	case SEEK_HOLE:
>  		inode_lock_shared(inode);
> -		offset = iomap_seek_hole(inode, offset, &exfat_iomap_ops);
> +		offset = iomap_seek_hole(inode, offset, exfat_iomap_next);
>  		inode_unlock_shared(inode);
>  		break;
>  	case SEEK_DATA:
>  		inode_lock_shared(inode);
> -		offset = iomap_seek_data(inode, offset, &exfat_iomap_ops);
> +		offset = iomap_seek_data(inode, offset, exfat_iomap_next);
>  		inode_unlock_shared(inode);
>  		break;
>  	default:
> diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
> index 89826aea5e1e..a6b9aa2ad792 100644
> --- a/fs/exfat/inode.c
> +++ b/fs/exfat/inode.c
> @@ -248,7 +248,7 @@ static int exfat_read_folio(struct file *file, struct folio *folio)
>  		.ops = &exfat_iomap_bio_read_ops,
>  	};
>  
> -	iomap_read_folio(&exfat_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(exfat_iomap_next, &ctx, NULL);
>  	return 0;
>  }
>  
> @@ -269,7 +269,7 @@ static void exfat_readahead(struct readahead_control *rac)
>  	    ei->valid_size < pos + readahead_length(rac))
>  		return;
>  
> -	iomap_readahead(&exfat_iomap_ops, &ctx, NULL);
> +	iomap_readahead(exfat_iomap_next, &ctx, NULL);
>  }
>  
>  static int exfat_writepages(struct address_space *mapping,
> @@ -293,7 +293,7 @@ static sector_t exfat_aop_bmap(struct address_space *mapping, sector_t block)
>  
>  	/* exfat_get_cluster() assumes the requested blocknr isn't truncated. */
>  	down_read(&EXFAT_I(mapping->host)->truncate_lock);
> -	blocknr = iomap_bmap(mapping, block, &exfat_iomap_ops);
> +	blocknr = iomap_bmap(mapping, block, exfat_iomap_next);
>  	up_read(&EXFAT_I(mapping->host)->truncate_lock);
>  	return blocknr;
>  }
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index 8d33690a562d..6120e0758f7b 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -151,16 +151,12 @@ static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t le
>  	return __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
>  }
>  
> -static int exfat_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +int exfat_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  		struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, exfat_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops exfat_iomap_ops = {
> -	.iomap_next = exfat_iomap_next,
> -};
> -
>  /*
>   * exfat_write_iomap_end - Update the state after write
>   *
> @@ -192,17 +188,13 @@ static int exfat_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  	return written;
>  }
>  
> -static int exfat_write_iomap_next(const struct iomap_iter *iter,
> -		struct iomap *iomap, struct iomap *srcmap)
> +int exfat_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap,
>  			exfat_write_iomap_begin, exfat_write_iomap_end);
>  }
>  
> -const struct iomap_ops exfat_write_iomap_ops = {
> -	.iomap_next	= exfat_write_iomap_next,
> -};
> -
>  /*
>   * exfat_writeback_range - Map folio during writeback
>   *
> @@ -279,5 +271,5 @@ const struct iomap_read_ops exfat_iomap_bio_read_ops = {
>  int exfat_iomap_swap_activate(struct swap_info_struct *sis,
>  			       struct file *file, sector_t *span)
>  {
> -	return iomap_swapfile_activate(sis, file, span, &exfat_iomap_ops);
> +	return iomap_swapfile_activate(sis, file, span, exfat_iomap_next);
>  }
> diff --git a/fs/exfat/iomap.h b/fs/exfat/iomap.h
> index fd8a913f7794..47d7b753735e 100644
> --- a/fs/exfat/iomap.h
> +++ b/fs/exfat/iomap.h
> @@ -7,8 +7,10 @@
>  #define _LINUX_EXFAT_IOMAP_H
>  
>  extern const struct iomap_dio_ops exfat_write_dio_ops;
> -extern const struct iomap_ops exfat_iomap_ops;
> -extern const struct iomap_ops exfat_write_iomap_ops;
> +int exfat_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int exfat_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
>  extern const struct iomap_writeback_ops exfat_writeback_ops;
>  extern const struct iomap_read_ops exfat_iomap_bio_read_ops;
>  
> diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
> index 79f7b395258c..59ef8b898940 100644
> --- a/fs/ext2/ext2.h
> +++ b/fs/ext2/ext2.h
> @@ -780,7 +780,8 @@ extern const struct file_operations ext2_file_operations;
>  /* inode.c */
>  extern void ext2_set_file_ops(struct inode *inode);
>  extern const struct address_space_operations ext2_aops;
> -extern const struct iomap_ops ext2_iomap_ops;
> +int ext2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
>  
>  /* namei.c */
>  extern const struct inode_operations ext2_dir_inode_operations;
> diff --git a/fs/ext2/file.c b/fs/ext2/file.c
> index 8dca9ec4cacd..1fc00ad77517 100644
> --- a/fs/ext2/file.c
> +++ b/fs/ext2/file.c
> @@ -70,7 +70,7 @@ static ssize_t ext2_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  
>  	trace_ext2_dio_read_begin(iocb, to, 0);
>  	inode_lock_shared(inode);
> -	ret = iomap_dio_rw(iocb, to, &ext2_iomap_ops, NULL, 0, NULL, 0);
> +	ret = iomap_dio_rw(iocb, to, ext2_iomap_next, NULL, 0, NULL, 0);
>  	inode_unlock_shared(inode);
>  	trace_ext2_dio_read_end(iocb, to, ret);
>  
> @@ -134,7 +134,7 @@ static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	   (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(from), blocksize)))
>  		flags |= IOMAP_DIO_FORCE_WAIT;
>  
> -	ret = iomap_dio_rw(iocb, from, &ext2_iomap_ops, &ext2_dio_write_ops,
> +	ret = iomap_dio_rw(iocb, from, ext2_iomap_next, &ext2_dio_write_ops,
>  			   flags, NULL, 0);
>  
>  	/* ENOTBLK is magic return value for fallback to buffered-io */
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index 0693059caa35..74d5be85341d 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -860,17 +860,13 @@ ext2_iomap_end(struct inode *inode, loff_t offset, loff_t length,
>  	return 0;
>  }
>  
> -static int ext2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +int ext2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  			   struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ext2_iomap_begin,
>  			     ext2_iomap_end);
>  }
>  
> -const struct iomap_ops ext2_iomap_ops = {
> -	.iomap_next		= ext2_iomap_next,
> -};
> -
>  int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		u64 start, u64 len)
>  {
> @@ -888,7 +884,7 @@ int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	if (i_size == 0)
>  		i_size = 1;
>  	len = min_t(u64, len, i_size);
> -	ret = iomap_fiemap(inode, fieinfo, start, len, &ext2_iomap_ops);
> +	ret = iomap_fiemap(inode, fieinfo, start, len, ext2_iomap_next);
>  	inode_unlock(inode);
>  
>  	return ret;
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index b37c136ea3ab..755fde1baf03 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -4004,8 +4004,10 @@ static inline void ext4_clear_io_unwritten_flag(ext4_io_end_t *io_end)
>  		io_end->flag &= ~EXT4_IO_END_UNWRITTEN;
>  }
>  
> -extern const struct iomap_ops ext4_iomap_ops;
> -extern const struct iomap_ops ext4_iomap_report_ops;
> +int ext4_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int ext4_iomap_next_report(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
>  
>  static inline int ext4_buffer_uptodate(struct buffer_head *bh)
>  {
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 431298eca7e8..aa3c5c0915c0 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -5177,10 +5177,6 @@ static int ext4_iomap_xattr_next(const struct iomap_iter *iter,
>  	return iomap_process(iter, iomap, srcmap, ext4_iomap_xattr_begin, NULL);
>  }
>  
> -static const struct iomap_ops ext4_iomap_xattr_ops = {
> -	.iomap_next		= ext4_iomap_xattr_next,
> -};
> -
>  static int ext4_fiemap_check_ranges(struct inode *inode, u64 start, u64 *len)
>  {
>  	u64 maxbytes = ext4_get_maxbytes(inode);
> @@ -5223,10 +5219,10 @@ int ext4_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR) {
>  		fieinfo->fi_flags &= ~FIEMAP_FLAG_XATTR;
>  		error = iomap_fiemap(inode, fieinfo, start, len,
> -				     &ext4_iomap_xattr_ops);
> +				     ext4_iomap_xattr_next);
>  	} else {
>  		error = iomap_fiemap(inode, fieinfo, start, len,
> -				     &ext4_iomap_report_ops);
> +				     ext4_iomap_next_report);
>  	}
>  unlock:
>  	inode_unlock_shared(inode);
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index eb1a323962b1..dbe073e181a7 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -91,7 +91,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		return generic_file_read_iter(iocb, to);
>  	}
>  
> -	ret = iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0, NULL, 0);
> +	ret = iomap_dio_rw(iocb, to, ext4_iomap_next, NULL, 0, NULL, 0);
>  	inode_unlock_shared(inode);
>  
>  	file_accessed(iocb->ki_filp);
> @@ -119,7 +119,7 @@ static ssize_t ext4_dax_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		/* Fallback to buffered IO in case we cannot support DAX */
>  		return generic_file_read_iter(iocb, to);
>  	}
> -	ret = dax_iomap_rw(iocb, to, &ext4_iomap_ops);
> +	ret = dax_iomap_rw(iocb, to, ext4_iomap_next);
>  	inode_unlock_shared(inode);
>  
>  	file_accessed(iocb->ki_filp);
> @@ -589,7 +589,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			goto out;
>  	}
>  
> -	ret = iomap_dio_rw(iocb, from, &ext4_iomap_ops, &ext4_dio_write_ops,
> +	ret = iomap_dio_rw(iocb, from, ext4_iomap_next, &ext4_dio_write_ops,
>  			   dio_flags, NULL, 0);
>  	if (ret == -ENOTBLK)
>  		ret = 0;
> @@ -688,7 +688,7 @@ ext4_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		ext4_journal_stop(handle);
>  	}
>  
> -	ret = dax_iomap_rw(iocb, from, &ext4_iomap_ops);
> +	ret = dax_iomap_rw(iocb, from, ext4_iomap_next);
>  
>  	if (extend) {
>  		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> @@ -776,7 +776,7 @@ static vm_fault_t ext4_dax_huge_fault(struct vm_fault *vmf, unsigned int order)
>  	} else {
>  		filemap_invalidate_lock_shared(mapping);
>  	}
> -	result = dax_iomap_fault(vmf, order, &pfn, &error, &ext4_iomap_ops);
> +	result = dax_iomap_fault(vmf, order, &pfn, &error, ext4_iomap_next);
>  	if (write) {
>  		ext4_journal_stop(handle);
>  
> @@ -955,13 +955,13 @@ loff_t ext4_llseek(struct file *file, loff_t offset, int whence)
>  	case SEEK_HOLE:
>  		inode_lock_shared(inode);
>  		offset = iomap_seek_hole(inode, offset,
> -					 &ext4_iomap_report_ops);
> +					 ext4_iomap_next_report);
>  		inode_unlock_shared(inode);
>  		break;
>  	case SEEK_DATA:
>  		inode_lock_shared(inode);
>  		offset = iomap_seek_data(inode, offset,
> -					 &ext4_iomap_report_ops);
> +					 ext4_iomap_next_report);
>  		inode_unlock_shared(inode);
>  		break;
>  	}
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index cf7aa8275651..4c30dd8dbec7 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3391,7 +3391,7 @@ static sector_t ext4_bmap(struct address_space *mapping, sector_t block)
>  		filemap_write_and_wait(mapping);
>  	}
>  
> -	ret = iomap_bmap(mapping, block, &ext4_iomap_ops);
> +	ret = iomap_bmap(mapping, block, ext4_iomap_next);
>  
>  out:
>  	inode_unlock_shared(inode);
> @@ -3850,16 +3850,12 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	return 0;
>  }
>  
> -static int ext4_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +int ext4_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  			   struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ext4_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops ext4_iomap_ops = {
> -	.iomap_next		= ext4_iomap_next,
> -};
> -
>  static int ext4_iomap_begin_report(struct inode *inode, loff_t offset,
>  				   loff_t length, unsigned int flags,
>  				   struct iomap *iomap, struct iomap *srcmap)
> @@ -3911,17 +3907,13 @@ static int ext4_iomap_begin_report(struct inode *inode, loff_t offset,
>  	return 0;
>  }
>  
> -static int ext4_iomap_next_report(const struct iomap_iter *iter,
> -				  struct iomap *iomap, struct iomap *srcmap)
> +int ext4_iomap_next_report(const struct iomap_iter *iter, struct iomap *iomap,
> +			   struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ext4_iomap_begin_report,
>  			     NULL);
>  }
>  
> -const struct iomap_ops ext4_iomap_report_ops = {
> -	.iomap_next = ext4_iomap_next_report,
> -};
> -
>  /*
>   * For data=journal mode, folio should be marked dirty only when it was
>   * writeably mapped. When that happens, it was already attached to the
> @@ -3957,7 +3949,7 @@ static int ext4_iomap_swap_activate(struct swap_info_struct *sis,
>  				    struct file *file, sector_t *span)
>  {
>  	return iomap_swapfile_activate(sis, file, span,
> -				       &ext4_iomap_report_ops);
> +				       ext4_iomap_next_report);
>  }
>  
>  static const struct address_space_operations ext4_aops = {
> @@ -4204,7 +4196,7 @@ static int ext4_block_zero_range(struct inode *inode,
>  
>  	if (IS_DAX(inode)) {
>  		return dax_zero_range(inode, from, length, did_zero,
> -				      &ext4_iomap_ops);
> +				      ext4_iomap_next);
>  	} else if (ext4_should_journal_data(inode)) {
>  		return ext4_block_journalled_zero_range(inode, from, length,
>  							did_zero);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index afc9b2adaa98..9c281336c9b3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4171,6 +4171,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
>  }
>  
>  
> +
>  static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
>  {
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -4653,12 +4654,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	return 0;
>  }
>  
> -static int f2fs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> -			   struct iomap *srcmap)
> +int f2fs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		    struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, f2fs_iomap_begin, NULL);
>  }
> -
> -const struct iomap_ops f2fs_iomap_ops = {
> -	.iomap_next	= f2fs_iomap_next,
> -};
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8f3e632f315c..946a91834aec 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4216,7 +4216,8 @@ int f2fs_init_post_read_processing(void);
>  void f2fs_destroy_post_read_processing(void);
>  int f2fs_init_wq(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_wq(struct f2fs_sb_info *sbi);
> -extern const struct iomap_ops f2fs_iomap_ops;
> +int f2fs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		    struct iomap *srcmap);
>  
>  /*
>   * gc.c
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4b52c56d71f0..74514b117257 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4884,7 +4884,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	 * F2FS_DIO_READ counter will be decremented correctly in all cases.
>  	 */
>  	inc_page_count(sbi, F2FS_DIO_READ);
> -	dio = __iomap_dio_rw(iocb, to, &f2fs_iomap_ops,
> +	dio = __iomap_dio_rw(iocb, to, f2fs_iomap_next,
>  			     &f2fs_iomap_dio_read_ops, 0, NULL, 0);
>  	if (IS_ERR_OR_NULL(dio)) {
>  		ret = PTR_ERR_OR_ZERO(dio);
> @@ -5220,7 +5220,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  	dio_flags = 0;
>  	if (pos + count > inode->i_size)
>  		dio_flags |= IOMAP_DIO_FORCE_WAIT;
> -	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
> +	dio = __iomap_dio_rw(iocb, from, f2fs_iomap_next,
>  			     &f2fs_iomap_dio_write_ops, dio_flags, iocb, 0);
>  	if (IS_ERR_OR_NULL(dio)) {
>  		ret = PTR_ERR_OR_ZERO(dio);
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index e8d8c9f5d728..a6e9721552ba 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -660,10 +660,6 @@ static int fuse_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  			     fuse_iomap_end);
>  }
>  
> -static const struct iomap_ops fuse_iomap_ops = {
> -	.iomap_next = fuse_iomap_next,
> -};
> -
>  static void fuse_wait_dax_page(struct inode *inode)
>  {
>  	filemap_invalidate_unlock(inode->i_mapping);
> @@ -691,7 +687,7 @@ ssize_t fuse_dax_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		inode_lock_shared(inode);
>  	}
>  
> -	ret = dax_iomap_rw(iocb, to, &fuse_iomap_ops);
> +	ret = dax_iomap_rw(iocb, to, fuse_iomap_next);
>  	inode_unlock_shared(inode);
>  
>  	/* TODO file_accessed(iocb->f_filp) */
> @@ -746,7 +742,7 @@ ssize_t fuse_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (file_extending_write(iocb, from))
>  		ret = fuse_dax_direct_write(iocb, from);
>  	else
> -		ret = dax_iomap_rw(iocb, from, &fuse_iomap_ops);
> +		ret = dax_iomap_rw(iocb, from, fuse_iomap_next);
>  
>  out:
>  	inode_unlock(inode);
> @@ -781,7 +777,7 @@ static vm_fault_t __fuse_dax_fault(struct vm_fault *vmf, unsigned int order,
>  	 * to populate page cache or access memory we are trying to free.
>  	 */
>  	filemap_invalidate_lock_shared(inode->i_mapping);
> -	ret = dax_iomap_fault(vmf, order, &pfn, &error, &fuse_iomap_ops);
> +	ret = dax_iomap_fault(vmf, order, &pfn, &error, fuse_iomap_next);
>  	if ((ret & VM_FAULT_ERROR) && error == -EAGAIN) {
>  		error = 0;
>  		retry = true;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 5c0d400629cc..b3e95a28623d 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -896,10 +896,6 @@ static int fuse_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  	return iomap_process(iter, iomap, srcmap, fuse_iomap_begin, NULL);
>  }
>  
> -static const struct iomap_ops fuse_iomap_ops = {
> -	.iomap_next	= fuse_iomap_next,
> -};
> -
>  struct fuse_fill_read_data {
>  	struct file *file;
>  
> @@ -1020,7 +1016,7 @@ static int fuse_read_folio(struct file *file, struct folio *folio)
>  		return -EIO;
>  	}
>  
> -	iomap_read_folio(&fuse_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(fuse_iomap_next, &ctx, NULL);
>  	fuse_invalidate_atime(inode);
>  	return 0;
>  }
> @@ -1121,7 +1117,7 @@ static void fuse_readahead(struct readahead_control *rac)
>  	if (fuse_is_bad(inode))
>  		return;
>  
> -	iomap_readahead(&fuse_iomap_ops, &ctx, NULL);
> +	iomap_readahead(fuse_iomap_next, &ctx, NULL);
>  }
>  
>  static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *to)
> @@ -1553,7 +1549,7 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		 * and granular dirty tracking for large folios.
>  		 */
>  		written = iomap_file_buffered_write(iocb, from,
> -						    &fuse_iomap_ops,
> +						    fuse_iomap_next,
>  						    &fuse_iomap_write_ops,
>  						    file);
>  	} else {
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 0a7b8076af3a..66bc19c011cc 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -425,7 +425,7 @@ static int gfs2_read_folio(struct file *file, struct folio *folio)
>  
>  	if (!gfs2_is_jdata(ip) ||
>  	    (i_blocksize(inode) == PAGE_SIZE && !folio_buffers(folio))) {
> -		iomap_bio_read_folio(folio, &gfs2_iomap_ops);
> +		iomap_bio_read_folio(folio, gfs2_iomap_next);
>  	} else if (gfs2_is_stuffed(ip)) {
>  		error = stuffed_read_folio(ip, folio);
>  	} else {
> @@ -500,7 +500,7 @@ static void gfs2_readahead(struct readahead_control *rac)
>  	else if (gfs2_is_jdata(ip))
>  		mpage_readahead(rac, gfs2_block_map);
>  	else
> -		iomap_bio_readahead(rac, &gfs2_iomap_ops);
> +		iomap_bio_readahead(rac, gfs2_iomap_next);
>  }
>  
>  /**
> @@ -571,7 +571,7 @@ static sector_t gfs2_bmap(struct address_space *mapping, sector_t lblock)
>  		return 0;
>  
>  	if (!gfs2_is_stuffed(ip))
> -		dblock = iomap_bmap(mapping, lblock, &gfs2_iomap_ops);
> +		dblock = iomap_bmap(mapping, lblock, gfs2_iomap_next);
>  
>  	gfs2_glock_dq_uninit(&i_gh);
>  
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 6cb1d4513882..1b96f5622be6 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1200,17 +1200,13 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  	return 0;
>  }
>  
> -static int gfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> -			   struct iomap *srcmap)
> +int gfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		    struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, gfs2_iomap_begin,
>  			     gfs2_iomap_end);
>  }
>  
> -const struct iomap_ops gfs2_iomap_ops = {
> -	.iomap_next = gfs2_iomap_next,
> -};
> -
>  /**
>   * gfs2_block_map - Map one or more blocks of an inode to a disk block
>   * @inode: The inode
> @@ -1324,7 +1320,7 @@ static int gfs2_block_zero_range(struct inode *inode, loff_t from, loff_t length
>  	if (from >= inode->i_size)
>  		return 0;
>  	length = min(length, inode->i_size - from);
> -	return iomap_zero_range(inode, from, length, NULL, &gfs2_iomap_ops,
> +	return iomap_zero_range(inode, from, length, NULL, gfs2_iomap_next,
>  			&gfs2_iomap_write_ops, NULL);
>  }
>  
> diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
> index e3d6efdfd890..2c2b7ab39259 100644
> --- a/fs/gfs2/bmap.h
> +++ b/fs/gfs2/bmap.h
> @@ -43,7 +43,8 @@ static inline void gfs2_write_calc_reserv(const struct gfs2_inode *ip,
>  	}
>  }
>  
> -extern const struct iomap_ops gfs2_iomap_ops;
> +int gfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
>  extern const struct iomap_write_ops gfs2_iomap_write_ops;
>  extern const struct iomap_writeback_ops gfs2_writeback_ops;
>  
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index b8c10de113ba..ef5f521a46c0 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -844,7 +844,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
>  		goto out_uninit;
>  	pagefault_disable();
>  	to->nofault = true;
> -	ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL,
> +	ret = iomap_dio_rw(iocb, to, gfs2_iomap_next, NULL,
>  			   IOMAP_DIO_PARTIAL, NULL, read);
>  	to->nofault = false;
>  	pagefault_enable();
> @@ -910,7 +910,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
>  		goto out_unlock;
>  
>  	from->nofault = true;
> -	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
> +	ret = iomap_dio_rw(iocb, from, gfs2_iomap_next, NULL,
>  			   IOMAP_DIO_PARTIAL, NULL, written);
>  	from->nofault = false;
>  	if (ret <= 0) {
> @@ -1062,7 +1062,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
>  		goto out_unlock;
>  
>  	pagefault_disable();
> -	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops,
> +	ret = iomap_file_buffered_write(iocb, from, gfs2_iomap_next,
>  			&gfs2_iomap_write_ops, NULL);
>  	pagefault_enable();
>  	if (ret > 0)
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 8a77794bbd4a..737a3b6c5268 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2217,7 +2217,7 @@ static int gfs2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		goto out;
>  
>  	pagefault_disable();
> -	ret = iomap_fiemap(inode, fieinfo, start, len, &gfs2_iomap_ops);
> +	ret = iomap_fiemap(inode, fieinfo, start, len, gfs2_iomap_next);
>  	pagefault_enable();
>  
>  	gfs2_glock_dq_uninit(&gh);
> @@ -2242,7 +2242,7 @@ loff_t gfs2_seek_data(struct file *file, loff_t offset)
>  	inode_lock_shared(inode);
>  	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
>  	if (!ret)
> -		ret = iomap_seek_data(inode, offset, &gfs2_iomap_ops);
> +		ret = iomap_seek_data(inode, offset, gfs2_iomap_next);
>  	gfs2_glock_dq_uninit(&gh);
>  	inode_unlock_shared(inode);
>  
> @@ -2261,7 +2261,7 @@ loff_t gfs2_seek_hole(struct file *file, loff_t offset)
>  	inode_lock_shared(inode);
>  	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
>  	if (!ret)
> -		ret = iomap_seek_hole(inode, offset, &gfs2_iomap_ops);
> +		ret = iomap_seek_hole(inode, offset, gfs2_iomap_next);
>  	gfs2_glock_dq_uninit(&gh);
>  	inode_unlock_shared(inode);
>  
> diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
> index 1df9f28fb40b..08d5df5fb3cf 100644
> --- a/fs/hpfs/file.c
> +++ b/fs/hpfs/file.c
> @@ -162,10 +162,6 @@ static int hpfs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  	return iomap_process(iter, iomap, srcmap, hpfs_iomap_begin, NULL);
>  }
>  
> -static const struct iomap_ops hpfs_iomap_ops = {
> -	.iomap_next		= hpfs_iomap_next,
> -};
> -
>  static int hpfs_read_folio(struct file *file, struct folio *folio)
>  {
>  	return mpage_read_folio(folio, hpfs_get_block);
> @@ -242,7 +238,7 @@ static int hpfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  
>  	inode_lock(inode);
>  	len = min_t(u64, len, i_size_read(inode));
> -	ret = iomap_fiemap(inode, fieinfo, start, len, &hpfs_iomap_ops);
> +	ret = iomap_fiemap(inode, fieinfo, start, len, hpfs_iomap_next);
>  	inode_unlock(inode);
>  
>  	return ret;
> diff --git a/fs/internal.h b/fs/internal.h
> index 355d93f92208..19601f8406dc 100644
> --- a/fs/internal.h
> +++ b/fs/internal.h
> @@ -8,7 +8,6 @@
>  struct super_block;
>  struct file_system_type;
>  struct iomap;
> -struct iomap_ops;
>  struct linux_binprm;
>  struct path;
>  struct mount;
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 3f0932e46fd6..0aa8abc438c1 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -626,7 +626,7 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
>  	return 0;
>  }
>  
> -void iomap_read_folio(const struct iomap_ops *ops,
> +void iomap_read_folio(iomap_next_fn iomap_next,
>  		struct iomap_read_folio_ctx *ctx, void *private)
>  {
>  	struct folio *folio = ctx->cur_folio;
> @@ -650,7 +650,7 @@ void iomap_read_folio(const struct iomap_ops *ops,
>  		fsverity_readahead(ctx->vi, folio->index,
>  				   folio_nr_pages(folio));
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		iter.status = iomap_read_folio_iter(&iter, ctx,
>  				&bytes_submitted);
>  		iomap_read_submit(&iter, ctx);
> @@ -688,22 +688,22 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
>  
>  /**
>   * iomap_readahead - Attempt to read pages from a file.
> - * @ops: The operations vector for the filesystem.
> + * @iomap_next: The iomap_next callback for the filesystem.
>   * @ctx: The ctx used for issuing readahead.
>   * @private: The filesystem-specific information for issuing iomap_iter.
>   *
>   * This function is for filesystems to call to implement their readahead
>   * address_space operation.
>   *
> - * Context: The @ops callbacks may submit I/O (eg to read the addresses of
> + * Context: The @iomap_next callback may submit I/O (eg to read the addresses of
>   * blocks from disc), and may wait for it.  The caller may be trying to
>   * access a different page, and so sleeping excessively should be avoided.
>   * It may allocate memory, but should avoid costly allocations.  This
>   * function is called with memalloc_nofs set, so allocations will not cause
>   * the filesystem to be reentered.
>   */
> -void iomap_readahead(const struct iomap_ops *ops,
> -		struct iomap_read_folio_ctx *ctx, void *private)
> +void iomap_readahead(iomap_next_fn iomap_next, struct iomap_read_folio_ctx *ctx,
> +		void *private)
>  {
>  	struct readahead_control *rac = ctx->rac;
>  	struct iomap_iter iter = {
> @@ -725,7 +725,7 @@ void iomap_readahead(const struct iomap_ops *ops,
>  		fsverity_readahead(ctx->vi, readahead_index(rac),
>  				readahead_count(rac));
>  
> -	while (iomap_iter(&iter, ops) > 0) {
> +	while (iomap_iter(&iter, iomap_next) > 0) {
>  		iter.status = iomap_readahead_iter(&iter, ctx,
>  					&cur_bytes_submitted);
>  		iomap_read_submit(&iter, ctx);
> @@ -1268,7 +1268,7 @@ static int iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i,
>  
>  ssize_t
>  iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	struct iomap_iter iter = {
> @@ -1285,7 +1285,7 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  	if (iocb->ki_flags & IOCB_DONTCACHE)
>  		iter.flags |= IOMAP_DONTCACHE;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_write_iter(&iter, i, write_ops);
>  
>  	if (unlikely(iter.pos == iocb->ki_pos))
> @@ -1297,7 +1297,7 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  
>  int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
> -		const void *buf, const struct iomap_ops *ops,
> +		const void *buf, iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops)
>  {
>  	int			ret;
> @@ -1314,7 +1314,7 @@ int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
>  
>  	iov_iter_kvec(&iiter, WRITE, &kvec, 1, length);
>  
> -	ret = iomap_file_buffered_write(&iocb, &iiter, ops, write_ops, NULL);
> +	ret = iomap_file_buffered_write(&iocb, &iiter, iomap_next, write_ops, NULL);
>  	if (ret < 0)
>  		return ret;
>  	return ret == length ? 0 : -EIO;
> @@ -1586,7 +1586,7 @@ static int iomap_unshare_iter(struct iomap_iter *iter,
>  
>  int
>  iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops)
>  {
>  	struct iomap_iter iter = {
> @@ -1601,7 +1601,7 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		return 0;
>  
>  	iter.len = min(len, size - pos);
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_unshare_iter(&iter, write_ops);
>  	return ret;
>  }
> @@ -1710,7 +1710,7 @@ EXPORT_SYMBOL_GPL(iomap_fill_dirty_folios);
>  
>  int
>  iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	struct folio_batch fbatch;
> @@ -1735,7 +1735,7 @@ iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
>  	 */
>  	range_dirty = filemap_range_needs_writeback(mapping, iter.pos,
>  					iter.pos + iter.len - 1);
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		const struct iomap *srcmap = iomap_iter_srcmap(&iter);
>  
>  		if (!(iter.iomap.flags & IOMAP_F_FOLIO_BATCH) &&
> @@ -1761,7 +1761,7 @@ EXPORT_SYMBOL_GPL(iomap_zero_range);
>  
>  int
>  iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	unsigned int blocksize = i_blocksize(inode);
> @@ -1770,7 +1770,7 @@ iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  	/* Block boundary? Nothing to do */
>  	if (!off)
>  		return 0;
> -	return iomap_zero_range(inode, pos, blocksize - off, did_zero, ops,
> +	return iomap_zero_range(inode, pos, blocksize - off, did_zero, iomap_next,
>  			write_ops, private);
>  }
>  EXPORT_SYMBOL_GPL(iomap_truncate_page);
> @@ -1795,7 +1795,7 @@ static int iomap_folio_mkwrite_iter(struct iomap_iter *iter,
>  	return iomap_iter_advance(iter, length);
>  }
>  
> -vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
> +vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, iomap_next_fn iomap_next,
>  		void *private)
>  {
>  	struct iomap_iter iter = {
> @@ -1812,7 +1812,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
>  		goto out_unlock;
>  	iter.pos = folio_pos(folio);
>  	iter.len = ret;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_folio_mkwrite_iter(&iter, folio);
>  
>  	if (ret < 0)
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index b485e3b191da..e299d186f743 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -676,7 +676,7 @@ static int iomap_dio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
>   */
>  struct iomap_dio *
>  __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
> @@ -800,7 +800,7 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	inode_dio_begin(inode);
>  
>  	blk_start_plug(&plug);
> -	while ((ret = iomap_iter(&iomi, ops)) > 0) {
> +	while ((ret = iomap_iter(&iomi, iomap_next)) > 0) {
>  		iomi.status = iomap_dio_iter(&iomi, dio);
>  
>  		/*
> @@ -890,12 +890,12 @@ EXPORT_SYMBOL_GPL(__iomap_dio_rw);
>  
>  ssize_t
>  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before)
>  {
>  	struct iomap_dio *dio;
>  
> -	dio = __iomap_dio_rw(iocb, iter, ops, dops, dio_flags, private,
> +	dio = __iomap_dio_rw(iocb, iter, iomap_next, dops, dio_flags, private,
>  			     done_before);
>  	if (IS_ERR_OR_NULL(dio))
>  		return PTR_ERR_OR_ZERO(dio);
> diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
> index d11dadff8286..fc488f05d8ce 100644
> --- a/fs/iomap/fiemap.c
> +++ b/fs/iomap/fiemap.c
> @@ -56,7 +56,7 @@ static int iomap_fiemap_iter(struct iomap_iter *iter,
>  }
>  
>  int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
> -		u64 start, u64 len, const struct iomap_ops *ops)
> +		u64 start, u64 len, iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode		= inode,
> @@ -73,7 +73,7 @@ int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
>  	if (ret)
>  		return ret;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_fiemap_iter(&iter, fi, &prev);
>  
>  	if (prev.type != IOMAP_HOLE) {
> @@ -92,7 +92,7 @@ EXPORT_SYMBOL_GPL(iomap_fiemap);
>  /* legacy ->bmap interface.  0 is the error return (!) */
>  sector_t
>  iomap_bmap(struct address_space *mapping, sector_t bno,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode	= mapping->host,
> @@ -107,7 +107,7 @@ iomap_bmap(struct address_space *mapping, sector_t bno,
>  		return 0;
>  
>  	bno = 0;
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		if (iter.iomap.type == IOMAP_MAPPED)
>  			bno = iomap_sector(&iter.iomap, iter.pos) >> blkshift;
>  		/* leave iter.status unset to abort loop */
> diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
> index 466c491bdef6..984045af310a 100644
> --- a/fs/iomap/iter.c
> +++ b/fs/iomap/iter.c
> @@ -42,7 +42,7 @@ static inline void iomap_iter_done(struct iomap_iter *iter)
>  /**
>   * iomap_iter - iterate over a ranges in a file
>   * @iter: iteration structue
> - * @ops: iomap ops provided by the file system
> + * @iomap_next: iomap_next callback provided by the file system
>   *
>   * Iterate over filesystem-provided space mappings for the provided file range.
>   *
> @@ -54,13 +54,13 @@ static inline void iomap_iter_done(struct iomap_iter *iter)
>   * of the loop body:  leave @iter.status unchanged, or set it to a negative
>   * errno.
>   */
> -int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
> +int iomap_iter(struct iomap_iter *iter, iomap_next_fn iomap_next)
>  {
>  	int ret;
>  
> -	trace_iomap_iter(iter, ops, _RET_IP_);
> +	trace_iomap_iter(iter, iomap_next, _RET_IP_);
>  
> -	ret = ops->iomap_next(iter, &iter->iomap, &iter->srcmap);
> +	ret = iomap_next(iter, &iter->iomap, &iter->srcmap);
>  	iter->status = 0;
>  	if (ret > 0)
>  		iomap_iter_done(iter);
> diff --git a/fs/iomap/seek.c b/fs/iomap/seek.c
> index 6cbc587c93da..1bc5053d3fc1 100644
> --- a/fs/iomap/seek.c
> +++ b/fs/iomap/seek.c
> @@ -27,7 +27,7 @@ static int iomap_seek_hole_iter(struct iomap_iter *iter,
>  }
>  
>  loff_t
> -iomap_seek_hole(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
> +iomap_seek_hole(struct inode *inode, loff_t pos, iomap_next_fn iomap_next)
>  {
>  	loff_t size = i_size_read(inode);
>  	struct iomap_iter iter = {
> @@ -42,7 +42,7 @@ iomap_seek_hole(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
>  		return -ENXIO;
>  
>  	iter.len = size - pos;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_seek_hole_iter(&iter, &pos);
>  	if (ret < 0)
>  		return ret;
> @@ -73,7 +73,7 @@ static int iomap_seek_data_iter(struct iomap_iter *iter,
>  }
>  
>  loff_t
> -iomap_seek_data(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
> +iomap_seek_data(struct inode *inode, loff_t pos, iomap_next_fn iomap_next)
>  {
>  	loff_t size = i_size_read(inode);
>  	struct iomap_iter iter = {
> @@ -88,7 +88,7 @@ iomap_seek_data(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
>  		return -ENXIO;
>  
>  	iter.len = size - pos;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_seek_data_iter(&iter, &pos);
>  	if (ret < 0)
>  		return ret;
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index 0db77c449467..b8bb34deddfc 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -139,7 +139,7 @@ static int iomap_swapfile_iter(struct iomap_iter *iter,
>   */
>  int iomap_swapfile_activate(struct swap_info_struct *sis,
>  		struct file *swap_file, sector_t *pagespan,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct inode *inode = swap_file->f_mapping->host;
>  	struct iomap_iter iter = {
> @@ -163,7 +163,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	if (ret)
>  		return ret;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_swapfile_iter(&iter, &iter.iomap, &isi);
>  	if (ret < 0)
>  		return ret;
> diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
> index 1fbf832ad165..43ad597ed491 100644
> --- a/fs/ntfs/aops.c
> +++ b/fs/ntfs/aops.c
> @@ -97,7 +97,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
>  			return ntfs_read_compressed_block(folio);
>  	}
>  
> -	iomap_read_folio(&ntfs_read_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(ntfs_read_iomap_next, &ctx, NULL);
>  	return 0;
>  }
>  
> @@ -238,7 +238,7 @@ static void ntfs_readahead(struct readahead_control *rac)
>  	 */
>  	if (!NInoNonResident(ni) || NInoCompressed(ni))
>  		return;
> -	iomap_readahead(&ntfs_read_iomap_ops, &ctx, NULL);
> +	iomap_readahead(ntfs_read_iomap_next, &ctx, NULL);
>  }
>  
>  static int ntfs_writepages(struct address_space *mapping,
> @@ -274,7 +274,7 @@ static int ntfs_swap_activate(struct swap_info_struct *sis,
>  		struct file *swap_file, sector_t *span)
>  {
>  	return iomap_swapfile_activate(sis, swap_file, span,
> -			&ntfs_read_iomap_ops);
> +			ntfs_read_iomap_next);
>  }
>  
>  const struct address_space_operations ntfs_aops = {
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 6a7b638e523d..a4f99128b46c 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -281,7 +281,7 @@ static int ntfs_setattr_size(struct inode *vi, struct iattr *attr)
>  				round_up(old_size, PAGE_SIZE) - old_size,
>  				attr->ia_size - old_size);
>  		err = iomap_zero_range(vi, old_size, len,
> -				NULL, &ntfs_seek_iomap_ops,
> +				NULL, ntfs_seek_iomap_next,
>  				&ntfs_iomap_folio_ops, NULL);
>  	}
>  
> @@ -417,12 +417,12 @@ static loff_t ntfs_file_llseek(struct file *file, loff_t offset, int whence)
>  	switch (whence) {
>  	case SEEK_HOLE:
>  		inode_lock_shared(inode);
> -		offset = iomap_seek_hole(inode, offset, &ntfs_seek_iomap_ops);
> +		offset = iomap_seek_hole(inode, offset, ntfs_seek_iomap_next);
>  		inode_unlock_shared(inode);
>  		break;
>  	case SEEK_DATA:
>  		inode_lock_shared(inode);
> -		offset = iomap_seek_data(inode, offset, &ntfs_seek_iomap_ops);
> +		offset = iomap_seek_data(inode, offset, ntfs_seek_iomap_next);
>  		inode_unlock_shared(inode);
>  		break;
>  	default:
> @@ -458,7 +458,7 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		}
>  
>  		file_accessed(iocb->ki_filp);
> -		ret = iomap_dio_rw(iocb, to, &ntfs_read_iomap_ops, NULL, 0,
> +		ret = iomap_dio_rw(iocb, to, ntfs_read_iomap_next, NULL, 0,
>  				NULL, 0);
>  	} else {
>  		ret = generic_file_read_iter(iocb, to);
> @@ -496,7 +496,7 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	ssize_t ret;
>  
> -	ret = iomap_dio_rw(iocb, from, &ntfs_dio_iomap_ops,
> +	ret = iomap_dio_rw(iocb, from, ntfs_dio_iomap_next,
>  			&ntfs_write_dio_ops, 0, NULL, 0);
>  	if (ret == -ENOTBLK)
>  		ret = 0;
> @@ -511,7 +511,7 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		offset = iocb->ki_pos;
>  		iocb->ki_flags &= ~IOCB_DIRECT;
>  		written = iomap_file_buffered_write(iocb, from,
> -				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
> +				ntfs_write_iomap_next, &ntfs_iomap_folio_ops,
>  				NULL);
>  		if (written < 0) {
>  			ret = written;
> @@ -594,7 +594,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (NInoNonResident(ni) && iocb->ki_flags & IOCB_DIRECT)
>  		ret = ntfs_dio_write_iter(iocb, from);
>  	else
> -		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
> +		ret = iomap_file_buffered_write(iocb, from, ntfs_write_iomap_next,
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> @@ -623,7 +623,7 @@ static vm_fault_t ntfs_filemap_page_mkwrite(struct vm_fault *vmf)
>  	sb_start_pagefault(inode->i_sb);
>  	file_update_time(vmf->vma->vm_file);
>  
> -	ret = iomap_page_mkwrite(vmf, &ntfs_page_mkwrite_iomap_ops, NULL);
> +	ret = iomap_page_mkwrite(vmf, ntfs_page_mkwrite_iomap_next, NULL);
>  	sb_end_pagefault(inode->i_sb);
>  	return ret;
>  }
> @@ -670,7 +670,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
>  static int ntfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		u64 start, u64 len)
>  {
> -	return iomap_fiemap(inode, fieinfo, start, len, &ntfs_read_iomap_ops);
> +	return iomap_fiemap(inode, fieinfo, start, len, ntfs_read_iomap_next);
>  }
>  
>  static const char *ntfs_get_link(struct dentry *dentry, struct inode *inode,
> @@ -911,7 +911,7 @@ static int ntfs_punch_hole(struct ntfs_inode *ni, int mode, loff_t offset,
>  				   ntfs_cluster_to_bytes(vol, start_vcn + 1),
>  				   end_offset);
>  			err = iomap_zero_range(vi, offset, to - offset,
> -					       NULL, &ntfs_seek_iomap_ops,
> +					       NULL, ntfs_seek_iomap_next,
>  					       &ntfs_iomap_folio_ops, NULL);
>  			if (err < 0)
>  				goto out;
> @@ -927,7 +927,7 @@ static int ntfs_punch_hole(struct ntfs_inode *ni, int mode, loff_t offset,
>  		from = ntfs_cluster_to_bytes(vol, end_vcn - 1);
>  		if (from < ni->initialized_size) {
>  			err = iomap_zero_range(vi, from, end_offset - from,
> -					       NULL, &ntfs_seek_iomap_ops,
> +					       NULL, ntfs_seek_iomap_next,
>  					       &ntfs_iomap_folio_ops, NULL);
>  			if (err < 0)
>  				goto out;
> @@ -1131,7 +1131,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
>  					   round_up(old_size, PAGE_SIZE) - old_size,
>  					   offset - old_size);
>  			err = iomap_zero_range(vi, old_size, len, NULL,
> -					       &ntfs_seek_iomap_ops,
> +					       ntfs_seek_iomap_next,
>  					       &ntfs_iomap_folio_ops, NULL);
>  		}
>  		NInoSetFileNameDirty(ni);
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index c2715521e562..05132d92e87b 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2415,7 +2415,7 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	if (!NInoCompressed(ni) && old_init_size < offset) {
>  		err = iomap_zero_range(vi, old_init_size,
>  				       offset - old_init_size,
> -				       NULL, &ntfs_seek_iomap_ops,
> +				       NULL, ntfs_seek_iomap_next,
>  				       &ntfs_iomap_folio_ops, NULL);
>  		if (err)
>  			return err;
> diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
> index 0f9f02e1593e..502f08f01354 100644
> --- a/fs/ntfs/iomap.c
> +++ b/fs/ntfs/iomap.c
> @@ -277,16 +277,12 @@ static int ntfs_read_iomap_begin(struct inode *inode, loff_t offset, loff_t leng
>  			srcmap, true);
>  }
>  
> -static int ntfs_read_iomap_next(const struct iomap_iter *iter,
> -		struct iomap *iomap, struct iomap *srcmap)
> +int ntfs_read_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_read_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops ntfs_read_iomap_ops = {
> -	.iomap_next = ntfs_read_iomap_next,
> -};
> -
>  /*
>   * Check that the cached iomap still matches the NTFS runlist before
>   * iomap_zero_range() is called. if the runlist changes while iomap is
> @@ -342,20 +338,12 @@ static int ntfs_zero_read_iomap_next(const struct iomap_iter *iter,
>  			ntfs_zero_read_iomap_end);
>  }
>  
> -static const struct iomap_ops ntfs_zero_read_iomap_ops = {
> -	.iomap_next = ntfs_zero_read_iomap_next,
> -};
> -
> -static int ntfs_seek_iomap_next(const struct iomap_iter *iter,
> +int ntfs_seek_iomap_next(const struct iomap_iter *iter,
>  		struct iomap *iomap, struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_seek_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops ntfs_seek_iomap_ops = {
> -	.iomap_next = ntfs_seek_iomap_next,
> -};
> -
>  int ntfs_dio_zero_range(struct inode *inode, loff_t offset, loff_t length)
>  {
>  	if ((offset | length) & (SECTOR_SIZE - 1))
> @@ -373,7 +361,7 @@ static int ntfs_zero_range(struct inode *inode, loff_t offset, loff_t length)
>  	return iomap_zero_range(inode,
>  				offset, length,
>  				NULL,
> -				&ntfs_zero_read_iomap_ops,
> +				ntfs_zero_read_iomap_next,
>  				&ntfs_zero_iomap_folio_ops,
>  				NULL);
>  }
> @@ -782,17 +770,13 @@ static int ntfs_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  	return written;
>  }
>  
> -static int ntfs_write_iomap_next(const struct iomap_iter *iter,
> -		struct iomap *iomap, struct iomap *srcmap)
> +int ntfs_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_write_iomap_begin,
>  			ntfs_write_iomap_end);
>  }
>  
> -const struct iomap_ops ntfs_write_iomap_ops = {
> -	.iomap_next		= ntfs_write_iomap_next,
> -};
> -
>  static int ntfs_page_mkwrite_iomap_begin(struct inode *inode, loff_t offset,
>  				  loff_t length, unsigned int flags,
>  				  struct iomap *iomap, struct iomap *srcmap)
> @@ -801,17 +785,13 @@ static int ntfs_page_mkwrite_iomap_begin(struct inode *inode, loff_t offset,
>  			NTFS_IOMAP_FLAGS_MKWRITE);
>  }
>  
> -static int ntfs_page_mkwrite_iomap_next(const struct iomap_iter *iter,
> +int ntfs_page_mkwrite_iomap_next(const struct iomap_iter *iter,
>  		struct iomap *iomap, struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_page_mkwrite_iomap_begin,
>  			ntfs_write_iomap_end);
>  }
>  
> -const struct iomap_ops ntfs_page_mkwrite_iomap_ops = {
> -	.iomap_next		= ntfs_page_mkwrite_iomap_next,
> -};
> -
>  static int ntfs_dio_iomap_begin(struct inode *inode, loff_t offset,
>  				  loff_t length, unsigned int flags,
>  				  struct iomap *iomap, struct iomap *srcmap)
> @@ -820,17 +800,13 @@ static int ntfs_dio_iomap_begin(struct inode *inode, loff_t offset,
>  			NTFS_IOMAP_FLAGS_DIO);
>  }
>  
> -static int ntfs_dio_iomap_next(const struct iomap_iter *iter,
> -		struct iomap *iomap, struct iomap *srcmap)
> +int ntfs_dio_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_dio_iomap_begin,
>  			ntfs_write_iomap_end);
>  }
>  
> -const struct iomap_ops ntfs_dio_iomap_ops = {
> -	.iomap_next		= ntfs_dio_iomap_next,
> -};
> -
>  static ssize_t ntfs_writeback_range(struct iomap_writepage_ctx *wpc,
>  		struct folio *folio, u64 offset, unsigned int len, u64 end_pos)
>  {
> diff --git a/fs/ntfs/iomap.h b/fs/ntfs/iomap.h
> index 3abc1d493e91..69443de1fefd 100644
> --- a/fs/ntfs/iomap.h
> +++ b/fs/ntfs/iomap.h
> @@ -12,11 +12,16 @@
>  #include "volume.h"
>  #include "inode.h"
>  
> -extern const struct iomap_ops ntfs_write_iomap_ops;
> -extern const struct iomap_ops ntfs_read_iomap_ops;
> -extern const struct iomap_ops ntfs_seek_iomap_ops;
> -extern const struct iomap_ops ntfs_page_mkwrite_iomap_ops;
> -extern const struct iomap_ops ntfs_dio_iomap_ops;
> +int ntfs_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int ntfs_read_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int ntfs_seek_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int ntfs_page_mkwrite_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int ntfs_dio_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
>  extern const struct iomap_writeback_ops ntfs_writeback_ops;
>  extern const struct iomap_write_ops ntfs_iomap_folio_ops;
>  extern int ntfs_dio_zero_range(struct inode *inode, loff_t offset, loff_t length);
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index d601f088618c..55844b42920a 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -315,7 +315,7 @@ static int ntfs_extend_initialized_size(struct file *file,
>  	}
>  
>  	err = iomap_zero_range(inode, valid, new_valid - valid, NULL,
> -			       &ntfs_iomap_ops, &ntfs_iomap_folio_ops, NULL);
> +			       ntfs_iomap_next, &ntfs_iomap_folio_ops, NULL);
>  	if (err) {
>  		ni->i_valid = valid;
>  		ntfs_inode_warn(inode,
> @@ -554,7 +554,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
>  		/* Zero head of punch. */
>  		if (tmp > from) {
>  			err = iomap_zero_range(inode, from, tmp - from, NULL,
> -					       &ntfs_iomap_ops,
> +					       ntfs_iomap_next,
>  					       &ntfs_iomap_folio_ops, NULL);
>  			if (err)
>  				goto out;
> @@ -572,7 +572,7 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
>  		/* Zero tail of punch. */
>  		if (vbo < end_a && end_a < end) {
>  			err = iomap_zero_range(inode, end_a, end - end_a, NULL,
> -					       &ntfs_iomap_ops,
> +					       ntfs_iomap_next,
>  					       &ntfs_iomap_folio_ops, NULL);
>  			if (err)
>  				goto out;
> @@ -872,7 +872,7 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>  				goto out;
>  		}
>  
> -		err = iomap_dio_rw(iocb, iter, &ntfs_iomap_ops, NULL, dio_flags,
> +		err = iomap_dio_rw(iocb, iter, ntfs_iomap_next, NULL, dio_flags,
>  				   NULL, 0);
>  
>  		if (err <= 0)
> @@ -1286,7 +1286,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	    !ntfs_should_use_dio(iocb, from)) {
>  		iocb->ki_flags &= ~IOCB_DIRECT;
>  
> -		ret = iomap_file_buffered_write(iocb, from, &ntfs_iomap_ops,
> +		ret = iomap_file_buffered_write(iocb, from, ntfs_iomap_next,
>  						&ntfs_iomap_folio_ops, NULL);
>  		inode_unlock(inode);
>  
> @@ -1303,7 +1303,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			goto out;
>  	}
>  
> -	ret = iomap_dio_rw(iocb, from, &ntfs_iomap_ops, NULL,
> +	ret = iomap_dio_rw(iocb, from, ntfs_iomap_next, NULL,
>  			   IOMAP_DIO_FORCE_WAIT, NULL, 0);
>  
>  	if (ret == -ENOTBLK) {
> @@ -1316,7 +1316,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		vbo = iocb->ki_pos;
>  
>  		iocb->ki_flags &= ~IOCB_DIRECT;
> -		err = iomap_file_buffered_write(iocb, from, &ntfs_iomap_ops,
> +		err = iomap_file_buffered_write(iocb, from, ntfs_iomap_next,
>  						&ntfs_iomap_folio_ops, NULL);
>  		if (err < 0) {
>  			ret = err;
> @@ -1465,7 +1465,7 @@ int ntfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  
>  	inode_lock_shared(inode);
>  
> -	err = iomap_fiemap(inode, fieinfo, start, len, &ntfs_iomap_ops);
> +	err = iomap_fiemap(inode, fieinfo, start, len, ntfs_iomap_next);
>  
>  	inode_unlock_shared(inode);
>  	return err;
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index c5676c51a3a4..8a454ab6ee2a 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -576,7 +576,7 @@ static sector_t ntfs_bmap(struct address_space *mapping, sector_t block)
>  		ni_allocate_da_blocks(ni);
>  	}
>  
> -	return iomap_bmap(mapping, block, &ntfs_iomap_ops);
> +	return iomap_bmap(mapping, block, ntfs_iomap_next);
>  }
>  
>  static void ntfs_iomap_read_end_io(struct bio *bio)
> @@ -649,7 +649,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
>  		return err;
>  	}
>  
> -	iomap_read_folio(&ntfs_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(ntfs_iomap_next, &ctx, NULL);
>  	return 0;
>  }
>  
> @@ -673,7 +673,7 @@ static void ntfs_readahead(struct readahead_control *rac)
>  		return;
>  	}
>  
> -	iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
> +	iomap_readahead(ntfs_iomap_next, &ctx, NULL);
>  }
>  
>  int ntfs_set_size(struct inode *inode, u64 new_size)
> @@ -2101,17 +2101,13 @@ const struct address_space_operations ntfs_aops_cmpr = {
>  	.invalidate_folio = iomap_invalidate_folio,
>  };
>  
> -static int ntfs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +int ntfs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>  			   struct iomap *srcmap)
>  {
>  	return iomap_process(iter, iomap, srcmap, ntfs_iomap_begin,
>  			     ntfs_iomap_end);
>  }
>  
> -const struct iomap_ops ntfs_iomap_ops = {
> -	.iomap_next	= ntfs_iomap_next,
> -};
> -
>  const struct iomap_write_ops ntfs_iomap_folio_ops = {
>  	.put_folio = ntfs_iomap_put_folio,
>  };
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index d98d7e474476..e00dae3ce700 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -785,7 +785,8 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
>  int ntfs_link_inode(struct inode *inode, struct dentry *dentry);
>  int ntfs_unlink_inode(struct inode *dir, const struct dentry *dentry);
>  void ntfs_evict_inode(struct inode *inode);
> -extern const struct iomap_ops ntfs_iomap_ops;
> +int ntfs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		    struct iomap *srcmap);
>  extern const struct iomap_write_ops ntfs_iomap_folio_ops;
>  extern const struct inode_operations ntfs_link_inode_operations;
>  extern const struct address_space_operations ntfs_aops;
> diff --git a/fs/remap_range.c b/fs/remap_range.c
> index 26afbbbfb10c..3d0a355dc90e 100644
> --- a/fs/remap_range.c
> +++ b/fs/remap_range.c
> @@ -277,7 +277,7 @@ int
>  __generic_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  				struct file *file_out, loff_t pos_out,
>  				loff_t *len, unsigned int remap_flags,
> -				const struct iomap_ops *dax_read_ops)
> +				iomap_next_fn dax_read_next)
>  {
>  	struct inode *inode_in = file_inode(file_in);
>  	struct inode *inode_out = file_inode(file_out);
> @@ -340,10 +340,10 @@ __generic_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  		if (!IS_DAX(inode_in))
>  			ret = vfs_dedupe_file_range_compare(file_in, pos_in,
>  					file_out, pos_out, *len, &is_same);
> -		else if (dax_read_ops)
> +		else if (dax_read_next)
>  			ret = dax_dedupe_file_range_compare(inode_in, pos_in,
>  					inode_out, pos_out, *len, &is_same,
> -					dax_read_ops);
> +					dax_read_next);
>  		else
>  			return -EINVAL;
>  		if (ret)
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 2a0c54256e93..91480cb6a4d8 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -752,7 +752,7 @@ xfs_vm_bmap(
>  	 */
>  	if (xfs_is_cow_inode(ip) || XFS_IS_REALTIME_INODE(ip))
>  		return 0;
> -	return iomap_bmap(mapping, block, &xfs_read_iomap_ops);
> +	return iomap_bmap(mapping, block, xfs_read_iomap_next);
>  }
>  
>  static void
> @@ -793,7 +793,7 @@ xfs_vm_read_folio(
>  	struct iomap_read_folio_ctx	ctx = { .cur_folio = folio };
>  
>  	ctx.ops = xfs_get_iomap_read_ops(folio->mapping);
> -	iomap_read_folio(&xfs_read_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(xfs_read_iomap_next, &ctx, NULL);
>  	return 0;
>  }
>  
> @@ -804,7 +804,7 @@ xfs_vm_readahead(
>  	struct iomap_read_folio_ctx	ctx = { .rac = rac };
>  
>  	ctx.ops = xfs_get_iomap_read_ops(rac->mapping),
> -	iomap_readahead(&xfs_read_iomap_ops, &ctx, NULL);
> +	iomap_readahead(xfs_read_iomap_next, &ctx, NULL);
>  }
>  
>  static int
> @@ -850,7 +850,7 @@ xfs_vm_swap_activate(
>  	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
>  
>  	return iomap_swapfile_activate(sis, swap_file, span,
> -			&xfs_read_iomap_ops);
> +			xfs_read_iomap_next);
>  }
>  
>  const struct address_space_operations xfs_address_space_operations = {
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 7f8bef1a9954..a987ffbf3c02 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -269,7 +269,7 @@ xfs_file_dio_read(
>  		dio_ops = &xfs_dio_read_bounce_ops;
>  		dio_flags |= IOMAP_DIO_BOUNCE;
>  	}
> -	ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, dio_ops, dio_flags,
> +	ret = iomap_dio_rw(iocb, to, xfs_read_iomap_next, dio_ops, dio_flags,
>  			NULL, 0);
>  	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
>  
> @@ -292,7 +292,7 @@ xfs_file_dax_read(
>  	ret = xfs_ilock_iocb(iocb, XFS_IOLOCK_SHARED);
>  	if (ret)
>  		return ret;
> -	ret = dax_iomap_rw(iocb, to, &xfs_read_iomap_ops);
> +	ret = dax_iomap_rw(iocb, to, xfs_read_iomap_next);
>  	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
>  
>  	file_accessed(iocb->ki_filp);
> @@ -742,7 +742,7 @@ xfs_file_dio_write_aligned(
>  	struct xfs_inode	*ip,
>  	struct kiocb		*iocb,
>  	struct iov_iter		*from,
> -	const struct iomap_ops	*ops,
> +	iomap_next_fn		iomap_next,
>  	const struct iomap_dio_ops *dops,
>  	struct xfs_zone_alloc_ctx *ac)
>  {
> @@ -777,7 +777,7 @@ xfs_file_dio_write_aligned(
>  	if (mapping_stable_writes(iocb->ki_filp->f_mapping))
>  		dio_flags |= IOMAP_DIO_BOUNCE;
>  	trace_xfs_file_direct_write(iocb, from);
> -	ret = iomap_dio_rw(iocb, from, ops, dops, dio_flags, ac, 0);
> +	ret = iomap_dio_rw(iocb, from, iomap_next, dops, dio_flags, ac, 0);
>  out_unlock:
>  	xfs_iunlock(ip, iolock);
>  	return ret;
> @@ -799,7 +799,7 @@ xfs_file_dio_write_zoned(
>  	if (ret < 0)
>  		return ret;
>  	ret = xfs_file_dio_write_aligned(ip, iocb, from,
> -			&xfs_zoned_direct_write_iomap_ops,
> +			xfs_zoned_direct_write_iomap_next,
>  			&xfs_dio_zoned_write_ops, &ac);
>  	xfs_zoned_space_unreserve(ip->i_mount, &ac);
>  	return ret;
> @@ -824,16 +824,16 @@ xfs_file_dio_write_atomic(
>  	unsigned int		iolock = XFS_IOLOCK_SHARED;
>  	ssize_t			ret, ocount = iov_iter_count(from);
>  	unsigned int		dio_flags = 0;
> -	const struct iomap_ops	*dops;
> +	iomap_next_fn		dops;
>  
>  	/*
>  	 * HW offload should be faster, so try that first if it is already
>  	 * known that the write length is not too large.
>  	 */
>  	if (ocount > xfs_inode_buftarg(ip)->bt_awu_max)
> -		dops = &xfs_atomic_write_cow_iomap_ops;
> +		dops = xfs_atomic_write_cow_iomap_next;
>  	else
> -		dops = &xfs_direct_write_iomap_ops;
> +		dops = xfs_direct_write_iomap_next;
>  
>  retry:
>  	ret = xfs_ilock_iocb_for_write(iocb, &iolock);
> @@ -862,9 +862,9 @@ xfs_file_dio_write_atomic(
>  	 * possible. The REQ_ATOMIC-based method is typically not possible if
>  	 * the write spans multiple extents or the disk blocks are misaligned.
>  	 */
> -	if (ret == -ENOPROTOOPT && dops == &xfs_direct_write_iomap_ops) {
> +	if (ret == -ENOPROTOOPT && dops == xfs_direct_write_iomap_next) {
>  		xfs_iunlock(ip, iolock);
> -		dops = &xfs_atomic_write_cow_iomap_ops;
> +		dops = xfs_atomic_write_cow_iomap_next;
>  		goto retry;
>  	}
>  
> @@ -947,7 +947,7 @@ xfs_file_dio_write_unaligned(
>  		flags |= IOMAP_DIO_BOUNCE;
>  
>  	trace_xfs_file_direct_write(iocb, from);
> -	ret = iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
> +	ret = iomap_dio_rw(iocb, from, xfs_direct_write_iomap_next,
>  			   &xfs_dio_write_ops, flags, NULL, 0);
>  
>  	/*
> @@ -987,7 +987,7 @@ xfs_file_dio_write(
>  	if (iocb->ki_flags & IOCB_ATOMIC)
>  		return xfs_file_dio_write_atomic(ip, iocb, from);
>  	return xfs_file_dio_write_aligned(ip, iocb, from,
> -			&xfs_direct_write_iomap_ops, &xfs_dio_write_ops, NULL);
> +			xfs_direct_write_iomap_next, &xfs_dio_write_ops, NULL);
>  }
>  
>  static noinline ssize_t
> @@ -1011,7 +1011,7 @@ xfs_file_dax_write(
>  	pos = iocb->ki_pos;
>  
>  	trace_xfs_file_dax_write(iocb, from);
> -	ret = dax_iomap_rw(iocb, from, &xfs_dax_write_iomap_ops);
> +	ret = dax_iomap_rw(iocb, from, xfs_dax_write_iomap_next);
>  	if (ret > 0 && iocb->ki_pos > i_size_read(inode)) {
>  		i_size_write(inode, iocb->ki_pos);
>  		error = xfs_setfilesize(ip, pos, ret);
> @@ -1054,7 +1054,7 @@ xfs_file_buffered_write(
>  
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			NULL);
>  
>  	/*
> @@ -1135,7 +1135,7 @@ xfs_file_buffered_write_zoned(
>  retry:
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			&ac);
>  	if (ret == -ENOSPC && !cleared_space) {
>  		/*
> @@ -1856,10 +1856,10 @@ xfs_file_llseek(
>  	default:
>  		return generic_file_llseek(file, offset, whence);
>  	case SEEK_HOLE:
> -		offset = iomap_seek_hole(inode, offset, &xfs_seek_iomap_ops);
> +		offset = iomap_seek_hole(inode, offset, xfs_seek_iomap_next);
>  		break;
>  	case SEEK_DATA:
> -		offset = iomap_seek_data(inode, offset, &xfs_seek_iomap_ops);
> +		offset = iomap_seek_data(inode, offset, xfs_seek_iomap_next);
>  		break;
>  	}
>  
> @@ -1883,8 +1883,8 @@ xfs_dax_fault_locked(
>  	}
>  	ret = dax_iomap_fault(vmf, order, &pfn, NULL,
>  			(write_fault && !vmf->cow_page) ?
> -				&xfs_dax_write_iomap_ops :
> -				&xfs_read_iomap_ops);
> +				xfs_dax_write_iomap_next :
> +				xfs_read_iomap_next);
>  	if (ret & VM_FAULT_NEEDDSYNC)
>  		ret = dax_finish_sync_fault(vmf, order, pfn);
>  	return ret;
> @@ -1948,7 +1948,7 @@ __xfs_write_fault(
>  	if (IS_DAX(inode))
>  		ret = xfs_dax_fault_locked(vmf, order, true);
>  	else
> -		ret = iomap_page_mkwrite(vmf, &xfs_buffered_write_iomap_ops,
> +		ret = iomap_page_mkwrite(vmf, xfs_buffered_write_iomap_next,
>  				ac);
>  	xfs_iunlock(ip, lock_mode);
>  
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 4fa1a5c985db..71c4bb024f04 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -1037,7 +1037,7 @@ xfs_direct_write_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_direct_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1047,10 +1047,6 @@ xfs_direct_write_iomap_next(
>  			NULL);
>  }
>  
> -const struct iomap_ops xfs_direct_write_iomap_ops = {
> -	.iomap_next		= xfs_direct_write_iomap_next,
> -};
> -
>  #ifdef CONFIG_XFS_RT
>  /*
>   * This is really simple.  The space has already been reserved before taking the
> @@ -1099,7 +1095,7 @@ xfs_zoned_direct_write_iomap_begin(
>  	return 0;
>  }
>  
> -static int
> +int
>  xfs_zoned_direct_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1109,9 +1105,6 @@ xfs_zoned_direct_write_iomap_next(
>  			xfs_zoned_direct_write_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_zoned_direct_write_iomap_ops = {
> -	.iomap_next		= xfs_zoned_direct_write_iomap_next,
> -};
>  #endif /* CONFIG_XFS_RT */
>  
>  #ifdef DEBUG
> @@ -1294,7 +1287,7 @@ xfs_atomic_write_cow_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_atomic_write_cow_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1304,10 +1297,6 @@ xfs_atomic_write_cow_iomap_next(
>  			xfs_atomic_write_cow_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_atomic_write_cow_iomap_ops = {
> -	.iomap_next		= xfs_atomic_write_cow_iomap_next,
> -};
> -
>  static int
>  xfs_dax_write_iomap_end(
>  	struct inode		*inode,
> @@ -1328,7 +1317,7 @@ xfs_dax_write_iomap_end(
>  	return xfs_reflink_end_cow(ip, pos, written);
>  }
>  
> -static int
> +int
>  xfs_dax_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1338,10 +1327,6 @@ xfs_dax_write_iomap_next(
>  			xfs_dax_write_iomap_end);
>  }
>  
> -const struct iomap_ops xfs_dax_write_iomap_ops = {
> -	.iomap_next	= xfs_dax_write_iomap_next,
> -};
> -
>  /*
>   * Convert a hole to a delayed allocation.
>   */
> @@ -2207,7 +2192,7 @@ xfs_buffered_write_iomap_end(
>  	return 0;
>  }
>  
> -static int
> +int
>  xfs_buffered_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2218,10 +2203,6 @@ xfs_buffered_write_iomap_next(
>  			xfs_buffered_write_iomap_end);
>  }
>  
> -const struct iomap_ops xfs_buffered_write_iomap_ops = {
> -	.iomap_next		= xfs_buffered_write_iomap_next,
> -};
> -
>  static int
>  xfs_read_iomap_begin(
>  	struct inode		*inode,
> @@ -2263,7 +2244,7 @@ xfs_read_iomap_begin(
>  				 shared ? IOMAP_F_SHARED : 0, seq);
>  }
>  
> -static int
> +int
>  xfs_read_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2272,10 +2253,6 @@ xfs_read_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_read_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_read_iomap_ops = {
> -	.iomap_next		= xfs_read_iomap_next,
> -};
> -
>  static int
>  xfs_seek_iomap_begin(
>  	struct inode		*inode,
> @@ -2360,7 +2337,7 @@ xfs_seek_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_seek_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2369,10 +2346,6 @@ xfs_seek_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_seek_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_seek_iomap_ops = {
> -	.iomap_next		= xfs_seek_iomap_next,
> -};
> -
>  static int
>  xfs_xattr_iomap_begin(
>  	struct inode		*inode,
> @@ -2416,7 +2389,7 @@ xfs_xattr_iomap_begin(
>  	return xfs_bmbt_to_iomap(ip, iomap, &imap, flags, IOMAP_F_XATTR, seq);
>  }
>  
> -static int
> +int
>  xfs_xattr_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2425,10 +2398,6 @@ xfs_xattr_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_xattr_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_xattr_iomap_ops = {
> -	.iomap_next		= xfs_xattr_iomap_next,
> -};
> -
>  int
>  xfs_zero_range(
>  	struct xfs_inode	*ip,
> @@ -2443,9 +2412,9 @@ xfs_zero_range(
>  
>  	if (IS_DAX(inode))
>  		return dax_zero_range(inode, pos, len, did_zero,
> -				      &xfs_dax_write_iomap_ops);
> +				      xfs_dax_write_iomap_next);
>  	return iomap_zero_range(inode, pos, len, did_zero,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			ac);
>  }
>  
> @@ -2460,8 +2429,8 @@ xfs_truncate_page(
>  
>  	if (IS_DAX(inode))
>  		return dax_truncate_page(inode, pos, did_zero,
> -					&xfs_dax_write_iomap_ops);
> +					xfs_dax_write_iomap_next);
>  	return iomap_truncate_page(inode, pos, did_zero,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			ac);
>  }
> diff --git a/fs/xfs/xfs_iomap.h b/fs/xfs/xfs_iomap.h
> index ebcce7d49446..01875d20fb66 100644
> --- a/fs/xfs/xfs_iomap.h
> +++ b/fs/xfs/xfs_iomap.h
> @@ -49,14 +49,22 @@ xfs_aligned_fsb_count(
>  	return count_fsb;
>  }
>  
> -extern const struct iomap_ops xfs_buffered_write_iomap_ops;
> -extern const struct iomap_ops xfs_direct_write_iomap_ops;
> -extern const struct iomap_ops xfs_zoned_direct_write_iomap_ops;
> -extern const struct iomap_ops xfs_read_iomap_ops;
> -extern const struct iomap_ops xfs_seek_iomap_ops;
> -extern const struct iomap_ops xfs_xattr_iomap_ops;
> -extern const struct iomap_ops xfs_dax_write_iomap_ops;
> -extern const struct iomap_ops xfs_atomic_write_cow_iomap_ops;
> +int xfs_buffered_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_direct_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_zoned_direct_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_read_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_seek_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_xattr_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_dax_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_atomic_write_cow_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
>  extern const struct iomap_write_ops xfs_iomap_write_ops;
>  
>  #endif /* __XFS_IOMAP_H__*/
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 6339f4956ecb..5c3d9a365f93 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1239,10 +1239,10 @@ xfs_vn_fiemap(
>  	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR) {
>  		fieinfo->fi_flags &= ~FIEMAP_FLAG_XATTR;
>  		error = iomap_fiemap(inode, fieinfo, start, length,
> -				&xfs_xattr_iomap_ops);
> +				xfs_xattr_iomap_next);
>  	} else {
>  		error = iomap_fiemap(inode, fieinfo, start, length,
> -				&xfs_read_iomap_ops);
> +				xfs_read_iomap_next);
>  	}
>  	xfs_iunlock(XFS_I(inode), XFS_IOLOCK_SHARED);
>  
> diff --git a/fs/xfs/xfs_reflink.c b/fs/xfs/xfs_reflink.c
> index a5c188b78138..2b9792626bab 100644
> --- a/fs/xfs/xfs_reflink.c
> +++ b/fs/xfs/xfs_reflink.c
> @@ -1683,7 +1683,7 @@ xfs_reflink_remap_prep(
>  				pos_out, len, remap_flags);
>  	else
>  		ret = dax_remap_file_range_prep(file_in, pos_in, file_out,
> -				pos_out, len, remap_flags, &xfs_read_iomap_ops);
> +				pos_out, len, remap_flags, xfs_read_iomap_next);
>  	if (ret || *len == 0)
>  		goto out_unlock;
>  
> @@ -1878,10 +1878,10 @@ xfs_reflink_unshare(
>  
>  	if (IS_DAX(inode))
>  		error = dax_file_unshare(inode, offset, len,
> -				&xfs_dax_write_iomap_ops);
> +				xfs_dax_write_iomap_next);
>  	else
>  		error = iomap_file_unshare(inode, offset, len,
> -				&xfs_buffered_write_iomap_ops,
> +				xfs_buffered_write_iomap_next,
>  				&xfs_iomap_write_ops);
>  	if (error)
>  		goto out;
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index a29a8756d660..3ef1a655dbfe 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -64,10 +64,6 @@ static int zonefs_read_iomap_next(const struct iomap_iter *iter,
>  			     NULL);
>  }
>  
> -static const struct iomap_ops zonefs_read_iomap_ops = {
> -	.iomap_next	= zonefs_read_iomap_next,
> -};
> -
>  static int zonefs_write_iomap_begin(struct inode *inode, loff_t offset,
>  				    loff_t length, unsigned int flags,
>  				    struct iomap *iomap, struct iomap *srcmap)
> @@ -120,19 +116,15 @@ static int zonefs_write_iomap_next(const struct iomap_iter *iter,
>  			     NULL);
>  }
>  
> -static const struct iomap_ops zonefs_write_iomap_ops = {
> -	.iomap_next	= zonefs_write_iomap_next,
> -};
> -
>  static int zonefs_read_folio(struct file *unused, struct folio *folio)
>  {
> -	iomap_bio_read_folio(folio, &zonefs_read_iomap_ops);
> +	iomap_bio_read_folio(folio, zonefs_read_iomap_next);
>  	return 0;
>  }
>  
>  static void zonefs_readahead(struct readahead_control *rac)
>  {
> -	iomap_bio_readahead(rac, &zonefs_read_iomap_ops);
> +	iomap_bio_readahead(rac, zonefs_read_iomap_next);
>  }
>  
>  /*
> @@ -193,7 +185,7 @@ static int zonefs_swap_activate(struct swap_info_struct *sis,
>  	}
>  
>  	return iomap_swapfile_activate(sis, swap_file, span,
> -				       &zonefs_read_iomap_ops);
> +				       zonefs_read_iomap_next);
>  }
>  
>  const struct address_space_operations zonefs_file_aops = {
> @@ -323,7 +315,7 @@ static vm_fault_t zonefs_filemap_page_mkwrite(struct vm_fault *vmf)
>  
>  	/* Serialize against truncates */
>  	filemap_invalidate_lock_shared(inode->i_mapping);
> -	ret = iomap_page_mkwrite(vmf, &zonefs_write_iomap_ops, NULL);
> +	ret = iomap_page_mkwrite(vmf, zonefs_write_iomap_next, NULL);
>  	filemap_invalidate_unlock_shared(inode->i_mapping);
>  
>  	sb_end_pagefault(inode->i_sb);
> @@ -539,7 +531,7 @@ static ssize_t zonefs_file_dio_write(struct kiocb *iocb, struct iov_iter *from)
>  	 * page invalidation. Overwrite that error code with EBUSY so that
>  	 * the user can make sense of the error.
>  	 */
> -	ret = iomap_dio_rw(iocb, from, &zonefs_write_iomap_ops,
> +	ret = iomap_dio_rw(iocb, from, zonefs_write_iomap_next,
>  			   &zonefs_write_dio_ops, 0, NULL, 0);
>  	if (ret == -ENOTBLK)
>  		ret = -EBUSY;
> @@ -589,7 +581,7 @@ static ssize_t zonefs_file_buffered_write(struct kiocb *iocb,
>  	if (ret <= 0)
>  		goto inode_unlock;
>  
> -	ret = iomap_file_buffered_write(iocb, from, &zonefs_write_iomap_ops,
> +	ret = iomap_file_buffered_write(iocb, from, zonefs_write_iomap_next,
>  			NULL, NULL);
>  	if (ret == -EIO)
>  		zonefs_io_error(inode, true);
> @@ -684,7 +676,7 @@ static ssize_t zonefs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  			goto inode_unlock;
>  		}
>  		file_accessed(iocb->ki_filp);
> -		ret = iomap_dio_rw(iocb, to, &zonefs_read_iomap_ops,
> +		ret = iomap_dio_rw(iocb, to, zonefs_read_iomap_next,
>  				   &zonefs_read_dio_ops, 0, NULL, 0);
>  	} else {
>  		ret = generic_file_read_iter(iocb, to);
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index fe6c3ded1b50..a5a88f5186bf 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_DAX_H
>  
>  #include <linux/fs.h>
> +#include <linux/iomap.h>
>  #include <linux/mm.h>
>  #include <linux/radix-tree.h>
>  
> @@ -10,9 +11,6 @@ typedef unsigned long dax_entry_t;
>  
>  struct dax_device;
>  struct gendisk;
> -struct iomap_ops;
> -struct iomap_iter;
> -struct iomap;
>  
>  enum dax_access_mode {
>  	DAX_ACCESS,
> @@ -213,11 +211,11 @@ static inline void dax_unlock_mapping_entry(struct address_space *mapping,
>  #endif
>  
>  int dax_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  
>  static inline bool dax_page_is_idle(struct page *page)
>  {
> @@ -266,10 +264,10 @@ int dax_holder_notify_failure(struct dax_device *dax_dev, u64 off, u64 len,
>  void dax_flush(struct dax_device *dax_dev, void *addr, size_t size);
>  
>  ssize_t dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  vm_fault_t dax_iomap_fault(struct vm_fault *vmf, unsigned int order,
>  			unsigned long *pfnp, int *errp,
> -			const struct iomap_ops *ops);
> +			iomap_next_fn iomap_next);
>  vm_fault_t dax_finish_sync_fault(struct vm_fault *vmf,
>  		unsigned int order, unsigned long pfn);
>  int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index);
> @@ -288,11 +286,11 @@ void dax_break_layout_final(struct inode *inode);
>  int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  				  struct inode *dest, loff_t destoff,
>  				  loff_t len, bool *is_same,
> -				  const struct iomap_ops *ops);
> +				  iomap_next_fn iomap_next);
>  int dax_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  			      struct file *file_out, loff_t pos_out,
>  			      loff_t *len, unsigned int remap_flags,
> -			      const struct iomap_ops *ops);
> +			      iomap_next_fn iomap_next);
>  static inline bool dax_mapping(struct address_space *mapping)
>  {
>  	return mapping->host && IS_DAX(mapping->host);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index d10897b3a1e3..2eb063438a3b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -70,7 +70,8 @@ struct fsnotify_mark_connector;
>  struct fs_context;
>  struct fs_parameter_spec;
>  struct file_kattr;
> -struct iomap_ops;
> +struct iomap_iter;
> +struct iomap;
>  struct delegated_inode;
>  
>  extern void __init inode_init(void);
> @@ -2079,7 +2080,9 @@ int remap_verify_area(struct file *file, loff_t pos, loff_t len, bool write);
>  int __generic_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  				    struct file *file_out, loff_t pos_out,
>  				    loff_t *len, unsigned int remap_flags,
> -				    const struct iomap_ops *dax_read_ops);
> +				    int (*dax_read_next)(const struct iomap_iter *iter,
> +							 struct iomap *iomap,
> +							 struct iomap *srcmap));
>  int generic_remap_file_range_prep(struct file *file_in, loff_t pos_in,
>  				  struct file *file_out, loff_t pos_out,
>  				  loff_t *count, unsigned int remap_flags);
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 52d6f585b941..3b41f123a92d 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -237,12 +237,6 @@ typedef int (*iomap_end_fn)(struct inode *inode, loff_t pos, loff_t length,
>  typedef int (*iomap_next_fn)(const struct iomap_iter *iter, struct iomap *iomap,
>  		struct iomap *srcmap);
>  
> -struct iomap_ops {
> -	iomap_begin_fn iomap_begin;
> -	iomap_end_fn iomap_end;
> -	iomap_next_fn iomap_next;
> -};
> -
>  /**
>   * struct iomap_iter - Iterate through a range of a file
>   * @inode: Set at the start of the iteration and should not change.
> @@ -271,7 +265,7 @@ struct iomap_iter {
>  	void *private;
>  };
>  
> -int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops);
> +int iomap_iter(struct iomap_iter *iter, iomap_next_fn iomap_next);
>  int iomap_iter_advance(struct iomap_iter *iter, u64 count);
>  
>  /**
> @@ -365,14 +359,14 @@ static inline bool iomap_want_unshare_iter(const struct iomap_iter *iter)
>  }
>  
>  ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private);
>  int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
> -		const void *buf, const struct iomap_ops *ops,
> +		const void *buf, iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops);
> -void iomap_read_folio(const struct iomap_ops *ops,
> +void iomap_read_folio(iomap_next_fn iomap_next,
>  		struct iomap_read_folio_ctx *ctx, void *private);
> -void iomap_readahead(const struct iomap_ops *ops,
> +void iomap_readahead(iomap_next_fn iomap_next,
>  		struct iomap_read_folio_ctx *ctx, void *private);
>  bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
>  struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len);
> @@ -380,17 +374,17 @@ bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
>  void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
>  bool iomap_dirty_folio(struct address_space *mapping, struct folio *folio);
>  int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops);
>  unsigned int iomap_fill_dirty_folios(struct iomap_iter *iter, loff_t *start,
>  		loff_t end, unsigned int *iomap_flags);
>  int iomap_zero_range(struct inode *inode, loff_t pos, loff_t len,
> -		bool *did_zero, const struct iomap_ops *ops,
> +		bool *did_zero, iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private);
>  int iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private);
> -vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
> +vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, iomap_next_fn iomap_next,
>  		void *private);
>  typedef void (*iomap_punch_t)(struct inode *inode, loff_t offset, loff_t length,
>  		struct iomap *iomap);
> @@ -399,13 +393,13 @@ void iomap_write_delalloc_release(struct inode *inode, loff_t start_byte,
>  		iomap_punch_t punch);
>  
>  int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
> -		u64 start, u64 len, const struct iomap_ops *ops);
> +		u64 start, u64 len, iomap_next_fn iomap_next);
>  loff_t iomap_seek_hole(struct inode *inode, loff_t offset,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  loff_t iomap_seek_data(struct inode *inode, loff_t offset,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  sector_t iomap_bmap(struct address_space *mapping, sector_t bno,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  
>  /*
>   * Flags for iomap_ioend->io_flags.
> @@ -612,10 +606,10 @@ struct iomap_dio_ops {
>  #define IOMAP_DIO_BOUNCE		(1 << 4)
>  
>  ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before);
>  struct iomap_dio *__iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before);
>  ssize_t iomap_dio_complete(struct iomap_dio *dio);
>  void iomap_dio_bio_end_io(struct bio *bio);
> @@ -626,7 +620,7 @@ struct swap_info_struct;
>  
>  int iomap_swapfile_activate(struct swap_info_struct *sis,
>  		struct file *swap_file, sector_t *pagespan,
> -		const struct iomap_ops *ops);
> +		iomap_next_fn iomap_next);
>  #else
>  # define iomap_swapfile_activate(sis, swapfile, pagespan, ops)	(-EIO)
>  #endif /* CONFIG_SWAP */
> @@ -640,25 +634,25 @@ int iomap_bio_read_folio_range(const struct iomap_iter *iter,
>  extern const struct iomap_read_ops iomap_bio_read_ops;
>  
>  static inline void iomap_bio_read_folio(struct folio *folio,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_read_folio_ctx ctx = {
>  		.ops		= &iomap_bio_read_ops,
>  		.cur_folio	= folio,
>  	};
>  
> -	iomap_read_folio(ops, &ctx, NULL);
> +	iomap_read_folio(iomap_next, &ctx, NULL);
>  }
>  
>  static inline void iomap_bio_readahead(struct readahead_control *rac,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_read_folio_ctx ctx = {
>  		.ops		= &iomap_bio_read_ops,
>  		.rac		= rac,
>  	};
>  
> -	iomap_readahead(ops, &ctx, NULL);
> +	iomap_readahead(iomap_next, &ctx, NULL);
>  }
>  #endif /* CONFIG_BLOCK */
>  
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

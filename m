Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6176EA7E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 15:33:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRYSR-0004e8-Ep;
	Thu, 03 Aug 2023 13:33:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qRYSQ-0004e2-2N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=du0Z70X155ISlaXGxW4wp6Y48mig4odO4voIGMDl2xk=; b=N3N04QrDa5fBLIbE6Mt1iH7F+E
 OxJt+22flyd2kg11xlitJ2O9LyLbjQ6z87nht7jOqhODLNauiq1f6RxiQ4dUPzhkGGlbO6LxsQZPj
 KPS6XAprBYAkTo+MohKH57T9n6D8amx0YGcPWdC3y+RawPEyGwj1K6Szr+AmvfCoIEdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=du0Z70X155ISlaXGxW4wp6Y48mig4odO4voIGMDl2xk=; b=jU9GmnDoLuww181mxNJTwBOXFA
 BqmRw/7W6eiQyL3LVi4hHkMdohHATR9LmiBgx8XubXp1FgGqA2fVpT7VBYUIJ1SLBGC8kj/Tl5oD1
 id5vRMbIoym0rwjM4m7EU2vlv2WpXbqMmoe2TUXQE/Ftt9VDVhtD4pdJReGz+IeGovx4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRYSP-0006Pa-89 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 13:33:38 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0427421905;
 Thu,  3 Aug 2023 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691069611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=du0Z70X155ISlaXGxW4wp6Y48mig4odO4voIGMDl2xk=;
 b=WSThLGh5TEJlC2zqxUr829BXGh9BB964D/DpAf80OivGVyDFjKi8qi3yL2jZmX2XVxeHql
 0TKeSDcOHnYIT4J24RhGZYydOnwkzEiWP2/UykyXLONZlsOKV3dQWpzTpXbJZJZ88qyNor
 7GCVNVcrD3BsRADBFqYCtXRYyEu/TnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691069611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=du0Z70X155ISlaXGxW4wp6Y48mig4odO4voIGMDl2xk=;
 b=bFFXY2fQpz4y83Dou+dieZJmMgc/fDw9xHqvionrKHFPePEk3QgCOGG9fcv6pv8LVaYKVs
 6FTlW6XPrhE8WQAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E52E2134B0;
 Thu,  3 Aug 2023 13:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lOHrN6qsy2QWcwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 03 Aug 2023 13:33:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 80941A076B; Thu,  3 Aug 2023 15:33:30 +0200 (CEST)
Date: Thu, 3 Aug 2023 15:33:30 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803133330.dstks7aogjogqdd5@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-7-hch@lst.de>
 <20230803115131.w6hbhjvvkqnv4qbq@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803115131.w6hbhjvvkqnv4qbq@quack3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 03-08-23 13:51:31, Jan Kara wrote: > On Wed 02-08-23
 17:41:25, Christoph Hellwig wrote: > > The file system type is not a very
 useful holder as it doesn't allow us > > to go back to the actual [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRYSP-0006Pa-89
Subject: Re: [f2fs-dev] [PATCH 06/12] fs: use the super_block as holder when
 mounting file systems
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 03-08-23 13:51:31, Jan Kara wrote:
> On Wed 02-08-23 17:41:25, Christoph Hellwig wrote:
> > The file system type is not a very useful holder as it doesn't allow us
> > to go back to the actual file system instance.  Pass the super_block instead
> > which is useful when passed back to the file system driver.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Nice, this is what I also wanted to eventually do :). Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

As a side note, after this patch we can also remove bdev->bd_super and
transition the two real users (mark_buffer_write_io_error() and two places
in ocfs2) to use bd_holder. Ext4 also uses bd_super but there it is really
pointless as we have the superblock directly available in that function
anyway.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

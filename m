Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99078B56A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 18:36:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qafDT-0000Oe-SH;
	Mon, 28 Aug 2023 16:35:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qafDS-0000OY-Pv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 16:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ck2GGOGhROLqsyobrCo5kdF6UPRkrbdxAmY4z9IUuok=; b=X0ums9x0gnXs4OlrtH7SX/vYsW
 ei3OznWxenGShA3P/rBsQ6oVb1AkT6Q+/3sPJVJd+38LHaVRY7Y4Sa1y6rrgdZCA+9b17n6LX0vCM
 1zz2mvQUehEWwhBktHA1Xz/5kBcFpfQ5oI2p1LqbpvFiT15tlNZI0XdJ9IHYkpakqPqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ck2GGOGhROLqsyobrCo5kdF6UPRkrbdxAmY4z9IUuok=; b=NLGnQAQJNmKcW06MEGGjoyGZT9
 9CqnsPcnSuXPit2yZeyR9+5gzzEIyR8wKaWFs4rTir/YvrJh/oCGisH+vbf8Mt3HGYJ4oYSPJnick
 HANHcxC0TJenA3GlEXDPqtbrIbQlK47Qo2YYkYyqaKJiMG0b422VZyjyyvPnRKPLrOKg=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qafDO-000vwA-5i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 16:35:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6EEA1FD65;
 Mon, 28 Aug 2023 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693240535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ck2GGOGhROLqsyobrCo5kdF6UPRkrbdxAmY4z9IUuok=;
 b=EtZzfSgJjiUXpAjtdYKvjMgJ0OZ4Q3hodxxDiiqMsvgYkWHBqZPn8b6HaeiQAJEHW5Uuko
 06HJR2ONdPdonWFc4Fxv/j1G2uH9dZxPNi9bmg/g7/MdjPYaFrmy0koVHOGYl0yF9ECUFU
 dvX53BpZP+akCxXPwoDv8WIm+8J4QE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693240535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ck2GGOGhROLqsyobrCo5kdF6UPRkrbdxAmY4z9IUuok=;
 b=gCDBzKEA8PtUwSuSbwhvUT0MqIp/q0xNdnkg7D4y2kSiwFqCax1L5bOi3yUguxVHz9AwG5
 nCbyIQ5cQ+9obfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8255139CC;
 Mon, 28 Aug 2023 16:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wwPfMNfM7GQmJQAAMHmgww
 (envelope-from <jack@suse.cz>); Mon, 28 Aug 2023 16:35:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3050AA0774; Mon, 28 Aug 2023 18:35:35 +0200 (CEST)
Date: Mon, 28 Aug 2023 18:35:35 +0200
From: Jan Kara <jack@suse.cz>
To: Chao Yu <chao@kernel.org>
Message-ID: <20230828163535.s7gnbmgzmsrqdpkt@quack3>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230823104857.11437-23-jack@suse.cz>
 <1388dd5e-8d66-6f88-25d1-f563d7c366d6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1388dd5e-8d66-6f88-25d1-f563d7c366d6@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 28-08-23 20:57:53, Chao Yu wrote: > On 2023/8/23 18:48,
 Jan Kara wrote: > > Convert f2fs to use bdev_open_by_dev/path() and pass
 the handle around. > > Hi Jan, > > Seems it will confilct w/ bel [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qafDO-000vwA-5i
Subject: Re: [f2fs-dev] [PATCH 23/29] f2fs: Convert to
 bdev_open_by_dev/path()
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
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 28-08-23 20:57:53, Chao Yu wrote:
> On 2023/8/23 18:48, Jan Kara wrote:
> > Convert f2fs to use bdev_open_by_dev/path() and pass the handle around.
> 
> Hi Jan,
> 
> Seems it will confilct w/ below commit, could you please take a look?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=51bf8d3c81992ae57beeaf22df78ed7c2782af9d

Yes, it will conflict. But I don't plan to rush these patches into the
currently running merge window so I can just rebase after the f2fs patch
gets upstream. Thanks for the heads up.

								Honza

> > CC: Jaegeuk Kim <jaegeuk@kernel.org>
> > CC: Chao Yu <chao@kernel.org>
> > CC: linux-f2fs-devel@lists.sourceforge.net
> > Acked-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >   fs/f2fs/f2fs.h  |  1 +
> >   fs/f2fs/super.c | 17 +++++++++--------
> >   2 files changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e18272ae3119..2ec6c10df636 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1234,6 +1234,7 @@ struct f2fs_bio_info {
> >   #define FDEV(i)				(sbi->devs[i])
> >   #define RDEV(i)				(raw_super->devs[i])
> >   struct f2fs_dev_info {
> > +	struct bdev_handle *bdev_handle;
> >   	struct block_device *bdev;
> >   	char path[MAX_PATH_LEN];
> >   	unsigned int total_segments;
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index aa1f9a3a8037..885dcbd81859 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1561,7 +1561,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
> >   	int i;
> >   	for (i = 0; i < sbi->s_ndevs; i++) {
> > -		blkdev_put(FDEV(i).bdev, sbi->sb);
> > +		bdev_release(FDEV(i).bdev_handle);
> >   #ifdef CONFIG_BLK_DEV_ZONED
> >   		kvfree(FDEV(i).blkz_seq);
> >   #endif
> > @@ -4196,9 +4196,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
> >   		if (max_devices == 1) {
> >   			/* Single zoned block device mount */
> > -			FDEV(0).bdev =
> > -				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
> > -						  sbi->sb, NULL);
> > +			FDEV(0).bdev_handle = bdev_open_by_dev(
> > +					sbi->sb->s_bdev->bd_dev, mode, sbi->sb,
> > +					NULL);
> >   		} else {
> >   			/* Multi-device mount */
> >   			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
> > @@ -4216,12 +4216,13 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
> >   					(FDEV(i).total_segments <<
> >   					sbi->log_blocks_per_seg) - 1;
> >   			}
> > -			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
> > -							  sbi->sb, NULL);
> > +			FDEV(i).bdev_handle = bdev_open_by_path(FDEV(i).path,
> > +					mode, sbi->sb, NULL);
> >   		}
> > -		if (IS_ERR(FDEV(i).bdev))
> > -			return PTR_ERR(FDEV(i).bdev);
> > +		if (IS_ERR(FDEV(i).bdev_handle))
> > +			return PTR_ERR(FDEV(i).bdev_handle);
> > +		FDEV(i).bdev = FDEV(i).bdev_handle->bdev;
> >   		/* to release errored devices */
> >   		sbi->s_ndevs = i + 1;
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

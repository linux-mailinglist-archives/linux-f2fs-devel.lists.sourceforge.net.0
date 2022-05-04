Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076E51B04A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 23:19:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmMOo-00022d-Dw; Wed, 04 May 2022 21:19:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dsterba@suse.cz>) id 1nmMOm-00022X-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 21:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=npPu7v4PVxjYw5k81v34byZcxUoLWsQ8uewcVPzgU3Y=; b=JR6HH3cs8V2M1CVKWotf7XTkas
 qUkMrYE6zG8YeR8wvHXX0HpmL7a+rpkFv5coyhsbVfn506Xj2Nf1HTSExlgGtYZtrVwEDMKex4oFo
 I2mhrY4FXsjBxKQ60R8zuyrSAYJSxOkEG/aMIIawsYMFrCdf+XRRid3leUcjY7T/SZ1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=npPu7v4PVxjYw5k81v34byZcxUoLWsQ8uewcVPzgU3Y=; b=PbUlQKJoSQCW7ePADpwgaaHwld
 je+m8aaBC5eT2NpdN2CnK1ZbcyoJKZsbbm8X4u1fWFNGQXpCnkgfFKxU65hCUlyrDWH+G71PAw6to
 H2Nguy4iAWVjdKC+MO9iCAI8o3HPctuPcE7S1/75dYWv3OVVvcV+MU9F4D7GXuTRIK6I=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nmMOh-001T3s-4b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 21:19:03 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BABED210E5;
 Wed,  4 May 2022 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651699132;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=npPu7v4PVxjYw5k81v34byZcxUoLWsQ8uewcVPzgU3Y=;
 b=tM1dspGpfMipCiAbW0HO2dZVPEAgyrff0KMavj6bZk8T37R9hRgCKrWvzwgeAGT0wBlOIm
 ubeLZ7ieBvBdZyh1MDcuOhs1j09imPderIadxrCmq/Rsm19BAfVTGh1hT5vsADF9X2YLOS
 su7DARpA5vqfoa0MkPB71ULlFqjV3/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651699132;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=npPu7v4PVxjYw5k81v34byZcxUoLWsQ8uewcVPzgU3Y=;
 b=vS6Y/NRPgUhS2xB+r59V5ZgrZyl8A56t3CcwGyemIqz6M8o7VVvzu6uPNAFvfQz1MtnccG
 5x8uPy6F8/V4gpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B60DD131BD;
 Wed,  4 May 2022 21:18:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ptTKKrvtcmJMMQAAMHmgww
 (envelope-from <dsterba@suse.cz>); Wed, 04 May 2022 21:18:51 +0000
Date: Wed, 4 May 2022 23:14:40 +0200
From: David Sterba <dsterba@suse.cz>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <20220504211440.GU18596@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Pankaj Raghav <p.raghav@samsung.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "hch@lst.de" <hch@lst.de>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>,
 "chao@kernel.org" <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>,
 "agk@redhat.com" <agk@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "kch@nvidia.com" <kch@nvidia.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "jiangbo.365@bytedance.com" <jiangbo.365@bytedance.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Matias =?iso-8859-1?Q?Bj=F8rling?= <Matias.Bjorling@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
References: <CGME20220427160256eucas1p2db2b58792ffc93026d870c260767da14@eucas1p2.samsung.com>
 <20220427160255.300418-1-p.raghav@samsung.com>
 <PH0PR04MB74167FC8BA634A3DA09586489BC19@PH0PR04MB7416.namprd04.prod.outlook.com>
 <a702c7f7-9719-9f3e-63de-1e96f2912432@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a702c7f7-9719-9f3e-63de-1e96f2912432@samsung.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 03, 2022 at 11:12:04AM +0200,
 Pankaj Raghav wrote:
 > Hi Johannes, > On 2022-05-03 00:07, Johannes Thumshirn wrote: > >> There
 was an effort previously [1] to add support to non po2 devices [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nmMOh-001T3s-4b
Subject: Re: [f2fs-dev] [PATCH 00/16] support non power of 2 zoned devices
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
Reply-To: dsterba@suse.cz
Cc: "jiangbo.365@bytedance.com" <jiangbo.365@bytedance.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "clm@fb.com" <clm@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "hch@lst.de" <hch@lst.de>, "agk@redhat.com" <agk@redhat.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>,
 "kch@nvidia.com" <kch@nvidia.com>, "snitzer@kernel.org" <snitzer@kernel.org>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dsterba@suse.com" <dsterba@suse.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Matias =?iso-8859-1?Q?Bj=F8rling?= <Matias.Bjorling@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>, "axboe@kernel.dk" <axboe@kernel.dk>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 03, 2022 at 11:12:04AM +0200, Pankaj Raghav wrote:
> Hi Johannes,
> On 2022-05-03 00:07, Johannes Thumshirn wrote:
> >> There was an effort previously [1] to add support to non po2 devices via
> >> device level emulation but that was rejected with a final conclusion
> >> to add support for non po2 zoned device in the complete stack[2].
> > 
> > Hey Pankaj,
> > 
> > One thing I'm concerned with this patches is, once we have npo2 zones (or to be precise 
> > not fs_info->sectorsize aligned zones) we have to check on every allocation if we still 
> > have at least have fs_info->sectorsize bytes left in a zone. If not we need to 
> > explicitly finish the zone, otherwise we'll run out of max active zones. 
> > 
> This commit: `btrfs: zoned: relax the alignment constraint for zoned
> devices` makes sure the zone size is BTRFS_STRIPE_LEN aligned (64K). So
> even the npo2 zoned device should be aligned to `fs_info->sectorsize`,
> which is typically 4k.
> 
> This was one of the comment that came from David Sterba:
> https://lore.kernel.org/all/20220315142740.GU12643@twin.jikos.cz/
> where he suggested to have some sane alignment for the zone sizes.

My idea of 'sane' value would be 1M, that we have 4K for sectors is
because of the 1:1 mapping to pages, but RAM sizes are on a different
scale than storage devices. The 4K is absolute minimum but if the page
size is taken as a basic constraint, ARM has 64K and there are some 256K
arches.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

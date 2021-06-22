Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5C3AFA4D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 02:44:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvUWx-0004ri-Hk; Tue, 22 Jun 2021 00:44:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lvUWv-0004rX-S3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 00:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4e8XLjWobcJqQzXV5OAgSzPbZdKPOl4gG9+yWjIl68U=; b=JbRb1t1CzrCIwDTTLCLFs6fFdY
 polNG0WQFTMBgkGJ1HARxAJ2eLZT+rPX+m+ANijWHnxe0aGyFoOa42zA9AePcO6WLa8IGm5SSkjAe
 taclfFmij7NX5TvlpMbeya7rWuo2+40o1ri0hCWrua7d0KNbr922mNuoUWqTX0cQxFLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4e8XLjWobcJqQzXV5OAgSzPbZdKPOl4gG9+yWjIl68U=; b=RAR6SJ5YjBumdoOuvrMZZunk3x
 3OZuF0zruxRFRzR+1eUEM1iuT09Gs+dOgdAtTCZUtLdEpqqqf6wJ3/TBS5dJr54E+py3I/cgTNwkh
 fsX4XoAYn1+477h902bEG8s538pD+wKWolqmY6HtlQ/DoKwfg0vlh/1UdUagalUQz71s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvUWm-0003IM-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 00:44:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3B4961245;
 Tue, 22 Jun 2021 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624322662;
 bh=2RP2X+m65Nr99q59bea69jsh5nbUda5kJywZCm6lzQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYNJ6YrG3mCCq1CLiQVhf9Q1z4f//GZsvDDtM+OxJP+7pH+cal1ChVuUDyrdETxPo
 kE3mvm42Z+BEFv6gbqoBPzZqsS8I1UpTMcWEsEVa9YL7yfbbnWXdDorxTdWNMi3LZk
 z3vKcrx7G1N/lIw82XEvA1AYE1V9ihTkr4y3dXmf8q6oMTxgfy4dTxQVbQ06MyA41W
 2h4lhC+nvCxVg8ywU0Jgf50N5kYcevqL7ahbZ1+t7UxUMwB7dR/kngwvTj64NpMXLB
 ElBt7K1J9lOot67dPLBs+drAHaAiGgP/B80NC68PfVQri31dtRhcapHGv6CVASHL9n
 qshvkGilC2zdw==
Date: Mon, 21 Jun 2021 17:44:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
Message-ID: <YNEyZcqB69Tkuu5Q@google.com>
References: <20210616192558.1655258-1-aravind.ramesh@wdc.com>
 <BYAPR04MB405637307829953851645A098C0A9@BYAPR04MB4056.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR04MB405637307829953851645A098C0A9@BYAPR04MB4056.namprd04.prod.outlook.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lvUWm-0003IM-Rt
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 06/21, Aravind Ramesh wrote:
> Hello Kim,
> 
> Could you please pull this ? 
> I will send a v2 if any review comments are there, please let me know.

I queued this in -dev which will go into -master later.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev&id=b750268dafec5a59716b9aec606dc18a9cbdae70

Thanks,

> 
> Thanks,
> Aravind
> 
> > -----Original Message-----
> > From: Aravind Ramesh <aravind.ramesh@wdc.com>
> > Sent: Thursday, June 17, 2021 12:56 AM
> > To: linux-f2fs-devel@lists.sourceforge.net
> > Cc: jaegeuk@kernel.org; Aravind Ramesh <Aravind.Ramesh@wdc.com>
> > Subject: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with zoned block
> > device zones
> > 
> > For a volume using a zoned block device without conventional zones (e.g. a NVMe
> > ZNS drive), a regular block device must be used to store metadata so that in-place
> > metadata writes can be executed. The zoned block device cannot contain any
> > metadata blocks requiring in-place update (e.g. bitmap blocks). When formatting a
> > volume that contains host managed zoned block devices, make sure that the
> > conventional device used to store metadata is large enough to avoid write errors.
> > 
> > Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> > ---
> >  mkfs/f2fs_format.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c index 3565bd3..2132852
> > 100644
> > --- a/mkfs/f2fs_format.c
> > +++ b/mkfs/f2fs_format.c
> > @@ -440,6 +440,21 @@ static int f2fs_prepare_super_block(void)
> >  					main_blkzone);
> >  			return -1;
> >  		}
> > +		/*
> > +		 * Check if conventional device has enough space
> > +		 * to accommodate all metadata, zoned device should
> > +		 * not overlap to metadata area.
> > +		 */
> > +		for (i = 1; i < c.ndevs; i++) {
> > +			if (c.devices[i].zoned_model == F2FS_ZONED_HM &&
> > +				c.devices[i].start_blkaddr < get_sb(main_blkaddr))
> > {
> > +				MSG(0, "\tError: Conventional device %s is too
> > small,"
> > +					" (%"PRIu64" MiB needed).\n",
> > c.devices[0].path,
> > +					(get_sb(main_blkaddr) -
> > +					c.devices[i].start_blkaddr) >> 8);
> > +				return -1;
> > +			}
> > +		}
> >  	}
> > 
> >  	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
> > --
> > 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

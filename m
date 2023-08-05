Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6B3770ED4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Aug 2023 10:36:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSClv-0006ar-US;
	Sat, 05 Aug 2023 08:36:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qSClu-0006aN-29
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 08:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zX+yAwxxXXeDB9MLA4OJTL2/Dp/CPy6h0+KrCbKhYSQ=; b=k7g+Z1DU5+drU7HUYMv6IknomA
 gf9mSg91slOt/0nc2eLrTZHNQ6VXJzwEdciLCZ0qjenKWRV6T9AZH706mPLnWfd3+cyMOI/gV59Zu
 SkZ4BmEGvLeBj9lnCBoUtDZoQLW9wfoVgPfQKNzggPJlhUO9JAvOHxJnS00yjzTOWrtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zX+yAwxxXXeDB9MLA4OJTL2/Dp/CPy6h0+KrCbKhYSQ=; b=iynrFnZVXkT3sp9nAugV1zh5eI
 +vCuklX2buQqtqs9pRtvot/Q95jqKwI+B2f74Od9juAepgJD2Dxi0+y92KU8AmI4h6bIGYWXGwvu0
 4wETnlu+z+Ea5Lhx1BR7Y8frMCRRk1ZKmmByCS66TmYdc33OHmtx6dYod22AdSyadKi8=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSClu-0001Iy-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 08:36:27 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 981B468AA6; Sat,  5 Aug 2023 10:36:17 +0200 (CEST)
Date: Sat, 5 Aug 2023 10:36:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230805083617.GB29780@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-7-hch@lst.de>
 <20230803115131.w6hbhjvvkqnv4qbq@quack3>
 <20230803133330.dstks7aogjogqdd5@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803133330.dstks7aogjogqdd5@quack3>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 03, 2023 at 03:33:30PM +0200, Jan Kara wrote:
 > As a side note, after this patch we can also remove bdev->bd_super and >
 transition the two real users (mark_buffer_write_io_error() and two [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qSClu-0001Iy-Fj
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
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, linux-nilfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 03, 2023 at 03:33:30PM +0200, Jan Kara wrote:
> As a side note, after this patch we can also remove bdev->bd_super and
> transition the two real users (mark_buffer_write_io_error() and two places
> in ocfs2) to use bd_holder. Ext4 also uses bd_super but there it is really
> pointless as we have the superblock directly available in that function
> anyway.

I actually have a series to kill bd_super, but it uses b_assoc_map
as the replacement, as nothing in buffer.c should poke into the holder
and the buffer_head codes uses b_assoc_map a lot anyway.  Let me rebase
it and send it out.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

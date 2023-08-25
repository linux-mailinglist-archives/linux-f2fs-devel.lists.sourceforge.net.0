Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017F788768
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 14:30:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZVxW-0003SJ-35;
	Fri, 25 Aug 2023 12:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qZVxS-0003SC-9f
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 12:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPd+xvPExLRNAvP+l5Wn+EPtfb4r1aRb/yTbtm54RWM=; b=DGyoZ1OUe2yL4w4pysvki9Msjm
 iuGfAtfv0deQI5zn/u62xqwSo0eaF4gvf+Gh5sYDecBm+oABpP7tiUA+ggOyVy0MIXUB8UhPjR0LH
 FlU9L/OB12R9d2LH6/HNqeqpU/W1WGMsocTMhjp1NcJJ22sxsiNhULY0i7765jQQJBC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NPd+xvPExLRNAvP+l5Wn+EPtfb4r1aRb/yTbtm54RWM=; b=jEJhuok99VPFkX4PAs0+WjE3bU
 uhkvsW7YDLZ5Nx7HziVnVoNqkX91h5jQekkL2ef2Dlq/6IQ1Lo+PYW1S/79p5GmBZZnL5DnQEKeGl
 ZNOiE9mmS/rbpf3BifBewi/UgChFjAa/AqJXOO7kh4d6surCvHsCIOsqhL6D/DpkVxRY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZVxQ-00FE2t-S8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 12:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7676267B90;
 Fri, 25 Aug 2023 12:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8004C433C9;
 Fri, 25 Aug 2023 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692966625;
 bh=YllMQsUv14IXcAV5eXi5Bkkkb4eHZRqaRVsvNBAoLlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGsV9oyBhqmEqmboUScP7GRsXXfMR9TqANIi5mr5dUFcT65MSCDGKtuxy2CS54cH1
 cqRJ29ZmcwRtuClxZx1FFk2vGFa8ZmPDLwkwpzl8Dp9LixE/E3bzwfi2a7jw4f7SO6
 Jhhg9hNJ+pf+Aln4mJxUMvAkp7V7PVNmieW+z0J91Hbjv6CStPv2g74s+XzJGxwGW2
 GUOeS2AzXpgWXl7CYpZxWDdTtkYCRnaMhGP1KxD3oEhJ9cRdo+pYnkZ4XBJG1Q4XxV
 bnjbLCNqqmsfHvBB6WDXzmEmdtXpYV2Zfl1XnqC4Rqx1plNlqUjOUFEq4sGYqWftex
 slovSrrs/SCCg==
Date: Fri, 25 Aug 2023 14:30:21 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230825-kaschieren-gespreizt-7d246803ae8f@brauner>
References: <20230818123232.2269-1-jack@suse.cz>
 <20230823104857.11437-23-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823104857.11437-23-jack@suse.cz>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 23, 2023 at 12:48:34PM +0200, Jan Kara wrote:
 > Convert f2fs to use bdev_open_by_dev/path() and pass the handle around.
 > > CC: Jaegeuk Kim <jaegeuk@kernel.org> > CC: Chao Yu <chao@kernel. [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZVxQ-00FE2t-S8
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
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 23, 2023 at 12:48:34PM +0200, Jan Kara wrote:
> Convert f2fs to use bdev_open_by_dev/path() and pass the handle around.
> 
> CC: Jaegeuk Kim <jaegeuk@kernel.org>
> CC: Chao Yu <chao@kernel.org>
> CC: linux-f2fs-devel@lists.sourceforge.net
> Acked-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

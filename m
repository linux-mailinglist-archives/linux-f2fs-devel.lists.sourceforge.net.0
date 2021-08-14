Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BF3EC177
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 10:53:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEpQM-0002yM-Pd; Sat, 14 Aug 2021 08:53:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+f92b0dcacd1ebb3841ba+6565+infradead.org+hch@casper.srs.infradead.org>)
 id 1mEpQK-0002xj-6L
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 08:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QYtBZcQe1AYKFmFlbIK09tv77w22darIoGRUI9QRx4Q=; b=dz49Q/0mJjrId56ovXWohcIG58
 RnGK0B3n6/kcozaG35DnKJLGg133TgEUEXbgeI3TRg+G6zNDOOQiH240WXhgaowZS3v7MuMbjzI9F
 rVJyrke+0xQZ2crOZF/w5U/NYvhshDGmuKGT/L35DWjKz7/VaWBxJwfvc2NppGj7RAvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QYtBZcQe1AYKFmFlbIK09tv77w22darIoGRUI9QRx4Q=; b=mOS9CnOQbNoIGyOncDbJqJuJz6
 wL97Lp/eWTfPuhyi5dVLXDyfLPV7U+ZMeVVDDGG7UnKU8ZzgEllF5jQn/zS3ffvQTjCj23HRWhyne
 db1ZVhGRr7xFKrtbMKjAwLRCn6B68fpVYqDcbuH+EM/D4o7u2A3WkONzVz3C6QH5hyag=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEpQH-005t3s-S0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 08:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QYtBZcQe1AYKFmFlbIK09tv77w22darIoGRUI9QRx4Q=; b=h8VSaeKeTYKSUjNY2+l/UHQ+hH
 f76xrh1QUEmye8pmdbUDzToCSsMGGiAZ4xmxxAJsqcQ219C5QxCPU0HYdXxEuZE0y0CbN3MGsqNOt
 d0PTDgfgmqjh/cII/Tnj9BjS6H1epuL1VyGBkXZK6p6wg/xBs0l6ZolEugo80fd2kbGb3dsoIs88f
 3SY91mqS1QRY2SxzwIZQ1cReuyXfhPjzXtGbu0ORczogDVGacAtveaAucXMWehWfP3sFto2niuJmJ
 c4l64TiUm1GbMS9nvSzVk/a6PBYDmbzSYOCS6iTB5I3qrJUyZV43B5whiyuzOXWjWODrIGOTthy0D
 0qjhj08Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mEpPN-00GYAD-K5; Sat, 14 Aug 2021 08:53:03 +0000
Date: Sat, 14 Aug 2021 09:52:49 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <YReEYTPl5ErJNiyj@infradead.org>
References: <20210813123221.185591-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813123221.185591-1-frank.li@vivo.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mEpQH-005t3s-S0
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce
 proc/fs/f2fs/<dev>/fsck_stack node
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Please don't add new non-process files to procfs.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

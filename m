Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F601815737
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Dec 2023 05:12:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEM2Z-0003sT-1t;
	Sat, 16 Dec 2023 04:12:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1rEM2W-0003sN-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 04:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kRU4cn2DRyLUD/bI43KtM26WoUSlojIWqOSiVAfHiMA=; b=aXx26e4Vwrpoe+YbqTGvrmppy1
 NDoaB+GMgtC8roOagyYyDJGxIg468xdI8+Xq86w8uFSZCI9eyM9r8yvFuMbnZQdvW+jzP+Gq0Szn5
 vjSLGs47cEHAVoz4o6K8XRbUEH566S2yGw1xJ21F0WiMEcddUCHx2sCC7POrDz0YYzss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kRU4cn2DRyLUD/bI43KtM26WoUSlojIWqOSiVAfHiMA=; b=P6fp9ICMjZhzXlRonnqo/fet9W
 NVRuzIst//Y1VKkfnHsuiUaECOzNg+WLgguIAiADV2yTsPVi+e5I9Wktd1dKH73pgbTWKL6GrYU0u
 afAZoXxRkU1fl0W3tZCVBH3hxT+8o+Xo4TNDhs26eFx7wgfFF39VeEuxT477rAohWoeU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEM2V-0000Fo-34 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 04:12:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id ED12168B05; Sat, 16 Dec 2023 05:12:21 +0100 (CET)
Date: Sat, 16 Dec 2023 05:12:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>
Message-ID: <20231216041221.GA8850@lst.de>
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-2-ebiggers@kernel.org> <20231213084123.GA6184@lst.de>
 <20231215214550.GB883762@perftesting>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215214550.GB883762@perftesting>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 15, 2023 at 04:45:50PM -0500, Josef Bacik wrote:
 > I ran it through, you broke a test that isn't upstream yet to test the
 old mount > api double mount thing that I have a test for > > http [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEM2V-0000Fo-34
Subject: Re: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 15, 2023 at 04:45:50PM -0500, Josef Bacik wrote:
> I ran it through, you broke a test that isn't upstream yet to test the old mount
> api double mount thing that I have a test for
> 
> https://github.com/btrfs/fstests/commit/2796723e77adb0f9da1059acf13fc402467f7ac4
> 
> In this case we end up leaking a reference on the fs_devices.  If you add this
> fixup to "btrfs: call btrfs_close_devices from ->kill_sb" it fixes that failure.
> I'm re-running with that fixup applied, but I assume the rest is fine.  Thanks,

Is "this fixup" referring to a patch that was supposed to be attached
but is't? :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

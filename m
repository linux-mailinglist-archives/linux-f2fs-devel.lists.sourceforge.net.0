Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD510EDBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2019 18:04:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibp76-0002QC-LJ; Mon, 02 Dec 2019 17:03:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+af820ec67e46c55c3660+5944+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ibp75-0002Q6-PV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 17:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Bog2FcHzbVHTGABIFboxW3D8q+dKfFuUFtGCAvbJN8=; b=LGI/UaMvNwHDmO/nnUslWIJMvd
 WLHhI8acbcDpjGq/tr9Dg1xbCbWR6qZ696xEGvzpc5M9AH6ii3cBD1+KAr3bkMH1HKZRSH8JzhKK9
 ianKr2taJEj9QaSj5irGcS8aEj9evWhegVG/WJYBzd6ssLCZwEjZicVBVrOiXM3C2mtc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Bog2FcHzbVHTGABIFboxW3D8q+dKfFuUFtGCAvbJN8=; b=k8ettU2RY+gwwEJfry1MH2g6nT
 iFQTtPbOdx6kjqXwM6IAoAzW5M7L61gMN6y2ZSqZ6LJC9eHboziu4Zv8WsviM517dXUVqqlus+OF7
 vinv8zOMVyEMJjdrGEipfENqX/Jwm5i4lwf/Gf1nGmR9BGLGCDj45WoqLDcrVGBvjM9M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ibp74-00HSBl-AX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 17:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Bog2FcHzbVHTGABIFboxW3D8q+dKfFuUFtGCAvbJN8=; b=SbCAbqhl8BRByWXfNxrs1pif9
 h1kuXOWtY5KlKFGagbhiuSkdoQ8JTC3tVkOtyn7IDbslxfoLacwaCo9JhBbnclgHD6EiMIarWctt4
 BmfhVDD8DdqCJwKvltRp77ZzUz2+t7BrAuuxTADLlgCvFrdC/Sw6UFGWmY9MucMUflWd6YH2SCb49
 AxZksLP9TKMgCA7M/p3ge6FA0nY77A+fBYDdZGQY/B1xIiUwbDL9leZ9CoKm16Tz2b47hwQQuu16T
 sjQENJmZI8qWH53Ebo13NhIo60AsJeRUiBsd0r2yUYqFXTj3rTafZNTQvNrBDM/sFqG0ix3JICDw2
 Ya7gGk/lw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibp57-000150-Vc; Mon, 02 Dec 2019 17:01:53 +0000
Date: Mon, 2 Dec 2019 09:01:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Message-ID: <20191202170153.GA2870@infradead.org>
References: <20191129163300.14749-1-ira.weiny@intel.com>
 <20191129163300.14749-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129163300.14749-3-ira.weiny@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ibp74-00HSBl-AX
Subject: Re: [f2fs-dev] [PATCH V3 2/3] fs: Move swap_[de]activate to
 file_operations
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While the patch itself looks fine, I kinda disagree with the rationale.
If we want different ops for DAX that applies to file operations just
as much as to the address space operations.

However I agree that the ops are logically a better fit for the file
operations, so:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

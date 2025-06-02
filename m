Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E5ACB913
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 17:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEFS+t7j/TiUfwJfdQdr6eAvQRmEFrdk9ieM54vaVIc=; b=a68M3FWSCzbr+tC3PZ7k2PVjI3
	L9ls/dJA/vQjqQjY5wZiytvYJa+TKySZLJvkxYPAQj5j8ntgnf3unc9fufn5D+47hjSTYhfE/Njce
	V00dB1S0STith4Rd0mMWFG/t6DXl37HTVynSgA21C09Zrl4oeblBEnCPRvbWpT3gf1GI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM7Vb-0004O2-D0;
	Mon, 02 Jun 2025 15:55:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM7VT-0004Nj-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 15:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2UdPStub+NFoWMWSmyIpI1lJVzeSgYs1uOJPL4D/yjc=; b=dxqJCvng3TguevU83cObYhVpF2
 bqajMbPcZwqNRoOHS6LNPUYYQCKifae2dA/nmfhKvrsXmyLQiY08M0muW3KOiTqF3F3nnSqhzrif0
 8D3xvydHyk86zFRsdJIFe8xC0peniPMEDobA4T26J+TJ71fDDL+lME7xf3oBY52wor/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2UdPStub+NFoWMWSmyIpI1lJVzeSgYs1uOJPL4D/yjc=; b=ACGwt1aw3Kt9BxC8kzfSu8jVfN
 z3rFTYZk3EQgQCySxExy0nvVFjo/kL1F5biCtw1jzkYC27KTCOFm0XvqXK5czO20dwhPg/01p/ZkT
 ZMPUTgZLUMTh+tF++Ix7w6J5OA5UvkdSfIhiaw3ge119XL2xKA3dXGheqk2PuTGHiGoM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM7VS-0007cv-O2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 15:55:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 17D6168C7B; Mon,  2 Jun 2025 17:55:07 +0200 (CEST)
Date: Mon, 2 Jun 2025 17:55:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bernd Schubert <bernd@bsbernd.com>
Message-ID: <20250602155506.GA29981@lst.de>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea@epcas5p4.samsung.com>
 <20250529111504.89912-11-kundan.kumar@samsung.com>
 <20250602142157.GC21996@lst.de>
 <99f79383-479e-4df1-9650-61fa3c600171@bsbernd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99f79383-479e-4df1-9650-61fa3c600171@bsbernd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 02, 2025 at 05:50:48PM +0200,
 Bernd Schubert wrote:
 > > Same here. On pattern is that fuse and nfs both touch the node stat >
 > and the web stat, and having a common helper doing both woul [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uM7VS-0007cv-O2
Subject: Re: [f2fs-dev] [PATCH 10/13] fuse: add support for multiple
 writeback contexts in fuse
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 Christoph Hellwig <hch@lst.de>, Joanne Koong <joannelkoong@gmail.com>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 02, 2025 at 05:50:48PM +0200, Bernd Schubert wrote:
> > Same here.  On pattern is that fuse and nfs both touch the node stat
> > and the web stat, and having a common helper doing both would probably
> > also be very helpful.
> > 
> > 
> 
> Note that Miklos' PR for 6.16 removes NR_WRITEBACK_TEMP through
> patches from Joanne, i.e. only 
> 
> dec_wb_stat(&bdi->wb, WB_WRITEBACK);
> 
> is left over.

That'll make it even easier to consolidate with the NFS version.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

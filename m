Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BB603518
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 23:46:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okuPT-0004BS-BV;
	Tue, 18 Oct 2022 21:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1okuPS-0004BM-8C
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 21:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdhpXUGCkMu8VcqIxNAyDKuYCRrF5O3PB114YzTZo88=; b=fRd2/VZoJaTtAUnLaVjEEUrrm1
 9glA89pD5mvGKNOMKY1pDjiu6bsBs/3KDdkGTdC2yGlPwglV2Ftr1xoj0oAcE5bABxGBQcA8K0PgG
 GnlKW+YgjHzQt3OJearWy8uwHn/GSgf9eCkZ+EmcHDWAnGkDB+aEAnoJK5AcSexdHJZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rdhpXUGCkMu8VcqIxNAyDKuYCRrF5O3PB114YzTZo88=; b=HQnb0iEgDXe+ouVuRgtFOLST46
 JEWYyiH4bSX7vgoOa2HC+3S8wedaVDe3C5mt/6I8HYbjt7GDdyHGo6IsOtDyu5/68NK7he6DfoTp9
 WAbgZmDo6JxKSCIyMBg0hXh+ay+CHXxWVUujFhUas5828ntNjgd1H3TT66Fk0DP39Ihs=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1okuPO-008sS5-HC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 21:46:02 +0000
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au
 [49.181.106.210])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 3E48911021F6;
 Wed, 19 Oct 2022 08:45:46 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1okuPA-003bsw-Bg; Wed, 19 Oct 2022 08:45:44 +1100
Date: Wed, 19 Oct 2022 08:45:44 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221018214544.GI2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=634f1e8b
 a=j6JUzzrSC7wlfFge/rmVbg==:117 a=j6JUzzrSC7wlfFge/rmVbg==:17
 a=kj9zAlcOel0A:10 a=Qawa6l4ZSaYA:10 a=7-415B0cAAAA:8
 a=A9Ajo3xi_aTsyj5e4eYA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 01, 2022 at 03:01:15PM -0700,
 Vishal Moola (Oracle)
 wrote: > This patch series replaces find_get_pages_range_tag() with >
 filemap_get_folios_tag().
 This also allows the removal of multiple [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [211.29.132.249 listed in list.dnswl.org]
X-Headers-End: 1okuPO-008sS5-HC
Subject: Re: [f2fs-dev] [PATCH 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 01, 2022 at 03:01:15PM -0700, Vishal Moola (Oracle) wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
> 
> F2fs and Ceph have quite alot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
> 
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial.

Well, that answers my question about how filesystems that enable
multi-page folios were tested: they weren't. 

I'd suggest that anyone working on further extending the
filemap/folio infrastructure really needs to be testing XFS as a
first priority, and then other filesystems as a secondary concern.

That's because XFS (via the fs/iomap infrastructure) is one of only
3 filesystems in the kernel (AFS and tmpfs are the others) that
interact with the page cache and page cache "pages" solely via folio
interfaces. As such they are able to support multi-page folios in
the page cache. All of the tested filesystems still use the fixed
PAGE_SIZE page interfaces to interact with the page cache, so they
don't actually exercise interactions with multi-page folios at all.

Hence if you are converting generic infrastructure that looks up
pages in the page cache to look up folios in the page cache, the
code that processes the returned folios also needs to be updated and
validated to ensure that it correctly handles multi-page folios. And
the only way you can do that fully at this point in time is via
testing XFS or AFS...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

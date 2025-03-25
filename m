Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931BA70869
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 18:47:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx8MX-0005VJ-Ex;
	Tue, 25 Mar 2025 17:46:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tx8MW-0005VC-5q
 for Linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 17:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wokuoGqypkRW+N7f3s/ZfDKHdz0JBnoTTfAJnAbSOb8=; b=ZxNcWPv2J0wdcthHAbGLmo/lMZ
 ep1GsYduiqbODlXOp2apR+gzANjtn7p+tOgA+sXYh/IP04lkgW8pNGvblDeraVsug5o0lMsFuJ4cK
 bcZR6Ar9jYgokzj5MG5G5Wbm9d6LVdehWxPV8EMxgAoqYPxiZA+ts9aRww3q2bx9Q8hY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wokuoGqypkRW+N7f3s/ZfDKHdz0JBnoTTfAJnAbSOb8=; b=foz0zYIq+4kf/ZKA3bQjsgAgIP
 Gzd8w6MRQz1BscGzeXEiR517aqxA7dNtvFHZyUlFEnUofYYFjQH8qyVs1as9JIumewrZpx5PkauyV
 PzVn8ndLm+ofE+2vvenml60I7wsDaDOeUfORAaj08HEwtYWJsJb2DjHH3CEcnsSHdUZ8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tx8MV-00017l-PV for Linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 17:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wokuoGqypkRW+N7f3s/ZfDKHdz0JBnoTTfAJnAbSOb8=; b=kELRTNN+zuQL3vKEARZjWHwaB+
 1RJBAF4nct4jXhY8Yj9kjLdGcFXH4UwbeG4qUtuKPBf4lZPGi0U67Oish6lcK86TUxQZozOohZPsW
 EI0GZF2XASjJuqCEVMCO6kGoZ69ID0/gXlwkFZ0LOxE0D5paTLsW2qzvR2jdutj5dL+pou5ZzR5CN
 wqfHVzHxdkzmEvIUnJ+LbG2hP/h3hYAakVUxN5tcJgJg7uhBXq5r+8+ldfM0nG7qGidsFLbW+xIAz
 lmEWZ0KhcQXZVLqxKHVLGjxHdKl4RTNMu2udtWFsPg/TX9zvcLHwAEz/oiniIVKRECNgfH5V9j0hm
 sjVO2mdQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tx8MJ-00000007KAZ-3dXu;
 Tue, 25 Mar 2025 17:46:39 +0000
Date: Tue, 25 Mar 2025 17:46:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Message-ID: <Z-Lr_xtkYakqpf0j@casper.infradead.org>
References: <CAMLCH1FEuoDxFFQ8HuUdBDMfzsyaS2LWyVh+eyGCpgxnKGa7rA@mail.gmail.com>
 <Z-Aai24gPXWQp8qi@casper.infradead.org>
 <CAMLCH1HsT+AVZSXAh8Q7Zr9C3SzaegfMdE6fzKp0X0FDt9JSbA@mail.gmail.com>
 <Z-KAP6Jz_bjuPuyx@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-KAP6Jz_bjuPuyx@casper.infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 25, 2025 at 10:06:55AM +0000,
 Matthew Wilcox wrote:
 > On Mon, Mar 24, 2025 at 08:47:05AM +0800, Nanzhe Zhao wrote: > > Knowing
 that the F2FS community is currently heavily invested in the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tx8MV-00017l-PV
Subject: Re: [f2fs-dev] Inquiry regarding plans on vmscan pageout supporting
 fs writepages
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
Cc: Linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 25, 2025 at 10:06:55AM +0000, Matthew Wilcox wrote:
> On Mon, Mar 24, 2025 at 08:47:05AM +0800, Nanzhe Zhao wrote:
> > Knowing that the F2FS community is currently heavily invested in the
> > folio support effort, I wanted to also bring up some observations and
> > questions regarding folio support in F2FS garbage collection.
> > Specifically, I'm concerned about the challenge of allocating
> > high-order folios due to non-contiguous index ranges during the GC
> > process. I've initiated a discussion about this issue on the f2fs
> > mailing list in an email
> > thread.[https://lore.kernel.org/linux-f2fs-devel/CAMLCH1F8niz3qifu9pt6C3yLhonadD=feaPtWKhCaRD8FPJhRg@mail.gmail.com/T/#u]
> > I would be grateful if you and other developers could take a look and
> > share your thoughts.
> 
> Sorry, I'm at LSFMM this week and don't have time to dig into this.
> I hope you saw my recent email about folios:
> 
> https://lore.kernel.org/linux-f2fs-devel/Z9RR2ubkS9CafUdE@casper.infradead.org/
> 
> The fundamental problem is that f2fs has no per-block data structure.  In
> ext4, that's struct buffer_head.  For XFS, it's struct iomap_folio_state.
> For btrfs, it's struct btrfs_subpage and for bcachefs, it's struct
> bch_folio.
> 
> Either f2fs needs to grow its own, or it needs to share iomap with
> XFS.  Both options are a lot of work; iomap doesn't support all the
> functionality that f2fs needs.  But btrfs is looking to move to using
> iomap and it has some of the same needs that f2fs has, so perhaps you
> can help each other.

I think there are two reasonable projects you could undertake which
would be generally helpful.

One is that you could add fsverity support to XFS.  You'd want to
coordinate with the XFS developers as a number of them have Strongly Held
Opinions on how this should be done.  There may even be prototype code;
I haven't been following closely.

The other is that you could help out with the ext4 large folio conversion.
There are already patches for this:

https://lore.kernel.org/linux-fsdevel/20241125114419.903270-1-yi.zhang@huaweicloud.com/

As the cover letter says, "with the exception of fsverity, fscrypt,
and data=journal mode."  So you could perhaps apply this patch series
(patch 1 is now obsolete), and try to make fsverity work.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

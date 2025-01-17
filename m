Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF4A158B2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 21:37:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYt5f-0003Ge-Fg;
	Fri, 17 Jan 2025 20:37:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYt5e-0003GX-B9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 20:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w++UGgo2wLEUMrrXJM3B57QPax+Q8fFD/YpLag3dxkA=; b=fkRN91QjPPldv2rzRjnEY74OwH
 DULh4ippDeolbglmWxJRQT+JM96+SzZHYLrmoTkPF1LUpCylO+Z6CKzX/TEkjpzx+40PJ8Jfg5Hth
 z7DCAW0FBhNUJDSw5GXV5jsn52n6/aXv+kww5004TUmLn/OJL1FJyE6F18syOEtTkGHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w++UGgo2wLEUMrrXJM3B57QPax+Q8fFD/YpLag3dxkA=; b=VrEdK0JsFF4Ey7yUfXpM4GczhC
 gZV9h3yEiRt16vB9S/dT+Z/vL6nWm/5q07G3obgo5l6g3BzJ00CMMvKVXmqU4R+pc3LG+WecgPElj
 sBBw620hWa2r9geqDwf4p9H3LZtf6dMldcDsTA2lgfIdjy3PTzbr2tKLDiXrTuyL7Ask=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYt5d-0004nF-4I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 20:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 82036A43301;
 Fri, 17 Jan 2025 20:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC88FC4CEDD;
 Fri, 17 Jan 2025 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737146227;
 bh=rT1bqZdwVFd/2xyZ7/+BbcEOFeWh4PZPt3GS1lV3PbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YvC/ZXmQy/UI/n7UEmqmFhKXCQqFLoft41IaIEt96y8IYO/kIq26qxnidq1YP6Ek7
 fPPvEYvIZvip5712h5y5P9whbfeukKXnoHdQVbP8erZtDZzIHh4fZ0gjStkuswJ08y
 dR18apYB5mqA2QKdTt43zg/7WHGAWIO4H1LLZ0mQZ+JnoYFrzFs1/dN5tCylPNWJ3s
 NFKVrVz5SGhi3+tcN/5ozF46va10ge2x2+WKwdRxcsXuHN46LVe8sKENXmerYWWUql
 3NqexdFJbzAGOHCxO+AdowcAHITO+j86ZKbHU5CmG9ebVAX/ra4hQ5F6G87r9bRQi1
 NzpTUGQp2xNig==
Date: Fri, 17 Jan 2025 20:37:05 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z4q_cd5qNRjqSG8i@google.com>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
 <Z4qb9Pv-mEQZrrXc@casper.infradead.org>
 <Z4qmF2n2pzuHqad_@google.com>
 <Z4qpurL9YeCHk5v2@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4qpurL9YeCHk5v2@casper.infradead.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/17, Matthew Wilcox wrote: > On Fri, Jan 17, 2025 at
 06:48:55PM +0000, Jaegeuk Kim wrote: > > > I don't understand how this is
 different from MADV_COLD. Please > > > explain. > > > > MADV_COLD is [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYt5d-0004nF-4I
Subject: Re: [f2fs-dev] [PATCH 0/2 v6] add ioctl/sysfs to donate file-backed
 pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/17, Matthew Wilcox wrote:
> On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote:
> > > I don't understand how this is different from MADV_COLD.  Please
> > > explain.
> > 
> > MADV_COLD is a vma range, while this is a file range. So, it's more close to
> > fadvise(POSIX_FADV_DONTNEED) which tries to reclaim the file-backed pages
> > at the time when it's called. The idea is to keep the hints only, and try to
> > reclaim all later when admin expects system memory pressure soon.
> 
> So you're saying you want POSIX_FADV_COLD?

Yeah, the intention looks similar like marking it cold and paging out later.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

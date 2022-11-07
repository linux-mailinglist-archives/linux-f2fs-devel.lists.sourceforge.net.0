Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD561FD39
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Nov 2022 19:19:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1os6iE-0007he-Hf;
	Mon, 07 Nov 2022 18:19:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1os6hu-0007hH-Gc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+JQAcV28L6lqLnjpiIqPiwYizr/DD0gtSDkF2733nIQ=; b=OefHLQns6vHr08OS2C5q6QaJMb
 hkmyA+3eI0BpNs7AlEBjkPPkIFXdWLKhO9oT0VtYnbotSiTi7eYxE3Z6pRt0ebbmcBOWh+BlnI4br
 vhjekbPgLpE6cd6ZEdIAFScKCNwxkik3j8VF1CN7SnJkfe0sDof2kUqkQHYtm1j07zMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+JQAcV28L6lqLnjpiIqPiwYizr/DD0gtSDkF2733nIQ=; b=D
 ohR106DiP1RncloJs9Wdpg0Tm6EfTa7eYiP3oCSGvSNjHaaWv/J3hld6q2jiAJAuGIuGd4VHGvfpq
 NLzJsgjw1tcWfLjDP1GEPisFQFuDZ1zgTB3su1+EqkkVAaA5sFeSxx1T/pmIScpjHFBhTftHAJ7/P
 x72nROFijz5yaoYk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os6hn-0004Yc-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:18:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B11A2B815E8;
 Mon,  7 Nov 2022 18:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A8EC433D6;
 Mon,  7 Nov 2022 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667845116;
 bh=OTz39AVvt2pScOPpFzIDs3L2EQHnOYR8fVe0Jw6Bskg=;
 h=Date:From:To:Cc:Subject:From;
 b=BKfDCTZUt3NJjf8Z7aIgLGcB+a8nGkvI3IvB+TCbyGx1x/PRY/1ib3kB4tRMdAuDh
 7NFPv2KXk5tIFToualgBDwQjZVyvzJBr4p4IGIhsKIZLcFbVUGGvZGV5T9g+sj+gEF
 7ZdfP7yLpJgCmd5+rfqnhg8Xio8nX9RyPJAf++vst/cxFlH2ymoDm/F6h5NKY4Tw6s
 eQUv7SDhvqZzbnIarh55TAY5G89O1w4eUrklF8Aq5e1t86ZyO3Oofc7ILE8xClZ9Wp
 6W8gx5sYm3+n/AMoeFhZA9tVTEcc6Keah0oFzO7XY11XVnoChywTNNs1PmSqOwcCqQ
 FG08hNLOeF/Hg==
Date: Mon, 7 Nov 2022 10:18:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Message-ID: <Y2lL+lSibGY9hPEE@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Stable maintainers,
 Please apply commit 4fa0e3ff217f775cb58d2d6d51820ec519243fb9
 ("ext4,f2fs: fix readahead of verity data") to stable, 5.10 and later. It
 cherry-picks cleanly to 6.0 and 5.15. I'll send it out manually f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1os6hn-0004Yc-W3
Subject: [f2fs-dev] Please apply "ext4,
 f2fs: fix readahead of verity data" to stable
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jintao Yin <nicememory@gmail.com>,
 linux-fscrypt@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Stable maintainers,

Please apply commit 4fa0e3ff217f775cb58d2d6d51820ec519243fb9
("ext4,f2fs: fix readahead of verity data") to stable, 5.10 and later.  It
cherry-picks cleanly to 6.0 and 5.15.  I'll send it out manually for 5.10.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

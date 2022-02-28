Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 909734C6CCE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 13:41:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOfLT-0004Pl-3u; Mon, 28 Feb 2022 12:41:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+72096dbc355c8c690838+6763+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nOfLR-0004Pe-Ie
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 12:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wm+MmG2cPgiiSEaSxGBLWYbjfx227Rcvabg3xmOl9U=; b=cb9hR8gXSyTevvus0KQK7MpTp3
 XTuwgLbTiUMhq4WeeUdGzNYFuH/jwJvKjzquXRcRtZLORYnBnj5Jdt6rTOIsxJ0m1D8ZpyvAU3OSE
 odfaTx7u12SCMWl2hOIKrLh2hkL+5cR9TwP2SM5aKTX9OZuqBHqC03c324vIPGUa87+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2wm+MmG2cPgiiSEaSxGBLWYbjfx227Rcvabg3xmOl9U=; b=O
 nO2LhQVkBuEHL9JWSlhyStHIQgYOms0NbtElwL1pm29snq2k5apRSKSGE3yeKO8435I5CpNPoBgFh
 XiUoOEge4DWYHlYjQsNmEiBC6DaFizCWAUE2FbUxZScMlU277fZPWte+DXgD8i9UQelD6D5w8wwz8
 39lohodQJb9it2q8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOfLP-0006t2-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 12:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2wm+MmG2cPgiiSEaSxGBLWYbjfx227Rcvabg3xmOl9U=; b=AbTcmXoENSVi3aonK55lvDOH5L
 iOi9R8EjBtuMiSb+8fCuot7hQXo4ksAz77imunjAf7NTR/2iqYZ8X/nGzE/SGXNuPo6s5gUsB+k9c
 3V3WTwpw71BMVqF+kFssi01HprkMmlDGVcqRrWRVPx+mCQfEtPSZL2WkQBFSRPXabaVorguoO2x3q
 2Z0oQPHYldeDnsZ9gzn1dwvx8LUy9sDqSWb02mt1m5RodGeFri1d+7af3cUaBqZLwPZbZVEpaNCl4
 pusHRtQ+dN7fEU+TginTDI4LePFFnR2dt4kGjg4Oy9extslJNWNZEK0fbk806u0EDnDhVMzR6Wx/L
 zsrf2rrA==;
Received: from [2.53.163.181] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfLC-00CHap-VO; Mon, 28 Feb 2022 12:41:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Feb 2022 14:41:21 +0200
Message-Id: <20220228124123.856027-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk and Chao, as of the for-5.18/block tree, the bio
 allocation interfaces expect the block_device and operation passed. This
 fixes f2fs up to match that scheme. It could go into Jens' alloc-cleanups
 branch if there are no conflicts in the f2fs tree. 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOfLP-0006t2-Hg
Subject: [f2fs-dev] fully convert f2fs to the new bio allocation interface
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk and Chao,

as of the for-5.18/block tree, the bio allocation interfaces expect the
block_device and operation passed.  This fixes f2fs up to match that
scheme.

It could go into Jens' alloc-cleanups branch if there are no conflicts
in the f2fs tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC9E16BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2019 11:55:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNDMw-0000KV-Fx; Wed, 23 Oct 2019 09:55:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+9c86d9a8f0f754250c00+5904+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iNDMv-0000KE-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 09:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CS6l8CT81d+rQTdwvtyepLT7A36udW9pzFL6uXC4imE=; b=UcWIMil1NfeJpvQmoytK6Y9Pf5
 Q7eEa/2ncrlNa7dK7nawNkhNR8HuLIUZkI4K76PHzxc4hStZu5igZJelSy+6Smlz+MWMl21IB3vfs
 YR5q901JSguGcHylmFnSgqkegh3GRIClOyp4RdlNxemNA8BiCI8WtfszvoX5I3+KLskg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CS6l8CT81d+rQTdwvtyepLT7A36udW9pzFL6uXC4imE=; b=SckFuRTrP93TCH7LDdBszzfhiK
 TvV9oh2HbH0ujhoG77SH9MWod2hbpq/FYFe0NmzW43qN8xwdAnr8U1tGMp/kjy6aEENU+Hs324MRz
 Eb0FAB2Zafa4fPQGm9uvGDyYMlQ8tWf+QZ/qdlVPOjIauyOYG3E/b9+aP14ocKuXbjkc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNDMu-000CRr-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 09:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CS6l8CT81d+rQTdwvtyepLT7A36udW9pzFL6uXC4imE=; b=BLqXj+n0cwZj+xiVhD0XhdVei
 navF1Vt+rLXP1v7NYN0DwsLlyVpVgZh+yFR10a5/X2B7j/Lh0O6eW4BPu/ng3uRA/b7oM5S6SGWai
 T2du0PWd3hVEF1n4vFNAZCk3h1rFrgbgjnuIjEdY5nDO90O6MwpyCPhVjiKmUkObL0obrudYfo6hI
 jPO7TRXi/sVj1GzA5tyQ2h0gKfgewSqnR2TfQH03LAru5wMdXnjuKtCQGvIjvyNYy35Lg+/WawQvz
 wsunSBUm4u2U9h5hHI+mT+7qLtlQ2j5WzJcHjJlfMHS6gFPZmOTeVzZtqnTJLBm73f4ilwewrH/Oc
 l+a00VBKw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iNCvH-0006p0-0m; Wed, 23 Oct 2019 09:27:19 +0000
Date: Wed, 23 Oct 2019 02:27:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191023092718.GA23274@infradead.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022133001.GA23268@mit.edu>
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
X-Headers-End: 1iNDMu-000CRr-Hb
Subject: Re: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Dave Chinner <david@fromorbit.com>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 22, 2019 at 09:30:01AM -0400, Theodore Y. Ts'o wrote:
> If and when we actually get inline crypto support for server-class
> systems, hopefully they will support 128-bit DUN's, and/or they will
> have sufficiently fast key load times such that we can use per-file
> keying.

NVMe is working on a key per I/O feature.  So at very least the naming
of this option should be "crappy_underwhelming_embedded_inline_crypto"


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E562B676434
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 07:39:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ7Xb-0006Jl-5O;
	Sat, 21 Jan 2023 06:39:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1651c3ebed9361b307e7+7090+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pJ7XY-0006Jf-AX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 06:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pbB8338ZfSvN5avLy4jRRyLgTgoL9VF2bh4jfARYSoY=; b=W6Uiyk0OKiV0cvh3Sud5JW7QV6
 aBHXrSWXD2621NU92QaNu5UBu5jDF85XhIv/FDj0u8EmrpIbBMx/0m/5XjnQ2/3FxtLlkQW9urvb5
 G8FDsbdqjnY2S+Xx5fNp0IgHXilOvHCpeHKsLTDskX1yR/P4Hvn5t+ri/Y3O3Zk32uds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pbB8338ZfSvN5avLy4jRRyLgTgoL9VF2bh4jfARYSoY=; b=RxDWj1DZK6RAj5NPpNwRgD5FHf
 jXzXgAg+8QRrTPNdCGDZ8O8MZrr65MCcCVbFRILIQZNDEFlg6ShBFDqCcRsB/CfLKHErPogqWoUMf
 ARuCHQ7nvH/r5RWIUmdxe/uKCGBiiMFyA7NJv6h//JP4ZO403B5IcmPJ8Rki4Ywau0P4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ7XV-00BAbM-2A for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 06:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pbB8338ZfSvN5avLy4jRRyLgTgoL9VF2bh4jfARYSoY=; b=F+LR1CwIsyVpngzUGE2qUMd1jN
 uj274WuuBiMxOEJ/sz8alo6NOXYTEmgDpxSqhy6+F8U/DLhKVoH7y5pF90W4oQaTeRBgyzwhm1gUu
 JnmVwS0bYrPR09cpQVViev3nCD9OzprTksNZzrocqDTt1IOw6xnyNOG2tmZY1aX4EtX/oTR2SN+eo
 /a5Y6I7VBXwxkAJLWa1m0egijIDvOY9XKuuY7Et6B3cmpF2fP+7ltQXRwbc4kPJixH1yjovqRuZsW
 oTQvvuzNpFPz1GGep/Up3cpy9UoShl8qOlObgbqAMRiP/K/vPnX48uKdKsWRYFxl+4DovjWbi8vmK
 pxe3gEqg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pJ7X9-00DQNk-ST; Sat, 21 Jan 2023 06:39:23 +0000
Date: Fri, 20 Jan 2023 22:39:23 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y8uImwmmprNOCnB9@infradead.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <20221223203638.41293-11-ebiggers@kernel.org>
 <20230109183759.c1e469f5f2181e9988f10131@linux-foundation.org>
 <Y7zV41MQWSUGo4fw@sol.localdomain>
 <Y8rx/SPfnlYJJ8XD@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8rx/SPfnlYJJ8XD@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 20, 2023 at 11:56:45AM -0800, Eric Biggers wrote:
 > Any more thoughts on this from Andrew, the ext4 maintainers, or anyone
 else? As someone else: I relaly much prefer to support common functionality
 (fsverity) in common helpers rather than copy and pasting them into various
 file systems. The copy common helper and slightly modi [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJ7XV-00BAbM-2A
Subject: Re: [f2fs-dev] [PATCH v2 10/11] fs/buffer.c: support fsverity in
 block_read_full_folio()
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 20, 2023 at 11:56:45AM -0800, Eric Biggers wrote:
> Any more thoughts on this from Andrew, the ext4 maintainers, or anyone else?

As someone else:  I relaly much prefer to support common functionality
(fsverity) in common helpers rather than copy and pasting them into
various file systems.  The copy common helper and slightly modify it
is a cancer infecting various file systems that makes it really hard
to maintain the kernel.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

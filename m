Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F816477D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 15:53:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Qin-0001zF-AO; Wed, 19 Feb 2020 14:53:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+84cd98d88baeb89a717d+6023+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j4Qim-0001yv-1m
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 14:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uMegKaz1HfLpF2g7p7DlQ/EBiCvWUcUbr7nX80vF5Lc=; b=fH0wWLlDxsqiwtieftiYOiAyQG
 Hi5j/4grsAqXIQZY3RCzFgwumwvItbhnTBN5NDQTtWFguJErwsuM12yu3bJUv/OaRD+KhXTjH8u4Z
 7d4bDiC71M/d7wp4Ek/SPidlF3s1jD7/hv3G3v6kIbFS1B/g+9ZJKJulLK2yiDr/pAxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uMegKaz1HfLpF2g7p7DlQ/EBiCvWUcUbr7nX80vF5Lc=; b=j81Z5a95xm4P6ijuvh8DBjg+bj
 Sk3t0Zwpnz0xIUwHk7Ue3wA9GMCdmAMseWVtLEZ6r4Yh7NwH09VRB8LsGPXa+QZiAOWeYbpmrH8Cm
 BBov46SkLPZthv52bv/u+C3i+YRApv0x9NHsuhEZqxI111AVyTUuGmmmmjPSLABewofY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Qij-008FE6-8q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 14:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uMegKaz1HfLpF2g7p7DlQ/EBiCvWUcUbr7nX80vF5Lc=; b=X0rDPJg7QU0PJJIjNaGAqpvYpn
 /6hHDMHrdwYkFf1WvaYRTaaFo3AeckX2+ZMOn/Nm+JcW/3hxiePAiir6lvCdGk/P9uGHhfEvpwucR
 bDgJplk4ZCNgyTGHvDtEAXPpGMvUHcNEbcpg/CZuZzZ8G0wxOm3ivsGEcGAf/pSiwD7Ps2HXhUwxB
 /EDsb5LGA3euGi7WrNg3xJ0jEsmipdOVSe+xRb9+nw2AsqZgT8EzK22Jb+prE9J0v1S+vNMRg8lPH
 dfLqR0GpfpnFRQ0KGllMdG0K8ZzeSgnbnF1b+ANwO8esQ2ZRQlWzlSH06wNuzINQh6c12fiPoXmuF
 OO0s+XQw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4QiU-0007wz-2Y; Wed, 19 Feb 2020 14:52:46 +0000
Date: Wed, 19 Feb 2020 06:52:46 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219145246.GA29869@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
 <20200219144117.GP24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219144117.GP24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Qij-008FE6-8q
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
 earlier
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
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
> #define readahead_for_each(rac, page)                                   \
>         while ((page = readahead_page(rac)))
> 
> No more readahead_next() to forget to add to filesystems which don't use
> the readahead_for_each() iterator.  Ahem.

And then kill readahead_for_each and open code the above to make it
even more obvious?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

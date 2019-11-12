Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F07F8933
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 07:57:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUQ6h-0003rf-Ky; Tue, 12 Nov 2019 06:56:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+6e156d946156a2f7d1de+5924+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iUQ6g-0003rY-95
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 06:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WzJP5ecelfPrbPkpFdZW5saIiDsiXjsKrOz9Vo/Rvb0=; b=iwXgySZCr9XZ0oN9kuA4XuXdgM
 814LXbQj1pcRYUeLYixVgVkY0/dpYo66WnQ56A6v6exRmYCluU/GgRfT51C6hRTs/Yus33Hei6HM/
 KM9C6X0ZfYpHdimJkaVaJuXOn2IpMoPmKDkLy3Eh6Rl2CeEMkB9lBQSsmY46HlbfmJyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WzJP5ecelfPrbPkpFdZW5saIiDsiXjsKrOz9Vo/Rvb0=; b=EBDVJuCsgxqhHksAuaoIX7IIte
 I7qBkCKagzpza+Hu8N0xBB8H4+ZZBNnhLo1lnz7GF5TP8k+ICVplHTDzAVXcXU9ggn3PJK28RS3pe
 FeYrSvqAb9FHfPzPFhlN1t1nyduK1gCio1XxfN9rzgML81DOOYIiwYzOSLmN2LCZ+O3M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUQ6f-00GKji-24
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 06:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WzJP5ecelfPrbPkpFdZW5saIiDsiXjsKrOz9Vo/Rvb0=; b=OlFvdt3wLOwmBUAZk2yEp4RNW
 I3bct+sprhJ6pz1IsQYpJkg8FZDpj28AVlIHBeoHgWxYKaFSrgigAQoslr65aDVp+bGS+jUUpPnf7
 +0pwKUa0rB4i+8tBxIRr2+gglGQoqUvEVP9aqoJWfBTbysXf8MBtKCC6mc2MUYiUd4rEEGlb8Vzmz
 zdH9ghLmseScW4y7uV88+9flHR3xHMMJVsvg7KfHo7sPjyA3sqXSYWk6cnu2qcGLjFry7PGzwYTVg
 a7zaeMrFGOsbUGeBh1bEH9eftnbXBBcs+swwnOa83egkEtbN0At9pMmDOANTZdwPKwNZyONoemVXo
 iR7q83i7A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iUQ4x-0005RM-4z; Tue, 12 Nov 2019 06:55:07 +0000
Date: Mon, 11 Nov 2019 22:55:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Message-ID: <20191112065507.GA15915@infradead.org>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112003452.4756-3-ira.weiny@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iUQ6f-00GKji-24
Subject: Re: [f2fs-dev] [PATCH 2/2] fs: Move swap_[de]activate to
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
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 11, 2019 at 04:34:52PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> swap_activate() and swap_deactivate() have nothing to do with
> address spaces.  We want to eventually make the address space operations
> dynamic to switch inode flags on the fly.  So to simplify this code as
> well as properly track these operations we move these functions to the
> file_operations vector.

What is the point?  If we switch aops for DAX vs not we might as well
switch file operations as well, as they pretty much are entirely
different.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

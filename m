Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FC16B36B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:57:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Ljd-0000fu-9R; Mon, 24 Feb 2020 21:57:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6Ljb-0000fh-V9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IhFcixf6xB7flTgkTYeOnbWlEpWZuV6CKSy7ZQez0WI=; b=WGTIfjW+xHbdWCJDsrpLn5jFTG
 +9vo1OMqOjKDI1yZuvEZ1e2OkWjJuwZN9UQKW0pcAtZ5tws7zniyfhY52PoBBnFdLuipaXdgF+5HI
 +Ns4pbM/zcO+Hg32+zUBCH6mTzlbPJcL9JtuG6WvAbmaN3IanEFEQUKnZSfL1q+N5YAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IhFcixf6xB7flTgkTYeOnbWlEpWZuV6CKSy7ZQez0WI=; b=aqDe1j3vJwn1QGjqPKhYo9xpmv
 lcM/ggKwixPO4kR95qVobo0yobBeyK1cVSEJ2M7pRQ9pU3U2bQsMmGSacONqylgMJlEbL9seycAuI
 6nSMPaDSuXrlUxYanc0QWYVgLGEQCzQSPA8iNiMcStdenfXHAoLproknQo5mscvhh9xk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Lja-005TOs-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IhFcixf6xB7flTgkTYeOnbWlEpWZuV6CKSy7ZQez0WI=; b=Xsl1VicGy/cUMy3nKSfLYsp4JQ
 XuauTs+SlYeSgQlRLvumnWjOr2cplAYv962X+iwgIS1cxx+dgzmOltxe84qM829HlpGa7tIVs0rCR
 UHY9vePWsKoMCOJwVPvOJVEDVFCToUF9yNOI+tB8g0de/RYeV2SMFMNQdVuKQtuM7NwbEbskf1eLg
 dUXO0x+mn96sZpwZlnDzQxbegLQ/KMtN7w/7oKgd1oDm9ELzK0l9J7YruyW3Oz774Ix0HS0VLNMdY
 vEye7QuENdlHLI1W4ae0sgNhwCA9TIm6YccKAq+w4+qAYpIVZfjL3mSg7AgI6bRAZf2eZBA7qbemA
 dCabWfIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6LjT-0006S8-Ch; Mon, 24 Feb 2020 21:57:43 +0000
Date: Mon, 24 Feb 2020 13:57:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224215743.GA24044@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-15-willy@infradead.org>
 <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <20200220134849.GV24185@bombadil.infradead.org>
 <20200220154658.GA19577@infradead.org>
 <20200220155452.GX24185@bombadil.infradead.org>
 <20200220155727.GA32232@infradead.org>
 <20200224214347.GH13895@infradead.org>
 <20200224215414.GR24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224215414.GR24185@bombadil.infradead.org>
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
X-Headers-End: 1j6Lja-005TOs-Uu
Subject: Re: [f2fs-dev] [PATCH v7 14/24] btrfs: Convert from readpages to
 readahead
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
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 24, 2020 at 01:54:14PM -0800, Matthew Wilcox wrote:
> > First I think the implicit ARRAY_SIZE in readahead_page_batch is highly
> > dangerous, as it will do the wrong thing when passing a pointer or
> > function argument.
> 
> somebody already thought of that ;-)
> 
> #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))

Ok.  Still find it pretty weird to design a primary interface that
just works with an array type.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

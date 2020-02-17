Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27193161A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:48:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lRq-0000LO-PQ; Mon, 17 Feb 2020 18:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lRp-0000LB-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZVbSaaYtwj3qyeImu1P+lH7PMVYW2dlgJQfIOhuLwI=; b=XrxVdrO6tq9eZwNumSHSE0HEeI
 1L3hAqaLR8PBJdSb5CnzR3cqA+RXat6YWyyEYGQgkvF9s2VlojiG4+KXq2e8/0pXtCtctXgWTuOWe
 WCoh7KwMgG6mITBM8KW4NMYJarZJqNRSJ0wXoZPhZEFRGuHVcDI/H4krCBz68vPapcb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZVbSaaYtwj3qyeImu1P+lH7PMVYW2dlgJQfIOhuLwI=; b=RIaVQQvomCqGmG4XmmgykyyUEw
 YGuS1fvgJ1xGGDaxVVJlPAY9F46qTSIRI6/gVk+FVbBE3Euqt8J3ZtwSrqLtV6M/ZFli7arEQUYbt
 buHPOAxOIVvZOEDcIkpiYBNT8G6mlgbKZvL7KemT//CzMpcdkzXP1zedfrFsKduRZWTU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lRo-00FlqI-8y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CZVbSaaYtwj3qyeImu1P+lH7PMVYW2dlgJQfIOhuLwI=; b=InMWRejZjziZ327gXZfH6Mbvr/
 C/eVJoLnvVckDeDyzrV7y7TgMN7L2n+c2kuawbG4CvlvTAyha1SY+K1dMvV+M/KVndPm9QVAOhiYo
 8o2+LVPKCXFmpk2cJIMtPz+PQe7MPFwlTqgCeHeus+DzjLHeMVZ2Zdtsj+MACIwCrSrxvG8dTTtZW
 IsGstqnGLWUQSUdZyALt6muTXBeoQ265Lj7NA7RwwyS1WYlqOrdhFvczcsXEHghUSOEddnFA/bh3o
 rlYzYW3LI/v4mBl1+4g7qezJwwaoolJXkQhuMF6EOe7aVsuIM/2l1RZhxe9liukxnsF/LosclOFnG
 HdvYL2KA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lRh-0006jH-1W; Mon, 17 Feb 2020 18:48:41 +0000
Date: Mon, 17 Feb 2020 10:48:40 -0800
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20200217184840.GL7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
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
X-Headers-End: 1j3lRo-00FlqI-8y
Subject: Re: [f2fs-dev] [PATCH v6 00/19] Change readahead API
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:45:41AM -0800, Matthew Wilcox wrote:
> This series adds a readahead address_space operation to eventually

*sigh*.  Clearly I forgot to rm -rf an earlier version.  Please disregard
any patches labelled n/16.  I can send a v7 if this is too much hassle.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

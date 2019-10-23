Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11209E16BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2019 11:55:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNDMe-0000FL-CI; Wed, 23 Oct 2019 09:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+9c86d9a8f0f754250c00+5904+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iNDMc-0000ET-7s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 09:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGan0qkqY3Baf+Gu4EO36oLW37gG3cinwDiYCMyfjkw=; b=IFtuzLP3Dj7rdLIQNPG/TZfQx0
 hovLtDqfqddRyDcDWBVLmeO6OwLuYWKffX10inqugsUcytGZehzwptUM62Y8vW0RZRuLk8Ix+Nk4a
 0XNV4v4/FQ9zLQSLWKfv9VySiGFMmnJ341HfqiBwvT6CB0qxSGw8GCOrbydtkbQpGMg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uGan0qkqY3Baf+Gu4EO36oLW37gG3cinwDiYCMyfjkw=; b=h6HcWiT9GRdyE56H/+op0E6Sy7
 yA3cbDLMaKjmdd5ijQWrB3ZVAsNjHQ9yjkkDyJvN+Zbsa10AU1hQopCMojDdw8S+PziOaRGKBQi6x
 fofg7h8kBb4vpk2v/7HURQev/WddGenrIP1NPaTe8Qy5Aa8zdD16koo7HfdtORCk5sXc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNDMa-00Conp-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 09:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGan0qkqY3Baf+Gu4EO36oLW37gG3cinwDiYCMyfjkw=; b=IPtlkSVbKd9G6jeWwzkZUcoqb
 4NVDb3fhL/u7bjVcexVJA80NrHgxO0mhThUzgtgQ543HR7W6XGJZ4U6xWi7m8tXDkiye2nX4Iy7tq
 Zo8VGdc+FuZ3+dVi4dGltCQJIux+pcP5Mo/CMVpWbGcV5khHPpEs5vjDiDjrMP+ulqaZ3VcJZF97N
 dAZzJ09V2tAZ/iMf+YsGSFaAE9+Tl7a945g6zchy+gJ2bgjSs4tcNAP2LdWu4lCPXVuvnaOXCGl4Y
 Ye4lqxGDjhYoyNu2MP1lc/2/gtxhSm01HlvGYUrbZ6jO0kCf8idq7xB+sAkRHsdaddi1xkOVxJY81
 gpahDH58A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iNCwC-0007Zj-C9; Wed, 23 Oct 2019 09:28:16 +0000
Date: Wed, 23 Oct 2019 02:28:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191023092816.GB23274@infradead.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022060004.GA333751@sol.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1iNDMa-00Conp-Gh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 21, 2019 at 11:00:04PM -0700, Eric Biggers wrote:
> An alternative which would work nicely on ext4 and xfs (if xfs supported
> fscrypt) would be to pass the physical block number as the DUN.  However, that
> wouldn't work at all on f2fs because f2fs moves data blocks around.

XFS can also move data blocks around.  Even ext4 can do that for limited
cases (defrag).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

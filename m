Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE02E2ABB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 09:04:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNXAr-0000l2-2D; Thu, 24 Oct 2019 07:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iNXAq-0000kq-4D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 07:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UuKLDbpQvbMotGXcc+uLQ0Vocvzd2LHIJ9vtxHOU5vU=; b=AiGg6R2cWBU1QkmjnwV7VnF80y
 O3aCbO3ZSUdqzDrA0F9JiHlYoq3n4fFerunm6NKairo8Dv7wOnTd78VCsJo6Csq8SuEWBLXQGuV46
 yI+WeVCVzuFUnivSYxwpEUP7aAZVoJXs+HdaDxDTAeGsWlpkloVvZiZvi4MBEto2mCCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UuKLDbpQvbMotGXcc+uLQ0Vocvzd2LHIJ9vtxHOU5vU=; b=gIntmip/Y9xtqCaoZz5rQ1Pe/L
 vkupK6uQHYRYVS4UbmrfT1DJIIZ+Yk6jpC/f/bMeRbX8v/6A0TZcaXQkPsG1T1qk8wNzmIs9FnLcf
 Gh3NuSUmnt39xV4tiq4xzLVufw2ZjqFJuLo06/wTEamaVe2yO2WhX9Rl7QphJjIxhXVg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNXAo-00EBeH-PY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 07:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UuKLDbpQvbMotGXcc+uLQ0Vocvzd2LHIJ9vtxHOU5vU=; b=i6E3AhTxU7PiiGoZzHX1bpT6K
 7IRuf91wXcARc4dhTksYxqxPdfUSlbB4q7yGugACfQTvkbN8suN7Yd9H8ZiWfzixEAaJEUoGg497V
 8lWSw8TWXat6lhpSQCxuXB0JIQp15oSX7lw7dgZ6tsSiYPOWh+odehSxcdiZJEy7yrEN1UoQISKC+
 KihqDHF2wWd5cKKq/bFaRJ4aOtR9PXq7IR4CzsUOxkrN9XW5Z5UkWpZkzqAoSh6m6C8RzC/j/5MRy
 CLVwiG+QvZ8C4mNC7/+ocWKE0wCHvQZXxoKj2reDkv5OQNW6+OzL+JyxSmVy2pIlCdVqbRt89NrZ1
 P+5IiNmTw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iNXAf-0004zo-44; Thu, 24 Oct 2019 07:04:33 +0000
Date: Thu, 24 Oct 2019 00:04:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Message-ID: <20191024070433.GB16652@infradead.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
 <20191023092718.GA23274@infradead.org>
 <20191023125701.GA2460@mit.edu>
 <20191024012759.GA32358@infradead.org>
 <20191024024459.GA743@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024024459.GA743@sol.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 RATWARE_EFROM          Bulk email fingerprint (envfrom) found
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNXAo-00EBeH-PY
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

On Wed, Oct 23, 2019 at 07:44:59PM -0700, Eric Biggers wrote:
> Would you be happy with something that more directly describes the change the
> flag makes

Yes.

> , like FSCRYPT_POLICY_FLAG_CONTENTS_IV_INO_LBLK_64?  I.e., the IVs for
> contents encryption are 64-bit and contain the inode and logical block numbers.
> 
> Actually, we could use the same key derivation and IV generation for directories
> and symlinks too, which would result in just FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64.
> (lblk is 0 when encrypting a filename.)

I think not making it crazy verbose is a helpful, but at the same time
it should be somewhat descriptive.

> Although, in general it would be nice to name the settings in ways that are
> easier for people not intimately familiar with the crypto to understand...

For the andoid case the actual users won't ever really see it, and if
you set up the thing yourself it probably helps a lot to try to
understand what your are doing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

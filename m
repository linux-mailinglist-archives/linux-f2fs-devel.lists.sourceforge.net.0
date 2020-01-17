Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E51404EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isMkb-00086N-Sl; Fri, 17 Jan 2020 08:13:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isMkZ-00086B-TH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 08:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/MEhEZGYZHmMiJmrgugavb+9sNbSeK5h6oldhHUYs8=; b=ENTUXYqOKDRnzgDT+iWJxxDwB7
 2cYbEgTQAzPEquJ8fy33y8aPLFyfN7w9wYw8dJTyebqiW/oNX6UPeqkfjH/OdRuvFTNL7zo2NQGGC
 wcqgrFz4ZMFNitfupeQQmfF/SYl0grdvXMuc6H3K2UaDZ8sqsg63ppjHcuSeT2CzBzkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t/MEhEZGYZHmMiJmrgugavb+9sNbSeK5h6oldhHUYs8=; b=SLQxXx/Ut3FPTw1TwXpp2AtvAq
 24Ou3SEHvzwqA3A2WxxSz4uU3Sp5en+L8sn2NOIXosq/HQlBG/E0+mG7pOy3ExcloRGWtYUXgWsGc
 7vOynXcelrAKMtIAaQy6qxf7pKGH6M3hyS7XgN0A3xmJOR8sCcGwBJ1PRCL3NvmYDaZs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isMkV-00Au6s-19
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 08:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t/MEhEZGYZHmMiJmrgugavb+9sNbSeK5h6oldhHUYs8=; b=CBE9ZS2IjXbfrp+dvzcCM+LGx
 VZTVAlzWhocgiFF1/YMmGjxIEZ/q2YrWWmmFIXWh/MtSDaEomRJZPzpowabxJw89/lYJvFOTzFTTb
 15FsRdHD+UhNq+yMNIqE7bJ/9sUrZRPyiROdXSxQUV2MrRQCGaVv5X8CQmhAVgkzbVpSH4VD9xgEw
 iF5qutl89oTzwNv6K7NqOg/xSVNQDjb6ZpF+V6bQvMfGdzQ1ssvAE0sran+0msDNQl8ksQNVInVZy
 xApRZDzdrqjxxSAQGgoFXJPwSY6UAjMCuLJ/t31A4nvFhJqqaVXPV4DQIITCBoAPMsluWWM4958TK
 MyV2DTmUQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isMkI-0004ao-RH; Fri, 17 Jan 2020 08:12:46 +0000
Date: Fri, 17 Jan 2020 00:12:46 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200117081246.GA16846@infradead.org>
References: <20200116192008.35766-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116192008.35766-1-ebiggers@kernel.org>
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
X-Headers-End: 1isMkV-00Au6s-19
Subject: Re: [f2fs-dev] [PATCH] fscrypt: reserve flags for hardware-wrapped
 keys feature
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
Cc: Barani Muthukumaran <bmuthuku@codeaurora.org>,
 Gaurav Kashyap <gaurkash@codeaurora.org>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 16, 2020 at 11:20:08AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Reserve flags for the hardware-wrapped keys feature which is being
> worked on [1].  FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY will denote that the
> encryption policy needs a hardware-wrapped key to be unlocked.
> FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED will denote that the key being added is
> a hardware-wrapped key.
> 
> This reservation is tentative, and these codepoints may be reused if the
> feature is not upstreamed.

NAK.  While the feature itself sounds really useful we don't just
reserve format bits for code not upstream.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

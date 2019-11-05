Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C16EF204
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 01:33:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRmmn-0007Vl-Rg; Tue, 05 Nov 2019 00:33:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7c6de30aaaef4530855f+5917+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iRmmn-0007Ve-BZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 00:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wV0F6yJ/zqq3L+kv3YDjr6sdISX9U0BeCs3/AfpD054=; b=EHhNAFt/lyD3j5kNHtnLa1pEWX
 RgBLrsX9QiWzv7dTvNOrjzART/BgERF86jRWypNxv9mwBn4G3jwFDwkspmuul4x3IXEwQw0Z2Em+d
 p2u3owFOyva3Q1tzRRaShw5WBS9dqQfpbG/Go+L1V8nY6yAG0ef/Knvpa5kBpBFT39YY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wV0F6yJ/zqq3L+kv3YDjr6sdISX9U0BeCs3/AfpD054=; b=QwUZ0f+GMbn9F2c7Molp5OoR2v
 6TNbc5BEsncNMHVlByu9l75kU7zj1o9qHwYuleu/iHBcd8jWs8Z/wjDESb13JjaizM/kSqtrZtemN
 4m8FDp3K83VzDesAzNEF4hJIDTK7V2ks/iPIDM243Yh8Lyp+J1YKG7QLirlpIe52CjGQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRmmm-000Ebg-C9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 00:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wV0F6yJ/zqq3L+kv3YDjr6sdISX9U0BeCs3/AfpD054=; b=CqMn8kblt+lfvWoNWdFlWsw+b
 Zo46970njfdNwt3QRWM9lbscwc9/jQaLVesxeNBKAShK9e2cQSjxsjUhS85C40bAyBWBTnuyb7Ljz
 NFHdKav6y9rx8vgst5V757cV/xnMg/KxvvJ92IgGrgAJexdSuAzPinKiRSm0CQCvzN9mhSp/oJxcU
 uVGuEX3Ylo1UfXkB000SrVabC4tr09oc1IoKbg5Y65woTviF+Q6aeWyikT/pLKGhgOCpGt4OU7Vbp
 hpVnjG0kzFHdcpRDz6sSNaFh6pfqWMnvpykaV+euK5DXGTAWchpaXUTLXXI897GRsGrKXgClCt5yq
 /EGmKJ7uA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iRmmQ-00061c-1a; Tue, 05 Nov 2019 00:33:06 +0000
Date: Mon, 4 Nov 2019 16:33:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Message-ID: <20191105003306.GA22791@infradead.org>
References: <20191104014510.102356-1-Valdis.Kletnieks@vt.edu>
 <20191104014510.102356-11-Valdis.Kletnieks@vt.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104014510.102356-11-Valdis.Kletnieks@vt.edu>
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
X-Headers-End: 1iRmmm-000Ebg-C9
Subject: Re: [f2fs-dev] [PATCH 10/10] errno.h: Provide EFSCORRUPTED for
 everybody
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
Cc: devel@driverdev.osuosl.org, linux-arch@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 03, 2019 at 08:45:06PM -0500, Valdis Kletnieks wrote:
> There's currently 6 filesystems that have the same #define. Move it
> into errno.h so it's defined in just one place.

And 4 out of 6 also define EFSBADCRC, so please lift that as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

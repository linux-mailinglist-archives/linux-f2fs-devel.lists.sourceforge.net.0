Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D151513453A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 15:42:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipCXC-0001Ge-7n; Wed, 08 Jan 2020 14:42:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7810ff36a5d14e23d204+5981+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ipCXA-0001GW-7p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 14:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xn98h6aGpP7VX3AhP8VR25fODRZwIrLZDwToIQ0C3fk=; b=H/VfC6q21RCxCK8icMMp8TfXOE
 5ybVBGimabHSt9wIOy9YR6ANg1aHBaNJ/Y7K0VhdRjHcEhJKQ58qclLFaLNPXnVTbP44ZTbfzxrvf
 kJBSXT8PKVw9cvMjsRcXY1LrZ3X1x8+9wHNYmGMVoeSKKoHHyu6zi6q3q1W2tFfdejg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xn98h6aGpP7VX3AhP8VR25fODRZwIrLZDwToIQ0C3fk=; b=JS/XfAIoVY3JpkxMkr41Bnrdiq
 d/EkgbQCfag923UpIRRq7VHDPv40trFUrAe3sgwOnkaPHpvFG0uZArwfTfdlXzk9kE5g5r9/3cjfi
 LIHGUrmLOJMbtW0YpBmIQRVjZqnRBuKLFZbafeJ2kxgtcN3+wpan5N4Ct2pNPcuBPSwU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipCX9-00EZKA-5e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 14:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xn98h6aGpP7VX3AhP8VR25fODRZwIrLZDwToIQ0C3fk=; b=Q9k5DfWVhLXiQOF+5vf8sD0+w
 DCK56TOfdJ2AMFqXuQda+Ojc3wG26J3z2+4u6C15S2rMGjVhtz1Y0bbwO3v3zQAtO/B9kVOtGDqfP
 dxXUSTB62Vd2co5wpnhXy1OHmIGTPZWG+xdZOGWmvZC2NZoBztIC6HX9djljxzDeKmngl2roN/RLh
 Z9qqeyj+2gEGU8wx0JKcthyUKQCV7MX6Jyg1y0cUxmqgBIsqNxkGzDtItdvs5WjeVR57I2y9oHeRz
 Jl0pG86B9CEW8fusSwBfdbD2rfaccSuz7S9euWVD6o8EH/xD4DBsbhf1gon9q88AkbO1VMyq5ZP20
 yTiMtpXKw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ipBze-0008Ol-UU; Wed, 08 Jan 2020 14:07:30 +0000
Date: Wed, 8 Jan 2020 06:07:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200108140730.GC2896@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1fthhdttv.fsf@oracle.com>
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipCX9-00EZKA-5e
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 07:47:56PM -0500, Martin K. Petersen wrote:
> Absolutely. That's why it's a union. Putting your stuff there is a
> prerequisite as far as I'm concerned. No need to grow the bio when the
> two features are unlikely to coexist. We can revisit that later should
> the need arise.

With NVMe key per I/O support some form of inline encryption and PI are
very likely to be used together in the not too far future.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F26F01AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 16:40:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iS0wI-000765-Af; Tue, 05 Nov 2019 15:40:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7c6de30aaaef4530855f+5917+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iS0wG-00075X-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 15:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQdcZ/rCMxPfhUJE8nbWkRrJsdxA+Vm56qg50/+E1Cw=; b=Scw/GKXgi48SBguib3TeKOFxu6
 N5em3N4TAry0IrSyT6NHfN+vfOxsPT2eRb0VdG5F09iqXM0SVfpPOa8IKkyun8g06s9DA7qkc4+LY
 CTDrskjXA10sBGavU8uzlRyWf3mvX3QR8tVov/cNr5i+SYT+TGzFjp/m7r+UaKKUOut0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XQdcZ/rCMxPfhUJE8nbWkRrJsdxA+Vm56qg50/+E1Cw=; b=gH5oos6o9Eggwp8OZUHJ1zOLZV
 TtyxkM/arTYhUBu9CfEBGgIbzIfKZi4+EFB2Fa30g+KpYysCEIIRtqGIjHZQdpU8aAQ/SKm+Xhd0n
 TXXvXlQQX+MKuGFPi4s0nc40iAJbHqvz/ZQ9rMdI0aBn7K3hwFuPX1/W88rAHSldj0Ug=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iS0wE-000zDY-DT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 15:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQdcZ/rCMxPfhUJE8nbWkRrJsdxA+Vm56qg50/+E1Cw=; b=Ocp9xiaKzYOCoNB+oT3sxZPTQ
 GZZmpeZz1Pkbx3hL5igN2A9nnxgJeh5ZX0h0RFq6u88ua22HGxw6tlKR923/wrmQM4d9cJFXkqmXz
 7p6KUsYbiy3UTrhyHmOUjEl4g1vqoBwf3i4ju5z28ZkYAEfqGXc4DjckNzm91NOiLwHOAtuFuuhfP
 /u+IK73URb7cxkeIV7/gM5hFZ3aGu6h+2cn2G7ik8OqisFdebxIl9EiPUqch0yc5uCTcNG4K9OCbX
 VW4f/V+e6xpqbfC64GJBGkXaIedjYx1UzWAGjYoerE2gtLIaBhKqYngoD0iVUT+cjBXJ4SKNeqg0x
 wuaWM8E5g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iS0w1-0000HC-RP; Tue, 05 Nov 2019 15:39:57 +0000
Date: Tue, 5 Nov 2019 07:39:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christoph Hellwig <hch@infradead.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191105153957.GA29320@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-4-satyat@google.com>
 <20191031175713.GA23601@infradead.org>
 <20191031205045.GG16197@mit.edu>
 <20191031212234.GA32262@infradead.org>
 <20191105015411.GB692@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105015411.GB692@sol.localdomain>
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
X-Headers-End: 1iS0wE-000zDY-DT
Subject: Re: [f2fs-dev] [PATCH v5 3/9] block: blk-crypto for Inline
 Encryption
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

On Mon, Nov 04, 2019 at 06:01:17PM -0800, Eric Biggers wrote:
> I think that "Severely bloating the per-I/O data structure" is an exaggeration,
> since that it's only 32 bytes, and it isn't in struct bio directly but rather in
> struct bio_crypt_ctx...

Yes, and none of that is needed for the real inline crypto.  And I think
we can further reduce the overhead of bio_crypt_ctx once we have the
basiscs sorted out.  If we want to gain more traction we need to reduce
the I/O to a minimum.

> In any case, Satya, it might be a good idea to reorganize this patchset so that
> it first adds all logic that's needed for "real" inline encryption support
> (including the needed parts of blk-crypto.c), then adds the crypto API fallback
> as a separate patch.  That would separate the concerns more cleanly and make the
> patchset easier to review, and make it easier to make the fallback
> de-configurable or even remove it entirely if that turns out to be needed.

Yes, that is a good idea.  Not just in terms of patch, but also in terms
of code organization.  The current structure is pretty weird with 3
files that are mostly tighly integrated, except that one also has the
software implementations.  So what I think we need at a minimum is:

 - reoranizize that we have say block/blk-crypt.c for all the inline
   crypto infrastructure, and block/blk-crypy-sw.c for the actual
   software crypto implementation.
 - remove all the fields only needed for software crypto from
   bio_crypt_ctx, and instead clone the bio into a bioset with the
   additional fields only when we use the software implementation, so
   that there is no overhead for the hardware path.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

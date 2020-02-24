Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0CF16B5C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 00:38:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6NIn-0005hV-A3; Mon, 24 Feb 2020 23:38:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6NIm-0005hK-8B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 23:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q86n0/Atkm4Y4ZtubbVGTblHU1TxdG/2icnoc8+Xwo0=; b=K8uKU6w2aC/A/6MkxdsIQAcCiU
 Fw33DWaUFqEkT//UNFWgYlNHFjhBA0tJVBgw7St6KiNPmP5TaCnuQ6cDscCb9gNmBPdTSeJY1/WjX
 dQtQ0Mrtk8Zhd2KBY80z6HEw8KogsvQBmE3OxeYYnJ1cOnoy2UWoqII99PWDf3HHz4WQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q86n0/Atkm4Y4ZtubbVGTblHU1TxdG/2icnoc8+Xwo0=; b=j8EdOzFxlW41LMDPXZAaAa/sDZ
 kybpnKhJ+Cxuks1wWS4cdnx8FF+FTnIeyOBuZakhoUe41tS9HXzNx4ic9gI0zjtI2wFNIM+kyHCQg
 4Z2b97tHhWXZwamld3NAPIATB6S5BqS18LeDpKiniaPu2Fonly8HI9lH+xIj9bAVftIs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6NIl-0092OD-4C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 23:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q86n0/Atkm4Y4ZtubbVGTblHU1TxdG/2icnoc8+Xwo0=; b=tsH+RQq9nsdWo8IIY9tkNpYUNU
 XgrNdOr80eLKEtXvEFno8gvU4qBdtiN5909aTbWi0i4Mn192mp414I4f7ImjuKXsQEPhOibS7bTwU
 cOsxCIWLp2zKT3TrsWxL2LBmNdhy2TDXl8m50nN4H1fo5ZuoIqjiPZzhYNjCMDBSq643wPIW66ATo
 c2u37N+UIz34xOGA5lZnneTU0FiBG/QNqURtzRbfxDmVDDvcVQXxx2J9oSjbcL56/SnvF6ZaDdp5f
 xwB90p+ijsqr/WHbcdu8Ex6TI2tXeVKVR+0eEXlgj0Omm7bgRLCdF0x20EQH304R+C2d0zp+9SCLy
 d4HdDp4A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6NIV-00021I-MY; Mon, 24 Feb 2020 23:37:59 +0000
Date: Mon, 24 Feb 2020 15:37:59 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Message-ID: <20200224233759.GC30288@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org>
 <20200221181109.GB925@sol.localdomain>
 <1582465656.26304.69.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582465656.26304.69.camel@mtksdccf07>
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
X-Headers-End: 1j6NIl-0092OD-4C
Subject: Re: [f2fs-dev] [PATCH v7 6/9] scsi: ufs: Add inline encryption
 support to UFS
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Ladvine D Almeida <Ladvine.DAlmeida@synopsys.com>, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 23, 2020 at 09:47:36PM +0800, Stanley Chu wrote:
> Yes, MediaTek is keeping work closely with inline encryption patch sets.
> Currently the v6 version can work well (without
> UFSHCD_QUIRK_BROKEN_CRYPTO quirk) at least in our MT6779 SoC platform
> which basic SoC support and some other peripheral drivers are under
> upstreaming as below link,
> 
> https://patchwork.kernel.org/project/linux-mediatek/list/?state=%
> 2A&q=6779&series=&submitter=&delegate=&archive=both
> 
> The integration with inline encryption patch set needs to patch
> ufs-mediatek and patches are ready in downstream. We plan to upstream
> them soon after inline encryption patch sets get merged.

What amount of support do you need in ufs-mediatek?  It seems like
pretty much every ufs low-level driver needs some kind of specific
support now, right?  I wonder if we should instead opt into the support
instead of all the quirking here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

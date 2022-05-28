Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2601536ADB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 May 2022 07:03:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nuobn-0006e6-5q; Sat, 28 May 2022 05:03:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+c5e11ba0f85895bf2855+6852+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nuobl-0006e0-2c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 05:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nU2UQDrRrTNgZCGlx3+Juyg9gJKqa9hFvsLcatF4nYk=; b=jBqIqxId5qsxSqyvCRKimTsSGF
 x3UgzDEc0qaKvTS/0PqB6cqllJiqffroDzf/ne5TM/JkYTDw9ylYt4yv1noS8imD5XL0ga8O/pCh2
 al3lbSUvhQ9NWw0e+H5rPNs38+GvS78r4EX50OkjoCloUbh1yUIhojPCg+RC7ipm75IA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nU2UQDrRrTNgZCGlx3+Juyg9gJKqa9hFvsLcatF4nYk=; b=Pap2HkD1WfsQ6xHONpvQpU7IFR
 RfQbfjZEeWfALEHaAwhc2t8mZsZTOL9Jzks4aNnRgux5OGnhhlkOiA6iR1XmEUgh9hQvKMs38wHwI
 7ZrnMrqxymYDwErOFEUy8RBJfbh/9W0n8XYFmnMMQAFQ+UCfmWZtM2Ga4eyOTVJ4fnFM=;
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nuobe-00011d-KS
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 05:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nU2UQDrRrTNgZCGlx3+Juyg9gJKqa9hFvsLcatF4nYk=; b=HqAA4MktGO1WMudvYma9Q5OBoR
 WgN6YSaxtPq6Naw9oAM/KxoqZkaAB0g/rKEE5aSlqLTCiRokm7eYH+PU+AxrxvTIAZ+gLY10zgbzN
 x0iaC+BgxU2ZAqsRHsswWxy9XrcEsKHFH38ftS1MaXged/qeSavGaRzSbR4rAuR4X4nUgKxJPErG9
 Y9nNFyEWEkO3DFJrt1tTyZ75poO8I4sJtdOUu86PGLF6YHA49WPSztat8ddJ58nRfjZS9WhsCBJJS
 wU16/5hH37wJKBAdlbbOw063jkQ7LCrTPDG/jt68ZFrdHa55r99Z0dChsVNMNsm9AFKABdG0F69Q6
 FgnVpuFA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nuobW-001SZy-Fk; Sat, 28 May 2022 05:03:10 +0000
Date: Fri, 27 May 2022 22:03:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YpGtDhV7V7gDk430@infradead.org>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
 <YpFDw3mQjN1LBd2j@gmail.com> <YpF1gPrQY3UFsgwC@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpF1gPrQY3UFsgwC@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 27, 2022 at 06:06:08PM -0700, Jaegeuk Kim wrote:
 > I think there's still some benefit to use FUA such as small chunk writes
 > for checkpoint. Did you measure if there is? Because some SSDs basically
 implemented FUA as an implied flush after the write, in which case it would
 not really help there either (but also not hurt). 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1nuobe-00011d-KS
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-block@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 27, 2022 at 06:06:08PM -0700, Jaegeuk Kim wrote:
> I think there's still some benefit to use FUA such as small chunk writes
> for checkpoint.

Did you measure if there is?  Because some SSDs basically implemented
FUA as an implied flush after the write, in which case it would not
really help there either (but also not hurt).

But as the previous two maintainers already said - this needs quirking
at the driver layer, not in the submitter.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

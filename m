Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94B9A878
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 09:19:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i13qk-00079C-Kn; Fri, 23 Aug 2019 07:19:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i13qj-000794-2a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 07:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fYE/jWK1CRZuDZ2tVBT+Ef/F2Gp0hZ+OjNZD7CcuN0=; b=IlYv2jQ5bCSSQ5i9CIWpql2kjH
 oDHpjHOYwXyi5nzq69QTFERItifPqTBedxJvN4LppnKlbDGmCOwVT7KSpynkLUMH1EInO0gxx7/+l
 iqyQH/kdK83pbdP6LYbLJ3oyaEzV6FJQTbA9TZvAtfaLhcYqjnTVy5Ztg6nLvz8X+kOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+fYE/jWK1CRZuDZ2tVBT+Ef/F2Gp0hZ+OjNZD7CcuN0=; b=Y
 9st/6utnME4sqaR88B++PgTljhjawig+Sfuse2dFtC8yzVjI3tS1AzvVwGVFBFHpVTR9/9u1Rh02R
 BZ9CR34W1V7TTjgdbs9zFvuVyf6GDSTGU1UAESfx5gVWSCDjDcH3m7jnrqtZ7okWmhTet4AkItgLd
 UHE+y2OlTR5zKCR4=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i13qf-00CgrT-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 07:19:05 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190823071851epoutp01cd97a2764142fed6911fe50768df5da9~9fCJBQhgb0128401284epoutp01U
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2019 07:18:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190823071851epoutp01cd97a2764142fed6911fe50768df5da9~9fCJBQhgb0128401284epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566544732;
 bh=+fYE/jWK1CRZuDZ2tVBT+Ef/F2Gp0hZ+OjNZD7CcuN0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=JPCoQLPyMnwUsXcRJAb87lIbwjVAz8UJnhO9geXbleKdINR95oS+Pk7MPNyeSIKlr
 Ie5LM4HsFuPx33ZSSTfcMnvc55/lFYB3Po/KTATm56/rPppRH16qhqPtM2q1rTtoUK
 Y+RZMMMZQWD9EG8hvLGNnIEbSL4l0oI/7oyWJQfs=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20190823071851epcas2p2a4a203c12c80c1285afac51eb7c84d8f~9fCIdn5SC1459514595epcas2p2h;
 Fri, 23 Aug 2019 07:18:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.182]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 46FCS92KMhzMqYkd; Fri, 23 Aug
 2019 07:18:49 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.3F.04112.9539F5D5; Fri, 23 Aug 2019 16:18:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2~9fCGBJdVk1882918829epcas2p3k;
 Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190823071848epsmtrp10b85cadf4258caf7cfd003e7d6717ccd~9fCF-zuWg1973319733epsmtrp1u;
 Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
X-AuditID: b6c32a48-f37ff70000001010-57-5d5f935942ee
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 77.E5.03706.8539F5D5; Fri, 23 Aug 2019 16:18:48 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190823071848epsmtip1133664f58af60792a11a792437cc8f99~9fCFn2bUi1770217702epsmtip1x;
 Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Herbert Xu'" <herbert@gondor.apana.org.au>
Date: Fri, 23 Aug 2019 16:18:47 +0900
Message-ID: <002b01d55983$01b40320$051c0960$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVZgoTeM6vEQWOMSaO8aX0QkbtHrA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjN7Xt9r6JdrqVudw3bujc0EQO2ne0uC2xmY/jMTMSZuOjGujf6
 Uoj9lb6WqdmEbFAB2dAYEQoSf8XNbgQtiMS1hCCs4kSyEYwarVskqwIriIABRdbycOO/853v
 nPt9J1+ujFAcoVWyApuLd9o4C0MlkK2XVhtStx8y5mrC1XI8OVFG4qYrvxL4pztVFP7tcK8E
 1/eVkDgYrZPixsBTAu8fSsKDTV4C35jxSHHVvWEC9/WdpbH/3nUpDt5ag++GpyW4tuE2hf84
 sQEPNUyROBDsIXH/xXoKd81VAVzT1y7BnnOTAJdWTtM41Pjx+pfZljM3JWxJ85dsa8dKtr/X
 zfp95RR7+3qAYptPFbG/HHskYb+52k2wo+0DFPt9iw+wj/yv5izbYcnI5zkT71Tztjy7qcBm
 zmQ+3Gp836g3aLSp2nT8FqO2cVY+k8nalJOaXWCJZWfUhZzFHaNyOEFg1r6T4bS7Xbw63y64
 MhneYbI4tFpHmsBZBbfNnJZnt76t1Wh0+pjyc0v+yPkfpY4QvevOz2GiGBynKsASGYLrUPnI
 abICJMgUsA2gga4wIRbjAEWiE7RYTAE0fqD2P0v0/jAdxwoYBOjxRLYoegDQ04fnpfEGBdeg
 5pAPxLESatAF/xMQFxHwGY0GxzvJeCMR6lG4a3/sVZmMhCtRw6QxTsthOmo82kOJeDnqqR2c
 lxPwNXThn3pCXEKN2nqHQdyqhGnIU+IUJUpUV+5ZkEzT6Er/chFnobpvRyUiTkRDoRZaxCr0
 oMqzgIvQwOmT84ERrATo6szzxpvI+/e++VkEXI2aLq6NQwTfQF23FjZ7AZVdmqVFWo7KPArR
 mIyOjvdLRFqFxir3ijSLhh6XggPgde+iiN5FEb2Lsnj/H3sMkD7wIu8QrGZe0DnWLb60H8x/
 ihS2DXRc29QJoAwwy+SXKz7LVUi5QmG3tRMgGcEo5YUHY5TcxO3ewzvtRqfbwgudQB87wEFC
 tSLPHvtiNpdRq9cZDJp0PdYbdJh5Se5fevNTBTRzLn4nzzt453OfRLZEVQzWp3SsqI8EehAc
 G/xA+D0yV5R8ZiL4SQgmrNr6Q7mueOmN4u+UjRHSvfH+u9fYVaaxqZzWuj0j1dtqyo7MKLt3
 Hv6o4VDyX1knc7/elr1xy+xkS0Yi0335meYLvW/vn9GkVONcYPNs5Kz2q+pXkvZ17zrVXjlq
 vlvzXulszY7pJ5HoQ4YU8jltCuEUuH8B2IqajSoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSnG7E5PhYg87bihZfv3SwWKw/dYzZ
 YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
 42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
 WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
 mT3e77vK5tG3ZRWjx+dNcgE8UVw2Kak5mWWpRfp2CVwZb7auYC04zl5xd8095gbGhWxdjJwc
 EgImEu9evGYHsYUEdjNK9B0xgYhLSWxt38MMYQtL3G85wtrFyAVU85xR4syCxWANbALaEpuP
 r2IEsUUEDCS2b/oNZjMLTOOQ2PVBHMQWFjCVuHekG2gZBweLgKrEvK/xIGFeAUuJtXNPskHY
 ghInZz5hASlhFtCTaNsINUVeYvvbOVAnKEjsOPuaEaREBKSkpQiiRERidmcb8wRGwVlIBs1C
 GDQLyaBZSDoWMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjn8tzR2Ml5fEH2IU
 4GBU4uEt6IiLFWJNLCuuzD3EKMHBrCTCWzYRKMSbklhZlVqUH19UmpNafIhRmoNFSZz3ad6x
 SCGB9MSS1OzU1ILUIpgsEwenVAPj/OSa9W1d/dfS9K63n54b1X3C+cSWAqnD/vI1HyIsY87q
 y9e/2CLn6c+WUXD5Ym3vnseaC/u2PP5mt3a5zZYUj0uvzY7c3Zv15QDjJeHpgkwt3gwHH/eF
 CF+KdStfHfH8kRKHhM5DuXgjtzMbfnMVufJKnMreU1zOr6S3rV5ln++hk4tZLD4qsRRnJBpq
 MRcVJwIAsdKINPsCAAA=
X-CMS-MailID: 20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2
References: <CGME20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2@epcas2p3.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nist.gov]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i13qf-00CgrT-Dd
Subject: Re: [f2fs-dev] [PATCH 6/9] dm crypt: support diskcipher
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
Cc: 'Ulf
 Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
 dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
 'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
 linux-samsung-soc@vger.kernel.org, 'Herbert Xu' <herbert@gondor.apana.org.au>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 'Jens Axboe' <axboe@kernel.dk>,
 'Theodore Ts'o' <tytso@mit.edu>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "'David S. Miller'" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 23, 2019 at 01:28:37PM +0900, Herbert Xu wrote:
>
> No.  If you're after total offload then the crypto API is not for
> you.  What we can support is the offloading of encryption/decryption
> over many sectors.
>
> Cheers,

FMP doesn't use encrypt/decrypt of crypto API because it doesn't
expose cipher-text to DRAM.
But, Crypto API has many useful features such as cipher management,
cipher allocation with cipher name, key management and test manager.
All these features are useful for FMP.
FMP has been cerified with FIPS as below by using test vectors and
test manager of Crypto API.
https://csrc.nist.gov/projects/cryptographic-module-validation-program/Certi
ficate/3255
https://csrc.nist.gov/CSRC/media/projects/cryptographic-module-validation-pr
ogram/documents/security-policies/140sp3255.pdf

Can't I use crypto APIs to take advantage of this?
I want to find a good way that FMP can use crypto API.

Thanks
Boojin Kim.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8AC97401
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 09:54:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0LSB-0008VL-SB; Wed, 21 Aug 2019 07:54:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i0LSA-0008V5-7w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 07:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HTqJmzQb78c+WqBPB/TdiHvNXR8CCp1GserLHPcAGAM=; b=R0Qw6ixe5YbqyMRt3eDakF9sQA
 PLXLFLo6T7DAwz5ClgRJjkYhhFub8MXE0/+5aGKfGAPaU7Ljmj3sJky2ycR5+ZSw2zSNbVJUU3LzH
 BtDbbWWjqP7yjTgBMphe40/+bN0jT6XSNg/82ObR5Rmfvb+excQpKJcDMudGaaWS6bTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HTqJmzQb78c+WqBPB/TdiHvNXR8CCp1GserLHPcAGAM=; b=f
 LtZETz/pgWtH9REvmm+KZxA5xVA9vZACu4cszggUrTV9G1Gt6QP3l/cp9EeyIQ+/cqp3E2ylZjhHg
 Y3FTFuJNb4PseGYOZ2ZRymJl+l0WSZm/bVqx3xcb8UtfGZZcoXNY8qHzBs17Kb5AVZidj+NjBYtvi
 doo/NHdht6f4eu9A=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0LS7-00AIU2-Vj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 07:54:46 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190821075436epoutp011a18db4b57402d98ffe823a9bfc7b6be~84OxaR3oK1951019510epoutp01-
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Aug 2019 07:54:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190821075436epoutp011a18db4b57402d98ffe823a9bfc7b6be~84OxaR3oK1951019510epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566374076;
 bh=HTqJmzQb78c+WqBPB/TdiHvNXR8CCp1GserLHPcAGAM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=B5jxDUEk9/Wv2ZsXCfJ0XkAJm9DIHY27cqGo72ZywbwCE+aVOvTsvyScwL4p6sybM
 owql64lYHWS43PFd/HInQdLPv83SRaGXip0WkjESDr2vLz6mjff1A3/7j7+O7TOWyK
 7NAk6jkpVH93RiwuqnuxfGH0LViWO/nOoUaD+g4w=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20190821075435epcas2p2329ac0d31488e7667c632810cc878449~84Ow2IQSF1069310693epcas2p2D;
 Wed, 21 Aug 2019 07:54:35 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.182]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 46D0LK1qCszMqYkr; Wed, 21 Aug
 2019 07:54:33 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.06.04112.9B8FC5D5; Wed, 21 Aug 2019 16:54:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20190821075432epcas2p3758bf7b07f209fb4094d79bf46c8f4e9~84OuTKtNR3087030870epcas2p3N;
 Wed, 21 Aug 2019 07:54:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190821075432epsmtrp11638c73e7bcdf5c06195a2218aa9d41f~84OuR59zE2895328953epsmtrp1D;
 Wed, 21 Aug 2019 07:54:32 +0000 (GMT)
X-AuditID: b6c32a48-f37ff70000001010-86-5d5cf8b9dcde
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D3.79.03706.8B8FC5D5; Wed, 21 Aug 2019 16:54:32 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20190821075432epsmtip253f2d9c05d500f90970ebcdc57e310bc~84Ot-od_T3239432394epsmtip2r;
 Wed, 21 Aug 2019 07:54:32 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Mike Snitzer'" <snitzer@redhat.com>
Date: Wed, 21 Aug 2019 16:54:32 +0900
Message-ID: <001a01d557f5$ab0a4a40$011edec0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ko
Thread-Index: AdVX9QyEG4+5qw7KRk2/gqnMxtuMUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxT29r2+9wBLrhXntZrZvWkWJGCLll0WmVt0+jJNrNkSo4LdC7wA
 WX+tr3WwZJNtWBGadZopUruGuWm0C0ELCigYRzs7hl11qJOquEXiIvhrKAR/jbV9mPHfOd/5
 vnvOd08OQyjraRVTbrYLNjNvZKlU8kQwE2d3jBcWaRqHUvHooxoSN/96lsA/XndTuHdPRIa9
 0WoSd93bL8dNnc8IXDc0Dw82ewh85YlTjt03hwkcjR6lceDmZTnuimXhGwOPZbjBd43Cvx9Y
 jYd8YyTu7Oohcd9JL4VDE26A90VPy7Dz2CjA212PaRxu2vDWHK71SL+Mq275mDtxZiHXF3Fw
 Af9Oirt2uZPiWn7Yxp1qfCjjvjj3M8HdP32J4r5q9QPuYeBl/fRNxmVlAl8i2NSCudhSUm4u
 LWDXvGdYYdDlabTZ2nz8Oqs28yahgF25Vp+9qtwY986qt/JGRxzS86LILn5zmc3isAvqMoto
 L2AFa4nRqtVac0TeJDrMpTnFFtMbWo0mVxdnfmAsi9XVU9Z9TIXzSoCoAiGqFqQwCC5F4RsB
 UAtSGSVsB8gd9E8mIwBVj18nEywlHAMoun12LWCSir0PUiVOF0C7XbspKbkN0K3zz5ICCmah
 lnDipRQmA2aiX65+I0+QCPgvjQZHupOkmVCHBkJ1yTlIuBAd/Pt+PKYZBcxHA4YEqoAzUE/D
 YJJNwPmo7a6XkKZWo/bIMJDwDLR/p5OQWuWgCx2PyEQrBD9n0E/hKloSrESH97pkUjwTDYVb
 J3EVuu12Tsbb0KVD39OS2AXQuScvCkuQ59YOkHBPxM00n1wsfcSrKBSbnC0d1QSf0xKsQDVO
 pSRcgL4d6ZNJsAo9cH0mwRy62DtOfg1e8Uwx6Zli0jPFmOf/to2A9IOXBKtoKhXEXOvSqZsO
 gORRLOLawZnf1nYDyAB2uqK9f3ORUs5vFStN3QAxBJuhqPBuKlIqSvjKTwSbxWBzGAWxG+ji
 G9hFqGYVW+InZrYbtLrcvDxNvg7r8nIxO1sRSOsvVMJS3i58KAhWwfZCJ2NSVFXg+LyNF1t7
 vcsVc97u2LyhPgidT6/Oivas2LOmAjR9dzyYJYxX3gG+daubjvlnLFHb/3QMn/0y8sdcIT1t
 7N77Wy483XX+VKT5n/mFfemv8b627Mwdbe8uyPRNlK9/Z9rdjZ+G//poeb0exg6v00+7g7wT
 oVhaAxyDwVDWKLeq4kAnzZJiGa9dRNhE/j+QRa7/KgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSvO6OHzGxBjNXaFh8/dLBYrH+1DFm
 i9V3+9ksTk89y2Qx53wLi8Xed7NZLdbu+cNs0f1KxuLJ+lnMFjd+tbFa9D9+zWxx/vwGdotN
 j6+xWuy9pW1x/95PJouZ8+6wWVxa5G7xat43Fos9e0+yWFzeNYfN4sj/fkaLGef3MVm0bfzK
 aNHa85Pd4vjacAdJjy0rbzJ5tGwu99h2QNXj8tlSj02rOtk87lzbw+axeUm9x+4Fn5k8ms4c
 ZfZ4v+8qm0ffllWMHp83yQXwRHHZpKTmZJalFunbJXBl3OqezlYwg6Oi7cYm5gbGI2xdjBwc
 EgImEtM+cHUxcnEICexmlFg16QZjFyMnUFxKYmv7HmYIW1jifssRVoii54wSD39eBUuwCWhL
 bD6+CqxBREBT4sTtKawgNrPANA6JXR/EQWxhAVOJe0e62UBsFgFViaXP3wPZ7By8ApYS9+JB
 orwCghInZz5hATmHWUBPom0jI8QQeYntb+dAXaAgsePsa6i4iMTszjZmiKV6Ehd3fmGZwCg4
 C8mkWQiTZiGZNAtJ9wJGllWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMHxr6W5g/Hy
 kvhDjAIcjEo8vDtuRscKsSaWFVfmHmKU4GBWEuGtmBMVK8SbklhZlVqUH19UmpNafIhRmoNF
 SZz3ad6xSCGB9MSS1OzU1ILUIpgsEwenVANjcVNZnlGXxD0pT0sbo+QV7PNEp90NOvP9wOXl
 ubMDp85MW/HfyaitQ3zr5d+zitTdAy4m308+t/jIDR2XdxHl6Z+vt8UuT9421zd+h6Nl/q0M
 kb2LZ/13SKt+cPrVkmu7X2bIhQV+j9rfcVJoQtHaO/kTVjnKxt+va+/TC6x/3Pk19WTu8yNT
 lFiKMxINtZiLihMBBGnmbfsCAAA=
X-CMS-MailID: 20190821075432epcas2p3758bf7b07f209fb4094d79bf46c8f4e9
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821075432epcas2p3758bf7b07f209fb4094d79bf46c8f4e9
References: <CGME20190821075432epcas2p3758bf7b07f209fb4094d79bf46c8f4e9@epcas2p3.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0LS7-00AIU2-Vj
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

On Wed, Aug 21, 2019 at 09:13:36AM +0200, Milan Broz wrote: 
>
> NACK.
> 
> The whole principle of dm-crypt target is that it NEVER EVER submits
> plaintext data down the stack in bio.
> 
> If you want to do some lower/higher layer encryption, use key management
> on a different layer.
> So here, just setup encryption for fs, do not stack it with dm-crypt.
> 
> Also, dm-crypt is software-independent solution
> (software-based full disk encryption), it must not depend on
> any underlying hardware.
> Hardware can be of course used used for acceleration, but then
> just implement proper crypto API module that accelerates particular
cipher.

I'm sorry for breaking the basic rules of dm-crypt. 
But, if I want to use the H/W crypto accelerator running in storage
controller,
I have to drop plaintext to bio.
I think the "proper crypto API module" that you mentioned is diskcipher
because diskcipher isn't only for FMP.
Diskcipher is a crypto API that supports encryption on storage controllers.

Thanks
Boojin Kim



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

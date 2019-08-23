Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71D9A68A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 06:20:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i114H-0006mT-Pb; Fri, 23 Aug 2019 04:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i114G-0006mM-3q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 04:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U9CQGfPf7Zxphg8CE4vj2CGEfHozLAw9BdLrulJXIpQ=; b=fkBAXzOLTV7WdeIqBwpht6zmba
 EeOvvJk0bS2B40VjiKETxi0TmKo4Quld0txwr4HtR9lIhatlzpaSU89w0W+4N7I4Gu32B4qihYZms
 w7++HeY9aV1BEOZ9SF3QqQOSiHNg+0yCvExLOhWO5fPdYAjUrbdByt8O0M9EUfohH5ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U9CQGfPf7Zxphg8CE4vj2CGEfHozLAw9BdLrulJXIpQ=; b=U
 J4jJiqe/kUDRQtRBilekEtqVnLPwKm+moEIJcLQeO60bsLldoeuPN6mM0W15nAj8ExM6MQphpHOVs
 6VlhcAXLEZxY41DvKHjHrfsHttc9XYAuGEPjOHw7+n2lHQnKX9nwIBHPkqQsFxSaflUyD+12pPlE+
 tSdkSsWIfSSeSYA0=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i114C-00GsG6-Jb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 04:20:52 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190823042041epoutp045fcc1db08abca912e3d7e108e3d2a709~9cmkm7kNp2503225032epoutp04p
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Aug 2019 04:20:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190823042041epoutp045fcc1db08abca912e3d7e108e3d2a709~9cmkm7kNp2503225032epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566534041;
 bh=U9CQGfPf7Zxphg8CE4vj2CGEfHozLAw9BdLrulJXIpQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=QhzQ99Q+s7OJyjefXhpYoDvAsW3DK7/LFIU21EA7b4+6nh13DmSti3lqMKcmGAKWO
 lzD+8En9ocjh3hZIFpZ81fbsnqaYkA5jsajtaBr/CI/RjF1UQLRbTd9OwkMga6N/8V
 xC6VaLUUqY9vM+HB9jVKYNeeRf7T5kz4Cxj0x1l8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20190823042040epcas2p17215f2c69bfbe74bf1dd25f056d546a5~9cmkK5AaC1326813268epcas2p1e;
 Fri, 23 Aug 2019 04:20:40 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 46F7VZ6Kj9zMqYkl; Fri, 23 Aug
 2019 04:20:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.3F.04068.6996F5D5; Fri, 23 Aug 2019 13:20:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99~9cmh6hZPJ2766127661epcas2p2u;
 Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190823042038epsmtrp1c49a7bd6aa12bbb926aaf66ce98445cf~9cmh5Y2xO1457414574epsmtrp1Y;
 Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
X-AuditID: b6c32a47-5a1ff70000000fe4-76-5d5f6996ca5e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.DA.03638.6996F5D5; Fri, 23 Aug 2019 13:20:38 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20190823042038epsmtip202663c369e2490843c132f4082264787~9cmhs-2qz3185331853epsmtip2_;
 Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Herbert Xu'" <herbert@gondor.apana.org.au>
Date: Fri, 23 Aug 2019 13:20:37 +0900
Message-ID: <017901d5596a$1df3a590$59daf0b0$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVZag9UHlxLlVT+SOip4zSP4KGOkw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTZxjOd3e9qz+6nRX1s1m27oZ/qAFa8LoPAwtjTC/OP0imWdx09VIu
 Be2v9FoGJhMnrivIKPwxlcoMKjFaZbBCEB1ls7IhE4SIuEGcU2mWFaIYWEmqxa3tYcZ/z/u8
 z5Pvfb43rxxXNlAqeYnFIdgtvIkhlxKd19fr0o6V6Pdoqh5pUOQfN4Faf/0FRxf/8JDo5jeD
 GGocOkKgwJOTMtTSHcPR0cnXUKjVi6Pfn7lkyDMxhaOhoTYK+SfuylBgfCP6834UQw2n7pHo
 9pmtaPLUHIG6A/0EGrnaSKLefz0AnRjqwZDr+whAX9ZEKdTX8lHeWq7jwhjGHWn/jOv8aR03
 Mujk/L4qkrt3t5vk2psruB+aZjHu8MDPODfdM0pytR0+wM36Xy9c/rEpp1jgiwS7WrAYrEUl
 FmMu88GH+vf0rE6jTdNmo7cZtYU3C7lMwfbCtC0lpnh2Rl3Km5xxqpAXRSbjnRy71ekQ1MVW
 0ZHLCLYik02rtaWLvFl0WozpBqt5s1ajyWTjyr2m4vovLlE2F1UWGBmQHQLDsmqwRA7pTfBY
 7QO8GiyVK+kuAKPtNwipmAHw5umzWEKlpOcAnLtRUQ3kScfxW0pJEwAwGI0AqQgDOFxZSSYM
 JL0Rtvf5QAKn0Bp42f88KcLpFxQMzQSJRGMlzcL7vUeTBoJeByN143gCK+hsGIr1AgmvgP0N
 oaQep9+Alx834tLcatg1OLXwQDpscdXhkiYFnqxyJfNAep6C1+YfAclQAJ9MP10IvRJO9nVQ
 ElbBsMe1gCvg6LmzlGSuAXDg2ctGFvT+9RVI5Mfp9bD1aob0FW/B3vGF2V6B7uvzlEQroNul
 lIyp8NuZEUyiVfBpzUGJ5mCsthGrA296F4X0LgrpXRTG+/+zTYDwgdWCTTQbBTHTlrV4136Q
 PIsNW7tA563tQUDLAbNcYXN/ukcp40vFcnMQQDnOpChK6+OUoogvPyDYrXq70ySIQcDGd1CP
 q1YZrPEjszj0WjZTp9Nks4jVZSJmjcK/bGy3kjbyDmG/INgE+0sfJl+iOgTa0qbqm/V9jtVf
 Z53v3rUv9mOVO/zQb9j/fojKM/szUtnjO9JbI7R9H/XJeHN5bvnE7RVOLv9M0528fo/Rmk37
 rtxZdW1L5eiuVw/4luGzhbETBZvCZWNthwV273QPp3qQvzOwO+U7w+f5D09Hr2zjU3c6h8uY
 /hfhd9fk/P3b8yBDiMW8dgNuF/n/AHcjOXksBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7bCSvO60zPhYg5vd4hZfv3SwWKw/dYzZ
 YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
 42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
 WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
 mT3e77vK5tG3ZRWjx+dNcgE8UVw2Kak5mWWpRfp2CVwZExvXsBe0sVfsvXyGtYHxAmsXIweH
 hICJxPRzQl2MXBxCArsZJfZt2goU5wSKS0lsbd/DDGELS9xvOcIKUfScUaJ5wlYmkASbgLbE
 5uOrGEFsEQEDie2bfoPZzALTOCR2fRAHsYUFTCXuHelmA7FZBFQlvk64BTaUV8BS4smfI4wQ
 tqDEyZlPWEAOYhbQk2jbCDVGXmL72zlQNyhI7Dj7GmqVnsTatgnMEDUiErM725gnMArOQjJp
 FsKkWUgmzULSsYCRZRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnAK0NLawXjiRPwh
 RgEORiUe3oKOuFgh1sSy4srcQ4wSHMxKIrxlE4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeeXz
 j0UKCaQnlqRmp6YWpBbBZJk4OKUaGJleBy6rntzmuGvaFQ/TC0tPxR1V2Lv0/O0JJTxHt4iq
 PW/OX3fnooDzAs+gmqwVK5juHXgRWVM+MbmyWHaWdmiF5pRFR3sX/+qpvK/L7ugiasB35P8l
 BRYdxbOKQgI+W66KntnNPbVk0132vqUn7/1Z+4+jPnjLzQahq/ZME2X+cSm0zQy9bKDEUpyR
 aKjFXFScCADJMiVD/QIAAA==
X-CMS-MailID: 20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99
References: <CGME20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99@epcas2p2.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i114C-00GsG6-Jb
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

On Wed, Aug 21, 2019 at 17:19:41PM +0900, Herbert Xu wrote:

> On Wed, Aug 21, 2019 at 04:57:41PM +0900, boojin.kim wrote:
> >
> > Can you tell me which patch you mentioned? Is this?
> > https://patches.linaro.org/project/linux-crypto/list/?series=22762
> >
>
> Yes this is the one.
>
> Cheers,

I looked at ESSIV patch-set.
Can you please confirm that you mean:
'Register FMP as the template of skcipher instead of diskcipher,
and simplify the interface for FMP user'

If yes, I think the following API needs to be added to skcipher:  
- _set(): BIO submitter (dm-crypt, f2fs, ext4) sets cipher to BIO.
- _mergeable(): Block layer checks if two BIOs have the same cipher.
- _get(): Storage driver gets cipher from BIO.
- _set_crypt(): Storage driver gets crypto information from cipher and 
writes it on the descriptor of Storage controller.
Is it acceptable to skcipher ?




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

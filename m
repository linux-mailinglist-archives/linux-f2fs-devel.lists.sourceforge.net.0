Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 789689751D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 10:37:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0M7c-0002Ok-6u; Wed, 21 Aug 2019 08:37:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <herbert@gondor.apana.org.au>) id 1i0M7a-0002OY-BL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EvNOROSwxndi26Wu5kOx9aFkEOIIS4ZMKJ9RpqtJs14=; b=DZI9DCOjKRLQVOu3ba99HovA2D
 9b6rsq7M85xe6vu2+EbD93LRJf47WEreEOM+HECyqEF2QKSA/wPSlaQNFCpQg609clfLu0PZLSPTc
 LuYkEXFBNRwrt3tZQY0SEx3PMH6hwVTBxV/SGsTx+bY8OCSDnxawlAArfjtxQgdOPTMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EvNOROSwxndi26Wu5kOx9aFkEOIIS4ZMKJ9RpqtJs14=; b=PAPnZgYivXdVfKI8+oQM4QVfEu
 1zn6AIJMB0rN6RdT3Wy/PA+G//dWNCKMpjQq/xGLmpX25vm8uda7cUQrBXR1e+zPSuZcsaFoBXPW6
 CDdP3tyMMmzML+SAEz73+c3s9FUD4oLkOhZAMcXrYPkNIqo8R8ygL395SsMJlEiXd/dY=;
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0M7X-00AMDZ-OX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:37:33 +0000
Received: from gondolin.me.apana.org.au ([192.168.0.6]
 helo=gondolin.hengli.com.au)
 by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1i0Lnm-0003cr-QG; Wed, 21 Aug 2019 18:17:07 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1i0Lng-00061p-Pw; Wed, 21 Aug 2019 18:17:00 +1000
Date: Wed, 21 Aug 2019 18:17:00 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "boojin.kim" <boojin.kim@samsung.com>
Message-ID: <20190821081700.GA23138@gondor.apana.org.au>
References: <CGME20190821075742epcas2p4b9104e8249067c048d4050f2888da0a9@epcas2p4.samsung.com>
 <001b01d557f6$1c49fd40$54ddf7c0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001b01d557f6$1c49fd40$54ddf7c0$@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: apana.org.au]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.0 PDS_TONAME_EQ_TOLOCAL_SHORT Short body with To: name matches
 everything in local email
X-Headers-End: 1i0M7X-00AMDZ-OX
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
Cc: 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
 dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
 'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
 linux-samsung-soc@vger.kernel.org, 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 'Jens Axboe' <axboe@kernel.dk>,
 "'Theodore Y. Ts'o'" <tytso@mit.edu>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "'David S. Miller'" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 21, 2019 at 04:57:41PM +0900, boojin.kim wrote:
>
> Can you tell me which patch you mentioned? Is this?
> https://patches.linaro.org/project/linux-crypto/list/?series=22762

Yes this is the one.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

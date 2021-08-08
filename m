Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5D3E3934
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Aug 2021 08:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XTkau/vwmF0AhveFnYJgeKUBIUvz0Oc1m8wB8cm0Ufs=; b=I+2GXvGabhM+fzOu1y4SDwnUj
	///7FpiaDBg2VauxkdCd9BtInSwx8lpSRKgwzlHgVoiQ+IhW/pTJadHIoVgzBcBVp2fjvj+NfkWrZ
	mbfGceo9OhnsKIEZJLjhLvJ4K50LGdhk/0U+B3juUqcqlOlbx/VuUEY3ZaPI4GZ62Y0+k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCcYw-0003xQ-4n; Sun, 08 Aug 2021 06:45:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=8470769c3=damien.lemoal@opensource.wdc.com>)
 id 1mCcYu-0003xI-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J86qP9it+nkm99YgHGRVh0Z718ief8bV+tR4GtFtH3M=; b=RFGYYmiwdMkdOtk69ATqEX2rZk
 KICnrMmNLi3NSodbGGFJaC+FeJUOqC9/Mu0K5aJui5GmusarlmfcI4V5hwGQ4tPVp84YYB3aaVrbR
 hpTavzlUFRFIOOW+9EGcaR0sEdI/pINMf6DQBIHR1Y520MSi1dyElTqDg4WW1wqGkiAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J86qP9it+nkm99YgHGRVh0Z718ief8bV+tR4GtFtH3M=; b=JWGpTQ681+SSd/qLkRh5rFxCi3
 ZYOO0JN5lYNRg9ZKYpuz3HHK/1rp1yi7j1iBWWwhTnuR2BjIM73zdgJ+3wjW1RaWaucdcsRZ07h5E
 O2BFIhFh9j3FQbMhGFumM73510+F6UP1bl5Yb9BLGOd9Vfupzcr/VCE/v1EHQpZjeJkE=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCcYl-00GYcS-0T
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 06:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628405122; x=1659941122;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=UJc/Hvuwn3lsRk9fHecnmjRpT7KEQJhsFR+AONwK1es=;
 b=ctDnmjeUlg6kBu5Xu8hxwf+2NKD8zH4/4Ngn/Q2Z9RPIFxlUeL0nrC7J
 /k9KfH77vQulAoGb317nCACbuPGdOJ4/dPCbTvl1WtwnbKdrkOhxjGK/i
 4KQ0j8mRvbRXlOHq3LIhk1myQO4EVv5mW5uaHXDf2T8s/cJev7DBeoCOd
 2KU5CEoXnslVe/Cxvk2AcysjrwpE7JPxiJhhcx5/OIbtNFWN7KlkcYNaS
 XDvH+7ugTdxfzDYQX1Pb04SHROSKHvZo/9yMLNCc5WwFJfytNBRXcQ/KS
 hGdH1K+KyCLlKQ/M46XnzqL7gctR/Bt3/SXFCzJXYvJrcm9QusT9F4s+u A==;
X-IronPort-AV: E=Sophos;i="5.84,304,1620662400"; d="scan'208";a="175810982"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Aug 2021 14:29:44 +0800
IronPort-SDR: 7ENM7Ctsyzbxbs9Whfex8J+DbPU4fwzTVvbqicchLxOZ6MVZPwls9S9tRnkQG8Jk5oUdpwv7lA
 4nPOUH9zR0R7+b6X3QTlZGShpFCuEyb7wmk/S2D/QhtEBw6Cmr7/jBZm5LDn32qwUKhnzM+AbK
 Vhv5TPBIHKQUcuLaa1MiFLrhke6ah8a2d5SONcCMz705MIt9vR/jiBsu5xDKPBLvXpCANADwFV
 dkgkdhlO4Igiz+zuB7wJcKEDot6etYbbxUB5WrnXnJPfBUbhnLb13zYzHWgiOybcEMkvjzr/yz
 PokYfDCYOKV8YTBKLzR2Zj6T
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:05:18 -0700
IronPort-SDR: YhEFQpny3zKYw6P8tmRvwLmd7OXuud8ehKUe56rQjcwxePNXXqCT3wHHuc0a9x2ykmYRnufnAz
 moWkS+Z5bTkA0koCNGzteqSGYZcVSPNNQZMvfXHMSAnqpiyYWbT1gF97t8hHtaPCqKEhOeQMDF
 9/Yh2HOlLlZUPgnNfggY76e2aPa/XDNPWFk7TC4PcPw5fDAcuSnRMr52h6gPJACVBxRNFzpVqi
 uNr6TesLXhkpquRYAKe0qXyXR5la7wbKWZkZ6A3oV3eKf1XqFHyUcRWYv9vrWFn359O2pWKkLk
 X00=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2021 23:29:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gj8T41bzyz1RvlM
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:29:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-language
 :content-type:in-reply-to:mime-version:user-agent:date
 :message-id:organization:from:references:to:subject; s=dkim; t=
 1628404183; x=1630996184; bh=UJc/Hvuwn3lsRk9fHecnmjRpT7KEQJhsFR+
 AONwK1es=; b=Y5YfW8nIddnMzU+ouRnx840tMtKW/nOcMoaJRtItG0ajKAP9qxF
 PG758L9aw3q3S1NCXP2qWKXvAly/Gh7BC/dVS7zqDMu48nydiQ/ENdFdpYLOtz/O
 0yWjP0wGawZnWHC5lBTLukZ8/NiKWt/URaA61InU9IlLVl0S4b8Jheh0JxaL3JCg
 pzUnJmu2c7HgoUSKZgF02m6JSrL85yiXHgl8I9P3qmXet1Sh0NRi+ayUmV/nU7K3
 kLnd3z94F4PUAH7sI+R7T1Kkbdjm5BKautGRE5YLbAgzwl1f5Bl5LFr9tisU0WbN
 j7kcw3oBDDE/8eZ80kYj0vFH57kHUMPbwQw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Wx_xPF9atyXe
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Aug 2021 23:29:43 -0700 (PDT)
Received: from [10.225.48.54] (unknown [10.225.48.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gj8T25ShMz1RvlC;
 Sat,  7 Aug 2021 23:29:42 -0700 (PDT)
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-3-damien.lemoal@wdc.com>
 <0141fb21-c0dc-d743-6af9-c2b26d34c4ba@kernel.dk>
Organization: Western Digital
Message-ID: <ab7925cb-c6a3-0c32-093b-9ac8f17f0c3f@opensource.wdc.com>
Date: Sun, 8 Aug 2021 15:29:41 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0141fb21-c0dc-d743-6af9-c2b26d34c4ba@kernel.dk>
Content-Language: en-US
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mCcYl-00GYcS-0T
Subject: Re: [f2fs-dev] [PATCH v3 2/4] block: fix ioprio interface
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/08/08 1:18, Jens Axboe wrote:
> On 8/6/21 5:18 AM, Damien Le Moal wrote:
>> An iocb aio_reqprio field is 16-bits (u16) but often handled as an int
>> in the block layer. E.g. ioprio_check_cap() takes an int as argument.
> 
> I'd just reference kiocb->ki_ioprio, that's transport agnostic.
> 
> Apart from that, this one looks fine to me. A better commit title
> would do wonders too, though, it's very non-descript.

OK. Will cleanup commit title and message.


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

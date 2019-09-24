Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF275BC663
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCil6-0002w6-96; Tue, 24 Sep 2019 11:13:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1iCil5-0002vz-2a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Sep 2019 11:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRiypp73jpCmvvDdzm0LBpX6sT22rFZNPZV3RnyetwY=; b=Hd4anmouvVeNn00lfXr0eak+uV
 EBO64StbJiVMLihOCueAodtHz2XU0Txr3amPhj0aDFTlC6C3Zw3B1LT+lzLjRKwNgYOrATG/jSsx6
 9LX1r/ovwqXfVOiIDMh+vtWkSXTZX6JdqOJnxgV9gIGfIC7A917CBshS/esVVRxrUwZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRiypp73jpCmvvDdzm0LBpX6sT22rFZNPZV3RnyetwY=; b=QSA828QL5ds+8Eyz+S678Ejcm5
 NlyQGXeHa5bJZ7Tvvs0pQ3B8tqwIPUxhZZOEXvgJ3/OTJujOFZWV/lxvkAojvXEzfuWIhfp6SfxRJ
 z6JLeFSzHqxCWqa93dNUx7c5AAkk68X2pvE64D8id0UDP+S6H4kwD4ARNtyLi0IYwcRQ=;
Received: from [210.61.82.183] (helo=mailgw01.mediatek.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iCil1-006tEp-GC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Sep 2019 11:13:27 +0000
X-UUID: 6b4dcb537e034f2fac2ed0db970a76ec-20190924
X-UUID: 6b4dcb537e034f2fac2ed0db970a76ec-20190924
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1038858326; Tue, 24 Sep 2019 18:57:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Sep 2019 18:57:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Sep 2019 18:57:49 +0800
Message-ID: <1569322670.16730.28.camel@mtkswgap22>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Satya Tangirala <satyat@google.com>
Date: Tue, 24 Sep 2019 18:57:50 +0800
In-Reply-To: <20190821075714.65140-3-satyat@google.com>
References: <20190821075714.65140-1-satyat@google.com>
 <20190821075714.65140-3-satyat@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1iCil1-006tEp-GC
Subject: Re: [f2fs-dev] [PATCH v4 2/8] block: Add encryption context to
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang
 =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On Wed, 2019-08-21 at 15:57 +0800, Satya Tangirala wrote:
> @@ -827,16 +839,31 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
>  	if (rq->ioprio != bio_prio(bio))
>  		return false;
>  
> +	/* Only merge if the crypt contexts are compatible */
> +	if (!bio_crypt_ctx_compatible(bio, rq->bio))
> +		return false;
> +

Since bio_crypt_ctx_compatible() lacks of consideration of inode, I am
not sure if here may lead to incorrect merge decision, especially for
f2fs which does not allow merging different files.

Thanks,
Stanley



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

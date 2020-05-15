Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2F1D45FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 08:35:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZTwj-0005mT-OQ; Fri, 15 May 2020 06:35:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1jZTwf-0005m9-FX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 06:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dnVzAwZEKYSKKY4z6dkr6lk8gdmk1Zn9tS3rjZChFxw=; b=hyXgG1TVmTgt3ZbHl6ZMYDU6jY
 DzCQV4LE1oHR0QkqVwLVPuAmmrk+ucChS6mp3GS6Fx9+VwVGDcX+aYLcGXuPaPnEZbqzQcpc/tP4p
 yPR3Uf8N471SU7sDLJ9JU/+LEpmBTn/0ds+2E9f9gFwwKhyWPEuj4enxfCrCYmBaw2lY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dnVzAwZEKYSKKY4z6dkr6lk8gdmk1Zn9tS3rjZChFxw=; b=jfccXDcnRd1U2pGb7AVF7yr/E1
 Q1WadFsO16aiI8Gus6HPnaAf8vJWJEZvjn8HMLazUrFOhDmyVIcdhbgKBvleEcaCbgUOLO8g4h9CI
 oCei27qEh5GKxHGthAJuM8d1+g2QiXpPyOE4eJzam3yeNnzAS80kizBYRShZrH0CMWuE=;
Received: from [210.61.82.184] (helo=mailgw02.mediatek.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jZTwX-00H1Ff-QA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 06:35:42 +0000
X-UUID: a627162ab9be4896a6a78854bb275d10-20200515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dnVzAwZEKYSKKY4z6dkr6lk8gdmk1Zn9tS3rjZChFxw=; 
 b=kwP3dkT2wnhIK6hP6had2V0Z7rwvK+3/mjplUJSj+Y2YTlsYDUe1aNcX60PT1zJsQI+DGMO5AOQuCjtilA4TxJRcvm/jQ4MZXj4SIX54zHioqFt/GT2+ucgVaVjbC/X8ONuXj0OGZArn4uLYaSbrzzSD73g88Df20DCAmLwlh5U=;
X-UUID: a627162ab9be4896a6a78854bb275d10-20200515
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 782748912; Fri, 15 May 2020 14:35:27 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 14:35:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 14:35:24 +0800
Message-ID: <1589524526.3197.110.camel@mtkswgap22>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Satya Tangirala <satyat@google.com>
Date: Fri, 15 May 2020 14:35:26 +0800
In-Reply-To: <20200514003727.69001-8-satyat@google.com>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514003727.69001-8-satyat@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZTwX-00H1Ff-QA
Subject: Re: [f2fs-dev] [PATCH v13 07/12] scsi: ufs: UFS crypto API
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Eric
 Biggers <ebiggers@google.com>, Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On Thu, 2020-05-14 at 00:37 +0000, Satya Tangirala wrote:
> Introduce functions to manipulate UFS inline encryption hardware
> in line with the JEDEC UFSHCI v2.1 specification and to work with the
> block keyslot manager.
> 
> The UFS crypto API will assume by default that a vendor driver doesn't
> support UFS crypto, even if the hardware advertises the capability, because
> a lot of hardware requires some special handling that's not specified in
> the aforementioned JEDEC spec. Each vendor driver must explicity set

explicitly

> hba->caps |= UFSHCD_CAP_CRYPTO before ufshcd_hba_init_crypto is called to
> opt-in to UFS crypto support.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

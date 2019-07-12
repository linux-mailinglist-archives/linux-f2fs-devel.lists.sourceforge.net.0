Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A866478
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 04:38:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hllRd-0008Ir-RJ; Fri, 12 Jul 2019 02:37:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1hllRb-0008Ig-RT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 02:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=; b=Qvo6vu84YGCFXn3ocADshU8ZTf
 CVK2Aq4ZEwp6Dvv33sejp6lgJyy/vesTuTqb3X9I56o7CiWVyrExGoTxLQkVLW8IWm7Pss642ZwwS
 L/7fE/FiYL1rAsOtGBpKuRe4cWVfJzesdX4SDr+gnWBm6RoBTMydAFK+gTqnMbWdyHr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=; b=Iqb3cv8p3R5LN6vBJmZo8JP7mk
 bm42WtbNPkOkMOPFb2Jk6IW+RgzzLdLHgGN/dZ8xsh6lkjIpXEZprIvMGZGQMU8o68OmHGhxDXOJe
 3LE8IU5DfL2EV9Zc0dHH9zG5nWLVvWQIwk194y+rKtMqiKnlxqF2v5tLnoz19ZTbcfmo=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hllRZ-00Fqwv-R7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 02:37:55 +0000
Received: by mail-oi1-f195.google.com with SMTP id w196so6154993oie.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 19:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=;
 b=ZRxqi0+uwfd/EXs2qS0gTss24yOP3a/nHPkifQtAcCm58w79HcGNu4EWv0NbxYawku
 AK1T8FHFgDxt/JZli9NM3Qa96jOu7ZgESJVqYzzOP6+/XCRrSitHAMIwLrcDeL5gyS3r
 xbLsolmvHSvDmwetd/a0I/ZoztCE7EXCtMp69KTXt1DSL0nQHHZiRJJnpuE007cl1B8S
 KwOInMzsJJTYqUCVuYlEzk3L1PRoDm0osjnYi427GGq8yc3jBvsYP/bBDi3/zip7I21/
 83G5Md5fG62b2qkvYzE0T4YCqEoqZ/kNEIeLFNgXTRiuL0SEPdzM8kda2EvGJfPUaMU6
 xYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=;
 b=RO9qu3ur9bVxPB0EoSyt0WBkQCAKfl6MYFfpLHgCF7UD/cjaeYk++lsgynxtqTaaqS
 tkD4BzIxUjG0CoLseYK5odMHe0O8vxLdT2b27ACHnjYkue2qY6CMlLDZaSmj1mhJW1zz
 S+KOTAdNp6R5AKBXV51ckkPtNRDGB2HsaccAuGHxfgFrrtGZddNNp/XnxNL6kv73fiwl
 QyV4XJ8nMYt9TUZA2NSydEpGeT+xAWoV8Bq3QGzcYF9VatoUGpMuPQYCYgTnQzykS9Ao
 mOJXh3vpJzgvBKQxRmrozsoKrvnFxodtOVw81eKc5LwzxUvymb93rmfj30VAYfgbVQzI
 YHew==
X-Gm-Message-State: APjAAAUT3dq4knvCWkqwOSk4gkV7yu+IaDAyPwNngUfnICJBaEEL0y/1
 DNxIhd7rxLBqQOnzTcPVps1F0XPDY0Y=
X-Google-Smtp-Source: APXvYqwkoCxRxL6Tt/icdrxjvdW2QNNKuKiS5OHCXOb/WcWrbo2VzUJyQBzxCpp8z9PfHbsATpR+9g==
X-Received: by 2002:a65:6401:: with SMTP id a1mr7839009pgv.42.1562897108820;
 Thu, 11 Jul 2019 19:05:08 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
 by smtp.gmail.com with ESMTPSA id j15sm6611298pfe.3.2019.07.11.19.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 19:05:06 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
 <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Date: Thu, 11 Jul 2019 20:05:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
X-Headers-End: 1hllRZ-00Fqwv-R7
Subject: Re: [f2fs-dev] [PATCH V6 0/4] Fix zone revalidation memory
 allocation failures
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
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/7/19 8:02 PM, Damien Le Moal wrote:
> On 2019/07/01 14:09, Damien Le Moal wrote:
>> This series addresses a recuring problem with zone revalidation
>> failures observed during extensive testing with memory constrained
>> system and device hot-plugging.
> 
> Jens, Martin,
> 
> Any comment regarding this series ?

LGTM, I'll queue it up for this release.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

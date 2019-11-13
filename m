Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18061FA6B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 03:41:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUiaT-0007y9-J2; Wed, 13 Nov 2019 02:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2131aa394=Damien.LeMoal@wdc.com>)
 id 1iUiaS-0007y3-PC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 02:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UOyFzuk191NyTka927CFuHmlBapMRxNyBOZHOt3Mb0I=; b=mmMBe+fLj5Q1e5OrRYjGzhJu4N
 TxMKxL79qYEVYDqd4K2Iu3dOKOArPduKkYjHRdY/JBaQzday0vMdTfD5I85++wsV8W+Dj3w3xa8j9
 qfolNrHSvRCQOMH/+dCiuyiftOww3lkWfH1RtrM4ZtH6RSTd+IfinfGj3uvwI3JuxYKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UOyFzuk191NyTka927CFuHmlBapMRxNyBOZHOt3Mb0I=; b=m
 qlZi+NBbXq3ovx7GzPBLmf0pU6zhbwRFPPc6fmjNUuN4ArFkSpiLb9KsxR5fsADzUqab7WHjxe1nz
 g1BXDPiZda0UUBw+e7IBwYRTh1z7EGawQaQmUP3JzPHFJLRuqhsiX1Hf3NPq1UL5xwrHCeXL0dLje
 /QjjI5oMEaiVQwCE=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUiaN-00EO2M-RD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 02:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573612849; x=1605148849;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=UOyFzuk191NyTka927CFuHmlBapMRxNyBOZHOt3Mb0I=;
 b=lSAEduvRTR8i+qKwPtNhzcB7QGaKirie0hxJqyG/buQuUenSQ6kHAhrn
 wttjz1VcABDbv6Kp9lO9nDyYLSEG+JpHgD8u6zKGGOxQjgenD/ZX8+IXv
 daXx/fzdbWQ2ERTSvtEbfRjWbRFlSE00DUjvPVnBYkV33aevchXY5qkyd
 Di/DE62PRevyNCQCfEnrYNthK1xvXxEQpBCMpQd2892mRKqFKk+nefcUU
 dkN1oZ3FBYjhgK6t5rZbrroKGMy5pmAXWVZwZCwewBObcsxNZtYfmd1if
 BogUhh5s/HT9MQz2Ouqig3Hu+oHeBAac9eYvBG8y8djYgXW4CHM+HFyu9 Q==;
IronPort-SDR: 4/MjnpWoQzAUn/ubQB5/08QW4gKbD0Yi6zFOJ4mvbLM1F4AaPssX6Z4upVYo8kZP7aNY56KJmB
 JDJe3k4G4sBQfcOxPDSStXvpddmJkxsngIkpcxLEQ3UwvYJUHqtKNqetywFHil4g58fiiUwe9S
 Op8u/kM2e/e2bO5YkMvDdsa8JtwAnZFFFm1iyYrlE+eK/HgOm+8kCVwpJ/2yY3dR+OiLBguFMJ
 rvOo9Tz3cbAVVXgF16wW6uBhyacTPlzivU3QtKbLmXhswERcCFltmrlJadh2AnIcHp0mc75NIV
 QEw=
X-IronPort-AV: E=Sophos;i="5.68,298,1569254400"; d="scan'208";a="123596481"
Received: from mail-dm3nam03lp2055.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2019 10:40:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5eMai9EfY9eaLTT2HH7l1O54w+i+z+9Jfq896tVIlFEZAJKwve7k1CE2j+NVefPvu8DiK3F4PbwKzy4avm1Eiy6rCjnoKTbZTxzOgmE2Zo05S/pxsHZc6FrD4IxaP3PsuCbzBZm31sCodfr1dmWye4eXtDTgn8zeud2nIG6BgZjs3vmk9hFD77W6KJzJRxjB3EbSdoyeodhyi2ylNi29tCXbrttpW0ahDCQ5CunuQmiMpTH6mN5F1a6YjglnKo3sP679VHMKUPMNT/pmslWqWp0/Bn0UXDchpzqTN0vgisS556cBZZzbjv0OCy3vpiIW/gDHtyIagkaurBe1Hf9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOyFzuk191NyTka927CFuHmlBapMRxNyBOZHOt3Mb0I=;
 b=iDP4xmReF3tZ1WSsBocMbhJY+j/6aVsUu5RqzbiHrM41aaMIq9yb0Id0C4MCEhKXbNIQ4XNYMdqe5fqoQdL3fFObtZKblHdElzJIFn6JtGogUP6xCwt6vRvlRRMIoSvzjsgDPrVRbeOZutrniVRBbAoSQyyfPRNCRo6jzb1dAeYDy3k5NeQDpR3ZIsWjksvS2oLnT61QBj8H0GYqk+k0j88KSR3QiHgUjUCDUOXl9f8M6S/Vs/XW7taTrriQVLKY7TpZvWKH8wSz7k9rYH5nYzvCB8vnVbQWPsRDnvsHXs353QSPt2LIVJTQhRm1C05QlydNn3bjiVnCb0ZSHAWLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOyFzuk191NyTka927CFuHmlBapMRxNyBOZHOt3Mb0I=;
 b=Xj+aSUQPtlTt49cKOqT4jGV0NI06ceYIe009EKdWuN6ucXFQbxbTNbTMa4ByQxB+Hdyj7yq6J6n9DZbbCKmTcsWjtbA5sfeT/GG8FTG4YjE4gEoVyCdgE5fEA2NE4RgXKuF8+qpJXSZ5y/4YvOf98hNGyS2OKQq7BtY2zfP0NHE=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5303.namprd04.prod.outlook.com (20.178.48.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 13 Nov 2019 02:40:39 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 02:40:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "Martin K . Petersen"
 <martin.petersen@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 0/9] Zoned block device enhancements and zone report
 rework
Thread-Index: AQHVmDlFh2i7Gy20+UKGQOmTx+pYMw==
Date: Wed, 13 Nov 2019 02:40:39 +0000
Message-ID: <BYAPR04MB58165811E5614D9B0B122CB5E7760@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
 <a0c1c1bf-d6e5-8be1-ed99-6bfed3483d1d@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47d3c709-3176-44d6-180f-08d767e2dec0
x-ms-traffictypediagnostic: BYAPR04MB5303:
x-microsoft-antispam-prvs: <BYAPR04MB5303483A8913749800B37D33E7760@BYAPR04MB5303.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(2906002)(476003)(6436002)(446003)(74316002)(9686003)(305945005)(7736002)(86362001)(102836004)(6116002)(6246003)(52536014)(7696005)(5660300002)(66066001)(26005)(6506007)(186003)(486006)(229853002)(55016002)(53546011)(3846002)(76176011)(71200400001)(33656002)(316002)(76116006)(91956017)(110136005)(71190400001)(99286004)(2501003)(478600001)(8676002)(8936002)(81166006)(81156014)(2201001)(14444005)(256004)(66946007)(66476007)(66446008)(25786009)(64756008)(66556008)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5303;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WsyXzu1M0XucnpG5Sa+BvI1xn9hhOK99sLA8Lc2VTfHQaW0VmMvcA81nF/lH2LkYvux8KPSb+SIepLHCXqVHmIes/K8NIsZuIEbjLVDOeUYZNZ/BeZ6CnR11q8zO9tphSbcAH7muEudbyZV1ZX8avgi+5f4vIioh3Ir8U+cOqzRQs0TQTUPxIddoDmeUZPz7UwsoS28Iifsx1Ihk/svHK1/bOw9udVzG8cAohEfn2Waf8mqvQXfFEtGvwHVE/jiNuMtZTALz9Lw7jo/AETcNHelzY+qSdqLdEckCcRc+zdvBc9HtXi6CbM/GDKm9cwRbuv31iWomsNHI5mfWoVdE4c5aQ5CiOgh8Y7GfPi5BYY4fRFdwnhp6fM3VDzI5/zWO0Z4WbwB9ZQgDOwRWJdrgf5wdwXSb+WXDE2/geiD1hUN+DCSNToRDfplha+jtSom
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d3c709-3176-44d6-180f-08d767e2dec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 02:40:39.2436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5g6Ltu06NQziqZyUCPiutOAm6nAT6e9n0L68r7aycF1/+2qg4WQNZ8a0cjPdnlf7jaRHRTKvm9TG24WT9NmbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5303
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iUiaN-00EO2M-RD
Subject: Re: [f2fs-dev] [PATCH v2 0/9] Zoned block device enhancements and
 zone report rework
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/13 11:16, Jens Axboe wrote:
> On 11/10/19 6:39 PM, Damien Le Moal wrote:
>> This series of patches introduces changes to zoned block device handling
>> code with the intent to simplify the code while optimizing run-time
>> operation, particularly in the area of zone reporting.
>>
>> The first patch lifts the device zone check code out of the sd driver
>> and reimplements these zone checks generically as part of
>> blk_revalidate_disk_zones(). This avoids zoned block device drivers to
>> have to implement these checks. The second patch simplifies this
>> function code for the !zoned case.
>>
>> The third patch is a small cleanup of zone report processing in
>> preparation for the fourth patch which removes support for partitions
>> on zoned block devices. As mentioned in that patch commit message, none
>> of the known partitioning tools support zoned devices and there are no
>> known use case in the field of SMR disks being used with partitions.
>> Dropping partition supports allows to significantly simplify the code
>> for zone report as zone sector values remapping becomes unnecessary.
>>
>> Patch 5 to 6 are small cleanups and fixes of the null_blk driver zoned
>> mode.
>>
>> The prep patch 7 optimizes zone report buffer allocation for the SCSI
>> sd driver. Finally, patch 8 introduces a new interface for report zones
>> handling using a callback function executed per zone reported by the
>> device. This allows avoiding the need to allocate large arrays of
>> blk_zone structures for the execution of zone reports. This can
>> significantly reduce memory usage and pressure on the memory management
>> system while significantly simplify the code all over.
>>
>> Overall, this series not only reduces significantly the code size, it
>> also improves run-time memory usage for zone report execution.
>>
>> This series applies cleanly on the for-next block tree on top of the
>> zone management operation series. It may however create a conflict with
>> Christoph's reqork of disk size revalidation. Please consider this
>> series for inclusion in the 5.5 kernel.
> 
> We're taking branching to new levels... I created for-5.5/zoned for this,
> which is for-5.5/block + for-5.5/drivers + for-5.5/drivers-post combined.
> The latter is a branch with the SCSI dependencies from Martin pulled in.
> 

Jens,

Thanks !

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

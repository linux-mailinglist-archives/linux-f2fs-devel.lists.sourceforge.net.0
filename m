Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7406768D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jul 2019 00:33:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hm46n-0005Z8-DH; Fri, 12 Jul 2019 22:33:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=0899dbd4f=Damien.LeMoal@wdc.com>)
 id 1hm46l-0005Z0-Fp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 22:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=; b=G73tYZNV//kYUcNQBhW+zepnZJ
 PLqfMqTuC5REkfGV8HHrBMwBJD7FkhA4FZxXmjRIsKUsAc+BFrFQ+qQ9O7pFLl8W2CHHcUKNaaflI
 huTndC7QMCqVkf7lkz7T3WdrnSJqb21xEz9iVGoUGikommbiAZEMwu9rTbF2nvTINAo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=; b=J
 nn9zBsGFU9dJgIK4x7VgmsG/83GA2y+M8RXzbiX+GIURRtcUIHt+T3lsBiRRPNlInh3dshzRHTGh2
 Xt7ESAQkyzT54JyfuBepbpNrR/U8BmE4/f/Qu/PKrSyzp95XOkB6bOgjxqjfUcbH6+lKShlJ7OQ8o
 ZX96jRrGNudl2Sdc=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hm46j-00GmBU-N8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 22:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562970817; x=1594506817;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=;
 b=dOoAZ9Pd0bFrN60rqalQ+a8A0+JQcZzQ8OpZFTImg9/qHxT9i4D96D8W
 8wU0Ah1WZ9NlPjYEhXTRwNi9N1W+1YvzWTkqRdiYSxv8HApL5/ZDLe5lY
 UT+IjsUcQQMlgyRrsq5t1lcyhvUoIeqCif0vDmBMHKMz42y+Lo6+CyvKl
 jN/1SS6mUpIlv+P7deDgxuXlKa7O4ImASMrMgSJInZ5Wq3WU3w7t2hGJI
 MmZ00gqVKmSSzUHI3hPIeOr3Pr5bRBWvHorru9w5JSp5Ek0gSxSCsjIXx
 OR1KJoklE01cH8HsFjcI5tcdY9vyKrUXWZ01K6yq13g/EiHj7PHJI5rNZ g==;
IronPort-SDR: tsCGHpEouwsmmlpp7mWElGzBqwSww5j+aXmyV0YCw4vAzSJ48g8kykjk4d3lWDu6R2c09hiCbv
 vmSHuD/ce+c2fwwf+vcSpMqTWSHbJceVdGJEOB3o0+sicBHiOK88lLRHV/cvk7XYzlI2OO/0ru
 GtZIxPDIgBRla4NPqPDRR+48vRVsSeqXcr8rA9a4We3sqdqyQoJa2YT4byu1IlxztivrGm48rR
 lLV3TDbEYDf0flr+3vt5HpkusWv4tQBVoDAEbcaHcDSXdQ2JNuXdy138SYDTWFTj8rUcygMntj
 7VY=
X-IronPort-AV: E=Sophos;i="5.63,484,1557158400"; d="scan'208";a="219352955"
Received: from mail-co1nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.52])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2019 06:33:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZaO/huk/mrw/uSTRcu2vwWDIqZDPc37x7B9FiZrYLQ=;
 b=YhQ6lFbJMmz5ypx07Ge8/13MGly/KxPvMLSs1eVlshFAE3sMxFuYvbEFq+ew7ZTIRn5oTIC1fSlC2B8AAWjSH7BHj7LlsF2HBUzQXRizcAVVXVUYWcGaenfjTO4uqZjmEPFGKlu22s9kCS63MLwMYPT4tNMnCiT+TKmEEJC3IdE=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB4696.namprd04.prod.outlook.com (52.135.240.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 22:33:22 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2073.012; Fri, 12 Jul 2019
 22:33:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "Martin K . Petersen"
 <martin.petersen@oracle.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH V6 0/4] Fix zone revalidation memory allocation failures
Thread-Index: AQHVL8ssJYyertgVkky0I6r2FZ0yYw==
Date: Fri, 12 Jul 2019 22:33:21 +0000
Message-ID: <BYAPR04MB5816F76F09488AE706B49F72E7F20@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
 <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
 <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
 <27386e10-7494-7fcf-f203-484db5c3c69c@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5d904e4-7c9b-440a-2390-08d70718f247
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB4696; 
x-ms-traffictypediagnostic: BYAPR04MB4696:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR04MB469631F5CF470FB512E24703E7F20@BYAPR04MB4696.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(199004)(189003)(66066001)(486006)(2201001)(74316002)(91956017)(86362001)(186003)(8936002)(81156014)(33656002)(305945005)(7736002)(53546011)(102836004)(5660300002)(14454004)(6506007)(446003)(71200400001)(81166006)(8676002)(26005)(110136005)(71190400001)(54906003)(99286004)(4326008)(476003)(76176011)(64756008)(7416002)(2501003)(9686003)(55016002)(6246003)(6306002)(316002)(66946007)(52536014)(3846002)(66476007)(68736007)(2906002)(7696005)(478600001)(14444005)(256004)(229853002)(6436002)(25786009)(966005)(53936002)(66446008)(4744005)(6116002)(66556008)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4696;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oBv38V8vuDEVIIvHi+SwYfH2AiuG1gqVdZ56z9hL5fPr87EqSm+NQ7nfb3qvWmAMXF+sWavPmqbIQIFDm0R9WGOAS4ONoDM+oXFIdAN1rvRzOlmzvKb4hHdoVr5/Dj0sBNG52EgOtLkf7xKpDZZfha2DFW2wwuIQ+yqybopbHwqV7+S/QO7mUn8bnIuwci0mzM16FGgqMI3JF08BLz6gzEgjlDlTk2kqcPXLI29Bl1YQRUulUlQcHww5C8hk+MWiVj0MPrWfmVmEpjZxVsrz7yW/hFY/4ONRMb0Z3P8I4ijNthH6drQ3hgQI2xnxyrxdQhWikL8ZqPlQigHop8XWLT1z6pLq9C4wvLbpFTs+DzqqGclY4hwXufhsuupdx2xYIP0yoyytHwiaCceVnQayQllzadFMFwHZ74azL7tzqeU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d904e4-7c9b-440a-2390-08d70718f247
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 22:33:21.9173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4696
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.dk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hm46j-00GmBU-N8
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

On 2019/07/13 0:13, Jens Axboe wrote:
> On 7/11/19 8:05 PM, Jens Axboe wrote:
>> On 7/7/19 8:02 PM, Damien Le Moal wrote:
>>> On 2019/07/01 14:09, Damien Le Moal wrote:
>>>> This series addresses a recuring problem with zone revalidation
>>>> failures observed during extensive testing with memory constrained
>>>> system and device hot-plugging.
>>>
>>> Jens, Martin,
>>>
>>> Any comment regarding this series ?
>>
>> LGTM, I'll queue it up for this release.
> 
> This broke !CONFIG_BLK_DEV_ZONED builds for null_blk, btw. Please be
> sure to test with zoned enabled and disabled in your builds when
> changing things that affect both.

I always check the !CONFIG_BLK_DEV_ZONED case. But clearly I made a mistake
somewhere on this one and missed the problem. My apologies for that.

> 
> I fixed it up:
> 
> http://git.kernel.dk/cgit/linux-block/commit/?h=for-linus&id=e347946439ed70e3af0d0c330b36d5648e71727b

Thank you for this.


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

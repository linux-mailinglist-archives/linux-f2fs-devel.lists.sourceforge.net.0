Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D953E2389
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 08:52:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBtid-0002Gm-4x; Fri, 06 Aug 2021 06:52:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=Damien.LeMoal@wdc.com>)
 id 1mBtib-0002Ga-Td
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0W6nAVNRqnF89qsjjN9H7dNgy5UAyh/NKeStVT7aA/k=; b=cmOlWS9Y8ccoIPZCV9s2db503f
 QCyuAujOG4VinBPQROsCY/O8w1rZEd2QVTe4el/2a8oYQ0RC6fd5M2YMWutYKxG2V4NC1JkQmJXiw
 s5fRj37GAvl8h0rZ1gupOpPHLSrKVph5xZs+I+kRJu2o7EtgoUoW2k2OmaT0wY29mvsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0W6nAVNRqnF89qsjjN9H7dNgy5UAyh/NKeStVT7aA/k=; b=a
 F3xjeoATqIrv9Zquh75C+4af8G3oqKfa+DweHKjkwVxduGk6o27nZ95k1BP9mcV4iyoeSnKZfLVXT
 4GQPWhdczk5nCEnqT5MWAO5R/goO/SqHZXtTjS3kUR0Nmz+S5o4XtJEeBFLjB+6EucYqfilcKxWoJ
 O5UYR6Hq8IB/qkxo=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBtiV-00ELMg-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628232746; x=1659768746;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=BELmR6TEk+jUElotJjvlH188G27pxsroD14D3Bqxi/A=;
 b=NkLb7ZHHv6tlroaz616Hbr90irEVQt8+SC1KdZWW4rl5uxfRK8ABzFfv
 zaGJlTikOmGaEMYs98LYGdcwmC2A+8l53JtF8nkZmGJw3zIHsvaMZULlL
 LTSLYoHJoiqG8j84JkQhm7+dyb+m9h9xrMpUGew0glUmvIIlcPL6DuF+n
 wkqYnRm8aDi/mMv9r1u2NR9oxdnDY0LEPU1C+tdX9Vor8yF66Mp34e8BK
 6aLajk82KOYtA9Y+lnGVM6JGGE4OAUewhzTwVQFQwfr0qCYiDwMngQ4dc
 61pbDZtrgdBDD9fAP2hOA6m+A+rCbsfegv96AOiZ2rQdUl1hEtDJpm1Ri Q==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; d="scan'208";a="181292316"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 14:52:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUpuj3ViylJtkTzFFI2NMOfmiz9wmuaWtf/1QgvjQvamqf4qUvIv/62/PA1J+XNS09fLl0m3PLU0Rn7oE2S+Vgn3rwfZycpOT/gN2K1QpIgnL0zaivUyY0YT9mUs4l7FPscw+k768wHhfFJc6pZP2teAZWfcWmJS+46Rx4Q2br+ATxqm2NEG4p2HuQC282WVeUQAWbwGPYiSXF6Ip0zJEyYikXAbtLNDbYpButb7e8aR79OSrpFP5HoswvwCikfjvt8UaPxgMkOHYDCCNZsrBMPk3KIzjXNtCK8ZP3WBoKxtDtEMojspSTP/ZEKVmrdrixWxavq+xjWx0utKDHcR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W6nAVNRqnF89qsjjN9H7dNgy5UAyh/NKeStVT7aA/k=;
 b=aDc/SzQ9uVScbAtB5r6hKODKKzdNbYVkpHGHWxCVbjkji0claVUeftLzPyqofcMJcDOJlEcZkAsIR3mREyNJdxhLyO00hV0FQLsnbK5a9Rkl35hNHL6jHhpc+fkNWJ9n/Aa6MNns3TJNIlZFHfEqiIM9Lp613HIyfwNvXzIjsSAH13LvrLtKwpFB4t4Q5AFdWXhpHkIO7d6I2IkV7hzaFlMk8JI9OCmgy15n4t5ihXRjmOUAMg5af3ljDx3fovpFVUy3D2x9q1bgZm22cRROHY2wwJ8J3r0hUIEgLovwkDHZxLZPq0qWYV/fNrxMDAOZORAJocTGNOiWWWOmZYY0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W6nAVNRqnF89qsjjN9H7dNgy5UAyh/NKeStVT7aA/k=;
 b=pgspqKiyR7pPUFvSrkEV6X3iWaOI45rwBptGMY397doPuJvJOVFIdCDh/Jv2fB6P2GpxpkR/L8+cIQl9CS3iPxZ73znY0Lp6qf1gXV2eU+rfqQaYYA/bvE5xkJpQLVcyx8hUmOsuq2pPeEOxoSKBahD8nsvm4ipjyzw3yhIv2eA=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6777.namprd04.prod.outlook.com (2603:10b6:5:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 06:52:13 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::e521:352:1d70:31c%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 06:52:13 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Paolo Valente
 <paolo.valente@linaro.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v2 3/4] block: rename IOPRIO_BE_NR
Thread-Index: AQHXioGTkzlnTrsYeUmIRr1Ce5RaVg==
Date: Fri, 6 Aug 2021 06:52:13 +0000
Message-ID: <DM6PR04MB708197F979647F5D37988D8FE7F39@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-4-damien.lemoal@wdc.com>
 <d0bc418e-ddf7-6038-427a-2e9ad2f4ab87@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a727b88-a99c-4602-5008-08d958a6b8b1
x-ms-traffictypediagnostic: DM6PR04MB6777:
x-microsoft-antispam-prvs: <DM6PR04MB67774984CE53EFFBC68C3CBAE7F39@DM6PR04MB6777.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g/xZnSlSbi1RYVdcqqg/N6LmvTmC21qWXuzsJP5WaFW2nrhzvoSJfyIFrlbMN9dtp5xQfRjbAuqD/g7IpL5z/DsoxN5MieIFoc2YHHTfrpJVKmrxorqMWgBptKuFypErGyqHGixVQc0ziFPL+JmprgcUHeQHZ81/0UEO8urOsV+Oy2rCcH8i5zw5l1+6+kaQ7sIBFamoPfOZ/RgOGYSvP2RIpggYgvTf8opcQa/ReoeO5wmpsiskrowmvDwA9NXlKOHf1W98eFQSvbdmNqmxLg7omz+5yS6faHVyGse41FVmaOrgNv9z8bYEw2Wt4rntHeEiB4hv3N17nZOchAZFuD5nvMqMuZwKHhy1cL7qlB43FREPEs36AFEY4ywESe7Ms3HDEHHpaZl9FA/9Zks6o1aum7h+wP79+eh2wdLR8rpwL/uxgNGIPnqFlHZiI/rbR7XwKOnUD24hY/BQnSOR8ev0vFjtgJILwCLB9ojE+FME1b2r/LNI9dNSQBgmto0lcLlp7WiBw3tyR5NAY/XMwpujL4fQcs6zlBdrLCijWc2E/vJUqk+dPkdWfXHFRoyQsuHFquZjWgA08hThEd/tmckdPpjUOynGBkFFQaMD4Zg5brX4CcOawdiLsfzR0RfRBqIwe7RPoBch1V/G0hQttoUTekKa5WfHZDeowsO2IcyhelqfBM003vfVYa120ERgRdIBPrpRRQYqIikaoFPISQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(2906002)(66556008)(5660300002)(316002)(64756008)(66446008)(9686003)(110136005)(71200400001)(66476007)(83380400001)(52536014)(8676002)(38100700002)(91956017)(38070700005)(86362001)(55016002)(76116006)(33656002)(122000001)(66946007)(7696005)(508600001)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ym3lgEtrHA62eYTiVGSE4qsLlnff3rMV2E4+moQZzNN302sM3HD1hlLndCSF?=
 =?us-ascii?Q?kjub6cFPRIWMFu1/ZvfrPUxF5FYV2x1DaGUYv25scxLqD+TFA448KH9PjWRT?=
 =?us-ascii?Q?/yeM9JFd9U18xz9lBf+qOOwhsTby+EkHCiw7S+NFRVit3fmsNcnNabscu5hg?=
 =?us-ascii?Q?29g3kN9qiattxFkO/ZZeH3eI28jaBwiZmx8CJljHR5Z76l8KIzZBO9mbfKPe?=
 =?us-ascii?Q?pJDyKj+LTGd26H367D1eYVe+YfUr0nOMC2bZ1pMIGTX5gp2coeAzvwuYcrqw?=
 =?us-ascii?Q?HD5BKaxbsmcTM2imb7Z2aatZSAf87ujPih6obl+xi/5XrtnF8vrsr9hk7wCe?=
 =?us-ascii?Q?+UQAxMhJSLKqsu834WUUFOvOfUsMoP8D+xht294hSUvNpdjdpuYM7A5GApjf?=
 =?us-ascii?Q?Fh7bAr/brOlzIyFASyv2y68Sf6j/3Ipy1dn/Ijvx+IfV1FOk+nMJWL7w3+Ha?=
 =?us-ascii?Q?R+UuAZbRlvItgv5Usa/xhBDL/Q0m50aUu+CCJ646GwY+3e60EUWqwpdvVI24?=
 =?us-ascii?Q?g787CSeSX3vhaC2emWOv60WDILgOAXXLGLFvb3Ir7QAeI9lOc25CP5HMhKEX?=
 =?us-ascii?Q?lngLIu9dAuoJkqJGieaaSWBGCAl2YBFdoGVO0iWhx1Wt3zIqFdNUNECwUldu?=
 =?us-ascii?Q?2vPpShyBwBehQDuYpNP/i33hpwV60dB5pqIZraOUpqZ3YXd2X0D3lkYJWEeU?=
 =?us-ascii?Q?aXOpyiN3cSkfI7zJ2cAuCyJB1/fHnj7G/gts1aHmOUddxfEOQmfxM/Mw8L+9?=
 =?us-ascii?Q?fprgeiXbp5BnOWgwqjhaoZB3NI4Pl+npVKWYtOOq+jrlSgStHwLrA0xP2toC?=
 =?us-ascii?Q?zidDsn1GUC3c7P4otOzUllnCJstYrHKmXTQa4Y94gnq8/kuQR4wuOEHhLOyO?=
 =?us-ascii?Q?pPVKumPjGUQtsO1SeEJrV+ONJY+6Ba90QQpOYVJYmDh4f/cD8NUlOeDoKyI6?=
 =?us-ascii?Q?Em6XUQiEBjqHR2cG0wASF72plpCT0YvCk1ZajpaljlMxIYwoafOCfMDIZleJ?=
 =?us-ascii?Q?VKux67BLLLF39Eclm9a73OAbEmsywbx1CjrOf8JPVYLTmXH29e1bIm9NwNLu?=
 =?us-ascii?Q?kY3QzWPavjkGBQr1qM2Gsuy+Efv7pPYq0veuNWW95bf0VVbHTnqBc7TVJMS5?=
 =?us-ascii?Q?CILhMeIZvz1+ru/k1S8DGx3a8rIpBDt9FwAHYlgkYOUa9BjBV0sE9m44j9hk?=
 =?us-ascii?Q?rdx4P5aotqER2Bgj/tRwlsX5kTnpkw+1lLQrTSpV9LUyFJhpxM9oGB9MFkBD?=
 =?us-ascii?Q?tvlhqkPbIMo6N3mWu+0AgYD1WpLR2Otj/y225Jou8+FmtLVu8Vm/rrvRz51M?=
 =?us-ascii?Q?WZQ6aXuAhq+xFJ3xYc/3AlDcmKV3MFM9IB+VC1u6hzAYyragFgX0CryB8wwa?=
 =?us-ascii?Q?R4hHYd8Wt/kgnLHQ9vIFOsCqzUWOSLRyb24g/fuK3gas7q8SXw=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a727b88-a99c-4602-5008-08d958a6b8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:52:13.5024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQiDZ7bW+faRBzDsbm9Ge9ML5QeVWNm1ytnBVKV+juYwIltfDGz9+eEGThL54qA9zSkLSx2Gp3NhtP4OxpY8Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6777
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBtiV-00ELMg-Rz
Subject: Re: [f2fs-dev] [PATCH v2 3/4] block: rename IOPRIO_BE_NR
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

On 2021/08/06 15:38, Hannes Reinecke wrote:
> On 8/6/21 7:11 AM, Damien Le Moal wrote:
>> The BFQ scheduler and ioprio_check_cap() both assume that the RT
>> priority class (IOPRIO_CLASS_RT) can have up to 8 different priority
>> levels. This is controlled using the macro IOPRIO_BE_NR, which is badly
>> named as the number of levels applies to the RT class.
>>
>> Rename IOPRIO_BE_NR to the class independent IOPRIO_NR_LEVELS to make
>> things clear.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>   block/bfq-iosched.c         | 8 ++++----
>>   block/bfq-iosched.h         | 4 ++--
>>   block/bfq-wf2q.c            | 6 +++---
>>   block/ioprio.c              | 3 +--
>>   fs/f2fs/sysfs.c             | 2 +-
>>   include/uapi/linux/ioprio.h | 4 ++--
>>   6 files changed, 13 insertions(+), 14 deletions(-)
>>
>> diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
>> index 1f38d75524ae..d5824cab34d7 100644
>> --- a/block/bfq-iosched.c
>> +++ b/block/bfq-iosched.c
>> @@ -2505,7 +2505,7 @@ void bfq_end_wr_async_queues(struct bfq_data *bfqd,
>>   	int i, j;
>>   
>>   	for (i = 0; i < 2; i++)
>> -		for (j = 0; j < IOPRIO_BE_NR; j++)
>> +		for (j = 0; j < IOPRIO_NR_LEVELS; j++)
>>   			if (bfqg->async_bfqq[i][j])
>>   				bfq_bfqq_end_wr(bfqg->async_bfqq[i][j]);
>>   	if (bfqg->async_idle_bfqq)
>> @@ -5290,10 +5290,10 @@ bfq_set_next_ioprio_data(struct bfq_queue *bfqq, struct bfq_io_cq *bic)
>>   		break;
>>   	}
>>   
>> -	if (bfqq->new_ioprio >= IOPRIO_BE_NR) {
>> +	if (bfqq->new_ioprio >= IOPRIO_NR_LEVELS) {
>>   		pr_crit("bfq_set_next_ioprio_data: new_ioprio %d\n",
>>   			bfqq->new_ioprio);
>> -		bfqq->new_ioprio = IOPRIO_BE_NR - 1;
>> +		bfqq->new_ioprio = IOPRIO_NR_LEVELS - 1;
>>   	}
>>   
>>   	bfqq->entity.new_weight = bfq_ioprio_to_weight(bfqq->new_ioprio);
>> @@ -6822,7 +6822,7 @@ void bfq_put_async_queues(struct bfq_data *bfqd, struct bfq_group *bfqg)
>>   	int i, j;
>>   
>>   	for (i = 0; i < 2; i++)
>> -		for (j = 0; j < IOPRIO_BE_NR; j++)
>> +		for (j = 0; j < IOPRIO_NR_LEVELS; j++)
>>   			__bfq_put_async_bfqq(bfqd, &bfqg->async_bfqq[i][j]);
>>   
>>   	__bfq_put_async_bfqq(bfqd, &bfqg->async_idle_bfqq);
>> diff --git a/block/bfq-iosched.h b/block/bfq-iosched.h
>> index 99c2a3cb081e..385e28a843d1 100644
>> --- a/block/bfq-iosched.h
>> +++ b/block/bfq-iosched.h
>> @@ -931,7 +931,7 @@ struct bfq_group {
>>   
>>   	void *bfqd;
>>   
>> -	struct bfq_queue *async_bfqq[2][IOPRIO_BE_NR];
>> +	struct bfq_queue *async_bfqq[2][IOPRIO_NR_LEVELS];
>>   	struct bfq_queue *async_idle_bfqq;
>>   
>>   	struct bfq_entity *my_entity;
>> @@ -948,7 +948,7 @@ struct bfq_group {
>>   	struct bfq_entity entity;
>>   	struct bfq_sched_data sched_data;
>>   
>> -	struct bfq_queue *async_bfqq[2][IOPRIO_BE_NR];
>> +	struct bfq_queue *async_bfqq[2][IOPRIO_NR_LEVELS];
>>   	struct bfq_queue *async_idle_bfqq;
>>   
>>   	struct rb_root rq_pos_tree;
>> diff --git a/block/bfq-wf2q.c b/block/bfq-wf2q.c
>> index 7a462df71f68..b74cc0da118e 100644
>> --- a/block/bfq-wf2q.c
>> +++ b/block/bfq-wf2q.c
>> @@ -505,7 +505,7 @@ static void bfq_active_insert(struct bfq_service_tree *st,
>>    */
>>   unsigned short bfq_ioprio_to_weight(int ioprio)
>>   {
>> -	return (IOPRIO_BE_NR - ioprio) * BFQ_WEIGHT_CONVERSION_COEFF;
>> +	return (IOPRIO_NR_LEVELS - ioprio) * BFQ_WEIGHT_CONVERSION_COEFF;
>>   }
>>   
>>   /**
>> @@ -514,12 +514,12 @@ unsigned short bfq_ioprio_to_weight(int ioprio)
>>    *
>>    * To preserve as much as possible the old only-ioprio user interface,
>>    * 0 is used as an escape ioprio value for weights (numerically) equal or
>> - * larger than IOPRIO_BE_NR * BFQ_WEIGHT_CONVERSION_COEFF.
>> + * larger than IOPRIO_NR_LEVELS * BFQ_WEIGHT_CONVERSION_COEFF.
>>    */
>>   static unsigned short bfq_weight_to_ioprio(int weight)
>>   {
>>   	return max_t(int, 0,
>> -		     IOPRIO_BE_NR * BFQ_WEIGHT_CONVERSION_COEFF - weight);
>> +		     IOPRIO_NR_LEVELS * BFQ_WEIGHT_CONVERSION_COEFF - weight);
>>   }
>>   
>>   static void bfq_get_entity(struct bfq_entity *entity)
>> diff --git a/block/ioprio.c b/block/ioprio.c
>> index bee628f9f1b2..ca6b136c5586 100644
>> --- a/block/ioprio.c
>> +++ b/block/ioprio.c
>> @@ -74,9 +74,8 @@ int ioprio_check_cap(int ioprio)
>>   			fallthrough;
>>   			/* rt has prio field too */
>>   		case IOPRIO_CLASS_BE:
>> -			if (data >= IOPRIO_BE_NR || data < 0)
>> +			if (data >= IOPRIO_NR_LEVELS || data < 0)
>>   				return -EINVAL;
>> -
>>   			break;
>>   		case IOPRIO_CLASS_IDLE:
>>   			break;
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index 6642246206bd..daad532a4e2b 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -378,7 +378,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>   		ret = kstrtol(name, 10, &data);
>>   		if (ret)
>>   			return ret;
>> -		if (data >= IOPRIO_BE_NR || data < 0)
>> +		if (data >= IOPRIO_NR_LEVELS || data < 0)
>>   			return -EINVAL;
>>   
>>   		cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, data);
>> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
>> index abc40965aa96..b9d48744dacb 100644
>> --- a/include/uapi/linux/ioprio.h
>> +++ b/include/uapi/linux/ioprio.h
>> @@ -31,9 +31,9 @@ enum {
>>   };
>>   
>>   /*
>> - * 8 best effort priority levels are supported
>> + * The RT an BE priority classes support up to 8 priority levels.
> 
> This sentence no verb :-)

Hu ? "support" is a verb (to support). It is a noun too, but here, I use the verb :)

There is a typo though: s/an/and

"The RT and BE priority classes support up to 8 priority levels."

Arg... Sending v3 :)

> (maybe 'The RT class is an BE priority ...'?)
> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

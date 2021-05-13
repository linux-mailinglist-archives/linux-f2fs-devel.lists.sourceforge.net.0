Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 386ED37F064
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 02:34:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgzJS-0008N2-V1; Thu, 13 May 2021 00:34:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=760bdaabf=Damien.LeMoal@wdc.com>)
 id 1lgzJP-0008MY-AU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 00:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=anHHAbPrbiGRmJszWJ2DjbgMiQlyg1MODOcEQtk2Hfk=; b=EbwPER5ud5SvkV7YrovqkTK9Nk
 sGkx5xSpax9tXm7w7LPbR+/zrMmOKOelAh0RSzTfxEWGk3hwwMo0e5QPM70sVzNCPcZOpStd8Z7Ms
 FyXcwA8KqiuEAETiV56RC8rd6ytJ6Hgt9fGazUaW7xXT4OjghssSu9j9DCIsb8DYQ9iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=anHHAbPrbiGRmJszWJ2DjbgMiQlyg1MODOcEQtk2Hfk=; b=L
 dpQZmsWXdxgOSlSsXOyUXp0vGGOcKxYGquWj7r/PdVkoxpHtFNC2zvKunmCFaEzFnnEbXvrwqeLck
 sNCtYVAWPqJXOcNXb1Uc4S6v4dYAEw9E/HUov5IqWCJ79xFEs9DupdABBzIZb/vFPUovKzo9twu9n
 /lfRdCH3x/N+/wv8=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgzJK-0002kH-5l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 00:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620866083; x=1652402083;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=jAe1MbaRE1Nw7wagUrN3RWiGqwec2wwHJxFy/ctdU9o=;
 b=jN4d0TNb+JQ4A5K8GEtoJAsw7doCAEUnWj5YAJoejxO84goAsqRFEkzV
 zI0yB4OAT02frYGweAqXpvsC/f3vcnH5HeyrRbL4xbVnrJsnfnC35aDeH
 Tdz5rSo7enUM8Oq9VcH4m/ERMFPQ1lwnbQJzYx/j2EHm1V98HiuGN6geP
 ycsX/v2T3rccIeBkqFVhRp3a/GjATvyFPU2I0hug+cFt+fGqsztudohzT
 T40LKqpnx3esD4F3b2x7qdXgD3XPMvju1ImaAV2uLAiAhlEnrQm5xClFj
 /5QWhTGJ/cBck0BqpL4LTVWp0xfbDDBLxl2ikl0VCTfHcJRLXwBMi4+P6 A==;
IronPort-SDR: yO/o7iCgxwsHqdEJqwojD4psSV6AxyaqP1Kkh1O0/YrxuS/pk7OCeAZ2dTG4y4TmzvJ66F6AeB
 0cTydn7YjOKA8i3fBPsypCd2ojHg1/c1INjnd5m9lAumzRiCFUxhpzKmp9Nce6ZfAh11o2tUxp
 TtvdcidZpZaXeqsPhTJhTVCRdIiZnC1R8RHXVtSvVuWAgi8gKfTjDAaJvokC7EaeuJcolM2QOA
 Rr/wnAywcg+IfPi/oUYnWalC31wEhOFjizYP2H4pRRxHpigDBsIu883zSylGfZBkIYCecX4F4B
 v8k=
X-IronPort-AV: E=Sophos;i="5.82,295,1613404800"; d="scan'208";a="168538232"
Received: from mail-bn8nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hgst.iphmx.com with ESMTP; 13 May 2021 08:34:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kecoKkiV8yVM1KXMG62Hsw0SFeJQeK1ht+fNKFxw7939eUod7/E7IEk8FYcHtgS1jjUsWp4j68YB0AQuS2TYhm0sp/DhxM2brzv319WI5XMW5rXERVHAh/1xpwTfXegAWlkPniW9H7jZpRqAscsun5O12yphcJvUTiOYtvy6lZ3fBiHhWtAkIbofdbk4Hgu8f5lnr6f+ByAYRf5eY5BXhhu5mQQIDkEMYIQDvHAhf6RSEAbdv3u2+tEjYIehkdrwlw5f2fiiuw6i11c5Du0lh/LHS9NUuqpymFR7RK3u5ZkG51SwFBLZzJHNSBH4jlelazDhAC8P2w9pMrnHHWFaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anHHAbPrbiGRmJszWJ2DjbgMiQlyg1MODOcEQtk2Hfk=;
 b=N1HrgtD4JUi0foWGSOtccDONIeZkp513On3RSCqrfYkyO81gzMO1Y6f8VNxA8nP1QLQlFNqNq20y+Sh5ZPto7/Dx8ZqP4y5Lcv6VKKvwF518ZfThur1/m1RUsDe/zyUmi8mdCqCA516/rm7JZf9MZx+H+r/BTy1shOfSYCo4zA7JVdldQviQUztCJIiCLlhBGJ4NH7GoMpX9PowYSJseeH68vlbGH2hlIyVcW9yg2MAO/act7rmkhhL1lm+MbNgeBYM8n1rjY6jmaWXplvPjViKkp3Bq9/c3Wy18TgCy6GrhHzQW4NNMbjrZ8lCW8ezGk7R9voc9RWCZDzOpDOseSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anHHAbPrbiGRmJszWJ2DjbgMiQlyg1MODOcEQtk2Hfk=;
 b=nfGDeSuQ1qCGvbl/xJtkKZNwL3smXh1Y7E5nLFgtNxySKM4foy7HB7SxTTyIWCOZIyFmSo/N7LtSTLFpcq5V2bDSntbUBgWIYwfGfOaZ7X5m6agzTMbyWTPm63ScMs/13ex3cd5+8HyFMtRERV+Hqd/dntyMCR5rjAqc0/VWA6U=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB0813.namprd04.prod.outlook.com (2603:10b6:3:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 00:34:33 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 00:34:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jan Kara <jack@suse.cz>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>
Thread-Topic: [PATCH 07/11] zonefs: Convert to using invalidate_lock
Thread-Index: AQHXRzU+qXklL5tXkka8lKRMD3f5wg==
Date: Thu, 13 May 2021 00:34:33 +0000
Message-ID: <DM6PR04MB70813581E891647A893FE741E7519@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-7-jack@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:dbc:763e:6fbc:5b5c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f8a851b-a28b-477d-0fa4-08d915a6e13a
x-ms-traffictypediagnostic: DM5PR04MB0813:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <DM5PR04MB08134D0F0545A4ECD3D5B6ADE7519@DM5PR04MB0813.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gyfTusqq1svA5stoPogo4LcwpoIP60ewdwTnQQmIAZwWcACtXomhgyMk34XxNym0/DLnnMPnTxhZB7QV1R5Jjy5zhKFhggw0ZeXiOyUYwi8lyQUHnfTRVU1TCboGTZTNY464jpYnMIwNATPLlZutIGk3k6MiF97jZ2VqwCJy7gn3AJHPvnRGEj+O1paj4yRuqF+pJBm9A8yIlupoFnNd6WmI3qbImASX3BLNSsr0uUeuG+J4OuoNggVJcvL47rfqXnN0/ojOrgU70N7I8r9RJKQb/ERkC4EW1yhbCkRJrSyqcXPLpZ47ELV6ZqHLFyCFQREliuDx7gLAP/nTQlk44EfWEzqf4CH7PE+lEMMGpRFd521h3Cx4/yVBSFHfhL1vDwLvfqUdCXAHs0iiq9gIXWbyPoLrvL35n0gAWKWN5Ex/W2GRws1szHVYeyDCugLSfsqxGNLvJLDIPgahw+Z2YmKz8lCkNwkk35Y7QBVXx9QlxyyclZSErrBf2tM6jXbjqXI4O3hoHUcsc4w022UfuWOHKYNJzZzT6iWVgnvqY7NlMvHXDb9FtsAqr5gucAzbiMKR8JyxLdSzgnD8BXSM/cIBmunESPdltVkQe4i5RGY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(64756008)(66476007)(6506007)(91956017)(186003)(7696005)(52536014)(5660300002)(66556008)(54906003)(86362001)(110136005)(66446008)(316002)(76116006)(66946007)(71200400001)(478600001)(122000001)(38100700002)(2906002)(53546011)(9686003)(55016002)(33656002)(83380400001)(4326008)(8676002)(8936002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xVvSD4j7elIy6AE6R7OrcMscjfG8m+h/9thVsuQSeQ3JIYi79tjqJF/GHmAM?=
 =?us-ascii?Q?YifAUYHcK1LaH7H+Im+DudduLroyhkhcFoAiaGQnFRSOLROa/PicDM3kWJXr?=
 =?us-ascii?Q?B/hOH9QrNcWWGSefqabSb8m3nNCXn7s+M5VtpsDAoB3GHPNPD4a9YXS26qEv?=
 =?us-ascii?Q?jZyCBrj5E97uOCnUJfib4JgZeMDYNBRvOe5eOvB/YaP5I9410RHazrgaohTw?=
 =?us-ascii?Q?7tKsxlL8royHcvB0JJH7wME7V2TcubRnIewX1Ftgn/DazX3fdccyJTaABdWG?=
 =?us-ascii?Q?eNU6vXm4rGCvFgj/LUEcInivtBJ7TPo2pJV3c9kFYIT7FnYKKtHYrb2OSwet?=
 =?us-ascii?Q?RTwTGYeoXYTqNk+jnFTN4wLUjGvzmiNPUWV8l43ocOT4bhlOdAIJU6ZMengl?=
 =?us-ascii?Q?ao7xklc6wZ0hX+xgFBj0BCj+vVK2LKElrqAhMIMazXBpytNvx4/1vlcF0OXB?=
 =?us-ascii?Q?o7WsSIPd6kMgyj5baw2hd3C09Y41q2tOina/9jKjpQ/sPt5OpaotQrYL774b?=
 =?us-ascii?Q?OWs18ecfj2r23pDOKKCOH3n22Ey9abDPxnpPX2O1eO3NKnvcbsfQFc3Q6DT7?=
 =?us-ascii?Q?GCaD1EFZIWiOeu6LZ4Mw9JvYq7GIEMlaNLoQxxyMFVLC49PGTKBytxppuCC3?=
 =?us-ascii?Q?RCO1fPt4YdthYuW3MyEoMSTAbBNnA+iVWzBuwtkISupqU+6y9f439AAK/0dT?=
 =?us-ascii?Q?CVHvmsWp2hVrzuHyM3Rs5p86AvkwTltoyc/QFI7tiwaI+N9wuRwzX1+7CmQq?=
 =?us-ascii?Q?UnB8v7eK+YxiSve2BiaQFaJU5ElvmR+6u6axedq0dv5IsRupOjssku7dC2vB?=
 =?us-ascii?Q?32mbMEXDG6ysYGrP+JZkdHm8+WeNrQ/Q1dcllEey4tpSE/hk0MdNiyURkWW4?=
 =?us-ascii?Q?BzhVhFrxo89J8ZiSvc9N61yWmjKEtLPbe+BROGTowOtPVwhiFad41X7ojZU1?=
 =?us-ascii?Q?N1QkEL8MuC4zmhLaVB+I8os0SPlPwVxslDBu91W5CArLRFdzQoOlHPVxnbZP?=
 =?us-ascii?Q?GQYhU/WMa/kb3EY7KFQNtihF509FDP8Se5YhCOH3jFZhCBbkFz3YfM7jOj5L?=
 =?us-ascii?Q?xXyiKmBRtBPNRvW/3M9I/47ny+8T3eV5/o3fxXzV1Pj8ZdEDQRepNk97wL7b?=
 =?us-ascii?Q?GwTPS9Ueq1+L7vn2BTRd6tYB3YQVqwX/1qSgxNgcN014TEUY2DEI1w0ZkFFB?=
 =?us-ascii?Q?yqM9XZf5hsoA7ojVoM++16aCf1JVk3+X9q2Ww+UD1BHMPCk+hwEa3mIrVnrK?=
 =?us-ascii?Q?QhhzPtP3gn9yiSNR8IuZXAq2zxSPu6rBHlEHLQyDi7lGzH+opR4S0skKwG71?=
 =?us-ascii?Q?TNf5v93/48V3pN7FHDWpZMpuWFmsFC5Vddx6RiV6Si7DFcOQbDWMFf1xPvUX?=
 =?us-ascii?Q?qVbi6+L4XvHI/1rfKeBsH3bIXAZvyklmaR/i+Mlkiy08uc0apA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8a851b-a28b-477d-0fa4-08d915a6e13a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 00:34:33.6063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltRJzvAvGXVvXjosAbmERv3AR4aVfhIA0oPp1ciTNez8X2y2+9Tx03D3+9r1TbAqKhL6mr0XkfkNfnRS9mme4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0813
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lgzJK-0002kH-5l
Subject: Re: [f2fs-dev] [PATCH 07/11] zonefs: Convert to using
 invalidate_lock
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Ted Tso <tytso@mit.edu>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/05/12 22:46, Jan Kara wrote:
> Use invalidate_lock instead of zonefs' private i_mmap_sem. The intended
> purpose is exactly the same.
> 
> CC: Damien Le Moal <damien.lemoal@wdc.com>
> CC: Johannes Thumshirn <jth@kernel.org>
> CC: <linux-fsdevel@vger.kernel.org>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/zonefs/super.c  | 23 +++++------------------
>  fs/zonefs/zonefs.h |  7 +++----
>  2 files changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index cd145d318b17..da2e95d98677 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -462,7 +462,7 @@ static int zonefs_file_truncate(struct inode *inode, loff_t isize)
>  	inode_dio_wait(inode);
>  
>  	/* Serialize against page faults */
> -	down_write(&zi->i_mmap_sem);
> +	down_write(&inode->i_mapping->invalidate_lock);
>  
>  	/* Serialize against zonefs_iomap_begin() */
>  	mutex_lock(&zi->i_truncate_mutex);
> @@ -500,7 +500,7 @@ static int zonefs_file_truncate(struct inode *inode, loff_t isize)
>  
>  unlock:
>  	mutex_unlock(&zi->i_truncate_mutex);
> -	up_write(&zi->i_mmap_sem);
> +	up_write(&inode->i_mapping->invalidate_lock);
>  
>  	return ret;
>  }
> @@ -575,18 +575,6 @@ static int zonefs_file_fsync(struct file *file, loff_t start, loff_t end,
>  	return ret;
>  }
>  
> -static vm_fault_t zonefs_filemap_fault(struct vm_fault *vmf)
> -{
> -	struct zonefs_inode_info *zi = ZONEFS_I(file_inode(vmf->vma->vm_file));
> -	vm_fault_t ret;
> -
> -	down_read(&zi->i_mmap_sem);
> -	ret = filemap_fault(vmf);
> -	up_read(&zi->i_mmap_sem);
> -
> -	return ret;
> -}
> -
>  static vm_fault_t zonefs_filemap_page_mkwrite(struct vm_fault *vmf)
>  {
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
> @@ -607,16 +595,16 @@ static vm_fault_t zonefs_filemap_page_mkwrite(struct vm_fault *vmf)
>  	file_update_time(vmf->vma->vm_file);
>  
>  	/* Serialize against truncates */
> -	down_read(&zi->i_mmap_sem);
> +	down_read(&inode->i_mapping->invalidate_lock);
>  	ret = iomap_page_mkwrite(vmf, &zonefs_iomap_ops);
> -	up_read(&zi->i_mmap_sem);
> +	up_read(&inode->i_mapping->invalidate_lock);
>  
>  	sb_end_pagefault(inode->i_sb);
>  	return ret;
>  }
>  
>  static const struct vm_operations_struct zonefs_file_vm_ops = {
> -	.fault		= zonefs_filemap_fault,
> +	.fault		= filemap_fault,
>  	.map_pages	= filemap_map_pages,
>  	.page_mkwrite	= zonefs_filemap_page_mkwrite,
>  };
> @@ -1158,7 +1146,6 @@ static struct inode *zonefs_alloc_inode(struct super_block *sb)
>  
>  	inode_init_once(&zi->i_vnode);
>  	mutex_init(&zi->i_truncate_mutex);
> -	init_rwsem(&zi->i_mmap_sem);
>  	zi->i_wr_refcnt = 0;
>  
>  	return &zi->i_vnode;
> diff --git a/fs/zonefs/zonefs.h b/fs/zonefs/zonefs.h
> index 51141907097c..7b147907c328 100644
> --- a/fs/zonefs/zonefs.h
> +++ b/fs/zonefs/zonefs.h
> @@ -70,12 +70,11 @@ struct zonefs_inode_info {
>  	 * and changes to the inode private data, and in particular changes to
>  	 * a sequential file size on completion of direct IO writes.
>  	 * Serialization of mmap read IOs with truncate and syscall IO
> -	 * operations is done with i_mmap_sem in addition to i_truncate_mutex.
> -	 * Only zonefs_seq_file_truncate() takes both lock (i_mmap_sem first,
> -	 * i_truncate_mutex second).
> +	 * operations is done with invalidate_lock in addition to
> +	 * i_truncate_mutex.  Only zonefs_seq_file_truncate() takes both lock
> +	 * (invalidate_lock first, i_truncate_mutex second).
>  	 */
>  	struct mutex		i_truncate_mutex;
> -	struct rw_semaphore	i_mmap_sem;
>  
>  	/* guarded by i_truncate_mutex */
>  	unsigned int		i_wr_refcnt;
> 

Looks OK to me for zonefs. This is a nice cleanup.

Acked-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

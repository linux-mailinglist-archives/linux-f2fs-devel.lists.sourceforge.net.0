Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F873E8B4F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 09:56:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDj6P-0005Uj-S0; Wed, 11 Aug 2021 07:56:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850b323ac=Johannes.Thumshirn@wdc.com>)
 id 1mDj6E-0005Tb-SL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=syHO2mH7yYcqd6PH9/VhGXGYb2rAX8BorJKfQ1tY4dM=; b=FuUar1vBlU/4KPeje5oz6p4qtj
 iscOAsxwQcnV5T89kEiCttVkD9Ugg5qU/mvCnAIkC0AJSgNToakHeTJrmY1fzdz0E0xC8Zx+c2FpC
 A4hmMbe+c3O0UD9vLsqnoN2gBI0Hq4zeG4r4TmTJEWZA585Avl2wDsaqonwQI5NIoMfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=syHO2mH7yYcqd6PH9/VhGXGYb2rAX8BorJKfQ1tY4dM=; b=d
 aUQGk4O97kbY/HMa0ZsgjZuEHU2p2uHuqNh4pqHw+N8XYKugwFHapACOrJRylaW+DRTqgLFloG1tD
 Gr4HXdLSOCI465GjdA4rqrZUNiTj5ul8XtcoIfrqFktXd5IMdQVul6LJem9Y4BcmHAlsRj2K6a3Gk
 1vQuaps65QHk0ESs=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDj68-0007jd-7I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628668582; x=1660204582;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=hA10R5CcpyEm33MF8KB4NF0wpd04z/2L21vXTXTY6nA=;
 b=fjTwSLTlSq1qkM+E3QcLwYoYkq/PPp5GKSBEdPBhD4Mw6c0NERddl/xi
 gL1GPhSBzlSQiEkegdmU1bnU8j3G64uE9TVbZHZwu/AEX991KcfQr118V
 J5ZWsea8HuhcECBkv2eO+wWVkdgeO8eevAa9RCb7PpbahLjNEjufXZ32E
 asDAC+T/kpXkqdKsV7RILIufoJInLJicdaYGOYAVIWTxElWdEV9gyyI6E
 qvl7c6T1wT+fML7dD8PAHrpK05d3AIeis/1EQ0rxxleKPHEbz462bXItF
 CH8wsm3pHqNSeb6UwhgnrDedyOFX4ZlD+tevlHRwDLuXCj7A7YW8yq4PD A==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176911734"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 15:56:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvggHs7FD8wDMagImQsAOlS2x8elrFfcl9eHzGeD1n+Y82gICOaLUeIf5TuS28eZIa2WA78Wd//YBagDjrCckOL6JC+/sOmNTEss4TMqxc96vuY89vygKBXILVAEGS2hWJ1k8cIBui2GDtiTgGunG3HZvI3CMPoqjUCuDOh7ZpmDCm4TK0F5UAD5ZXHScxLDXkexPodXuj+WV6XLJ+Lcg+aEEEE6pXcvQYf762myO/BlCwF4hUgUkgeDbrqOwVADSdAwR4vwB1mHxo6/bfdU1wNIQGDZ0/Tk7/qp2erSAzySAsJqu+a6PT+siBm37GtwRu3kCp0ZAL9ZB5IQO5rFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syHO2mH7yYcqd6PH9/VhGXGYb2rAX8BorJKfQ1tY4dM=;
 b=EEOBOrAr/DQTHogBN6JBK3PbvKpbppd9yHTLq1oKKbsaAQDsaMCHyRzU5IoouUaZUsN0rQT/7HjH9TLSPerxWuRy2h+tmj1lTMqqOH1kOtbxKP+NWnne54tU6sS+e0AgmsAe3Sg7mwLuxjU7UA5LYNS1lISlb2jRISXwWMr4kyPd6lTFEXHLjpwHh/vsErN+JfHFKbVBXogDpikcAgqdHcGfiCN2oxxLZuuIc4c2QjAgnbd7IJ+DSffCf8zrAGq50dujRTgKin+3GmbAH5zeEJx3O/ltR5zRqF5EWF/OYllWsfFF/bQ6RAc+QPbUNJB4hvpYWbtGuNAVJ1cMmQpLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syHO2mH7yYcqd6PH9/VhGXGYb2rAX8BorJKfQ1tY4dM=;
 b=K61dcD+2URzhgh9hTNCnR0/Cjm6UFuP6ApJ8M6wrsgal3C5OVeor1qWSBVeQ9s2I36B21YLYnROGpHpnc41Cyn1tJrUjzM9VIVRJ4H856sWRpmNDdmX2jnmEtT5gTkvfLLatUS6z3fGLr1W1T2quIHqfHlZx4BRp4f/NxOixq3Y=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by PH0PR04MB7176.namprd04.prod.outlook.com (2603:10b6:510:c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 07:56:11 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::f1f1:286c:f903:3351]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::f1f1:286c:f903:3351%5]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 07:56:11 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Paolo Valente
 <paolo.valente@linaro.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 3/6] block: change ioprio_valid() to an inline function
Thread-Index: AQHXjmI7JqGKWhtbGE+vjERXXKWQJw==
Date: Wed, 11 Aug 2021 07:56:10 +0000
Message-ID: <PH0PR04MB7416DCAE9D84B4ED25E4C2ED9BF89@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
 <20210811033702.368488-4-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43a144eb-ccde-4e03-aa3f-08d95c9d7c19
x-ms-traffictypediagnostic: PH0PR04MB7176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR04MB7176C8D60DC4EE7E82F174639BF89@PH0PR04MB7176.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQJCjGYoxQXhdfqcTz83WR295qXlO7kbBm3TmHuS7t9EHR+RthmeGJkWkH8MNqEmVH3sJlPVmq6XmyBtAsyO78l8nMAgG41hnMieKR6nbVSuwctYoRXVyPk1I4N5uaFUHt7otY8jdcHCcfoUPSwbIXoTfwS5PsefX4I350Iye1BHUPPKUsPSOuWs2h7FHj9SGNV46ReBKskfmQ7cpNahgC64E0nND9pMTda+GA4344r7Mv3Qk6sfNEbcnZykKTcRuaWXQItQaH+Ye5FimoJHjNzC68hDBKtGCHf5oxYRhIkk/b/24/x/0pLC5n4LVk+LXJk3E2JdoWkqG3VUyRF2VfEnG9qGVXAWJlrmdSjAHsKVipvzj+bjemd4DSeJ6smo0YjJqPzT5AY9teYKfrRKu+2KAYZ1Jp8da5XssPc7/qlNrFcHosiAEGGcEy7RA6BRe4uuB9eFNgi49545/FKdHNsSh8J9rZknCsTUO1PwVzmyn/efAcS7rFnMx6eFdphyHUoYFvUDIFGRMzeJKiXzd0I2l24P5JguqiUED/Q8zg93482QYrfe1FjQG09kYvu6qWwQqld2f3zfW0pJexpRsjMgtrrLj+SYSiXjMByIExhaF8+lDfZEYwZkqaS5fB+pevXq+bDmJ6uhjdu4Im7O1y3J+deMpinb+iV6RNfniDZGbUWEFgqI6ko+3scwJS43qoE+tRNMGEa9sqVwEge5QA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(7696005)(8936002)(64756008)(91956017)(9686003)(38100700002)(52536014)(8676002)(55016002)(66946007)(66446008)(66476007)(66556008)(33656002)(71200400001)(110136005)(86362001)(53546011)(6506007)(316002)(508600001)(38070700005)(186003)(2906002)(122000001)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?slZqJ4hyTMFIY4WM2Rc3SRoVZUXEnCaQj5RFkU62qfeIcW5IgeBo0qHXCWZV?=
 =?us-ascii?Q?jAEIHgvXeyHpMt7wpZRIjpgf797hBrbj1ylVL41GApFxWbt0rKtKwLlck7sY?=
 =?us-ascii?Q?u+26wAzLJBpeAu6JjvtziX3+W4O/O9MLiartfXcRuqtnt7KmnVfmu5KhYiH4?=
 =?us-ascii?Q?aHdd8UA49bP7V47BeGVIEpf6Qpu1SlMHET58BS0uBefoXKiwigbiofv9DYDG?=
 =?us-ascii?Q?n1VJLVp4tXroFcsGoNz6JZJuO6BhFx7O3SV3oTT0CBUzJA7+x/HZ/3XzR33t?=
 =?us-ascii?Q?4ypg4T923py0U/8+ZVV2572sGNwfY5aEhBmOcJ+d8wnH5d/jFNuqqMXfXa4s?=
 =?us-ascii?Q?GCUAYYOKpf1vr3nrnxqzKZ4jfTRDao3Zp6tFH1P99n+qtG1GqV/TG+TriVOP?=
 =?us-ascii?Q?Ho7+OZ5JvPDpVg5xY6jxXcPjyMNBfxmtHjqOx9w52WGIAe9YmIlHPEwJ5f2e?=
 =?us-ascii?Q?9yC7KhQ7PMUCyyzDw3HUsk/uDKCSHmGm7ElKzWnbHxiNpbqHe/h2r/cZmbTk?=
 =?us-ascii?Q?PwHs2S/uk4h3tadso52+qr5rCVh15f7MESu0zCZNW/hbv5cbRkK2/edYgXoz?=
 =?us-ascii?Q?6yCTyI5qXrQCsHdQLuahudIV+m5XTYKYvbm3iof+q9oSaWn3D+Bywl59/tQn?=
 =?us-ascii?Q?CKuBEO0jfsbH4b+OleA1H+7UOCJYN81bO9BXxMAn0ogfmtjX0mI1rWP20qZ6?=
 =?us-ascii?Q?SjSKHmmbj2NuBr4qTK5XL7OK4W9MpGw6/VaryM30LdLMtT814dWnUE6Unurz?=
 =?us-ascii?Q?N7IQcBr8p3ptHc56AwNUB070Mep4MUo4rVaCplbCtne6QA0L6sNQfzrVjFjv?=
 =?us-ascii?Q?iW4gPIN1wv9Z7D7IveV/DO5tWB+8Rb/IZ/IuumZgx3piaVn/lrD00H0rPkfH?=
 =?us-ascii?Q?ZZ6D/lGcCwmt25w+Wezt0o06KAzEdxPP7RTrtmliktM9yISgOB+yhedeRC9G?=
 =?us-ascii?Q?bV1t3fklAb7HdtC2/hGnNTAaH/SXs8LN9hmdJlETaLO4hKuAxMsbbQxKUQP8?=
 =?us-ascii?Q?gxn2x43/gOHKR1qKMm3fdP9cEJoiMXbYc0tysZfwJ8EgbcA5mBEWx5h7lC+2?=
 =?us-ascii?Q?DreuPi/QG9CrH1FI1JQECzer+3pffQRWfJyKnfhr2NUi6ePdnIZLNXQkQ2dr?=
 =?us-ascii?Q?QCYOEjMUpST986s8USnic9lCeyBSWlXLBsPRF9Yik4ggRS5YCoowqsExApm8?=
 =?us-ascii?Q?clrk1LFwfOjpwfDIku4kvAnq7CdG0UB/nhVCsnl+uVdgwF+PZCVCMe/AguHD?=
 =?us-ascii?Q?s9YY0Vblw2Y/qon4vO5LEFslDZjIZW2m2aSIVdkBBIArSbN8yJkFCGrDOS9x?=
 =?us-ascii?Q?xAb3lhzaNUoWXO+FEdAKDfoLJCazB6bea61YiKwdzVcgRfg2fILKjBow12wc?=
 =?us-ascii?Q?Mh9SGV7PtKVi2h4UA3I+lXGEKFI/?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a144eb-ccde-4e03-aa3f-08d95c9d7c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 07:56:10.9123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YuYzrnCjTGX2JNtngFaCCb/76Z/Ge/dumghJiZrW2bSJ90w/xoVTdPzVIqowm1n5MCu3k6jDUIhbnLHEppEL/6+gFCMulnt9BDyXzdUgL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7176
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mDj68-0007jd-7I
Subject: Re: [f2fs-dev] [PATCH v4 3/6] block: change ioprio_valid() to an
 inline function
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

On 11/08/2021 05:37, Damien Le Moal wrote:
> Change the ioprio_valid() macro in include/usapi/linux/ioprio.h to an                                        uapi ~^

> inline function declared on the kernel side in include/linux/ioprio.h.
> Also improve checks on the class value by checking the upper bound
> value.

But I think it needs to stay in include/uapi/linux/ioprio.h as it's there
since the 2.6.x days (I've checked back to v2.6.39.4) so the chance of
user-space using it is quite high.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

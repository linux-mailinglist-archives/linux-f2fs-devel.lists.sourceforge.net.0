Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75A3E8D00
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 11:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDkJs-00048z-EM; Wed, 11 Aug 2021 09:14:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850b323ac=Johannes.Thumshirn@wdc.com>)
 id 1mDkJr-00048t-7H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 09:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qk33s+Hw1xyKxI84eqMBm3lWR2Zj7rpn8Y9Q82XFs14=; b=CiFK5M7s//EMpYUaBGDVZpWNNK
 5nsHo/Fbl5Eul6Xfj3Hv9eQ/ZiF9lkn9Hf3L8H9zJ4pTC+XhpGBd5+/l1BQ6xHZRC5EEmn1ZRy6fL
 ef12+wbCnVh75pDGWCxc5ycY6GliXuAcGVm75CwuNep569fD//hzj/p9noEm6mXVVskA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Qk33s+Hw1xyKxI84eqMBm3lWR2Zj7rpn8Y9Q82XFs14=; b=G
 Ktf60lkmUDRjB01KZt3TCAbAtqodYtymr4eJ5ZiV5tdCcid4NrP+8MKqMeNN+gsIAy0gh83E/skJz
 drgNJFDUQVIo7ZZHgb1+85z4Q6POwY/9fJ6ST6vxbeo1iT1ai0L11InFsnJITZjLCJNw3X8xPWIgg
 HQTCbnbBiNNWe4bU=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDkJm-002rSr-NC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 09:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628673274; x=1660209274;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=1TMP/nRup3cyyZBFqSbyPyJXWZiE1iHkZUGI5Ko7FCE=;
 b=oaj9ClEH1VCXoRVA1IoDwLP8onBIGkannxGBNiM6XXWsRT+uQJoe60gG
 QCozN+/k9C6juPee0khEOVF5OGmPJcQAvmJWkw5DvGKls0QumUCsqeEwK
 Y6DsqKHDhyh/SMx3kNgObLoVn+kGFsdzoHJ9XOPgLQFWyYKotS6CJu64O
 +Y3P/trhJKUbqaHnx8T5tIpPO+Ec++i5Fbj7nsrrm3sUFIQAsVfr2z8xa
 T/be5RbRv9KiiBf8LnMRgDVanNvw4Bxd6Rh9ANYielP5BFTucQGPuM52U
 qgus0mzenGV3E/SRKHEjwzFQ0g4asvOKIpcu8hIK2SsjBEVLJzwUVXuw/ Q==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="181718388"
Received: from mail-dm3nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 17:14:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R17fysJZkcqIz+vaKn3JmXijy1+YHWxiy1LWKotSOoCLc8uT/Wt6w6cUh2Ikrx6elsgYQUt6S8sU7zMaaTa2q7cgfV0eRbO2sOf2RNg2q++Ap63+PNeMjBwj1rqjvdhQaGfhmGukHW9f+5s7U6bNevBQV4WmfkAE+wbI3QpyA1fZcaFJijckYkx7ujJogMIplX49PIb/2qhIU1XVGLKjB1M+Z94MruDSSwx7OJ+PdXXReRPFaAOQnqqa7mMNZJNZiDLai7Hyn7LKF5bu/R85Xsc3/iIxYzBOTdjoC45debl+KOEoJwYRyJiDMUHycDPCDe9i+Ta5xQk/V/s+iAizuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk33s+Hw1xyKxI84eqMBm3lWR2Zj7rpn8Y9Q82XFs14=;
 b=Bzw3gux94rAYBZhtZE9U2fJNmy62WLYNs3+91CEVoBylLd4lcNyAdrRH+j72L29VZZKMb5lTD9dLg7I7qF4y7epLTTudwJRBDfdLY/8KmmUeieyNQtYMHHM5QleeY4Foupo4zDg7KRdCmAjuaDZWYPN/Ib2ZMEPwhV+jnLJq9F2xfQAj/6LodMWCvTKwZuBvqviEGdHyzx9QPuNIqNyzFryGaskKEMZ6Sts6FFXKZg7Qq6hHHR27Q6h3uG74mywN0wRA2Wt68Hxqjki/fHkH3dKI6YtY7BGpAILnqhFy6tM1TxsWKsdd0+OUWJcLNcXV76gKel6HPkDoe4besa76AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk33s+Hw1xyKxI84eqMBm3lWR2Zj7rpn8Y9Q82XFs14=;
 b=ujbWcJerAX4JzQKQpTrjzhv6KghXJcgAPnf9yMZPm16K04kMqmAw2t5qRzpY53BFjvqiy7qT+t+30WvgGUFA73NGuKkXcPcZ7DWMyLSqKZd4lhOe0+OxD5wQ4lUx3e776XW+J6RXKB/sNtspLRRTbXmKkrQXxKyNfpQjx4t2HD4=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by PH0PR04MB7430.namprd04.prod.outlook.com (2603:10b6:510:18::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 09:14:27 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::f1f1:286c:f903:3351]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::f1f1:286c:f903:3351%5]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 09:14:27 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Paolo Valente
 <paolo.valente@linaro.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 3/6] block: change ioprio_valid() to an inline function
Thread-Index: AQHXjmI7JqGKWhtbGE+vjERXXKWQJw==
Date: Wed, 11 Aug 2021 09:14:27 +0000
Message-ID: <PH0PR04MB7416520B7D4C303B80D5280C9BF89@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
 <20210811033702.368488-4-damien.lemoal@wdc.com>
 <PH0PR04MB7416DCAE9D84B4ED25E4C2ED9BF89@PH0PR04MB7416.namprd04.prod.outlook.com>
 <DM6PR04MB708110464CF08693EE8BFEABE7F89@DM6PR04MB7081.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9941e24-8d52-49ef-9650-08d95ca86b73
x-ms-traffictypediagnostic: PH0PR04MB7430:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR04MB74301462CD083C1621D46B2D9BF89@PH0PR04MB7430.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V/hI1mr6HTb/NyVpsP7POwdPVgDvIS9+1xcQAUy9lOTlo5Nqm+PnPmgh/mwGh/Gaok4QeVyMjtLkqoy85HJNWtHnWeINDodJumZESItd1pJOZUV385tdzjxPrExXHcDIw9rauLXh230UF+65NmStHWbk3dSHvrKgZWGL2IU9vVuERravjqqlzhEeOn1W/gQPeda+hzjJeqN7U/Z/HcwjXbcL7hV5t0dV6KHVmyhRg9fewNYUL1jVKajuAZqVG5pcjPPUZGWvDvRSnfYf5brTzgTbOYFnASjnF9k1WkXcViIluBSQIl42Xu4Me2yPC6SYb3NyjKCd8HgRN+dZ84DyE7D9qkdSPUcVzP3HcgeHKQ2JqY3JU0BnqCc0xPZmX47z20rugDsWxD1NgBOf5ENXXmc2dP3FlD7x6NPRJhUL6hQ2IZMBQPK+8fW8z2Wr3f6WagvixBls8x2znWhwEl6+ddAq7w9/fCnti7pS7IfwhYfDwRiUPVeFcNXRYML3NghXBy4xQd/6X+BtCTR+I4ArvfrU1J088uXEx1hvL/YIcMaLOBn+dxtigxWbbPCgz4/dsUOcUTr9qkBPwTrPckRfLmgJ43Ej8VyMeqjqntiDjW5nQ+RmKSzNxQStrzMpIFrY3FR3tuv6OnKUcJsDy3bDp5gEAoI01U1A6KzafMnhFRGqWO/HoOxoPWJTXbfTHltUQJGwHU0Xq3e4cISmHV3Seg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(6506007)(71200400001)(53546011)(478600001)(2906002)(86362001)(316002)(186003)(110136005)(33656002)(4744005)(76116006)(5660300002)(9686003)(38070700005)(55016002)(7696005)(8936002)(66446008)(64756008)(66556008)(38100700002)(66476007)(52536014)(8676002)(91956017)(66946007)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ELogJYgK1JfZKF/j6WhdJmpu9/TjVl/BtKyqbonfnJ6/dRYIzzBkAX46rIdB?=
 =?us-ascii?Q?VTLGCfF+1r0wGqtFccxfL5UlS6qJh8T7zLpDkz6DXYHQTKvC1IhxPPHGQwyZ?=
 =?us-ascii?Q?HDyWhYn0lZ/xo2Ln6/eKTz27YxkvjkKweU3eE1HMegD4YhqQ4H9cStoYLEak?=
 =?us-ascii?Q?5Yn2i6CN+7dsbNoh4k8U8D3PkHcw5Yt7535OPzZ4PlDez43LFqbAySr9tNNL?=
 =?us-ascii?Q?aY1zYQIeG86qetW7YtM8ekEujm0QRtzmUSsiT3QVsEMrEjDvGHfNeiKuHf1H?=
 =?us-ascii?Q?tpQLUNkG5CGZ1E5SOwAEbghtrGmUPAnkQEGLLvRRTdqh1ELbR3uVEnf7knkH?=
 =?us-ascii?Q?Ji3Fbozxbjgw7NOGyd6t1toOalw6Db45/P+UwURIm2Fc/RBtE0TcijxzDUIB?=
 =?us-ascii?Q?vxVHMdsz2RJLgvneTNKGkA3SQfJj7uC56kmCutP6Oq5uMwQgn4seuFwrKf3n?=
 =?us-ascii?Q?Igzp8cfwW9Jt+3eHzrYRzIv3v37QDrkqEKUiUgE+WWGrniJq3iInOgaG3eud?=
 =?us-ascii?Q?Cc4cXZdEjOc+ztMzJOd7YqeFD1K7cuJuGU+GIxPQfMaM9gb1CdapccO+FsCK?=
 =?us-ascii?Q?J+4x50JNJICy6k63WU9cZ3LIV0hUxQPLUeQUMEXZoOXvsklPkkcllMcLS53W?=
 =?us-ascii?Q?fXv0noE7KKx35TOkX2ylsZHxS7CTF6LQYf982XqHtv/G5wn0xuf0VaQWFdzl?=
 =?us-ascii?Q?kzxFpHQwWBqeBazdfeVsfJQ+Zg/0nmgroWA+wNWgRHJtWubsW02Zr02dxfyl?=
 =?us-ascii?Q?YxYBI6ynXhEFr3EuFVIwPCByAuPnTGMTuA+Yni981QDnI1Gual5v+R7UK1TO?=
 =?us-ascii?Q?xylMwP2XFjmmN31nLpbV6Eonek9fF5Hn3g3+iNKYMq70onXG7CBddMM9Q0dY?=
 =?us-ascii?Q?6CU4zM2junqkPIPoe1P3Xz91GtIplK9+uRT5zvSoXi7d8z7oMB5IgSXS6XLy?=
 =?us-ascii?Q?wXvWmXdP1AuNs5uR+xlZUzY1eZomtKxUWNp/vszd4HV2Vn/XZHykwpsAG2yw?=
 =?us-ascii?Q?l9iz3Dsvn/a95rcfBvFFUhNMPlXa7BRY5RBNlhUSZB/Prst1bKmo9csZsUzn?=
 =?us-ascii?Q?Z6eKS/NLAq+g0of8o1mTkp6OUYyv4cBpswCyEGlelq2e1JQOXRqDPhUmc9bd?=
 =?us-ascii?Q?DyAsjbkjp/mChpcSLfagZThzpxOlNUItfJLcbBeEHRw9PKikByGrRiowfQOa?=
 =?us-ascii?Q?NFtGvdnEBM0MEzGsG6DTL0KDqFdgr2WeBBQKcemxUh5BxK5A3YQSdhwrT2RO?=
 =?us-ascii?Q?1ifa1LayY0uItOyaiBWeh/cE+IpsIYEUYL09DDdaqDdv5HGJ+jxUz3Ofuqqa?=
 =?us-ascii?Q?vjEuLtvMfEE0+cCd8GBUwQ4yhSQFTwy3jvhdzJTHz4CGUqVDqxDrjE+v6iy4?=
 =?us-ascii?Q?G6pYlwl9AchxTWVtxhlbB3hzeyRY?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9941e24-8d52-49ef-9650-08d95ca86b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 09:14:27.5001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YG3pWh3TZXT2G1Cd5EjnpdzivbJjyFbMamQnO6iI3YkA8fNzbInC8crUXE/KY1e3ZBuADkDn7zwILGu8qJawyKPmDSfm4yq+6xMCt5aoixo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7430
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDkJm-002rSr-NC
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

On 11/08/2021 10:51, Damien Le Moal wrote:
> On 2021/08/11 16:56, Johannes Thumshirn wrote:
>> On 11/08/2021 05:37, Damien Le Moal wrote:
>>> Change the ioprio_valid() macro in include/usapi/linux/ioprio.h to an                                        uapi ~^
>>
>>> inline function declared on the kernel side in include/linux/ioprio.h.
>>> Also improve checks on the class value by checking the upper bound
>>> value.
>>
>> But I think it needs to stay in include/uapi/linux/ioprio.h as it's there
>> since the 2.6.x days (I've checked back to v2.6.39.4) so the chance of
>> user-space using it is quite high.
> 
> include/uapi/linux/ioprio.h is being introduced with kernel 5.15. This user
> header did not exist now and in previous kernels. include/linux/ioprio.h has
> been around for a while though, but that is a kernel header, not an application
> header.
> 
> 

Ah ok this was the now or never one, I thought it was about one of the constants.
Sorry for the noise.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

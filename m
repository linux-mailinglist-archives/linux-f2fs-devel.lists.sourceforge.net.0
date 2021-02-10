Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731C317067
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Feb 2021 20:41:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l9vN2-0003l6-AN; Wed, 10 Feb 2021 19:41:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=668c7bc3c=Chaitanya.Kulkarni@wdc.com>)
 id 1l9vN0-0003ku-ND
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Feb 2021 19:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SlretfAjzcx560QmGQOqGEq7VudkE+KUqtOWATc/lw=; b=eThhZLrqjSjLrPlQBLZH9Au/v0
 4+i1Bw4VNcrl6ui2BEX+Ux3iPvNMOoFvu6IpJiLpEHgByK8wOl0ozLPYYOTPr/zE1t4TlgUHJ+QMS
 oatZkrJ/BRHoP+8cASTB2aZ5Jhq/Q72xPiHUL+HZbbM5pb+YTQTBgyD3PxAlEmpgC5CY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3SlretfAjzcx560QmGQOqGEq7VudkE+KUqtOWATc/lw=; b=f
 WjKZfZnKzCV/bnit4CQYlhraQ4Ut5p+EfmKDI5k8srm9kmRcg0+JYhltTtiGKCPtqgqJI43msCS5E
 gvdfCrkYZHHhQc45OXIA0jGQmkXbmry9caz5I5ZNMF7yzRQZyalt8gniH5HGNLqShVhfbH7RWve1r
 g7hKHw3n969dcrIs=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l9vMo-0003dc-9B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Feb 2021 19:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612986098; x=1644522098;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=BulIskyOmWR8YUO5p7xwhIc2L89P7SFSNBBHM0FXMM8=;
 b=Kl1Puxh6WJuWNytUJc6qBp1selMNvbRYCrU6BEe9F9Obd0106Xn0jU6B
 4fhGWiz6ohzvNAzeM9LaPCdophgJrpCuDzOYX4G4AGUMYRtNqyJVfHGOp
 L4bSrs8z3VNZcaz4oBRXmdsRaVaMYTaMzVzP92MonIbmYWVUm4OSz9U69
 m4dQsWAWm9fu6KIqs8M35g5OBjpdnUowvsSZYqSIxLH1THgpEv9mOWfTH
 aRNx4TXYa7ho5Pj57qZP/HVLPAsStN9gE38CLpfRWzuSfVvdxxeACd/BF
 wYlDMyxI5f+tCXvKhOz5+zYggdT9DR6BJqMEUxSoteTRGVVUbntKHSIyp g==;
IronPort-SDR: EmYQZrr2YU/Isfkmps4F8xMICtYgoqEZqy0CBiWXQ09gdOIs3HJkzwnRNU4SZxWilIKDRRse2Z
 DVxRCMP3WUtLaq8cEHu5ycRwTfy9YN+a3RF6h5Td52GeckkcB8USvEkF9yCcdBRJy3SxQni81G
 NIW73RF9A7hoEQxsszeY8S6L7M1Aux3VWtC8wCiFvlFzdHOVjrBHzU5Utr0oop/gpaqambHx5z
 KdQhgYXn1GqzlfgBd0l+GH1u+jZsbtu9o1HdeQidwbA5jaZLIUXzWjuosVQhl0J3omOy0HkuBK
 QuM=
X-IronPort-AV: E=Sophos;i="5.81,169,1610380800"; d="scan'208";a="270173968"
Received: from mail-mw2nam08lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2021 03:41:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhtqwxaIvFH0XYaPaITH1S2his4ek+A3HE/jDl2uxfdKsFBlTKzjWlnh753ZFSwOIYYNDG2fNk5jnuuMswTU8+Kw0e/wraCvlwE1AWOu1UbU6M4XMvca4Y2ZmUepYyh7FDXKrvp01kKDKY/7pQOer7NcfuR4A1u9K98vUfRhmOxh9KHkLgdvuSDnqrF1hp0MF/kYtoJPnCPbbaE0Np1R+5/EP3vd+SE3Ia4Gj+q7r684e2gvn4RgPQgH6+2LMkaFcZlTlXql+sdKZ8UOyJi59XpMZnYJdxPXrgwYCjgZPxun9iCRW/f9qqrGqhnIF9a9HKRok2HkGwMwOHHIQ3PSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SlretfAjzcx560QmGQOqGEq7VudkE+KUqtOWATc/lw=;
 b=HiQ8mRUPgi3UzNbpakTaYNO0526l5V0k+ZuD/zWLq2dJ/DErs7aQYRdIWnqniYpRfg23tichyoGNBK74iPFGZQH91ynBTCXYGBA3rDhkCN524M98ymJV0IDP5ugGKu0KlEDGu+jM6718hQ/GblHlwASR1Il0ylNT9kwh5UHS9QczIRfRzDcMLlhX+kSC/GFTsOb4UZnNqWcJ5BOWsPnfixJfrUTOcdfusK7qVtwtP+JotnPfSb2VgKiIiIOm9NLhNt1f2bMjvdxWJvvIAeGLSUxzxgcR3PBcZqlyLtfXb773f8rjrBVicx4hVeVlOiC0eGmTu0D5/QEPMN0llz3DPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SlretfAjzcx560QmGQOqGEq7VudkE+KUqtOWATc/lw=;
 b=e3kq2ep7mXn4HH3wvY4NimROEyMh4z0oq6Ss+EZBiGeAqR+i7a4p007xMBqbByWq1sZjc8hn+e0yRgiCzpiRsHMHXRTfZiH9s77lQnVUPk+6r2UZKsjJR6IaB/q0tnw7CeRNVlHe68fd16U7cjBmN57eKjva7Mt1aOcG26wA53s=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB6690.namprd04.prod.outlook.com (2603:10b6:a03:22c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 10 Feb
 2021 19:41:24 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3825.027; Wed, 10 Feb 2021
 19:41:24 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [RFC PATCH 8/8] f2fs: use memcpy_to_page() in pagecache_write()
Thread-Index: AQHW/YRMS7PNFht40kGdxxwo3+yQCQ==
Date: Wed, 10 Feb 2021 19:41:23 +0000
Message-ID: <BYAPR04MB49659707550FE7CF7B389D92868D9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-9-chaitanya.kulkarni@wdc.com>
 <YCQff/XYAqDUXhhQ@sol.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bd48a54c-d4ce-4a5c-01fe-08d8cdfbd97e
x-ms-traffictypediagnostic: BY5PR04MB6690:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6690B954B11B9916A2970CED868D9@BY5PR04MB6690.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pz8l9O8MKssnEwWmtgeCOWffct6B50JO2X848UbPWEmO1h3sbLsglSxse8kJml031OMChfJoK2O1xsqtttZMyftJH1k4cRIbJfJ0t8fpDR2/LoajlYcaSWXntW7dtPHnAuHxLslsDlfGGUEKRS58Vw7xYar0IKcQXTmBV+m04Qnk8IGPH+slMq97J+UpH4UpKl683mBLvRDOyz6WUwC5RS/KQ78XIrzGwPwCTQZ19UDz8RWhDXoOOIloTYT9J04UzCnzW4WagVANSL7od5AJrUnqFXhCiAYTdzpFKUIbI5pjeLv2oApl5tnsB1rJF1cdOYNEvQ7GFdg8jTjSrF38y39mlGISx+ETiUkkx/uUZWVLfkcaex8OR/jVSj9e5NTqI8hXO9OFWEPIIBDAyRaI2+eeYv3rQlU9yFHCtiVrnwo+X/WazhyTlN3qu5CQNn+KuN9zOrOTjyzWiS3ebURSir13YWJ5O6TEpYAQxiGyCY71SROdOy0cPCzCAyn+n+e4/z8XsPCNduvpE9BkjFwyNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(26005)(4326008)(53546011)(6506007)(7696005)(478600001)(186003)(2906002)(76116006)(66446008)(64756008)(66476007)(66946007)(66556008)(4744005)(8936002)(86362001)(6916009)(8676002)(7416002)(9686003)(52536014)(316002)(71200400001)(54906003)(5660300002)(83380400001)(55016002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Q4cWz5bu1QbRMV/3zxOHr7LPBqLsgVci4VOA7UvJ8j+ebK7YihaKbd3+IVQp?=
 =?us-ascii?Q?SudnKnShpdWHKaY8KgY28IFsZvRBYIORLVVlWLgu4P72qCzG6y0eoku0mE2A?=
 =?us-ascii?Q?9gNIF38bqKFN/LIvUgmVoV1amOjMHjVG6hpHYCeBxODdG/VnMuJB2mqPcN27?=
 =?us-ascii?Q?iqA7RvEN4zP4mV1/KfcdRyg/OAjhYZnRLjZ6VyWhdxDtR1QYugTxnxGoC2fN?=
 =?us-ascii?Q?h6w2uDTgHqn5Zlyp5SOHX1kqW3Ehw/r9QhQWDUc21g02S0vh2VDqv9NX2lFF?=
 =?us-ascii?Q?GHLAhcLgL/bf9YT2IDpYC/1gAcoAYuHia8TRuRoLLSHbxFonLJonZPprIhD4?=
 =?us-ascii?Q?ofDmBGHrZfNLcOyHP9RTBSnObphOQYtN6vgYK7CcFGgw9DaaZ7+0ZNB9WA46?=
 =?us-ascii?Q?yZ0kGN1ANyy4RU3AHsX1EzIgrtHTu4jn8GsoEJj+9wSvXx6jRxlKlv/3CNrZ?=
 =?us-ascii?Q?TxvevJxe3iHc4YJW0s9AzouQxjUW+/91/CQL/+2L3yC/xVJLzA3sIa1VQz1C?=
 =?us-ascii?Q?aJ+ie3KpZt19jWKoPs/R/7y+tbSIQn9YaRK1X7B/0b/5QN09zckLYFQlaJdB?=
 =?us-ascii?Q?hcq02VKuD59lilnDU/R8nxIH3dvVEqbmIsq4vJBFmPqeubnSF8ox8dCkFobq?=
 =?us-ascii?Q?alPjEtif8XR2+x5Jtpq/HxmGRTlZ9tbZTJQVssH4+ZTyejDPcNtr3fFh2ETk?=
 =?us-ascii?Q?7eeVZI2SeFXr6u+KzKzfccXM0cAdeGgNw4P/48XJ/ayMYkPJgSupZnlf+wSl?=
 =?us-ascii?Q?v8/lv5hAzWq3sy5SoKFOn0zepetpK6hLOZd21xrc715NTWcb5h85yFFN9BAS?=
 =?us-ascii?Q?AsOPyMV+CoSpm8p4ocEK0lcPwgnxjPkxK+JKaFDIuzzzk5eFirT2bn4opXsB?=
 =?us-ascii?Q?vVdJOaopMNEHAfy7gdfq00wnPQg/Tn3XmSz8WLpCTCFlmBaiASNrz7gCbioS?=
 =?us-ascii?Q?l3n3wW59BTff8sPjFlx8ZsVS17GjWG6Kf3yDeKZUsQ2ZOmtxCa78XRviYjwZ?=
 =?us-ascii?Q?tO2LPpJaRl3WKyuWGcJgwV1g2GgvAbLC7bbLFt9CPi9fRLN1NsFegxtj2BGh?=
 =?us-ascii?Q?rZJfhyKR0m+5BbhvNBeyIvztTtgnJ+nc9cTifynkv+LYW5Oo3xBpnMZ9NA1O?=
 =?us-ascii?Q?8rCE1hJQtI35Tzi9jkwS6YMtxM9JxwA2K5Pm29Nctncwe6oPwaZYbsiGLLuF?=
 =?us-ascii?Q?6Lcw64uBWEcerI/m6vSzYW4hMeEiHWZk6n1YOIPFPo2bYSzDEH5DE576L7ny?=
 =?us-ascii?Q?BZpq0ibobvqHWQNarAyOX/T6mNFri7n6hfbt2qxEcMUXbCIFke7RYTzDoiCF?=
 =?us-ascii?Q?WhWGaCHs6i5HhNZFf+nOmAXm1YrySiI+1vkZAYs8n413Mw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd48a54c-d4ce-4a5c-01fe-08d8cdfbd97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 19:41:24.0685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQFujcicuwCNgw3DUrKs4olOwl9cNUQgN0pWI7wMX0XuydmA5KdUXk3y2TN0I4Rzpmz8idD0Jlz56vZN1XYk5tehhOpNGzJHamDnxKXBBck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6690
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l9vMo-0003dc-9B
Subject: Re: [f2fs-dev] [RFC PATCH 8/8] f2fs: use memcpy_to_page() in
 pagecache_write()
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "hch@infradead.org" <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dongli.zhang@oracle.com" <dongli.zhang@oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/10/21 10:01, Eric Biggers wrote:
> On Sun, Feb 07, 2021 at 11:04:25AM -0800, Chaitanya Kulkarni wrote:
>> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> No explanation in commit message?  There isn't much explanation needed for this,
> but there should be at least one sentence.
>
> Likewise for the other patches.
>
Thanks Eric for your comment.

Sent out minimal RFC, I'll add detail explanation also having original
series
in the tree helps.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

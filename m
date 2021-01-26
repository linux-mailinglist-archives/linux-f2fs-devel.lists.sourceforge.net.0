Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FB3047F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 20:15:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4ToD-0004KA-U0; Tue, 26 Jan 2021 19:15:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=653b9936d=Chaitanya.Kulkarni@wdc.com>)
 id 1l4ToC-0004K3-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNUDY51cFN89cFLkxV84w9yHk/E66+9qddWBN8QDq9w=; b=JSw05ExqJqqP2PxeG5P5MrZVXF
 atObhvx2Ox3wYd4vkHe+oqIKn3B+XqJJg84gTsiUbagPNv3GXFxTD9LPPOx6pxzWWYehVPiroW+mY
 Awp0jYGNhpUqmT7DOSxruvZaYMzPI1VcdbUSVl62Go+2BxrN1UZn2d2lnoL+6Af5gQTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KNUDY51cFN89cFLkxV84w9yHk/E66+9qddWBN8QDq9w=; b=T
 nR0aByPL82HN4FL+oQrUgkkThgoei6kvs8yFEAa68qelIva4vvkizwn/YlMNtoj/AZMm5lKvxth1T
 K4yZDwJF+PegPVOAoMcb9joldabSX8ixVoaeA7cwA/N6/OarIM8DJ7U3tf3osZpzzdT+Rjzo7KsjJ
 YstfMC1RjPMZcxVA=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Tnz-00B1wJ-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611688511; x=1643224511;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=KNUDY51cFN89cFLkxV84w9yHk/E66+9qddWBN8QDq9w=;
 b=o9TM+lIuPbjf1/tFzhKdeyRkh9udL6EV3STtqvifNnPDCiy6c730TuPP
 b4B0/pU7Koz6jzbxaZNUA1bJSxpUT/J6/tALkD67xdx/UiRigCs5mAuix
 KuAZXSQ2UwCFvEdACUjFm72kKIj0aVP5HFVT4ffktGUx1I7XXeUFw7xNX
 bqukPpHQQGBP+M3Z8xHMOhiIG+6wbJCGSO0i4je9sBnBMkCAuXeEiQDtp
 DqB/UwG7BcdejWiMbilc5ZdFsalhdQHhOmg/v4kDV97d6G6sydWfI/C32
 czVZOdzo31G8rxNidnpaZZk760dQv6LtSH65faNx1hyfJln83IqViFyD0 Q==;
IronPort-SDR: 9F2eAYyHkgpATgkwLy1uhYiWsWZ5LUuQnRgygSejEf4CRXwtTGSIB+/CXjZ+orLDwIb2vr4hz8
 JWLrr9ZTteiUk4tXxaXO6ez5X4SQZqIRVo56fAxonHw4cBna5z1++vvKDZ8uaVB86eBC7ww5Mq
 5zz2samSRkv59suuw3mqY6j/cwogoIKOScSh+7+WLbAhywqZKASd2+LuCqNCUIBrhh2xyqtigO
 nezlYVMAxxnHYeMq7i/fxkvk2fmTgcalMTqHvEnWauWTZN/pLxuCv+MzlAMzO5Nvu8fy8Vmg1X
 yHw=
X-IronPort-AV: E=Sophos;i="5.79,377,1602518400"; d="scan'208";a="158379142"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2021 03:15:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZf8Dbq59XAwdDgKRcje6TVORoMCHCF9wkIwm0oL/h638bHQb+OLng7GOMx76g2H0vQTXRpAxyFQy2+7yccjPa9StB2EYBzxR1cqPTCHJIR/ElVF5PU4RnMs0MhaHJHk/6u7S4MZox5efe0JfKpEinLhNk6P89cyuKZKPFlp3pT8JUprAnB9z03UKi/1meLcOkBvZcWNbW+ZI0aXnRgkPgEvyo4idN7fmMDSbNtoIkeROO6qhEJp9H6YlqYlg8IOAv8R7d/vXDZ897RLub15blQFPy0i1QG0Vs1c1hvPsF0JUQcPtTO85lFHBc636EfJCoGti/KGm3VE9CWXRRtFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNUDY51cFN89cFLkxV84w9yHk/E66+9qddWBN8QDq9w=;
 b=QZMaxr3W/MFqDDqMoCecgeAs9eX2pibfE7gDwuAgTGAO7B41zFM7rFQ7r8Jlll+TmLAhXf2d8fcQVWReO0d0Pa7EK0QIBbFnV9462P4JnUH6gtVeue20lpiAt8vHa3UqtOCa/kg01TowbEl+GovZWAIX152UOLlgWCOOeoyas/Xnayp1g65jQVkusuPAl0NBirRS7BpxfyEwUPHPldRSy/WMfvRpKY8Zt0diSQAwjCLCnq091uO2bK+mbMj/anal6jxJS8abG+a2pyxuWt8JK4wPIsOkc+7jLV+hKMnFeb46d57fYP+ZYxxUK/Uv3GVb5I0lfT5DLGtkI+4+6DcHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNUDY51cFN89cFLkxV84w9yHk/E66+9qddWBN8QDq9w=;
 b=FQuF/oxOCpteS65+OEJYNhD4SLodAeq84LUWNm+payTM0LKZIvCujeLwmkPO6okCD+L3w01zJjQh21wtlrSqWbj7MG72Ork3CQ0fYh7nWD4qR8uBkhWPrD0qTJqzc3ee/A66GnkicBo+jmCHpWfvFx5wEfyvhjD6QtUf8+4wVMQ=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5895.namprd04.prod.outlook.com (2603:10b6:a03:112::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 26 Jan
 2021 19:15:02 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3784.016; Tue, 26 Jan 2021
 19:15:02 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
 <song@kernel.org>
Thread-Topic: [PATCH 05/17] block: use an on-stack bio in blkdev_issue_flush
Thread-Index: AQHW8/UAfT2lRjWk50ewoG8V7AspXA==
Date: Tue, 26 Jan 2021 19:15:02 +0000
Message-ID: <BYAPR04MB4965E6615D7173005E4C634586BC9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:8802:270c:4b00:b091:5edc:1473:bf45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d2ede5d2-37e8-4220-5422-08d8c22eae89
x-ms-traffictypediagnostic: BYAPR04MB5895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5895A39F23DE21E70646371186BC9@BYAPR04MB5895.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B8pXtJljlJUm8z0H7m1rZqP9q65K0txR3xo2jzgTdMO8IpwJK4tbl55zQ1Gz6V0LWIWP05GbRponlmrdcGoIdLdcWCip0TeXI2GrvxYQ94STZrdpBgZziAZuv+ZbEe/qhr+HwvadvtRu3pke6urep5gzdaJ35Sf3Ai21eF1qGK/h1OVy+c94aNp0jUw3o1x+MB3+BwC4HxsliyLAKcueLdH3UAn0qN+Nyi2m7UrxXbSqInuj+phQ3bhadAmrOo7uAVv9g+l8BYb4Iqv8maRA9N5w6eHAJ2jSAxqsPqNGqffVZAF5UbjjG06biyORjZQDMbrG+NplYPxU7lfxIz9/vG4Vjzbm/hce3H3c3xz2SX8tAMs30ImA5Lmg7wx9kvVNihK074egXy22CZ5ipeEPEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(5660300002)(52536014)(71200400001)(186003)(76116006)(66476007)(66446008)(64756008)(86362001)(91956017)(66946007)(33656002)(66556008)(4326008)(7696005)(316002)(478600001)(53546011)(6506007)(2906002)(54906003)(8676002)(110136005)(8936002)(9686003)(55016002)(7416002)(558084003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TpsFeAAzWrQgdE0UidxLtnQ32uznoO0hmJsUfSNGT9zgal/lfYu47Cul/45I?=
 =?us-ascii?Q?vCKegYrsoA+ssWzargnWvnCezjOUEfrOkjkpOU9F4q8EQOqfi25ly0+P66EK?=
 =?us-ascii?Q?z691ZoVK3ZV3giHIe7HMsZIwgk7td8bdlVKCJs+/GscHRujHmDgPV7XdnCc4?=
 =?us-ascii?Q?PzWcpdaPxb9ajMoRh0KHdaLMi9lzjm22y08Pi6LlJYewNi/6pQRUS6whFx9b?=
 =?us-ascii?Q?MU4IenfDhog/hhqO7BVZuRtk1aiLG6hbkfBpkSye1bnJcfCMdZRjB2ofuer4?=
 =?us-ascii?Q?BCJRTGzKJ6cIaQZGCaBF94Rxx/SS1rQjatli38YGli1rD0taC4ayYwiJHhDf?=
 =?us-ascii?Q?X4viWkWObid1joxl4DvBCQ0ziE5WaFY0PcSP+2i2UNkTe4s5b/So1svc/QzD?=
 =?us-ascii?Q?WusDcqUFrSsv9Y+vXuOrNUNzdArSSa0xvwN96Uh6PAf0UBclFRScJ7uTKHEl?=
 =?us-ascii?Q?NMtexDZvpdTpBcrBtKCx04MREzn/gCnPX17GFeOfAT628X19IqRYYzqKUdBG?=
 =?us-ascii?Q?aVTYbR9l2y8KdGjdUbncClWBHnrSJCWXdYJ4QAdp08g2AhwKrLr2yMOEfug3?=
 =?us-ascii?Q?AvKftmgKlbW0bLjlwg0XfU0UDYWXNPhS0A8H6HU0TkX4uQvJrAW9Wp/y0svT?=
 =?us-ascii?Q?Q4pZ2gu42pobxJUGMOnhX6LkQpOd9KiGpGUqgxAdNbyfgtsd+6xQ1Xh/ASXX?=
 =?us-ascii?Q?iuaComdzh/88YH2h7eJ5KwgiGK1Oxpf7IDPLmvzq+st7p8XKGLdJHvLgdK29?=
 =?us-ascii?Q?LbKsOVYgVMO34HxFqXCY8LQU8iIBy2CCNdnQa7/snnD6RsH3JlYI487QmKtD?=
 =?us-ascii?Q?XMgShcqBpF9Ui7CwzR7FOaDDdRQyyLiqIxwBXYEH3HqpUYqJgCWxzjzLUN+b?=
 =?us-ascii?Q?uZQos8Xj91geXaSufUiMTSS2heocGw1gC8C3xWLR7HdJVFosNPZ6QdFt3vmv?=
 =?us-ascii?Q?EJNMPCYYJMHffsvv98uY9xUYvDTE31rhZkdvwUiqgjkjkGpPG1NVliyLIQar?=
 =?us-ascii?Q?F0WA5ETH8QbRmG8YkQxp8elUDMLVA1zESuBfOqt9h8aNvRMrWmn07dlQL8m/?=
 =?us-ascii?Q?RUTkjvVliKeMPXBkCtaoQzxX2OsmbmQ6eHLXMKsfIU11NkXvOaq5jxi8cK83?=
 =?us-ascii?Q?SLsZNmtHnYiU9UgrbQWOehctY6lEFOP9Kg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ede5d2-37e8-4220-5422-08d8c22eae89
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 19:15:02.4505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxvRsepTtCj9PG3nalZYrQcf9Sqpza4sLAKGGnrIYBqSvvucUqdPzSs2+gXn3BnHpPHMzNSlB4ofzI99FgiaBWc2+sjVTxALlgSeM8N0fa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5895
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l4Tnz-00B1wJ-Hb
Subject: Re: [f2fs-dev] [PATCH 05/17] block: use an on-stack bio in
 blkdev_issue_flush
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
Cc: Mike Snitzer <snitzer@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Coly Li <colyli@suse.de>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/26/21 7:07 AM, Christoph Hellwig wrote:
> There is no point in allocating memory for a synchronous flush.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

True, looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

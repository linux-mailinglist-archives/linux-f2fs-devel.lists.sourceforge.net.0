Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B07304812
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 20:18:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Tqi-0004RA-6v; Tue, 26 Jan 2021 19:18:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=653b9936d=Chaitanya.Kulkarni@wdc.com>)
 id 1l4Tqg-0004R3-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MNBteCCasQ58cOiyvvoKF7ZhXhfgS0KrHj5nbUsP/jk=; b=XVLNO/ugQuPevdvUbBTnG90xuw
 1kDKAV+5JuRJHij/LJHzoP2YeCUy65xZMfLSJ/pASVnuiN2R3nTFLsRdlTn+ar9B15OX8za2Ly1pd
 7k1LtnVc39iJ/GhjlMb+ImE4J5etuO+rOlaQceFVztGEuHayIi/eZgff7g3FBSVc6bL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MNBteCCasQ58cOiyvvoKF7ZhXhfgS0KrHj5nbUsP/jk=; b=K
 5r8FY2iaDGnJjqw/LSbOwl1d/UKLWaAIYis1epRVX+U1VrLiTTn7qef6VLrX1C4W7zRFX8YiTl1x1
 9BgLPujuV0ND+k0y9AKrE2w1p8gGlbDYpc9rbgBDdcUX6siINV+sKifheWP48CIG7EX4zd2ytoN5B
 wDKePfA3LW2pb4DM=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4TqX-00B2zl-09
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 19:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611688668; x=1643224668;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=MNBteCCasQ58cOiyvvoKF7ZhXhfgS0KrHj5nbUsP/jk=;
 b=LHiTN8EKkGSRjy3RmwbXq02AVzGVkDG5xCWfExm16MlV/Gu01mgcS988
 hh/VXT7sC46H2EXm86gNsinwcfL1DgoWGAj2AmrxjvO08jHVragIF7EJ5
 0BHFIcf93A4awverhG3fhSMLxSblZsoDFGQI6k8Fa+IGES4CW2Wa3K+Zl
 vFu5gIwQ91wU0o7ztA6lXXZIFxz/gsnjCEXBURbhEjGvYmAm+a/5oIv5w
 /0o2si1vUtd9MQ253zGN3fJgCTWFKwmvQDQZhKwVh+UXU8hKj+7fJqwOB
 My67486T+Cig1/3/mCsCDVhFP4u8B8UuKZs0hstXF26MSjvL1AiW0h1AP Q==;
IronPort-SDR: MkrrKskcV1WCZ9sRLm5GvfQSNMyMiNKUr1QI3VzWSqnuxi5q9G3zxbnSrh1WGwC3vp5ntXv0hV
 lTQGJiFtNudJeeDfdTDwoAyTdZcfGMeGWSMig83Wvvvzx9m2Gzy3QXAhlC9nNfq+kDdtQXpreF
 KYDEBdtcV4O1YdFlihQZPqOrfGUy5mvdp7x5g+8ENOGXGjNhLqOg/jxO+QtXRbko2H52oPe74W
 ohqIL5ZbKFMGGbZssCuHlgoGtaQCziX9lRwKguNzf+KvQldCe73vX2LyG/s2qLI0j8alPCNQ/z
 84k=
X-IronPort-AV: E=Sophos;i="5.79,377,1602518400"; d="scan'208";a="162826611"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2021 03:17:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEVtelCy6+19RlRMRs+B2nW+ixXxCBYB78RRNi3Nv28705sF19X8dgqdDDeCSuuk3/shDNmVejRAqnJeC1OrCOttuAhZ6yqmh4eH6CmDRDCKgSlGBkWVnUHfTg/vhw0/Pyib1hIt9N6nWQTnG7QhbKheKmmkDCCaOm5I7/WfI4sdsAjQ4p3tEc5w5DkVGx0RTcfdopwMppQPgcizZzSL3uC4OtrzOSQUVsPyQIr8D5gWJUWzTUShhzoBy08lKfZNSK0oSR/IWrvD5fJYGW8arCsoHi/oA/MRXQKeV2zjpMlR5Fuw0GghIjhUVmPnfMUAwvL/cnKgLKaM0q3DzuMyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNBteCCasQ58cOiyvvoKF7ZhXhfgS0KrHj5nbUsP/jk=;
 b=iihpdOOdYCKyj1DuH+tLVsoqXcMBLig+Qo5KKJh4CQ8oTVQs7MQv9ZEXTF/Epn9yQLjpBoZ4i9AS1u/Yjoocnbe1Ymje4UP9I6x7XFna+i8r4FXwR+4rFcJkwM9IaKzzxxDOjq1GZ+yMzLQVVhQqgllwp3BToDCvDRwJWdciuh5iZj6823c+zONRabjLV3RQdWt8CFul31FYC4dDq42/U7RwXqLsrRP4Si72aaW8mebZaWz8P5VOcHYQr/enFFwgnPb+YQtU9eM3sDmSg13dL3flQqMEevTuk3wDceMCzLt3si2n69xtfDlRa6UCf/ZP2eXX5BlsKZw05P1nkUNAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNBteCCasQ58cOiyvvoKF7ZhXhfgS0KrHj5nbUsP/jk=;
 b=SQdFN1zLANhCr1XsqkXnbh6sy4/70F0JXqH3QZ6804+ZVih/Jg8ohzLqEigtlsRf7JKG7ke/6TyEQUGaE3GhnYl/DUMwDC/4S7t6GCW2IM/vkAhS5F/IK1UCIUyhkvf/E4kAsDdZaS9qIy+bsrMDXh1tXHybB64D1L/OJj1fikM=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB6600.namprd04.prod.outlook.com (2603:10b6:a03:1da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 19:17:40 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3784.016; Tue, 26 Jan 2021
 19:17:39 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
 <song@kernel.org>
Thread-Topic: [PATCH 16/17] nilfs2: remove cruft in nilfs_alloc_seg_bio
Thread-Index: AQHW8/fDBJWm5TF4/kKRwgyzgGtVFA==
Date: Tue, 26 Jan 2021 19:17:39 +0000
Message-ID: <BYAPR04MB49655561B914F4157914AE7186BC9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-17-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:8802:270c:4b00:b091:5edc:1473:bf45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d908b84-6353-462c-e998-08d8c22f0c58
x-ms-traffictypediagnostic: BY5PR04MB6600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6600677E49D6AA148742CDAB86BC9@BY5PR04MB6600.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:234;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fuzGW4LRAHmL8S0OHwCY59zlusWLshOmeLh6SPdXrXTS8rka6NRr6yWqvRx7TKiabt7iA/f+DwjUGU37wo7656Nvc55HhlyPXiEyNraAAc2P5GTJfsiPkP1ZWs5kJibiGvexWu+Wt50TxlmnAx+Bn5ySNGez2lqSQolxuOEmJunyMiE8pIU/73BKGnx3th7HoRXE5BAof9r3Yi7gDXZvoliCKuSYj/swgmELvXe2IBPqS9WpuPTXWbRmciXGFBN+3HWVhfRZzgaD64ObS0/r8RmnGEMTJryTc5Z9KjHXatImo1KxAUCkFSrkmI/ewWo2sAuJZasc/3W9HzVKDNVc0XxQwfGc6sFNUFMYppGjliHdFdnqrqp2GlGvCIDJDfK6J2dW6y2xAheZQvfpFajcnlf9/vG/Z0QZoK0WbytgPcF1DfMyCS7dDes5sUQui2YTHi/8IT3hUdIBOMLfWSogEr2egs2a9MIGJBk0yvnpqwy97I0HNxWF7ILdOZwqN3Siyyc8eCpYhmAhUplYcCl5eQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(558084003)(33656002)(66556008)(91956017)(316002)(2906002)(8936002)(86362001)(66446008)(52536014)(66476007)(64756008)(66946007)(76116006)(7696005)(5660300002)(110136005)(186003)(9686003)(478600001)(54906003)(53546011)(7416002)(8676002)(6506007)(4326008)(71200400001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ve5opoRjDFFdcqmNB2hzDHTNo3Ul7Tqk8ocfPq2CcJxXUW/hQyeEx/BlrT0i?=
 =?us-ascii?Q?mHy+cmR111hI2iHYUSWz6zz3sRRcrDcBcvojNOjSOhB3Y4c0xAcxJup5wep7?=
 =?us-ascii?Q?2hkr/0IOPSLmxQ5Odf+0xTuw8IKcT3wk2YTXvClZIicUJynIARMDtrukgkSE?=
 =?us-ascii?Q?HOIthERZwLAL8+AXf3DM1x6Rb87uZmugNsphfZmwd/ZRRfuYSvNGMAO+s9+T?=
 =?us-ascii?Q?Py6YYEodXJy4kRM9EDRhO+ES/4RMgd27sbrqSfm0XsLf7OhpdY3h3J9DGQ20?=
 =?us-ascii?Q?OUQdpktPnwJvbg+CAU/s295+SQ3ADGWMB36TvbY8C0qIHnbsPDS7PsDWs/Tq?=
 =?us-ascii?Q?UAEDdwG3GXtbXrNhr0BkV3MYcCIA/YMs2W7ZuUbQJbNF9ajPKmXRfsHdP1fw?=
 =?us-ascii?Q?WL8Rjv3+4WOK8CGN06S0H1fenl/pvLTrlJmMNLVPylivBCvJeSjzkj13pGGN?=
 =?us-ascii?Q?7gUqLcSm9WjjDaAJMg8uOPRksicH4Pl7hdKJgg80UETjGTA45ddQH54jhgYL?=
 =?us-ascii?Q?9mGEJMrYa5sIclzLFv0fM/uWkvzLXZ88g5GmXaGWgvo8oMm4lsI2r/s76d4z?=
 =?us-ascii?Q?ETP8cC/uuJCmH+LcnZVdRuYvtxpc/m48IF3MVCDI1xMO2XUmDDa0nnQYJr8i?=
 =?us-ascii?Q?ljN59rbpKScUr51ePKW/MK+6upVH9kwGiat8pX9JCLiVQHK+fXlUsz9uaBU4?=
 =?us-ascii?Q?AfMsY6aNDzALvA0CHWxURX+a089F2eEOSrRZkZwTtyftB0oQN7erGee/JvVk?=
 =?us-ascii?Q?3F4yjT02E94tVVDzxnhEFj8N6JbtiiU2+BuyAEn3diH8eUrkJDWc4/P5qgHp?=
 =?us-ascii?Q?n3XYsC5EL0nTEXIxnCspet5Z8WASPk8UbZRidQbHxcTWzRdLlRmxxX8vfsuY?=
 =?us-ascii?Q?yi48acGbbi8x/KBEudXJ8XbnFGc0kdaLiuJq2wFww8tXfV9dwgzPri0ku+4v?=
 =?us-ascii?Q?diQCXRSZbddO0kS551m/eLOuybuhSWcRqk7LGoFg8ACQMybfU2jelCI3lpNp?=
 =?us-ascii?Q?weBXzReMbiEAVs7XDYhy+8REnBYjHgozMPhRClrFIzcGMLG1F6B2s2lE1s6Z?=
 =?us-ascii?Q?C//12g5YLtqnp24DJb6j5rLMFn1kKdbjJbzMUnDiG3ZqDyn5A9TMo7SWW63p?=
 =?us-ascii?Q?h15i1SWt7buFFQlw47O1TfgKdnx+NjdTHw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d908b84-6353-462c-e998-08d8c22f0c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 19:17:39.8430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAeguBAaV/yyuZcEX/cI1RELh49y5vPKGx37qy7L41Y1cYfRnUIGyC6A7WL1HrXgXa4d73n4xmNex/Vb4gKeqdyYe4e+xcXvkcgmbBFq/jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6600
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1l4TqX-00B2zl-09
Subject: Re: [f2fs-dev] [PATCH 16/17] nilfs2: remove cruft in
 nilfs_alloc_seg_bio
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

On 1/26/21 7:27 AM, Christoph Hellwig wrote:
> bio_alloc never returns NULL when it can sleep.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

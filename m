Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2D39171F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 14:12:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llsON-0001BC-FS; Wed, 26 May 2021 12:12:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=7737e5e80=Damien.LeMoal@wdc.com>)
 id 1llsOJ-0001AS-9C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 12:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KORs6cDMaNRwjkFnu9T8O4YkFG6aDMtvzAGQf6LxvrU=; b=mXSqAyiDWrs2KGB0VK22aG+jfF
 WkuGNvZBrmJKw2sNDrfnyDW6cDmDbzAgC8rhWGBQQqPnPiWWmvfR173cuBcOTDsrgCnvQ0suAtH2R
 rKpSSZC1pmbkOhPE3CGx3d51eWUzImB/GA177BhPe4fZZXTqNaQ8ItayEyFAland8Gc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KORs6cDMaNRwjkFnu9T8O4YkFG6aDMtvzAGQf6LxvrU=; b=Y
 0m2QhAhNtAFg+GTx4Vh+KYQYPbBPV3lScp/uvvHnIQRLHlqlcSgEg1bM3V1K1AhEHCfD2NDYH/JFA
 LqvJ58QfJ2yyC6AiivEvUz1IEMOfCHHCQYbzzD0u0aaZpICL6/zsrtfy7u7Nb1tfC+BVWGfaaceD3
 T7JHb/AJiZCiovHc=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llsO8-006Vhv-GJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 12:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622031112; x=1653567112;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=A/fLkGFNJLYGOMgSuSdnQ7y6GKUg2aOv7LqkVVTuRCY=;
 b=EjLSNSFTqsy4bI8wWJ5U45VtB3E5nrDht82HO+frzcAWKU6GUKiBSMNu
 2Ws+HFGq9DEzFB37RhFLnMERgm7MnyfH+sYZE/ipwjcV806TVyS0vZ65a
 5HrjLdvbCHStJFOmJxSc5bTJuo2RbYJEKAaNXEszU7zSbYS0jPZFitMH2
 LOKrfBGBV8iDtXWX/LHy8wNIqRBXxY19VLeQq321LAPIVP1vHTwOreyJI
 8F8ReFZSJzQaL+6+78yAfwbT24owCuAIDb5ABJH8QFSipum/XQjNiguDA
 45OS4Cg2qsM3JkoDdjudEIePoI9VB+dCW7LQ1ZdqxHD1e2m+I+KzVAQFL Q==;
IronPort-SDR: GpsNxMAA/ioOM0RVQqAhzSr/4bnRGCtphhyhoaPuV9eoRL84Qlj3l2bFp1ZfL4aTtiQDWA0Vcz
 78leWMRdTHWoebpd9bUR4EUzrojRUQ0rDQB364883EyrWg8nLgMY3d+MSHDlKAZrvEwJ0dq1qc
 dAPD4GR68vy+ckaupy3TxBgvA/SyExoiQ2dbVGv8/iO6ToRxKSf4EkDP2HaVcKWBsu2OGg8XJ0
 6BfxDP94u959IUQitwnK+n4DUwg5JvJyH+TWpdMbaUNXffSmtcgGragRuS6aZGI1dXpxn23p7l
 rqo=
X-IronPort-AV: E=Sophos;i="5.82,331,1613404800"; d="scan'208";a="168794691"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 26 May 2021 20:11:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyxRTPvts2RrkVLLwOzr3YEk8C2tB4Yev6y+MKFYO1La4KZOpvTziAN0O0EPtvOWNNmRm0QeMbL97mEYblkDZsXKW3rCAaXf4gr9s2xBnVjGmVS7t7kIRJAAZFFxoYb2+udUqkoUehGPMSIWajvHheVsi3J9YMnpysMlogAIjTqNu8x5zXRFXI4j57aIhco5yF7ZGgEDoulzPDSvDTC8mljzCIgoAIJKGfWe2xqo3ywxlQ5z0RXC2e8RQ8dvqJfVsMM7zA2955R8mdR2H+a29Nk3mgQ8a/TaTKr3NYRHQd1VVVrrkoD+zWJCDmz8FT2H2B7nc1r5pMheeOKlQpQ0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KORs6cDMaNRwjkFnu9T8O4YkFG6aDMtvzAGQf6LxvrU=;
 b=PT2omP1+QUKHQ9ZeWa4jTw4fgBo0gpV+H3pgclgamykbKftdKM1ZK7lW0hL1TW38OyyECiYSzAChiHwzfS3P75LuueKGQab+aMmbNoBg63R6M6S4KTvWPqVHfesRMxVbJgw0QZX+URTiAYaOPSuqOaIE07f+t2rFuTMmbUzmV1cNz3uUcDnqqD3JxTmcXItsEIl0NWD2jRFZadQdhmhW5eykKvUTMTkbLfdfIdpqU5X3RYcxZCPwdDDq4TU5vfXgRrXjbj4zJ+1jUEp4XSD7bwFyqKCQu8CjxaXqlXTT5HoU76ceR3m78UAQqdFi+ijhMscwjZONH00Tln62W5faGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KORs6cDMaNRwjkFnu9T8O4YkFG6aDMtvzAGQf6LxvrU=;
 b=BE9nUJ9CiXLIW45LOG2BqxSJUyD4+psg5dCeZFjQb3FMGNmHyTedTmjzq7vhdviPa+my6AzjAmffhvvG7+BpntcZahLeBmBsbVlqzUXpxxe4afHNosYBRI1VxbMouM6H7Z1CdV4UJmwOzn1Ci5FdR5lEFkFHWn8Vuf/7DzTCziQ=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5995.namprd04.prod.outlook.com (2603:10b6:5:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 12:11:43 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 12:11:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>
Thread-Topic: [PATCH 04/13] mm: Add functions to lock invalidate_lock for two
 mappings
Thread-Index: AQHXUW0PB1DDoKdbbkudtJQ756uiLQ==
Date: Wed, 26 May 2021 12:11:43 +0000
Message-ID: <DM6PR04MB7081EBE7CE3404AB53F62795E7249@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-4-jack@suse.cz> <20210525204805.GM202121@locust>
 <20210526100702.GB30369@quack2.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:11c4:96fb:3c8e:5a63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdb28495-13b5-49b7-f647-08d9203f6d4d
x-ms-traffictypediagnostic: DM6PR04MB5995:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <DM6PR04MB599597759AB6C006F60D60C4E7249@DM6PR04MB5995.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lwiJaJ0yxdrkgx/qZ5t3p31kR6ZelWKcXYm1R3aKb2h08BsOpmDsoYfzaCagNRBxqX9XR2Fs7SenY6qSqCWSScTR/+vwy17QnHj0glm6azPyMBBtNtZJI0vhxhKu8k9VPFZFmRo8kFemIzcJvhifpywG0xhNzpXkFzuoQp809UFA2XwE4h0+e3SpuD4Rm+BUrNnMTS1QP5/1Uz2LCyaPI0dXuvVF81Wpz2p5z5VTNGaaCo7vkWJ2GQaCAqAb7nHgLdC3QPstVnD1RW7fVECyxsTSHBwnoQE7kfHsOkr3YTneUfUGUsg7QCptmRPOJi7WsVeONUHVkwVqWGkaC2QdoBNoLVBKUGGn/97K1sHzBrkCzPiEcxQ7a1U5o2V0pnr9kRffdVsFqa2STYyQtDJacSBBDgTnCdG81C2TqWnfbBSEx2Ipu7kmaLMgrh78NWminmHdP6OaD+fi1YjoIFHD1JRAuBcoVwxURTCc5CUn9+ReygkbL/rNgAQPH5r1SPfdmzELpomfjdNgcTx5Bvz3tUFE3eDwOPq1NKW/PtP2SuWvI9xyYqbYd9EvIz+qh0OTfK0ndaB5C7KQMCbbt+6Q8oqfBN5BoimDCtuvU68rKE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(6506007)(7416002)(316002)(4326008)(478600001)(186003)(66946007)(71200400001)(53546011)(9686003)(83380400001)(2906002)(55016002)(5660300002)(122000001)(86362001)(76116006)(91956017)(8936002)(66476007)(66556008)(66446008)(64756008)(52536014)(38100700002)(8676002)(110136005)(7696005)(54906003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MJfxghB0mOToMvacjsrlAIlfBgcuoJYGLTwhNLFfYGQPF8mdbKRHWl7J+rY8?=
 =?us-ascii?Q?Zb+dXSOHTVbkYa2Gm5TTsE7yOLMOe4YJP7jtLOQfGmCww+AZVH6wUHR2zAOj?=
 =?us-ascii?Q?yQ1XE/pSHQkxE8EYFw9pDk7A63/GqwUAvrNZSe0gZpQ0g2D/jJtKdNu6M96B?=
 =?us-ascii?Q?vao8+dl5EQ1l5f9bPg01tv0O/1TjPPIrXNP0Z1c2M7QSZ+BKoYJOk7aEHYy/?=
 =?us-ascii?Q?K6H9/9uMAiFL6vbsAVcmfg6WYSrfoXqTYC1H67rD3nzBaYcQFZOyb78h6Fx9?=
 =?us-ascii?Q?NrgE/RS8rz4uhhhzDxAqDBl+3Tjs4w4q/EhPKte4aDwQBCGpNpTuKHU+GoHb?=
 =?us-ascii?Q?7vZaF4mZYbUx0QYTecu54VihUtHYO5eU8a2lj3brQuVBOyJ5NGh1z8tOqVsl?=
 =?us-ascii?Q?VvCKEUk84AIWBmMZ7V4SeHNmZoRA+sHQxc2gFW/vuR41Y7BQeheH1n3dv0Sn?=
 =?us-ascii?Q?i+s5dtn+O4tbvz2N0ddEMHHDO4PJNtia0fC8uAeiH6+Gs+26JjuzPgrzpUZT?=
 =?us-ascii?Q?8GMxwaVmfZcXbEL6A28VGu7k8g3PSbZrlSPFZDjpiK6dyG/B/DMBvZyvjXZf?=
 =?us-ascii?Q?XTKSTzEua/AqxXeaaOg2uKrf4OoZu51RnYlIzhC7vGMsQcjmdsNe1OHHrmoM?=
 =?us-ascii?Q?Fek6cIXg9H4ZOFh9QSrs5jKI4IrHotNsnOwT8LtFCX9Rnm8tlNhDd/hj2/S9?=
 =?us-ascii?Q?Efnj3NRQhwdKcMUYV1HkyuZ7O1rZc7wJLznimpCmehA6IiVtDpKotOvCOiRB?=
 =?us-ascii?Q?RfPZZdieaiZpEri+pcYRAIj4eFsf8pKYhBE/JHzB/q8PoMkd6cp3ZdiWWTob?=
 =?us-ascii?Q?8QvKwbmjj4kM+KwzqhKe/wE+1SZLFsD0sPpzppcluzdComQyXmmDtDvYSJyQ?=
 =?us-ascii?Q?25ukmCzEqqdhkbxsdGdR11Gwpeh5Kb0fl6BL3Zo/JdcgmhoLUlGUROxoqMi2?=
 =?us-ascii?Q?0NKIB/Q1A5BVzLoqd5UHKq9FTf3vhPHxYFoThy8U8wAUU0PYupYd3HI5XLTE?=
 =?us-ascii?Q?U6csvSptmMhoM7cWavMTtSILRt7EHDsZz8EEwtezb9Ia+w+2M8CJN3+lwhKG?=
 =?us-ascii?Q?r2dScGtKnS9wKlXz0uJvxSQcAFQdmEOHdCRpA61XKZYFN972bNFRGhaLFUC+?=
 =?us-ascii?Q?ebxBP0mOYuUpyhLD5uuVTiEvacW/tiR+EuIG033VwmZffRv14Rk/iez2GO0E?=
 =?us-ascii?Q?0BP9ATGD9b/wJOuGrqw5mQbblvrIRB2tK3lc0hsShouTTNcSCHmk7HvSu4z1?=
 =?us-ascii?Q?62oGL7A+8paeBedD+IHNCsG+DKQ1Exf2U3WZK6ykmJ3Ql67c9T/UtHhS0G44?=
 =?us-ascii?Q?9kYDME6t/i20NS1XXHSXdb/5gWizEptq1NVGuVUfJjOShFmnk8zaVVpCxx9S?=
 =?us-ascii?Q?IjDfBWsoj8gzZAkcBcXYJ6mqmDT33UtqPh+5X5zTGwohzuGz+g=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb28495-13b5-49b7-f647-08d9203f6d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 12:11:43.7066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVc1dAwFaGj5Ta5zGOOBGnsk7Aqfocn0DcFT67KOjwNBHSQBKH9d1f9P7d1VSIotitd3WRMTx1w8PXf+6c+ecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5995
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
X-Headers-End: 1llsO8-006Vhv-GJ
Subject: Re: [f2fs-dev] [PATCH 04/13] mm: Add functions to lock
 invalidate_lock for two mappings
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
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/05/26 19:07, Jan Kara wrote:
> On Tue 25-05-21 13:48:05, Darrick J. Wong wrote:
>> On Tue, May 25, 2021 at 03:50:41PM +0200, Jan Kara wrote:
>>> Some operations such as reflinking blocks among files will need to lock
>>> invalidate_lock for two mappings. Add helper functions to do that.
>>>
>>> Signed-off-by: Jan Kara <jack@suse.cz>
>>> ---
>>>  include/linux/fs.h |  6 ++++++
>>>  mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 44 insertions(+)
>>>
>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>> index 897238d9f1e0..e6f7447505f5 100644
>>> --- a/include/linux/fs.h
>>> +++ b/include/linux/fs.h
>>> @@ -822,6 +822,12 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
>>>  void lock_two_nondirectories(struct inode *, struct inode*);
>>>  void unlock_two_nondirectories(struct inode *, struct inode*);
>>>  
>>> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
>>> +				       struct address_space *mapping2);
>>> +void filemap_invalidate_up_write_two(struct address_space *mapping1,
>>
>> TBH I find myself wishing that the invalidate_lock used the same
>> lock/unlock style wrappers that we use for i_rwsem.
>>
>> filemap_invalidate_lock(inode1->mapping);
>> filemap_invalidate_lock_two(inode1->i_mapping, inode2->i_mapping);
> 
> OK, and filemap_invalidate_lock_shared() for down_read()? I guess that
> works for me.

What about filemap_invalidate_lock_read() and filemap_invalidate_lock_write() ?
That reminds the down_read()/down_write() without the slightly confusing down/up.

> 
> 								Honza
> 
>  
>> To be fair, I've never been able to keep straight that down means lock
>> and up means unlock.  Ah well, at least you didn't use "p" and "v".
>>
>> Mechanically, the changes look ok to me.
>> Acked-by: Darrick J. Wong <djwong@kernel.org>
>>
>> --D
>>
>>> +				     struct address_space *mapping2);
>>> +
>>> +
>>>  /*
>>>   * NOTE: in a 32bit arch with a preemptable kernel and
>>>   * an UP compile the i_size_read/write must be atomic
>>> diff --git a/mm/filemap.c b/mm/filemap.c
>>> index 4d9ec4c6cc34..d3801a9739aa 100644
>>> --- a/mm/filemap.c
>>> +++ b/mm/filemap.c
>>> @@ -1009,6 +1009,44 @@ struct page *__page_cache_alloc(gfp_t gfp)
>>>  EXPORT_SYMBOL(__page_cache_alloc);
>>>  #endif
>>>  
>>> +/*
>>> + * filemap_invalidate_down_write_two - lock invalidate_lock for two mappings
>>> + *
>>> + * Lock exclusively invalidate_lock of any passed mapping that is not NULL.
>>> + *
>>> + * @mapping1: the first mapping to lock
>>> + * @mapping2: the second mapping to lock
>>> + */
>>> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
>>> +				       struct address_space *mapping2)
>>> +{
>>> +	if (mapping1 > mapping2)
>>> +		swap(mapping1, mapping2);
>>> +	if (mapping1)
>>> +		down_write(&mapping1->invalidate_lock);
>>> +	if (mapping2 && mapping1 != mapping2)
>>> +		down_write_nested(&mapping2->invalidate_lock, 1);
>>> +}
>>> +EXPORT_SYMBOL(filemap_invalidate_down_write_two);
>>> +
>>> +/*
>>> + * filemap_invalidate_up_write_two - unlock invalidate_lock for two mappings
>>> + *
>>> + * Unlock exclusive invalidate_lock of any passed mapping that is not NULL.
>>> + *
>>> + * @mapping1: the first mapping to unlock
>>> + * @mapping2: the second mapping to unlock
>>> + */
>>> +void filemap_invalidate_up_write_two(struct address_space *mapping1,
>>> +				     struct address_space *mapping2)
>>> +{
>>> +	if (mapping1)
>>> +		up_write(&mapping1->invalidate_lock);
>>> +	if (mapping2 && mapping1 != mapping2)
>>> +		up_write(&mapping2->invalidate_lock);
>>> +}
>>> +EXPORT_SYMBOL(filemap_invalidate_up_write_two);
>>> +
>>>  /*
>>>   * In order to wait for pages to become available there must be
>>>   * waitqueues associated with pages. By using a hash table of
>>> -- 
>>> 2.26.2
>>>


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

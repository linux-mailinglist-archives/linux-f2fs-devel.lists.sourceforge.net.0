Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DF502614
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 09:16:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfGBa-0004eh-6D; Fri, 15 Apr 2022 07:16:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfGBY-0004eT-6i; Fri, 15 Apr 2022 07:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FqhaTrfUIQ4NPWF8rNUYFIy1CuNkuH68bv7RBix4hU=; b=k+envDF4Y5anMOwKQy2gSM2sLP
 P126SyQvkU8ylDz/lisw/aB3D5DhLT8JBSvrGwko4JOa0kB3iHQHnmFNsiftOFdGz4uoU4W4GQJs5
 WJagOvvaXQh3uGvAiW/ESDCnTFVT/71Abj5iFViYLH1P41/5JEKKfcEhuJLGPkqFm3WU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+FqhaTrfUIQ4NPWF8rNUYFIy1CuNkuH68bv7RBix4hU=; b=d03YISWAaIYwNBGpvWHf5NYUc6
 XKWws05pEfu7iXLfx0w2yy1Hw8RBcgxGGGpZJeZHyAs4W45NyGpIahXr2JPIe114cNA5zAxHYDb80
 hSvdcf0TXe1B+qiG4YIqGZJMQBbEuAwKenZoKWnK7xMkAh7TvYKVXR4pa52D2MDq7Kqw=;
Received: from mail-bn8nam11on2061.outbound.protection.outlook.com
 ([40.107.236.61] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfGBU-000COZ-Rm; Fri, 15 Apr 2022 07:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMNCqekaQ2PPLXsItKoSPbv7xKyBM8FG4bDYzsTI8p3pFlzNiSFLFYL/K2KXbJfY7llLFks4m3mdrdw3EVEtYAX2siioptEBYZ3FKx7C/tiq5/JYQ4FxJ+76iLsBi/LluoLaUyataCSrWf6pJFKGdGYGrNnAx3nugwCi6ejqpAuWnmpRudBM64DAZsSFdYFgpSNAnoAE0dq/s8h0UMwhonjQG/Y7nm5FG7X3CWA9Kh68T2P2LpiuqyE4BfwIU2kg/+bN8Mp08nncID0B2wemNSevI4kIA4kbinB+m3GQuo4y3Aq/jtNOLsUhPkTHuji08+uKzfLI0x5oVeOLCqq4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FqhaTrfUIQ4NPWF8rNUYFIy1CuNkuH68bv7RBix4hU=;
 b=nuaIirgzT8DzctS5Y9j/d2kyd0lW3DM5qrq/AXm0vasrNszSA74DN86ufg+ORASklF44xrj+ptqmPyYfDuCdb++JXyEt/OyILP/AWa1FaBDmEanRIcLTW3cTMUJJxEApdlf0P0lOCxpMcNlq/leITabTxivbxpXreDhZ0aBnvdzyOs6xaFRYIBE9jczIsTwvKlH78i4uy+v4PHxgrMTDagBtYn4RKVmBZRvdKSKilJvPkb6TCe8WwsaWXPDtGd3pGAzgvPi+A9GDlcHzuj7rI/77IS77QIdRX80JurmTBhmI5K76W99fnlsE+agJ1STzKPFmajXoLIJVGsEwDe6DQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FqhaTrfUIQ4NPWF8rNUYFIy1CuNkuH68bv7RBix4hU=;
 b=tODTqjlAlsHeCHfKrGBmp/tDHryUzAA7ST5FHPcQ4MnODbRHDx40ZYACQv3iV8osnIwGU7mI45cL8QjiiX3HNHLJm/2G45jzrmT1Mc0fYmxAOaiV8rCseFGQ3tWvtBtqOKkXO7telm8RCXpcS8UehyxM3hRkrZHHNRI/KkJP7TEMk7gyB43Ks7EwAYOKDdyp+T6bLCR3kCDElDJEGMMNcCAvCxWOEUoPtjl4p0bl82up+6InTGQbswUlW4+y9UOfW5KkeRkP19LusgWV8XKdeXad5d5ZC2O8KmLypNfb7maetucp1RfqAl5zZNiLBqeh9L94vpoq80dB5LzJE2dZig==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:41:46 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:41:46 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 12/27] block: add a bdev_write_cache helper
Thread-Index: AQHYUITdob/Ugwum8EaYZwRM1yM7v6zwdfMA
Date: Fri, 15 Apr 2022 05:41:46 +0000
Message-ID: <cf0b3178-8823-4cb2-c987-db76e005ac4d@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-13-hch@lst.de>
In-Reply-To: <20220415045258.199825-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48830246-69de-427d-1f12-08da1ea2a179
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815BFF38ECDB61E066BCE78A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QukpvFRWGEJB2QMDxopY+7PehX7V0MCO16Kh18N7kY4LOzr9YuBq8I+WJa8MvCoM5twpadFcdPxd+GRpk+xryAGpEsKBOtHwdFoHJSkkARPlYe13Te+9szYCWxaNM/i8IRBLCZxqh1GJ30cPMCf9I+ua9PzkMxrJIFIsHawZ1toOQCPTN3GsLd7BronqU3M9pLSvHmxKCVfGHnuxLHaMvcysmwRv1lTdiKN++/TAKBYwtptwP0kT3tVJB1Xh0KzR3m/pBOgR8es4hNmVTf6QzA+RFLSk+P3bZHwY6wX5nDfSFZtmtt740wSmNkMIdD++XfLcRV0X4jwL5qba1Tui2KcPBPz8S5wyx3RmD/YxTxFI9ZhP81i9HPrY5m3kkP6EobNmIYtVi+X5db7S68Z1A1RnZoawXaSALScymo19klGFGU4il16B+3AoRk9pNOSfJ+q0/jcfJsbO3ftz1JrKnkLWDs34mDZyRcmcEqxE2nsNTl63HJ7Pz0OhK5YKWCL1QvH+pVK1qvS/ZHQRCqC7cqfHmDOZqAOvoi6Jx4WT7AWoFG0cXsMwCzZrQN9nj062h2CbUX6EdW4xQgty0PGht7c3U7fKr48E8zApO+g+NpHOISkyfSXJxb0C1Tyr2hA11F9Q+TnT18ReXZLRWu1ToFYQK75baOmk5HMrOFAM3fLJRyug6J95Nkh+gWiDtSa9twCfF1M9EXacFEk9cl5dpXFezGiAlPle5HX2rjSTdoU4GPrIA4/u/0V1SVv5Uxdg3fWlCfeHiNwRGj8lO8uNfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHN1U0pkOSs4MDNHMG1yMkhRTUg4b0M1Q0dRTUVSWGRyYXc3NlN6NWhVcy9q?=
 =?utf-8?B?V1NoZDdFVjdycXdrRDVMQUVGa1B0TndSUWdhNE90ZEh0ai9Pdk4veWZhcDd6?=
 =?utf-8?B?cXFmVTdTU29YV2hFcGpSQlpxMEpvV3o5M3lZelJTUXN0d2w2N08wZU1EOTFS?=
 =?utf-8?B?ZjU2d0JneUdXR0owQUk2RUlmNHZqZlo0aTgrQTVFZUdKRTZjL0NNT0RyTzVY?=
 =?utf-8?B?OU1NZ0xmNVVEQ0laalFsNDVYMExkaklTSTI2WExpTVA5UGwybk1GTlZYMjZS?=
 =?utf-8?B?dEtBU0NOWU5sblRkRGJrdVlGNVpsYlNUK0srUXBVdGdFdHVURXZCd3ZrYmVS?=
 =?utf-8?B?ZHZnQkVYSkJRdlFlaDArMUJQUjhsMDlKdFJvTnF4OU53OUVHamtkUnZ0OUNq?=
 =?utf-8?B?b01GZzJlQk9BMFkwb01INi8vbmdUUGl0Q1lvc2Q0SExxUVJkaFVuUHNSNUdC?=
 =?utf-8?B?Rng1b2JMNjBlTnFuWEgyNGQ1SGcybVV3Ykh1YlU3Q0krbDVYYnFLUHhYWXV4?=
 =?utf-8?B?YnJKMElIRE1SQUY1VHc1YVc3SDcwd21hZzJPZUdGWXhzR1c4ZEpPSXB0dDhM?=
 =?utf-8?B?b0Z4dFVBOW1tR1Q0YUR0aXBWYTlCeG1RVFpXVHorWStVK3VJRFY2L0hhdklR?=
 =?utf-8?B?bHR2bDliamh2WElncUJ4emFZVjJRejRZMDV2KzhhTW45eU4wNGRPSC9qVGZs?=
 =?utf-8?B?d2RXNWlXbmhUbHBzWENxcGhuRUZTbFcvTU1RUzRjdzFiOGNaSGhZM3A4Vkd0?=
 =?utf-8?B?NkphNkpONWFuNmg0UVlFdjZVK0w4OGd0WjlTMWJvRTRNRERsM0ExN1NTallZ?=
 =?utf-8?B?bWVhVVVOS25ldythMUN0NHlnR1FpbENUV1RpcE1Qb0hEemJzeis3UDhtN2Qz?=
 =?utf-8?B?bXZZMlV2RGc0dHorUHF4RmluSmd1SmZ2SjBKNmN2NmJKendtMGFqdE04U2x0?=
 =?utf-8?B?Tk9mWWowQ2IrNWVtTTRtZmNNRitVaHcraXZOODAreXVYTGw1MVJROXY4c3Z4?=
 =?utf-8?B?MzdzWlVBaDR6UGJrSDBuQVZYcWVPUndOSGl5dklGQlZ6V1hKL0prME05aFE4?=
 =?utf-8?B?MERSbVBMNEdLZm9zUWdBQS83Yzg3VmN2WTk0NEFzc1NYRUZpdnlOYXBCakxq?=
 =?utf-8?B?N3krcHpSQTB2R2s5Q2d1VFQwc2FsSlkwVlVpQy9BWk52b0lyamExYTdNejhn?=
 =?utf-8?B?SXIzNldFZ0JvVUtIRmNQUlhmWHVwczV0cE8yRkJHSEE1UXNnZm1oNzJBK3Nw?=
 =?utf-8?B?aW1yaGpXYkRod1lJcVo0MzFTdlNCYnZETHptOFY3ZkdDV0pIaVRsMFJiblhE?=
 =?utf-8?B?UzNhbytweThWanJvZVl5cXRwTmlKTkJxNytGNkdsRUNnN21USThYV2JuZXhJ?=
 =?utf-8?B?SVUwUjNlT0t5TDc3YXYwdStKS1EzZ1NvVjB4TGhTQzBnd1c4VmhOZy9RRkMv?=
 =?utf-8?B?aWhWZVBUUDkzcDlJcGkvOFpYNnBkTGFWOU40WjRzckxYaHdmL3RhaWJnYUZw?=
 =?utf-8?B?Mjk0UUFSTlp5eWZ6MEVockpJWTE0TmtzTjhXaDI1d2h2V2pqU1k4R2FxODRT?=
 =?utf-8?B?eUxLS1hVQWEzVzZFR1hQOXh5Q29mZ1NJQ3NYS1U4SHQxMmpXUjkraWxUQ0gw?=
 =?utf-8?B?eC9RbWVsMFFKUTVoNDhJMHhyVXowbkcrSml0RWx4S3BzQTBpWFlmYTdXOGpZ?=
 =?utf-8?B?endhcXN3anl3OFY2TG5DSERySE55eGpyaVVwbklMSlhhVW5DN3UzZEFRZUg4?=
 =?utf-8?B?VVhQdzAzMUI5UUFRRzBtZDEzdlZPOVlkd1FSMmdwRERGMzJYUmhzN3ZKU3RL?=
 =?utf-8?B?QnBxeWxodGRJQ2N6ZExJcjdyS0FoaC9PaHhyaWNjRGc0SzRPOERubzVvbyt3?=
 =?utf-8?B?emYzL1U2WENJblEwL09QYWVLYmZZTlJST3hra1htSTRINnBJbG01OGJZWVo2?=
 =?utf-8?B?WXFSZ1JPd2lBQXRiNmVycE0zVko4YjNTOThsYjl5MmtPK3FpOWsvc2hQUEE0?=
 =?utf-8?B?SW5xMFV5eEplQUlEdFdxR0NEa1NSR3gzNm9QdUpHZGdQbzdTK2JsSG41QTBZ?=
 =?utf-8?B?TEJSS1planUrZk12eEtjeXh4TkNLelNNK2ErVlUxbWJ3dlZHaCsrMUxHSHZ3?=
 =?utf-8?B?eCtFLzBnOWl1UDhRcWlEcE9neGRJdGtFVkZmd01iWVZuTVRodUgxM0JhZ0hQ?=
 =?utf-8?B?K1FwTlE4bHd5RWRrb2pxaUxXajNmK2UvZ3hUb1h4T3dGRk9QdUVyQjFoSzFD?=
 =?utf-8?B?WVUxODNxcnF4Tk9uZVBGOThiTkFzSTJveHlzbWU2TnJ1bVZ6SzVrY0R2Q2xL?=
 =?utf-8?B?Um5kY1MxL0NhaHlYTm5ZSnB5em8xSXVqSWdYMnhSVUM4OWY5RmdGSmNiMFgw?=
 =?utf-8?Q?yoCsm6uWvQ1a7EMM=3D?=
Content-ID: <80FC9A4858701045A17542A9B486AED5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48830246-69de-427d-1f12-08da1ea2a179
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:41:46.7857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1I/HGrTepjPrJfyDJXvAhA0IGeyaOEbNK+YAiCNuMMlAxhtbd6TSpK4UrJ9KB71YHciDco0PVv/pgbmfpPENTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Add a helper
 to check the write cache flag based on the block_device > instead of having
 to poke into the block layer internal request_queue. > > Signed-of [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.236.61 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.236.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfGBU-000COZ-Rm
Subject: Re: [f2fs-dev] [PATCH 12/27] block: add a bdev_write_cache helper
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/14/22 21:52, Christoph Hellwig wrote:
> Add a helper to check the write cache flag based on the block_device
> instead of having to poke into the block layer internal request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

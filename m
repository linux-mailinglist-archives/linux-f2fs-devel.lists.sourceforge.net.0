Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177B502569
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 08:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfFFt-0005KC-Dy; Fri, 15 Apr 2022 06:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfFFr-0005K1-SA; Fri, 15 Apr 2022 06:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/5H+8Htl+4waRugxbMx4Qrdik8L7tyzYJrNYknxljDg=; b=liq7tquI2sFTozHBM43m7v0Ocj
 BA7aSyx/M7libupdPIMN0xdydZb2seTMJKA3N9GCJElQgOJLKluiMEKE7SA8+u9Ru6Tz0WxcEElUC
 cs6Bqa/HE6BzDBZJGjb+6+AiiTRVmvDqTXh4DGBQ7Ly8Ik75eRSYh8GA3V1MZfCktmsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/5H+8Htl+4waRugxbMx4Qrdik8L7tyzYJrNYknxljDg=; b=ik59ll/UBR//4UP1nl0R4z4sKw
 b81cVyIYjWIVTJqo/1Qo74YgVVx4MmYg83MfjurrAorUgVwEAeKluBEpdhaIhCzo+XLxCfj3iucyr
 Zd1GGDvxttMzmkcC7N/kzoavJ/0/lkHUrrJvu287esKZYskXA6ICwtsFd/F0lgF8xDi4=;
Received: from mail-bn8nam11on2055.outbound.protection.outlook.com
 ([40.107.236.55] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfFFo-000AuR-S2; Fri, 15 Apr 2022 06:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5xmOosq2CA76gdgm6VfUB1pSubKAWraGkUGptftmTUx6soaY2zrItNPwxTlvdnQbkGHRttyCOskGudy4NlF/wLoXzpzF/EsejVfBD8RRVawAg+HW2h2Ee8k1M5oGEVjdpdQkLnp9EnFko0ztZjGDVY2GAb3D+22PwiZeOcl9O/N26mW1ZBSkqJub6ssns2U9MWviR5Kp569zngIlDY7GFnDkw/6Ks6kQ9nZku5RTAHm+naUGvlvAxOHUdhXUezohgNOsgU83OCH/IkOyRZPOePv1MkJZcFcw478P1UtyoermwZEegfM+bn0WB67fM231W8jiRLDfh6tPoB58hiJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5H+8Htl+4waRugxbMx4Qrdik8L7tyzYJrNYknxljDg=;
 b=DD6/kBr1T8p20Qy5G4MnmbrlfQNsSPGYYHlOFiqCnxtlUvYkrslD6SVVIGbaJomLomkFAnjRGvdKt8LRZRtSydG5qfl2li1LIECN75pldb4hGa4u11EtW3ABLfCnwYax/2NVXnVtzNxNdLb2NJWk5l50LzyORV7pAngYn/T0umInWjqueJJbW0UozX9F1Eh/eibcpUMH5kdJL31+H73UelklLS8Uem/8wu+ZkE8oLksRYXhDaZMlXTAkUvdB6hAb/UDbK3J8Sz15smPZPeo/1hFCELeu0uPc2kmh8xS8C02Vk4Bs2eoRYFjKNRmukSuXeDlPAW6UR1vqQs1a/HbCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5H+8Htl+4waRugxbMx4Qrdik8L7tyzYJrNYknxljDg=;
 b=bbQcnGI+WjMQNQsa+dIiZJb6XflLSwuUmitGjnUrE1+K2mZ1hM0qTAY6w5oFoM3BVgzz1TLav0E5w8H2LEdwFgKZBKvW++4hTnZmCQJ9NFJVhYN9f3dkATOUCjUANbMEKL6l45b8yYqPoW2ybuDs/rZLEvXj7UV3+OSsOvgIaGenA0jsWeFjQS+vn7lKL1TxKHIT6zWvmDWd9fBFFHkj10xS7juBmZeLdjI3Tgubc1dkhc2jSdph4ITmdstRwFudio8xxKlcTK6jae6mJOWVC+wXHrG3+Jzh3JSVwz25WoFXEVaPWIxmEm/WdZ8SC3lvxlKY9mi9dU4KBSIX0yRhJQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:43:09 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:43:08 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 15/27] block: add a bdev_max_zone_append_sectors helper
Thread-Index: AQHYUIThL7IFGipIVkSGIZfvx5g6z6zwdlQA
Date: Fri, 15 Apr 2022 05:43:08 +0000
Message-ID: <29b7e5b3-172b-c006-94c3-ad23e058e438@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-16-hch@lst.de>
In-Reply-To: <20220415045258.199825-16-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 329d9650-aa25-4c36-bb1c-08da1ea2d25f
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1815F3B93CAD76B7BC5687A4A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t6t+OjGUQ1OzaWpmgj6CRMw/oONXIm3UqcwYFA2T2rxL0gmi2gY70ddUD0K6Yoaibu9boOOIqd1sMsP4CbzKPtbQYwM1IuxsKpoKGXVP0M3JkttCknJs8GZDnhcxJgArTJBsyvlZnBqIbkRjFPCLFihtUqT6fV0hVQZNY2BxY2P5UAf5WBOR7I0LhKaVr/CWet93K7A7AXwUD2dYflyjdTdDHm9tcJPkTAXcir/2fpOqvw+eKW2jdnYm7P5aWyirx/3QPcRunm2hFEAIbKyvQGga+6KLFRgexCQ5D/Hih+3RRNOxKCsCZVGzDlSp8zaoD9hXaKgpW+yvFslrcRXDHv2iiP+jaeEB3zaZU7axixGIkNC+6QxEA1W099/MWYtx9krTcvxx8yUJ65Bwf6Vy1QkdXPjwMVMCaTTb5t8AHDKLW+c/4tXcEq+MDjI3vHByOqfK7z0Rd1Rly7qnjDQqcLdHpj9KWhC0LbbG4XgzwGQcQ6TQGEvliw6Y/kToovcBRrI4vpileZwct9UvYcC6islmD0DWSoaNjyHDsTwPQQt7e9A4Syw6quQC/ODj+xrkfNS4L70tSmleGz0qVUkKLjRyWJA5ficWTWVeyDq0jlaeehPKszMYOPXZ/mTOZgJlW883XsU9Ydwb48LBCXutALWEoeiS8UsOIPoHMn9hq1f8HO028tdO+IFYz4749b6dvSCp2+cNqJZWrdJnK6UGvaYqUvnP3sF6fcv0lB1FLdjUHsBTqH5cddPu7xcS/XyS0zo+QyH22wYdQqyV0xXOzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGF4eEVUSDhUZVgvZEFGYUtJdXZaMHp1VnQxYVNBZ0ZpblNkYm1pUUl2SEtM?=
 =?utf-8?B?Nk9KeDNZbHB3aUlYMlhoYVBIdzZNWE4zcFNBaVkxUUFYV0thZzBhRTRQYUNu?=
 =?utf-8?B?dlFwdXRpTFdwbmdZS3MxZDFrV0hFUUxJeGVYNkVnWkVEVDdmRk5QdmpTTjZa?=
 =?utf-8?B?d1Q4NysydjJWWmU2TkZJM2NPempodW54VjFzK2pTVWtMV3Aybi9rNlJMMm9q?=
 =?utf-8?B?ZDlhZ280cSsxQ3ZtT1owK1kxYmo4QmxOVit0cEhwQWsrYmw0RzdFM0JXSGtJ?=
 =?utf-8?B?QWFkVnVFMDJQdGVIMmRIMDVjK0h0bDc2UFIwS0k5bEcreEdjOTJJTXQyc2R1?=
 =?utf-8?B?YWRLZXFza2xabjFLU3dOSHdvSFJKOGZpc3B2ZllvZ0p3Ky85dUx3cVpHYmVu?=
 =?utf-8?B?YktUbkVIZUovMlFxY3FpRFQzUmxQc1BhY3loSGNWcmZ1c0tOSHdIcDVsN0Z5?=
 =?utf-8?B?VmR6dXN4ZnJLUm9adGVkL0pCSGtZM3ZmcURMWU1NTUVGUmRQb2JiUm1UWmFY?=
 =?utf-8?B?TUw4bzBaQ05jbXpqL0hxMTkzTytiN0hMT0NJclZwOWxpQWxzU3ZvYkpBeGVV?=
 =?utf-8?B?cWhiRHBCOHR6b2FtWkFwcWVkcjZRTlVTZ3hNWE9ZeDYxNFEzWHZadmVaYWRQ?=
 =?utf-8?B?TG5VZUtJVnVqZVhGVTJ3RWkxWG5MQWZHemNNMXhwc2hjbkRjbXRpUUMyVExa?=
 =?utf-8?B?c1FNOGhWcm41Rk94ZUhmWlE3M0xCOUZvTFpMcWptdlM3NzhLYzhxaDRMdVAw?=
 =?utf-8?B?UEJxRlB3RUk4a0g1SktnTUJPZjhCcitPbW1UV3BrU2NTTHVwN1Fpd2hSTDBu?=
 =?utf-8?B?Tk4rZ1NMOHg3THZyUXE3T215cGs0NkVSa2FxV0p6ZWhYL29Cc0hydHdoeUts?=
 =?utf-8?B?cjY3RHFYNTlQUFRGajA2YU5VMUJud1A5ZEhleXBFaVB3aitncWVOVlFIWUVF?=
 =?utf-8?B?SHZhTlAzemxBZ2FuQWhQcnI0NktpdE9XY0ZKRURBTDFWeWZmSXNDZTZkRENB?=
 =?utf-8?B?cS9pS1ovV0VmeFRwd1hqVXFCTjMxT3dockhqV1NWeXlxVU04cHNuUnhNYlZD?=
 =?utf-8?B?R2owcFpVbUhMZlI2L3c4a3dublkyTWdzZDQydFJKa04rOGVhZDBFb1JhdE94?=
 =?utf-8?B?dGR4bTYxUGljT1R4L0ZRcTBlbVRyVXZLTGF3emhhZ0VqcmdKTGVEbVlYWXdK?=
 =?utf-8?B?OVZWK3FWRlFqSEp5TDBWaldiQXBGaW9pVXVkRTl4YmpUUkVzS2tMMEZJYkMy?=
 =?utf-8?B?eEpxcVJmQUFPN0dHVTdPSXh6OG1rOE1UUXNRNmU0KzV0M0FkUFh0Z0FHV2Ro?=
 =?utf-8?B?dVAyeHF3RUh3Tms2OWJoTlpyM0pPR2tZcnllZ2hpY2NTM293a1dYUjRuNmNG?=
 =?utf-8?B?VldPK0ViRlBVTG9lTWc1bkYxeUZFZGx1cFoxZTd3YmVxeXJ3OHI3bElRMTRG?=
 =?utf-8?B?ZUduVXVtRzY4VHY2cHlYaTVVRGx5MVBqdkIxTDcwSXA0RC9GeDh4ZDVUeHVr?=
 =?utf-8?B?NUF1dnNwdGp5WXJJNCtrbTdPK2M5TXFEWXJ3UDJmTFZVaEcxYlduNWFmZ2d2?=
 =?utf-8?B?SXNSOXlXOGVjcUpiZmxDRGpaM2xEKzkrNUFPTnJHRllDMkIvN0tZNTR5bG5C?=
 =?utf-8?B?dEpDV0VwRU9wTDJBSnlwTEh1cVN3dzBKS0piN0hwaEVzSWU0a2owcGVBWWZX?=
 =?utf-8?B?QTBCS1dtdnU2OElqam93OFVRRHdaZHBkSXp4eWdQZlNkbXJkOTQzbk1sRmNr?=
 =?utf-8?B?Z3AzTDNTY2NLN3VRVDlqYy9FWlJWb25GZmd0SjF0U3ZoZGtqL01TSTF4MTNE?=
 =?utf-8?B?enIvNkpLUCt2K2hrZ3h3anM1SFBVVnFkTHphaXJMYWlxaE1ycHBxYlo5bEpt?=
 =?utf-8?B?R3puZ043TzlkSDlVSTZmQ1ZQblI1SjJNSlI1N3FXSDBWeUE0bzZBUElWWjg4?=
 =?utf-8?B?Q2Y1YlBic0RpdXhpcXd2TXBPY0llZzhxbWU1RzRzMk92OGQ3bW5yamp4NWhi?=
 =?utf-8?B?SEUyMFBqcDdaa29NTDZFV3ZGVGJjakF5aHFDTGZyU1RQSzZhYlU2d2pDSmpT?=
 =?utf-8?B?Q3NOVnltRDhndzJVMndLWjB4Z3VVSlVqSE84VEFEaGZNdTF0QVBSQXN0NFYz?=
 =?utf-8?B?amhicXhOdE5ybmxnSE5XbTZya3ZFSVcrMUhYSHB6cnJOeDBLdEZja3ZSeUdv?=
 =?utf-8?B?VTVPQ0g0Y1BNVFNJakNIWkl3b1VtL3NSSnVEV0pUR2o0a1V1b285VnVNcVVx?=
 =?utf-8?B?dkZKczUrK0JJOWlEMzRGc1JBVVA2dThsU0daUmtvS0R5VW10VkkyZkNGNjlm?=
 =?utf-8?B?THJORE5zYkl4enJBNTRrMjlYYWJ3U2RoV3lyWUFrS2VvUlhpOFIrZ3JQZ2tC?=
 =?utf-8?Q?9dpsVxsWYuGaBiJZKWvNwYXf0NoBW3MqzIHF/?=
Content-ID: <6CDFF86F90989C4A95462B2BEA592E1A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329d9650-aa25-4c36-bb1c-08da1ea2d25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:43:08.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pI4Ug6p8HtKxYGGTRxGsdbryu83yFMwivmnD9Bi4GdnIIxiVGCQx5DSYPhYLUiIiFyypc2wCWvLHLPzmgBetuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Add a helper
 to check the max supported sectors for zone append based on > the block_device
 instead of having to poke into the block layer internal > reque [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.236.55 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.236.55 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfFFo-000AuR-S2
Subject: Re: [f2fs-dev] [PATCH 15/27] block: add a
 bdev_max_zone_append_sectors helper
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
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
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
> Add a helper to check the max supported sectors for zone append based on
> the block_device instead of having to poke into the block layer internal
> request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD260596B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 10:13:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olQfh-00030H-6F;
	Thu, 20 Oct 2022 08:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olQfV-000303-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 08:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uaAEfgxliMoESOn6Q1UOWoSSTqGvZ0bmlDoEo13/RA=; b=E8izAWKcuou8M34EaFTcAGCmXa
 41QhJ2PfZwBOrtddYYn1iyUFGMvfj7B/E5/2fy79nGdw3bLtaX/M3fBDzGP6XNoIF7OKLuX3O/qrF
 92T7/JSSHleZOBl/YV9L7rzqdIKfPSeHxP9csr2ytgm58SlUNp17e6crmkZT8pcR/dNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8uaAEfgxliMoESOn6Q1UOWoSSTqGvZ0bmlDoEo13/RA=; b=QkBz3+Z4yqxl7epcjRda/Xb4LM
 Ch9X9c1AkEV//SEaROXaOsFZ2jSZxZoBolIryh7nY2tlnCbN7W0nEEPmWu+ibN8CJJXNdYEwrDEA7
 E5ZYebCFV3HNDhyKOinVoCAfEdbOd5Jmoy5ZKqpO/gSYpTDBOkl102t10X+pma8r13Fo=;
Received: from mail-psaapc01on2113.outbound.protection.outlook.com
 ([40.107.255.113] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olQfP-00AebM-VB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 08:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lj0cazUMrdWP9/7wvAxRrdpaC94cZnJDcDmAnLJrxncll58cCsdvo3q3f000DoN7/5DndnuV6dY7pEWCtft/fXa4ccArbF7iWmAEiZeMvp6n6o65OrgnTdxC7OlKw+XupGU1uby7dilcYr+ZZLJP8VY1aisbw2K1h94Y5iM6yPsF9a9zOf1/BPIknNtpPRT/mEMJO0tlXtMrdfbvbAKKSMYZu3dhzFGXPKs2vOksIwT1/vyW+z65ZSQoGtAxJBTuqCPNsif3WuOTfD6g6ke1xdbhXpL9OOR3VgelDvuG05kpUrYwQHnXyUvQx6qtBUbJBmaxKApeY5EIkvaf7Cxf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uaAEfgxliMoESOn6Q1UOWoSSTqGvZ0bmlDoEo13/RA=;
 b=UIUVRiKemNRybYoOnZZohyXXvi1kE2Byf/+tvyn5EuiJadSZJ26DwuBZ6dnHDtu5djMb4FQ4bxLMpaglQ+sCSLaS5Mr1q5xA/dO5ZGD0IylxmEg0U/fnC9QYEhuKcpgMDWxUp4Jxq6lDCJU5licrFiwwRufEecjXPw234NvudHcq8pEFvrCEhmUM1m7RYEcMW3suSjH3RWSD1SJlTlzok/GXgR2AZsYnfbAfS7VE6XkurQP1wy65wUrMOhTipO33RI5ey8CfoeKLhQ85wOo8mGi+UddfErzlQI6ijT35ASpRHgOZapvRIM0N7VT140A4j5q0ALlvhPVFF6HbbciYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uaAEfgxliMoESOn6Q1UOWoSSTqGvZ0bmlDoEo13/RA=;
 b=DP23OB9h4U8BFjjPaeI9kMYm8fQ/8GZdrD/l62wfLZWkYbMBLwtNt6zKoZLPQBAPSfatR3OZ8kOhZd9X4jdvNg1fz5YH0fgSd3maWtKg1OSGN2VWe+D6b7se/SSD15/cRgLlYMidVzrGUZxjvEl0fdNaXd88FI07UOAtg8t3UGLX87OWyjm43QnyToIdo+X4P9khaA1GaiF6XhMfAG7huzDC0ZDQrgmfvitk/oRbHGJkMHszX1QABvbX3x2NApOCIRU3cawxnv0UXpwSd2/++1bsqoDt3ztgu2XXAM3wW0VXeJ2DaRwXnuvK/tQbZ5HU4Hh/yVpfrqE+F75px+E8Gg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4026.apcprd06.prod.outlook.com (2603:1096:4:f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 08:12:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 08:12:28 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: introduce gc_urgent_mid_remaining sysfs node
Thread-Index: AQHY4sW8mgJa5fMka0W82H1XdV2JB64W7OaAgAABnsA=
Date: Thu, 20 Oct 2022 08:12:28 +0000
Message-ID: <SEZPR06MB52693451F34B9A5CB60E2851E82A9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20221018074621.16019-1-frank.li@vivo.com>
 <3ed1c3a5-e299-4915-a339-e2b6360635e5@kernel.org>
In-Reply-To: <3ed1c3a5-e299-4915-a339-e2b6360635e5@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB4026:EE_
x-ms-office365-filtering-correlation-id: 96b5bab3-832a-4096-8884-08dab272d48f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7mO7/LUO7a2WtjiMOnGS76VH+qvxlws/RFO7Q5gi6/ZGWhz1O/u/QNn8AMaReZJpQ61whbOe74+qYuc36C9T3JKvCoPtQWOf42IWHbxhGRovncP4JQQoyXYSGuNkzRWEqg7Bfg4O+5aHsWQJh/3oBJKFP7wbZQL0xZ7+YbmYHEhEJW8U4xsq1guwa8k4XYQNKBamqa+b+k7aTsKmC4dbmSsgy236gQiUSsJTOu4i/CEO15IVuPRKWKFNj8so/JH7YTzjwv7jm4k+Q+qADHasoNNLc52/YKoEgMI6HHaak502OWzeQTeGkhwkCu8D7GiYpWChVQBXnRzjYejgnso+PeAA51pYsHjiG9omM7TqfUrbfAIRy/NP4YbNfql13Y2Nh2Y/eS46kogRSgo8crZBVTE+Du1yW+n1Ox5HbtPWohtvt1y2u7oQI4G/OTV4afE1c2Z3JXRhZ6Rf6vPHDM5j27FpG/DDIlhmeUUKSg0K4Hsok+SR4XT0JvTnX4aWAt+X2Tnl5R1uJtuYYo5siVsYyVRW/flI3ri7Sed1IBb7JZ7lyucqspvlhW7JA9w6CLWLD9r/bUmc0jCxD9FpO5aapa1S8YmZ970UWn4sHrttZGVKDBO2YTm7kn/XdZKe1KHs0eLRLFbVzoe+36DMgOEh2b3O0MuDrriyekRnblSZ/Q+r5rSTtUg3UhSGpIFneWzmGBKwQU5KVn3QcjG23ebHtdqWEtjnqsyLZsFlReP5GDynFTue3z2+zvonf9U0vt7m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(85182001)(224303003)(86362001)(33656002)(66476007)(52536014)(41300700001)(66556008)(38100700002)(66446008)(66946007)(38070700005)(83380400001)(64756008)(6506007)(7696005)(186003)(122000001)(478600001)(5660300002)(2906002)(316002)(76116006)(4326008)(8936002)(9686003)(26005)(110136005)(55016003)(71200400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTdiSlZ4ZHRYbnUyeXE2N3FCRjRHTXRzMDNPUlNjL1U5T21RWmhNWnVGOW5l?=
 =?utf-8?B?RCswYTAxTEF1SHgxbnI1N2RkUDc0UnNmVkVKTUVjZ3JFcXd2c0JBc1cyWmhM?=
 =?utf-8?B?cERwcXphNlVieHRhTWhsQmpSYWlNWEpzRk9MMlpjR0FweXd2STkySi84aUs1?=
 =?utf-8?B?YjcyRHdJMk1jN01lU2w5b2FOdlZ2MnBrWS82KzNMZ0h5K0lGaGFLa29ZYm9i?=
 =?utf-8?B?Z0tGeXZpdC8xWEZoaTl0dUhDT2VFOExVRmZhdU1oVi80V1hySEZPQTdsSG5M?=
 =?utf-8?B?WDRnZnV0RzNmVjc4SnNRczFtU0ZYOHBYb245ZlBLYnNXSUpZaEJ4RjQyN0Ix?=
 =?utf-8?B?c0hueTg1VDFHOS95dnF1R0lYUVQvYXNjdEFvaEFQYTg2a0ZOT3o3eEdnRmJz?=
 =?utf-8?B?dUg2US9YMWdzcG56eDR6ejNRVU45L2tCNnlRMzlzcDVBbmtnU3ZoenR0L2Vr?=
 =?utf-8?B?WHQvYWdPbzI0Z2dMeEV1M1RidjVUR2pTcXhjUzBNVUVxa2J5VFZ6b2JMTVY1?=
 =?utf-8?B?aGo2VWVaR1VHUlJweG1lS0xUNmxXVHRIU0dwRHZMQSsxU1UvWW1TQm40eTRn?=
 =?utf-8?B?WjlmQzhJMWZPZGtzUitlb3FKYkR2WmFvelZkUkRqd1Bma1lPcGU0aWZjTjRV?=
 =?utf-8?B?QUt5MVhVQTRaaEdicjlWNlRpTkZvUGlXT0ZNMlFuYUtCSFl4SUxqV2hRdDRI?=
 =?utf-8?B?aklBMU9UWUtYWTl5T1NpYUwvQTVtRzJUM2VtUjRMRngzaUg0WDhUZjQ2QzI0?=
 =?utf-8?B?aWZPTEoyQjMybXc5R3JIamFzcHdwaXhEemdxZTF1ZndPcEJ2a1l3cFJDVUd1?=
 =?utf-8?B?d1V4enNUSmUralYzdm1ZcUc4MEMrQlVvby9HQlQvN3dJR2hIblJhM3g1bUx6?=
 =?utf-8?B?b3phenRzbTFsTkFiMWdIcWdzTmxsNytsYUNhUDY5MGJVQTdGdzFhTjJWV283?=
 =?utf-8?B?NWVYNU1oWUZlWTc4VElMNUkrdWRDR296NHhGWFZQbk1XaTV4RXowZGkzTWxa?=
 =?utf-8?B?WXZlQlNBaUtaY09pOE9qQlExMTZZSFRrRlRUczBEODQ5Y2F6aFZCSFJnWEhM?=
 =?utf-8?B?dFlXZGplUURnRWhFZ3FRNGN2Z0p4eS91YW9mUnVpbzlTRTRvUlB0L1F5OUM1?=
 =?utf-8?B?Z3pIakNMQUZ1KzROdzg2WVJnbzNJRVgwK1dmVlM3VjJjaytQYnUxWlhld3Iv?=
 =?utf-8?B?WmM1enFYZVRHc0RNZmx2R3Yyd3pRTVhpcnp2NTRYNTdER255cHNhamt5ejl0?=
 =?utf-8?B?bFROYWtkV2VWRFBZYjUxTFdkV1YwcEdaajVJbG9OM3NYZVR4ZE5RU3JlN0Vm?=
 =?utf-8?B?RWtyTVo5ejVtRWtCTW9oKzh3aENKVzJlS09STUd4YlhaQTFCam5JY3JWMmdZ?=
 =?utf-8?B?MmlWWGFyRUlVb1FBL3VqdTd6VHVmMW0xQktrWjZqODFXUDFVN0JKbm81N1U4?=
 =?utf-8?B?ZUkrTEVjR2xhcFVibUxiaE9JNlh6Q0tEd2F5Q3JQbndLZTBKaC9vZTBjMXFZ?=
 =?utf-8?B?YUpNWW9LbEs0Z0xzT2FqbjU4Y2k2U0wzQ2t6QkRVcUowZmhPUWpHWDZnek5R?=
 =?utf-8?B?M3Z0SWhzeWRQcGZkVVUwT2lVc2hLZ3lkckk4cTRYSU14c2Q1S05vV2x3N1JE?=
 =?utf-8?B?TGY3NndtdEJOL0F2NmpCZnM4dUl2Z0diMFJrWVNOUnNMcGs4YmxVME9aV3RB?=
 =?utf-8?B?VUJuNGwrYWRMaTV4NmR6MnFZMDRyQmhIaUljdkp3Q2dnNWdQTU1IUDhRWVFV?=
 =?utf-8?B?NVRIeWVESkdtL01nRXNZNENZSjcxR1psOTZzbzh1d0pJRllsdlh4bDdITVd6?=
 =?utf-8?B?d1RFVXYrU2VBajhXbEJueWZMd0laLzlvUzhNZXhla0RlNlAzNFhmYjdHaUM4?=
 =?utf-8?B?eFNpb0MzeWNyazZ5ZDhiTmpKTmFvQTU4U2pPSmVlTDN4NUxoR0xjYVVpVXds?=
 =?utf-8?B?dURmSzg5NDIxN2dBT1Awcmx3M0pSTTlVRVNqVThhSHBmRXRqTU9zUFNreEtL?=
 =?utf-8?B?TnFGVkhmR0dLaCtNVHEyT3J3YlFEYWZiUGt0Y0hzbGR1R01UZXZwaTN5R3g1?=
 =?utf-8?B?WkN6b1hGbnBZRDZtVC9HajBIRTAzVnp2MzVjbHE4YlBvYjhiK09KWnc3NnhT?=
 =?utf-8?Q?tGxQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b5bab3-832a-4096-8884-08dab272d48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 08:12:28.8382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfaUurXdNQ7XHLaWhXKI7zscB9MXM5OGzUUCsu7nrWENOtmN1wssllIELnMaQ6SHQUUD6H403OIL9X9WXUlvFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4026
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chao, > Not sure,
 we will add gc_urgent_low_remaining later...
 > Can we share the same interface for all gc_mode? since each mode is
 exclusive.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.113 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.113 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1olQfP-00AebM-VB
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGYyZnM6IGludHJvZHVjZSBn?=
 =?utf-8?q?c=5Furgent=5Fmid=5Fremaining_sysfs_node?=
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
From: =?utf-8?B?5p2O5oms6Z+s?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chao,

> Not sure, we will add gc_urgent_low_remaining later...

> Can we share the same interface for all gc_mode? since each mode is exclusive.

> Thoughts?

Both GC urgent mid mode and GC urgent high mode run using the urgent_sleep_time interval. If the user program does not switch back to normal mode in an abnormal state, it will cause the gc to run rapidly.

Therefore, there needs to be a mechanism to ensure that the GC urgent mid mode and GC urgent high mode can be switched back to the normal mode. Since there is currently a gc_urgent_high_remaining node, I added the gc_urgent_mid_remaining node.

If gc_urgent_high_remaining can act on three modes, it is not in line with the meaning of the name. Not sure if the existing sys node can still change the name, if it can be changed, obviously using gc_urgent_remaining is a better way. Can an existing node still be renamed?

If the name cannot be changed, it is necessary to increase gc_urgent_mid_remaining. Perhaps one more gc_urgent_low_remaining could be added?




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

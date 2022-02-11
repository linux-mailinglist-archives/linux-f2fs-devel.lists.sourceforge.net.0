Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 474624B251E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 13:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIUbE-00008r-SR; Fri, 11 Feb 2022 12:00:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>) id 1nIUbC-00008k-65
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 12:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CiaFfQsOw48CZUS9v+aqmHUrZlkrbGprBvfhRiOylys=; b=KT4oMQNy5bONyblvHjMLtNF9Z2
 8q22Q1glNO9wIsi8Dl3XMdhz73cSE9LjeHgFPk1n3HVJaAFyZJ+Hy+p6ETunbMQ+0p52zYSvoMoJc
 ec9lwrxMCOJxPQMUqWMVBZY+hMl6BxTHGhx7pN8gmAsrsMcOT4g0HHYhhNbyuCvG/5js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CiaFfQsOw48CZUS9v+aqmHUrZlkrbGprBvfhRiOylys=; b=HATTCk1qgvghJTL4gxfEZRR56d
 BzG8+Kh6dTygaAkXjB1clmwyfLzwKlwcq3JYpzywsvRPDwIZsLaotMALIU5Id6H5D8bjRbPx9kRx3
 4PYO9mn11nFWk/8x6n4Ar1FIe2WkNrm8xPmqbqnhr4V5UTIwt9UY7p+Rrt2RTxWzizoQ=;
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com
 ([40.107.243.48] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIUax-00FLey-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 12:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb608LqeKvKglKw0BYE+LWkwmBkbm98SkXkYYV/u69fR+8xsTDq2YHJYn867B6UqL1vWflHLjCuHyJBCbUNUuwc5x0hUHKXrD5IuphdxLMsiu6mO6dhD2ddNCwqqXmkL7cdqWgvUH3jHUmM9EKtCM7c3fx/qnf4rzkvCJOU04EUz0JF6ZRyb04BAyzmJBDLmle69h1xiCgwdd+ialbgsfsJQNyMEM/GfD2X+J6k2QlG8OBoa0yGYWZN17OiEZEqkOtHnOI9/GdSSDKTQ2yiCf6Gg6iBnZEMUq9nquHrf6BF0jIiG/dLfQS17iOVFEu/TtGhyhtOT4oIfHtBheGRHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiaFfQsOw48CZUS9v+aqmHUrZlkrbGprBvfhRiOylys=;
 b=HEqlc3L23QCJwuDz5YtuRO09X/L9XGn/k3Vhs+36sYRDAcMPGFf1xAFEL7LfNc7rYlkgeN4mIacOqagbA3SmnChvAiRriC3PUKVBbt/butAakId077vVOn12Lw4QrDRsF1fWLshGcFHVP/GClv6BJO3baBXzd71bkf8ERygpKqRnibvp6W7ZVe2Cr9BLmUI2caxI9vdA67d0XmoJksedV8XVvcUrUaykPZkExe/9X8/XEpQJSojRNJLeaKGgXKSgqYOnJQ13khaz9pK7nJT23uem3gjlRkgVSmt2aFY9Z6O0Njt76hYdWKY1KCtvldhe+lLwHvVLThRgxxFNOO2c/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiaFfQsOw48CZUS9v+aqmHUrZlkrbGprBvfhRiOylys=;
 b=VLW54X9QKI/Kz4haMXtA4Azki7HShnyFSg64VFigbroFa7zPFhTRMAI4oFQ7rqCTfrUggAEcg72BxfSiVn2BRRcgpVmTHt0L9HkI+YRsYSkD3GHxsFkTHPOLa+YN3IcxmjuD7hDKYmnD22/2X11iFOV4V2crwJuLjOukdOUCQjCwzt0V/cIxYbqRC0euLVZJg0TU8oIXD2UcXfweNJbNOCax9QaMu9Kw5ZeJyP0yUGgpKd6/GVIEOX/osouy4uLZqqndD8asa4NkXq/12GYFQUsPD4JApUDYqMovjOa16PTPd5gN+4VGc7+SiVdY7iIPHRRGQn5GM9gulAu/XGqWwg==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM5PR12MB1883.namprd12.prod.outlook.com (2603:10b6:3:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 11 Feb
 2022 11:45:19 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 11:45:19 +0000
To: Eric Biggers <ebiggers@kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>
Thread-Topic: [RFC PATCH 1/7] statx: add I/O alignment information
Thread-Index: AQHYHw6MhkvU3aWvQUef3qvKk4R/5KyOOi4AgAABZIA=
Date: Fri, 11 Feb 2022 11:45:19 +0000
Message-ID: <b05c66c5-81fe-6398-416a-1dc9bdd3469a@nvidia.com>
References: <20220211061158.227688-1-ebiggers@kernel.org>
 <20220211061158.227688-2-ebiggers@kernel.org>
 <1762970b-94b6-1cd0-8ae2-41a5d057f72a@nvidia.com>
In-Reply-To: <1762970b-94b6-1cd0-8ae2-41a5d057f72a@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42f44365-8ff4-47bc-5acc-08d9ed53faea
x-ms-traffictypediagnostic: DM5PR12MB1883:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1883F5D77FAC84D9E52DE782A3309@DM5PR12MB1883.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bzpTvW5kj7tJgNyRc3/QymAwdoOFH0Biw9OznsLcD8iUhdvIHvNzL70kteqgpzxKEdKyeRQIBdnlMSk8ntZFQQMb3I+kxKrMp4SI28McVAYoCGf4rhJeBK1dLJeIviiV6Mm9mUmEv8/knVMQxs4F+h86shmUrvsKe1Ltx0gmy3eLU61AVNWCJmcpGxecVMycWkHaHV0dEP6XpQsQp6TBhkaFlCwTY2AX9xVR2EVV2ZOI/AwDphwm6pTdmJgQ2WRVMk78sx75tGSvfoVtq4rL3lLcL9KcyYKmQy1y+dXPGboXLTysr6hmniHHD4mKXbKJ+5NTbGL/bTny9M5sn8Y74T1m7g+5AfPAs8i9IvLeYPKJduTKX3/HviCw+F4dA5FKR80H0yI8PsP+EvsbjfWftq1oxcIfqh6YCkwv+am51uD7Ck+K4osUQ8Ll4WoQ248fiTsUaTlbvXbeHB64cOis4oc8kvmrD0rhf6XNdvbze4V6AVx2N6jZ32wukt3ax6AgbF6ko/LKOWoJv532wT+cjuXrUU3aVx1TjbydGp+JwYvWT/MQpDzVSia4lCuT+h8aagYrgIAS4anKFCipldTWoVpl1yurCMYnzd4isjUtitJLZ6QViuxm8ADLellzHgQP7vJH+c0IgJtuyAtuEkw4nYMO2SiBXFlTVrq3j1+omtdSIUT4oOAA5O/cGWGJiKQRDgbt8buCmNIACSdzWFdTy455d0oQS70nW379gEHTJA3redvBNlvWCseAykwZ3HdWZMmg+ekdj8PUCKhh4Ie+14HTcQz00wguUduwwR7PijADbG/EGgY4X0QM9fCDpTvlsE0uicuMqaOJyIcdjdpmy0+A+ZcFTh7l9RkekWkpjCIKdSt+iq6TeqF1pJ3vK1MQsSvKrjRVBIhfMVOB0MbvrVpaqT2e4/5EHuwdxOvm1T8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(966005)(2906002)(38070700005)(31696002)(186003)(53546011)(83380400001)(54906003)(71200400001)(508600001)(31686004)(316002)(45080400002)(6512007)(91956017)(64756008)(110136005)(86362001)(76116006)(66476007)(66446008)(5660300002)(66946007)(6506007)(36756003)(8936002)(38100700002)(4326008)(8676002)(2616005)(66556008)(122000001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3lkL1JVK1hJTHBQZHZJd3AwaUJqaUk5VDgwcGY4RGNxQjEwYThEa0ZWQUNr?=
 =?utf-8?B?MEk3UWJZR2RPTjJuYWloZ2FUU09ZTzIzdktXYnhsM3dsSTR5ams5VnpTV0Na?=
 =?utf-8?B?T2RDTWVDZ2kvcjRmcTBiMDgvZnpNVDNwck5MajFLWlJ3dE5PWVFxRUxVRHNi?=
 =?utf-8?B?SitnS1NESVQ2bHlJQTgvN0JVbU5iU0duOHlrQ0xERVF5dERPWjJHck1hUzhH?=
 =?utf-8?B?S0IzUURlTC9KNmxuL25Zc3JpcVNQRUZrQWg1QzlPcEJ2QWs0TkhkeWtEZVZl?=
 =?utf-8?B?eFNXaWE1eC94a1hBWklRZzFwTXpEQkQzZEpGV2cxRFo1elpPZWV1dkdrUlB4?=
 =?utf-8?B?M0hTNmpHSTdpQmF5eVkxWHRqbGVTWnMxdEc0YWtkb3ZoMHNadXhCU0tHZzJ2?=
 =?utf-8?B?NTZWYndJYks2QnppSmdndklmcC9LdXczMkZPeFgxODM0bldMK00rL3daTG1U?=
 =?utf-8?B?NjJEZGxOZnpKQTc1clU1bElPUldiMEJoWUVBbVhFZjJtRjBGbGw3MVMxREtE?=
 =?utf-8?B?UExBMFNpQm90RnU4NXVjTFpBMXlIQVMweW43YWdlaUhHOFBJV0d4TTlHeWN1?=
 =?utf-8?B?QWNFKzhXUVpLbys0TzhMNVRsQmRkVUdRTmlXdHZMc1luSDcrN2oxeldzRUt4?=
 =?utf-8?B?a3hDWXFSVnE5QmpLbU52QlJZTEwwKzlrdVR3b2V3d2VQSStRRDRjSG1lM0Nw?=
 =?utf-8?B?UlNMSno3Z0VVTUdLS1BMb01jcDh6SUdIWXFWTE5vbmg1ZFVSUHdzVElpNFlS?=
 =?utf-8?B?cGd1US8vUXFGbXkyY0tGVUFsK2U4RXQ2a1RFZ0hsdjZWYWc2NUNqbGh5VDZS?=
 =?utf-8?B?TkFoWXRHUWE1Qm12NkdqZ0V4eGtRcGsycUxsOTkyRFAwRXdHMXFDSFk1Y2Yz?=
 =?utf-8?B?eEJCZmt4dXFCUFBjVUl6ZDE2dFN0ZXNmT0ZNQkl6cEt6dGZ0RG9KejY0VDQ0?=
 =?utf-8?B?N1k0Sm5WR1dzeml4VHNRR1QxUnJRK1pKc0YycXEzM2tOTEpwVXFzRjBnRkE4?=
 =?utf-8?B?cEVwYjZ4ZTZhK0p1U2xTcnQ1aWRjV3l2R1dFR28wRjZNNjFSMGo4Z0l2U2dQ?=
 =?utf-8?B?dVBjYzlzWnlJZ3BHS0ZlYktoOUFBR1JaOXRwUW9wZ3p4Vkt4MUFSZ2t6QkRN?=
 =?utf-8?B?eDUzMGZnbVN6ZlZkRlREWS9aN01ZZDRrc1RUSHJxQ0RKaEVHVVBlTFZJOVN3?=
 =?utf-8?B?K0dkaXFIZ1pQRVc0NGcxVGxzL0xQOVhyVHg4VjB1RFdCTGc4Mk1CVFN5aEYv?=
 =?utf-8?B?ektSVkxqMzBFdEh6VUw4ZEk5b0s0RmRaK0pyUzdkRlBQYUVUdHpqOGdkbGc4?=
 =?utf-8?B?SUlPcFZhNm8zSUdURFhza0pMLzUyaUEzbTh3eFpHd0hxT3cxcUoxQ1dMbUdm?=
 =?utf-8?B?a3ZEczdDSTd3V3Q2OFBWRFRvUUdHbktOb1h4akVhUTQvTk4yQ1ZvVGh0V1l3?=
 =?utf-8?B?NWxEWURQczJpLzN3ekYyL1VrUUJqRitseEt5TElwMWE4TElIVnlVaE5JQU1a?=
 =?utf-8?B?MmNuTnlQSlhIWEhJbExITEhSQTdUdzU4cTlRck1kYk9PRDRwRE1FYWJyNktG?=
 =?utf-8?B?YzRqeWsva1QzK3ZPWWVyc2FNWndic1RvVGovRWxycCtuQVp5cVlmMXduK1hL?=
 =?utf-8?B?VzNUSDFTa2s0blNDelVUdStnRHNyN21XTi9uSnRxZHkxSGEyZFV2T1EwenBI?=
 =?utf-8?B?R2w2em5Bc29IaXZtT1lMT0VUOS80TDR3dzdmREtXNTZ2aGpJbVp5VXluQmlG?=
 =?utf-8?B?alRzc1BEcFVTL0JRK1VMeHRrSXdvZHNnTER4ZEdpUlZ5VzZ0OFJoMFU1S2g4?=
 =?utf-8?B?NjIyM2FsdlFWV0t5ZkRFdHVyRWI1WFVWdm8wWEZaQ29hWW9sUGRLN2tWZ3p3?=
 =?utf-8?B?T0lmb3dLTmtuVFRMTTh2ekt6NktBY09Zd1kvNGJ2c3NJUnd3bndOTXNqOWRU?=
 =?utf-8?B?WFdDbXNjNXp3b1NKSWVYeEppRTl6dHVBb2FPYTNFdDNWU0o0bVY3Sy9Yem5l?=
 =?utf-8?B?dzJkUG56VWc5ekRubk9aTUJFRlZ3emtQNW8xNkltd2dBTlRPdnhodDkzSzEr?=
 =?utf-8?B?bzBBbVJLV2swUWZmWCsvalphc3FuZDRhdWJWTUgrNHR4UytORnRHY2hBd1d4?=
 =?utf-8?B?ZWZCWldmUVVmVWxGajNONGlpNVlKUGtYNlpTY0s0VWxtaDVVMFhzQnRVT0FQ?=
 =?utf-8?Q?A7SnSwQWWNmcRWHvAdPHIL6DSBk48DiNySvZH0nQF1BT?=
Content-ID: <5E2A13B950A6894DB6AA4D39DCB0F5D5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f44365-8ff4-47bc-5acc-08d9ed53faea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 11:45:19.6585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1QnMqA0mtt2SfPJ3wIP8zNz4RKtHWPoA3d1YXaSyOmyn9yZfSS7Kl1/1cxvSLTrmXqum5HQ6FRULzrcMqL09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/11/22 3:40 AM, Chaitanya Kulkarni wrote: > On 2/10/22
 10:11 PM, Eric Biggers wrote: >> From: Eric Biggers <ebiggers@google.com>
 >> >> Traditionally, the conditions for when DIO (direct I/O) is su [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.243.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.243.48 listed in wl.mailspike.net]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 FORGED_SPF_HELO        No description available.
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nIUax-00FLey-Gf
Subject: Re: [f2fs-dev] [RFC PATCH 1/7] statx: add I/O alignment information
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
Cc: "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/11/22 3:40 AM, Chaitanya Kulkarni wrote:
> On 2/10/22 10:11 PM, Eric Biggers wrote:
>> From: Eric Biggers <ebiggers@google.com>
>>
>> Traditionally, the conditions for when DIO (direct I/O) is supported
>> were fairly simple: filesystems either supported DIO aligned to the
>> block device's logical block size, or didn't support DIO at all.
>>
>> However, due to filesystem features that have been added over time (e.g,
>> data journalling, inline data, encryption, verity, compression,
>> checkpoint disabling, log-structured mode), the conditions for when DIO
>> is allowed on a file have gotten increasingly complex.  Whether a
>> particular file supports DIO, and with what alignment, can depend on
>> various file attributes and filesystem mount options, as well as which
>> block device(s) the file's data is located on.
>>
>> XFS has an ioctl XFS_IOC_DIOINFO which exposes this information to
>> applications.  However, as discussed
>> (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
>> this ioctl is rarely used and not known to be used outside of
>> XFS-specific code.  It also was never intended to indicate when a file
>> doesn't support DIO at all, and it only exposes the minimum I/O
>> alignment, not the optimal I/O alignment which has been requested too.
>>
>> Therefore, let's expose this information via statx().  Add the
>> STATX_IOALIGN flag and three fields associated with it:
>>
>> * stx_mem_align_dio: the alignment (in bytes) required for user memory
>>     buffers for DIO, or 0 if DIO is not supported on the file.
>>
>> * stx_offset_align_dio: the alignment (in bytes) required for file
>>     offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>>     on the file.  This will only be nonzero if stx_mem_align_dio is
>>     nonzero, and vice versa.
>>
>> * stx_offset_align_optimal: the alignment (in bytes) suggested for file
>>     offsets and I/O segment lengths to get optimal performance.  This
>>     applies to both DIO and buffered I/O.  It differs from stx_blocksize
>>     in that stx_offset_align_optimal will contain the real optimum I/O
>>     size, which may be a large value.  In contrast, for compatibility
>>     reasons stx_blocksize is the minimum size needed to avoid page cache
>>     read/write/modify cycles, which may be much smaller than the optimum
>>     I/O size.  For more details about the motivation for this field, see
>>     https://lore.kernel.org/r/20220210040304.GM59729@dread.disaster.area
>>
>> Note that as with other statx() extensions, if STATX_IOALIGN isn't set
>> in the returned statx struct, then these new fields won't be filled in.
>> This will happen if the filesystem doesn't support STATX_IOALIGN, or if
>> the file isn't a regular file.  (It might be supported on block device
>> files in the future.)  It might also happen if the caller didn't include
>> STATX_IOALIGN in the request mask, since statx() isn't required to
>> return information that wasn't requested.
>>
>> This commit adds the VFS-level plumbing for STATX_IOALIGN.  Individual
>> filesystems will still need to add code to support it.
>>
>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>> ---
> 
> 
> I've actually worked on similar series to export alignment and
> granularity for non-trivial operations, this implementation
> only exporting I/O alignments (mostly REQ_OP_WRITE/REQ_OP_READ) via
> stax.
> 
> Since it is coming from :-
> bdev_logical_block_size()->q->limits.logical_block_size that is set when
> low level driver like nvme calls blk_queue_logical_block_size().
> 
>   From my experience especially with SSDs, applications want to
> know similar information about different non-trivial requests such as
> REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES/REQ_OP_VERIFY (work in progress see
> [1]) etc.
> 
> It will be great to make this generic userspace interface where user can
> ask for specific REQ_OP_XXX such as generic I/O REQ_OP_READ/REQ_OP_WRITE
> and non generic REQ_OP_XX such as REQ_OP_DISCARD/REQ_OP_VERIFY etc ....
> 
> Since I've worked on implementing REQ_OP_VERIFY support I don't want to
> implement separate interface for querying the REQ_OP_VERIFY or any other
> non-trivial REQ_OP_XXX granularity or alignment.
> 
> -ck
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-xfs%2Fmsg56826.html&amp;data=04%7C01%7Cchaitanyak%40nvidia.com%7C252d78e009ad49bd522208d9ed534dcf%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637801764313014840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=1owqIDlcst4h%2FGr9Azteaiy22vfHFZojRipKmk6A%2FCg%3D&amp;reserved=0
> 

Adding right link for REQ_OP_VERIFY ...

[1] https://www.spinics.net/lists/linux-xfs/msg56826.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

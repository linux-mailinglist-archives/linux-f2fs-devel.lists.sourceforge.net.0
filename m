Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B774B255F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 13:13:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIUnm-0000Tv-Su; Fri, 11 Feb 2022 12:13:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>) id 1nIUnl-0000To-Dw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 12:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KhT5YiWLnew0VrPJOfN6l+a/a/WSpiyjWcAkGC3UDEs=; b=a2T/4WDP7kPRlg1UFF+aYUnrKB
 I1dhmZu3u94QI4+NcZdxCBtREG0Xywvxv/W3zljbh4egpUBI7n+FtdHxxuuaJPAffhubqwFIC34RH
 47U9fvlAdrMoaqfkIFIoZ+Go3JKVO20hi7RXwbRVUHoYcNUw3wG1xZbZoKGJFfzegLHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KhT5YiWLnew0VrPJOfN6l+a/a/WSpiyjWcAkGC3UDEs=; b=U/jOl/Xrq6xmYcVsg69wDT9Xfh
 JBmuG4qlSs19Y2X8QjoLrKPuMFGlkqhe85QHAXCAEF2oqqXUW6ywuTzfE48s//AMaQFSk6f1K8VnU
 vmTEJ7d8/h9mLPXIKyIExdNpA3kiX3slFROnYm2m6YB775OjKsyQTP/s6fBYYSy8lc24=;
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com
 ([40.107.92.65] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIUnf-00FMwW-PN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 12:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUyyDM5z4h7VhXswr4btj6PhG+P5q5Klk973mzRU02h/4Qwbu0zZ5K+Dgz0S/2ZJTxBI+H8n3rzkNpQSAlC/LLTdyMFNny28sTnxdAGDtzLCyGUALCVcYAgeVAIKVrzMjfuooOSpDYtmFf1HX8reRxezwFN2oPYck0iUmU4rFjtndF1q85N4HFqgjX3T+9atz4vZ4vou5hTShrsAUhbqvNkJ3Igz1Rr0kykFexG5FLj4MmhYEt8+D4yIOKoCzkAUdoM9YjAi0XFSMAWcCN+IOadoCXppk7yZ33McWqiTBn+dQ1rrm7HXdslJrX6n1ZwtzlVYtaAZ6hZYfU/iPACwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhT5YiWLnew0VrPJOfN6l+a/a/WSpiyjWcAkGC3UDEs=;
 b=TJ8yIvJBhuiIFZyeuIQsOB/VTyqraLy2frS8nEkDqdfwGAawqvXGSzTuuRmTAJ3xEHveiL5A6XWc9Ib4AiR9b1a0MKbMLhDVcpiCcj/AJDDodOj0SZMNMG/QhO/PFoExxGlwU968l8z/cwqhMy3Fu42ThBDrUq0eANFK0wNBHVxD61hR1rudK0+lJwo/ncRUHtCqKvrgZwyu1tLTYKLIDjeQpFrK/PWBFkLVO0V67J77No8FyUj86St7o3+HeeIZMBrgLs/RXIEDYMJ6dvYrUCIhZ84FRgU51re9eBm4rlhjw6PumnM2xNa6PXtptrjzAighb7Z+eyvJPXL6TINMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhT5YiWLnew0VrPJOfN6l+a/a/WSpiyjWcAkGC3UDEs=;
 b=DNriNoyX58xMGp/o7whwoSj7X3mha7MzgOdkwQ1Z74XYuIQJi4gEiuiRn5z+BNYX8iIqdHoSKXugIeS0SPKDnJuETOFLNlqaoNFLnJE+/aZqWkt0eVNQxM3AMmsyqGVkex6ZBsoJ5wA3wbiCiK1gArfKC8oRNyRf7Q2GZrPyjO0Mg7np/sYJA+XPZU47hwTOmCZ93D1dkHnZl0CMQ3AOhteOssfyoNKIWS7bA+XoM++Cv/Q6KWvmb9+SEWyg3XAHP1afhC9vLGgl7w3Raj0DZuEqq1XUeAdYrX4or0yazTBZx9gCbqp8dfYhNXaNL05LtiIeqeJ5+agV5cTcvcxxnw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MN2PR12MB3199.namprd12.prod.outlook.com (2603:10b6:208:ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 11:40:21 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 11:40:21 +0000
To: Eric Biggers <ebiggers@kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>
Thread-Topic: [RFC PATCH 1/7] statx: add I/O alignment information
Thread-Index: AQHYHw6MhkvU3aWvQUef3qvKk4R/5KyOOi4A
Date: Fri, 11 Feb 2022 11:40:21 +0000
Message-ID: <1762970b-94b6-1cd0-8ae2-41a5d057f72a@nvidia.com>
References: <20220211061158.227688-1-ebiggers@kernel.org>
 <20220211061158.227688-2-ebiggers@kernel.org>
In-Reply-To: <20220211061158.227688-2-ebiggers@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a67e323c-eb06-4344-dc1e-08d9ed5348e9
x-ms-traffictypediagnostic: MN2PR12MB3199:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3199759C4DC6E8EB9CF7A168A3309@MN2PR12MB3199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vXdHmGwpFnh7FvGwXqqZgLEl/oP7wzqIxVS3Rc29Kvj3Q8iqqbV7dKWC0TuvI+V1yMxJd8q9AdSPQVboG2EoCOfwCU0iqycUAISKnaaOJvS5NylCg4TMNM9Dxg8tXxYvWbsIdHprwPVW7k6X3EmwE3QzGob+dOBuOmU02zEP4rUjgcgxIBEY7OhwdAHiZO26zEub+5ld3IZNLneNeJbZsjH3AxBT5MFdLY4ozTlYjFPDXtdOPYXPySnNeynjlRpoZTZzjVXmHvbF+WbqtlhKX250059/yNxm6LdIjtR09R8CxriZywIZx6tp0KR7Ql2GviuRXjAxOjg8kxtgBB/h0Qqt/QZy0Md0/2paM9KfKMEo8p6kKqbQEmSj053whmOsQQqk53zawWUJ1gx0WZYitY5i7ErKFLy11I8iQZ95lfwCkhwojXMtv6W/uWYEhXLHNfn8AoZgvmiQfSoLsU8uadGn5Rc0tKiDqSvL0CSLOIWwBbtG//yu5uWPk1TtroaGfas4NBXnHpdEXTDNLAxasQqEvtCBxVctcPfCQhCKDq5onn5kbEeo6uIhOyud0XR640P28mt8aaTaLFFIUenDxxnLAu4PQV0mjDzqOIw3MdhXsJ7trU/6f2axwXN0L5ByZrzbkwf5hAONMnN5mu/pEo8uWe4qPs1trO/Vvcc4qoNjNJLXYdGMhT1gWEwYIJ1ve2ch784eXUlzFc1I8zKuPa3lDaitkkmYLBGSqMG0SGq78FxHlXblmjjt+xQ2ci1GoLgxXTUUZqjaobDgxmacrYpY0JPKlkoplFhX2jBC1kX0Xx03/iykCKvqdHvi5HSDbJ0o1nzVSHZgGwjRiw4zGMFJWuKKqd2eUJ4KMtYlAtZ8QqnlC1CQBzYEL9t7IQaANjdfHwT8K2q9gj7euCzISOUb2+EqKNR20FP8BfrfPd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(966005)(508600001)(71200400001)(6486002)(36756003)(5660300002)(31686004)(2906002)(64756008)(186003)(66476007)(8676002)(66556008)(4326008)(66946007)(91956017)(110136005)(54906003)(8936002)(316002)(6512007)(122000001)(2616005)(66446008)(38070700005)(76116006)(38100700002)(86362001)(31696002)(6506007)(53546011)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkVKUUY0RkZNTTBSa2tHZnJiUnNoczdXTFNGWDJPTUJzbUxEbCtia2NzL2xW?=
 =?utf-8?B?dzMra1JmbFM4Y1JIWnRoRXRsMEFqY09Rc3JNQ0RqSmczWTNxRTlNblZsQTN0?=
 =?utf-8?B?WjdzNHVMSVQyVHB1MkFPUUZYL0lwZVRDVVA4NW8yZk1zVzZsNGVvY1Jac0F1?=
 =?utf-8?B?LzhIZDJwZXRyYzlpa2owVTk4VGl4THArTTNicGVxTWxXVlFISmh3WEFWYjJQ?=
 =?utf-8?B?MXQ2M3JyTTRGVkFJWlk1REdDUHB1U1BsSW9DdUhwT3g3cUJWbUpRb2ZxN3px?=
 =?utf-8?B?SlcwL09OZS9ERjZRa0hjS043N3Y2a3MxelpYWHQ0ejhibzlnbDY5dUxDN1Bs?=
 =?utf-8?B?U1g2ckUxS3VXS1NuVm1EVDBlWGVqWGN5Y002ejhGVzdwS2V0ZU5QN2gvYkNl?=
 =?utf-8?B?eThGQXA1RUh0cWxaRG9mZnlVaXJDbjBZR0VHblhleTI5blFGWWYwTTVCWDJI?=
 =?utf-8?B?QTVNU2tKZEpuWmxFZmYwcndyR011d09pc1BBeTZhWnVJQkJJSkFDOGtJUGxn?=
 =?utf-8?B?dGpNblgvZG13WXRCRzJmNmlEUFBUSWpDaGdHNGFvQys3djJWVnRpQVg5OEFX?=
 =?utf-8?B?ZWJEZFBQNVlvMnVQSy8zZ2M5UFZaWk0zaDFBWDNRMENoRU5oUHY1c2d4dkVB?=
 =?utf-8?B?K1VlcjV2QjlWWmVrSWtReWVaYW92b3dIVXY2Rnd6Z3Z4TGxtaTU3NEVUeHN3?=
 =?utf-8?B?d2p3NWdONisxN1hMUHJ3S1VmODJodTVqWk9zMzRaNGZERlJnRk8vclNEbnpy?=
 =?utf-8?B?Z1pSbGp5KzJPNWd3ZmRZeVdpNmpsSzdXYlFVNzVLSWdSM2hMYXB4Q2twYUM2?=
 =?utf-8?B?dzljeUtndFFMVTZCdGp1UU9FYXdpR2o5YWwxekkyT3VsUkkvZW5yanhjS2xw?=
 =?utf-8?B?b0I5WEs5cmoyd25LdzlPUkZOejhmdHQ1QW8rbkR4a1VOS3dtV2w1T3FUZG94?=
 =?utf-8?B?V1dPdGVuQnB1aFN4MjF3RHlveTBxQlRmOGpVRkhQRFZUcEV0Y0w4cVBpNElN?=
 =?utf-8?B?MHg3YnQ3UHAySG1tU0tNdzJUZnlnYUlvVGhwQkEvS1hxckxPb2RnV1pSK3Fl?=
 =?utf-8?B?alpyZzBvb05CRnllSTJVdzU5T3hQTnNoa01taGVTek9PQkswbERheFZ2dzJm?=
 =?utf-8?B?dEdPNU83elpObHJWNzM4dTlvcWJCWkNRNVhaRkpPMW8vYk0ycXMxVTlkcDRC?=
 =?utf-8?B?UUQrRDZ3R3F4R2dFVWRCWnMyU3BYM3F5NkNnc2dCNytZcjU1bUpCOWZ0d2lR?=
 =?utf-8?B?N2RrT1ppd3loa2w2SnFwZFQ1TlVvZFRwdVFZRU5wR2lwUFllQmFQS0ZUQzNo?=
 =?utf-8?B?NVdwVkhMZlBpNStzT1U2OUFNK2oxMzhFNDIrRWhwYkQvNzJGQTk1TzRtdklD?=
 =?utf-8?B?dE9PbE92YXI5N1lyMmZCWVdyTy9HSEQrM3lhbHhNOUpncXErRTVEM090aDJy?=
 =?utf-8?B?VWJhMU4vc3N2TTcyT1M4c2MxekltUmJnbXpSM1pNWWJKZTNBZUVsVzN5VWd0?=
 =?utf-8?B?VXBtOUUxSVNEc21yNEh2eUlKYWh5SnllVGdoekJDNVFNdmtsNWJUcHBscm5q?=
 =?utf-8?B?TkxaOFBpSE1vdjRrL1RyaVJTWTNQeEZFNEpDNVZleUtRc0xvK2wxS09BOTJ3?=
 =?utf-8?B?L1pCZHZMdkdiR2ZnK1p0dEZhcGRZczdJczB1eDdna3M2d2VFSVlWdERZdnE2?=
 =?utf-8?B?S0ZHeEs4eVdoTWNSUWVUUFA4YnBsRzN6RmtBWi9QMjVzamJQaUhMWVltY3ZB?=
 =?utf-8?B?VWdGTXk1UlJQWXpwNnNXdEg1ZFhXTVgrYWphVU43VUFIS1FkTVRYWEtGdjR4?=
 =?utf-8?B?dXcyTGNoYUZYVFlTS2hHNFJFTlhlclB6TUR1dGM2Y2dsT3dFdDIzY0loNVk5?=
 =?utf-8?B?Njk2cHhlSzNzRDk1VWwvMDUwN3NrUmQvQ3JjeGNjRjN4amt5RnNhZVJwWEwy?=
 =?utf-8?B?TVYzTkY1QTdnNEdOYUNmRm1DZ1N5SzBFaTZkTjlZRW96N3dEemc5RzkrMVZS?=
 =?utf-8?B?bzgvZ0haMGxMc0ttUHp6cVJMUGlFRXB2SjE4R2MwUkkvU2tkTHdqbnRpYlNG?=
 =?utf-8?B?VFp2WFR5N1N3dTBSaEpyTS80U0F1OFFoNlBaSlhBb0cvVzZzK2hvWnZFbWEz?=
 =?utf-8?B?eUN4Q25WVFQydXVVSzlmZ3NuL2J4OFp0T25xMVhrQzhrNkJYcmhWbVJqQTFX?=
 =?utf-8?Q?s/Ydwois7cqDk2qO8H/cR+/H5OLbmn4KAta49am2T2tf?=
Content-ID: <5881397ACD1A9442B7B45570DFB29AB6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67e323c-eb06-4344-dc1e-08d9ed5348e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 11:40:21.0208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6YMl99caM+32qkVjLy6gIYGRbnP625QIlDREwGHM2c0CALVeu00Xi+4C0fys25km/a/fJcsWqpvqF5Z8iokbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3199
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/10/22 10:11 PM, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Traditionally, the conditions for when DIO (direct
 I/O) is supported > were fairly simple: filesystems either su [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.92.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.92.65 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nIUnf-00FMwW-PN
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

On 2/10/22 10:11 PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Traditionally, the conditions for when DIO (direct I/O) is supported
> were fairly simple: filesystems either supported DIO aligned to the
> block device's logical block size, or didn't support DIO at all.
> 
> However, due to filesystem features that have been added over time (e.g,
> data journalling, inline data, encryption, verity, compression,
> checkpoint disabling, log-structured mode), the conditions for when DIO
> is allowed on a file have gotten increasingly complex.  Whether a
> particular file supports DIO, and with what alignment, can depend on
> various file attributes and filesystem mount options, as well as which
> block device(s) the file's data is located on.
> 
> XFS has an ioctl XFS_IOC_DIOINFO which exposes this information to
> applications.  However, as discussed
> (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
> this ioctl is rarely used and not known to be used outside of
> XFS-specific code.  It also was never intended to indicate when a file
> doesn't support DIO at all, and it only exposes the minimum I/O
> alignment, not the optimal I/O alignment which has been requested too.
> 
> Therefore, let's expose this information via statx().  Add the
> STATX_IOALIGN flag and three fields associated with it:
> 
> * stx_mem_align_dio: the alignment (in bytes) required for user memory
>    buffers for DIO, or 0 if DIO is not supported on the file.
> 
> * stx_offset_align_dio: the alignment (in bytes) required for file
>    offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>    on the file.  This will only be nonzero if stx_mem_align_dio is
>    nonzero, and vice versa.
> 
> * stx_offset_align_optimal: the alignment (in bytes) suggested for file
>    offsets and I/O segment lengths to get optimal performance.  This
>    applies to both DIO and buffered I/O.  It differs from stx_blocksize
>    in that stx_offset_align_optimal will contain the real optimum I/O
>    size, which may be a large value.  In contrast, for compatibility
>    reasons stx_blocksize is the minimum size needed to avoid page cache
>    read/write/modify cycles, which may be much smaller than the optimum
>    I/O size.  For more details about the motivation for this field, see
>    https://lore.kernel.org/r/20220210040304.GM59729@dread.disaster.area
> 
> Note that as with other statx() extensions, if STATX_IOALIGN isn't set
> in the returned statx struct, then these new fields won't be filled in.
> This will happen if the filesystem doesn't support STATX_IOALIGN, or if
> the file isn't a regular file.  (It might be supported on block device
> files in the future.)  It might also happen if the caller didn't include
> STATX_IOALIGN in the request mask, since statx() isn't required to
> return information that wasn't requested.
> 
> This commit adds the VFS-level plumbing for STATX_IOALIGN.  Individual
> filesystems will still need to add code to support it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---


I've actually worked on similar series to export alignment and 
granularity for non-trivial operations, this implementation
only exporting I/O alignments (mostly REQ_OP_WRITE/REQ_OP_READ) via
stax.

Since it is coming from :-
bdev_logical_block_size()->q->limits.logical_block_size that is set when
low level driver like nvme calls blk_queue_logical_block_size().

 From my experience especially with SSDs, applications want to
know similar information about different non-trivial requests such as
REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES/REQ_OP_VERIFY (work in progress see
[1]) etc.

It will be great to make this generic userspace interface where user can
ask for specific REQ_OP_XXX such as generic I/O REQ_OP_READ/REQ_OP_WRITE
and non generic REQ_OP_XX such as REQ_OP_DISCARD/REQ_OP_VERIFY etc ....

Since I've worked on implementing REQ_OP_VERIFY support I don't want to
implement separate interface for querying the REQ_OP_VERIFY or any other
non-trivial REQ_OP_XXX granularity or alignment.

-ck

[1] https://www.spinics.net/lists/linux-xfs/msg56826.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

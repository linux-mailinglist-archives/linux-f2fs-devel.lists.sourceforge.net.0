Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE6ADBE42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 02:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VHzUIYoPUDmkxinfPVfollO3qO/ReAfGyjO45MThvg=; b=ZfZZ9mL7g9tIXtOc7QZYNpY7BO
	FtK2yXi/4XlQNnNnc8KEnARgWUwDrtDbVB726TDqKJLKYK4mZo0P1cxX9INbQTwlLdu1nM14rKA1b
	D/gtb35+/e87ZzUNS4HSrmH97iQVhQmxpc59y7IRjhE8vj6S6PdMw6XPtnimH05qk0zA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRKOz-000476-Az;
	Tue, 17 Jun 2025 00:42:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Slava.Dubeyko@ibm.com>) id 1uRKOx-00046m-L8;
 Tue, 17 Jun 2025 00:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:
 Sender:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ehfBeMGlLVdajdgi7FaAvbnd2MoSbY04G9HjPScQNw=; b=IMMwKV6zaude7v2IBjXX3Hl/+E
 wnO1lBJkFMaq/lp5Rz3brxy00mA6th4G51IrBXs0qTYuye0uyJsUyCOH8SvlXpnmlWTCqPZxMHWgg
 9AErHRvlpJ8svdQ8SKbvr4/nTM3uVI203yrh2ukNNKLCKYgdEsgA0l4Gf93PjJd01wlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ehfBeMGlLVdajdgi7FaAvbnd2MoSbY04G9HjPScQNw=; b=PgN3oywPHdfZZrWmz2tXKKEMTc
 OYc2G9uFErOQLuQltI/QfqpNKSURHU1mDa/K3VSE3mLuz4WdVZQTl8scJ1pxMdlVnvTXWClorAWXf
 MHgQ+1vAfg2Bh8YCpICh9uK5i243+gwXVL5d7aGNfizcuSr/YmwVa3lBlYtYuKBgN84c=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRKOw-0004Dk-I3; Tue, 17 Jun 2025 00:42:11 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGkTwO032543;
 Mon, 16 Jun 2025 23:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pp1; bh=1ehfBeMGlLVdajdgi7FaAvbnd2MoSbY04G9HjPScQNw=; b=Ahc5gu2x
 OcmLA1MoGDvEtUjNvD/zKTD6y1NrD7YLqkpBWQCV5JlD6PXqkHmfAuM9E45CPgkS
 NvkufXBzanpDQgCYXPR5fyxCC6zfYUJ+7CpFJj7xwXhwkY1NpWunjdQ97Dl3tvc7
 w4xmzorTDsAcFskSU41ud3ofzmHTBx1Nk7yuhSstxblq/J+m4OAiBwWHmQvGSgSu
 22wzo413+Lez2v4P6Zb4A7cylMkaoLnvjy4O0DvzqzGpwAa74RzjcvCELxRbOMVU
 rMcZBlgUYWJL8ypntTm7hmzRsbshA9QLW718A9/o7XQrcllV1iwPbh3MoggoUdZN
 mHnEbxsEDH4pKg==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790ktcxmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 23:24:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55GNOZbI002374;
 Mon, 16 Jun 2025 23:24:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790ktcxmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 23:24:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PW6rHPijhiWt2lKsHVAonrIuYA0/xuV1MoH/X8ydY5ACCTKAiD1a5KbK+865WaeLSUWeCl+13KPQfs78lWC9xRCFC6CkJF8DjZeZDKTCqGcQP2MLXl8F0o2ctsE+zbqic0UhzT/+jcztnYnLLq9oVuC6hVikZ2fyUk8btl1/0TeE69KC+13gDbBUpmnEScxh+Ow0xI4diTxQ2Wh3W6L4cF7yqUjc1F8KYDbFhmiFYnARnfh97KQxR8wUQM3I9o/jqUkuvhvIuCJUNw7MYnRLJLzL4CDkdB28sgocI6Y6yTuLVlab2bDPwRvtbZbgTmV0G1w8qyQKSmvlTKiVnrV44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ehfBeMGlLVdajdgi7FaAvbnd2MoSbY04G9HjPScQNw=;
 b=RZ+JA5TUw0vHtUuvUyeq0OZHSSYrhjHjUrfpr+/KmZ32VWq43ZobMoPayZcMu7YImqC82WZgmA7L1M15fSSK2i8I1+lO+DNCUcanp+A0+IHB5fbQvJUzdZcA2cQD1Bo8rkJlOd0TH8TUEvLlwZlY4metLG1OVPL8r2FVJYqvJ4Buj58cEmxzfRu7Go+zWByZUr+6LUy8Pp4cymukuw53faz6jx7zBIR6tW7mZtFFtdf/+7S27+AKnSSvoNdCd6Rsts+v/ZeC4pPqTLOX20tylnEp3UFZtvFRL+rAQhUq3a/qEEMEoPUY3e0n+ebCbJ4lalNxugNuunaUilWBmGhRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SA1PR15MB5819.namprd15.prod.outlook.com (2603:10b6:806:338::8)
 by SJ2PR15MB6467.namprd15.prod.outlook.com (2603:10b6:a03:577::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 23:24:32 +0000
Received: from SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::6fd6:67be:7178:d89b]) by SA1PR15MB5819.namprd15.prod.outlook.com
 ([fe80::6fd6:67be:7178:d89b%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 23:24:32 +0000
To: "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Thread-Topic: [EXTERNAL] [PATCH 10/10] fs: replace mmap hook with
 .mmap_prepare for simple mappings
Thread-Index: AQHb3vZx8Uzd4BPYl06lrWB3xbhAlLQGbbKA
Date: Mon, 16 Jun 2025 23:24:31 +0000
Message-ID: <30a9d9f8870478d50310f52fb14c8ea91dc1a692.camel@ibm.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5819:EE_|SJ2PR15MB6467:EE_
x-ms-office365-filtering-correlation-id: 2752ec89-5b88-42f6-dbc5-08ddad2cf2dc
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dFNPK0hiMmdvRW91d2NmN0JTQlh6TVYzdXFpTExzSnVicWRpTHJuWndobm11?=
 =?utf-8?B?TWU1Y1pJeDFaQkYrSjZKNGgzTG8xQm0zeWJjamQ0L0JmMm1MQmJWZCtzV0lT?=
 =?utf-8?B?NnpzQmtuZkE3Uy8vOHVqbXhPUHFvblo5amFCZnZBRzdVakJtNHNtM3pZMW1C?=
 =?utf-8?B?UkkyM1VhY0xDK3BXbkkyU1pGdlgwSGRyRjdNSUZxT0tvVU9SaW1GLzhhYitS?=
 =?utf-8?B?eEdtSGxtN1JUc2plM0pvWkhWTytBbTVnRlN5OFpzL0twYmxGTkZtb3dKSHdP?=
 =?utf-8?B?Y3dObWloWXpkOG1UcTMzYTdva05vOHRYZGhmNVJPMzFDUndHN3VHVG9MalpZ?=
 =?utf-8?B?UEpnT0duekl3UzVzNG0razBPeG1NbFcxbitKQ3ppYjB6TVlFTVB0d3ZoVzBI?=
 =?utf-8?B?RFFUdHh5aWN2YWZKV0k3eldxbUpTampIWTdXRXVUTjBFM2JqQzRjYlY2d0Jm?=
 =?utf-8?B?QVVsMXc0ZVZrUDFwQVdKSnhaZ1BUSE80dElLd3FwOWEvbzNDbUYwRFV2eWYw?=
 =?utf-8?B?SG4wNDM4VTlvWHdZYUc3eE01Ty91cUg4TjFRYXRiL0RNOGs3Zm0vTnJOUVlO?=
 =?utf-8?B?VmlTalg0V2pmeUdJOUVjdE5oc2hWWDl4VUd3WW9CM1BDNWlxbkFLQzM2cEls?=
 =?utf-8?B?MXRXYUNObWg2YkNyeS9zSGxhTE9TMkpZdTJ3MlRmZDFPLzFHWVFmeVRvTGRi?=
 =?utf-8?B?ekJncWxzOU9LT1A0dFpEMWo0QzhORVUxampTdTF5RVhZWk42LzRCU1NnQjcy?=
 =?utf-8?B?bCt1NEpKb0NuTS9QODRURWk4eUYyczBMRkxlbEdscTZsWm5pT2NPSUNzaks5?=
 =?utf-8?B?NW5vZkM5KzVvZmNLVGpMNGRQckpTTVZVTWVCa2R0c0wva1A1a3k5b2UvQ3d5?=
 =?utf-8?B?eWpwWURjQ1FIb0Z2M0E3czZrcHpjcTV2cjhQeXh0eXhBd2h4WlFxdDJOMVo5?=
 =?utf-8?B?UUQ4OUEvUXM3Y0tGR3VlczNNYTQrN2lXd3RZVmhXNWpLSHpNeTZrbDZESzRN?=
 =?utf-8?B?ZnQxcU9ROGU3VWxQYUQ1SzROQnJkNjFJLytpYWZ6MGF4eG9US3FRMDBibzcw?=
 =?utf-8?B?ektvNHcyaWRuLytOQjh0U2drMkVHdU9IVm13ZHkzSENpbFBnU0JvVkVpUm9K?=
 =?utf-8?B?MXRJOVl5eU52N3VZSlZpZVNZTlFuYWJxVGxZWlRkMUlkajJPb1pYUUg4K2N6?=
 =?utf-8?B?V2xicy9YWGk5bGN0VE51L2t1S2pZVkxhZVl5eVF3OURicHBPSVRMV3ArWU82?=
 =?utf-8?B?N3VndWVpd2x5eHV1bmVZYlM5cEUrTGZDNXVQRlVhRHgwK1NGMmkrYVpkd1NG?=
 =?utf-8?B?Ukw3ckRnRXREQ0JkZVVSdTliaEFHQjV5VmFPZ1YwOVVLNkc4enVxU1hTc3JL?=
 =?utf-8?B?TWNxUlMzQTIzN2NHN2c0NWlwTjRwam1JRUpjcGg2WG9QWnZMTWJ6TEJ3LzRs?=
 =?utf-8?B?RmhTdEdtamhYcytmd0RUdHVCbElxcmp1ZDZsd3ZqdjJZa2JZbGdsODJNTitl?=
 =?utf-8?B?NTVDN045aDZOSjVrRlJyNHB5RTVrMzEyTDM5TTNEQXBiVkhibEY4OU5veVRG?=
 =?utf-8?B?UUhuK0Rab2hnNVF5L0lGaE5NQXAyUk1xOFZGT2M5ZG9SYlBBZWFqa0JCQzZG?=
 =?utf-8?B?Z3pHakZBRzBFOE5IS2wvLzZoSWZZYWZHZFN6ZjRTcjBrdzY0QzhFN3ZvcGtC?=
 =?utf-8?B?cmNuWkFFOTdvRzlMRk0zaW80Qi9GMW9OeVBQUVdwWlRGYU5vZndqNVlUd2dj?=
 =?utf-8?B?U0pVaTV3M0N2alljTGV0N2wyZzI2L0h1SE5RNzVaZkNIMFhKT3dzb01aOGZh?=
 =?utf-8?B?b0dzK0xON20zVEk0NVlSNUR3ZG9nMEVrVWhzZlpqYWIrM2t1aXA0T05ydUZj?=
 =?utf-8?B?YXgyMGMwc0ZobnBOOUNSWUlWaXNubWFSWG5IQ083WFA2SEora3Q5TjVoNGRh?=
 =?utf-8?B?OG8zVFJpbHBiRUh5OUdxMlAzZjdCQml2dmZ4SFBQb1h6Nm9RclBOOGRBMEI1?=
 =?utf-8?B?OTBtTW1HRm1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5819.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDJJVDBrN1JabmJRWTY0cDZ2QzF1QmRTQm5mVmhxRGxLZG1kZktPUlNqUFlx?=
 =?utf-8?B?VVZWa2J6aXlqMUh5dDBhTU1wNUsxL2Zrckk4bzNzMFpTUnUybEZyaVUvclBI?=
 =?utf-8?B?ekhJdkRyUTIxRUFuRGRuRTcvTFlEK0JmMlE3cU1kTUZoRkxvYU9lZkRqNSs1?=
 =?utf-8?B?NTd4T2FieEUydGNkTE4xSmZnSTFZSzUyaWFrTVB4Q1lJVDBDWWdtU1Q1b1Fa?=
 =?utf-8?B?VWpRUnA4KzhIaEdOME1QeDJvMzV2dDd4aGlNU25XMmQwYXViN2VadVhTQ3U1?=
 =?utf-8?B?MUpZVnlVeXdPbEs4cUlsdUhZbitiUEtRSjhHQUZvL2ZvQUdRWnNKR2ZFUjJz?=
 =?utf-8?B?SzZQNjlLdmlpR1d0UVgza0hIZjNuRHE0YjgvU2xNTEJjTW91Tlg4clpMZm1t?=
 =?utf-8?B?T0VXaEIxTHhHeXcxYWlYbk9ZRDBmTmZZdW53UXRmWnJnYncra3J0RGNURFdR?=
 =?utf-8?B?RC9VaGRHZzM4emlkQ0dzVlB3WFJSL1pCVUhBN1d0ZEhtNnltZmR3QTUxbCt2?=
 =?utf-8?B?MGxBUUJKKzdvNHdBNG9WRGhxRHR0T2cyaEN6anExKytONXB0emcyNjNHSzhW?=
 =?utf-8?B?M3BFWTFyQTUwUktUVEJzYy9TQnJ5czlkK21oZTNLTmVERHRGNnBKUmh1VFEw?=
 =?utf-8?B?UVNHUTZORm1tQWNjV3lSRks5V2I0bEVRTGN6dlg0cDYyNEswL2tPZUp2eFRj?=
 =?utf-8?B?VWwwWThLYklHbEIxUmN2eXRMYSt5K0ZuZW1UMjR3aDh2Uzk0VUxQL2E3VFdE?=
 =?utf-8?B?TE0yTWVHZmZBakdjQ1E2bnkrZGl0YWlIRlY0N1h2MGIzbStQR09PYmR0V2dL?=
 =?utf-8?B?MUFMWU90ODkwd0JaNTJFL1ZBckZvK0RsMDRydktqZkpUSjEvQnB2V05IMjdX?=
 =?utf-8?B?NWN6UlU1WHkrRjVheXN6eGRYM2tQOU5wZkF2Q3Q3bjVIUUFMajNCbWpob2w3?=
 =?utf-8?B?SFBPQ0NYVGdLSFY2WHVFR0lNS0VnTzNDeEhENmZJY3Fqamppb2xXbFVQRGJj?=
 =?utf-8?B?NjRjbU5YVkszK2FYT2V3aGJzSWdEQ05LOFNnTndwUTFnQURJZmNJdXNHSGdk?=
 =?utf-8?B?SE9zaThXam13STBBQ1ByaUhYTTRBaElaL01ZU3dmdlg0Y21ZZUdrMkRpNUcr?=
 =?utf-8?B?Qm1XWk81VFc4ZGhrellyYVFKSTNucGptWDdJUDF1amE3K3ZWTHdLTWhsVUVC?=
 =?utf-8?B?NWRFY29jVGd3eXUvQlh6MnZWODBuQ1VYS002aW1sQi8rRFdUS2xMS1lSSmJt?=
 =?utf-8?B?SHJkcHZzUjRNMFE5Uml3UWRFTmI5UWE3YlE5aHVCdkFLbWRXeGFFWmJPcEJv?=
 =?utf-8?B?cnpuUFYxaHo1TWwvUmhBTThjQTVGaXF0cllGOThBWGRudGQ2MEgxNk1ZUURv?=
 =?utf-8?B?UHZSdnIxR2g3YUVPZTVIc0pxMG9aSU0rNmJQNGJCTkJPZUExU2xqbndaY3d6?=
 =?utf-8?B?Zlo2SGU3Q3Yrc1FXUStuOTdSK0lxZjJ0OGEwL2ZuZnJWOWVBRWxFbS8wR0dh?=
 =?utf-8?B?OUpLU0FJc2wwYU1RSzhzOVZDYTFxa3JENHJBMHpheFdzS2ppY3ZwN1BlWlg2?=
 =?utf-8?B?aE1JaXFyeGdKV2d2L1hOM05kSm42Y3hQMXRxTU9jajRnam9wbUxiWHR4Wjh2?=
 =?utf-8?B?MGxUMWt4VkdoU1ZkRzVJYmxUdkRkMjVUQ1NtYVZUUndPcUdTbjE0L0lwRUhU?=
 =?utf-8?B?aEs2TEFoemJWaC9seDFRQW5ES2RBUlN4U2x3UHJ0UC9OU0U3WkhUSEFrQ08v?=
 =?utf-8?B?dldQemYyUkxLcWQ1b2Jzelh4R1lTcnhLb2R2RExXR0hwRnhKNE1hcWRqcGs0?=
 =?utf-8?B?dEJPdlpRM0JYbHpOTGdBR2lNT1VRaFFsRFpiMnE4MmlkSHZRQU1PRGI2cFFV?=
 =?utf-8?B?TVhnU0ZxS0hmNVB3dXlsM3hvN3RPWVZ2b3VsWHBIRjM5QktadWdYM2pZb2hw?=
 =?utf-8?B?WGJSK2tuOHpEbWRMUDB6ZFZNeFlrcnlwekhlTHRkdXplZDNZMDlkK09Kc2p6?=
 =?utf-8?B?b3FrMllOSVYrM0FPYXROM0dsVFdLTHIvd2svd0NOcVlhSWRmTzB0ZWNiYW8z?=
 =?utf-8?B?ZlNMM0F3d0ZvZW9NWHV5azErcEZkWE1JaGpPQkx1N0wvUEkxTWpreW9MMCtn?=
 =?utf-8?B?NG0wdEs3cDUzcHpqUDVmNHNodjZGazlEdzRTSEtwWFVud2lxcy8xUjdreTB6?=
 =?utf-8?Q?eyt4qxWMntQxUeaEQJCLC9Q=3D?=
Content-ID: <B5795FE82260E94297DB17965CE801DF@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5819.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2752ec89-5b88-42f6-dbc5-08ddad2cf2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 23:24:32.1131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Jum9vKtwnBAxAWWFqDlX5G/xHqex02gkdP02dr1u1fpVK4tSlvUjOZBb/BBwmq3BrmFd0XiJSB8daZGAe7KHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR15MB6467
X-Proofpoint-GUID: JyS97h1wgNmqS7gN_LSF2yV2TKPXyXu-
X-Proofpoint-ORIG-GUID: 8-wFMIWcG2SCBC29fJ3gCFyOQlo-zVUp
X-Authority-Analysis: v=2.4 cv=KaDSsRYD c=1 sm=1 tr=0 ts=6850a7b5 cx=c_pps
 a=5RZAJXZTQAV0bSSsSFVBEw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=VnNF1IyMAAAA:8 a=rzsLNOH3-ueIZzOSRkoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE2NyBTYWx0ZWRfX8QEySNkSA+q3
 gI8DlNstmVn16Tto7YtyWBU9xyslnmRsv0UF/O3v9NRPXCmeXB3KSr6TLCIrzhw/wpBDr1ZL5EG
 cYZ1jkCeQ1W+XaEG5uobViZLa1is5pocrRi6/WrOpM0faw7NVbzfT//I52SMbTOV7c4F9tsgePN
 vgfQk7S58xFsdGvA44sogUsbcdJbOCtK/5H8RTZbr2BQa/4YmcxBfJY1s3QHdlGm4B2fYlpx7vs
 ZNBCfH34YZqrp6Gkrlladxvq4+qujgPpLgrauilnxJsV1szcyQJIYXG917SnMKjg3Hwsrg0dACP
 wEhcUtEzcz5AkN+OdKqA2KxH3ENozrn1EGkCWyqGTitc+1oGmWpAHNhKXaIaenVxt13Z50V++0z
 GPAsrhnGB9Ttp0YRG54iCnlgax0bBGG/Z3CnD7dAPns5bnHDDy20HJ9uZTEMJW15DKt69wPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160167
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2025-06-16 at 20:33 +0100, Lorenzo Stoakes wrote:
 > Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file >
 callback"), 
 the f_op->mmap() hook has been deprecated in favour of > f_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.156.1 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRKOw-0004Dk-I3
Subject: Re: [f2fs-dev] [PATCH 10/10] fs: replace mmap hook with
 .mmap_prepare for simple mappings
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
From: Viacheslav Dubeyko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "lucho@ionkov.net" <lucho@ionkov.net>,
 "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>,
 "pc@manguebit.org" <pc@manguebit.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "hubcap@omnibond.com" <hubcap@omnibond.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "sprasad@microsoft.com" <sprasad@microsoft.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "jlbec@evilplan.org" <jlbec@evilplan.org>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "ericvh@kernel.org" <ericvh@kernel.org>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "trondmy@kernel.org" <trondmy@kernel.org>,
 "shaggy@kernel.org" <shaggy@kernel.org>,
 "dhavale@google.com" <dhavale@google.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "pfalcato@suse.de" <pfalcato@suse.de>,
 "hirofumi@mail.parknet.co.jp" <hirofumi@mail.parknet.co.jp>,
 "tom@talpey.com" <tom@talpey.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "lihongbo22@huawei.com" <lihongbo22@huawei.com>,
 "anna@kernel.org" <anna@kernel.org>,
 "martin@omnibond.com" <martin@omnibond.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "yuezhang.mo@sony.com" <yuezhang.mo@sony.com>,
 "cem@kernel.org" <cem@kernel.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "clm@fb.com" <clm@fb.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "marc.dionne@auristor.com" <marc.dionne@auristor.com>,
 "code@tyhicks.com" <code@tyhicks.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>,
 "willy@infradead.org" <willy@infradead.org>,
 "coda@cs.cmu.edu" <coda@cs.cmu.edu>, "slava@dubeyko.com" <slava@dubeyko.com>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux_oss@crudebyte.com" <linux_oss@crudebyte.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dlemoal@kernel.org" <dlemoal@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "idryomov@gmail.com" <idryomov@gmail.com>,
 "jaharkes@cs.cmu.edu" <jaharkes@cs.cmu.edu>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 "jack@suse.cz" <jack@suse.cz>, "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "asmadeus@codewreck.org" <asmadeus@codewreck.org>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 "me@bobcopeland.com" <me@bobcopeland.com>, David Howells <dhowells@redhat.com>,
 "joseph.qi@linux.alibaba.com" <joseph.qi@linux.alibaba.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "zbestahu@gmail.com" <zbestahu@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "mark@fasheh.com" <mark@fasheh.com>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "jannh@google.com" <jannh@google.com>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Hans De Goede <hdegoede@redhat.com>,
 "bharathsm@microsoft.com" <bharathsm@microsoft.com>,
 "aivazian.tigran@gmail.com" <aivazian.tigran@gmail.com>,
 "dsterba@suse.com" <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 "konishi.ryusuke@gmail.com" <konishi.ryusuke@gmail.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "jth@kernel.org" <jth@kernel.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 "bcrl@kvack.org" <bcrl@kvack.org>,
 "jefflexu@linux.alibaba.com" <jefflexu@linux.alibaba.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-karma-devel@lists.sourceforge.net"
 <linux-karma-devel@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2025-06-16 at 20:33 +0100, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> This callback is invoked in the mmap() logic far earlier, so error handling
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
> 
> This hook also avoids passing a pointer to a not-yet-correctly-established
> VMA avoiding any issues with referencing this data structure.
> 
> It rather provides a pointer to the new struct vm_area_desc descriptor type
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
> 
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
> compatibility layer for nested file systems").
> 
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  fs/aio.c              |  8 ++++----
>  fs/bcachefs/fs.c      |  8 ++++----
>  fs/btrfs/file.c       |  7 ++++---
>  fs/ceph/addr.c        |  5 +++--
>  fs/ceph/file.c        |  2 +-
>  fs/ceph/super.h       |  2 +-
>  fs/exfat/file.c       |  7 ++++---
>  fs/f2fs/file.c        |  7 ++++---
>  fs/nilfs2/file.c      |  8 ++++----
>  fs/ocfs2/file.c       |  4 ++--
>  fs/ocfs2/mmap.c       |  5 +++--
>  fs/ocfs2/mmap.h       |  2 +-
>  fs/orangefs/file.c    | 10 ++++++----
>  fs/ramfs/file-nommu.c | 12 ++++++------
>  fs/romfs/mmap-nommu.c |  6 +++---
>  fs/zonefs/file.c      | 10 ++++++----
>  16 files changed, 56 insertions(+), 47 deletions(-)
> 
> diff --git a/fs/aio.c b/fs/aio.c
> index 793b7b15ec4b..7fc7b6221312 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -392,15 +392,15 @@ static const struct vm_operations_struct aio_ring_vm_ops = {
>  #endif
>  };
>  
> -static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
> +static int aio_ring_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	vm_flags_set(vma, VM_DONTEXPAND);
> -	vma->vm_ops = &aio_ring_vm_ops;
> +	desc->vm_flags |= VM_DONTEXPAND;
> +	desc->vm_ops = &aio_ring_vm_ops;
>  	return 0;
>  }
>  
>  static const struct file_operations aio_ring_fops = {
> -	.mmap = aio_ring_mmap,
> +	.mmap_prepare = aio_ring_mmap_prepare,
>  };
>  
>  #if IS_ENABLED(CONFIG_MIGRATION)
> diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
> index 3063a8ddc2df..9c2238edc0e3 100644
> --- a/fs/bcachefs/fs.c
> +++ b/fs/bcachefs/fs.c
> @@ -1553,11 +1553,11 @@ static const struct vm_operations_struct bch_vm_ops = {
>  	.page_mkwrite   = bch2_page_mkwrite,
>  };
>  
> -static int bch2_mmap(struct file *file, struct vm_area_struct *vma)
> +static int bch2_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	file_accessed(file);
> +	file_accessed(desc->file);
>  
> -	vma->vm_ops = &bch_vm_ops;
> +	desc->vm_ops = &bch_vm_ops;
>  	return 0;
>  }
>  
> @@ -1740,7 +1740,7 @@ static const struct file_operations bch_file_operations = {
>  	.llseek		= bch2_llseek,
>  	.read_iter	= bch2_read_iter,
>  	.write_iter	= bch2_write_iter,
> -	.mmap		= bch2_mmap,
> +	.mmap_prepare	= bch2_mmap_prepare,
>  	.get_unmapped_area = thp_get_unmapped_area,
>  	.fsync		= bch2_fsync,
>  	.splice_read	= filemap_splice_read,
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 8ce6f45f45e0..06bd30b35b95 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1978,15 +1978,16 @@ static const struct vm_operations_struct btrfs_file_vm_ops = {
>  	.page_mkwrite	= btrfs_page_mkwrite,
>  };
>  
> -static int btrfs_file_mmap(struct file	*filp, struct vm_area_struct *vma)
> +static int btrfs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *filp = desc->file;
>  	struct address_space *mapping = filp->f_mapping;
>  
>  	if (!mapping->a_ops->read_folio)
>  		return -ENOEXEC;
>  
>  	file_accessed(filp);
> -	vma->vm_ops = &btrfs_file_vm_ops;
> +	desc->vm_ops = &btrfs_file_vm_ops;
>  
>  	return 0;
>  }
> @@ -3765,7 +3766,7 @@ const struct file_operations btrfs_file_operations = {
>  	.splice_read	= filemap_splice_read,
>  	.write_iter	= btrfs_file_write_iter,
>  	.splice_write	= iter_file_splice_write,
> -	.mmap		= btrfs_file_mmap,
> +	.mmap_prepare	= btrfs_file_mmap_prepare,
>  	.open		= btrfs_file_open,
>  	.release	= btrfs_release_file,
>  	.get_unmapped_area = thp_get_unmapped_area,
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..37522137c380 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmops = {
>  	.page_mkwrite	= ceph_page_mkwrite,
>  };
>  
> -int ceph_mmap(struct file *file, struct vm_area_struct *vma)
> +int ceph_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct address_space *mapping = file->f_mapping;
>  
>  	if (!mapping->a_ops->read_folio)
>  		return -ENOEXEC;
> -	vma->vm_ops = &ceph_vmops;
> +	desc->vm_ops = &ceph_vmops;
>  	return 0;
>  }
>  
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index d5c674d2ba8a..41b8ec33e864 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -3170,7 +3170,7 @@ const struct file_operations ceph_file_fops = {
>  	.llseek = ceph_llseek,
>  	.read_iter = ceph_read_iter,
>  	.write_iter = ceph_write_iter,
> -	.mmap = ceph_mmap,
> +	.mmap_prepare = ceph_mmap_prepare,
>  	.fsync = ceph_fsync,
>  	.lock = ceph_lock,
>  	.setlease = simple_nosetlease,
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index bb0db0cc8003..cf176aab0f82 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -1286,7 +1286,7 @@ extern void __ceph_touch_fmode(struct ceph_inode_info *ci,
>  /* addr.c */
>  extern const struct address_space_operations ceph_aops;
>  extern const struct netfs_request_ops ceph_netfs_ops;
> -extern int ceph_mmap(struct file *file, struct vm_area_struct *vma);
> +int ceph_mmap_prepare(struct vm_area_desc *desc);
>  extern int ceph_uninline_data(struct file *file);
>  extern int ceph_pool_perm_check(struct inode *inode, int need);
>  extern void ceph_pool_perm_destroy(struct ceph_mds_client* mdsc);

Looks good for CephFS.

Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

Thanks,
Slava.

> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..d63213c8a823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file_vm_ops = {
>  	.page_mkwrite	= exfat_page_mkwrite,
>  };
>  
> -static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
>  		return -EIO;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &exfat_file_vm_ops;
> +	desc->vm_ops = &exfat_file_vm_ops;
>  	return 0;
>  }
>  
> @@ -710,7 +711,7 @@ const struct file_operations exfat_file_operations = {
>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl = exfat_compat_ioctl,
>  #endif
> -	.mmap		= exfat_file_mmap,
> +	.mmap_prepare	= exfat_file_mmap_prepare,
>  	.fsync		= exfat_file_fsync,
>  	.splice_read	= exfat_splice_read,
>  	.splice_write	= iter_file_splice_write,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f2a8..7af2b49b7e8a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -532,8 +532,9 @@ static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
>  	return -EINVAL;
>  }
>  
> -static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int f2fs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct inode *inode = file_inode(file);
>  
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> @@ -543,7 +544,7 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  		return -EOPNOTSUPP;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &f2fs_file_vm_ops;
> +	desc->vm_ops = &f2fs_file_vm_ops;
>  
>  	f2fs_down_read(&F2FS_I(inode)->i_sem);
>  	set_inode_flag(inode, FI_MMAP_FILE);
> @@ -5376,7 +5377,7 @@ const struct file_operations f2fs_file_operations = {
>  	.iopoll		= iocb_bio_iopoll,
>  	.open		= f2fs_file_open,
>  	.release	= f2fs_release_file,
> -	.mmap		= f2fs_file_mmap,
> +	.mmap_prepare	= f2fs_file_mmap_prepare,
>  	.flush		= f2fs_file_flush,
>  	.fsync		= f2fs_sync_file,
>  	.fallocate	= f2fs_fallocate,
> diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
> index 0e3fc5ba33c7..1b8d754db44d 100644
> --- a/fs/nilfs2/file.c
> +++ b/fs/nilfs2/file.c
> @@ -125,10 +125,10 @@ static const struct vm_operations_struct nilfs_file_vm_ops = {
>  	.page_mkwrite	= nilfs_page_mkwrite,
>  };
>  
> -static int nilfs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int nilfs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	file_accessed(file);
> -	vma->vm_ops = &nilfs_file_vm_ops;
> +	file_accessed(desc->file);
> +	desc->vm_ops = &nilfs_file_vm_ops;
>  	return 0;
>  }
>  
> @@ -144,7 +144,7 @@ const struct file_operations nilfs_file_operations = {
>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl	= nilfs_compat_ioctl,
>  #endif	/* CONFIG_COMPAT */
> -	.mmap		= nilfs_file_mmap,
> +	.mmap_prepare	= nilfs_file_mmap_prepare,
>  	.open		= generic_file_open,
>  	/* .release	= nilfs_release_file, */
>  	.fsync		= nilfs_sync_file,
> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index 2056cf08ac1e..21d797ccccd0 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -2800,7 +2800,7 @@ const struct inode_operations ocfs2_special_file_iops = {
>   */
>  const struct file_operations ocfs2_fops = {
>  	.llseek		= ocfs2_file_llseek,
> -	.mmap		= ocfs2_mmap,
> +	.mmap_prepare	= ocfs2_mmap_prepare,
>  	.fsync		= ocfs2_sync_file,
>  	.release	= ocfs2_file_release,
>  	.open		= ocfs2_file_open,
> @@ -2850,7 +2850,7 @@ const struct file_operations ocfs2_dops = {
>   */
>  const struct file_operations ocfs2_fops_no_plocks = {
>  	.llseek		= ocfs2_file_llseek,
> -	.mmap		= ocfs2_mmap,
> +	.mmap_prepare	= ocfs2_mmap_prepare,
>  	.fsync		= ocfs2_sync_file,
>  	.release	= ocfs2_file_release,
>  	.open		= ocfs2_file_open,
> diff --git a/fs/ocfs2/mmap.c b/fs/ocfs2/mmap.c
> index 6a314e9f2b49..50e2faf64c19 100644
> --- a/fs/ocfs2/mmap.c
> +++ b/fs/ocfs2/mmap.c
> @@ -159,8 +159,9 @@ static const struct vm_operations_struct ocfs2_file_vm_ops = {
>  	.page_mkwrite	= ocfs2_page_mkwrite,
>  };
>  
> -int ocfs2_mmap(struct file *file, struct vm_area_struct *vma)
> +int ocfs2_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	int ret = 0, lock_level = 0;
>  
>  	ret = ocfs2_inode_lock_atime(file_inode(file),
> @@ -171,7 +172,7 @@ int ocfs2_mmap(struct file *file, struct vm_area_struct *vma)
>  	}
>  	ocfs2_inode_unlock(file_inode(file), lock_level);
>  out:
> -	vma->vm_ops = &ocfs2_file_vm_ops;
> +	desc->vm_ops = &ocfs2_file_vm_ops;
>  	return 0;
>  }
>  
> diff --git a/fs/ocfs2/mmap.h b/fs/ocfs2/mmap.h
> index 1051507cc684..d21c30de6b8c 100644
> --- a/fs/ocfs2/mmap.h
> +++ b/fs/ocfs2/mmap.h
> @@ -2,6 +2,6 @@
>  #ifndef OCFS2_MMAP_H
>  #define OCFS2_MMAP_H
>  
> -int ocfs2_mmap(struct file *file, struct vm_area_struct *vma);
> +int ocfs2_mmap_prepare(struct vm_area_desc *desc);
>  
>  #endif  /* OCFS2_MMAP_H */
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index 90c49c0de243..919f99b16834 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -398,8 +398,9 @@ static const struct vm_operations_struct orangefs_file_vm_ops = {
>  /*
>   * Memory map a region of a file.
>   */
> -static int orangefs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	int ret;
>  
>  	ret = orangefs_revalidate_mapping(file_inode(file));
> @@ -410,10 +411,11 @@ static int orangefs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  		     "orangefs_file_mmap: called on %pD\n", file);
>  
>  	/* set the sequential readahead hint */
> -	vm_flags_mod(vma, VM_SEQ_READ, VM_RAND_READ);
> +	desc->vm_flags |= VM_SEQ_READ;
> +	desc->vm_flags &= ~VM_RAND_READ;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &orangefs_file_vm_ops;
> +	desc->vm_ops = &orangefs_file_vm_ops;
>  	return 0;
>  }
>  
> @@ -574,7 +576,7 @@ const struct file_operations orangefs_file_operations = {
>  	.read_iter	= orangefs_file_read_iter,
>  	.write_iter	= orangefs_file_write_iter,
>  	.lock		= orangefs_lock,
> -	.mmap		= orangefs_file_mmap,
> +	.mmap_prepare	= orangefs_file_mmap_prepare,
>  	.open		= generic_file_open,
>  	.splice_read    = orangefs_file_splice_read,
>  	.splice_write   = iter_file_splice_write,
> diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
> index 7a6d980e614d..77b8ca2757e0 100644
> --- a/fs/ramfs/file-nommu.c
> +++ b/fs/ramfs/file-nommu.c
> @@ -28,7 +28,7 @@ static unsigned long ramfs_nommu_get_unmapped_area(struct file *file,
>  						   unsigned long len,
>  						   unsigned long pgoff,
>  						   unsigned long flags);
> -static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vma);
> +static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc);
>  
>  static unsigned ramfs_mmap_capabilities(struct file *file)
>  {
> @@ -38,7 +38,7 @@ static unsigned ramfs_mmap_capabilities(struct file *file)
>  
>  const struct file_operations ramfs_file_operations = {
>  	.mmap_capabilities	= ramfs_mmap_capabilities,
> -	.mmap			= ramfs_nommu_mmap,
> +	.mmap_prepare		= ramfs_nommu_mmap_prepare,
>  	.get_unmapped_area	= ramfs_nommu_get_unmapped_area,
>  	.read_iter		= generic_file_read_iter,
>  	.write_iter		= generic_file_write_iter,
> @@ -262,12 +262,12 @@ static unsigned long ramfs_nommu_get_unmapped_area(struct file *file,
>  /*
>   * set up a mapping for shared memory segments
>   */
> -static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vma)
> +static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	if (!is_nommu_shared_mapping(vma->vm_flags))
> +	if (!is_nommu_shared_mapping(desc->vm_flags))
>  		return -ENOSYS;
>  
> -	file_accessed(file);
> -	vma->vm_ops = &generic_file_vm_ops;
> +	file_accessed(desc->file);
> +	desc->vm_ops = &generic_file_vm_ops;
>  	return 0;
>  }
> diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
> index 4520ca413867..4b77c6dc4418 100644
> --- a/fs/romfs/mmap-nommu.c
> +++ b/fs/romfs/mmap-nommu.c
> @@ -61,9 +61,9 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
>   * permit a R/O mapping to be made directly through onto an MTD device if
>   * possible
>   */
> -static int romfs_mmap(struct file *file, struct vm_area_struct *vma)
> +static int romfs_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	return is_nommu_shared_mapping(vma->vm_flags) ? 0 : -ENOSYS;
> +	return is_nommu_shared_mapping(desc->vm_flags) ? 0 : -ENOSYS;
>  }
>  
>  static unsigned romfs_mmap_capabilities(struct file *file)
> @@ -79,7 +79,7 @@ const struct file_operations romfs_ro_fops = {
>  	.llseek			= generic_file_llseek,
>  	.read_iter		= generic_file_read_iter,
>  	.splice_read		= filemap_splice_read,
> -	.mmap			= romfs_mmap,
> +	.mmap_prepare		= romfs_mmap_prepare,
>  	.get_unmapped_area	= romfs_get_unmapped_area,
>  	.mmap_capabilities	= romfs_mmap_capabilities,
>  };
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index 42e2c0065bb3..c1848163b378 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -312,8 +312,10 @@ static const struct vm_operations_struct zonefs_file_vm_ops = {
>  	.page_mkwrite	= zonefs_filemap_page_mkwrite,
>  };
>  
> -static int zonefs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int zonefs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
> +
>  	/*
>  	 * Conventional zones accept random writes, so their files can support
>  	 * shared writable mappings. For sequential zone files, only read
> @@ -321,11 +323,11 @@ static int zonefs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	 * ordering between msync() and page cache writeback.
>  	 */
>  	if (zonefs_inode_is_seq(file_inode(file)) &&
> -	    (vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> +	    (desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE))
>  		return -EINVAL;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &zonefs_file_vm_ops;
> +	desc->vm_ops = &zonefs_file_vm_ops;
>  
>  	return 0;
>  }
> @@ -850,7 +852,7 @@ const struct file_operations zonefs_file_operations = {
>  	.open		= zonefs_file_open,
>  	.release	= zonefs_file_release,
>  	.fsync		= zonefs_file_fsync,
> -	.mmap		= zonefs_file_mmap,
> +	.mmap_prepare	= zonefs_file_mmap_prepare,
>  	.llseek		= zonefs_file_llseek,
>  	.read_iter	= zonefs_file_read_iter,
>  	.write_iter	= zonefs_file_write_iter,

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

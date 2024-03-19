Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C154487FCA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Mar 2024 12:13:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmXPM-0003O6-LS;
	Tue, 19 Mar 2024 11:13:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=801f15ad6=shinichiro.kawasaki@wdc.com>)
 id 1rmXPL-0003Ny-4j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 11:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ypwu8L9c5sujVkZB9LDDvmyT7xp8MW/cTbRx1BX61fQ=; b=O5ZXGhIZ+KEM07fxKUbNJbC8ET
 ortJArYASydacyKma2u+oJiy4+/6lwf1VIldAGaFj4Y23hJuPi4x/BxGOO76JNVzcLCxFdvIuC1La
 Jc6ih0NpFKHVESKikAvTp4BSsqGDD9IXTBspwQv1jpIAKrzFGYmqIMc2ZOt/Lak8vzYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ypwu8L9c5sujVkZB9LDDvmyT7xp8MW/cTbRx1BX61fQ=; b=GzQEUhvDSWG7JjxhZOcjG9UH8f
 KnU1NsnzxLjfJmzFF/4atAykTkY/Xm9CJrvHgIi1PxHonVvfLq89NM2gaJqXsOOJhrPnVMtw1sbG3
 f8ok3UBoNSs38kopKkXnNcXwZFAhLJi4rd/W0TtEAKe3QVZ51UXbCd71x4UKzuN79zFM=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmXP9-0008HL-LK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 11:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1710846803; x=1742382803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uwI0x+QCXQ/r/q7aDsKv8VdN0gLsX1kkBDDUAbQPoKg=;
 b=mO0dE3Bo0z6n7X6kJT/SMQdhrwWeiTbZbN+H/hdWWJWxNq5QtgO0o2NG
 FLq5TTKsC1VZtOtfzAeTeymrfwL4K3DVFA/yPMOxw+xflD8Bt4Vw7LCqI
 wA3fMgVsRHUxuGNJAqsaeLOoiYXv4sbehwiCacsUjAaMHIXi7+lBtTHBb
 VUgcySIUgov1wz+HSMEOuv6Gs2BC2rOMH/Q+p/Fhoy0Jb1DDqHVtW9RFM
 NaIN70Er8zsLtyF6GDhTyIh/s+e1zFqsCZ8kPB4AXv1toqAibSCsOAXWm
 icMaam4G3s6qW0qYKjsFHGk3go+Sp/3+SbxxjNnTxu/xTGJ1h+E+/XUY9 A==;
X-CSE-ConnectionGUID: Q5A0dyaSRSmuzm5IH1gLYg==
X-CSE-MsgGUID: 9SJDeHSuToiFIM1jOaRxzQ==
X-IronPort-AV: E=Sophos;i="6.07,136,1708358400"; d="scan'208";a="11453879"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 19 Mar 2024 19:13:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPyBBTIF0WW3nB9QCB3FqAPFi960BEz7RiAVoY3yhCPNJSaxumx2I5TwZyxS7/3Pry/OAivuXmg/X4yYz9s/UgDmd3+JNDq9R9CQIXbMr85+KFBud0gAJvyUsydWcOZMBW3zsgamxegdsOZHE3Ov4OBCxoiUN29c6u4OPrYsFYLtsTv8pxV9ySJ8HgyAWROjBXlVMLm56AbFq5AtjhgAWJbbc+QARR2liWOnf2/8+Mt4dpI28pTi3m/ELgp3PAY0zbxv83cxAh9JsVnaHSyxAHcFpnFsSe0FCLVnTEwjgc8KE7Pqe9oVWYck7J0L7RfA/kcctedM3nSblZupAtXJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypwu8L9c5sujVkZB9LDDvmyT7xp8MW/cTbRx1BX61fQ=;
 b=oXdttXIwus1suiBKZBe4lVjLohrSq/aq4ZzqvOC54hE0brO7yoaoqGoh1rBEOh2MsF3K+/Bskont/d53aTtr0sDzG34/N11Y3zl4Ntg4voIXbJGOAnrabQd2eWevgYudJ3lDW3p0J9a4ATQXHWqWiWxea6oKUcB3J//S+bY7G+0eRv0+E09RiXeRQuxvMY+DMtThRfXFCIiFnPwyHWXIPbgYvPd3k1iMjVRde+azLs2ObqSjORHBW5iXVTSadQM+b7WpF8irVVU8zBdhL4dhy02bFHOplX8DQk1TqRaF8T9A9KdvAvhYEFrUKx23O0swcFfIIevc96JkVnT+DXdyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypwu8L9c5sujVkZB9LDDvmyT7xp8MW/cTbRx1BX61fQ=;
 b=X+Iigdoh+wJIer7+13BX551X5nZizs40tpuUKPBX4tSo8GKKYsIAaFL+UAqjd2XBki7umX1RXkGX1vGA82e6l7hMHJgyAPcaxsdGQgl2t4alUefJV8M6IPQZKEpzt1LM8al6OK82zWn3tnlUW2hdQXOixdfkrZBldIvylzP/t8U=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SA2PR04MB7500.namprd04.prod.outlook.com (2603:10b6:806:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.24; Tue, 19 Mar
 2024 11:13:09 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b%4]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 11:13:09 +0000
To: Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
Thread-Index: AQHaYovQw4Cp4i7GhUK8xyPo7C3fjLEfp86AgAAQ4ICAAtxGAIAQ9nqAgAAi6wCAAE15gIAJLoeAgAFZQQCAAJQmAA==
Date: Tue, 19 Mar 2024 11:13:09 +0000
Message-ID: <jpgro32y5r3mpyh24hoqnwkbcg67twbmcxeicoa5qt723u7ehk@4imddarhtt74>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
 <f4f1cfac-8520-47a1-ad18-b9922aa0545d@kernel.org>
In-Reply-To: <f4f1cfac-8520-47a1-ad18-b9922aa0545d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SA2PR04MB7500:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pM/6bs0ofC5sVsnHrMJOgORt7dmUoMenQU8ArMJKiwELYF3K6Hch80BxvfV4+RAnSiYF1lNRapsazmt4EeelyKuA/WJ7Pov4zxcWr4CuZ8BgaC8hTgdn2VALcipzTvCLpL8VvWvbWkmSuT7MqqZTRWhw5tnBLSP7FAH7quJjb3W8zZWWZIA4qiTV55x6gR55z0X3AY6AIcEKtOh2EC7frE2TUmJaunutVI3SBIDHiWPrgku2FvX8bNw1JbkXDr/oBOZA3P30KmxaF4TFAuWrPznri2stgF3HF0PzIg4wd7dyuA54ODS9XsHrpMduDMCtI2a661mQVfb0cNa5XHy+A1+K+xU7XwoRmksWsBF1gKgkanlkZ8rEvjb411jdlopTPKy7bvFPVdRRMvItio1sSkcWviQPSGHvjOnBHrvKUg8gHCgItb4/Nctt3k6JnKAI4NW0023ktsraZy8ULyWfGaLOGnw4i60CgOnisav8PJbef7zfweYUTClceJ8y/vpynK9Ow0lYm1TYpeUOaH9W8OWnnJE/JT0gQy7kFdd/EkfwB7TGd3fuqQdeQ+dVpCwYyxoZnrv+dheg1hmzCs7cCEEBoMkw69iyDOLPFXywttq93d8tmr0+1v+LDqRzC1hvKTqyW9QFo10+mLKBh7orjBxiIbVlcY8gW6rc+0tXOC0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PVN11uPAWLFD62lpkRJ8HhsYvpBMR29tTOQ/hsuWIuOz8NifwYZPuL6BLW3K?=
 =?us-ascii?Q?wUwEzYst9vfF0oy3jv92QctSLSt+GEo8GObkaRrFRdGadqWxb5mW/GZvBYVI?=
 =?us-ascii?Q?t9rEDpFYgypmDer3zsI354EpmOQaM1s5XyH59WIRfXviPdcuhF+zs7WKpKtw?=
 =?us-ascii?Q?YvHypljMwu5xJH4rbm3RwcIrozfZqNZLjRvMarA2AeSE9HT4+6kvxilJ2H0K?=
 =?us-ascii?Q?wQUfZ9Li5klQYyDVv8yXw/tRC6V0fgTym6cSFNxeDVeQcQKfpSpNtKIHD+O9?=
 =?us-ascii?Q?ABGZ+ji9Mr/psxc4/wKjLI3PHbhjG50PLzGOMeVLy7uQUW/q5pnfdRXKugkf?=
 =?us-ascii?Q?pbVL+3K1cAEB7S70vvsZP3/TwbieQKGloebTo5nR6VGbfDYjSyOVW1RaUXxJ?=
 =?us-ascii?Q?ijh8braG6McSAuBcDJsxOnq3hcxPiGaqcvHV68/Sd+Q6nsuXtkZ62rmDF96C?=
 =?us-ascii?Q?7L23mT2l8n6+jcsWNVSehaoK9uxy0WEBuyMiY1DU1zgMjpz5xxUehXEnn5KW?=
 =?us-ascii?Q?WX6zOFeBZ0tiRBwCpllGNf6cOl1AVvFtqjiY2svmjvdUliYrGVf5d7+zRfHf?=
 =?us-ascii?Q?4rmQ36Wnmn0wGgzCpDlXbfsx2eYkAgfLMGN6PTSMIVsaNQOrp7KVJ33MSupl?=
 =?us-ascii?Q?0E+cS9ij8khE1J2CknZucr9tX316UN8YwXOZcnbpYJdu8xuEE3mg5CQAHfg9?=
 =?us-ascii?Q?5W3L9kJKlRZnfeSppBfDSxOeKbVxzfxvlaOmbWKFRt4/Ux0RCmNf1GIUlv/8?=
 =?us-ascii?Q?2Te0Jig+IUupV+IjKTsbzgNdpQUfDAMhUKWlyvMJPvC7oI2iwe4lfWD8spV4?=
 =?us-ascii?Q?zjz3VRm2C8anu1tdak7YArTwOnnjM52zi0NvvjxTD+XGwsAZjmPH48k1P81N?=
 =?us-ascii?Q?Dc2wc06tEW6nhpElGVZ7VpIniX0Xb3ytwjs4E96Z3SVpQMTRBpj21lXUTt72?=
 =?us-ascii?Q?oPfJ4H2no5uwEjRzIJ3keswEkd5rM8LR4/rihl+rFF+NvaAD4BmBRV95GZ4B?=
 =?us-ascii?Q?ZbiUec1+w84F+mkFibbJcby6Zt8MmdwR0+PKyW7dfJsC7OtO1psev8ALTz6o?=
 =?us-ascii?Q?p7Pmqvzflsn8sHxHb8fP2cTlr2QWV7mVVXu9FrAVxfNEjND7wWo82jlQ6Aho?=
 =?us-ascii?Q?bdaK5mRpnC8fpdl09Yu5jeMKuGzlM4AGyN5bYKyq1GGk7EHd0uRzwzjF9aRR?=
 =?us-ascii?Q?w2jNJKK8kBEirC5RXvFHXGK5TFj37fxgfWGOOjdgZN0jqlnrBMcy8DT6/FrE?=
 =?us-ascii?Q?gkuoiZstbsYliLV8059FQw8Eks5B+jP5RFwv+p4NTk6ShfZOGZBXfVUOlqi1?=
 =?us-ascii?Q?PcIg2VYh6Bg9Zq6BpNAR077vxWlmP7yH4wUhOXZJfSPNsigkq5jV74WazFTk?=
 =?us-ascii?Q?Gh2HOuOzSBH1ulAn2FugMr42bwsbZbQcSTIUYpftMD4R1JJfCFkC64xXZ6o9?=
 =?us-ascii?Q?8BpT9s4ZCqvdhIdu2Kd1UTyb/lHltD8TxifkGpYCJNtTXUSAAvB1/UJyQtLH?=
 =?us-ascii?Q?z7gzGEj0enyCtJn/R9iIBiiZX2rvOD9tZSyaNw8rQpA3/CaBuyRrKpPen0xM?=
 =?us-ascii?Q?9Go2/D5EqpWdAWracdyRbgTFI9btqwgz30Q+++dZlrshAgv9mdLJ3JRia1h4?=
 =?us-ascii?Q?YiaxwNVVpLggm2t1lFRVDQo=3D?=
Content-ID: <A95DBE77C3043B428C745CA43A4C6D50@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FgKYvm/SR2xi8VNpd+8SDAYm7DWs3pO7K7Q+lC4ErPWZ//MLGLMgy/ztUttMr1seu64GqnG4e1jsak3XMIi+TVyFdQKxkj+FkeGLJ3a/OfDidnEg81SKY/GJV6hMt9Jx9XsmILG/rDqCbFDhd+2jwhLjwaT1k444VLAo4xKJcUdD/g+cK++s1E6ojlIHT3wnmkIqIN5dGjSuA6vVamOAzQHG/wB4t1EdUsoLLVB29TADCsefkDNJ5OmRWWd7DK888OHBG4zQDw9PXQ1l7ZWEkylSFyW6nA4zE3OuWx303YTBkiS+wUVoqbpoF0WcABMuBNbo1w2FzKGgCO1FFRLJsJRqHtC13vdYgcHIWEZ+iYCAvSkUhYniofmQC3gDL6R+RfdDdmB0bQKC5bLTzaRz6Hb9FZusLEFBZQvlnhWNYhSLAoAmi/tqbswEx3nN9eiKbKXuri2NbIs6Y6zWvJlH8CLxEs2QcxzcQgh8qCW9WkJjst6DAFAT6cieo9XSJBD6juAyS4OwRZ+jQJr8c3FvCDcr8MvI3/t2CMSjYF/sjLUbAMdSql5KSXo5KV8uKtkDnVRmTug5OHhBb4cIrNihPxXhiHFE/ABujUgCAM8jd+NFGTxuIA2OPOxMUWx7rOjV
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291d07b2-b45a-46e2-a8c8-08dc48058efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 11:13:09.0249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJdKBvVq4remofSCosYSahQXRhrrHgUvYEiH3OOA/mqLGsG8vV9MmnK+WZEWa02oiuitw0AVIUexnTep34h+UO1+ZwhBMbuZR22OZMdax4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7500
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mar 19, 2024 / 10:22, Chao Yu wrote: > On 2024/3/18 13:47,
 Shinichiro Kawasaki via Linux-f2fs-devel wrote: > > I confirmed that the
 trigger commit is dbf8e63f48af as Yi reported. I took a > > look [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmXP9-0008HL-LK
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yi Zhang <yi.zhang@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mar 19, 2024 / 10:22, Chao Yu wrote:
> On 2024/3/18 13:47, Shinichiro Kawasaki via Linux-f2fs-devel wrote:
> > I confirmed that the trigger commit is dbf8e63f48af as Yi reported. I took a
> > look in the commit, but it looks fine to me. So I thought the cause is not
> > in the commit diff.
> > 
> > I found the WARN is printed when the f2fs is set up with multiple devices,
> > and read requests are mapped to the very first block of the second device in the
> > direct read path. In this case, f2fs_map_blocks() and f2fs_map_blocks_cached()
> > modify map->m_pblk as the physical block address from each block device. It
> > becomes zero when it is mapped to the first block of the device. However,
> > f2fs_iomap_begin() assumes that map->m_pblk is the physical block address of the
> > whole f2fs, across the all block devices. It compares map->m_pblk against
> > NULL_ADDR == 0, then go into the unexpected branch and sets the invalid
> > iomap->length. The WARN catches the invalid iomap->length.
> > 
> > This WARN is printed even for non-zoned block devices, by following steps.
> > 
> >   - Create two (non-zoned) null_blk devices memory backed with 128MB size each:
> >     nullb0 and nullb1.
> >   # mkfs.f2fs /dev/nullb0 -c /dev/nullb1
> >   # mount -t f2fs /dev/nullb0 "${mount_dir}"
> >   # dd if=/dev/zero of="${mount_dir}/test.dat" bs=1M count=192
> >   # dd if="${mount_dir}/test.dat" of=/dev/null bs=1M count=192 iflag=direct
> > 
> > I created a fix candidate patch [1]. It modifies f2fs_iomap_begin() to handle
> > map->m_pblk as the physical block address from each device start, not the
> > address of whole f2fs. I confirmed it avoids the WARN.
> > 
> > But I'm not so sure if the fix is good enough. map->m_pblk has dual meanings.
> > Sometimes it holds the physical block address of each device, and sometimes
> > the address of the whole f2fs. I'm not sure what is the condition for
> > map->m_pblk to have which meaning. I guess F2FS_GET_BLOCK_DIO flag is the
> > condition, but f2fs_map_blocks_cached() does not ensure it.
> > 
> > Also, I noticed that map->m_pblk is referred to in other functions below, and
> > not sure if they need the similar change as I did for f2fs_iomap_begin().
> > 
> >    f2fs_fiemap()
> >    f2fs_read_single_page()
> >    f2fs_bmap()
> >    check_swap_activate()
> > 
> > I would like to hear advices from f2fs experts for the fix.
> > 
> > 
> > [1]
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 26e317696b33..5232223a69e5 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1569,6 +1569,7 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
> >   		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
> >   		struct f2fs_dev_info *dev = &sbi->devs[bidx];
> > +		map->m_multidev_dio = true;
> >   		map->m_bdev = dev->bdev;
> >   		map->m_pblk -= dev->start_blk;
> >   		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
> > @@ -4211,9 +4212,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> >   			    unsigned int flags, struct iomap *iomap,
> >   			    struct iomap *srcmap)
> >   {
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >   	struct f2fs_map_blocks map = {};
> >   	pgoff_t next_pgofs = 0;
> > -	int err;
> > +	block_t pblk;
> > +	int err, i;
> >   	map.m_lblk = bytes_to_blks(inode, offset);
> >   	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
> > @@ -4239,12 +4242,17 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> >   	 * We should never see delalloc or compressed extents here based on
> >   	 * prior flushing and checks.
> >   	 */
> > -	if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
> > +	pblk = map.m_pblk;
> > +	if (map.m_multidev_dio && map.m_flags & F2FS_MAP_MAPPED)
> > +		for (i = 0; i < sbi->s_ndevs; i++)
> > +			if (FDEV(i).bdev == map.m_bdev)
> > +				pblk += FDEV(i).start_blk;
> > +	if (WARN_ON_ONCE(pblk == NEW_ADDR))
> >   		return -EINVAL;
> > -	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
> > +	if (WARN_ON_ONCE(pblk == COMPRESS_ADDR))
> >   		return -EINVAL;
> 
> Shoudn't we check NEW_ADDR and COMPRESS_ADDR before multiple-device
> block address conversion?

As far as I understand, NEW_ADDR and COMPRESS_ADDR in map.m_pblk can be
target of "map->m_pblk -= FDEV(bidx).start_blk;" in f2fs_map_blocks(),
so I guessed that the address conversion should come first.

> 
> > -	if (map.m_pblk != NULL_ADDR) {
> > +	if (pblk != NULL_ADDR) {
> 
> How to distinguish NULL_ADDR and valid blkaddr 0? I guess it should
> check F2FS_MAP_MAPPED flag first?

I guessed that physical block address for the whole f2fs (pblk) can not be 0, so
the NULL_ADDR can have zero value. As for the physical block address of each
device (map->m_pblk) can be 0. But this is still my *guess*, and I'm not sure.


The comments from you and Daeho made me rethink. It looks problematic for me
that map->m_pblk has two meanings as I had described: "1) physical block address
from each device start", and "2) physical block address of whole f2fs". So how
about to make it have only one meaning "2) physical block address address of
whole f2fs"? I created another patch below [2]. It removes the

   map->m_pblk -= FDEV(bidx).start_blk;

lines in f2fs_map_blocks_cached() and f2fs_map_blocks() so that map->m_pblk do
not have the meaning 1). Instead, the subtraction is done in f2fs_iomap_begin().
I confirmed that this patch also avoids the WARN. I can have more confidence in
this patch, and I hope it is easier to review.

P.S. If anyone has better solution idea, feel free to provide patches. I'm
     willing to test them :)


[2]

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 26e317696b33..7404b4fbcba3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1569,8 +1569,8 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
 		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
 		struct f2fs_dev_info *dev = &sbi->devs[bidx];
 
+		map->m_multidev_dio = true;
 		map->m_bdev = dev->bdev;
-		map->m_pblk -= dev->start_blk;
 		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
 	} else {
 		map->m_bdev = inode->i_sb->s_bdev;
@@ -1793,11 +1793,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 		if (map->m_multidev_dio) {
 			block_t blk_addr = map->m_pblk;
-
 			bidx = f2fs_target_device_index(sbi, map->m_pblk);
-
 			map->m_bdev = FDEV(bidx).bdev;
-			map->m_pblk -= FDEV(bidx).start_blk;
 
 			if (map->m_may_create)
 				f2fs_update_device_state(sbi, inode->i_ino,
@@ -4211,9 +4208,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			    unsigned int flags, struct iomap *iomap,
 			    struct iomap *srcmap)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_map_blocks map = {};
 	pgoff_t next_pgofs = 0;
-	int err;
+	block_t pblk;
+	int err, bidx;
 
 	map.m_lblk = bytes_to_blks(inode, offset);
 	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
@@ -4249,7 +4248,12 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
 		iomap->bdev = map.m_bdev;
-		iomap->addr = blks_to_bytes(inode, map.m_pblk);
+		pblk = map.m_pblk;
+		if (map.m_multidev_dio && map.m_flags & F2FS_MAP_MAPPED) {
+			bidx = f2fs_target_device_index(sbi, map.m_pblk);
+			pblk -= FDEV(bidx).start_blk;
+		}
+		iomap->addr = blks_to_bytes(inode, pblk);
 	} else {
 		if (flags & IOMAP_WRITE)
 			return -ENOTBLK;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

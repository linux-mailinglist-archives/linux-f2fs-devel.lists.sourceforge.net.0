Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE532DB847
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 02:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ck5V328PKoVNPeISqAeibDB0y3VrOShBvVL6jDY+C3k=; b=WFGrxYLGRfH4TPxrVQ21XSOge
	+nKIhF/iVRhorcZkIZ/nthl8iwzPi93NNMCZ5hDElZJ6e6QO+0ZtltORwkISb/maV8dVPnSA1Zfd0
	udfhnzISl7ZnKbYXG9YzZ/ka/XoQx0XL7Ii3p857r7lwKAqyqP7qb0cK8bdScC5w7AjSU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpLN3-0005T9-LS; Wed, 16 Dec 2020 01:12:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9619487956=terrelln@fb.com>)
 id 1kpLN2-0005Sy-C7; Wed, 16 Dec 2020 01:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ujVqvmc2vptgRNihKSPeI4+ePcN+4jwtMqdmlEl2EzM=; b=W1AuTdsgkTUG3OV3hwVnDyY+Xm
 j3ktHleuRyTsMzENkWGGo0lurTTJuuNKZouhucLmrN5EogsZ0C8Clgm7p8B4Uy8QZI/tsHG8iUXTN
 DDb082HCsiNLmCFAiF3r6keStJYGVdHJHdJNclBSskrVA8SQHGRX7sdw8M1ZXBRkHXm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ujVqvmc2vptgRNihKSPeI4+ePcN+4jwtMqdmlEl2EzM=; b=CTVzMAEPCOXmGOH77eRrB4DIwg
 w54r1NjIZw8Yb8MteZGMT8phBWsDurQW0dd5f+gKpZwOyRUFGrEtIrKNIFniFLu6r8OdFKi8nN6ik
 tHjlsCEjC54WZdjAOW7U0aaT+ZMRK2eMjJYcSzSs0zN5R5KcwSVMQ/i7INN4t3CMKj3E=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpLMv-00F8kM-JN; Wed, 16 Dec 2020 01:12:48 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BG12vPp019892; Tue, 15 Dec 2020 17:12:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ujVqvmc2vptgRNihKSPeI4+ePcN+4jwtMqdmlEl2EzM=;
 b=qElPfrK601H+tEyokljYTx6/o9/9dU/GRNaY5gHjuFJyUddqZSwOC+gt1fZyU2XFy6+d
 xs+zTzglktciK7Hpb/LaNyaxFcNgqLRhmyDcDeTJ5SQdCMful/3g1ptEOduG9t/VvsmP
 dWTXk55P3/V8Yx8BAFPUj4oQQLhW8F47UoE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 35f54n934v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Dec 2020 17:12:15 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Dec 2020 17:12:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCFDjFFs25bwf14jeJWUoAbtlZvN2BiDmuChSXoxTv3f2a4lIBJJL2k2Zif2nSzuI2r9S0JsN60QpJqsju1kZIpifi7qeKD+ouT7lFo+FuJbEjoHFmTBYudMZ6+SKlfvIpHj/W/cV0FgjzAPVQHteH1OUTAXO5Pa1YjISEtbjvSLoWLqqrs77TlrX4a+PwEoAZCaVKYeySkeItd28FKIX/m6aI9yY2GLW7B1tnsyxTaUqrAc1quczK4fwWY7nUb3sNPyyU6jkCRyVpl0wR2uo8iVZg4BnroxTdHbDKSAlCn8UAq3+N9FencIyrd7naqGJeLdyFHyJxV90XogjRr/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujVqvmc2vptgRNihKSPeI4+ePcN+4jwtMqdmlEl2EzM=;
 b=mTgV/QqzvVCxaDIm4c0S8mAfRk0t093BQZ2ECuu5q74k1bZgiDOuzKxMp6Mg90dW59QTjsNW4qfMmw8ZF3baaZspH/ROUMJXMURnUCpIpq3V8ZAXNRDPOgyG5qNTlsO2mXh9XwwO2EygydEoqHr+1irG+Sur1oIXdKHk05+IhJtmYyDZZyDNe2YFBjUB/oLiha4esbTc2W/wLJrkSszq/59y/m9lvLbIz78TWMg70HFrtI69ouU0ckNKF/Pgt18GDbtQV4BcAVMIsQ20Y0tWj/m7VtK9h+deGHefByeGV6DVAsWQpQB8NgE4lFLaTI6UZpEXBk98Qupux/xD4OZe8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujVqvmc2vptgRNihKSPeI4+ePcN+4jwtMqdmlEl2EzM=;
 b=ckK2DBpuFvfeiU2QUjMq79uGzZ3jdyoCNvj0ANx0WfyCRI64njPINeXB93ld6KXhvQZ4NkBN9ExHflqroBxoTY09sAX0nwN12YeKyd+uc1dwUnxVy7x8oxevwTvj1K3UeEuE/tu+IL7gadxe5SUYV8NDeloHeFMUgBbke81b8+Q=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2488.namprd15.prod.outlook.com (2603:10b6:a02:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Wed, 16 Dec
 2020 01:12:09 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 01:12:09 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>
Thread-Topic: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
Thread-Index: AQHWybXbXo5DSFQdaEqlAnoQrw8JMqn4tsKAgAAywQCAAA2CgIAAApeAgAAD6gA=
Date: Wed, 16 Dec 2020 01:12:09 +0000
Message-ID: <11B2A42A-8B23-4F6D-9736-A2823D4DFE2B@fb.com>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
 <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
 <X9lOHkAE67EP/sXo@sol.localdomain>
 <B3F00261-E977-4B85-84CD-66B07DA79D9D@fb.com>
 <20201216005806.GA26841@gondor.apana.org.au>
In-Reply-To: <20201216005806.GA26841@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none; gondor.apana.org.au; dmarc=none action=none header.from=fb.com; 
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74b95f06-7ce6-458c-17c9-08d8a15f9cb7
x-ms-traffictypediagnostic: BYAPR15MB2488:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2488062622541E90709096F9ABC50@BYAPR15MB2488.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZajH40OoHviKZbIHKAeFFQx8A5tEa5xqo7tSQ2QHldhnF8ZZDCG5HvvW1DMXTvwVzA5kmwd/6U+LqVlMFRRcSoffbVCfdk6Pks1Zi2UTN5ZS+lUyYFfcon1p+1WMUGCVsWXALlXAE1vw9e024UM9zcE/wu3ivCCjMYzKdr431CsEDjCzRvm2f7ynZEa6Yo02p+jG3AlaodrkFNPFdDv4mhVhlV1XorwPGqrvBYVK0QcL2MZm1VlYo6fdsa1AmzFKL33Qdv6MPN/lRavSMDn0/uxcjObtfzPoLvx0BHP5ZbGDrpIKg0LPXB/Tm4Of6yhhlDo8YV0nDcK1YYe61UNi+e/SqOA3epzEoELKCPqQIeIWkmP+T0ZQN5/p5ykqQVbT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(83380400001)(33656002)(64756008)(7416002)(186003)(26005)(71200400001)(4744005)(316002)(4326008)(54906003)(8936002)(66556008)(6506007)(478600001)(53546011)(15650500001)(2906002)(8676002)(5660300002)(6512007)(6486002)(2616005)(86362001)(76116006)(6916009)(66446008)(66946007)(36756003)(66476007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?T2tpNTErU2V3YUowbVRVb2JFNXFHcVZ4QzdibG1IRUs2bTFwYnFMYVJXYzNw?=
 =?utf-8?B?TXVlMUtMV2hqd1RZZWtSdlllT0NKZlU4Y0JoNEQzWkxWdCtRZEtPcVgrY2xn?=
 =?utf-8?B?ZTA1VkEwRmYvSGZJcGZEOU9lQjcwQVNoRnE1MmZKYUNjOFNLc0FtVVJiL2ZL?=
 =?utf-8?B?K1lyckg0b0ROTTFGMXZNVS9VZ3NYUmlXYlMxdGdSMlJ1RUVDaXRCZSs3UWpE?=
 =?utf-8?B?ZTR3MVBEN2RnVm5lamphL2FORmJ2cVlUY05pZUZFMEw3SFBmSURONFJxWnla?=
 =?utf-8?B?RStxc0JVc0NOWnNiV2tyZThFWTJLcUxzZWxLTXJuTzh3SkJXT21hMWQrYllL?=
 =?utf-8?B?MXpjYnlNV3g4T2xSMGVYTnhkemRldC9oUHZHSGl5Vi9qOXhTVVBpNG16eHhz?=
 =?utf-8?B?amhzWE9VSnltcDErWkJjUWIrcHJxV1FaZ3NLWEZ0ekRXWm9jZk9EVWxBZGNK?=
 =?utf-8?B?dkRsNkJ4ZEFoNnUrc0pJUno2Y3dEWDlQbXZVZXVEOExPejI4NG5EdzdPbVV0?=
 =?utf-8?B?Nm1Ja1poNUF6dllpdFNoeUJVUjBpaWMwcTU0d3c4dDJpUkZEWHdmTlhvenlD?=
 =?utf-8?B?VzhjVXhidTZaZldmbkdYVFk3NHRkcXl4NzU3NURSUGNscElrWmI3by9YT3Qv?=
 =?utf-8?B?VzRVeWcreDh5d3ZueExvelBoVXNjQjVDU0xmU3lQbm5aQ0xqSEU4bXhidStx?=
 =?utf-8?B?SHUxOUxYMGNjOUpWTXMvQVhwWm14T25oWWhhZ3VndVlQOWNZNGhFWHFRMnc1?=
 =?utf-8?B?RnNsRWdKVVlYV3JZM0szb3VlRjJOVGZEU1R1Qzl1Z1BsUXh6ZFNiOGdnL1BY?=
 =?utf-8?B?aEF4N0lNcHpiZ1JYeXFKaUFZTUl3cVdFbnpBWmRjOHJQRkVWeENaRmJVY285?=
 =?utf-8?B?eDlhN1NzaTRDeWp2cHoyaDN4Uk8xalJscEkxS0ZDNUhMbVdUZkJyc2NSbUx5?=
 =?utf-8?B?UWtMZWd3RXJiMXJyeGRKcXZRWms4MXM3aWU1UDhkaXZlYjFWM3M3c3U2VUo0?=
 =?utf-8?B?ODBYM3pxT0d0YXhiYUpMVHZOa2xESkdtYkFZYm5ocDB2cE1mak9uVEFwQlFO?=
 =?utf-8?B?ckhLeEd1M3JYM28waFgzYXA4Y0tRRTB2dHNqaVpmYmwyR0VEUVU2MXp5QnlQ?=
 =?utf-8?B?MGpkbWlSNXFPcU9ycGExbXdFc0ptZENZYUhRdko0ZGZ0a2JDbDVwQUxKcHVx?=
 =?utf-8?B?aEZud3hLVzFYTlIwTDM3RFplNFlEUm1EV25uSUtCRTZiMlhnRHFodndpTWk2?=
 =?utf-8?B?UWdBWC9vZTVJUUlzUWJBRnlYY28vM2tqWEUzT3VOLytmcWI3a0d6TlRHMk5G?=
 =?utf-8?Q?0Nxllsbc+P+YjU97bLwY6VtsZhAZGxR5zJ?=
Content-ID: <8169A93417E9C04C89E2154B1B0A0006@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b95f06-7ce6-458c-17c9-08d8a15f9cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 01:12:09.3946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YB0Tsq8wTCIgHfsDRhIDOWVof8TDUtdva8eC8gxzUbNSt/kbk6Pg7hY3Or3bA+XW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2488
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_13:2020-12-15,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 mlxlogscore=883 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160003
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: apana.org.au]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kpLMv-00F8kM-JN
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
From: Nick Terrell via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nick Terrell <terrelln@fb.com>
Cc: Christoph Hellwig <hch@infradead.org>, Petr Malat <oss@malat.biz>,
 "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Eric Biggers <ebiggers@kernel.org>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gRGVjIDE1LCAyMDIwLCBhdCA0OjU4IFBNLCBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMTYsIDIwMjAgYXQg
MTI6NDg6NTFBTSArMDAwMCwgTmljayBUZXJyZWxsIHdyb3RlOg0KPj4gDQo+PiBUaGFua3MgZm9y
IHRoZSBhZHZpY2UhIFRoZSBmaXJzdCB6c3RkIHBhdGNoZXMgd2VudCB0aHJvdWdoIEhlcmJlcnTi
gJlzIHRyZWUsIHdoaWNoIGlzDQo+PiB3aHkgSeKAmXZlIHNlbnQgdGhlbSB0aGlzIHdheS4NCj4g
DQo+IFNvcnJ5LCBidXQgSSdtIG5vdCB0b3VjaCB0aGVzZSBwYXRjaGVzIGFzIENocmlzdG9waCdz
IG9iamVjdGlvbnMNCj4gZG9uJ3Qgc2VlbSB0byBoYXZlIGJlZW4gYWRkcmVzc2VkLg0KDQpJIGJl
bGlldmUgSeKAmXZlIGFkZHJlc3NlZCBDaHJpc3RvcGgncyBvYmplY3Rpb25zLiBIZSBzdWdnZXN0
ZWQgY3JlYXRpbmcNCmEgd3JhcHBlciBBUEkgdG8gYXZvaWQgY2hhbmdpbmcgY2FsbGVycyB1cG9u
IHRoZSB6c3RkIHVwZGF0ZS4gSeKAmXZlIGRvbmUNCnRoYXQsIHRoZSBvbmx5IGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgY3VycmVudCBBUEksIGFuZCB0aGUgY2hhbmdlcyBJ4oCZdmUNCnByb3Bvc2Vk
IHBhdGNoIDEsIGlzIHRoYXQgSeKAmXZlIGNoYW5nZWQgdGhlIHByZWZpeCBmcm9tIFpTVERfIHRv
IHpzdGRfIHRvDQphdm9pZCBjb25mbGljdHMgJiBjb25mdXNpb24gd2l0aCB0aGUgdXBzdHJlYW0g
enN0ZCBBUEkuDQoNCkNyaXN0b3BoLCBpZiB5b3UgZ2V0IGEgY2hhbmNlIHRvIHRha2UgYSBsb29r
IGF0IHRoZXNlIHBhdGNoZXMsIHBsZWFzZSBsZXQNCm1lIGtub3cgd2hhdCB5b3UgdGhpbmsgYWJv
dXQgdGhlIGN1cnJlbnQgaXRlcmF0aW9uIG9mIHBhdGNoZXMsIGFuZCBpZiBJ4oCZdmUNCmFkZHJl
c3NlZCBhbGwgb2YgeW91ciBjb25jZXJucy4NCg0KQmVzdCwNCk5pY2sKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

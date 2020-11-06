Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 043452A9CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 19:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m2/lxEmXL+kC1AfrKflNgngYrrdTvOKh/E6g0ina0vY=; b=TQIshzYl/RHW+qWrJLD8MOK6U
	6tkOeeM9iB1Y1Jmod7Gfq8PY06rBbLLiO6ioV1J1TbO2gzlRa44YWN4gYL9WjXQmaGGk1mbZ7Q8TV
	ETMfpUv05WPd6FGLdCJd5ouhnWp9bclS6Gx30noJXcV1fA7msU8xKo/61bV0P7BOyuuvU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kb6pW-00005k-8u; Fri, 06 Nov 2020 18:51:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=8579cd6876=terrelln@fb.com>)
 id 1kb6pU-00005D-Sj; Fri, 06 Nov 2020 18:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G16dLQtFhCMRyr26RpSW9m/UBD3F6gQhulJDeRhz/U0=; b=lEjdarZ46AVbas5Ofg0z6KjZqW
 3KHjVWWVia7V5L+2iHvQEnntL23G73OOjuWtwPoPtEbCax81xdWCU6Ms6fiPz/uc764SteEMKkOUO
 4XnPtfHEafYjulF8gIVayIqJtigW3Jtg0O2QRgceoT7mUq/iO0kvE/MvAjufQNPv7oBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G16dLQtFhCMRyr26RpSW9m/UBD3F6gQhulJDeRhz/U0=; b=hh90gRMKSGeNcNQwFWr1z+Aq+D
 CBQwlTeofdnBPjC8rq/RC5qV9swv3p9gYikoA340/AjcrgZ3Tut8CjpsbePWD1p/JTkSNeY31ylDq
 OuT/Z0a5gZjsp+LM3V2m4UEXPHJzOwvRh/3ylINRJzBcB8oshzzU3FlmM+Aj0aqkAnno=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kb6pR-003ay3-3V; Fri, 06 Nov 2020 18:51:20 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6ImkmH021329; Fri, 6 Nov 2020 10:51:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=G16dLQtFhCMRyr26RpSW9m/UBD3F6gQhulJDeRhz/U0=;
 b=jBqZ7Xrj3qhwIDwPxBwLYepBrn03jhJg/83f4BHw8CU5HqEHnvlXsnUfN3t3CKh/tXdJ
 dXJ+JcLdUnYcWqaLPkKJlA3Fn/pG6K744jDOcEhUA+GgZJnjLiErXbqJe391KjL0oohd
 2sh3rdGux/9qDs6DuyQwxPUWJZKr8fsBUrQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34mr9bdn6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 06 Nov 2020 10:51:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 6 Nov 2020 10:51:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKPox+19uYKAL7lx1erGVqHnD3ZQzQMkvadMO+p7/6GlNQVX6uvHoD5RSdPIeLDUP//3D6er4sIAMp+dQbvdYeaU8xOJxrXGbCtu15fsP2sht6y0Ef/f0lEI1GzwEBNZ9AyCAbzMqbccaKaXNm9c6sVvtfbSLjFzCzDofn/775wssZwe7Zca+i2ngriBifZwNjz4VvxqwCX6y783BSM1YRYA/LXpFmqjaamcQnMTqE83punbQph1Tn2m0MQc9XpG4KOAqLekUFWq4ldPHfYXUyoNoTthvZ8q0Vk6xU8kAQ4cC1hhdDFu8kGrCErcnJNPRLzplCjcD+vcON152KAedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G16dLQtFhCMRyr26RpSW9m/UBD3F6gQhulJDeRhz/U0=;
 b=k46Qhw2BZas6cwkSYWbJvjiwMlvljP1qCMIRcQqUpH9E+qudAgRseC42ztrDWlHDwKk6FiexB8LHVc84B8+uVOfISSgoCEdOx8KeItuXo9yp3sw9Fo3HeW7LOOoDmqjaKNupepunt1mPm0rzotF6BG1NMaZ43fCcBGZLp7kl8dV1Xa6Y78hOtv0LGpKAP/Y8USeW6YSzlgpKevOIuLfiH5SKaDtNXDn7w+DGtZ92FOnJOresOkbVm1J9AnKon01MzTBNKCRDRkM07K2H8PVVXyp2MmIWF3x2smdAFNoBLheRTKzfTQ/Yyp3TVCBKBzDwYMFFFda8E3aNAKkdmERmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G16dLQtFhCMRyr26RpSW9m/UBD3F6gQhulJDeRhz/U0=;
 b=Qq0ExCqUjMUVYweygF43/YL/H1bOVQVGiIgblzL5PWcDCVS7IUvYEqqj9nyqp77pJfZwsX0AMhTzCzvmWCO5+l7rU8bNZtL8HAaiO+QcJn9WJI1xlq/Z58H+epEvBO/qxhzJz7Q14V2FnQCwKceacOq5fY5jV1/EamQilkqqmNE=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2264.namprd15.prod.outlook.com (2603:10b6:a02:8a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 18:51:02 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 18:51:02 +0000
To: Josef Bacik <josef@toxicpanda.com>
Thread-Topic: [GIT PULL][PATCH v5 0/9] Update to zstd-1.4.6
Thread-Index: AQHWsabYVo88ftkvF06GySx18fZqPqm7XZQAgAAaqYA=
Date: Fri, 6 Nov 2020 18:51:02 +0000
Message-ID: <6D8DAFAA-0442-470B-B58A-6EBD72E39AF6@fb.com>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <025719a2-2432-8204-201f-adbbd293fa9a@toxicpanda.com>
In-Reply-To: <025719a2-2432-8204-201f-adbbd293fa9a@toxicpanda.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: toxicpanda.com; dkim=none (message not signed)
 header.d=none;toxicpanda.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1279f163-95ef-46cf-3ec6-08d88284e898
x-ms-traffictypediagnostic: BYAPR15MB2264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB226463FAAD7A29033369470BABED0@BYAPR15MB2264.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oyv+B4ofz8QF015alIOS08gpagp6oVGn2NU8+o2ITp7nIDatoi7gLB6uXa/ROQ++urRbr77csBkQvEYDfajyqchnvSt2zxVPvqvZub26wgiic1jbKj7VCMnft0mlf8YVoc5RMMCw7RH2GzRaddki/I0T7pHc/FyU6ryOCxVm6NltvI1V5gsMiUgys4KFohbyVi0HlnMXZ03zoXRh8ib6qd1cjbzMGh+qU4AtctoPSbJE3EVdsSU4ZrTTKhNB5/DRVPTzbbB3t0KzFIvu3DdY7J5AGa7+7qAidAIeRhACWOceP6FqdSfTjvIQxbG+RCK/gTOThUkueEeIdWzSMIjkIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(136003)(396003)(366004)(33656002)(66446008)(6512007)(15650500001)(53546011)(36756003)(64756008)(6506007)(4326008)(83380400001)(26005)(186003)(76116006)(66946007)(66556008)(66476007)(2906002)(6486002)(478600001)(316002)(54906003)(8936002)(86362001)(8676002)(6916009)(5660300002)(71200400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EbeaqRgtq5fne9H3in8ycCYIllSGRHbmdZw7ow+gSvbwx6+GH3jcJYJS7lxdaHsEc1CVF3a3yiQxbMECdrRbY9jSw9RyONMQ5EELW5B3PwQuU7lY8g7V6vriJMQr33QEfcMwpQAHF6d+Tdy52zPcXUpxWDOaBlEgm5z8gfpwZqmFK0JENzoTVTwNEUDDAGcnTPKB6oXFc0PmEm9wLy7yjkMNlDS2n0WgOSddE1a/GVOm7NXgOcLTs22uOzCNyPFEcvqoWo/uIcn2gtryQESfm7Sok4yB/0LazEVSdOmnLjx6eLuwzjhKfPMTrzlUk7NY6Df2tpc0ANlU/iJUxb09AuRoH8JAJIPPTcgNreV14iig7ZXZ7gmeOX3zod0LBhsSG1n/9XjKfOyMmbLOI23mygsyFuJqWS7CsWiINcRU5jPllsEA+i1s7FyPGwc9p7J92LcaromtWIY4HbZXTstVXnA2U9M6rwGwbR9/TeqJYwM9wF0Glx7iQ3sfwq9xbsEcYxt8uC9MuyHoiy7OQJ4klAOTYsoB0iGj67rmwONtTQVU+VZmjwEeWPzczpsdz4iGLFotDjtwpjayVR2Ubl6x0MrNbH3suWtSzW3CfhiF1p9HTN4q8lhzTCTuedNcLndALwWyIG6HU5f+be3Nkz6G7g==
Content-ID: <2876C9A351E1824BB447C209E0C8325A@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1279f163-95ef-46cf-3ec6-08d88284e898
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 18:51:02.0162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1QjEP+g3GgS4NVNNO60o/a16Y3dl+eRSa8vM78dT4HjpUj/G/eEBjZ9x3vCzoeO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2264
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060133
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kb6pR-003ay3-3V
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v5 0/9] Update to zstd-1.4.6
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiBOb3YgNiwgMjAyMCwgYXQgOToxNSBBTSwgSm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFu
ZGEuY29tPiB3cm90ZToNCj4gDQo+IE9uIDExLzMvMjAgMTowNSBBTSwgTmljayBUZXJyZWxsIHdy
b3RlOg0KPj4gRnJvbTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+PiBQbGVhc2Ug
cHVsbCBmcm9tDQo+PiAgIGdpdEBnaXRodWIuY29tOnRlcnJlbGxuL2xpbnV4LmdpdCB0YWdzL3Y1
LXpzdGQtMS40LjYNCj4+IHRvIGdldCB0aGVzZSBjaGFuZ2VzLiBBbHRlcm5hdGl2ZWx5IHRoZSBw
YXRjaHNldCBpcyBpbmNsdWRlZC4NCj4gDQo+IFdoZXJlIGRpZCB3ZSBjb21lIGRvd24gb24gdGhl
IGNvZGUgZm9ybWF0dGluZyBxdWVzdGlvbj8gIFBlcnNvbmFsbHkgSSdtIG9mIHRoZSBtaW5kIHRo
YXQgYXMgbG9uZyBhcyB0aGUgY29uc3VtZXJzIHRoZW1zZWx2ZXMgYWRoZXJlIHRvIHRoZSBwcm9w
ZXIgY29kaW5nIHN0eWxlIEknbSBmaW5lIG5vdCBtYWludGFpbmluZyB0aGUgY29kZSBzdHlsZSBh
cyBsb25nIGFzIHdlIGdldCB0aGUgYmVuZWZpdCBvZiBlYXNpbHkgc3luY2luZyBpbiBjb2RlIGZy
b20gdGhlIHVwc3RyZWFtIHByb2plY3QuICBUaGFua3MsDQoNClRoZSBnZW5lcmFsIGNvbnNlbnN1
cyBvZiBldmVyeW9uZSB3aG8gaGFzIGJlZW4gaW52b2x2ZWQgaW4gdGhlIGRpc2N1c3Npb24gc28g
ZmFyLCBzZWVtcyB0byBiZSB0aGF0IHRoZSBiZW5lZml0cyBvZiBrZWVwaW5nIHpzdGQgaW4tc3lu
YyB3aXRoIHVwc3RyZWFtIG91dHdlaWdoIHRoZSBjb3N0IG9mIGFjY2VwdGluZyB1cHN0cmVhbeKA
mXMgQVBJLCB0aG91Z2ggbm90IGV2ZXJ5b25lIGFncmVlcy4gVGhlIGFsdGVybmF0aXZlIGlzIHRv
IHByb3ZpZGUgYSB3cmFwcGVyIGFyb3VuZCB1cHN0cmVhbeKAmXMgQVBJLCBidXQgdGhpcyBtYWtl
cyBpdCBzbGlnaHRseSBoYXJkZXIgdG8gZGVidWcsIHNpbmNlIHlvdSBoYXZlIHRvIGdvIHRocm91
Z2ggdGhlIHdyYXBwZXIgd2hvc2Ugb25seSBwdXJwb3NlIGlzIHRvIGFkYXB0IHRvIHRoZSBjb2Rp
bmcgc3R5bGUsIGFuZCBhbGxvd3MgYnVncyB0byBzbmVhayBpbnRvIHRoZSBrZXJuZWwgaW1wbGVt
ZW50YXRpb24sIHdoaWNoIGFyZW7igJl0IHByZXNlbnQgdXBzdHJlYW0uDQoNCkFkZGl0aW9uYWxs
eSwgaW4gMjAxNyBMWjQgc3dpdGNoZWQgdG8gdXNpbmcgdXBzdHJlYW0gTFo04oCZcyBBUEkgaW4g
b3JkZXIgdG8gc3RheSB1cCB0byBkYXRlIHdpdGggdXBzdHJlYW0sIHdoaWNoIHNldHMgcHJlY2Vk
ZW50LiBJIGFsc28gaGVscCBtYWludGFpbiBMWjQsIGFuZCBvbmNlIHRoZSB6c3RkIHVwZGF0ZSBp
cyBtZXJnZWQsIEkgcGxhbiB0byB3b3JrIG9uIG1ha2luZyBpdCBlYXNpZXIgdG8gdXBkYXRlIExa
NCBpbiB0aGUga2VybmVsIHdoZW4gdXBzdHJlYW0gdXBkYXRlcy4gVGhhdCB3aWxsIGJlIGEgbXVj
aCBzbWFsbGVyIGNoYW5nZSwgc2luY2UgTFo0IGlzIGFscmVhZHkgbmVhcmx5IHVzaW5nIHVwc3Ry
ZWFt4oCZcyBjb2RlIGRpcmVjdGx5Lg0KDQpCZXN0LA0KTmljawpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

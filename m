Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B979926F569
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 07:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1TmLAi27c9VVW90ZKjvLMA4co3IlupurcNRsuB1TWik=; b=Sy7r7exmuECh6R+O+OeTvn0U1
	NZi/pnRjUjblI5k5kzOtQsEwghdVzU2XZ298dpZWhOC363M8D7f1X/rRl64fBwdmQ8++o+dDNkIKF
	Vq1IV/UeiNOe3d+lTB0iyAFhVa3VZ6jm0a5JvbBMiCsDx3jK4AGqCDgHuYnZ60VWXkcKk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ98R-0003CC-2P; Fri, 18 Sep 2020 05:40:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6530ab2c63=terrelln@fb.com>) id 1kJ98P-0003C3-9U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 05:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=88ThICDo/PY5Hv12Lq5m6LNk0rV5yO1phf/2jzM+EyU=; b=i31PsL6/ZWRxYzFc7nI4lo9zNY
 kXRGcnY7rLDpzbJ8XzW7Ct5GzV3zJeab+IKWYMiOe9EJq0YGeUJZkxCvPYo3AZJUtrAn/+FkEvOg8
 970qWUShjhHBdXEamKsoSL6eckBksX/wdEcVTiFRwJAA5hlTGQl7l33WMMxYJ+3NwcDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=88ThICDo/PY5Hv12Lq5m6LNk0rV5yO1phf/2jzM+EyU=; b=X/D3A5m8rPLCO8Qj7W1YnSqeDC
 ecucWiegMEWZg/BU2gntGYfQlwUi5xGeQTorXeeqCB5CbQKoeR2y+YAPY9geMbVaM8RP+fQnAED33
 EmcvfuSBLlA9PCJPQAPW9LJr6QcAGTSZfwo2CalS4U9Ht8E1Afi0cNBP+/YSbKSIBa38=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ98F-00DoZY-Ks
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 05:40:37 +0000
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08I5YPaF028409; Thu, 17 Sep 2020 22:39:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=88ThICDo/PY5Hv12Lq5m6LNk0rV5yO1phf/2jzM+EyU=;
 b=DbAMQURHlR5jVTE9SUWRjNSBToiha+ESxYywyEb+fMKS5HDtb6Vpl17Am+1AccQlmefT
 37r0rWx4JUcaiZMMcp/89/MRs+tuAUKGeM2DoKGsV48KKuU/qOMZY3uscnYpaCaSs6oD
 Vav2qlPLq8VoJZC1VFMLCDY0G/K27C4WGeE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33mc4mawr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Sep 2020 22:39:23 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 22:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwTEIE4z1MP7yOvX+WTV1ecQ3BxgzBwEt2aubFrtNjRFrkf4o97E+ID7xwUP2zy7UCYLCPenhWSWE6+Ygpa7RK4pMbkpdRR1mXCzpNSkmTtAkOe8z3cvOzMCvJuWKr7ibB5p8Z4wzUTxvruz8tROo4ts78sU3OrAMf5dfh9smjx1Q0j4sNI2F+Ni6ngzKA1XrfaY01i69+Se44Q942GCLj7ZBP6k4JkLIbk6XhqL1AhPUOYejt4+OWmxWaJU8nUQxJAi3wLUYiLQIYbH+Ve98ykO4B93iIphEEQfYoeVFLxgGZQnXGNF43arIkOCKMzpa/roQwelo7gu2pYVhKJ6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88ThICDo/PY5Hv12Lq5m6LNk0rV5yO1phf/2jzM+EyU=;
 b=OnumMNpS33GSMeJtMog69qNXENqni1gYBpbp+Mu+fKVPxB549YwruUsMPo+QIRdzm1BafRxKxuM/ulyGdYiLqLVnk5z6hx+f+s7er2MfwqMQtWCb7ED5istvxxH1Pq6FQJc5/H7FdxnudTsV/Q8Yxy2Q4ilDIww7ab3r0J82z9l7pVYWhtoMitnBhQBUoLKy4aJw14d2fc0rIyffen5ICU/xZ3rSz2OaKzLfVvVIVkxmQPMsrr50ykSrfMgN+8epEk+uJcWq8i0xaRhEOM2lPNuaSuG7ZrLhp082Y59ojZF0r+QG+cSBxu99TtHAQR2HxduMBtIuQyZ+oeVm4y3ZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88ThICDo/PY5Hv12Lq5m6LNk0rV5yO1phf/2jzM+EyU=;
 b=OuImp84/e1gvCzbH+JphyoyOuDszbAJC4Hsn2ALCC06SxNVWDXKFd0x36d9hpY1CbwrcALasu322kaEYgLmFVBFeq9yVfSF9ax3B+6CI69GfF40F0Kd0avIJ08KI/Z0Vqh295bT7i/WfJQ+xfWJb/+uXMmd2b39XMXPnPVNTGU0=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3255.namprd15.prod.outlook.com (2603:10b6:a03:107::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 05:39:18 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 05:39:18 +0000
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
Thread-Index: AQHWi9ufSzGQbs/fgE+hHGtC5Bpw36lqzjGAgADLbACAAMcngIAAwGaAgAAaVYCAAGgiAIAAQMCA
Date: Fri, 18 Sep 2020 05:39:18 +0000
Message-ID: <6137F1A4-770E-421D-9B76-1E47A86DC38E@fb.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
 <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
 <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
 <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
 <9589E483-A94B-4AF6-8C03-B0763715B40A@fb.com>
 <a8b6e21d-fb51-1a50-8f2a-045f3a496c12@huawei.com>
In-Reply-To: <a8b6e21d-fb51-1a50-8f2a-045f3a496c12@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c28fed5-cea3-40fc-fbd6-08d85b952fbe
x-ms-traffictypediagnostic: BYAPR15MB3255:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB325555E007C6801AA1C6A952AB3F0@BYAPR15MB3255.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDB76O9XUU/c2AUZeH4FPrCwyR9k+pfWOPQCQczv7/iJiqOuDL+UJSu9WlnSnwxtTnNfHMBRAC3jzzEKSDYu300zz6trAYCaC0Bdslfx/gV7dhqFQ7vT6JOoIOSohjr9FbGMTaMrtUWVAbtpvZw3zNrQgoW9vffzUuZDm4UkDDthY7P2EG6SmSSWs3Nu9QUo4SkEQ3kKX88SGI6fjywNeRLXtWoIZqDQE4V+EZPQZ3OZNkuYQrEKECW9jIeUu2UrumjA22jRWDOnlyJzpKEiGZ68eLNt9LL7Q0ey9h334OX8Z+CtqNWcdYgcwGNg302wyX0BbGlqjRUdb2/ZEWjsPloJpHS1YZluAqg4wVcHtq6occCT2HJUIAe+0vjxA14yWZMG4VVZkLF7gJnhMvOqPiASsxAP7gL2TDh5a6jaXyY2bsNDCwr5HtuU3ZuxL9kSXNPqSL5zv8dM+UeQ65lwNwVVYFMJnl/BdxQ2i14dV+A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(8676002)(30864003)(6486002)(6916009)(86362001)(71200400001)(966005)(5660300002)(66556008)(66946007)(6512007)(76116006)(66476007)(64756008)(66446008)(186003)(6506007)(33656002)(316002)(2906002)(8936002)(36756003)(53546011)(4326008)(478600001)(83380400001)(54906003)(26005)(2616005)(473944003)(414714003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nJvhy1wcyViVRezWq6ZhXWTc82NVPeSSpxwQAFS+Neuz2vC3Slr5MNLXIe713r5uh2363dWag9NDXxk4GMSnFq6UfsP+lItsQIkkTnO6ZzZdD9SWrh1UEiiK20lRx2mUH1oJmP5eX05AhVxVDCk/qAuk7wOBU7oDDjxEI0wNSiFZCNs1lgVBPE4nveuQLnDz/OPZNr0VQP+m8p1HYK1Qhawf6pcYmvUr85S6BQI1L03xnZwFxoNEP6peEnsDmXxviX+4lzHFRz37Yx030S0pquvUy+LMX8X6DGVErumj8vD7wzqvP1RbghNXqB9phHfnvuPlUk1iI6LeyNwXIoo3UQc6Q8bCkgnqU7gAsud1zpb9cncV3eTAeBNtnuFVjQqrSmDu3qPMCVVB9jlbuOZ8sbdzoUKBPdb361Pe+D1qIZesjtkSDnb170hsI3ZN6trgXa9wcVFIysk/r0+iuZM7KLNepoAY0rRHesyL1Wr0wLwKaN5RMmJoe/i3X90a47j0n0aD/MPCJCWMuoGygoRI0NLVrHBaQVyJHhrQgu/4JqKsPIqD0g3jV7JOSbP4CNII5TES88jq91gvig0yR8cJ64A5eL5pTvyJwE/M95eh+cJVPva1XhWi5YBK8JbOjyqntn98bZ5VulP7gUMsdAj5Vw==
Content-ID: <7F7D19BAA954A74AAC86A86B43B731A0@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c28fed5-cea3-40fc-fbd6-08d85b952fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 05:39:18.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFrCBcoxasBu9nUFMkpaHwBh6wOXLM6UrAsTg3ZCHmz07telLxG7qf6KD+bfB9q9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3255
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_05:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180048
X-FB-Internal: deliver
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.1 BODY_ENHANCEMENT2      BODY: Information on getting larger body parts
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kJ98F-00DoZY-Ks
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
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
Cc: Johannes Weiner <jweiner@fb.com>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gU2VwIDE3LCAyMDIwLCBhdCA2OjQ3IFBNLCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdl
aS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAyMC85LzE4IDM6MzQsIE5pY2sgVGVycmVsbCB3cm90
ZToNCj4+PiBPbiBTZXAgMTcsIDIwMjAsIGF0IDExOjAwIEFNLCBOaWNrIFRlcnJlbGwgPHRlcnJl
bGxuQGZiLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4+IE9uIFNlcCAxNiwgMjAy
MCwgYXQgMTE6MzEgUE0sIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4gd3JvdGU6DQo+Pj4+
IA0KPj4+PiBIaSBOaWNrLA0KPj4+PiANCj4+Pj4gT24gMjAyMC85LzE3IDI6MzksIE5pY2sgVGVy
cmVsbCB3cm90ZToNCj4+Pj4+PiBPbiBTZXAgMTUsIDIwMjAsIGF0IDExOjMxIFBNLCBDaGFvIFl1
IDx5dWNoYW8wQGh1YXdlaS5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IEhpIE5pY2ssDQo+
Pj4+Pj4gDQo+Pj4+Pj4gcmVtb3ZlIG5vdCByZWxhdGVkIG1haWxpbmcgbGlzdC4NCj4+Pj4+PiAN
Cj4+Pj4+PiBPbiAyMDIwLzkvMTYgMTE6NDMsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4+Pj4g
RnJvbTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+Pj4+Pj4+IE1vdmUgYXdheSBm
cm9tIHRoZSBjb21wYXRpYmlsaXR5IHdyYXBwZXIgdG8gdGhlIHpzdGQtMS40LjYgQVBJLiBUaGlz
DQo+Pj4+Pj4+IGNvZGUgaXMgbW9yZSBlZmZpY2llbnQgYmVjYXVzZSBpdCB1c2VzIHRoZSBzaW5n
bGUtcGFzcyBBUEkgaW5zdGVhZCBvZg0KPj4+Pj4+PiB0aGUgc3RyZWFtaW5nIEFQSS4gVGhlIHN0
cmVhbWluZyBBUEkgaXMgbm90IG5lY2Vzc2FyeSBiZWNhdXNlIHRoZSB3aG9sZQ0KPj4+Pj4+PiBp
bnB1dCBhbmQgb3V0cHV0IGJ1ZmZlcnMgYXJlIGF2YWlsYWJsZS4gVGhpcyBzYXZlcyBtZW1vcnkg
YmVjYXVzZSB3ZQ0KPj4+Pj4+PiBkb24ndCBuZWVkIHRvIGFsbG9jYXRlIGEgYnVmZmVyIGZvciB0
aGUgd2luZG93LiBJdCBpcyBhbHNvIG1vcmUNCj4+Pj4+Pj4gZWZmaWNpZW50IGJlY2F1c2UgaXQg
c2F2ZXMgdW5uZWNlc3NhcnkgbWVtY3B5IGNhbGxzLg0KPj4+Pj4+PiBJJ3ZlIGhhZCBwcm9ibGVt
cyB0ZXN0aW5nIHRoaXMgY29kZSBiZWNhdXNlIEkgc2VlIGRhdGEgdHJ1bmNhdGlvbiBiZWZvcmUN
Cj4+Pj4+Pj4gYW5kIGFmdGVyIHRoaXMgcGF0Y2hzZXQuIEhlbHAgdGVzdGluZyB0aGlzIHBhdGNo
IHdvdWxkIGJlIG11Y2gNCj4+Pj4+Pj4gYXBwcmVjaWF0ZWQuDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2Fu
IHlvdSBwbGVhc2UgZXhwbGFpbiBtb3JlIGFib3V0IGRhdGEgdHJ1bmNhdGlvbj8gSSdtIGEgbGl0
dGxlIGNvbmZ1c2VkLi4uDQo+Pj4+Pj4gDQo+Pj4+Pj4gRG8geW91IG1lYW4gdGhhdCBmMmZzIGRv
ZXNuJ3QgYWxsb2NhdGUgZW5vdWdoIG1lbW9yeSBmb3IgenN0ZCBjb21wcmVzc2lvbiwNCj4+Pj4+
PiBzbyB0aGF0IGNvbXByZXNzaW9uIGlzIG5vdCBmaW5pc2hlZCBhY3R1YWxseSwgdGhlIGNvbXBy
ZXNzZWQgZGF0YSBpcyB0cnVuY2F0ZWQNCj4+Pj4+PiBhdCBkc3QgYnVmZmVyPw0KPj4+Pj4gSGkg
Q2hhbywNCj4+Pj4+IEnigJl2ZSB0ZXN0ZWQgRjJGUyB1c2luZyBhIGJlbmNobWFyayBJIGFkYXB0
ZWQgZnJvbSB0ZXN0aW5nIEJ0ckZTIFswXS4gSXQgaXMgcG9zc2libGUNCj4+Pj4+IHRoYXQgdGhl
IHNjcmlwdCBJ4oCZbSB1c2luZyBpcyBidWdneSBvciBpcyBleHBvc2luZyBhbiBlZGdlIGNhc2Ug
aW4gRjJGUy4gVGhlIGZpbGVzDQo+Pj4+PiB0aGF0IEkgY29weSB0byBGMkZTIGFuZCBjb21wcmVz
cyBlbmQgdXAgdHJ1bmNhdGVkIHdpdGggYSBob2xlIGF0IHRoZSBlbmQuDQo+Pj4+IA0KPj4+PiBU
aGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIDopDQo+Pj4+IA0KPj4+Pj4gSXQgaXMgYmFzZWQg
b2ZmIG9mIHVwc3RyZWFtIGNvbW1pdCBhYjI5YTgwN2E3Lg0KPj4+Pj4gRS5nLiB0aGUgZW5kIG9m
IHRoZSBjb3BpZWQgZmlsZSBsb29rcyBsaWtlIHRoaXMsIGJ1dCB0aGUgb3JpZ2luYWwgZmlsZSBo
YXMgbm9uLXplcm8gZGF0YQ0KPj4+Pj4gSW4gdGhlIGVuZC4gVW50aWwgdGhlIGhvbGUgYXQgdGhl
IGVuZCB0aGUgZmlsZSBpcyBjb3JyZWN0Lg0KPj4+Pj4gb2QgZGlja2VucyB8IHRhaWwgLW4gNQ0K
Pj4+Pj4+IDQ2NjY3NzYwIDA2NzUwMiAwNjYxNjcgMDIwMDU2IDA0MDQ0MCAwMjAxNjMgMDIzNTEx
IDAwNjU1NSAwNjA0MTINCj4+Pj4+PiA0NjY3MDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAw
MDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwDQo+Pj4+Pj4gKg0KPj4+Pj4+IDQ2NzAzMDYw
IDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMCAwMDAwMDAgMDAwMDAwIDAwMDAwMA0KPj4+Pj4+
IDQ2NzAzMDc2DQo+Pj4+PiBbMF0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vdGVycmVsbG4vN2Rk
MjkxOTkzN2RmYmRiOGU4MzllNGFkMTFjODFkYjQNCj4+Pj4gDQo+Pj4+IFNob3VsZG4ndCB3ZSBq
dXN0IGdldCBzaGExIHZhbHVlIGJ5IGZsaXRlcmluZyBzaGExc3VtIG91dHB1dD8NCj4+Pj4gDQo+
Pj4+ICAgICAgICAgICAgICAgYXNoYT1gc2hhMXN1bSAkQkVOQ0hNQVJLX0RJUi8kZmlsZSB8YXdr
IHsncHJpbnQgJDEnfWANCj4+Pj4gICAgICAgICAgICAgICBic2hhPWBzaGExc3VtICRNUC8kaS8k
ZmlsZSB8YXdrIHsncHJpbnQgJDEnfWANCj4+PiANCj4+PiBQcm9iYWJseSwgYnV0IGl0IHdhcyBq
dXN0IGEgcXVpY2sgb25lLW9mZiBzY3JpcHQuDQo+PiBBaCwgbmV2ZXIgbWluZCwgeW91IGFyZSBy
aWdodC4NCj4+Pj4gSSBjYW4ndCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBieSB1c2luZyBzaW1wbGUg
ZGF0YSBzYW1wbGUsIGNvdWxkIHlvdSBzaGFyZQ0KPj4+PiB0aGF0ICdkaWNrZW5zJyBmaWxlIG9y
IG90aGVyIHNtYWxsZXItc2l6ZWQgc2FtcGxlIGlmIHlvdSBoYXZlPw0KPj4+IA0KPj4+IFRoZSAv
dG1wL3NpbGVzaWEgZGlyZWN0b3J5IGluIHRoZSBleGFtcGxlIGlzIHBvcHVsYXRlZCB3aXRoIGFs
bCB0aGUgZmlsZXMgZnJvbQ0KPj4+IHRoaXMgd2Vic2l0ZS4gSXQgaXMgYSBwb3B1bGFyIGRhdGEg
Y29tcHJlc3Npb24gYmVuY2htYXJrIGNvcnB1cy4gWW91IGNhbg0KPj4+IGNsaWNrIG9uIHRoZSDi
gJx0b3RhbOKAnSBsaW5rIHRvIGRvd25sb2FkIGEgemlwIGFyY2hpdmUgb2YgYWxsIHRoZSBmaWxl
cy4NCj4+PiANCj4+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9
aHR0cC0zQV9fc3VuLmFlaS5wb2xzbC5wbF8tN0VzZGVvcl9pbmRleC5waHAtM0ZwYWdlLTNEc2ls
ZXNpYSZkPUR3SURhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj1IUU01SVFkV09COFdhTW9p
aTJkWVR3Jm09LWJZYTdUYXZSb2RsOTZ4eTY1aGpWSWt0NUhkTWxkdjRMT0NSSEpmMTJuOCZzPW1k
WDgyckN6eUhPLVEzS0dKNWI5NG1xREtjRGgxSVdFcUVXZnVxdzdQM0kmZT0gDQo+Pj4gLU5pY2sN
Cj4+IEnigJl2ZSBzcGVudCBzb21lIHRpbWUgbWluaW1pemluZyB0aGUgdGVzdCBjYXNlLiBUaGlz
IHNjcmlwdCBbMF0gaXMgdGhlIG1pbmltaXplZA0KPj4gdGVzdCBjYXNlIHRoYXQgZG9lc27igJl0
IHJlcXVpcmUgYW55IGlucHV0IGZpbGVzLCBpdCBidWlsZHMgaXRzIG93bi4NCj4+IFNldmVyYWwg
b2JzZXJ2YXRpb25zOg0KPj4gKiBUaGUgaW5wdXQgZmlsZSBuZWVkcyB0byBiZSA3NzAwNDgxIGJ5
dGVzIGxhcmdlLCBzbWFsbGVyIGZpbGVzIGRvbuKAmXQgdHJpZ2dlciB0aGUgYnVnLg0KPj4gKiBZ
b3UgaGF2ZSB0byBgY2hhdHRyICtjYCB0aGUgZmlsZSBhZnRlciBjb3B5aW5nIGl0IG90aGVyd2lz
ZSB0aGUgYnVnIGRvZXNu4oCZdCBvY2N1ci4NCj4+ICogQWZ0ZXIgYGNoYXR0ciArY2AgeW91IGhh
dmUgdG8gdW5tb3VudCBhbmQgcmVtb3VudCB0aGUgZmlsZXN5c3RlbSB0byB0cmlnZ2VyIHRoZSBi
dWcuDQo+PiBJ4oCZdmUgcmVwcm9kdWNlZCBvbiB2NS45LXJjNSAoODU2ZGViODY2ZDE2ZSkuIEni
gJl2ZSBhbHNvIHJlcHJvZHVjZWQgb24gbXkgaG9zdCBtYWNoaW5lDQo+PiBydW5uaW5nIDUuOC41
LWFyY2gxLTEuDQo+PiBbMF0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vdGVycmVsbG4vNGJiYTMy
NWFiZGZhM2E2ZjAxNGU5OTExYWM5MmExODUNCj4gDQo+IEFoLCBJIGdvdCBpdC4NCj4gDQo+IFN0
ZXAgb2YgZW5hYmxpbmcgY29tcHJlc3NlZCBpbm9kZSBpcyBub3QgY29ycmVjdCwgd2Ugc2hvdWxk
IHRvdWNoIGFuIGVtcHR5IGZpbGUsIGFuZA0KPiB0aGVuIHVzZSAnY2hhdHRyICtjJyBvbiB0aGF0
IGZpbGUgdG8gZW5hYmxlIGNvbXByZXNzaW9uLCBvdGhlcndpc2UgdGhlIHJhY2UgY29uZGl0aW9u
DQo+IGNvdWxkIGJlIGNvbXBsaWNhdGVkIHRvIGhhbmRsZS4gU28gd2UgbmVlZCBiZWxvdyBkaWZm
IHRvIGRpc2FsbG93IHNldHRpbmcgY29tcHJlc3Npb24NCj4gZmxhZyBvbiBhbiBub24tZW1wdHkg
ZmlsZToNCg0KWXVwLCB0aGF0IGRpZCB0aGUgdHJpY2suIEFmdGVyIHRoYXQgY2hhbmdlIEkgd2Fz
IGFibGUgdG8gc3VjY2Vzc2Z1bGx5IHRlc3QgRjJGUy4gSSBmb3VuZA0KYSBidWcgaW4gbXkgY29t
cGF0aWJpbGl0eSB3cmFwcGVycywgc28gSeKAmW0gZ29pbmcgdG8gYmUgc2VuZGluZyBhIFYyIHRo
YXQgZml4ZXMgaXQuDQoNCknigJlsbCBpbmNsdWRlIHRoZXNlIG51bWJlcnMgaW4gbXkgbmV4dCBj
b21taXQgbWVzc2FnZSwgYnV0IHdpdGggdGhlc2UgY2hhbmdlcyBGMkZTDQpkZWNvbXByZXNzaW9u
IG1lbW9yeSB1c2FnZSBkcm9wcyBmcm9tIDEuNCBNQiB0byAxNjAgS0IuIERlY29tcHJlc3Npb24g
c3BlZWRzDQp1cCAyMCUgaW4gdG90YWwgZnJvbSB0aGUgZW50aXJlIHNlcmllcywgYW5kIGNvbXBy
ZXNzaW9uIHNwZWVkcyB1cCA4JS4NCg0KVGhhbmtzIGZvciB0aGUgaGVscCBkZWJ1Z2dpbmcsDQpO
aWNrDQoNCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMNCj4g
aW5kZXggOGE0MjI0MDBlODI0Li5iNDYyZGI3ODk4ZmQgMTAwNjQ0DQo+IC0tLSBhL2ZzL2YyZnMv
ZmlsZS5jDQo+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jDQo+IEBAIC0xODM2LDYgKzE4MzYsOCBAQCBz
dGF0aWMgaW50IGYyZnNfc2V0ZmxhZ3NfY29tbW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHUzMiBp
ZmxhZ3MsIHUzMiBtYXNrKQ0KPiAJCWlmIChpZmxhZ3MgJiBGMkZTX0NPTVBSX0ZMKSB7DQo+IAkJ
CWlmICghZjJmc19tYXlfY29tcHJlc3MoaW5vZGUpKQ0KPiAJCQkJcmV0dXJuIC1FSU5WQUw7DQo+
ICsJCQlpZiAoZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSB8fCBmaS0+aV9jb21wcl9ibG9ja3MpDQo+
ICsJCQkJcmV0dXJuICAtRUlOVkFMOw0KPiANCj4gCQkJc2V0X2NvbXByZXNzX2NvbnRleHQoaW5v
ZGUpOw0KPiAJCX0NCj4gDQo+IENvdWxkIHlvdSBhZGp1c3QgeW91ciBzY3JpcHQgYW5kIHJldGVz
dD8NCj4gDQo+IHRvdWNoICREU1RfRklMRQ0KPiBjaGF0dHIgK2MgJERTVF9GSUxFDQo+IGNwICRT
UkNfRklMRSAkRFNUX0ZJTEUNCj4gDQo+IFRoYW5rcywNCj4gDQo+PiBCZXN0LA0KPj4gTmljaw0K
Pj4+PiBUaGFua3MsDQo+Pj4+IA0KPj4+Pj4gQmVzdCwNCj4+Pj4+IE5pY2sNCj4+Pj4+PiBUaGFu
a3MsDQo+Pj4+Pj4gDQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgVGVycmVsbCA8dGVycmVs
bG5AZmIuY29tPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gZnMvZjJmcy9jb21wcmVzcy5jIHwgMTAy
ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+PiAx
IGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pDQo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMNCj4+
Pj4+Pj4gaW5kZXggZTA1NmYzYTJiNDA0Li5iNzllZmNlODE2NTEgMTAwNjQ0DQo+Pj4+Pj4+IC0t
LSBhL2ZzL2YyZnMvY29tcHJlc3MuYw0KPj4+Pj4+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMN
Cj4+Pj4+Pj4gQEAgLTExLDcgKzExLDggQEANCj4+Pj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2JhY2tp
bmctZGV2Lmg+DQo+Pj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9sem8uaD4NCj4+Pj4+Pj4gI2luY2x1
ZGUgPGxpbnV4L2x6NC5oPg0KPj4+Pj4+PiAtI2luY2x1ZGUgPGxpbnV4L3pzdGRfY29tcGF0Lmg+
DQo+Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvenN0ZC5oPg0KPj4+Pj4+PiArI2luY2x1ZGUgPGxp
bnV4L3pzdGRfZXJyb3JzLmg+DQo+Pj4+Pj4+ICAgI2luY2x1ZGUgImYyZnMuaCINCj4+Pj4+Pj4g
I2luY2x1ZGUgIm5vZGUuaCINCj4+Pj4+Pj4gQEAgLTI5OCwyMSArMjk5LDIxIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZjJmc19jb21wcmVzc19vcHMgZjJmc19sejRfb3BzID0gew0KPj4+Pj4+PiBz
dGF0aWMgaW50IHpzdGRfaW5pdF9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAqY2Mp
DQo+Pj4+Pj4+IHsNCj4+Pj4+Pj4gCVpTVERfcGFyYW1ldGVycyBwYXJhbXM7DQo+Pj4+Pj4+IC0J
WlNURF9DU3RyZWFtICpzdHJlYW07DQo+Pj4+Pj4+ICsJWlNURF9DQ3R4ICpjdHg7DQo+Pj4+Pj4+
IAl2b2lkICp3b3Jrc3BhY2U7DQo+Pj4+Pj4+IAl1bnNpZ25lZCBpbnQgd29ya3NwYWNlX3NpemU7
DQo+Pj4+Pj4+ICAgCXBhcmFtcyA9IFpTVERfZ2V0UGFyYW1zKEYyRlNfWlNURF9ERUZBVUxUX0NM
RVZFTCwgY2MtPnJsZW4sIDApOw0KPj4+Pj4+PiAtCXdvcmtzcGFjZV9zaXplID0gWlNURF9DU3Ry
ZWFtV29ya3NwYWNlQm91bmQocGFyYW1zLmNQYXJhbXMpOw0KPj4+Pj4+PiArCXdvcmtzcGFjZV9z
aXplID0gWlNURF9lc3RpbWF0ZUNDdHhTaXplX3VzaW5nQ1BhcmFtcyhwYXJhbXMuY1BhcmFtcyk7
DQo+Pj4+Pj4+ICAgCXdvcmtzcGFjZSA9IGYyZnNfa3ZtYWxsb2MoRjJGU19JX1NCKGNjLT5pbm9k
ZSksDQo+Pj4+Pj4+IAkJCQkJd29ya3NwYWNlX3NpemUsIEdGUF9OT0ZTKTsNCj4+Pj4+Pj4gCWlm
ICghd29ya3NwYWNlKQ0KPj4+Pj4+PiAJCXJldHVybiAtRU5PTUVNOw0KPj4+Pj4+PiAtCXN0cmVh
bSA9IFpTVERfaW5pdENTdHJlYW0ocGFyYW1zLCAwLCB3b3Jrc3BhY2UsIHdvcmtzcGFjZV9zaXpl
KTsNCj4+Pj4+Pj4gLQlpZiAoIXN0cmVhbSkgew0KPj4+Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0
ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2luaXRDU3RyZWFtIGZhaWxlZFxuIiwNCj4+Pj4+
Pj4gKwljdHggPSBaU1REX2luaXRTdGF0aWNDQ3R4KHdvcmtzcGFjZSwgd29ya3NwYWNlX3NpemUp
Ow0KPj4+Pj4+PiArCWlmICghY3R4KSB7DQo+Pj4+Pj4+ICsJCXByaW50a19yYXRlbGltaXRlZCgi
JXNGMkZTLWZzICglcyk6ICVzIFpTVERfaW5pdHRhdGljQ1N0cmVhbSBmYWlsZWRcbiIsDQo+Pj4+
Pj4+IAkJCQlLRVJOX0VSUiwgRjJGU19JX1NCKGNjLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4+Pj4+
PiAJCQkJX19mdW5jX18pOw0KPj4+Pj4+PiAJCWt2ZnJlZSh3b3Jrc3BhY2UpOw0KPj4+Pj4+PiBA
QCAtMzIwLDcgKzMyMSw3IEBAIHN0YXRpYyBpbnQgenN0ZF9pbml0X2NvbXByZXNzX2N0eChzdHJ1
Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4+Pj4+Pj4gCX0NCj4+Pj4+Pj4gICAJY2MtPnByaXZhdGUg
PSB3b3Jrc3BhY2U7DQo+Pj4+Pj4+IC0JY2MtPnByaXZhdGUyID0gc3RyZWFtOw0KPj4+Pj4+PiAr
CWNjLT5wcml2YXRlMiA9IGN0eDsNCj4+Pj4+Pj4gICAJY2MtPmNsZW4gPSBjYy0+cmxlbiAtIFBB
R0VfU0laRSAtIENPTVBSRVNTX0hFQURFUl9TSVpFOw0KPj4+Pj4+PiAJcmV0dXJuIDA7DQo+Pj4+
Pj4+IEBAIC0zMzUsNjUgKzMzNiw0OCBAQCBzdGF0aWMgdm9pZCB6c3RkX2Rlc3Ryb3lfY29tcHJl
c3NfY3R4KHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQ0KPj4+Pj4+PiAgIHN0YXRpYyBpbnQgenN0
ZF9jb21wcmVzc19wYWdlcyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykNCj4+Pj4+Pj4gew0KPj4+
Pj4+PiAtCVpTVERfQ1N0cmVhbSAqc3RyZWFtID0gY2MtPnByaXZhdGUyOw0KPj4+Pj4+PiAtCVpT
VERfaW5CdWZmZXIgaW5idWY7DQo+Pj4+Pj4+IC0JWlNURF9vdXRCdWZmZXIgb3V0YnVmOw0KPj4+
Pj4+PiAtCWludCBzcmNfc2l6ZSA9IGNjLT5ybGVuOw0KPj4+Pj4+PiAtCWludCBkc3Rfc2l6ZSA9
IHNyY19zaXplIC0gUEFHRV9TSVpFIC0gQ09NUFJFU1NfSEVBREVSX1NJWkU7DQo+Pj4+Pj4+IC0J
aW50IHJldDsNCj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAtCWluYnVmLnBvcyA9IDA7DQo+Pj4+Pj4+IC0J
aW5idWYuc3JjID0gY2MtPnJidWY7DQo+Pj4+Pj4+IC0JaW5idWYuc2l6ZSA9IHNyY19zaXplOw0K
Pj4+Pj4+PiAtDQo+Pj4+Pj4+IC0Jb3V0YnVmLnBvcyA9IDA7DQo+Pj4+Pj4+IC0Jb3V0YnVmLmRz
dCA9IGNjLT5jYnVmLT5jZGF0YTsNCj4+Pj4+Pj4gLQlvdXRidWYuc2l6ZSA9IGRzdF9zaXplOw0K
Pj4+Pj4+PiAtDQo+Pj4+Pj4+IC0JcmV0ID0gWlNURF9jb21wcmVzc1N0cmVhbShzdHJlYW0sICZv
dXRidWYsICZpbmJ1Zik7DQo+Pj4+Pj4+IC0JaWYgKFpTVERfaXNFcnJvcihyZXQpKSB7DQo+Pj4+
Pj4+IC0JCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6ICVzIFpTVERfY29tcHJl
c3NTdHJlYW0gZmFpbGVkLCByZXQ6ICVkXG4iLA0KPj4+Pj4+PiAtCQkJCUtFUk5fRVJSLCBGMkZT
X0lfU0IoY2MtPmlub2RlKS0+c2ItPnNfaWQsDQo+Pj4+Pj4+IC0JCQkJX19mdW5jX18sIFpTVERf
Z2V0RXJyb3JDb2RlKHJldCkpOw0KPj4+Pj4+PiAtCQlyZXR1cm4gLUVJTzsNCj4+Pj4+Pj4gLQl9
DQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gLQlyZXQgPSBaU1REX2VuZFN0cmVhbShzdHJlYW0sICZvdXRi
dWYpOw0KPj4+Pj4+PiArCVpTVERfQ0N0eCAqY3R4ID0gY2MtPnByaXZhdGUyOw0KPj4+Pj4+PiAr
CWNvbnN0IHNpemVfdCBzcmNfc2l6ZSA9IGNjLT5ybGVuOw0KPj4+Pj4+PiArCWNvbnN0IHNpemVf
dCBkc3Rfc2l6ZSA9IHNyY19zaXplIC0gUEFHRV9TSVpFIC0gQ09NUFJFU1NfSEVBREVSX1NJWkU7
DQo+Pj4+Pj4+ICsJWlNURF9wYXJhbWV0ZXJzIHBhcmFtcyA9IFpTVERfZ2V0UGFyYW1zKEYyRlNf
WlNURF9ERUZBVUxUX0NMRVZFTCwgc3JjX3NpemUsIDApOw0KPj4+Pj4+PiArCXNpemVfdCByZXQ7
DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKwlyZXQgPSBaU1REX2NvbXByZXNzX2FkdmFuY2VkKA0KPj4+
Pj4+PiArCQkJY3R4LCBjYy0+Y2J1Zi0+Y2RhdGEsIGRzdF9zaXplLCBjYy0+cmJ1Ziwgc3JjX3Np
emUsIE5VTEwsIDAsIHBhcmFtcyk7DQo+Pj4+Pj4+IAlpZiAoWlNURF9pc0Vycm9yKHJldCkpIHsN
Cj4+Pj4+Pj4gLQkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9l
bmRTdHJlYW0gcmV0dXJuZWQgJWRcbiIsDQo+Pj4+Pj4+ICsJCS8qDQo+Pj4+Pj4+ICsJCSAqIHRo
ZXJlIGlzIGNvbXByZXNzZWQgZGF0YSByZW1haW5lZCBpbiBpbnRlcm1lZGlhdGUgYnVmZmVyIGR1
ZSB0bw0KPj4+Pj4+PiArCQkgKiBubyBtb3JlIHNwYWNlIGluIGNidWYuY2RhdGENCj4+Pj4+Pj4g
KwkJICovDQo+Pj4+Pj4+ICsJCWlmIChaU1REX2dldEVycm9yQ29kZShyZXQpID09IFpTVERfZXJy
b3JfZHN0U2l6ZV90b29TbWFsbCkNCj4+Pj4+Pj4gKwkJCXJldHVybiAtRUFHQUlOOw0KPj4+Pj4+
PiArCQkvKiBvdGhlciBjb21wcmVzc2lvbiBlcnJvcnMgcmV0dXJuIC1FSU8gKi8NCj4+Pj4+Pj4g
KwkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9jb21wcmVzc19h
ZHZhbmNlZCBmYWlsZWQsIGVycjogJXNcbiIsDQo+Pj4+Pj4+IAkJCQlLRVJOX0VSUiwgRjJGU19J
X1NCKGNjLT5pbm9kZSktPnNiLT5zX2lkLA0KPj4+Pj4+PiAtCQkJCV9fZnVuY19fLCBaU1REX2dl
dEVycm9yQ29kZShyZXQpKTsNCj4+Pj4+Pj4gKwkJCQlfX2Z1bmNfXywgWlNURF9nZXRFcnJvck5h
bWUocmV0KSk7DQo+Pj4+Pj4+IAkJcmV0dXJuIC1FSU87DQo+Pj4+Pj4+IAl9DQo+Pj4+Pj4+IC0J
LyoNCj4+Pj4+Pj4gLQkgKiB0aGVyZSBpcyBjb21wcmVzc2VkIGRhdGEgcmVtYWluZWQgaW4gaW50
ZXJtZWRpYXRlIGJ1ZmZlciBkdWUgdG8NCj4+Pj4+Pj4gLQkgKiBubyBtb3JlIHNwYWNlIGluIGNi
dWYuY2RhdGENCj4+Pj4+Pj4gLQkgKi8NCj4+Pj4+Pj4gLQlpZiAocmV0KQ0KPj4+Pj4+PiAtCQly
ZXR1cm4gLUVBR0FJTjsNCj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAtCWNjLT5jbGVuID0gb3V0YnVmLnBv
czsNCj4+Pj4+Pj4gKwljYy0+Y2xlbiA9IHJldDsNCj4+Pj4+Pj4gCXJldHVybiAwOw0KPj4+Pj4+
PiB9DQo+Pj4+Pj4+ICAgc3RhdGljIGludCB6c3RkX2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0
IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+Pj4+Pj4+IHsNCj4+Pj4+Pj4gLQlaU1REX0RTdHJl
YW0gKnN0cmVhbTsNCj4+Pj4+Pj4gKwlaU1REX0RDdHggKmN0eDsNCj4+Pj4+Pj4gCXZvaWQgKndv
cmtzcGFjZTsNCj4+Pj4+Pj4gCXVuc2lnbmVkIGludCB3b3Jrc3BhY2Vfc2l6ZTsNCj4+Pj4+Pj4g
LQl3b3Jrc3BhY2Vfc2l6ZSA9IFpTVERfRFN0cmVhbVdvcmtzcGFjZUJvdW5kKE1BWF9DT01QUkVT
U19XSU5ET1dfU0laRSk7DQo+Pj4+Pj4+ICsJd29ya3NwYWNlX3NpemUgPSBaU1REX2VzdGltYXRl
REN0eFNpemUoKTsNCj4+Pj4+Pj4gICAJd29ya3NwYWNlID0gZjJmc19rdm1hbGxvYyhGMkZTX0lf
U0IoZGljLT5pbm9kZSksDQo+Pj4+Pj4+IAkJCQkJd29ya3NwYWNlX3NpemUsIEdGUF9OT0ZTKTsN
Cj4+Pj4+Pj4gCWlmICghd29ya3NwYWNlKQ0KPj4+Pj4+PiAJCXJldHVybiAtRU5PTUVNOw0KPj4+
Pj4+PiAtCXN0cmVhbSA9IFpTVERfaW5pdERTdHJlYW0oTUFYX0NPTVBSRVNTX1dJTkRPV19TSVpF
LA0KPj4+Pj4+PiAtCQkJCQl3b3Jrc3BhY2UsIHdvcmtzcGFjZV9zaXplKTsNCj4+Pj4+Pj4gLQlp
ZiAoIXN0cmVhbSkgew0KPj4+Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAo
JXMpOiAlcyBaU1REX2luaXREU3RyZWFtIGZhaWxlZFxuIiwNCj4+Pj4+Pj4gKwljdHggPSBaU1RE
X2luaXRTdGF0aWNEQ3R4KHdvcmtzcGFjZSwgd29ya3NwYWNlX3NpemUpOw0KPj4+Pj4+PiArCWlm
ICghY3R4KSB7DQo+Pj4+Pj4+ICsJCXByaW50a19yYXRlbGltaXRlZCgiJXNGMkZTLWZzICglcyk6
ICVzIFpTVERfaW5pdFN0YXRpY0RDdHggZmFpbGVkXG4iLA0KPj4+Pj4+PiAJCQkJS0VSTl9FUlIs
IEYyRlNfSV9TQihkaWMtPmlub2RlKS0+c2ItPnNfaWQsDQo+Pj4+Pj4+IAkJCQlfX2Z1bmNfXyk7
DQo+Pj4+Pj4+IAkJa3ZmcmVlKHdvcmtzcGFjZSk7DQo+Pj4+Pj4+IEBAIC00MDEsNyArMzg1LDcg
QEAgc3RhdGljIGludCB6c3RkX2luaXRfZGVjb21wcmVzc19jdHgoc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMpDQo+Pj4+Pj4+IAl9DQo+Pj4+Pj4+ICAgCWRpYy0+cHJpdmF0ZSA9IHdvcmtz
cGFjZTsNCj4+Pj4+Pj4gLQlkaWMtPnByaXZhdGUyID0gc3RyZWFtOw0KPj4+Pj4+PiArCWRpYy0+
cHJpdmF0ZTIgPSBjdHg7DQo+Pj4+Pj4+ICAgCXJldHVybiAwOw0KPj4+Pj4+PiB9DQo+Pj4+Pj4+
IEBAIC00MTUsMjggKzM5OSwxOCBAQCBzdGF0aWMgdm9pZCB6c3RkX2Rlc3Ryb3lfZGVjb21wcmVz
c19jdHgoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+Pj4+Pj4+ICAgc3RhdGljIGlu
dCB6c3RkX2RlY29tcHJlc3NfcGFnZXMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMpDQo+
Pj4+Pj4+IHsNCj4+Pj4+Pj4gLQlaU1REX0RTdHJlYW0gKnN0cmVhbSA9IGRpYy0+cHJpdmF0ZTI7
DQo+Pj4+Pj4+IC0JWlNURF9pbkJ1ZmZlciBpbmJ1ZjsNCj4+Pj4+Pj4gLQlaU1REX291dEJ1ZmZl
ciBvdXRidWY7DQo+Pj4+Pj4+IC0JaW50IHJldDsNCj4+Pj4+Pj4gLQ0KPj4+Pj4+PiAtCWluYnVm
LnBvcyA9IDA7DQo+Pj4+Pj4+IC0JaW5idWYuc3JjID0gZGljLT5jYnVmLT5jZGF0YTsNCj4+Pj4+
Pj4gLQlpbmJ1Zi5zaXplID0gZGljLT5jbGVuOw0KPj4+Pj4+PiAtDQo+Pj4+Pj4+IC0Jb3V0YnVm
LnBvcyA9IDA7DQo+Pj4+Pj4+IC0Jb3V0YnVmLmRzdCA9IGRpYy0+cmJ1ZjsNCj4+Pj4+Pj4gLQlv
dXRidWYuc2l6ZSA9IGRpYy0+cmxlbjsNCj4+Pj4+Pj4gKwlaU1REX0RDdHggKmN0eCA9IGRpYy0+
cHJpdmF0ZTI7DQo+Pj4+Pj4+ICsJc2l6ZV90IHJldDsNCj4+Pj4+Pj4gLQlyZXQgPSBaU1REX2Rl
Y29tcHJlc3NTdHJlYW0oc3RyZWFtLCAmb3V0YnVmLCAmaW5idWYpOw0KPj4+Pj4+PiArCXJldCA9
IFpTVERfZGVjb21wcmVzc0RDdHgoY3R4LCBkaWMtPnJidWYsIGRpYy0+cmxlbiwgZGljLT5jYnVm
LT5jZGF0YSwgZGljLT5jbGVuKTsNCj4+Pj4+Pj4gCWlmIChaU1REX2lzRXJyb3IocmV0KSkgew0K
Pj4+Pj4+PiAtCQlwcmludGtfcmF0ZWxpbWl0ZWQoIiVzRjJGUy1mcyAoJXMpOiAlcyBaU1REX2Nv
bXByZXNzU3RyZWFtIGZhaWxlZCwgcmV0OiAlZFxuIiwNCj4+Pj4+Pj4gKwkJcHJpbnRrX3JhdGVs
aW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURF9kZWNvbXByZXNzREN0eCBmYWlsZWQsIGVy
cjogJXNcbiIsDQo+Pj4+Pj4+IAkJCQlLRVJOX0VSUiwgRjJGU19JX1NCKGRpYy0+aW5vZGUpLT5z
Yi0+c19pZCwNCj4+Pj4+Pj4gLQkJCQlfX2Z1bmNfXywgWlNURF9nZXRFcnJvckNvZGUocmV0KSk7
DQo+Pj4+Pj4+ICsJCQkJX19mdW5jX18sIFpTVERfZ2V0RXJyb3JOYW1lKHJldCkpOw0KPj4+Pj4+
PiAJCXJldHVybiAtRUlPOw0KPj4+Pj4+PiAJfQ0KPj4+Pj4+PiAtCWlmIChkaWMtPnJsZW4gIT0g
b3V0YnVmLnBvcykgew0KPj4+Pj4+PiArCWlmIChkaWMtPnJsZW4gIT0gcmV0KSB7DQo+Pj4+Pj4+
IAkJcHJpbnRrX3JhdGVsaW1pdGVkKCIlc0YyRlMtZnMgKCVzKTogJXMgWlNURCBpbnZhbGlkIHJs
ZW46JXp1LCAiDQo+Pj4+Pj4+IAkJCQkiZXhwZWN0ZWQ6JWx1XG4iLCBLRVJOX0VSUiwNCj4+Pj4+
Pj4gCQkJCUYyRlNfSV9TQihkaWMtPmlub2RlKS0+c2ItPnNfaWQsDQoNCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==

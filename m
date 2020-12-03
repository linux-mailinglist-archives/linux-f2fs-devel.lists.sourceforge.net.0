Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1842CCDF0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 05:32:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SNiX6JfVesil2AXrRBe9CiHcfpJ0oLdr6dKDRp3o/GU=; b=d+Sl+DV8PRrSAtQOPdlxllHft
	LaSOSXlqa+oXlPYLEQoiCKkbD8NHZQzfwqFuwpjfZFpCy+mZ2OLomKj2l6TLQ9RC/cIAbMQBtOBjJ
	wmeJcTjF113ROt9RrZR2SGfrp+16FZs9b//cGfLl9EKA8EglrzKp5kw24aulugJ/Y0UfA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkgIU-0004zP-Do; Thu, 03 Dec 2020 04:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=9606de115a=terrelln@fb.com>)
 id 1kkg8f-0003pR-1L; Thu, 03 Dec 2020 04:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LipDXmzpLIQHOEDgdl3O20ecPqpwzf6nV3S+FMkZ/Ms=; b=AIR+FRLXsY0QaVeycMFRPqRME4
 +/d+K15bWbJoKtgqSuFXCCywJvqm5KdSRTnW0vfZ1asVYxJat7K1glnFewz+QZbRnfcivuqVmHZE0
 0dGf2i0rsb57yCIiricAx+gLd6pySeYW6kVQM2fC0aiwMa9yWEoOnL8MKY6Jj065/7m0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LipDXmzpLIQHOEDgdl3O20ecPqpwzf6nV3S+FMkZ/Ms=; b=k78mptLbWVmMNHx9ZVPVNRMci7
 0Umco5iitGJF8wt8XpgYkVJ7aqfnIVRCQZyaDqoQRgK/IofwMgljH8kU739/nouDImHLZjgnm6hSw
 iMKRscbwC4HOZX6y+Wq4H2skPsJC5o21SpsWkOSlsDy9I159Fo6Tj7QN3v/J0tTGdlxk=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkg8b-00H3J5-OM; Thu, 03 Dec 2020 04:22:40 +0000
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B33xXl0016747; Wed, 2 Dec 2020 19:59:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LipDXmzpLIQHOEDgdl3O20ecPqpwzf6nV3S+FMkZ/Ms=;
 b=SQCrzIqWFTSabEtKoDdPfO3GEFutu3HMkL6FPFoHYWdg2p2S52g4GeulNPkYdjs/E/md
 YJJTkef19w2ZcK1gNYyYtc6A+x8t8NXZx+VXRp3dG2rL250/+cg9H3QB3aE4L/7l1uON
 SNLZ1i58p2VrIO8irkj/SADa7eLer1jujIA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 356ajce3sp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Dec 2020 19:59:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 2 Dec 2020 19:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWWfvk34zT/tryasrf/c41DnVgqrCdh512gVhnkt9HkW8ZYBdySlYMFJ5/r8nMMDmbQExM3wtkb/93TjCDSRgI5WnRUIaqs0y+5HNnm0e2TYKtlpVWxKezIrdWewU0j4X13zrQuwfLqjV1ZGkFK5zzKjMkZeocAblvWoeN561mr01yFv+k1P4xb3WA4DdzVQD2Ww8BE/JiQhxJfsN9p2XNkZZGBsWJgEmWnVNn1uF/cufhFe3mjNJCsGea9bNEbnWmm0VximtBryQsgXOCJ0zzolEi1GVu3i/BNE1g+YdG1PNfU9r1QyAv0bDhvtzOSskXfbCbJcaFVxVvTM9s2eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LipDXmzpLIQHOEDgdl3O20ecPqpwzf6nV3S+FMkZ/Ms=;
 b=SqrCHhbLkaht/HPYn6VzLIc/IG4dvS/eubdXRnJkWy7YgSmhsLVUD1UteYlnfKEyEDm2AAWx6Ui14gBN0az/T9vS/UYP2ptRSGLJlc+iKb6VpaSHiFxqTS+IK1O6CHBtiKGBkTAxYxQgiSr606cIADj2O33OIE75UA71bZxc/iiBqcbIaZztYkA4GqBywpijR+QtcXBC96tGo1YFCJRtPb7KXEyRgt9abI/8hM9mwskRxKXRZCGf/yr2PnFx4yTBHdNHwY9iHM+/XX8NneP3AmfCdcXs8YE9XQ2IrRN5ZMLvkY4l737/P3DcWnOsohjb5UUZBeVN8E4Oc9mJ7FTECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LipDXmzpLIQHOEDgdl3O20ecPqpwzf6nV3S+FMkZ/Ms=;
 b=CnMOyveZTewVCULAQZEz08TGFQNW6TJle4g9wK9HkalMzqhzHoAeTKAQW1IymiBz/86dTTnZuKiPvRwlat8wi0h0blj20U/MoXlFvHbqSBO01QJIxynDaFw3wRF4KUiQD7FpaqKwZUWloqixtIXwJsvm8CSBcfdLAEUF87byj7s=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3048.namprd15.prod.outlook.com (2603:10b6:a03:fc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 03:59:21 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::17e:aa61:eb50:290c%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:59:21 +0000
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Thread-Topic: [PATCH v6 1/3] lib: zstd: Add kernel-specific API
Thread-Index: AQHWyOnYHjSKEx1KvUy8OD/sVz0sN6nkkesAgAAHQICAABnUgIAADIgA
Date: Thu, 3 Dec 2020 03:59:21 +0000
Message-ID: <85E09AFA-F1ED-41CB-B712-7FA75374478F@fb.com>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
 <20201203011606.GA20621@qmqm.qmqm.pl>
 <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
 <20201203031429.GA13095@qmqm.qmqm.pl>
In-Reply-To: <20201203031429.GA13095@qmqm.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rere.qmqm.pl; dkim=none (message not signed)
 header.d=none;rere.qmqm.pl; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:9813]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c647f02e-6b1f-4199-0bee-08d8973fd0ad
x-ms-traffictypediagnostic: BYAPR15MB3048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB30486098B244A6209F007F79ABF20@BYAPR15MB3048.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WzpNGThXa6sRZyacwbju5JPBM/9u1BPBCcaDIRVhFwAXHVAupaPnvyBCjoR4M9fGhk6O4RUiVjUIE10L3sUjkJvGySMd7jys6/6ehxWA+b/HXIH+QR7n+O/HOlvjln7NaEKD88Mo88VdlMKtve8S1j0ODM0oV2Ba99sn6pujOBNtqbei6LWexRp1b9NLKtSwhXSQWskB+3lKboyJUeEWnp3WJT760m3ZkseaNp7HYkEMqv0FsX3m1feVMpfhfpchP34e6wTnIJM+CUODtFJZg368wukyOloD00jNjbUkeMRxnOWy2ekFQzhnNTiIGPJE4gnz420eJirjuasDvkIv9ScPebJAnCuWmm2wEbjH6A21/mZ2OsbIIEpBAL/qJwoq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(39860400002)(136003)(4326008)(66556008)(66476007)(71200400001)(8936002)(5660300002)(33656002)(2906002)(64756008)(76116006)(478600001)(91956017)(66446008)(83380400001)(6506007)(316002)(2616005)(66946007)(8676002)(6916009)(54906003)(6512007)(86362001)(6486002)(36756003)(186003)(7416002)(66574015)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2QzWmY1ZHFycUU5d2tjeVExL0Fwb1QyMDRKYWtIc3VEQXNQdENBREFuRkdl?=
 =?utf-8?B?NGhuL2VpVG1hREd0bTZ4Nk00dUs2WVJxV2hkZnlDR01HaUlrekNPTVdmaXl3?=
 =?utf-8?B?azE4Wmd5M21GbW9odVdmdzdTY2NDbkRBZTJWUW11eFc1c09tQkJMVnJHMk1q?=
 =?utf-8?B?TFYrc00zV2FlSGEzemlZNTRqc0pDRHpjRE5qVjRRSno5VFVwMzlya0s0cCt2?=
 =?utf-8?B?Q0NSSmhqQ0RSbTRjclFzSWxMUHltbVFvbFo2dVRYZjRVMFc5TXBsVHlyNm90?=
 =?utf-8?B?eU9wMy9xT3dhVEU0WHF3OUltUG9Ma2hOZTYyOHVsK2xOazNHVnVnN0l1R3ZE?=
 =?utf-8?B?UnFZVEcvcFduVytXNEFvN256Ni9Hd01SUU1yemhXb0x3bjliTGp3bmttbWVL?=
 =?utf-8?B?b3p5MmhJNlFqNWZxUDBzS0NmY3VOQWpXdC9ybVdUamozdk9ST2h6QitmK0tk?=
 =?utf-8?B?ck1OSGMvR3JzMEtaODlYTWdoRy9OM2pIM2hhRHNsYmMyZnJVNnZCRFFIS0Vq?=
 =?utf-8?B?SkkzZVhNS2FTblFpeU5uUzMwa2U1TWtObnBLSlZ1Y3d3Vmk2MWtkKzJnNkpD?=
 =?utf-8?B?MmlubjFhY0wzRSthWUJUaGFwQm9YeGlTWWd0VThhUlJabzZkQVBsUzNuenBn?=
 =?utf-8?B?RVVOdjd0QUR1TzliWGFiWEU0aHY1V29laVdDWld5akJ6ZHJES2xjRERYVW1k?=
 =?utf-8?B?WUVMT1NtUDB4cWljZEhqaU96bjRORXY1ZjBFU3FzRWNselRCQTlSM1RlcTlz?=
 =?utf-8?B?My9WdlpubmpCSWpod3Z4T29YcFRySEJmV3MwbmsrNC9FdXFpeDVOUThEMnZj?=
 =?utf-8?B?Z0poN2Qrd3NiZExLMkFYYXRTSHJDSjlmSU5VQmJJaEhDMHJVQ3owWExPNm9i?=
 =?utf-8?B?OCtJZTY5aGlEaVhKNTdzb2JuS3c4VGlGTUZmSDBYS2FJcDhCcml4bEFMNFRI?=
 =?utf-8?B?aExPc3ZSbXc4NVFUVVp4bjgyUG9PdkJPbERYMWdCNEtyYjZLK0s0TnA1azBh?=
 =?utf-8?B?bVJUNTFodUZxNXRHY3J6d1NSMi9tMWkvZkRQbGVHVlRhRWhrMkdJZXh2SnBq?=
 =?utf-8?B?UnNOQlpjWjlFVlJuc3U0VEY3eXF3TzJ3TjZYdjAwRmFhTEE1K2l4bUJid1dw?=
 =?utf-8?B?VEhYTXJ2SXl1ZFg1d1pSY2pVcm5sdXBab2hLNU9QZWZMWGFzdWdtMnVlZDNY?=
 =?utf-8?B?SGd0aGdFek5PSjNVblg2STVuZElZd09RT2dFWXNCV3NPdUZRZUVmYkY1bDMr?=
 =?utf-8?B?d3lYZzJndEJUdUxWaE92OEo1OCtkY3U1SitVUm1aVkxRNGQ0azJ1RVVLaUli?=
 =?utf-8?B?ZWV2TnRWeFpSdk82TkhBWHAzeGlOWk5mcStBZnFQKys4S1ZvZ0tPMGhITWwz?=
 =?utf-8?Q?QPTXrDnFFGDoh61aOAqi8iHHw0k5kvVY=3D?=
Content-ID: <ECAE607D43143540962E45ED093914CC@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c647f02e-6b1f-4199-0bee-08d8973fd0ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 03:59:21.0951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2TGBPeUzhk8TpMpV3/G4n2EIDe6a5neR+J2mGrWffaThuwWTL5VvkjTIioYlWHLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3048
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_01:2020-11-30,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030021
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1kkg8b-00H3J5-OM
Subject: Re: [f2fs-dev] [PATCH v6 1/3] lib: zstd: Add kernel-specific API
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
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDc6MTQgUE0sIE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIERlYyAwMywgMjAyMCBh
dCAwMTo0MjowM0FNICswMDAwLCBOaWNrIFRlcnJlbGwgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9u
IERlYyAyLCAyMDIwLCBhdCA1OjE2IFBNLCBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEBy
ZXJlLnFtcW0ucGw+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFdlZCwgRGVjIDAyLCAyMDIwIGF0IDEy
OjMyOjQwUE0gLTA4MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4gRnJvbTogTmljayBUZXJy
ZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+Pj4+IA0KPj4+PiBUaGlzIHBhdGNoOg0KPj4+PiAtIE1v
dmVzIGBpbmNsdWRlL2xpbnV4L3pzdGQuaGAgLT4gYGxpYi96c3RkL3pzdGQuaGANCj4+Pj4gLSBB
ZGRzIGEgbmV3IEFQSSBpbiBgaW5jbHVkZS9saW51eC96c3RkLmhgIHRoYXQgaXMgZnVuY3Rpb25h
bGx5DQo+Pj4+IGVxdWl2YWxlbnQgdG8gdGhlIGluLXVzZSBzdWJzZXQgb2YgdGhlIGN1cnJlbnQg
QVBJLiBGdW5jdGlvbnMgYXJlDQo+Pj4+IHJlbmFtZWQgdG8gYXZvaWQgc3ltYm9sIGNvbGxpc2lv
bnMgd2l0aCB6c3RkLCB0byBtYWtlIGl0IGNsZWFyIGl0IGlzDQo+Pj4+IG5vdCB0aGUgdXBzdHJl
YW0genN0ZCBBUEksIGFuZCB0byBmb2xsb3cgdGhlIGtlcm5lbCBzdHlsZSBndWlkZS4NCj4+Pj4g
LSBVcGRhdGVzIGFsbCBjYWxsZXJzIHRvIHVzZSB0aGUgbmV3IEFQSS4NCj4+Pj4gDQo+Pj4+IFRo
ZXJlIGFyZSBubyBmdW5jdGlvbmFsIGNoYW5nZXMgaW4gdGhpcyBwYXRjaC4gU2luY2UgdGhlcmUg
YXJlIG5vDQo+Pj4+IGZ1bmN0aW9uYWwgY2hhbmdlLCBJIGZlbHQgaXQgd2FzIG9rYXkgdG8gdXBk
YXRlIGFsbCB0aGUgY2FsbGVycyBpbiBhDQo+Pj4+IHNpbmdsZSBwYXRjaCwgc2luY2Ugb25jZSB0
aGUgQVBJIGlzIGFwcHJvdmVkLCB0aGUgY2FsbGVycyBhcmUNCj4+Pj4gbWVjaGFuaWNhbGx5IGNo
YW5nZWQuDQo+Pj4gWy4uLl0NCj4+Pj4gLS0tIGEvbGliL2RlY29tcHJlc3NfdW56c3RkLmMNCj4+
Pj4gKysrIGIvbGliL2RlY29tcHJlc3NfdW56c3RkLmMNCj4+PiBbLi4uXQ0KPj4+PiBzdGF0aWMg
aW50IElOSVQgaGFuZGxlX3pzdGRfZXJyb3Ioc2l6ZV90IHJldCwgdm9pZCAoKmVycm9yKShjaGFy
ICp4KSkNCj4+Pj4gew0KPj4+PiAtCWNvbnN0IGludCBlcnIgPSBaU1REX2dldEVycm9yQ29kZShy
ZXQpOw0KPj4+PiAtDQo+Pj4+IC0JaWYgKCFaU1REX2lzRXJyb3IocmV0KSkNCj4+Pj4gKwlpZiAo
IXpzdGRfaXNfZXJyb3IocmV0KSkNCj4+Pj4gCQlyZXR1cm4gMDsNCj4+Pj4gDQo+Pj4+IC0Jc3dp
dGNoIChlcnIpIHsNCj4+Pj4gLQljYXNlIFpTVERfZXJyb3JfbWVtb3J5X2FsbG9jYXRpb246DQo+
Pj4+IC0JCWVycm9yKCJaU1REIGRlY29tcHJlc3NvciByYW4gb3V0IG9mIG1lbW9yeSIpOw0KPj4+
PiAtCQlicmVhazsNCj4+Pj4gLQljYXNlIFpTVERfZXJyb3JfcHJlZml4X3Vua25vd246DQo+Pj4+
IC0JCWVycm9yKCJJbnB1dCBpcyBub3QgaW4gdGhlIFpTVEQgZm9ybWF0ICh3cm9uZyBtYWdpYyBi
eXRlcykiKTsNCj4+Pj4gLQkJYnJlYWs7DQo+Pj4+IC0JY2FzZSBaU1REX2Vycm9yX2RzdFNpemVf
dG9vU21hbGw6DQo+Pj4+IC0JY2FzZSBaU1REX2Vycm9yX2NvcnJ1cHRpb25fZGV0ZWN0ZWQ6DQo+
Pj4+IC0JY2FzZSBaU1REX2Vycm9yX2NoZWNrc3VtX3dyb25nOg0KPj4+PiAtCQllcnJvcigiWlNU
RC1jb21wcmVzc2VkIGRhdGEgaXMgY29ycnVwdCIpOw0KPj4+PiAtCQlicmVhazsNCj4+Pj4gLQlk
ZWZhdWx0Og0KPj4+PiAtCQllcnJvcigiWlNURC1jb21wcmVzc2VkIGRhdGEgaXMgcHJvYmFibHkg
Y29ycnVwdCIpOw0KPj4+PiAtCQlicmVhazsNCj4+Pj4gLQl9DQo+Pj4+ICsJZXJyb3IoIlpTVEQg
ZGVjb21wcmVzc2lvbiBmYWlsZWQiKTsNCj4+Pj4gCXJldHVybiAtMTsNCj4+Pj4gfQ0KPj4+IA0K
Pj4+IFRoaXMgbG9vc2VzIGRpYWdub3N0aWNzIHNwZWNpZmljaXR5IC0gaXMgdGhpcyBpbnRlbmRl
ZD8gQXQgbGVhc3QgdGhlDQo+Pj4gb3V0LW9mLW1lbW9yeSBjb25kaXRpb24gc2VlbXMgdXNlZnVs
IHRvIGRpc3Rpbmd1aXNoLg0KPj4gDQo+PiBHb29kIHBvaW50LiBUaGUgenN0ZCBBUEkgbm8gbG9u
Z2VyIGV4cG9zZXMgdGhlIGVycm9yIGNvZGUgZW51bSwNCj4+IGJ1dCBpdCBkb2VzIGV4cG9zZSB6
c3RkX2dldF9lcnJvcl9uYW1lKCkgd2hpY2ggY2FuIGJlIHVzZWQgaGVyZS4NCj4+IEkgd2FzIHRo
aW5raW5nIHRoYXQgdGhlIHN0cmluZyBuZWVkZWQgdG8gYmUgc3RhdGljIGZvciBzb21lIHJlYXNv
biwgYnV0DQo+PiB0aGF0IGlzIG5vdCB0aGUgY2FzZS4gSSB3aWxsIG1ha2UgdGhhdCBjaGFuZ2Uu
DQo+PiANCj4+Pj4gK3NpemVfdCB6c3RkX2NvbXByZXNzX3N0cmVhbSh6c3RkX2NzdHJlYW0gKmNz
dHJlYW0sDQo+Pj4+ICsJc3RydWN0IHpzdGRfb3V0X2J1ZmZlciAqb3V0cHV0LCBzdHJ1Y3QgenN0
ZF9pbl9idWZmZXIgKmlucHV0KQ0KPj4+PiArew0KPj4+PiArCVpTVERfb3V0QnVmZmVyIG87DQo+
Pj4+ICsJWlNURF9pbkJ1ZmZlciBpOw0KPj4+PiArCXNpemVfdCByZXQ7DQo+Pj4+ICsNCj4+Pj4g
KwltZW1jcHkoJm8sIG91dHB1dCwgc2l6ZW9mKG8pKTsNCj4+Pj4gKwltZW1jcHkoJmksIGlucHV0
LCBzaXplb2YoaSkpOw0KPj4+PiArCXJldCA9IFpTVERfY29tcHJlc3NTdHJlYW0oY3N0cmVhbSwg
Jm8sICZpKTsNCj4+Pj4gKwltZW1jcHkob3V0cHV0LCAmbywgc2l6ZW9mKG8pKTsNCj4+Pj4gKwlt
ZW1jcHkoaW5wdXQsICZpLCBzaXplb2YoaSkpOw0KPj4+PiArCXJldHVybiByZXQ7DQo+Pj4+ICt9
DQo+Pj4gDQo+Pj4gSXMgYWxsIHRoaXMgY29weWluZyBuZWNlc3Nhcnk/IEhvdyBpcyBpdCBkaWZm
ZXJlbnQgZnJvbSB0eXBlLXB1bm5pbmcgYnkNCj4+PiBkaXJlY3QgcG9pbnRlciBjYXN0Pw0KPj4g
DQo+PiBJZiBicmVha2luZyBzdHJpY3QgYWxpYXNpbmcgYW5kIHR5cGUtcHVubmluZyBieSBwb2lu
dGVyIGNhc2luZyBpcyBva2F5LCB0aGVuDQo+PiB3ZSBjYW4gZG8gdGhhdCBoZXJlLiBUaGVzZSBt
ZW1jcHlzIHdpbGwgYmUgbmVnbGlnaWJsZSBmb3IgcGVyZm9ybWFuY2UsIGJ1dA0KPj4gdHlwZS1w
dW5uaW5nIHdvdWxkIGJlIG1vcmUgc3VjY2luY3QgaWYgYWxsb3dlZC4NCj4gDQo+IEFoLCB0aGlz
IG1pZ2h0IGJyZWFrIExUTyBidWlsZHMgZHVlIHRvIHN0cmljdCBhbGlhc2luZyB2aW9sYXRpb24u
DQo+IFNvIEkgd291bGQgc3VnZ2VzdCB0byBqdXN0ICNkZWZpbmUgdGhlIFpTVEQgbmFtZXMgdG8g
a2VybmVsIG9uZXMNCj4gZm9yIHRoZSBsaWJyYXJ5IGNvZGUuICBVbmxlc3MgdGhlcmUgaXMgYSBj
bGVhbmVyIHNvbHV0aW9uLi4uDQoNCkkgZG9u4oCZdCB3YW50IHRvIGRvIHRoYXQgYmVjYXVzZSBJ
IHdhbnQgaW4gdGhlIDNyZCBzZXJpZXMgb2YgdGhlIHBhdGNoc2V0IEkgdXBkYXRlDQp0byB6c3Rk
LTEuNC42LiBBbmQgSeKAmW0gdXNpbmcgenN0ZC0xLjQuNiBhcy1pcyBpbiB1cHN0cmVhbS4gVGhp
cyBhbGxvd3MgdXMgdG8ga2VlcA0KdGhlIGtlcm5lbCB2ZXJzaW9uIHVwIHRvIGRhdGUsIHNpbmNl
IHRoZSBwYXRjaCB0byB1cGRhdGUgdG8gYSBuZXcgdmVyc2lvbiBjYW4gYmUNCmdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IChhbmQgbWFudWFsbHkgdGVzdGVkKSwgc28gaXQgZG9lc27igJl0IGZhbGwg
eWVhcnMgYmVoaW5kDQp1cHN0cmVhbSBhZ2Fpbi4NCg0KVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJl
IHRvIG1ha2UgdXBzdHJlYW0genN0ZOKAmXMgaGVhZGVyIHB1YmxpYyBhbmQNCiNkZWZpbmUgenN0
ZF9pbl9idWZmZXIgWlNURF9pbkJ1ZmZlci4gQnV0IHRoYXQgd291bGQgbWFrZSB6c3Rk4oCZcyBo
ZWFkZXINCnB1YmxpYywgd2hpY2ggd291bGQgc29tZXdoYXQgZGVmZWF0IHRoZSBwdXJwb3NlIG9m
IGhhdmluZyBhIGtlcm5lbCB3cmFwcGVyLg0KDQpUaGVzZSBtZW1jcHnigJlzIHdvbuKAmXQgaHVy
dCBwZXJmb3JtYW5jZSwgc2luY2UgdGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgYXQgbW9zdA0KZXZl
cnkgNEtCIG9mIGlucHV0IGRhdGEgaW4gYWxsIHRoZSBjYWxsZXJzLCB0aG91Z2ggdGhleSBhcmUg
Y2x1bmt5Lg0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=

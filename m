Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB15410479
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Sep 2021 08:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h6Ly6Hgsbv72XNMNssqIHOLUhjzM0XcalNv7iz75Ha0=; b=BVJtqV4QMiXRNtMtTEhkXNVBz
	gNJL5XWkYgTM6PK6iHntKrPWQ0VZe6C+ZpUguo9z/WUv4mTRc1Xv3Hg5cEWecBmWxLAYVb6N9DNpY
	eaYed7VFxaRusQixnEORkt3Hj9UPGYIoHG1Y+I1LRB4MeQh6j/fRHFwkVcXq6ra/TNipI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRU89-0001JQ-8X; Sat, 18 Sep 2021 06:47:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mRU82-0001Il-JE
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 06:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VL0Iu7ug8ujbQuMiyNN0Kk3NmWGc5Iz1i8qBvH/2Eo=; b=EQrBTU9V57NMrBlw5mseq1Ej5g
 e9IzsUzI1CemEO1+uI8uUVnrsMu9fybp0hWMhgHZ593fzwa/8tM4QeMQZhgQbNsL4wI5K4UFrpwMh
 ZsAfGDyczVlPj6cMrhJUu7yWwMLoiZcy0i6/YVsaEG32uiQt9ByRPq3X7kGvB0ZrnCOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4VL0Iu7ug8ujbQuMiyNN0Kk3NmWGc5Iz1i8qBvH/2Eo=; b=Vuu/vMqmrsSQSM5LvdLlMofIBd
 ET7Yz9tQEUy1fu7Q3IVVA7v7w4O6LjK5TnNN+Jy14+9WtvENfIqk8auhLbkUKN+Hy7FGDSAV0hR8m
 ZbvbpM077xWEpxBDL22ShNORoQorSEJqw48En/eLH50awJNuwxosurlJs1OXUh8h/UQ0=;
Received: from mail-eopbgr1310109.outbound.protection.outlook.com
 ([40.107.131.109] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRU7y-0001Jr-QR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 06:47:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtaM8xYzvmc0g7Ugm0BTIeAVAHIMTAspAc9NnNgA8U23q+yK2/CaPmgjOHZ4EX/WwVwvNz9+Pc9cVEMRfUnhVd9zwdCkkvvU0d0tLVmlJAob1Y7R4NsE3NZMpXUCJ86GR29GayK7E0JJxhVSDtpfSWa68c3HIP8JoRrYdG48M0GAIBSSn9vgt90ZuUww6y4/qf7cTpKNREsIPjJZ5+XwlGyYziJeOHJyxItUjI3XgGbFV/O105mdZwLYcX/HckO0G2USGdnhSWb1pYksMhDUsYIQSohXXFQtboTptka7GaYJFJUbgizN0OrMAWicWPsh4NhrHQSUSJmd5hGUcUXjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4VL0Iu7ug8ujbQuMiyNN0Kk3NmWGc5Iz1i8qBvH/2Eo=;
 b=Ng2Bz9lT+sEMvjWJkcSmjufgjzAw2iuqCnl5HW9AyaeiaD0aAmM5UJ9zWyHhdHN28X+B8t80zGEll5GHeYZhoftuqiY898bvzRPi9IkWnJowwrRvIBYJJSxiGFXG8YgQBmDikCZu+TzCnKOH966S+ebmjNgHRdaBBKHcVHG5pIiNQQB2Prco+Iro6YdFZOCS7U6ojLQl9mq7Kwpxuvgvw/T1D8EN1ewCtZ7TfDQgoslHagZNGY0zpLR6lOBCvqZ77A/BiO9CqSyKC3pBtTQejG4TeHr+LlFDPOmy+sm6RfxBf4EoL96SoSeRDgpmj0NU3DNNpu+CrhJrT6KK0bdI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VL0Iu7ug8ujbQuMiyNN0Kk3NmWGc5Iz1i8qBvH/2Eo=;
 b=Zq/6NKjmzjfBvKbowHgYD+vZTi5dAZ9o+lVokvnOHgJV6GHPE1RqVEXOQlMkjjhoeL8ixh6N8ReCEvixHQI+VMTAfzlYnW2H97bziZD/+VHMq+e0X5FDmPudlUIWmP2qU3gB/MMeWkh4/Ev4uh7MXTr7Nj83EAWu/sgsTKAhys8=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4369.apcprd06.prod.outlook.com (2603:1096:820:71::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Sat, 18 Sep
 2021 06:46:58 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.018; Sat, 18 Sep 2021
 06:46:57 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2 2/2] f2fs: fix missing inplace count in overwrite with
 direct io
Thread-Index: AQHXqu5PjxLZ5rWf40GUlvKwiLN686umkaiAgAAJteCAAWQ9YIAAMkAAgAEpE5A=
Date: Sat, 18 Sep 2021 06:46:56 +0000
Message-ID: <KL1PR0601MB40034B2A46C36B59B713B3E7BBDE9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <ANgA6QClEsWrpLTMx5-VNqof.9.1631883577159.Hmail.changfengnan@vivo.com>
In-Reply-To: <ANgA6QClEsWrpLTMx5-VNqof.9.1631883577159.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8b2357e-a0c2-45ca-3524-08d97a701c26
x-ms-traffictypediagnostic: KL1PR0601MB4369:
x-microsoft-antispam-prvs: <KL1PR0601MB4369C229DD6E84790D5CAF72BBDE9@KL1PR0601MB4369.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vamBNao+RoG2hLewjWLDZ3ko5uF2ZWZzS/qDZQnSQ6p44/ytiDt4WVbTdb56865u083gGs+Dc0Fcwmi6nFMzx9Vr+5LoMVAF80jTSQO9DbFT5n7wFFyTLdoKqPPeERO2CoAcgdjrzQ6tpl8Sn23Al6ZJOwBoj9jvOjj23DyHS59nyrc4Y1kl+cXKzYasvd31V8wKBsymtHM8SkaSAUQe9kgdbzBmOOWulU0iwmp5BglQ7/O7SN3kg38APASkCfRazY5bDdF1OJw+E4Zt71TH3tqpvXzOjvdS4VmhgwzrnoPdmSKUgbbZ8w9GaaTQW+evYKEI4ffXQ/ZUDdlWlHBFVEXkeVbqy+ed8kYJRkest+4On9+fz63p4UdARqYYkhCspQdeeegpOJwMKAYVcDvyt2oRT9nIZ5QJYCN/fR8wfeJ5BiXxnU4R+WTjXVoJuaVGIX1NZb/RvrEkyK5BLCPtw29uKJKvNt3mWWCf7+Crg4JiOPf/tFg68W7UQ6uHUDXF71E95Uae64j27kCYv4kA9RVJzmfEuhvug0C7c09wXcv7w+Ev6C+GTG3uv8QXhVEXG42ai4qS443IUwkAoBZYp8qp/lcyLclskEI6h80/bk6Ltti572c6GWFicwyn4Ku13MHn55V/vbYkjGwn8zzAw59Y+6MGY96zFS4d7oig3jyUnkMYJvgfRoTshwbZdnGKQ13zgCPMSInecj0IkmCtKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(9686003)(83380400001)(8676002)(55016002)(122000001)(33656002)(478600001)(38070700005)(86362001)(53546011)(7696005)(66476007)(76116006)(66556008)(26005)(85182001)(38100700002)(52536014)(186003)(64756008)(71200400001)(2906002)(316002)(4326008)(5660300002)(110136005)(66946007)(8936002)(66446008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEFlbGlUMERhTTNSRnV4M01vcWQ3M2Z6cVZlY1p5ZHVqbHl5K0ZiOHliRzg4?=
 =?utf-8?B?RkRnR2I5S2p0eCtpSnc4ZEh5eFpWbjlsYktGZmZVZEVLWnE5KzhSa1dsT2dp?=
 =?utf-8?B?Yk5JQnE4SnFER1VodDZnNFhNVkdpbHg0MlY4aFRGaXVBQVpkNUZ0VWV4RFR0?=
 =?utf-8?B?bjJWb1NuWnhXUUZHQjZnT3FWY3BBR25JWWIzNmM2ZlRFdkNxVmgrUFdsUjBy?=
 =?utf-8?B?YmxGRmFIQWF3OUthd3hLTVJ1SGJLdTFhODl1NW9kczA3SE9CK1RqU1VDSXZF?=
 =?utf-8?B?TEhMeThrRzhZVHg4WHBPdlh6ZkF1N3F1MzVPSzRvQWFRblRnN041UnUrUlVO?=
 =?utf-8?B?Uzk1ZE5ldlZCdWhiQ0NEUVdkdEpwREhoZlYzYXZQR1d3eVM3dVQ0dWNxR3oy?=
 =?utf-8?B?czBxTkhlTktlMkE0Y2Z6RTJCU2ZKdXU2RDczaW5FZFhsVFdkNXJSZjNjWEFU?=
 =?utf-8?B?TThtT2hkbFlTSlFNZFZxaWcvcmN4M01EWHdXQThTRzJMRmRLazZRblpTSWtr?=
 =?utf-8?B?VlRvYXRzVzRCaFBxUVBxbVFJMVFTSkFXK3ZDNHU0OVRXS2x5OVZaTXU5RVhZ?=
 =?utf-8?B?N3dCN2I5RVkyREZnNHEvZjBDNmV4d2Y3RzltQ0hxMktOVnlKWVJpZEx3UDI5?=
 =?utf-8?B?Z2doTERzWnV6WW5haVk2QnhmaU9wRkgrcTBMS1FzTStmZFhGeWE4RXRmSTFZ?=
 =?utf-8?B?cHBtTHFBVno1V3Z4WUdqbGhiZEViSmRkV2RURElKVS9PSHIyYytQd2ppTjBj?=
 =?utf-8?B?WEhGcTRCYVpNcU9EcWJiNTJIbU94aENkWHhvaVRPSTJRcTJSekRIdWREeVls?=
 =?utf-8?B?K2QyNnhMR3RZWHNYbTJNY0ZCNUp4aVc1cE5JMGRxb2dkNlo1dFMzNEkxMjN5?=
 =?utf-8?B?cmRBTFJ1b3JmWmdvQU1XN2tRT1RqdTM4cjh6dDBRcU1GNURSUjhXeEdXRTl2?=
 =?utf-8?B?SnF4VWxlR0p3cGJWMDVWMnd3NGpzSnVpU3ZQa2xoN0xUUkxDY1Z0dFdpTG9N?=
 =?utf-8?B?NUpVZFlwZjg2TlZhaDJaTWFRTzhDR0tROWxFWnBqUlJtdFhxOGh1NEJ4Q29H?=
 =?utf-8?B?ZCtDaG1HNHdOU0JIeHdFVHlYS0pSdzNNZXNLUVB6eHNlWUFaci9DRmRPTHhO?=
 =?utf-8?B?eWxING5Md0FBVDhMUFdVWldjWkFhcmhIMjcyRG5Qamc0QmhUTFp6eTJOckRT?=
 =?utf-8?B?dTl6Z1lNMmlJVCtrUDZZb3o2Zzg0MkJ1QXVjaGlnQk8xMXU0aGVFV2o3WGls?=
 =?utf-8?B?MkI0SkY5ZmZ4ZkplYlBDdmtiK21say96aVNRRVBvRnFIN2NxZERTQmViZkYv?=
 =?utf-8?B?aXpsbi9UclZ0Q1lmL2RsakVmZEtrU2FZWVF0Z3lKSXN0UEhvZEF4TFIrakEw?=
 =?utf-8?B?V0NNREdLaUpiK1dOVW9IeW1KeldwcG1TbERtU2cxc2g3ell0Qkp3YXVGc2Fn?=
 =?utf-8?B?SDlEVEl4U1QxMXNWL0xDcWxKZTQrM0F1ZHhCbyt3cll5aGxWQWdXNDBtWDNm?=
 =?utf-8?B?aEhkZ0VCeXhubzNKV3h4MXFrK2E4bFRrbTBPT2VVSm81Y2xiZ0tzSVZCbWFY?=
 =?utf-8?B?Tk1yUW9OOFBJc29vMUVEeFp5elBsZ1BQd1RIeDZwWkVuOGdSd3puWmc1MUsx?=
 =?utf-8?B?bHRVdkJJVFVHZjlEbFg2MktYVlcwWTRuOUlKclpNUW0zVEowTDU2QUlCRWRs?=
 =?utf-8?B?Ykx0UkVBdWRBLzU5UGpZYVFWNkVuRDhhRUtFOGtaMXZtOHJlMmw4WHhmV3k4?=
 =?utf-8?Q?hg9SaTttoGe9lGQdzg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b2357e-a0c2-45ca-3524-08d97a701c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 06:46:57.0097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVuAcx1UJzg25U5uwPcjJoaE72qvn6KpG3VZ21+0zQpk8pptK8Al7YA0UgM5whTMzoe/HEAnaWMVNUGc36JJOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4369
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.109 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mRU7y-0001Jr-QR
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
From: =?utf-8?B?5bi45Yek5qWg?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDE3LCAyMDIxIDk6MDAgUE0NCj4gVG86IOW4uOWHpOal
oCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnDQo+IENjOiBsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDIvMl0gZjJmczogZml4IG1pc3NpbmcgaW5wbGFjZSBjb3VudCBpbiBvdmVyd3JpdGUgd2l0
aA0KPiBkaXJlY3QgaW8NCj4gDQo+IE9uIDIwMjEvOS8xNyAxODoxOSwg5bi45Yek5qWgIHdyb3Rl
Og0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
5bi45Yek5qWgDQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjEgODo0NiBQ
TQ0KPiA+PiBUbzogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPjsgamFlZ2V1a0BrZXJuZWwub3Jn
DQo+ID4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiA+PiBT
dWJqZWN0OiBSRTogW1BBVENIIHYyIDIvMl0gZjJmczogZml4IG1pc3NpbmcgaW5wbGFjZSBjb3Vu
dCBpbg0KPiA+PiBvdmVyd3JpdGUgd2l0aCBkaXJlY3QgaW8NCj4gPj4NCj4gPj4NCj4gPj4NCj4g
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBjaGFuZ2ZlbmduYW5A
dml2by5jb20gPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9mDQo+ID4+IENoYW8N
Cj4gPj4+IFl1DQo+ID4+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDE2LCAyMDIxIDg6MTAg
UE0NCj4gPj4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtA
a2VybmVsLm9yZw0KPiA+Pj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0DQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZjJmczogZml4IG1pc3Npbmcg
aW5wbGFjZSBjb3VudCBpbg0KPiA+Pj4gb3ZlcndyaXRlIHdpdGggZGlyZWN0IGlvDQo+ID4+Pg0K
PiA+Pj4gT24gMjAyMS85LzE2IDE5OjMwLCBGZW5nbmFuIENoYW5nIHdyb3RlOg0KPiA+Pj4+IEZv
ciBub3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBpbnBsYWNlIHBvbGljeSwg
YnV0IG5vdA0KPiA+Pj4+IGNvdW50ZWQsIGZpeCBpdC4gQW5kIHVzZSBzdGF0X2FkZF9pbnBsYWNl
X2Jsb2NrcyhzYmksIDEsICkgaW5zdGVhZA0KPiA+Pj4+IG9mIHN0YXRfaW5jX2lucGxhY2VfYmxv
Y2tzKHNiLCApLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8
Y2hhbmdmZW5nbmFuQHZpdm8uY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgIGZzL2YyZnMvZGF0
YS5jICAgIHwgNyArKysrKystDQo+ID4+Pj4gICAgZnMvZjJmcy9mMmZzLmggICAgfCA4ICsrKyst
LS0tDQo+ID4+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAyICstDQo+ID4+Pj4gICAgMyBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMgaW5kZXgNCj4g
Pj4+PiBjMTQ5MGI5YTEzNDUuLjBjNTcyOGQ2M2MzMyAxMDA2NDQNCj4gPj4+PiAtLS0gYS9mcy9m
MmZzL2RhdGEuYw0KPiA+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jDQo+ID4+Pj4gQEAgLTE0OTEs
NiArMTQ5MSw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwNCj4g
Pj4+PiBzdHJ1Y3QNCj4gPj4+IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLA0KPiA+Pj4+ICAgIAkJaWYg
KGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPKQ0KPiA+Pj4+ICAgIAkJCWYyZnNfd2FpdF9vbl9i
bG9ja193cml0ZWJhY2tfcmFuZ2UoaW5vZGUsDQo+ID4+Pj4gICAgCQkJCQkJbWFwLT5tX3BibGss
IG1hcC0+bV9sZW4pOw0KPiA+Pj4+ICsJCWlmICghZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcg
PT0gRjJGU19HRVRfQkxPQ0tfRElPICYmDQo+ID4+Pj4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkN
Cj4gPj4+PiArCQkJc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBtYXAtPm1fbGVuLCB0cnVl
KTsNCj4gPj4+PiAgICAJCWdvdG8gb3V0Ow0KPiA+Pj4+ICAgIAl9DQo+ID4+Pj4NCj4gPj4+PiBA
QCAtMTU1Myw3ICsxNTU2LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLA0KPiA+Pj4+IHN0cnVjdA0KPiA+Pj4gZjJmc19tYXBfYmxvY2tzICptYXAsDQo+ID4+Pj4g
ICAgCQkJCWdvdG8gc3luY19vdXQ7DQo+ID4+Pj4gICAgCQkJYmxrYWRkciA9IGRuLmRhdGFfYmxr
YWRkcjsNCj4gPj4+PiAgICAJCQlzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5EX1dSSVRF
KTsNCj4gPj4+PiAtCQl9DQo+ID4+Pj4gKwkJfSBlbHNlIGlmICghY3JlYXRlICYmICFmMmZzX2xm
c19tb2RlKHNiaSkgJiYgZmxhZyA9PQ0KPiA+Pj4gRjJGU19HRVRfQkxPQ0tfRElPICYmDQo+ID4+
Pj4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkNCj4gPj4+DQo+ID4+PiBXaHkgbm90DQo+ID4+Pg0K
PiA+Pj4gfSBlbHNlIGlmIHshZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRf
QkxPQ0tfRElPICYmDQo+ID4+PiAJCQkJCW1hcC0+bV9tYXlfY3JlYXRlKQ0KPiA+Pj4NCj4gPj4N
Cj4gPj4gWW91IGFyZSByaWdodCwgbm8gbmVlZCB0byBjaGVjayBjcmVhdGUgLg0KPiA+Pg0KPiA+
IFRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlLCBpZiByZW1vdmUgY3JlYXRlIGNoZWNrLCB3aGVuIGNy
ZWF0ZSBmaWxlIGFuZA0KPiA+IHdyaXRlIHdpdGggZGlyZWN0IGlvLCBJdCB3aWxsIGNvdW50IGlu
IExGUyBhbmQgSVBVIGJvdGgsIGJlY2F1c2UNCj4gPiBwcmVhbGxvY2F0ZSBibG9jayBhZGRyIGZp
cnN0LiBTbywgV2Ugc3RpbGwgbmVlZCBjaGVjayBjcmVhdGUuDQo+ID4gQW0gSSByaWdodD8NCj4g
DQo+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgYmVsb3cgY2FzZSB3LyB5b3VyIG9yaWdpbmFsIHBh
dGNoOg0KPiANCj4geGZzX2lvIC1mIGZpbGUgLWMgInB3cml0ZSAwIDhrIiAtYyAiZnN5bmMiDQo+
IHhmc19pbyBmaWxlIC1jICJmcHVuY2ggMCA0ayINCj4geGZzX2lvICAtYyAib3BlbiAtZCBmaWxl
IiAtYyAicHdyaXRlIC1iIDRrIDAgOGsiDQo+IA0KPiBJdCBhY2NvdW50cyBvbiBib3RoIElQVSBh
bmQgTEZTIHN0YXRzLg0KDQpNeSBvcmlnaW4gcGF0Y2ggaXMgbmVlZCBjaGVjayBjcmVhdGU6DQpA
QCAtMTU1Myw3ICsxNTU2LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsDQogCQkJCWdvdG8gc3luY19vdXQ7DQog
CQkJYmxrYWRkciA9IGRuLmRhdGFfYmxrYWRkcjsNCiAJCQlzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfQVBQRU5EX1dSSVRFKTsNCi0JCX0NCisJCX0gZWxzZSBpZiAoIWNyZWF0ZSAmJiAhZjJmc19s
ZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmDQorCQkJCW1hcC0+
bV9tYXlfY3JlYXRlKQ0KKwkJCXN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgdHJ1ZSk7
DQoNCkFuZCBiZWxvdyBjYXNlIGxvb2tzIGNvcnJlY3QsIFNvIEkgdGhpbmsgY2hlY2sgY3JlYXRl
IGlzIG5lY2Vzc2FyeS4NCg0Kcm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyBjYXQgL3N5cy9r
ZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMNCg0KICAgICAgICAgICBidWZm
ZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzDQpJUFU6ICAgICAgICAgICAgMCAgICAgICAgICAwICAg
ICAgICBOL0ENClNTUjogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMA0KTEZTOiAg
ICAgICAgICA1NDIgICAgICAgICAgMCAgICAgICAgICAxDQoNCkJERjogOTksIGF2Zy4gdmJsb2Nr
czogNDg4DQpyb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIHhmc19pbyAtZiBmaWxlIC1jICJw
d3JpdGUgMCA4ayIgLWMgImZzeW5jIg0Kd3JvdGUgODE5Mi84MTkyIGJ5dGVzIGF0IG9mZnNldCAw
DQo4IEtpQiwgMiBvcHM7IDAuMDA3OCBzZWMgKDEwMTQuMDcwIEtpQi9zZWMgYW5kIDI1My41MTc2
IG9wcy9zZWMpDQpyb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIGNhdCAvc3lzL2tlcm5lbC9k
ZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcCBTU1IgLUMgMw0KDQogICAgICAgICAgIGJ1ZmZlciAgICAg
ZGlyZWN0ICAgc2VnbWVudHMNCklQVTogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgIE4v
QQ0KU1NSOiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwDQpMRlM6ICAgICAgICAg
IDU0NSAgICAgICAgICAwICAgICAgICAgIDENCg0KQkRGOiA5OSwgYXZnLiB2YmxvY2tzOiA0ODgN
CnJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQvdGVzdCMgeGZzX2lvIGZpbGUgLWMgImZwdW5jaCAwIDRr
Ig0Kcm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJm
cy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMNCg0KICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAg
IHNlZ21lbnRzDQpJUFU6ICAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICBOL0ENClNTUjog
ICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMA0KTEZTOiAgICAgICAgICA1NDUgICAg
ICAgICAgMCAgICAgICAgICAxDQoNCkJERjogOTksIGF2Zy4gdmJsb2NrczogNDg4DQpyb290QGt2
bS14ZnN0ZXN0czovbW50L3Rlc3QjIHhmc19pbyAgLWMgIm9wZW4gLWQgZmlsZSIgLWMgInB3cml0
ZSAtYiA0ayAwIDhrIg0Kd3JvdGUgODE5Mi84MTkyIGJ5dGVzIGF0IG9mZnNldCAwDQo4IEtpQiwg
MiBvcHM7IDAuMDMyMiBzZWMgKDI0OC4xODUgS2lCL3NlYyBhbmQgNjIuMDQ2MyBvcHMvc2VjKQ0K
cm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9z
dGF0dXMgfGdyZXAgU1NSIC1DIDMNCg0KICAgICAgICAgICBidWZmZXIgICAgIGRpcmVjdCAgIHNl
Z21lbnRzDQpJUFU6ICAgICAgICAgICAgMCAgICAgICAgICAyICAgICAgICBOL0ENClNTUjogICAg
ICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMA0KTEZTOiAgICAgICAgICA1NDUgICAgICAg
ICAgMSAgICAgICAgICAxDQoNCkJERjogOTksIGF2Zy4gdmJsb2NrczogNDg4DQoNCg0KPiANCj4g
VGhhbmtzLA0KPiANCj4gPg0KPiA+IFRoYW5rcy4NCj4gPg0KPiA+PiBUaGFua3MuDQo+ID4+PiBU
aGFua3MsDQo+ID4+Pg0KPiA+Pj4+ICsJCQlzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIDEs
IHRydWUpOw0KPiA+Pj4+ICAgIAl9IGVsc2Ugew0KPiA+Pj4+ICAgIAkJaWYgKGNyZWF0ZSkgew0K
PiA+Pj4+ICAgIAkJCWlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7IGRpZmYgLS1n
aXQNCj4gPj4+PiBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXggM2Q0ZWU0
NDRkYjI3Li4yZDgxZTlmMGEwZWUNCj4gPj4+PiAxMDA2NDQNCj4gPj4+PiAtLS0gYS9mcy9mMmZz
L2YyZnMuaA0KPiA+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oDQo+ID4+Pj4gQEAgLTM3ODUsMTIg
KzM3ODUsMTIgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZjJmc19zdGF0X2luZm8NCj4gPj4+ICpG
MkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQ0KPiA+Pj4+ICAgIAkJZWxzZQkJCQkJ
CQkJXA0KPiA+Pj4+ICAgIAkJCSgoc2JpKS0+YmxvY2tfY291bnRbMV1bKGN1cnNlZyktPmFsbG9j
X3R5cGVdKyspOwlcDQo+ID4+Pj4gICAgCX0gd2hpbGUgKDApDQo+ID4+Pj4gLSNkZWZpbmUgc3Rh
dF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpLCBkaXJlY3RfaW8pCQkJCQlcDQo+ID4+Pj4gKyNkZWZp
bmUgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBjb3VudCwgZGlyZWN0X2lvKQkJCVwNCj4g
Pj4+PiAgICAJZG8gewkJCQkJCQkJXA0KPiA+Pj4+ICAgIAkJaWYgKGRpcmVjdF9pbykJCQkJCQlc
DQo+ID4+Pj4gLQkJCShhdG9taWNfaW5jKCYoc2JpKS0+aW5wbGFjZV9jb3VudFswXSkpOwkJXA0K
PiA+Pj4+ICsJCQkoYXRvbWljX2FkZChjb3VudCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzBdKSk7
ICBcDQo+ID4+Pj4gICAgCQllbHNlCQkJCQkJCQlcDQo+ID4+Pj4gLQkJCShhdG9taWNfaW5jKCYo
c2JpKS0+aW5wbGFjZV9jb3VudFsxXSkpOwkJXA0KPiA+Pj4+ICsJCQkoYXRvbWljX2FkZChjb3Vu
dCwgJihzYmkpLT5pbnBsYWNlX2NvdW50WzFdKSk7CVwNCj4gPj4+PiAgICAJfSB3aGlsZSAoMCkN
Cj4gPj4+PiAgICAjZGVmaW5lIHN0YXRfdXBkYXRlX21heF9hdG9taWNfd3JpdGUoaW5vZGUpCQkJ
CVwNCj4gPj4+PiAgICAJZG8gewkJCQkJCQkJXA0KPiA+Pj4+IEBAIC0zODc3LDcgKzM4NzcsNyBA
QCB2b2lkIGYyZnNfdXBkYXRlX3NpdF9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8NCj4gPj4+ICpz
YmkpOw0KPiA+Pj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfbWV0YV9jb3VudChzYmksIGJsa2FkZHIp
CQlkbyB7IH0gd2hpbGUgKDApDQo+ID4+Pj4gICAgI2RlZmluZSBzdGF0X2luY19zZWdfdHlwZShz
YmksIGN1cnNlZykJCQlkbyB7IH0gd2hpbGUgKDApDQo+ID4+Pj4gICAgI2RlZmluZSBzdGF0X2lu
Y19ibG9ja19jb3VudChzYmksIGN1cnNlZykJCWRvIHsgfSB3aGlsZSAoMCkNCj4gPj4+PiAtI2Rl
ZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmkpCQkJZG8geyB9IHdoaWxlICgwKQ0KPiA+
Pj4+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291bnQsIGRpcmVjdF9p
bykJCWRvIHsgfQ0KPiB3aGlsZQ0KPiA+Pj4gKDApDQo+ID4+Pj4gICAgI2RlZmluZSBzdGF0X2lu
Y19zZWdfY291bnQoc2JpLCB0eXBlLCBnY190eXBlKQkJZG8geyB9IHdoaWxlDQo+ICgwKQ0KPiA+
Pj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfdG90X2Jsa19jb3VudChzaSwgYmxrcykJCWRvIHsgfSB3
aGlsZSAoMCkNCj4gPj4+PiAgICAjZGVmaW5lIHN0YXRfaW5jX2RhdGFfYmxrX2NvdW50KHNiaSwg
YmxrcywgZ2NfdHlwZSkJZG8geyB9IHdoaWxlDQo+ICgwKQ0KPiA+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jIGluZGV4DQo+ID4+Pj4gZGVkNzQ0
ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50
LmMNCj4gPj4+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPiA+Pj4+IEBAIC0zNjExLDcgKzM2
MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dyaXRlX2RhdGEoc3RydWN0DQo+ID4+Pj4gZjJmc19p
b19pbmZvDQo+ID4+PiAqZmlvKQ0KPiA+Pj4+ICAgIAkJZ290byBkcm9wX2JpbzsNCj4gPj4+PiAg
ICAJfQ0KPiA+Pj4+DQo+ID4+Pj4gLQlzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhmaW8tPnNiaSwg
ZmFsc2UpOw0KPiA+Pj4+ICsJc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCBmYWxzZSk7
DQo+ID4+Pj4NCj4gPj4+PiAgICAJaWYgKGZpby0+YmlvICYmICEoU01fSShzYmkpLT5pcHVfcG9s
aWN5ICYgKDEgPDwNCj4gPj4gRjJGU19JUFVfTk9DQUNIRSkpKQ0KPiA+Pj4+ICAgIAkJZXJyID0g
ZjJmc19tZXJnZV9wYWdlX2JpbyhmaW8pOw0KPiA+Pj4+DQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

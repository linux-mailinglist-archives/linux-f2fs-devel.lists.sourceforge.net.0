Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9789424A4F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Oct 2021 01:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Og6GsfKIkjbs9QqsFYac+r0fR0SiE/1bE65Q0ChGm5w=; b=MZq/BdLVgszbD4lFtnGmdgV/y
	ZjueFSscAaznBtiQhq81IUbVTv/fCPF5GgAHGZjXtjtnFojs2kmEa4ljzgWwdsa47O9sgMdmpVwsc
	mkJaWk10oG+7yLiM4/5isnortjc3u4tPaCnDkW3wsfPb4qDOmZC5a5h4IJCMefnOSO69k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mYFwr-0006Pi-GM; Wed, 06 Oct 2021 23:03:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=99131e666c=terrelln@fb.com>)
 id 1mYFwo-0006PW-R5; Wed, 06 Oct 2021 23:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hT0oysu5TxwAjHP4zgGf1o1Uh1YfE62eIIG8hEemxhE=; b=C+Ag5v60+/yvruAPDujXSUlzcJ
 ZiyFxNQPEGEvcppCSNx/D8b3TvR1jool8jzM6FCDEmMNxB53KaWmIDQhD5bjSpisjSfmONC2tyTLO
 fwAh5ynat+42NyB+1iniirDgSYXMvkpwRkDcbv7ydv7PAneG9LX522/ly4CNse3EB8JU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hT0oysu5TxwAjHP4zgGf1o1Uh1YfE62eIIG8hEemxhE=; b=MdQqNzfVB0YqzCkVqKm0Ppi6V4
 TiIYoKUVF9ds0P7TrkW+2Ins2teKcjq2tG0vidDSjiJrnoT06J45mUVTpFzg0tENx3u0uB9ISVPao
 ne/sbuk66jaIGhcC6S8yZfzsoOFRzzOwwlw3izxqWVm+voRQU64mlvcQPUxt3EKJgUv8=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mYFwn-0008Ik-Tk; Wed, 06 Oct 2021 23:03:38 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 196M3JeB027146;
 Wed, 6 Oct 2021 16:03:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=hT0oysu5TxwAjHP4zgGf1o1Uh1YfE62eIIG8hEemxhE=;
 b=I/6ZaqZNvJB2md6PqshqdWfcm1KfARSXuIsvpAUkM+hThR2+IfSM1/SvPDraLubnyzTQ
 cYJsm5iiVrKby05jNkberyyeyeXq9ERea/RNbwhoGtyllyPC3ktBvp34UZlh19v+akvS
 ZPa7312jw2/jtFCDJ05IIV3SC7eKYSur8qo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 3bhfn52py1-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Oct 2021 16:03:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 6 Oct 2021 16:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0Dg8CVFp9KJ9T6Gl0fGLi/mOGp/pKwwn42l50o+CI4uGPAYi7kTSBiKINsgYcwDCOdOkyClHzI2noLooL/hG2J1YGFFfKDyUZoXVgIGqS9A/j+Ctzw/hlv8jxf9Nsjr9jafPW+kD1MLGIndLu93gOj6eLYLUlpaJvAwLV8j43jHg/KhH8TSKDrgA9ztQU0EuoEmmYoQ0EcDq6tbfb1lWNh/bhEA9ibL24qh671PF0BsyhDYiF+MbC1KL86gdim0Ayhh0zL4QfjlKMLcSj7R4itLpI30Z7vRnwUodu/JwSnEonJZPD5oqOD4mGHNZjoa56MZoxJGEodTaTNmb9mX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D/iydb7SIt+RCeUTLTQnamyjHAQRnflAk0ltnj1dXE=;
 b=a8+D4zoEJe2IvDcebALkHXc+36/YoCWk25BMHI/T1h0x8NJR2AUf8uRI9NxaKI+MMUwYL7CFuI9ZrsxrkE3dvAE2iRGQVrD9sdP8jCcuF41YUjfapXIfe0vGRCaCc2HX+WcHe25aBglGmlvMQZ8Lkfz72Qv08w+zCScdB1KJLeQ+WGgdGHxhZKsKuQJ2CUrLgx94XvX6kX+v7TKEWk+ww9kn2cSyN1asaNq3pkCc6kaSko1MGBjtgbYG3nS46ZvzS4nLMDMC/YZsxGPuugi2LM3V8YNNBCfbyd3sP7+8mIDvEUev7LzNSzaiut2VPqifknh0b4Iobhg9j2UfkFMzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2408.namprd15.prod.outlook.com (2603:10b6:a02:85::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 23:03:13 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 23:03:13 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>
Thread-Topic: [GIT PULL] zstd changes for linux-next
Thread-Index: AQHXuucnonKCNq5MGk+iLwJl5wvHnavGhIcAgAASVYA=
Date: Wed, 6 Oct 2021 23:03:12 +0000
Message-ID: <C30256C9-AB58-4A3A-89A7-737A21E46055@fb.com>
References: <20211006191724.3187129-1-nickrterrell@gmail.com>
 <20211007085734.657b32b3@canb.auug.org.au>
In-Reply-To: <20211007085734.657b32b3@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1343c9f7-3ad6-43c8-0479-08d9891d7935
x-ms-traffictypediagnostic: BYAPR15MB2408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB24087DBC5C8B7FB435F265E5ABB09@BYAPR15MB2408.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: azH6nCJCu8TdMAouovkpgOvTspxQPCRpcgkHuF2U6r3i7j8QFOjab0g6QGVMEZVNGwOi/LLDWle3dCpDQw9rxO/ZQJrF/WRfSQUt7QO4yKu0FfQ7fRs3QHvzfcao2Q2FQyJdBlyvvi0/uESjcoQWwylaUBe35cdIP1RkcHLKEQNJCVpc1YdiDq6kKFa+OkH2g3/UyxmXY2szmgsr4gTlYpblDkLI/LlDqOyNHHhvQ0K7LRQytyuBgEpEir8LKBay1JTa4/m/3bEYA1YG/p+0X8adtpOVPnRGWz+1Ed7FZE983hu0UmWE7xVhoiXKQ2giNkWoRtslakMuVxwgl2AIgHD+Ep42skX6j4/vaqwO2EsOBu4XaNONog6imGAsH3HZQ1/USKhoKTnh+R/aV+tYssP0lyrzelEL2s8uK5vXQJUI3Sij54OeNGrHoTidaxJxsFGdCIZhC187yNqj8BwZS/MTy9Gw6Mjb4oAjl8qh8Burl2n0xz7w/dEsnd8dD++b3lmEmEnW7BQezs15u1jdDLeXNetN//+D9hK85Pd6sQhqhdA/j4rxTVIAsY1J+1ogxL02x+jGUipwcLUN2aFVpehe83jGEaZI3z7dAqiJOC9gAuHEfsram6mNGj78cNqF1scXvdLpEyrUYu6bQF4PztmGyVh+G2nTfHcK6QOQ5+8xT9jAYfgfjDJfp4MmIOwVkSvhLShBSabspUDcOD3QF6q8pcbHO4virk8Beaj7UP6iFK/qqwKV9vHSx00J3cZcGjqv3j86EVA88h8NbbRkN5Q6cINEfqt3/MvkpAiwsyVHPwFvoPLNSgudrB6j1oi/9vqYrjVaNUvi/VQt/2cs5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(66556008)(71200400001)(76116006)(4326008)(966005)(8676002)(6916009)(122000001)(66476007)(316002)(54906003)(26005)(53546011)(38070700005)(186003)(66446008)(38100700002)(64756008)(6506007)(33656002)(8936002)(6512007)(5660300002)(508600001)(7416002)(36756003)(83380400001)(6486002)(2906002)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?61SXA1Wfi7GzBMkx6/D1UtzcKcsv4duPaaGhb54aAJM4Xl8lcbC/BYjwF5?=
 =?iso-8859-2?Q?HZWdTwkNiLXafF4dRZbm2Lsmsfg6rjBCrkq3pLe8ddwDrIrWa91jfXQ7UR?=
 =?iso-8859-2?Q?5bIkrsslMMvhGsfHqquiBGFS0KQOvOjIWTFTmCXOKxwfjBODEMtHuIPMUc?=
 =?iso-8859-2?Q?ZhTRUUQbWTJMfCaH3GJGvAP6BcPJeww8XUxnW+u/l2zwUT2DWQJZxPTnY9?=
 =?iso-8859-2?Q?hCCARQjVCMyIOQ5LN2Iu9HkGDqFDFWD+WzfZVpojak6+Rkoh7tmU45dRQQ?=
 =?iso-8859-2?Q?cpRBqm3ENqTI8OIz8jzQvQmzTIMSusBHbvWaIJvNcK3Am/b6AIWqM+uqRe?=
 =?iso-8859-2?Q?xr7L3Dbju/8d3MSM986+jJ6FU4nrFTM5YB5+PC+RSgWcVu2QdTxLe+oIhJ?=
 =?iso-8859-2?Q?EJpm5k/R3dRVN7i1nt3wCMbM15YTPKRXkYeIgOmCvzi+vuIoPVbZ481drF?=
 =?iso-8859-2?Q?llhTCkCRiX9kjibHm2xSgob6aUqBqF6NeA4IoWsN95ivuUUlHrf5zMA8JB?=
 =?iso-8859-2?Q?Kp4dvOxYJubL019qy6I4XrKSRtI/cctogUW9Hv/cwgOXVECct72tce7tbk?=
 =?iso-8859-2?Q?kPaSuDvWLC7iTYBTyAoHQ4PxjymR36h3/oOGfrbDXXX19VsWNIo4GyoWF6?=
 =?iso-8859-2?Q?hOPK2ABoJU5FmHqWKxQotVlyLO15qBNmsqgf3zamdkibJuapZor5GOBBrl?=
 =?iso-8859-2?Q?SzxMmAeOYgQYQg88zqDM0xqn+nnr0zc4OFQ8FNYwSZnzCBvyWS31apgCn6?=
 =?iso-8859-2?Q?XzO+LMf/FHfRMBCgFKF6vjApBLkmJDHP2StLmnZ1qqZSDWA8SCsXkbkENL?=
 =?iso-8859-2?Q?j+IJ9ilzCrbNgE1c651qt/G8gaYlykovgO95rTgdWAjtAOjVKlUaF4qVyb?=
 =?iso-8859-2?Q?Db+lpgcGr5RuiMedENVouetQGAlcJZzDMiS/zx+B+7ZvZ045LBM1gfOlpr?=
 =?iso-8859-2?Q?gqNKI9DBwkNpK+6qMvD2GXF9Kk/xxmfyZ/yEgrL25/3MyFWpdMSfnxL2u+?=
 =?iso-8859-2?Q?xGuJkGLLahsPOey3XJHBVj2Vn2K8EKaqpkfXFLx8okaFYDJ+i0pBigUN19?=
 =?iso-8859-2?Q?3DULfRc9zryc7gDqRgZiwLxXZGSetMUpTXVJao/GGjPZVyzKnClZ7H8yGQ?=
 =?iso-8859-2?Q?9JXHxU4JhkEXC0leAW9oJZwYbcP16KrT7ZG21L2sMYBSg9HJGea3+09KLE?=
 =?iso-8859-2?Q?Ouzo+WqitT+5hhpZptVVsFy+Lzh42ERGpV4sGq1lHgoirqWll4ChIo+0jK?=
 =?iso-8859-2?Q?6Ze8L+Xl6xH19F1I4ea94O6lSSWQOLKbV031h5HAEaTpDkdRpNfmloY3nf?=
 =?iso-8859-2?Q?U+qG1jDfaXAN4EDMgDEgG8+j8kfVIIx8AJjBPkDsZo5m3TnHwg7qSEx/ZS?=
 =?iso-8859-2?Q?Fam/1B0sDw?=
Content-ID: <409648F5E8269646A720664D2597A463@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1343c9f7-3ad6-43c8-0479-08d9891d7935
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 23:03:12.7901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBFkgwGk3rtLwHsNY1mD03W/NNlpNwBFeymC9GZ9GOWLIfXudua44WvFscElPy0F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2408
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: yZKY5AcuiQeeoVmlECTFp6zdTyjBtBnJ
X-Proofpoint-ORIG-GUID: yZKY5AcuiQeeoVmlECTFp6zdTyjBtBnJ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110060142
X-FB-Internal: deliver
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Oct 6, 2021, at 2:57 PM,
 Stephen Rothwell <sfr@canb.auug.org.au>
 wrote: > > Hi Nick, > > On Wed,
 6 Oct 2021 12:17:24 -0700 Nick Terrell <nickrterrell@gmail.com>
 wrote: >> >> From: Nick Terrell <t [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.153.30 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mYFwn-0008Ik-Tk
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for linux-next
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
 <squashfs-devel@lists.sourceforge.net>, Paul
 Jones <paul@pauljones.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, David Sterba <dsterba@suse.cz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tom Seewald <tseewald@gmail.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Oleksandr
 Natalenko <oleksandr@natalenko.name>, Kernel Team <Kernel-team@fb.com>,
 =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>, Eric
 Biggers <ebiggers@kernel.org>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Oct 6, 2021, at 2:57 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi Nick,
> 
> On Wed,  6 Oct 2021 12:17:24 -0700 Nick Terrell <nickrterrell@gmail.com> wrote:
>> 
>> From: Nick Terrell <terrelln@fb.com>
>> 
>> The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:
>> 
>>  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)
>> 
>> are available in the Git repository at:
>> 
>>  https://github.com/terrelln/linux.git zstd-1.4.10
>> 
>> for you to fetch changes up to a0ccd980d5048053578f3b524e3cd3f5d980a9c5:
>> 
>>  MAINTAINERS: Add maintainer entry for zstd (2021-10-04 20:04:32 -0700)
>> 
>> I would like to merge this pull request into linux-next to bake, and then submit
>> the PR to Linux in the 5.16 merge window. If you have been a part of the
>> discussion, are a maintainer of a caller of zstd, tested this code, or otherwise
>> been involved, thank you! And could you please respond below with an appropiate
>> tag, so I can collect support for the PR
> 
> Added to linux-next from today.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>     * submitted under GPL v2 (or later) and include the Contributor's
>        Signed-off-by,
>     * posted to the relevant mailing list,
>     * reviewed by you (or another maintainer of your subsystem tree),
>     * successfully unit tested, and 
>     * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Thanks Stephen!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

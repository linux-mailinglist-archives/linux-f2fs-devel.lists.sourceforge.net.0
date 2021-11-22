Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D844590E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Nov 2021 16:06:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mpAuC-00043W-6p; Mon, 22 Nov 2021 15:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chuck.lever@oracle.com>) id 1mpAuB-00043J-3J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Nov 2021 15:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LE5T/Zf3aYJhIqYXtCqAfGREqmL57zmQdUIC8CY/jSc=; b=XpaXeZe4p9BJN/QFn3xeNsb02u
 nPreOnP1xLGgNvxEsEhgWNK7gkjSsEKXu6nTh+NUdMMc46+HdVDtSsKLk8OR0qvFoNhFbb8U7g1me
 11Pf6LLeHH7+Dw9uOo66jvOdOIYC5T4lFzcncPZa/tQYRcBf2vwJt1WHE+/UsTWwMdq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LE5T/Zf3aYJhIqYXtCqAfGREqmL57zmQdUIC8CY/jSc=; b=h4eCXiC2szUQOELRC8+A5eqE4w
 X9OgKmUIJ/KsiPGm54lfgasTHH2bzsqRuKBBEpY6cOJEN+CeuFp9a59IUtD5E+Qhvk6VgvFpZaH25
 M/5iGBnsSjB3/4eA1zKsfWIpJgK66ESeMqRSle5XA2/EfkTo5lsCKne3ILW0Zar5fPpE=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mpAu9-004tt0-3e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Nov 2021 15:06:50 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMEEsgw007646; 
 Mon, 22 Nov 2021 15:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LE5T/Zf3aYJhIqYXtCqAfGREqmL57zmQdUIC8CY/jSc=;
 b=iFPu+haWrtZLr3FCWc2Fs3R+H24Dqllt2EXhxI0Oj84TMnNPjRdYuohkb7wKsZrLkdTA
 HbrFELlrq2Wvboi1AxI0r3Bm/d0kZ796/qG+xvcum83eD+FTITB2VSwE+nugVyVXgWZH
 488/9Np2rOSbVKG8EtWFyugCIsLCurJ4qSMjAdWIfFYbLd3NQ5lj+lGOiuZ5a0AUGUfx
 CrF4aR6jA8kfDwvDzxf/XYpX2JbL3sPeSbZ8MrgS7Y3utFhGXHBL7fChAWKV3sB9zgsv
 DqBrLscSk2ERGpnOESFiJGefV5SLAQGcwd7AmPQn6pMKsEs1vB1EqIybSWvSlJpgxlCG xQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg461ak12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 15:06:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMF6Yco123932;
 Mon, 22 Nov 2021 15:06:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3030.oracle.com with ESMTP id 3cep4wtr2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 15:06:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lkbgf3vWrfdnxgb8r82LNHlulPiTZOKhVULbVDx70+Q/grwbpVIw22+F/cuSzZRMuMEjGkhmP5lkDRhcBdpTZpaw2pfks2+635SEo0eBQPozdDfk8srBZK4+ICPFEzy6IWCTQrd/xACL5sHp8E1Bl/hTs4bb/4e+y3xogDQmrEe0f2us/hqm98+s+YpQY0AVrcITjpZyNc2Jmm8d6eZ7XdeEtNrLxHZEytBx/v8ntoYn2rsHpI9sxBW2XuVRHl/2Zr5/LRYNXMLz6nb5IsqMhM6RAOBs/uluyYbosHN5cWfgBuMngHqa4nEhrqCl6QfM6AnfIStocIzVgFYHoworCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE5T/Zf3aYJhIqYXtCqAfGREqmL57zmQdUIC8CY/jSc=;
 b=fshv/+2OJ6tLNusrSb7bAmkThyZU+OMCZUxb8D/gY+d3b2cTboFO06tITjO+1UDtYs0GMcHIXbdmF46p3dmA9GTfzskU4iQUFuANu8aQZXN8eJF0LwC+H7Dz4ArNLsZIIQ5gp6z7qlqQ/bNrXdhahyJP8Qwjru9agU/OWlnAUKCyhFG8j5iw6ngxW3TgX03jU+fX3wtV+0K4Ec9XkLSW3tuCtNsGgLwPv4Thos2yog4pBonAfaaqcUArHxWESm0Mzsq5KrdBVVX7tkTrG+DPtaug7GrHZGU7Po6U6+6SG3CUxZU72b7gs7k2yaR+FX0e3G0T/DE18XIWnDG4HoqAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE5T/Zf3aYJhIqYXtCqAfGREqmL57zmQdUIC8CY/jSc=;
 b=fbU0vcwzZ06IVVY0qxFEHgaFa2EfTA1G5zOomsgePFQKYE4AsBXyqXWN8aKYeC91WPOaM5s794F+5iIN7mD02trilppAExFleHpWeVB1JsZDfBw2Gd6UY/UoBcBwEXQhuYCmJ5AyJ4rhNV6Qkq0BNuPL9LredHAcC+Bh3QCVKQI=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB3463.namprd10.prod.outlook.com (2603:10b6:a03:118::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 15:06:33 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::48f2:bb64:cb4b:372f]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::48f2:bb64:cb4b:372f%7]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 15:06:33 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Neil Brown <neilb@suse.de>
Thread-Topic: [PATCH v2] MM: introduce memalloc_retry_wait()
Thread-Index: AQHX3z5z7K9wSNEtN0mv2FiO5P+VlqwPppQA
Date: Mon, 22 Nov 2021 15:06:33 +0000
Message-ID: <286F4A23-74EC-44E7-8734-CD378C2B5298@oracle.com>
References: <163712329077.13692.12796971766360881401@noble.neil.brown.name>
 <20211117055311.GS449541@dread.disaster.area>
 <163754371968.13692.1277530886009912421@noble.neil.brown.name>
In-Reply-To: <163754371968.13692.1277530886009912421@noble.neil.brown.name>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b789f3e5-f150-4b21-603f-08d9adc9abde
x-ms-traffictypediagnostic: BYAPR10MB3463:
x-microsoft-antispam-prvs: <BYAPR10MB3463FEFCC0D15E4C98676761939F9@BYAPR10MB3463.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYFTRdl45lqU7ZLBERIeiMgkKu9mOn5O8V6kJpntpFjuIi6G5lvYWt9STjDFWfpFACOvdIbyFlx+QIuBaostJjjOzF38lpjydBnpoBFa3jFF2PHP5nSWfXFKrDjWuqUgM5w9GXGO7vhF2PoltUKClXOQr9je6DABQdekx5I9AqMwr8JhSJ6+I+RwujTqx3jzroqoZw3Nw8DG7rF98CftEU38qc2cXtXO/KFyyPKAJ0fwimGecHK1k73/GN1VnCDaGNFy/oXlqa7c9GLPLuVNe9kvPxGMJl4frkOcvnmasEX1iOlYIUNcapf/MejYl9//M+Pa4gqfHHO48VNtJGc49BB8iKEuMBTMeIN4BQh1pDyue5oNL2e3XwwgzTwYqvSIorvtqYxzsuqr7hWB7e4gyUgVGZqULYyjerYvJdM2AdX2MNvsYFmSPraesq0xvVv/YxxEWPqPDtwz4Pf/I2Uy1QXoONE+sOM6e77x4E1a97LKfckiQ7ABP/eh1o9QJ+Q0p/4Wq4pC+ohckBNaui27Govj23KuKCRuCsOlPQYN5XUWNuODnQ90sYiTPgOtHApUOh/MdrcjcW0OgqvTLu1Kdyr5fS/bNm3FRdKAqTfOGOpxQHV2X5f4YLiemMcwLNqpdXByN6pRqqEAaaWih0BQYvtUyd1nqfiefDowfinQ7OGDltjSkm+VPKZ17J+AdCoW9+4JooTo9qFtM6vF+hVoUeHBZ9730gKIVkB3xTy+lnJTtQrrqcmKarMLyrOErwmF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(7416002)(2906002)(6916009)(6486002)(33656002)(30864003)(64756008)(66446008)(91956017)(36756003)(83380400001)(4326008)(53546011)(6506007)(71200400001)(54906003)(66946007)(186003)(38100700002)(66476007)(66556008)(2616005)(76116006)(38070700005)(316002)(122000001)(508600001)(5660300002)(26005)(8936002)(86362001)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sPp2iDm3cEhWgyyeM3Ach8AFy1i/2DDZMzPBbxRW+Cwx9sQjAJElqgE1inzz?=
 =?us-ascii?Q?MTjNk3B+1SIZ70/9ZaIs+hWfd87HQ1z8jkJ7snIvXL1WdDOb53BpW6NtdQsu?=
 =?us-ascii?Q?IMvz8Sq5PfW/Z7+Ska/JnsDJiu/VsjGvTjthQlGSXR22as1GEp13bArEL+eG?=
 =?us-ascii?Q?pmJd+69jPTt7I8GkWsWuAtm91vr/OsogtQMOCamWy3Upv6jPaxk/nHLafI/+?=
 =?us-ascii?Q?RxjrKB7GqH2V/YLX7qh7sv7PNiScvgc5nPkf+zTiQR2jv5fWf+b2/u5dwvaz?=
 =?us-ascii?Q?mO/Gg9ZB6YLP956usLRgtAkNJ9tloX6QUnGR76vbTeHDqlImVrKzf8wwt6BM?=
 =?us-ascii?Q?15Yw4uvk7TNKKNutobOaxyLmurfznFoyrmywJaMF+A4W6bOtQu3ZPi7Hvh84?=
 =?us-ascii?Q?k3G4YNw656x67y0Q87iHJ3yW0v16cw7NQfRjyrMN3REIYct5QLBvmIirHVk6?=
 =?us-ascii?Q?pbntNbAnOhMYGYkKHZcU5wn8VeOXRTcmPgGf/nSmqysgSN/dPiC8NYycTrGv?=
 =?us-ascii?Q?ACo1wKV3mi7Wb2z9WwBE1+/9YWTGj9okb5nUJ44/AOFOwj1drBGp+P7ruOVX?=
 =?us-ascii?Q?P9Nsy/KVPeE7gFpeUUppteBMg5CqjFRbIX/PhS8f9xe0phpOBciJ/OYworaI?=
 =?us-ascii?Q?vztygIuu7FEKkzF0ZwfwjQzvqXYqMe9aY01N+RJ2Pqcp3mSsg3rjwrAUrubG?=
 =?us-ascii?Q?rRTc7E0FheH5ZPyRXZisNDIpvyRUTQiBvc6ENzeCBUrkXyk7mA+F9ocDv0fy?=
 =?us-ascii?Q?GZwmrsNcuU3hIvCzOPQq7UFVVZ45TsD9sB+a5E05KNYg84rRDYb6h5JlaAev?=
 =?us-ascii?Q?qIBtckE1hq5GsBw0RKdCV0JvOhkmzBn9758wkL1L4o8LLwvqcbsSerdzQ+Ly?=
 =?us-ascii?Q?+wclv4ixsSHQklYqOYTKmKjrXKqtXhvbzNFyuR2SJLAwpeU+X+tWzlfxecL6?=
 =?us-ascii?Q?HBEVYPj234RMUcakdaBYwGcS66PfPz6jCUYdK8NFvg7N6jxV63ILJhTmcr8b?=
 =?us-ascii?Q?KbkIQ0zKvEV5QwR3GlUMysBf085kFnTVdxHrG1LzaDCO9Swk/MtzOg0kY3QY?=
 =?us-ascii?Q?Qp3CpsiuMk/rdk1dJXiEbuD9rpoDJQgmrRAIkCjbDq6RSjWU6blndQ82PpYP?=
 =?us-ascii?Q?34ya8papNKx4lHpFiZaT9jtwdjaBgnzZA6cl7L54Yjhb0wNLAl7ZqhC2gNrh?=
 =?us-ascii?Q?oDJVh3zZhsoPc0wXHwmLMPmjEtB6xRZErtlr9y1mXJIONC9RYBlIyprnwU4e?=
 =?us-ascii?Q?DWfzQ/7DUQs05KsO0W/H3CdBCUAbDr+tAw/j9yzrTTmAJRo0sU+2FbHY2YHp?=
 =?us-ascii?Q?VeBID4zMCe+Ymw3zoXGjYi/T9DFEN6NM+X6tuqTPAV9LBjd1z4QfJD2qYLvD?=
 =?us-ascii?Q?Qs267InWZiFkQ8EreDY/vhG5qKBnKI8uHCe9UP3qy4RpCqEqcygiO22XEdXS?=
 =?us-ascii?Q?6NHdI1Pg3Sf8Az5nEvplU/dbEQ8BVV9jtZrYv/Z3eZwwpIon1hu/S7LpHmRL?=
 =?us-ascii?Q?O+MK1YwclkAcBlATJsmAJCDm2hvyr6UFsvXduzzdV/tVNG3G9mgflj0JL+T5?=
 =?us-ascii?Q?Te3IDUE3rQ0DqxW6ApJPUUNHbkW1vv/TmkJjPuxUbjEUurmT7WBcSSYYqGhh?=
 =?us-ascii?Q?nK3vQa1jdDdxLK056TlCFLM=3D?=
Content-ID: <01CB2425B80EFE4CA6E6E1315F06A05C@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b789f3e5-f150-4b21-603f-08d9adc9abde
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 15:06:33.1372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBWJs6U8BiPvBd6gAhyWQWRaBvcgm0qWZvkQejmPm310LZ365Ghcu8NlUlrcDoMmArbwhN/8wsH9cVdGWkzZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3463
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220080
X-Proofpoint-GUID: e6w476ha3vDUKwgf8FxQxHoxmv_CGzSw
X-Proofpoint-ORIG-GUID: e6w476ha3vDUKwgf8FxQxHoxmv_CGzSw
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Nov 21, 2021, at 8:15 PM,
 NeilBrown <neilb@suse.de> wrote:
 > > > Various places in the kernel - largely in filesystems - respond to
 a > memory allocation failure by looping around and re-trying. [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.220.177.32 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.177.32 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mpAu9-004tt0-3e
Subject: Re: [f2fs-dev] [PATCH v2] MM: introduce memalloc_retry_wait()
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
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Michal Hocko <mhocko@suse.com>, Theodore Ts'o <tytso@mit.edu>, "Darrick J.
 Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Nov 21, 2021, at 8:15 PM, NeilBrown <neilb@suse.de> wrote:
> 
> 
> Various places in the kernel - largely in filesystems - respond to a
> memory allocation failure by looping around and re-trying.
> Some of these cannot conveniently use __GFP_NOFAIL, for reasons such as:
> - a GFP_ATOMIC allocation, which __GFP_NOFAIL doesn't work on
> - a need to check for the process being signalled between failures
> - the possibility that other recovery actions could be performed
> - the allocation is quite deep in support code, and passing down an
>   extra flag to say if __GFP_NOFAIL is wanted would be clumsy.
> 
> Many of these currently use congestion_wait() which (in almost all
> cases) simply waits the given timeout - congestion isn't tracked for
> most devices.
> 
> It isn't clear what the best delay is for loops, but it is clear that
> the various filesystems shouldn't be responsible for choosing a timeout.
> 
> This patch introduces memalloc_retry_wait() with takes on that
> responsibility.  Code that wants to retry a memory allocation can call
> this function passing the GFP flags that were used.  It will wait
> however is appropriate.
> 
> For now, it only considers __GFP_NORETRY and whatever
> gfpflags_allow_blocking() tests.  If blocking is allowed without
> __GFP_NORETRY, then alloc_page either made some reclaim progress, or
> waited for a while, before failing.  So there is no need for much
> further waiting.  memalloc_retry_wait() will wait until the current
> jiffie ends.  If this condition is not met, then alloc_page() won't have
> waited much if at all.  In that case memalloc_retry_wait() waits about
> 200ms.  This is the delay that most current loops uses.
> 
> linux/sched/mm.h needs to be included in some files now,
> but linux/backing-dev.h does not.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
> 
> Switched to io_schedule_timeout(), and added some missing #includes.
> 
> fs/ext4/extents.c        |  8 +++-----
> fs/ext4/inline.c         |  5 ++---
> fs/ext4/page-io.c        |  9 +++++----
> fs/f2fs/data.c           |  4 ++--
> fs/f2fs/gc.c             |  5 ++---
> fs/f2fs/inode.c          |  4 ++--
> fs/f2fs/node.c           |  4 ++--
> fs/f2fs/recovery.c       |  6 +++---
> fs/f2fs/segment.c        |  9 +++------
> fs/f2fs/super.c          |  5 ++---
> fs/xfs/kmem.c            |  3 +--
> fs/xfs/xfs_buf.c         |  2 +-
> include/linux/sched/mm.h | 26 ++++++++++++++++++++++++++
> net/sunrpc/svc_xprt.c    |  3 ++-
> 14 files changed, 56 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 0ecf819bf189..5582fba36b44 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -27,8 +27,8 @@
> #include <linux/slab.h>
> #include <linux/uaccess.h>
> #include <linux/fiemap.h>
> -#include <linux/backing-dev.h>
> #include <linux/iomap.h>
> +#include <linux/sched/mm.h>
> #include "ext4_jbd2.h"
> #include "ext4_extents.h"
> #include "xattr.h"
> @@ -4407,8 +4407,7 @@ int ext4_ext_truncate(handle_t *handle, struct inode *inode)
> 	err = ext4_es_remove_extent(inode, last_block,
> 				    EXT_MAX_BLOCKS - last_block);
> 	if (err == -ENOMEM) {
> -		cond_resched();
> -		congestion_wait(BLK_RW_ASYNC, HZ/50);
> +		memalloc_retry_wait(GFP_ATOMIC);
> 		goto retry;
> 	}
> 	if (err)
> @@ -4416,8 +4415,7 @@ int ext4_ext_truncate(handle_t *handle, struct inode *inode)
> retry_remove_space:
> 	err = ext4_ext_remove_space(inode, last_block, EXT_MAX_BLOCKS - 1);
> 	if (err == -ENOMEM) {
> -		cond_resched();
> -		congestion_wait(BLK_RW_ASYNC, HZ/50);
> +		memalloc_retry_wait(GFP_ATOMIC);
> 		goto retry_remove_space;
> 	}
> 	return err;
> diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> index 39a1ab129fdc..635bcf68a67e 100644
> --- a/fs/ext4/inline.c
> +++ b/fs/ext4/inline.c
> @@ -7,7 +7,7 @@
> #include <linux/iomap.h>
> #include <linux/fiemap.h>
> #include <linux/iversion.h>
> -#include <linux/backing-dev.h>
> +#include <linux/sched/mm.h>
> 
> #include "ext4_jbd2.h"
> #include "ext4.h"
> @@ -1929,8 +1929,7 @@ int ext4_inline_data_truncate(struct inode *inode, int *has_inline)
> retry:
> 			err = ext4_es_remove_extent(inode, 0, EXT_MAX_BLOCKS);
> 			if (err == -ENOMEM) {
> -				cond_resched();
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +				memalloc_retry_wait(GFP_ATOMIC);
> 				goto retry;
> 			}
> 			if (err)
> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> index 9cb261714991..1d370364230e 100644
> --- a/fs/ext4/page-io.c
> +++ b/fs/ext4/page-io.c
> @@ -24,7 +24,7 @@
> #include <linux/kernel.h>
> #include <linux/slab.h>
> #include <linux/mm.h>
> -#include <linux/backing-dev.h>
> +#include <linux/sched/mm.h>
> 
> #include "ext4_jbd2.h"
> #include "xattr.h"
> @@ -523,12 +523,13 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
> 			ret = PTR_ERR(bounce_page);
> 			if (ret == -ENOMEM &&
> 			    (io->io_bio || wbc->sync_mode == WB_SYNC_ALL)) {
> -				gfp_flags = GFP_NOFS;
> +				gfp_t new_gfp_flags = GFP_NOFS;
> 				if (io->io_bio)
> 					ext4_io_submit(io);
> 				else
> -					gfp_flags |= __GFP_NOFAIL;
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +					new_gfp_flags |= __GFP_NOFAIL;
> +				memalloc_retry_wait(gfp_flags);
> +				gfp_flags = new_gfp_flags;
> 				goto retry_encrypt;
> 			}
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9f754aaef558..aacf5e4dcc57 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -8,9 +8,9 @@
> #include <linux/fs.h>
> #include <linux/f2fs_fs.h>
> #include <linux/buffer_head.h>
> +#include <linux/sched/mm.h>
> #include <linux/mpage.h>
> #include <linux/writeback.h>
> -#include <linux/backing-dev.h>
> #include <linux/pagevec.h>
> #include <linux/blkdev.h>
> #include <linux/bio.h>
> @@ -2542,7 +2542,7 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
> 		/* flush pending IOs and wait for a while in the ENOMEM case */
> 		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
> 			f2fs_flush_merged_writes(fio->sbi);
> -			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
> +			memalloc_retry_wait(GFP_NOFS);
> 			gfp_flags |= __GFP_NOFAIL;
> 			goto retry_encrypt;
> 		}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a946ce0ead34..374bbb5294d9 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -7,7 +7,6 @@
>  */
> #include <linux/fs.h>
> #include <linux/module.h>
> -#include <linux/backing-dev.h>
> #include <linux/init.h>
> #include <linux/f2fs_fs.h>
> #include <linux/kthread.h>
> @@ -15,6 +14,7 @@
> #include <linux/freezer.h>
> #include <linux/sched/signal.h>
> #include <linux/random.h>
> +#include <linux/sched/mm.h>
> 
> #include "f2fs.h"
> #include "node.h"
> @@ -1375,8 +1375,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
> 		if (err) {
> 			clear_page_private_gcing(page);
> 			if (err == -ENOMEM) {
> -				congestion_wait(BLK_RW_ASYNC,
> -						DEFAULT_IO_TIMEOUT);
> +				memalloc_retry_wait(GFP_NOFS);
> 				goto retry;
> 			}
> 			if (is_dirty)
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 0f8b2df3e1e0..4c11254a07d4 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -8,8 +8,8 @@
> #include <linux/fs.h>
> #include <linux/f2fs_fs.h>
> #include <linux/buffer_head.h>
> -#include <linux/backing-dev.h>
> #include <linux/writeback.h>
> +#include <linux/sched/mm.h>
> 
> #include "f2fs.h"
> #include "node.h"
> @@ -562,7 +562,7 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
> 	inode = f2fs_iget(sb, ino);
> 	if (IS_ERR(inode)) {
> 		if (PTR_ERR(inode) == -ENOMEM) {
> -			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
> +			memalloc_retry_wait(GFP_NOFS);
> 			goto retry;
> 		}
> 	}
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 556fcd8457f3..219506ca9a97 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -8,7 +8,7 @@
> #include <linux/fs.h>
> #include <linux/f2fs_fs.h>
> #include <linux/mpage.h>
> -#include <linux/backing-dev.h>
> +#include <linux/sched/mm.h>
> #include <linux/blkdev.h>
> #include <linux/pagevec.h>
> #include <linux/swap.h>
> @@ -2750,7 +2750,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
> retry:
> 	ipage = f2fs_grab_cache_page(NODE_MAPPING(sbi), ino, false);
> 	if (!ipage) {
> -		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
> +		memalloc_retry_wait(GFP_NOFS);
> 		goto retry;
> 	}
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 6a1b4668d933..d1664a0567ef 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -8,6 +8,7 @@
> #include <asm/unaligned.h>
> #include <linux/fs.h>
> #include <linux/f2fs_fs.h>
> +#include <linux/sched/mm.h>
> #include "f2fs.h"
> #include "node.h"
> #include "segment.h"
> @@ -587,7 +588,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
> 	err = f2fs_get_dnode_of_data(&dn, start, ALLOC_NODE);
> 	if (err) {
> 		if (err == -ENOMEM) {
> -			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
> +			memalloc_retry_wait(GFP_NOFS);
> 			goto retry_dn;
> 		}
> 		goto out;
> @@ -670,8 +671,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
> 			err = check_index_in_prev_nodes(sbi, dest, &dn);
> 			if (err) {
> 				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC,
> -							DEFAULT_IO_TIMEOUT);
> +					memalloc_retry_wait(GFP_NOFS);
> 					goto retry_prev;
> 				}
> 				goto err;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index df9ed75f0b7a..40fdb4a8daeb 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -9,6 +9,7 @@
> #include <linux/f2fs_fs.h>
> #include <linux/bio.h>
> #include <linux/blkdev.h>
> +#include <linux/sched/mm.h>
> #include <linux/prefetch.h>
> #include <linux/kthread.h>
> #include <linux/swap.h>
> @@ -245,9 +246,7 @@ static int __revoke_inmem_pages(struct inode *inode,
> 								LOOKUP_NODE);
> 			if (err) {
> 				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC,
> -							DEFAULT_IO_TIMEOUT);
> -					cond_resched();
> +					memalloc_retry_wait(GFP_NOFS);
> 					goto retry;
> 				}
> 				err = -EAGAIN;
> @@ -424,9 +423,7 @@ static int __f2fs_commit_inmem_pages(struct inode *inode)
> 			err = f2fs_do_write_data_page(&fio);
> 			if (err) {
> 				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC,
> -							DEFAULT_IO_TIMEOUT);
> -					cond_resched();
> +					memalloc_retry_wait(GFP_NOFS);
> 					goto retry;
> 				}
> 				unlock_page(page);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 040b6d02e1d8..3bace24f8800 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -8,9 +8,9 @@
> #include <linux/module.h>
> #include <linux/init.h>
> #include <linux/fs.h>
> +#include <linux/sched/mm.h>
> #include <linux/statfs.h>
> #include <linux/buffer_head.h>
> -#include <linux/backing-dev.h>
> #include <linux/kthread.h>
> #include <linux/parser.h>
> #include <linux/mount.h>
> @@ -2415,8 +2415,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
> 		page = read_cache_page_gfp(mapping, blkidx, GFP_NOFS);
> 		if (IS_ERR(page)) {
> 			if (PTR_ERR(page) == -ENOMEM) {
> -				congestion_wait(BLK_RW_ASYNC,
> -						DEFAULT_IO_TIMEOUT);
> +				memalloc_retry_wait(GFP_NOFS);
> 				goto repeat;
> 			}
> 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> diff --git a/fs/xfs/kmem.c b/fs/xfs/kmem.c
> index 6f49bf39183c..c557a030acfe 100644
> --- a/fs/xfs/kmem.c
> +++ b/fs/xfs/kmem.c
> @@ -4,7 +4,6 @@
>  * All Rights Reserved.
>  */
> #include "xfs.h"
> -#include <linux/backing-dev.h>
> #include "xfs_message.h"
> #include "xfs_trace.h"
> 
> @@ -26,6 +25,6 @@ kmem_alloc(size_t size, xfs_km_flags_t flags)
> 	"%s(%u) possible memory allocation deadlock size %u in %s (mode:0x%x)",
> 				current->comm, current->pid,
> 				(unsigned int)size, __func__, lflags);
> -		congestion_wait(BLK_RW_ASYNC, HZ/50);
> +		memalloc_retry_wait(lflags);
> 	} while (1);
> }
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 631c5a61d89b..6c45e3fa56f4 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -394,7 +394,7 @@ xfs_buf_alloc_pages(
> 		}
> 
> 		XFS_STATS_INC(bp->b_mount, xb_page_retries);
> -		congestion_wait(BLK_RW_ASYNC, HZ / 50);
> +		memalloc_retry_wait(gfp_mask);
> 	}
> 	return 0;
> }
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index aca874d33fe6..aa5f09ca5bcf 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -214,6 +214,32 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
> static inline void fs_reclaim_release(gfp_t gfp_mask) { }
> #endif
> 
> +/* Any memory-allocation retry loop should use
> + * memalloc_retry_wait(), and pass the flags for the most
> + * constrained allocation attempt that might have failed.
> + * This provides useful documentation of where loops are,

"useful documentation" is a good thing, but to me that means
there's some auditing mechanism like a trace point. Getting
to this function seems like an exceptional event that should
be noted externally.

If memalloc_retry_wait() had a trace point, I'd be inclined
to remove trace_svc_alloc_arg_err().

(This comment is not an objection to your patch).


> + * and a central place to fine tune the waiting as the MM
> + * implementation changes.
> + */
> +static inline void memalloc_retry_wait(gfp_t gfp_flags)
> +{
> +	/* We use io_schedule_timeout because waiting for memory
> +	 * typically included waiting for dirty pages to be
> +	 * written out, which requires IO.
> +	 */
> +	__set_current_state(TASK_UNINTERRUPTIBLE);
> +	gfp_flags = current_gfp_context(gfp_flags);
> +	if (gfpflags_allow_blocking(gfp_flags) &&
> +	    !(gfp_flags & __GFP_NORETRY))
> +		/* Probably waited already, no need for much more */
> +		io_schedule_timeout(1);
> +	else
> +		/* Probably didn't wait, and has now released a lock,
> +		 * so now is a good time to wait
> +		 */
> +		io_schedule_timeout(HZ/50);
> +}
> +
> /**
>  * might_alloc - Mark possible allocation sites
>  * @gfp_mask: gfp_t flags that would be used to allocate
> diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
> index 1e99ba1b9d72..9cb18b822ab2 100644
> --- a/net/sunrpc/svc_xprt.c
> +++ b/net/sunrpc/svc_xprt.c
> @@ -6,6 +6,7 @@
>  */
> 
> #include <linux/sched.h>
> +#include <linux/sched/mm.h>
> #include <linux/errno.h>
> #include <linux/freezer.h>
> #include <linux/kthread.h>
> @@ -688,7 +689,7 @@ static int svc_alloc_arg(struct svc_rqst *rqstp)
> 			return -EINTR;
> 		}
> 		trace_svc_alloc_arg_err(pages);
> -		schedule_timeout(msecs_to_jiffies(500));
> +		memalloc_retry_wait(GFP_KERNEL);
> 	}
> 	rqstp->rq_page_end = &rqstp->rq_pages[pages];
> 	rqstp->rq_pages[pages] = NULL; /* this might be seen in nfsd_splice_actor() */
> -- 
> 2.33.1
> 

--
Chuck Lever





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

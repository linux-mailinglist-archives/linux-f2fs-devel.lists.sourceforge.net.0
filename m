Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CF44DED1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Nov 2021 01:09:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlK83-0003ls-Va; Fri, 12 Nov 2021 00:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=0950f18852=terrelln@fb.com>)
 id 1mlK82-0003lh-Ej; Fri, 12 Nov 2021 00:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DyONiDsfGurrCrorVqt+fZxGNWENBZk5nRuRuhHWR8=; b=S35g3GiStqr54DgKER60Dab/QK
 7/0BpkXQVjZ+JNYJvhW2DuskCrDw3GL/uAI0VIx81Lbo1h/hbQCDDTkoGUKsu+PYX7zB7cMiHeArc
 vPuwsYSe0tZvIHqiJeBtEbdpyaiT6NGVCk8wOC+o3I+dvPJGtN+MrzDd8aqQNwdQEHYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+DyONiDsfGurrCrorVqt+fZxGNWENBZk5nRuRuhHWR8=; b=hzo6jnh+o+y2mPg3SucchM0vQa
 Hfl6yMY4tvgsJUXrt5dzNFBCx7e9/NYraiskFIIGmak6cn9ijZmquFx6j0QNyLI8yYM215rpDWww6
 KWLxS20vuXwSI+Xd1d0jgr1DrYajfHwkFHS42rsCjY/b5OaYhYlRB4P8+y4kv/qIZ3Pk=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mlK7z-0005sO-Q3; Fri, 12 Nov 2021 00:09:15 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ABNvaP4030304; 
 Thu, 11 Nov 2021 16:08:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=+DyONiDsfGurrCrorVqt+fZxGNWENBZk5nRuRuhHWR8=;
 b=ajG9qgJn+ggOxmrMjJbuEfFYzpHJgXIzfOt4U4CIqtjsku3kAwS8cXs42V3rd/MMZBSe
 iWbUSwx0Zg0Uo4ksfvVSJbaSHVzdOvmw8QvWXS0J4xQRbEy4g5MJCrtLWG8GjLxW43l6
 T5+Oq1dEbqPXUq92C+CVLfZfWaWYLJz0DBE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3c9bp7rntx-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Nov 2021 16:08:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 11 Nov 2021 16:08:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml6bjy2rWQXrYQGYvgKHDjUybuySfQv3VwN80/Wde8FH03owtlAAGLJglt6C6lqSmGV+Nwu9KDnU4ZIHy6IYqmp3rtkuimSlvDet1Rgfva9G1IpYyhUZTiX1HI3CQlmoNtlEWMmPavTLbWhhYEG0I6JH6VNyb81ENjqGakMRuRv8du6xdh5VQAJcXraILG29R7qNgL5guvdRlhr6PTdxrIGNS8XbQxIn2UdXkPh7AxtI4UuGLsUHaTeDe4jPMb7zh+VETW0RWqFPt813v/lRoc3AyF3yDla0B9dRf1H4j6MyS9Czv1Cxt92xu/albALOr6c/T3kD8zakZVzCfWMWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DyONiDsfGurrCrorVqt+fZxGNWENBZk5nRuRuhHWR8=;
 b=cBpnDrBShAbF+Glxcuh8bArOq49DAAJPBqe/bECUyRtAkY3fxsJJkjTNjEyDjATexFdk2Si41OommjSf9+tqWJKb4Dew0ikTYUkFo/QAAp8APphkMBsY8QCzBtffjuT0Qt+I6raTXHs5O9Vv/XKEC341JniAYnFj8GRKbXHXJ58IxUWP1pOYhxXmezbYb8fcbi64nHmm4El26vbcYeXUXuoxfRp67DHxPPOWaiL40gFwa8+brdcxsRgMYFzvVLXtHNql0SqrsPyzqGa4ZmyB7/nNmOIjJwtOPHQqJ/LutYTrg6vH2fD3WhYopeJbqXY991lEZLs+B50IsZ6mctBfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by SJ0PR15MB4568.namprd15.prod.outlook.com (2603:10b6:a03:379::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 00:08:39 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4690.019; Fri, 12 Nov 2021
 00:08:39 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Thread-Topic: [GIT PULL] zstd changes for v5.16
Thread-Index: AQHX1QiBEf9PNrcT30asmDtzjP1LvKv9HIwAgAHY+wCAABNLgA==
Date: Fri, 12 Nov 2021 00:08:39 +0000
Message-ID: <26119F22-4C12-4549-A765-7630A3846D79@fb.com>
References: <20211109013058.22224-1-nickrterrell@gmail.com>
 <471E6457-AF14-4E84-9197-BF30C3DCFFEB@fb.com>
 <CAHk-=wg3Bqbn=V5kbd-5Rz9xzC_hNyOpNLPPTavZ1Zhdz1dt=w@mail.gmail.com>
In-Reply-To: <CAHk-=wg3Bqbn=V5kbd-5Rz9xzC_hNyOpNLPPTavZ1Zhdz1dt=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1f893a9-5e6c-4dfd-a0c3-08d9a5709494
x-ms-traffictypediagnostic: SJ0PR15MB4568:
x-microsoft-antispam-prvs: <SJ0PR15MB4568D05D64700D2BC855235CAB959@SJ0PR15MB4568.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qi3OKnMY9cWIf1c1yAL+IOu5z1Xx6B3j56PoN5XwlUkH2CxbSViWPLODNL3ul0kifa/rOug1/l/nSr2KAqZ73UbrPJoqjnZ25+QMhBQaDSUQXedmmjqRCZwK7qXni33YYBgD3M/w2wkbD6pydBEPLQ7LookeDUGkMy5B1EtSEZPbcKvQuqpzFSoMsfG/BFvSbkaAgMO/wt2vemGkEw4ue4jpTD/792z0HiDNtp61eysjrzP+J067fo1s5GcGh4Djkgq+3jyG4TQX6X8X9Ma7b2wWlNDv3QfX6jH6GuGQQy8ktaDVKJuor8ehxT98UHPjYaglp+ElPCg4t91X2b0U6z9EekDxrN5z44/jjcDwlp57/Fcas52h5gP/OypaDrdEx3IYIv4nFg9vO67DPHiUeWWqXpR2pONY8K6mjW0oMsCY2wl8Lj7qyPa10M3YCrPFBI1Nscu9U2RbtrVmwM0qKyyq9NF+rYAfmMRwjcPFhEEI5QK3/ZQ8fxDgETNC41UPQjoUPIscv1ec9gvx+CIucKW6cntXSxrjjXsOOn/plF5Q4OcStUwY2L6yWYf5fZHVNqSXPl9VcerY6XkQnqWtNNCU0dkvMNSrw7DcQyEXoOebF8c+CyuBqMvvyMLDpRh7QF0uTovtatJKcEtP4IWp98cd2LD256ibgJgO3r9ZrBmvLKdXDMxoQYKD58O2rUHWXTmcFzzqp1h8X8pNzqJlKcVlRxdiuLUhxVAQveFVIMMvvCiNyk05MVO+7YHtXShY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(4326008)(54906003)(7416002)(38100700002)(122000001)(508600001)(6486002)(33656002)(2616005)(8936002)(316002)(86362001)(8676002)(76116006)(66476007)(83380400001)(66446008)(64756008)(6512007)(66946007)(26005)(53546011)(186003)(36756003)(6506007)(6916009)(2906002)(71200400001)(5660300002)(66556008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjRoM0VjZ1V1UE1MVVoxK3VPQXlSU2I5WWQ3UDhjZlFKeGp0aitKMUh6clJm?=
 =?utf-8?B?YkdxakV4UWZsWXhOaGtTa0oyL1RvUVBuU090ajkzN3dqNDljNTcxVFNuVXd5?=
 =?utf-8?B?ODUzbXdRTURRTVE5dmFnSnVJQWV2NkJ2UTQ3eHZBYzBZcnpQekM0U3J0a0JU?=
 =?utf-8?B?b1Z0SHErNHNld0RROFhBNGxtS1NaUUpnTGFqYWJML3dwNjBqOVd0am50Y2FW?=
 =?utf-8?B?RVNjbW5rYkNBMTFjWWJ5L0ZFdGJkdnlCdXlmQVhuem5Kb0FTY3NTQ2dxOW1Q?=
 =?utf-8?B?SWJKbkNsTEwzV2pVcDdCZ240RkZ4d1NJTm80bzFIT2JaZTlGV0VqMzlhTmtS?=
 =?utf-8?B?aTc0V3lrb1pPT2t2TDRKVEpNS1hHVDh0LzR4R0JLK1lkTk1BN2lGZDJSMExX?=
 =?utf-8?B?NHNmc0J3YjVmdmZXUzRtQVhSN3BIOVgydmxIc01OVEpxN2I5ckdxUmZ2MXVp?=
 =?utf-8?B?eFVHdVZEZlRtdkVQR1lDaWpBRk0zMHJxVHFiWlRJRXJUSktuTFNvTFpkamQ0?=
 =?utf-8?B?OEE3REFoWllJaGVDQTBpYnZMRXdXOHNmL0FPUmo5dDVzU21DN3c2a0VaM01W?=
 =?utf-8?B?MTNDN0pzbDJ5RVR3Y1RsT0hCSWpySWRJRjl3d211K2U5WlpHS2gzN1phSjdV?=
 =?utf-8?B?NG1UdHd3ZVlnUzVWcWNCd3NKZzY4TFBsV3ZkY29JRlVlSzVqZnI0Q05aTXdC?=
 =?utf-8?B?M1NVUHk5ZW96dllOVWdNaVluWENveVQzdk5MNC9rN1dQc3p4N3NVMm1xWTV1?=
 =?utf-8?B?RmFrTDZHYWJ2NmRrV2o0Q0xwRis2clN0Q0xlMkYwUEVySVd2Zm5iUW9nUXpB?=
 =?utf-8?B?bDFTeWVRTzdKamVCVEs0NFVEalBjNXlqTUx5eXRJYjFYeVpYYm5rVGtXNHY4?=
 =?utf-8?B?aEpLNHYvYm0xd1RVeGxUS3RURWx2Ti9FK3BXL3p5SzUwUUxSYW56Wkd4TmJv?=
 =?utf-8?B?SFFUVFhMS3habHVNbUEwcmlEZFdtL2NUN0FUUDZnSWdSM0wzYXF2Uko3cFFM?=
 =?utf-8?B?UWFkSFpzZGRmNkxQZmRrUEgxTnJOYlc0c01Ia01WaEZYd2NjdzZuZDNpMjJs?=
 =?utf-8?B?Sm00dUFoMDAzN1I4ZUU5R2U1bUhoWTRVZGtISlZUS3JvWTRLcTNtNTB5T1kx?=
 =?utf-8?B?UXhRMVZqWTZQVkJ2dHpTeG9rZjFQSXIrOXJaTjhoeVQwekZKdmxWalNYVjk1?=
 =?utf-8?B?Uzk1NG5JbWhxNW1malhQRi8zUHRLRUNoZHlMa2RHWUQvZVp4QWx2blA4K0Yz?=
 =?utf-8?B?T3UzYzVuOG9mYmU4VUl6dTFybStJcUZkRnU5MEUwU3pLbEJnc2J6bXZkY3hT?=
 =?utf-8?B?dUk2YmhzVElDckUxand2N28vTlZicmV2RjR0VVkwSE1TVmVVUVdZanpFbU9q?=
 =?utf-8?B?eU1WNnZocm90bFlUY3gvREpQczQrWFhGMzlTdDYvMWxFa2tveXB3L0pXV0kw?=
 =?utf-8?B?UWNZOXQxajZzTlBVVDZJemUzMWtUdTc1dnkrcGlYOEVweWlFYTNhSGdLZTlC?=
 =?utf-8?B?dHAxcEZXYVdKYTZMYjNtYk5uSHRialc2WGpRWWpTRVh4WCs3MTFZeHg5UkFn?=
 =?utf-8?B?OUVLYlpwSTArcFVid0hlNHZDRTZseEF0ZktORGFQTHdrQmUyTmJ4dCtTcUVw?=
 =?utf-8?B?QkR6T0VXTTY3b2FKamdvN0hrbUtFWTJZZ2hpMFFRelpaUGJSN2RUL1lKaGkz?=
 =?utf-8?B?ZE9IY2Z2VGtrYzVYeVNyZ3laejBrd0tEMk1vZFgvRjhFR281QnlqZDJiMmkv?=
 =?utf-8?B?VzlFWENhVjBjTkxIK3h3UUJRMXZXbE5JRXZ4cUlwNUZaSkNyLzNxa2oxQXZO?=
 =?utf-8?B?VFp6YzBNTzE5NzZ4bkhUQWVPNW5BLzdWZlcyWEFKcTByUE1FU2ErOE9FS2dS?=
 =?utf-8?B?Z0ZrU1ZLbXltUmtyMFRPRWdjRTBOU3lGdU90NE03bjl0bVV0dkd4ZDBRQ0pj?=
 =?utf-8?B?dmE3YmhtYUQrTzQ5UVRHSDlna1BTZUFVY0pMNmpXK1h1dVlaV3dUSVF3UWRr?=
 =?utf-8?B?VSsyTFNLVDJXSjluZStvSzZrMGdubGQwS0puRkVTdGV5N2lHaUFOb2hWalJa?=
 =?utf-8?B?d21VUkZ5K3JGVSsrNDF4MklFdVB1a2hnb0lGMnFnTkxlRzNIQVNSZXptRm1S?=
 =?utf-8?Q?cIhk=3D?=
Content-ID: <694354B8AD591E4C963F67D231EA05D8@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f893a9-5e6c-4dfd-a0c3-08d9a5709494
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 00:08:39.6295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRoLpvEM6/F1xLywT1pVklyLv2E/n/o55WkaWqmT0K+8GxQbWUelMOrEmEK3frqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4568
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: lK1rKWMzFsoqzuI5u3xEoxHDvMkP2yze
X-Proofpoint-ORIG-GUID: lK1rKWMzFsoqzuI5u3xEoxHDvMkP2yze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_09,2021-11-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111110122
X-FB-Internal: deliver
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Nov 11, 2021, at 2:59 PM,
 Linus Torvalds <torvalds@linux-foundation.org>
 wrote: > > On Wed, Nov 10, 2021 at 10:47 AM Nick Terrell <terrelln@fb.com>
 wrote: >> >> I just wanted to make sure that yo [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [67.231.145.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mlK7z-0005sO-Q3
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Cc: Oleksandr
 Natalenko <oleksandr@natalenko.name>, LKML <linux-kernel@vger.kernel.org>,
 Tom Seewald <tseewald@gmail.com>, Chris Mason <clm@fb.com>,
 Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul
 Jones <paul@pauljones.id.au>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, Christoph Hellwig <hch@infradead.org>,
 Kernel Team <Kernel-team@fb.com>, Eric Biggers <ebiggers@kernel.org>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Sedat Dilek <sedat.dilek@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Sterba <dsterba@suse.cz>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gT24gTm92IDExLCAyMDIxLCBhdCAyOjU5IFBNLCBMaW51cyBUb3J2YWxkcyA8dG9ydmFs
ZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBOb3YgMTAsIDIw
MjEgYXQgMTA6NDcgQU0gTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IHdyb3RlOg0KPj4g
DQo+PiBJIGp1c3Qgd2FudGVkIHRvIG1ha2Ugc3VyZSB0aGF0IHlvdeKAmXZlIHJlY2VpdmVkIG15
IHB1bGwgcmVxdWVzdC4gSeKAmW0gYSBuZXdiaWUNCj4+IGhlcmUsIHNvIEkgd2FudCB0byBtYWtl
IHN1cmUgSeKAmW0gbm90IG1ha2luZyBhIHN0dXBpZCBtaXN0YWtlIHRoYXQgbWVhbnMgeW914oCZ
dmUNCj4+IG1pc3NlZCBteSBtZXNzYWdlLiBJ4oCZZCBoYXRlIGZvciB0aGlzIFBSIHRvIG5vdCBl
dmVuIGJlIGNvbnNpZGVyZWQgZm9yIG1lcmdpbmcNCj4+IGluIHRoaXMgd2luZG93IGJlY2F1c2Ug
b2Ygc29tZSBtaXN0YWtlIEnigJl2ZSBtYWRlLg0KPiANCj4gT2gsIGl0J3MgaW4gbXkgcXVldWUs
IGJ1dCBpdCdzIGJhc2ljYWxseSBhdCB0aGUgZW5kIG9mIG15IHF1ZXVlDQo+IGJlY2F1c2UgSSB3
aWxsIG5lZWQgdG8gdGFrZSBhIG11Y2ggZGVlcGVyIGxvb2sgaW50byB3aGF0J3MgZ29pbmcgb24u
DQo+DQo+IEl0J3Mgbm90IGp1c3QgdGhhdCB5b3UncmUgYSBuZXcgc291cmNlIG9mIHB1bGxzLCBp
dCdzIGFsc28gdGhhdCB0aGlzDQo+IGlzIGEgYmlnIGNoYW5nZSBhbmQgY29tcGxldGVseSBjaGFu
Z2VzIHRoZSBvcmdhbml6YXRpb24gb2YgdGhlIHpsaWINCj4gc3R1ZmYuIFNvIGV2ZXJ5IHRpbWUg
SSBsb29rIGF0IG15IGxpc3Qgb2YgcGVuZGluZyBwdWxscywgdGhpcyBhbHdheXMNCj4gZW5kcyB1
cCBiZWluZyAiSSdsbCBkbyBhbGwgdGhlIG5vcm1hbCBvbmVzIGZpcnN0Ii4NCj4gDQo+IFNvIGl0
J3Mgbm90IGxvc3QsIGJ1dCB0aGlzIGlzIHRoZSBraW5kIG9mIHB1bGwgdGhhdCBJIHRlbmQgdG8g
ZG8gd2hlbg0KPiBteSBxdWV1ZXMgaGF2ZSBlbXB0aWVkLiBXaGljaCB0aGV5IGhhdmVuJ3QgZG9u
ZSB5ZXQuLg0KDQpUaGFua3MgZm9yIHRoZSBhY2ssIEkgcmVhbGx5IGFwcHJlY2lhdGUgaXQhIEkg
ZmlndXJlZCB0aGF0IHdhcyB0aGUgY2FzZS4NCg0KV2hlbiB5b3UgZG8gZ2V0IGEgY2hhbmNlIHRv
IHRha2UgYSBsb29rLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUNCmlzIGFueXRoaW5nIG1v
cmUgSSBjYW4gZG8gdG8gbWFrZSBpdCBlYXNpZXIgZm9yIHlvdS4gSW4gdGhlIG1lYW50aW1lLA0K
SeKAmWxsIGZvY3VzIG9uIGdldHRpbmcgbXkga2V5IGJldHRlciBzaWduZWQuDQoNCkJlc3QsDQpO
aWNrDQoNCj4gICAgICAgICAgICAgICBMaW51cw0KDQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

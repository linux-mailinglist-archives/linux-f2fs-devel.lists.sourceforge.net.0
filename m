Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F92AC487
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 20:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PnrqSgU4lExBe3CfGMTgOp28j/fnQOw/ZjQ/t0/I1kE=; b=hpkEoqKH6nwAOW0i71ULaA/3n
	lwTBrsw1IYEZl1Sm3MHEDeIUij6BJXw0G1t9+TwEcvnCin2WZaMe9eTfBKVS4mLBDQJbij/vpElSS
	QZEOnGvA53LwZGb/AujQfE3O6o8Ugizey4gQdZaCDlML+WCcQxN+SWUNj/1HEESR/Z7jQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcCQj-0001Bg-Ll; Mon, 09 Nov 2020 19:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=8582b64098=clm@fb.com>)
 id 1kcCQi-0001BV-B9; Mon, 09 Nov 2020 19:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUx68W1m/8eobVREYYtDo2r2JVQp1vcJGillZ24qmYo=; b=bQUq5DB5guk2MFba452LVDkjoJ
 QluHxXzInx+DdPSSP1Rch6T3oP6V7Ii+ttDpZgbiVPo/z1NiyRXEmQ7KNFfjVJgkNBWP02Zcxzn9+
 eCZcNL2JVRawav0ykssAa82o0c8KJcW61VFufQzMkbLr126kgYijk5gzPmqW54qftcbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uUx68W1m/8eobVREYYtDo2r2JVQp1vcJGillZ24qmYo=; b=BQetOfxpdGgUj3fulIZAh2QDg9
 R3/XltLnWW7nB+SzbUOh0nAPWSf4+LCXAmQXRy1nHN194YW5mAIQUqEOicAzLLjemtJBRP2kKLCY9
 fkgglMnlL7f0kVg8GAMvbuXiIuCCCIWfCTtUlQgjo2/0c684dibvUtc9NnGDZkz4HHTc=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcCQb-00EatE-2N; Mon, 09 Nov 2020 19:02:16 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9IkkrF029856; Mon, 9 Nov 2020 11:01:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uUx68W1m/8eobVREYYtDo2r2JVQp1vcJGillZ24qmYo=;
 b=hl44ChDmEvscaPjhi/qJcTwCvNRf/3apXIVzCHUEW7T/u0a84/VUhE47Ne26JnV1raVx
 etwXXCbdZ+h4uLOlk6VAhjTnQbvMR10XDLcIwzeSLPpp1ri3p59aIJE3TPwHqH+ujSsQ
 /8nFWazCyKiDgBBKMQOtFM/cDcS31aQPNmA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34pch9p715-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 Nov 2020 11:01:50 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 9 Nov 2020 11:01:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoDp9X6bv+reb2VkVSoOes1e2av9G6g5xLytEQmbzedf3XGnMW+zvmu9mj6gyZxNRPthAz8avXipp4SoW0lKcyzzDka8Yl4cLP+C0Sv3lL0V8oONKrJhRfVaSBzbYgoW/JIvJ8aXUa5AOk0DyI4Yw+zh93MLtS/fJvwbxYjqDqp3f8YfogbTkU7fnZRHD4X8hAPn+9kuboCVqrJqOmiX52Q2ZXLLE+MPb/r+EKCDXyovJVNIguDUyZMerTteHbdf8Ej0oG1RKsJXyIZn+jnSW/cAx8tyDyDAqpvumHkBuaapHEEeYtFyHUZGFpGAStusQBnI0N89ENCZQPUZsziU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUx68W1m/8eobVREYYtDo2r2JVQp1vcJGillZ24qmYo=;
 b=eO8vzZkjSn11tajoRmcnamdmgDji56jeL5Pv3fMHyr8OIbBMIxHfa/UezEeHz+zHpzppLGHd4JoPcH7dQloCp3Z3QyhPSYNN5p7oEsz0BAzkqIyviKs8G7nbSfylumbBHKvDBINpSPMdIdQGR2JgOkW6qUibE0khEU1PBUqAtxRR1OmcqIK3xMJ7ZBcYuyjPuPTk7vGibBlo/uPzM+BhzcLm+bS+D2KFg+jT5ZTEjSRN5bPLuN1/gaO1P0n9PKl15l/+Jm5a5rfky9VQ73f8lhZuGLlIFr1+LPn3+DBhKUTU65Iw2jIel6bCIrsrJ2ENWDow07gUmWw6HYVnmjlU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUx68W1m/8eobVREYYtDo2r2JVQp1vcJGillZ24qmYo=;
 b=OS+SIkasGP7JijugLnkCQ7haueteGt9GBZSNWu5xDW9oNSeR8Yh64ImKqli7Yv5Mdyg0nic1CIqa1QA8Zh7yTwsNHxRZEtCrF46XmkREnSbAIPKPTufLAnK8KWnRxroW1zAP3DMkzM3F0/ndMVMWsXW1DGLgPV+xYxJ/71KmZ5c=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
Received: from SA0PR15MB3839.namprd15.prod.outlook.com (2603:10b6:806:83::14)
 by SN7PR15MB4208.namprd15.prod.outlook.com (2603:10b6:806:106::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 19:01:46 +0000
Received: from SA0PR15MB3839.namprd15.prod.outlook.com
 ([fe80::988:2e42:b8ca:d347]) by SA0PR15MB3839.namprd15.prod.outlook.com
 ([fe80::988:2e42:b8ca:d347%9]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 19:01:46 +0000
To: Christoph Hellwig <hch@infradead.org>
Date: Mon, 09 Nov 2020 14:01:41 -0500
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
In-Reply-To: <20201106183846.GA28005@infradead.org>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <20201103060535.8460-2-nickrterrell@gmail.com>
 <20201106183846.GA28005@infradead.org>
X-Originating-IP: [2620:10d:c091:480::1:4280]
X-ClientProxiedBy: MN2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:208:23e::23) To SA0PR15MB3839.namprd15.prod.outlook.com
 (2603:10b6:806:83::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [100.109.60.106] (2620:10d:c091:480::1:4280) by
 MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 19:01:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94506b6b-fa3d-4053-2b2f-08d884e1e7ab
X-MS-TrafficTypeDiagnostic: SN7PR15MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN7PR15MB4208A4C50179B40EE646951AD3EA0@SN7PR15MB4208.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAPplgbAkZN0LiGHM1OB8c8J0ESznYV9tfrfcNHJ1kgGC1W58orPD9bnJw+/lg2wc04WWWa1E9K+C3AKffbW/h8Y6p2Q65xjLvfQpwfkpvQcRd/1KTMzK8k1qBjCuM2OxQYFG6PAklaSFWwKQxh/CernTKsw583khUAZZwdHH1ls5Hu0tpJXYfh2srbss+b+REvgs1ZmuC4mMYZ9mN354WRdUGpm/wys3s7pMkFP/08OsjRnpIgwTH7fYbsT+81TUn4BVjtKqbIsD/ui8019F3OieapNzCg9V8Pkm/pA/X/CKMxLKOerKYX+4ST+D4mpo211Lr68as9YIucjv8A9zJl6G5R1Hy9TK2p6do2SiK+ccs+l+uZOT7maUIrjst9E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR15MB3839.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(39860400002)(136003)(366004)(6666004)(83380400001)(4744005)(186003)(16526019)(54906003)(478600001)(52116002)(956004)(53546011)(2616005)(316002)(33656002)(6916009)(2906002)(6486002)(5660300002)(4326008)(8936002)(36756003)(86362001)(66946007)(7416002)(8676002)(66476007)(66556008)(78286007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: LKuWbyihmdcXQvAe71W+fd7Heu6swaXoYKG2POtQMZW0vEzD6bxP9Op+h0RHjiuVc09PNbpGfVQYrWgRH0uoYdP4kDVzVsyzDlIHs9nNbFoWdjB6H0G3JVptBYUzrCln4xRbOVXM4DUdsEHf9w5QUNjDyzlU7PifKDpSSpvraJOnaf6Eu2uE4NeP15ooIUWzWn5A4JbrnY2Z/xrp7rioouKapFmcB+7OixQ0dcucWaUMh11T4Ob8+fE2Awzs4Ma8Wtv3e4+bg00AjO25/6389QBViS1qWs4zjmdg7VAergnMnfNL5jALZK/7w+OP9FM+JlmSU4IjK6ZZlyaWf3cpE7O2x/XzUWt118y2yUoRD/uRAJ25f01HYsrUbJX4U7UiZVRhrnx6qf4dZouLp90QugXVenEM/POV5XrNzg+UYTY25NAStbww9iAa9ZUDujwbM6n+FEXuYGCU8r2ASkqtGLrOu4qtqq/cdmEBormDIBLT6t3Lq8H32HbL5BMJ+Ywmq3jUaTcOYAJ724ow1Ezyna+D/wV+TGDPfFLAnZNk9UOlzySjAtUvZmKRxMYkPcur/hlYNvwhi+bzy4WN3wmvN2Je4VvSlUEEvfiOIw2WjJXgySmHRYaNunR7sluyXTiO6S4vikHkoyQDgCMGsVecOBdBJn36odsSvw8rd1RoF6qzL9Zer14q6//Ujrc1JzGXqXEZFqrS01s6xVAz03krXoFu3EHET5uQPWDkqjp7z4fq2ShMHZVY2GMrwhS2Rk3vy0hv3w64YKcgY98TlnCrTSTfGswrWKKXR2oT3tpeYsf3RUlegGftWGzpQcg+RlBS/Qk+ktXXfRJW29HI8LLTckcjJ0v6VO0/au9unt76SeLqegAgwz6dmhKCzCx1n7hbm3eyNNZ7/p5CyTvXwUGbTa61gqJy9wTha1dMC4NGov0=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94506b6b-fa3d-4053-2b2f-08d884e1e7ab
X-MS-Exchange-CrossTenant-AuthSource: SA0PR15MB3839.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 19:01:46.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbcnldzPRJkF4amd8+XG37Ft3P+vVfE1wXGLyV3vyFDwlMkv/eXoTvAcsPX2zQLu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB4208
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_12:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=743
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011090128
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1kcCQb-00EatE-2N
Subject: Re: [f2fs-dev] [PATCH v5 1/9] lib: zstd: Add zstd compatibility
 wrapper
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
From: Chris Mason via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Mason <clm@fb.com>
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiA2IE5vdiAyMDIwLCBhdCAxMzozOCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IFlv
dSBqdXN0IGtlZXAgcmVzZWRuaW5nIHRoaXMgY3JhcCwgZG9uJ3QgeW91PyAgSGF2ZW4ndCB5b3Ug
YmVlbiB0b2xkCj4gbXVsdGlwbGUgdGltZXMgdG8gcHJvdmlkZSBhIHByb3BlciBrZXJuZWwgQVBJ
IGJ5IG5vdz8KCllvdSBkbyBjb25zaXN0ZW50bHkgYXNrIGZvciBhIHNoaW0gbGF5ZXIsIGJ1dCB5
b3UgaGF2ZW7igJl0IGV4cGxhaW5lZCAKd2hhdCB3ZSBnYWluIGJ5IGRpdmVyZ2luZyBmcm9tIHRo
ZSBkb2N1bWVudGVkIGFuZCB0ZXN0ZWQgQVBJIG9mIHRoZSAKdXBzdHJlYW0genN0ZCBwcm9qZWN0
LiAgSXTigJlzIGFuIGltcG9ydGFudCBkaXNjdXNzaW9uIGdpdmVuIHRoYXQgd2UgCmhvcGUgdG8g
cmVndWxhcmx5IHVwZGF0ZSB0aGUga2VybmVsIHNpZGUgYXMgdGhleSBtYWtlIGltcHJvdmVtZW50
cyBpbiAKenN0ZC4KClRoZSBvbmx5IGJlbmVmaXQgZGVzY3JpYmVkIHNvIGZhciBzZWVtcyB0byBi
ZSBjYW1lbGNhc2UgcmVsYXRlZCwgYnV0IGlmIAp0aGVyZSBhcmUgcHJvYmxlbXMgaW4gdGhlIEFQ
SSBiZXlvbmQgdGhhdCwgSSBoYXZlbuKAmXQgc2VlbiB5b3UgZGVzY3JpYmUgCnRoZW0uICBJIGRv
buKAmXQgdGhpbmsgdGhlIGNhbWVsY2FzZSBhbG9uZSBqdXN0aWZpZXMgdGhlIGFkZGVkIGNvc3Rz
IG9mIAp0aGUgc2hpbS4KCi1jaHJpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

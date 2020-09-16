Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F726C3FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 17:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfrY0deud75xJyGbo936cu8kTUOw/g2kl24+AiL8jLE=; b=nF8iGH2G6BJJPkbSdjG1naqYH
	6sWpLRRY9a590fvLW9D3t5x6Kh5mozDiXkC8kV104A9quOKv4GA1VksB1FmrTzUMUz8pyHmqvrMMu
	LbDscE4R8XcHoAAAK21tgNN8v+C/JwsDWKCMraHDvNhaelChQqTHOP76PPU6HlXUEMMfc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIYwT-000118-7A; Wed, 16 Sep 2020 15:01:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6528703ae9=clm@fb.com>)
 id 1kIYwR-00010y-Da; Wed, 16 Sep 2020 15:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F/IgRPmpLMsVBjyhQhLJOo0Q/FZh4fDXDjxSC9qGoHo=; b=EDvi/+amBIMUeLvDDZjhREQ7op
 h08h+2IFzuUY/LAc6K25PeT3UHNH2y3OtdgpPrWGDVxpoybSBKgaYR8HMbyjaH19aKl1LdlQTo7iZ
 qaHg3Kc5Kwhv7n+iOqVhx3jNm3mfVMV/MeTA6lJhKTpSAJKiky96GAl/ZCNEZV+I0SHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F/IgRPmpLMsVBjyhQhLJOo0Q/FZh4fDXDjxSC9qGoHo=; b=VVd5Nmjzalhpg/Dl2NwX+VnLRT
 PmzSno6+kXiaEeocPmugoUqzBVStemYVhz4G7KMFxU9W1V3B1TrULY5QdsZMGHIl8pS5kcsQXZ8mS
 1mRQ7cp5afq1BXkmzVDz8kDwSTtPXe1uTPjy7d/StEn7IvSUZYyfwyCHTICtJL4DimBo=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIYwJ-00BWR0-Hn; Wed, 16 Sep 2020 15:01:51 +0000
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08GEhx9R027417;
 Wed, 16 Sep 2020 08:01:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=F/IgRPmpLMsVBjyhQhLJOo0Q/FZh4fDXDjxSC9qGoHo=;
 b=NkrakJVGCBV8D+8XukpYdcMNJWqvrFPp8bzyebTLGoTAyTk2vT2Uh8Sd7WdFD6lKKnGe
 k4eVBbGUMpIKpK9VY2/INs83awWB71maWu7hV14lCM/I+3/uoACGJK2Xd5IzCX5SzcSi
 vNDO4IocTQkcwPg++I+ZqUOUUfNs5FkbO9M= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 33k5p841fv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Sep 2020 08:01:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Sep 2020 08:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdvaMz+o0qb44on2a3DOirlshW4MmGaJX6VVZelokkbC6K45LBSr/fDEVqLCFwlYZjDWXoNmsFyGjWkS1K2kBDQ/bzC5dx4brnUgCN/FLvz685n6NUAIDQEFMam7VMEnUPdX0gzhozqB9JxYP27dDGrP/45J5qyOopADRXekXVxzTMFvL5nY+c+bXDTyO4FNaK3CZ91x5Fy6oaBk++MaKPcd2p0zJmbYPvN4u64hcqjEzVT6q1i1DWZXclQXMvEqD6h64nXmJuY+7WQ33ketutnvzs/L2LqTEgAiiTAY8BruMlBH/TWTV5G2CXR6Yk/a9b0KMLhc4Gi06m/SLiVQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/IgRPmpLMsVBjyhQhLJOo0Q/FZh4fDXDjxSC9qGoHo=;
 b=G5rt4FffP4+xP+06f5YzSCvlNWubPD3BI4Vf/x5CBU9SI46UIojjTP8uESjsyAeidqd7rbx38dkLc5OpxfJDxhzOSYzFiKW3W5uKRZJW81w70VFZNnD8Bh5CFnHNE+omWW9ll1UPDYfvca9IoVoUt+SjuHJrIQaKC+3+Hhpu4LvQ/Th2GjrUHGI8ziTezAiNi3k5Is7X9+lXsSQvA1sCyYgATSCi+2iGbBER8O+EgXccsMjFd+ReHQheRC0dlnUiJ53Tjp5/RLty0APUknrfbbxMHXEpmfLr3UwOz/N5CTnhse9BEb/fxJjD/1QegVwoAFvS8is9CNqah6YZsxIx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/IgRPmpLMsVBjyhQhLJOo0Q/FZh4fDXDjxSC9qGoHo=;
 b=iULZA98C2l15yyxeVp3IiUrFDZ5r6Y09Wk4GUflNkUBEyVjPHw8UrrM18QgktV4TdZz1EqWNRVsrYlxCKNuUlBdvh3YsjlRRMTiQx7jjQHiTLZzDoV7q8ulP3IMJ2+B0h6q19UCdU2r9ZDQMQBpnvY85LVnWo9HB4rJEY/Y6mn4=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
Received: from MN2PR15MB3582.namprd15.prod.outlook.com (2603:10b6:208:1b5::23)
 by MN2PR15MB3632.namprd15.prod.outlook.com (2603:10b6:208:1b9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 15:01:15 +0000
Received: from MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6]) by MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 15:01:14 +0000
To: Christoph Hellwig <hch@infradead.org>
Date: Wed, 16 Sep 2020 11:01:11 -0400
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <E412C519-27B8-495D-BF52-3EC4D161D1A0@fb.com>
In-Reply-To: <20200916144618.GB16392@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
 <20200916144618.GB16392@infradead.org>
X-ClientProxiedBy: MN2PR19CA0035.namprd19.prod.outlook.com
 (2603:10b6:208:178::48) To MN2PR15MB3582.namprd15.prod.outlook.com
 (2603:10b6:208:1b5::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [100.109.1.1] (2620:10d:c091:480::1:60bc) by
 MN2PR19CA0035.namprd19.prod.outlook.com (2603:10b6:208:178::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Wed, 16 Sep 2020 15:01:13 +0000
X-Mailer: MailMate (1.13.2r5673)
X-Originating-IP: [2620:10d:c091:480::1:60bc]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5342ea6-4555-4981-e137-08d85a515b7c
X-MS-TrafficTypeDiagnostic: MN2PR15MB3632:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR15MB36322E9AEEC651D0BE9A36D7D3210@MN2PR15MB3632.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ezEEsuSyX4bWwVSZ6S85A4Wo4yocrgyAmHwrylqjDMdAvzZzO8bwZio/xjg1ful5QIX3rY21Q14pz3Svcxncp//cCobSzfvQF/Wb5r1Ed5nmrZvbdMOXT/g2QbpXbNW1XMm33FQ8Ja4dapMNUg9+f+vu9n8Ive8Cvlw+OwMlUco04wCq20SOV7q4oFv5mDWKkGuHcXp5LYvlQTmBtsPM93VMNqowvOtE4OP51NNyHHmx1tZ0Olw+hXVosBZGsJcGovgjNA2469pY2BvHzx82l6Ij4C8NZz6Dq/2RKmXiZssi1+6lirhN6qxm9r+ZHgcV+Le5V3St0KZ9k8uugwldUpn850EFk7z7LAl6mVBUVS4KaBAAvOjxF3Xbvby2ln+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3582.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(366004)(39860400002)(136003)(86362001)(956004)(53546011)(2616005)(6486002)(478600001)(4326008)(36756003)(6916009)(316002)(33656002)(186003)(54906003)(8676002)(2906002)(52116002)(66946007)(16526019)(66476007)(66556008)(8936002)(5660300002)(78286007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: UpN9Ci5fPFDFL1tl0HIleiIBIxSbVYJvNjV3E8o4ESJwOCTEInI1Mh5p9bkma4Az3VGdf3opI88N0xXiBkY3/SzhJDyLRHiHGL5oxsz/qsAmcf2HPQ+x2iMt+G1qfKjwM9MoB+YFnY7vxcZuWv2bunsyzGMiY6mpTK8WQQGdJLUNSMV+rZqAnF9HGXXEcY+HG7Z/uYKinvkfXg2ysgngKacRo8r+yPfwyyF+mBiP4OHpys9+1bGHHXOZChQYVHUCoaX2opdiqTlwtz9VBXjvES8Pqn0JBSln9v1mIT8mw5UFJ8fTrcwR1SHqRSCGtosB0Uq76n8yJ+uXJnI1Jgq5UIjVZISbuPAnaqZRkWJSQJ6HCy+fwXENzgOBb1O948ahQoBY+/YrH+Cd6Y/TUOwNnWwjxFhVzPLYb7E6JXUcdhfQS542c/zBoeTY2rW271rvaGBXaLFxi2aUNheUtVyxMAKFp83QIMXopDi10L2nOH8o62vV66mDnjXKKfrOt8ibmttgzQK3yr9WHLcReKIxpBQmAoILt8NDOVAf/7sIfu8VCa/zLDXi/hn1UdebNGpDsn37GOAyF2cy+vF9of6jvHscISX8d5lXxjYU0PeK2rnHesnEtZruAJC0Y/+3W1kAglgvFNWqmaz7itL7TA3PiBQgVhuh7tLQKHysfgDThwJLmg3Ofxoaxec6xk5Zcpho
X-MS-Exchange-CrossTenant-Network-Message-Id: e5342ea6-4555-4981-e137-08d85a515b7c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3582.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 15:01:14.8635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2ZStGvYFaveCFoYaH/rWEZjjLyI6Woln2N6yd/ftPyPGSoWibIe2m7070BccSnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3632
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_10:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=786
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009160112
X-FB-Internal: deliver
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1kIYwJ-00BWR0-Hn
Subject: Re: [f2fs-dev] [PATCH 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTYgU2VwIDIwMjAsIGF0IDEwOjQ2LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKCj4gT24g
V2VkLCBTZXAgMTYsIDIwMjAgYXQgMTA6NDM6MDRBTSAtMDQwMCwgQ2hyaXMgTWFzb24gd3JvdGU6
Cj4+IE90aGVyd2lzZSB3ZSBqdXN0IGVuZCB1cCB3aXRoIGRyaWZ0IGFuZCBrZXJuZWwtc3BlY2lm
aWMgYnVncyB0aGF0IGFyZSAKPj4gaGFyZGVyCj4+IHRvIGRlYnVnLiAgVG8gdGhlIGV4dGVudCB0
aG9zZSBBUElzIG1ha2UgdXMgY29udG9ydCB0aGUga2VybmVsIGNvZGUsIAo+PiBJPz8/bQo+PiBz
dXJlIE5pY2sgaXMgaW50ZXJlc3RlZCBpbiBpbXByb3ZpbmcgdGhpbmdzIGluIGJvdGggcGxhY2Vz
Lgo+Cj4gU2VyaW91c2x5LCB3ZSBkbyBub3QgY2FyZSBlbHNld2hlcmUuICBXaHkgd291bGQgemxp
YiBiZSBhbnkgZGlmZmVyZW50PwoKSXMgdGhlIHpsaWIgdXBzdHJlYW0gYWN0aXZlPyAgT3IgdHJ5
aW5nIHRvIHN5bmMgYWN0aXZlIGRldmVsb3BtZW50IHdpdGggCnRoZSBrZXJuZWw/ICBJ4oCZZCBz
dWdnZXN0IHRoZSBzYW1lIHBhdGggZm9yIHRoZW0gaWYgdGhleSB3ZXJlLgoKPgo+PiBUaGVyZSBh
cmUgcHJvYmFibHkgMTAwMCBjb25zdHJ1Y3RpdmUgd2F5cyB0byBoYXZlIHRoYXQgY29udmVyc2F0
aW9uLiAgCj4+IFBsZWFzZQo+PiBjaG9vc2Ugb25lIG9mIHRob3NlIGluc3RlYWQgb2YgYmVpbmcg
YW4gYXNzaG9sZS4KPgo+IEkgdGhpbmsgeW91IGFyZSB0aGUgYXNzaG9sZSBoZXJlIGJ5IGlnbm9y
aW5nIHRoZSBwcmFjdGljZXMgd2UgYXJlIAo+IHVzaW5nCj4gZWxzZXdoZXJlIGFuZCB0aGluayB5
b3VyIGVtcGxveWVycyBwZXQgcHJvamVjdCBpcyBzb21laG93IHNwZWNpYWwuICBJdAo+IGlzIG5v
dCwgYW5kIGNsYWltaW5nIHNvIGlzIGV2ZXJ5dGhpbmcgYnV0IGNvbnN0cnVjdGl2ZS4KCknigJlt
IGhhcHB5IHRvIGFkdm9jYXRlIGZvciBtb3JlIGNvbnN0cnVjdGl2ZSBkaXNjdXNzaW9uIGZvciBh
bnlvbmXigJlzIApwcm9qZWN0LiAgSSB0ZW5kIHRvIHBpY2sgdGhyZWFkcyB3aGVyZSBJIGhhdmUg
Y29udGV4dCBhbmQgSSBrbm93IHRoZSAKcGVvcGxlIGludm9sdmVkLgoKVGhlIGtlcm5lbCBiZXN0
IHByYWN0aWNlcyBhcmUgcHJhZ21hdGljLiAgQXMgb25lIG9mIG1hbnkgdXNlcnMgb2YgYW55IApl
c3RhYmxpc2hlZC1ub24ta2VybmVsIHByb2plY3QsIHRoZXJl4oCZcyBhIGNvbXByb21pc2UgYmV0
d2VlbiB0aGUgQVBJcyAKdGhleSBhcmUgdXNpbmcgZm9yIGEgYnJvYWQgYmFzZSBvZiB1c2VycyBh
bmQgdXMuICBJ4oCZbSBzdXJlIHRoZXkgYXJlIAppbnRlcmVzdGVkIGluIGltcHJvdmluZyBsaWZl
IGZvciBhbGwgb2YgdGhlaXIgdXNlcnMsIHdoaWxlIGFsc28gCmltcHJvdmluZyBtYWludGFpbmFi
aWxpdHkgZm9yIHVzLgoKLWNocmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK

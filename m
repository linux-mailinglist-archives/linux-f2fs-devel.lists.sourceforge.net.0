Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FA26DE38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 16:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K21Fw1byjDnK71YTFLbQGFZZmCwdIf4RYCy32k8aeUw=; b=BMM8Zmm5nFUOlkPeBAhzTAtIa
	DxLdBpxw5aPi9xkq7khz1dWLmTBYfgb3OGArXjDq26B/yAGv0Qe3yiMQkCMvGcB5cxiqh1JOErt5d
	u9VkRTr+nhUtlm4aXbU2rlANqEVmpvdrW5a4cYC3r0h/j88TS5xwMHh7KhPYA2cEfOkgU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIuuJ-0006Ly-HD; Thu, 17 Sep 2020 14:29:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6529deebd1=clm@fb.com>)
 id 1kIuuI-0006Lg-7F; Thu, 17 Sep 2020 14:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agTxKaqAVoCtTsETVEdQq2b9zMJZlv9JPP0RSxlOtgE=; b=Svi0fI0Ign+DqZ2gfkxLeu8Wo2
 cWavo15ZygY1KhAl7zPZVjrwYpM23tXWxmaHBesOd5mK544nvlXwS6uPJaFwYhUoVnhvfyp4TpCox
 oU196sT91wNR83F7M0u6OJGGsrFoibF2ttV2ahRXJhTnOtV1Izr/cXCLQW5hflGk4230=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=agTxKaqAVoCtTsETVEdQq2b9zMJZlv9JPP0RSxlOtgE=; b=nOFHhoF9V9dZkWDbWzyBKRBk08
 AyIl7LTGlOtLq/ZK+fgVPYWQ3RMgdoiOKMh//IM3h/xqd/RbKWlcWPwCIWeZAD9f/e0B1/rBi6wq1
 2rwSCuFfCAl5QjY1iM0LITTBpmZRBosu4wP71hy2usF0ivljKDoFqt251eRpNZK1pvGU=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIuu9-00EEo5-NB; Thu, 17 Sep 2020 14:29:06 +0000
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HEOM3t021946; Thu, 17 Sep 2020 07:28:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=agTxKaqAVoCtTsETVEdQq2b9zMJZlv9JPP0RSxlOtgE=;
 b=bQNbsCcYNZEICd+McZhkRlmXS2aLGVcFWsYSD6mAS9hufNAAkeJJ8Y0pPo1U7DGDcJmK
 ZQBsmeC6LyCVE88SNVIN72FytQj4ryeyCcvCFhqn73CHzQsEbPSfy2t8zMXikPTPSgQL
 +Z+C4TQPB6RkRIKHV9ak6u1ppnFwlvPAjrs= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33kwpxjyju-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Sep 2020 07:28:31 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 07:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUgKTsOqJOIRrpHijezgnzO1ZZduSj0KV9KTfpO0sWC1JkqThegp0CXDotQ3ywiIltD/92TUFRRMyL6F55cYJX5i92DivbiE7oqre214L78bxlSoR3ffKBmf+om3393flDDStXo/cx9rfzzNMDeLLhoelF3Xrs9/Xl9aBeBtQo242z8+qhdv7jcf3HO/MoQpNNYnR4mtM2ZuExCI/KOd/WVmSbnRjXvX3z0ZsmfTOMc+Kg+iTa7VYYgSrPwPb97idMtapbc64lNhn8fOrxndoAjMa7T+j+qjglCmztUgtP1XYC96lB8aBZUjmU9WU9JB9+IB5tC7HvuFC7sfVoyRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agTxKaqAVoCtTsETVEdQq2b9zMJZlv9JPP0RSxlOtgE=;
 b=a/2Cq+GylMBbv7TkbUFmCdAHVdsAI9oxVmEPEseX8lBxyuEMumUZYe+xdFwejtRlsZsyvp7FhIa2xlq55dCgG4IPiDszSxynQ/11SI9juLWfp0uWawgV3HXFNQQ1YD/WxgkWazxfCbLaEiCdBZhaTPUMPlWVdYTpAJsS+tjynhX1vVu0TrJWa/MTMK6Le1EY0lp27HVBqGh7C83859TNysK8rJs2jSH6IHsX89ftYPVo60eHAj1+u9kbxch5LHkw4ciuqBe/4dDJiuTBhLuW5z9CbcMVjEUST++FAaRM1d8dg7dxCVnOikgzecJcwLT7nqXOlWdcqCAOvk9r6OWGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agTxKaqAVoCtTsETVEdQq2b9zMJZlv9JPP0RSxlOtgE=;
 b=BNVYfRD7LHNvwh/OxmWZAIFgkW1AMvmGs2s1E40SKCju/Xps0nZGw3G0MV2my8UVKmYlgnhrAs3+NRy5fjyY14cCE4dfY1mCTs5ebjDzfAZzJ0HaArwGcRi3kkeegnsnC7nl29+a35ZLTHP6TbWJwNbMvXD8s/hHqaLInl/Aw/I=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
Received: from MN2PR15MB3582.namprd15.prod.outlook.com (2603:10b6:208:1b5::23)
 by MN2PR15MB3584.namprd15.prod.outlook.com (2603:10b6:208:1b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 14:28:18 +0000
Received: from MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6]) by MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 14:28:18 +0000
To: Christoph Hellwig <hch@infradead.org>
Date: Thu, 17 Sep 2020 10:28:15 -0400
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <2073A599-E7CA-476A-9B4B-7BC76B454B9A@fb.com>
In-Reply-To: <20200917100458.GA28031@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
 <20200916144618.GB16392@infradead.org>
 <4D04D534-75BD-4B13-81B9-31B9687A6B64@fb.com>
 <b1eec667d42849f757bbd55f014739509498a59d.camel@surriel.com>
 <20200917100458.GA28031@infradead.org>
X-ClientProxiedBy: MN2PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:208:134::33) To MN2PR15MB3582.namprd15.prod.outlook.com
 (2603:10b6:208:1b5::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [100.109.170.31] (2620:10d:c091:480::1:c860) by
 MN2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:208:134::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 17 Sep 2020 14:28:17 +0000
X-Mailer: MailMate (1.13.2r5673)
X-Originating-IP: [2620:10d:c091:480::1:c860]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d3ac0e-6266-4753-a2c5-08d85b15ebf9
X-MS-TrafficTypeDiagnostic: MN2PR15MB3584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR15MB3584BBAE97AA8C91CF08946ED33E0@MN2PR15MB3584.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kw/QaqoXQLlxXQGNtWvfnRH+mCG85BkJsCRRElu0Iq5oqlwzjuw1y7UEe166g8Hk66bgMwAJUAdd9VTp1QQ3DL2bveNs3B5brXLs2Gr27ihcyIfXjh9DjN6pJGdpLdEjZXZtdmQWuvN2/beopeWnaazIz/SLSFQazPD6j9oavWxmTMTMDo6h4s0uWXcHqMGtorPv7vhLQBM8gxDXi9ugz8udSimCz6NEX2wdW7spsF7JIO6Ar/QWHoSLD/F36NPghFTh1ZJj1HiBeYttTWUMB8mEetCCAvALHIAtEUgQ509dTsFoT49CzOch7pIXOckJcgUvxMtWiBuGt8yAeS3aL3UnJ537y9zPRACR5YYw94gwWaqBgNMlE0r09ZcelITp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3582.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(366004)(346002)(39860400002)(33656002)(7416002)(478600001)(8936002)(6486002)(66556008)(6916009)(16526019)(4326008)(36756003)(66946007)(316002)(66476007)(186003)(5660300002)(83380400001)(8676002)(54906003)(2616005)(86362001)(956004)(53546011)(2906002)(52116002)(78286007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: t8JpnR/Qn/k275ulHL0LUkuCb5OBPDlz4HZf//4saf9odDHQppwOpNIbf8Frq/vEDvJETcrStDkBpuD5Qmo0n9kkf1Pl8H00jxQZBCCyMfNzZ0JINUeF8tD0AjdETfd7FihKx4Ak+cSGxEHXg2D7Ao33v0da1wyUjSCdZ5cbO5derQIjPHQmRjI3/gfND0QuBEaCHbll8YJI/A4t/pzv+6lpHh5SvzDqSRl+cBt9FOsxmAaynXYhz1NepfShPCjXdSKbtYU+8kqCGfTTsZnMv9Xc8+AcQGa+P/yGvgSlBHD0Vi5InBNgS/R+/JvbJhlGODD6MyAVW+czn+02Jlaha90lA9Lxm2zU7ACrtfpD9pK0DnMDtEZBqhl7jh+frDc5NHiuVPMnJZUl4kroMW8FuiyKpwu5dUFKr+4QdgBj3/nuc9pN3xdj5CvyjQBxzvQkyxJxf5nfD0hAMS2wxy33osqe2wAr5xt13aSBufvXTKa+s3PZi0PN3vo6johnrIew+yWMip6h3ou/WhdhhfP39k7ylOXTHClg8CSbc52hHIs1BUdwRNb2p0Q/EFkX2xSW4S8bvYDkAn2V0pgwJ0RYk7QPPOQFicadVAdElS5AIHTm+ZMJbL6wVKbgVCQlfp+UL406WfCSJKG0sQaGfNn4gUMCPEZz7Jx/Hflhy8gL1XEwTVEiXLHWpjEJyitnm6hD
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d3ac0e-6266-4753-a2c5-08d85b15ebf9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3582.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 14:28:18.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2p4K+6TnJpnZ+K/tdCk3thuo8YrQDHf/Utkz6lHaISnzA5opWKjuNWKfJ4foMFx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3584
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=780
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170113
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
X-Headers-End: 1kIuu9-00EEo5-NB
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
 Herbert Xu <herbert@gondor.apana.org.au>, Rik van Riel <riel@surriel.com>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTcgU2VwIDIwMjAsIGF0IDY6MDQsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgoKPiBPbiBX
ZWQsIFNlcCAxNiwgMjAyMCBhdCAwOTozNTo1MVBNIC0wNDAwLCBSaWsgdmFuIFJpZWwgd3JvdGU6
Cj4+PiBPbmUgcG9zc2liaWxpdHkgaXMgdG8gaGF2ZSBhIGtlcm5lbCB3cmFwcGVyIG9uIHRvcCBv
ZiB0aGUgenN0ZCBBUEkgCj4+PiB0bwo+Pj4gbWFrZSBpdAo+Pj4gbW9yZSBlcmdvbm9taWMuIEkg
cGVyc29uYWxseSBkb24/Pz90IHJlYWxseSBzZWUgdGhlIHZhbHVlIGluIGl0LCAKPj4+IHNpbmNl
Cj4+PiBpdCBhZGRzCj4+PiBhbm90aGVyIGxheWVyIG9mIGluZGlyZWN0aW9uIGJldHdlZW4genN0
ZCBhbmQgdGhlIGNhbGxlciwgYnV0IGl0Cj4+PiBjb3VsZCBiZSBkb25lLgo+Pgo+PiBac3RkIHdv
dWxkIG5vdCBiZSB0aGUgZmlyc3QgcGFydCBvZiB0aGUga2VybmVsIHRvCj4+IGNvbWUgZnJvbSBz
b21ld2hlcmUgZWxzZSwgYW5kIGhhdmUgd3JhcHBlcnMgd2hlbgo+PiBpdCBnZXRzIGludGVncmF0
ZWQgaW50byB0aGUga2VybmVsLiBUaGVyZSBjZXJ0YWlubHkKPj4gaXMgcHJlY2VkZW5jZSB0aGVy
ZS4KPj4KPj4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8ga25vdyB3aGF0IENocmlzdG9waCdz
Cj4+IHByZWZlcmVuY2UgaXMuCj4KPiBZZXMsIEkgdGhpbmsga2VybmVsIHdyYXBwZXJzIHdvdWxk
IGJlIGEgcHJldHR5IHNlbnNpYmxlIHN0ZXAgZm9yd2FyZC4KPiBUaGF0IGFsc28gYXZvaWQgdGhl
IG5lZWQgdG8gZG8gc3RyYW5nZSB1cGdyYWRlcyB0byBhIG5ldyB2ZXJzaW9uLAo+IGFuZCBpbnN0
ZWFkIHdlIGNhbiBqdXN0IGNoYW5nZSBBUElzIG9uIGEgYXMtbmVlZGVkIGJhc2lzLgoKV2hlbiB3
ZSBhZGQgd3JhcHBlcnMsIHdlIGVuZCB1cCBjcmVhdGluZyBhIGtlcm5lbCBzcGVjaWZpYyBBUEkg
dGhhdCAKZG9lc27igJl0IG1hdGNoIHRoZSB1cHN0cmVhbSB6c3RkIGRvY3MsIGFuZCBpdCBkb2Vz
buKAmXQgbGV2ZXJhZ2UgYXMgCm11Y2ggb2YgdGhlIHpzdGQgZnV6emluZyBhbmQgdGVzdGluZy4K
ClNvIHdl4oCZcmUgYWN0dWFsbHkgbWFraW5nIGtlcm5lbCB6c3RkIHNsaWdodGx5IGxlc3MgdXNh
YmxlIGluIGhvcGVzIAp0aGF0IG91ciBrZXJuZWwgc3BlY2lmaWMgcGFydCBvZiB0aGUgQVBJIGlz
IGZhbWlsaWFyIGVub3VnaCB0byB1cyB0aGF0IAppdCBtYWtlcyB6c3RkIG1vcmUgdXNhYmxlLiAg
VGhlcmXigJlzIG5vIHdheSB0byBjb21wYXJlIHRoZSB0d28gdW50aWwgCnRoZSB3cmFwcGVycyBh
cmUgZG9uZSwgYnV0IGdpdmVuIHRoZSBjb2RlIHRvZGF5IEnigJlkIHByZWZlciB0aGF0IHdlIApm
b2N1cyBvbiBtYWtpbmcgaXQgcmVhbGx5IGVhc3kgdG8gdHJhY2sgdXBzdHJlYW0uICBJIHJlYWxs
eSB1bmRlcnN0YW5kIApDaHJpc3RvcGjigJlzIHNpZGUgaGVyZSwgYnV0IEnigJlkIHJhdGhlciBy
aWRlIGEgY2FtZWwgd2l0aCB0aGUgZ3JvdXAgCnRoYW4gZ28gaXQgYWxvbmUuCgpJ4oCZZCBhbHNv
IG11Y2ggcmF0aGVyIHNwZW5kIHRpbWUgb24gYW55IHByb2JsZW1zIHdoZXJlIHRoZSBzdHJ1Y3R1
cmUgb2YgCnRoZSB6c3RkIEFQSXMgZG9u4oCZdCBmaXQgdGhlIGtlcm5lbOKAmXMgbmVlZHMuICBU
aGUgYnRyZnMgc3RyZWFtaW5nIApjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxvb2tzIHByZXR0
eSBjbGVhbiB0byBtZSwgYnV0IEkgdGhpbmsgSm9oYW5uZXMgCm1lbnRpb25lZCBzb21lIHBvc3Np
YmlsaXRpZXMgdG8gaW1wcm92ZSB0aGluZ3MgZm9yIHpzd2FwIChvcHRpbWl6YXRpb25zIApmb3Ig
cGFnZS1hdC1hdGltZSkuICBJZiB0aGVyZSBhcmUgcGxhY2VzIHdoZXJlIHRoZSB6c3RkIG1lbW9y
eSAKbWFuYWdlbWVudCBvciBlcnJvciBoYW5kbGluZyBkb27igJl0IGZpdCBuYXR1cmFsbHkgaW50
byB0aGUga2VybmVsLCB0aGF0IAp3b3VsZCBhbHNvIGJlIGhpZ2hlciBvbiBteSBsaXN0LgoKRml4
aW5nIHRob3NlIGFyZSBwcm9iYWJseSBnb2luZyB0byBiZSBtdWNoIGVhc2llciBpZiB3ZeKAmXJl
IGNsb3NlIHRvIAp0aGUgenN0ZCB1cHN0cmVhbSwgYWdhaW4gc28gdGhhdCB3ZSBjYW4gbGV2ZXJh
Z2UgdGVzdGluZyBhbmQgbG9uZyB0ZXJtIApjb2RlIG1haW50ZW5hbmNlIGRvbmUgdGhlcmUuCgot
Y2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==

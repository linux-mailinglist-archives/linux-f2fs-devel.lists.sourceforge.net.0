Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A230626C398
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 16:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=niweBKQSkGUAYumx3ut5f32ThzDmjLwgruIq+MXxjIo=; b=jW+NHdOOzdP8+8sRlM+SOqg3D
	cl4WTuRvDKLguzqoYWbPG0L83rbOu3cyfwavKwoQySL9qCUYjj7f1au9/yGeOK9lwcIVhYmt6C7gq
	Po1w/RTLvaHvMlxL9c4c2BZJhunOkQbfvmIo42iDvKSw/EnyNL6XQbxheo1bi/Uo6U5PM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIYJY-0007dv-5Y; Wed, 16 Sep 2020 14:21:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=6528703ae9=clm@fb.com>)
 id 1kIYJV-0007dR-7z; Wed, 16 Sep 2020 14:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etrroz13TiaCLCbsxTpY39RWGrIeG0ErfV5IujprH5I=; b=XlV/2D5iBvWqpaH8YcJT2YdYpz
 cPzAtWDVErmjH7bhZxoQjN4ouQARES229nhPgRdJlzEC6ZWiI0GUCv9/JTBKaikt3y9OYINFi4Qr9
 ksaFQu4k9fiPmCKldB1ooxeNbT3MY3LGGxoAFUhE/+mEE0lUp+T1GZDWljmYSTcioetM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=etrroz13TiaCLCbsxTpY39RWGrIeG0ErfV5IujprH5I=; b=NvI0mv5RxcP6OqwTn3wgPtyeeA
 bd1RRNSPjgTz5Nn2ixWZvey0hpkKAGQVg4/Y6rtDwUqE7aOqtn1RUyi5Ys2R2Fi0nEYnNyRdLZq3p
 N1nvbhsrw77cJ/0GcT1scZu4o/+mcMfhjjPlPD03x1HLklXbZmCeT5w6obYwaGDZYDLY=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIYJI-00BU1B-IA; Wed, 16 Sep 2020 14:21:37 +0000
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GEK016023430; Wed, 16 Sep 2020 07:21:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=etrroz13TiaCLCbsxTpY39RWGrIeG0ErfV5IujprH5I=;
 b=L4NR1zlywwWuh8wQQNjjRW1fX0iLj3ZpYyE5GUytW7UlHU8UqRHIB4m13ZJHuvZ2R41K
 BpIT89U8kXv7PzyfrcQ451uuoTrzcf+T2H98uycZ3L6CT9uTuI+ZtOT+8FJmkH2chY2m
 ihAYinv7DTm3SK111RCjrn7G7ntN7oI1mOc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33k5nbkucn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Sep 2020 07:21:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Sep 2020 07:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCtTig7gClBSwiAE42XiLqviAxPkMJbI3uCtm4qzv4cMBUYe82xXgnOmlI2kpQaNq2p5b5GkDLpOZc71hKzZ3B23CkqDJzdpWu5DrbGdmkSmdh5DHbu6voOpYAug5n/7zMZS2ZjI20i6/BHQlZDC4R1k5DbW9YHvCHbciH/AEcUW8O5Bh2QSaN13KK2HnDzPGNAOroKQoHl3r5KYPYopeK7sFcA9lxEMAqXVBIp50FYBnvOjdD/lkg90AH1CJWQgg0TqAiWVK4eYAYm3f0qJzkyD4imh8rqKOl/YRRoHzZLBiYIPr9jepaSx487GIdu8a8ZT7HSkYxbnDcKVGIhsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etrroz13TiaCLCbsxTpY39RWGrIeG0ErfV5IujprH5I=;
 b=dUlq1Otm0IMrT8h0EMrPdvpaVtOhxR8QElHZATk5ubvgWxy2YZROfSa+zQYXyOPN/m9FOn0EP0083INFIMKVIfdE8FhSnhbfeCdCBQS6Jpe6zJc6X+g0DhcdH4dsTYuJlGQABftgegMrp19NemHb8cYhTfIEQ1NZCsliXJjxuKTtQiR+jqDIHr3Mnq19zPgOBPFwDyTleACr1yTzqs1FAqSLI2ixXvXeBZOhk46Ddz8KxstPXQFB1qOCAb/AwajWn1qopMtOsqFWKeU+hyyy4/4aA37oAK83vyWe2WlDOkokMNsF++FHoczYWXOeUgGIGaZFp4Is6MJhvWkCbWfNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etrroz13TiaCLCbsxTpY39RWGrIeG0ErfV5IujprH5I=;
 b=PbtVbKx494ZapUNkekJxc6Iy4c9SH2NH7lGOJ+YMPp3O7YahSieXuKcxBGVV98cX5vSUGuF9Yj9CCrrrqUAaoHfmSlXhONrLqUXaNCvlGBhaFWduNYg1JSAf84REKC1sMGEh0VifjEI0UmqUXiBRmDzctpe5QcWAbogfoNunAZw=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=fb.com;
Received: from MN2PR15MB3582.namprd15.prod.outlook.com (2603:10b6:208:1b5::23)
 by MN2PR15MB3728.namprd15.prod.outlook.com (2603:10b6:208:1b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 14:20:56 +0000
Received: from MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6]) by MN2PR15MB3582.namprd15.prod.outlook.com
 ([fe80::bd7a:9d1e:2fd0:34e6%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 14:20:56 +0000
To: Christoph Hellwig <hch@infradead.org>
Date: Wed, 16 Sep 2020 10:20:52 -0400
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
In-Reply-To: <20200916084958.GC31608@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
X-ClientProxiedBy: MN2PR15CA0029.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::42) To MN2PR15MB3582.namprd15.prod.outlook.com
 (2603:10b6:208:1b5::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [100.109.1.1] (2620:10d:c091:480::1:60bc) by
 MN2PR15CA0029.namprd15.prod.outlook.com (2603:10b6:208:1b4::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Wed, 16 Sep 2020 14:20:54 +0000
X-Mailer: MailMate (1.13.2r5673)
X-Originating-IP: [2620:10d:c091:480::1:60bc]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96fcc2d2-e1af-4bf3-22b5-08d85a4bb97a
X-MS-TrafficTypeDiagnostic: MN2PR15MB3728:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR15MB3728DD06D46CCF28FCFECFFFD3210@MN2PR15MB3728.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:234;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sy/NdzNrQQ3GlHtolqw2vPdqIg0tXKt0yh4XLW+qm45TOLSO6TFm0474HrQqo/wi3eqw9vbqscO93CDNIEej4YqkIKbFhyL4IUH8cO3+W+WMdvX8EJFwbAwrKAl9XvTvajhnedIxHK9zFu7J0trerimsq16F+c6u+UrIFV7SDLXuyKIHiH0HiB6Nquy8d4jVumrUctwbvoS7Nxl+8Cqw0cNOBD/RW8va7ZAYFwdnseHdXdRHTSmEw2sHfLUVImrUP/Aq3OigG6LwN+9mz06mxIDb+OJr43Yg0V4x7u6qQ7iqUfaCJt1quOuPOo92wxh5CuqN+gEO0ychvK7tqFoyQP+tttrAtNjlvAal37hl7Z3xM59E/vq5KEeK8t4289GHLQTAKhw+xnvaaDifdUAsJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3582.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(376002)(396003)(366004)(36756003)(478600001)(16526019)(186003)(33656002)(8936002)(86362001)(4326008)(2616005)(8676002)(956004)(53546011)(6486002)(4744005)(316002)(54906003)(5660300002)(6916009)(66476007)(66556008)(52116002)(2906002)(66946007)(556444002)(78286007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gg8rPw6CIqkqO5cHtdfgcbj6Qm6AzI3RA00aJzdvYZ1HDZagpcPM2Dnray9ComqldpXJ6Iq8z99PPCKNOZrBSfPWKJ5ksDIco1WaqYxDcWH9+ibq5HT6zd+zQrMPYehqrsESV6NmUw7E/uv4E0J0AH/fMF/998UDHUDCMxki7kc9YPx5MlnCO0mnRTcMiTc3VhS4DKiQFaXWYur/dWMzXntS2/oTagyc+MyAVQij3iurra+gqmj/ndOsxON3ahLTDWyjH61pOknMCCNweH4DHk6ugyJD/RVKfWD7x7ZOM6VSamm4iK0NGqV1iD5xE+oNn0Nz2J8sp/33A+zDbsMnxtB5LyHbFPDcOx0wczCroALXOSyXyzXmzmOStw1RxIvaL5qmeIZG/4xCXRgLn42LnLuQIBIAgVgjGRpagCJEnUF4ZV0hYijF4hWJLR4dsnFzAm0Z47dr0OMTm8naKmUFyIyCe11Ve0e5yknDXMwRQlOoR+z2KbB579MdKSstDjpWw8pnnxa+kJsQPMMIhzDKetbCO/PHBR8LZYS9MviUD6xTzK1OiasA73lgY0rP80ItL2N+8upLN8ZDVjsY/s2UAxxiJ/zVCdbJk7v7q5ClA3U6eA+Xkvo1C7MD+Byves7jGfTIRcqc0IHCaXqdPODww3oJLiH+Zb/lq8zmSrA9hjdkQCPmmILNeFvIeUPMDON7
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fcc2d2-e1af-4bf3-22b5-08d85a4bb97a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3582.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 14:20:55.8228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSkC3A7D43p5YUjlhtAVCYLGPjh03ZQjWSkMlPf31Y2Z5M7p4neS6Wumx7RABP+P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3728
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_10:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxlogscore=863 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160108
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
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1kIYJI-00BU1B-IA
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

T24gMTYgU2VwIDIwMjAsIGF0IDQ6NDksIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgoKPiBPbiBU
dWUsIFNlcCAxNSwgMjAyMCBhdCAwODo0Mjo1OVBNIC0wNzAwLCBOaWNrIFRlcnJlbGwgd3JvdGU6
Cj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPgo+Pgo+PiBNb3ZlIGF3YXkg
ZnJvbSB0aGUgY29tcGF0aWJpbGl0eSB3cmFwcGVyIHRvIHRoZSB6c3RkLTEuNC42IEFQSS4gVGhp
cwo+PiBjb2RlIGlzIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50Lgo+Cj4gQWdhaW4sIHBsZWFzZSB1
c2Ugc2Vuc2libGUgbmFtZXMgIEFuZCBubyBvbmUgZ2l2ZXMgYSBmdWNrIGlmIHRoaXMgYmFkCj4g
QVBJIGlzICJ6c3RkLTEuNC42IiBhcyB0aGUgTGludXgga2VybmVsIHVzZXMgaXRzIG93biBBUElz
LCBub3Qgc29tZQo+IHJhbmRvbSBtZXNzIGZyb20gYSBiYWRseSB3cml0dGVuIHVzZXJzcGFjZSBw
YWNrYWdlLgoKSGkgQ2hyaXN0b3BoLAoKSXTigJlzIG5vdCBjb21wbGV0ZWx5IGNsZWFyIHdoYXQg
eW914oCZcmUgYXNraW5nIGZvciBoZXJlLiAgSWYgdGhlIEFQSSAKbWF0Y2hlcyB3aGF04oCZcyBp
biB6c3RkLTEuNC42LCB0aGF0IHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIHdheSB0byAKbGFiZWwg
aXQuICBUaGF04oCZcyB3aGF0IHRoZSB1cHN0cmVhbSBpcyBmb3IgdGhpcyBjb2RlLgoKSeKAmW0g
YWxzbyBub3Qgc3VyZSB3aHkgd2XigJlyZSB0YWtpbmcgZXh0cmEgdGltZSB0byBzaGl0IG9uIHRo
ZSB6c3RkIAp1c2Vyc3BhY2UgcGFja2FnZS4gIENhbiB3ZSBwbGVhc2UgYmUgY29uc3RydWN0aXZl
IG9yIGF0IGxlYXN0IAphY3Rpb25hYmxlPwoKLWNocmlzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=

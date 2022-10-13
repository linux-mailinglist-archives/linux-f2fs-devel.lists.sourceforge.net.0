Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F35FD4CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 08:27:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oirgh-0001Rq-8G;
	Thu, 13 Oct 2022 06:27:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lvgaofei@oppo.com>) id 1oirgf-0001Rk-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 06:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jWcVckSpl96miq62husfgjocEE10RFRaoC3fvY2CCS8=; b=NzJuOZ7a1f1Fh9uzRkrGRWiGPv
 mTKHfcgKonbDnF52JanuFUqHxUtn2FaC0F4oNDu/OY8Rqp2ebk5FgPD+35tQ1hvknT7wtnbs1khCo
 U1cbnaBkMw2DsWcBYJaSVQMtMNECj94+QuPLiSVpIpTiXhYl26kjWlsvAiVO0Kjyb2jM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jWcVckSpl96miq62husfgjocEE10RFRaoC3fvY2CCS8=; b=R
 pNJ8gyaKTCAujoZ8bWmhr4yg2M4016ATz5qk6eDbSjMAGTyhLFeD8WswY19A70Rff7qUVrchSq4x1
 Y6xNftm5DzVk1c4duUDIx5P0mo19sWXegVbVgFDbXna8RA/jBZltGjLEu/ZSrX76+BsOO1OxiOyUF
 mQKo+2noQyZ0zv2o=;
Received: from mail-sgaapc01on2046.outbound.protection.outlook.com
 ([40.107.215.46] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oirga-001tjH-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 06:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHPHeXxvN7l6tdTpt5N7uSNwTxcybHM5g5m3NDKduGUh+MAmcs+WO4+QBi78Dpyrw0m6FkQ8GFLaA54W2U/iFwCXe4bykKOAkHIe/C6CdGlBqdqrngCBEpboKFC/Bz8opSFBBYbHjyGkDX7Vsxv8m9IVkt7vp3Vi7XgRd0r1dzyTzlkxqc2aAnCwSIMDvomwEsyFoNl96JFJvXCxOcVZFLnO81fwf+6VnS3md27YFGmP6Rcojf2pyyGSzUzpwfEAUTY3T0HqK3d7eZDaepf2Nh/GPy3RefKqllHb612DKDMiJhSTksLVX+r8PPIJTZrNIMhUNZNS+HFguo18kAw9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWcVckSpl96miq62husfgjocEE10RFRaoC3fvY2CCS8=;
 b=mRJ6CYxH9MsEQg5TBEBd588+3M/wJ5XKmgcMed0IgoJJm1FuzKzrrjGWSa8GyUBB+tmr5oJFSIkIRXHgaUPgprA3vKupLEiI+hVa+Zvj2bGkAf1ORS5jBJOno5QINd1mlZWOgjPdtlKYLCV4kJESFQ3F5Uio+xp+UhlMOGyPLtec7yx0HyY6kiNQaTtezwWt7dxsU0dQgfe58jHc/pzcg6t2D9YtpEOLndgI/qNqVoomQOXNimxK1Y76r03RaAGLUp/LtHCN5QnDXhFFIQJn0q/iuSQr0pzMFvymRYqKp759YKSmEzYetDmCx8OQwAlhIglkct5KBQ1HlPBwyei/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWcVckSpl96miq62husfgjocEE10RFRaoC3fvY2CCS8=;
 b=GGgZKAKcvQ4W1n/9ePGYUvf/z+/79Djl1dQEJs0vK6n+QSIhWG5hH9UL/AQXBNgSfYDjUfG/gKavFsZGICBGqEsDWWWmfW93PtQpTP3ZsEpAR77DIQeX0zzAXSiQzKQXc4p8YWcwSZaaxVZjOkaDuXqkl6FAQJVlyKSe/ROFlZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com (2603:1096:101:7e::10)
 by KL1PR02MB4530.apcprd02.prod.outlook.com (2603:1096:820:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Thu, 13 Oct
 2022 06:27:06 +0000
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741]) by SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 06:27:06 +0000
To: stable@vger.kernel.org
Date: Thu, 13 Oct 2022 14:26:40 +0800
Message-Id: <1665642400-410526-1-git-send-email-lvgaofei@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To SEZPR02MB6007.apcprd02.prod.outlook.com
 (2603:1096:101:7e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB6007:EE_|KL1PR02MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 517053fa-913a-407c-af71-08daace3f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNrEHaARehvkLO3oDEfXR3AltyAu2M93wIyUM/upijW5ljPT38aKZfKkIQkt0xuZAYcismu0z+0nt6TgY/Wae+eA+PJBc1w6XOXKojzsfJ6sj5X800dLhGr3Ppk8EkPtexc5x18ld+ktBi8n+RMEF5ww7YT3MK7WhFAztAwiRyFoHVMONjfKCy+XueKw0P8CB+pxApfOkBG5RhWmVqRlhlgM2MeahzqZ/IyLuo93KMRHQbMAHT4R8hNoBOvCf2lsdj0nNC1U/PQy9RsijCBvJ2UfmE+Dv7koIgC1yEOiC/kuiQXzbcqWAjAs74Lo10LDPiRdFWDIN7T0j2PJGA5sbbTuCgqBl9UtJXRInUgqhGlmMzFZS9H6dIzV6jHlLrXuV+oO03RMfws7FC81RcsSrOhF2DmIYr7vnIV3hXzcq2kPArwLklVajIJGpWdIP3xt1Q2oq4Z/JGDWVqf3MkIEpnaBEcfxlAllGXn+DfnPkVgsxQK5u4lxcvWOYuJjudmOvGv6qHxEXe1mGIOU1Hslez1+jbEWuhCcNdiTP1FQ10PkssnqOK8ayU8vMEUsTfSSvkueyFqHkLh2Py41Zd4UyE2d2B2rcxCMxeWNV+rhc1jxrLuKsaqVaBBVQt3/I1FEnGZu152k9ZfM+FhFVNlTNIaOvSaJgTaLHQtnqRAd3+W0993ZRv/0A6XddAA1fHceBss5u6wwqDGnhyJdvLDNAmi6AiYTTk1H8DUQFzCGIZm3E8RotfSy9LEvu2OttZrQ+BO3KQmJ6NqF+tzewn0MYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB6007.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(86362001)(2906002)(36756003)(6666004)(8936002)(5660300002)(2616005)(83380400001)(186003)(6916009)(54906003)(478600001)(6486002)(6512007)(26005)(66946007)(6506007)(52116002)(4326008)(66476007)(66556008)(8676002)(38100700002)(38350700002)(41300700001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXE0R3FJaWdBblhtV2Myb01xSjMzdVgzdlRON0pZV3NsdTkwTTJ5YjB6U1RK?=
 =?utf-8?B?Z01lRitNbEIzdlQyZ1pWV3BDVnFQYW1MY0Y1dkNTN0U0TnhvMzZWK2lYQXcy?=
 =?utf-8?B?ZG5EZ2poL3dtb0tyMmw4VkJTTHBKaGZsb3lxSzB5c1pwNDM5YTZwbkk2NTY5?=
 =?utf-8?B?a0IwNWdUcklBdThXaDlleDV4Z2U2Tjg5WWNjQ0wza1FKZUZaMUFNZ1F6bzho?=
 =?utf-8?B?MDBZa3ZJUTlWNlBSeFdKaHVaZUcraWxYdEYyRnM2b2NLSUF1NlhyMTJrcjlW?=
 =?utf-8?B?VUFIQ3I1blhKTTVOd1lvWFBNamVJRXVhL0tXQXlrSGlOK0VHY05IakRXN0tn?=
 =?utf-8?B?bU5Fd2lBY25SdElnMkU3MGVTSENmMlZQUmJmQXI4Vkd2VG9lWWRJU215cUFm?=
 =?utf-8?B?YUpnNFFJVWdVUzUxaDl5MER2VmZYRnZLS0lTKzhBTTF2Q2ZWWkVSU2VoamFu?=
 =?utf-8?B?Z3ZPMjFwYjBrTmRnNFZDZjEyT2kyS3FRUitGUnNNd3Jja1dSVHErRGc0ZGxT?=
 =?utf-8?B?dXBDVERoUGthRXhGemZzOExuVVlBQnVoYldodUVaUDdod3FhOS9WSHN5bE5p?=
 =?utf-8?B?cjdnTzhCMW9NZHpENGVpK0l6SVVlcXZacUFUREkzMTlNWmhkZGtHWURnYkdE?=
 =?utf-8?B?bTZnV2FqV3NJLzBqcDBlU3M5MjB3ejUwVlAreEdJZ3VYSXdMYnY2ckdnZ2NW?=
 =?utf-8?B?OWxnSFFlMGYrcStsc0J0NGpHZVBMSFUxeEtNUlZhaU1ydkg1RjNVMmRjUXNI?=
 =?utf-8?B?ZFN1RktmZkExd0hCcytFMFErd3lPZFJHQk1wcnVRd3N1OTBBRURxaUsvdjJP?=
 =?utf-8?B?V1I2V1I5Y2wvK25mSzE1OGFtclRrN0c0anVFWnJPWTBoVGRKRUJ6TW9SVkVk?=
 =?utf-8?B?TWRJc2dPUm5HbGZua29qaC94ekg0RVQ4TGkxaW1YbEduYXJubVJHTHpzSzBo?=
 =?utf-8?B?M0FvWnZxM0R2b0paTEVMQzVjTUJLciszU0taMk1UME9QYkJHTDAwS2dGcldF?=
 =?utf-8?B?ckNKTHpCS3cwWHBTa2EvclJGYnNveUVndkwzSExjTlRXTlNOQ3czcGtxdWRP?=
 =?utf-8?B?ZEhPczNzWjF6cEtoazg0elV3ODljK2cvb3IvaEZHSGpvbG5ZbzFDN0ZXdmQ1?=
 =?utf-8?B?Qkt1VDN3ZFZXeDRyTkFNNGpFYklWc0tlV3g1TnJZZVdYMVFoamc5SzRxL0Jy?=
 =?utf-8?B?OHZ4OTIvc0EwYVNFVDA2NG1wUXZsWXBYakVLYUwxNW9hQyticmVmdXNFNUtn?=
 =?utf-8?B?R0cvRFJvaFowYU9iRG5vcFBxUXR2ejE0VC90ejh4NjZtY2VzeGw4TXpVQVc4?=
 =?utf-8?B?YXVYb1Z0Qk9nZkxXR1NsVUcydmlHVUR5eDNnMDIxQXlnUFhxRlJoOTloaTV0?=
 =?utf-8?B?eVl2a2diOFVUeDdoY081TzdlNVhlS241QndibkpoYVpNOGRxRTBNNk4zWm84?=
 =?utf-8?B?Sm50T2E1MFB4YmNnWlZGWllhSFdBYUxMdGxha3lBeUZScFBBZyt3NkhmTXNk?=
 =?utf-8?B?L1BONVdYRWVXd2l2SXFvQjNteERMNlFzUDRjZEEvWC8vMnRvNXVjRDF1eHE1?=
 =?utf-8?B?QXNNRWxGZWxSNTJPMTlJTnoyZUp2UlAzeDN5YWlEaEc2YUhac3pTTENRS1lZ?=
 =?utf-8?B?ZWUzNVk4azRRUTk4NGluMjN0U2JIY2haWXJKa2R2TkVaLzV1QnJBWDR0Z2Y0?=
 =?utf-8?B?YjhSdXVFRW5LOU4yY0kvbjdlWER0NnhqNm1JY1dIa3lnNHNNQW5qMTZlN2hn?=
 =?utf-8?B?c1VHU3pRUldXZWh0TC9zdU56VXhYbENhUHNiV0wrbmphYkliMVcyQ0Zxb3Iw?=
 =?utf-8?B?L3E2ejdBV3l6NHFicmFpRjhxUXFZN1lWd1pnTllMTlNrMjdYUXYwUVBFL0Fh?=
 =?utf-8?B?eG9qenZKSlN5QlRGanE1Vjh0UittVUJzUTA3ei83VFV1dnRna0RsenFwSlhE?=
 =?utf-8?B?bVoyYlZ6ZEt1Z1RtUEtINUh3SzBDRHg3OHk4aHhHd0doc2xLa2wwdGYvblJX?=
 =?utf-8?B?YkVGaFhadlBsSnR1L05CK0dHN0M1WlBTQU50bGdUVmZZY2ZVeUdkZXNSRGlN?=
 =?utf-8?B?TVdQQ0puOEdnV1p2alFON1dzUXIrbWhCR1NpZjJCUWlIeFVaelVPS2RualJC?=
 =?utf-8?Q?MjJiuMAUejrCqVjYnYBcR2ny0?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517053fa-913a-407c-af71-08daace3f33c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB6007.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 06:27:06.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBiFzmsNvsjgrtuTIwDFzafSQLxRxIl32GIPEcIKhzLD/hdLarhsB6BelHsvQlzeHHtLYq1Wv3QhS6b+lW/JBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4530
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: cherry picked from commit
 e3b49ea36802053f312013fd4ccb6e59920a9f76
 [Please apply to 5.10-stable and 5.15-stable.] BACKPORT: f2fs: invalidate
 META_MAPPING before IPU/DIO write Encrypted pages during GC are read and
 cached in META_MAPPING. However, due to cached pages in META_MAPPING, there
 is an issue where newly written pages are lost by IPU or DIO writes. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oirga-001tjH-Ck
Subject: [f2fs-dev] [PATCH 5.10 5.15]f2fs: invalidate META_MAPPING before
 IPU/DIO write
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
From: lvgaofei via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: lvgaofei <lvgaofei@oppo.com>
Cc: Hyeong-Jun Kim <hj514.kim@samsung.com>, drosen@google.com,
 lvgaofei <lvgaofei@oppo.com>, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, gregkh@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Y2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBlM2I0OWVhMzY4MDIwNTNmMzEyMDEzZmQ0Y2NiNmU1
OTkyMGE5Zjc2CltQbGVhc2UgYXBwbHkgdG8gNS4xMC1zdGFibGUgYW5kIDUuMTUtc3RhYmxlLl0K
CkJBQ0tQT1JUOiBmMmZzOiBpbnZhbGlkYXRlIE1FVEFfTUFQUElORyBiZWZvcmUgSVBVL0RJTyB3
cml0ZQoKRW5jcnlwdGVkIHBhZ2VzIGR1cmluZyBHQyBhcmUgcmVhZCBhbmQgY2FjaGVkIGluIE1F
VEFfTUFQUElORy4KSG93ZXZlciwgZHVlIHRvIGNhY2hlZCBwYWdlcyBpbiBNRVRBX01BUFBJTkcs
IHRoZXJlIGlzIGFuIGlzc3VlIHdoZXJlCm5ld2x5IHdyaXR0ZW4gcGFnZXMgYXJlIGxvc3QgYnkg
SVBVIG9yIERJTyB3cml0ZXMuCgpUaHJlYWQgQSAtIGYyZnNfZ2MoKSAgICAgICAgICAgIFRocmVh
ZCBCCi8qIHBoYXNlIDMgKi8KZG93bl93cml0ZShpX2djX3J3c2VtKQpyYV9kYXRhX2Jsb2NrKCkg
ICAgICAgLS0tLSAoYSkKdXBfd3JpdGUoaV9nY19yd3NlbSkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX2RpcmVjdF9JTygpIDoKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBkb3duX3JlYWQoaV9nY19yd3NlbSkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBfX2Jsb2NrZGV2X2RpcmVjdF9pbygpCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0gZ2V0X2RhdGFfYmxvY2tfZGlvX3dyaXRlKCkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLSBmMmZzX2Rpb19zdWJtaXRfYmlvKCkgIC0tLS0gKGIpCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gdXBfcmVhZChpX2djX3J3c2VtKQovKiBwaGFzZSA0ICov
CmRvd25fd3JpdGUoaV9nY19yd3NlbSkKbW92ZV9kYXRhX2Jsb2NrKCkgICAgIC0tLS0gKGMpCnVw
X3dyaXRlKGlfZ2NfcndzZW0pCgooYSkgSW4gcGhhc2UgMyBvZiBmMmZzX2djKCksIHVwLXRvLWRh
dGUgcGFnZSBpcyByZWFkIGZyb20gc3RvcmFnZSBhbmQKICAgIGNhY2hlZCBpbiBNRVRBX01BUFBJ
TkcuCihiKSBJbiB0aHJlYWQgQiwgd3JpdGluZyBuZXcgZGF0YSBieSBJUFUgb3IgRElPIHdyaXRl
IG9uIHNhbWUgYmxrYWRkciBhcwogICAgcmVhZCBpbiAoYSkuIGNhY2hlZCBwYWdlIGluIE1FVEFf
TUFQUElORyBiZWNvbWUgb3V0LWRhdGVkLgooYykgSW4gcGhhc2UgNCBvZiBmMmZzX2djKCksIG91
dC1kYXRlZCBwYWdlIGluIE1FVEFfTUFQUElORyBpcyBjb3BpZWQgdG8KICAgIG5ldyBibGthZGRy
LiBJbiBjb25jbHVzaW9uLCB0aGUgbmV3bHkgd3JpdHRlbiBkYXRhIGluIChiKSBpcyBsb3N0LgoK
VG8gYWRkcmVzcyB0aGlzIGlzc3VlLCBpbnZhbGlkYXRpbmcgcGFnZXMgaW4gTUVUQV9NQVBQSU5H
IGJlZm9yZSBJUFUgb3IKRElPIHdyaXRlLgoKRml4ZXM6IDZhYTU4ZDhhZDIwYSAoImYyZnM6IHJl
YWRhaGVhZCBlbmNyeXB0ZWQgYmxvY2sgZHVyaW5nIEdDIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKU2lnbmVkLW9mZi1ieTogSHllb25nLUp1biBLaW0gPGhqNTE0LmtpbUBzYW1zdW5nLmNv
bT4KUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
SmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBlM2I0OWVhMzY4MDIw
NTNmMzEyMDEzZmQ0Y2NiNmU1OTkyMGE5Zjc2KQoKU2lnbmVkLW9mZi1ieTogbHZnYW9mZWkgPGx2
Z2FvZmVpQG9wcG8uY29tPgotLS0KIGZzL2YyZnMvZGF0YS5jICAgIHwgNSArKysrLQogZnMvZjJm
cy9zZWdtZW50LmMgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5j
CmluZGV4IGIyMDE2ZmQuLjk5NGEwOWUgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZGF0YS5jCisrKyBi
L2ZzL2YyZnMvZGF0YS5jCkBAIC0xNzEzLDkgKzE3MTMsMTIgQEAgaW50IGYyZnNfbWFwX2Jsb2Nr
cyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsCiBzeW5j
X291dDoKCiAgICAgICAgLyogZm9yIGhhcmR3YXJlIGVuY3J5cHRpb24sIGJ1dCB0byBhdm9pZCBw
b3RlbnRpYWwgaXNzdWUgaW4gZnV0dXJlICovCi0gICAgICAgaWYgKGZsYWcgPT0gRjJGU19HRVRf
QkxPQ0tfRElPICYmIG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkKKyAgICAgICBpZiAo
ZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYgbWFwLT5tX2ZsYWdzICYgRjJGU19NQVBfTUFQ
UEVEKSB7CiAgICAgICAgICAgICAgICBmMmZzX3dhaXRfb25fYmxvY2tfd3JpdGViYWNrX3Jhbmdl
KGlub2RlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
YXAtPm1fcGJsaywgbWFwLT5tX2xlbik7CisgICAgICAgICAgICAgICBpbnZhbGlkYXRlX21hcHBp
bmdfcGFnZXMoTUVUQV9NQVBQSU5HKHNiaSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1hcC0+bV9wYmxrLCBtYXAtPm1fcGJsayk7CisgICAgICAgfQoK
ICAgICAgICBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSkgewogICAgICAgICAg
ICAgICAgaWYgKG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkgewpkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwppbmRleCAxOTIyNGU3Li44NTQ5
MzMyIDEwMDY0NAotLS0gYS9mcy9mMmZzL3NlZ21lbnQuYworKysgYi9mcy9mMmZzL3NlZ21lbnQu
YwpAQCAtMzU0Nyw2ICszNTQ3LDkgQEAgaW50IGYyZnNfaW5wbGFjZV93cml0ZV9kYXRhKHN0cnVj
dCBmMmZzX2lvX2luZm8gKmZpbykKICAgICAgICAgICAgICAgIHJldHVybiAtRUZTQ09SUlVQVEVE
OwogICAgICAgIH0KCisgICAgICAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKE1FVEFfTUFQUElO
RyhzYmkpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpby0+bmV3X2Jsa2FkZHIs
IGZpby0+bmV3X2Jsa2FkZHIpOworCiAgICAgICAgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3MoZmlv
LT5zYmkpOwoKICAgICAgICBpZiAoZmlvLT5iaW8gJiYgIShTTV9JKHNiaSktPmlwdV9wb2xpY3kg
JiAoMSA8PCBGMkZTX0lQVV9OT0NBQ0hFKSkpCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPUFBPCgrmnKznlLXlrZDpgq7ku7blj4rlhbbpmYTku7blkKvmnIlPUFBP
5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO6YKu5Lu25oyH5piO55qE5pS25Lu25Lq6
5L2/55So77yI5YyF5ZCr5Liq5Lq65Y+K576k57uE77yJ44CC56aB5q2i5Lu75L2V5Lq65Zyo5pyq
57uP5o6I5p2D55qE5oOF5Ya15LiL5Lul5Lu75L2V5b2i5byP5L2/55So44CC5aaC5p6c5oKo6ZSZ
5pS25LqG5pys6YKu5Lu277yM6K+356uL5Y2z5Lul55S15a2Q6YKu5Lu26YCa55+l5Y+R5Lu25Lq6
5bm25Yig6Zmk5pys6YKu5Lu25Y+K5YW26ZmE5Lu244CCCgpUaGlzIGUtbWFpbCBhbmQgaXRzIGF0
dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gT1BQTywgd2hp
Y2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRkcmVz
cyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBo
ZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9y
IHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBieSBw
ZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJpdGVk
LiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
